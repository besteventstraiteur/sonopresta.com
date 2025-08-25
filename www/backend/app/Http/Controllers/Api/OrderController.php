<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Api\BaseController;
use Laravel\Sanctum\PersonalAccessToken;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Validator;
use Hash;
use Carbon\Carbon;
use App\Models\User;
use App\Models\Order;
use App\Models\OrderItem;
use App\Models\OrderDetail;
use App\Models\Coupon;
use App\Http\Traits\ImageTrait;
use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Facades\Queue;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Mail;
use App\Mail\Orders\OrderSummary;
use App\Mail\Orders\OrderAlert;
use Stripe\Stripe;
use Stripe\Checkout\Session;
use PDF;
use Illuminate\Support\Facades\Storage;

class OrderController extends BaseController
{
    use ImageTrait;
    
    public function __construct(Request $request) {
        $this->token = PersonalAccessToken::findToken($request->bearerToken());
        try{
            $this->user =  $this->token->tokenable;
            $this->user_id = $this->user->id;
        }
        catch(\Exception $e){ }
    }

    // save order
    public function saveOrder(Request $request)
    {
        // save order
        $arr = [
            'customer_id' => $request->customer_id,
            'order_number' => 'ORD-' . $request->customer_id . '-' . rand(10000, 99999),
            'payment_status' => 'unpaid',
            'status' => 'pending',
            'total_amount' => $request->total,
            'type' => request('rental_start_date')? 'location': 'purchase',
            'rental_start_date' => request('rental_start_date')? $request->rental_start_date: null,
            'rental_end_date' => request('rental_end_date')? $request->rental_end_date: null,
            'coupon' => request('coupon')? $request->coupon: null,
            'discount' => request('discount')? $request->discount: null,
        ];

        $order = Order::create($arr);
        if($order){
            $coupon_product_id = 0;
            if(request('coupon')){
                $coupon_product_id = Coupon::where('code', $request->coupon)->pluck('product_id')->first();
            }
            // save items
            if(isset($request->items)){
                foreach($request->items as $k => $i){
                    $discount = ($coupon_product_id == $i['id'])? $order->discount: null;
                    $arr = [
                        'order_id' => $order->id,
                        'product_id' => $i['id'],
                        'quantity' => $i['quantity'],
                        'unit_price' => $i['price'],
                        'subtotal' => $i['quantity'] * $i['price'],
                        'discount' => $discount
                    ];

                    OrderItem::create($arr);
                }
            }

            // save further details
            $arr = [
                'delivery_charges' => $request->delivery_charges,
                'subtotal' => $request->sub_total,
                'delivery_charges_details' => json_encode($request->delivery_details),
                'coupon_details' => json_encode($request->coupon_details)
            ];
            foreach($arr as $k => $v){
                OrderDetail::create(array('order_id' => $order->id, 'meta_key' => $k, 'meta_value' => $v));
            }

            // create stripe session
            $success['url'] = $this->stripeUrl($request->customer_id, $order->id);
            return $this->sendResponse('Commande enregistrée et redirection vers le paiement', $success);
        }else{
            return $this->sendError('Réessayez plus tard', []);
        }
    }

    // order status
    public function updateStatus(Request $request, $number)
    {
        if(request('status')){
            $status = Order::where('order_number', $number)->update(array('status' => $request->status));
            if($status){
                return $this->sendResponse('Status updated', []);
            }else{
                return $this->sendError('Try again later', []);
            }
        }
    }

    // order recovery
    public function updateRecovery(Request $request, $number)
    {
        if(request('status')){
            $status = Order::where('order_number', $number)->update(array('rental_recovery' => $request->status));
            if($status){
                return $this->sendResponse('Recovery updated', []);
            }else{
                return $this->sendError('Try again later', []);
            }
        }
    }

    // orders
    public function orders(Request $request)
    {
        if(!request('all')){
            $orders = Order::where('customer_id', $this->user_id)->orderBy('id', 'desc');
        }else{
            $orders = Order::orderBy('id', 'desc');
        }
        if(request('type')){
            $orders = $orders->where('type', $request->type);
        }
        if(request('payment_status')){
            $orders = $orders->where('payment_status', $request->payment_status);
        }
        if(request('limit')){
            $orders = $orders->take($request->limit);
        }
        $orders = $orders->get();
        if($orders){
            return $this->sendResponse('Orders', $orders);
        }else{
            return $this->sendError('Orders not found', []);
        }
    }

    // order details
    public function details(Request $request, $number)
    {
        $order = Order::where([['customer_id', $this->user_id], ['order_number', $number]])->first();
        if($order){
            return $this->sendResponse('Order Details', $order);
        }else{
            return $this->sendError('Order not found', []);
        }
    }

    // create payment url
    public function paymentUrl(Request $request, $order_number)
    {
        $order = Order::where('order_number', $order_number)->first();
        if($order){
            return $this->sendResponse('Stripe Url', ['url' => $this->stripeUrl($order->customer_id, $order->id)]);
        }
        return false;
    }

    public function stripeUrl($customer_id, $order_id)
    {
        $order = Order::find($order_id);
        Stripe::setApiKey(env('STRIPE_SECRET'));
        $lineItems = [];
        $item_discount = true;
        if(isset($order->order_details['coupon_details'])){
            $coupon_details = json_decode($order->order_details['coupon_details'], true);
            if(isset($coupon_details['type']) and $coupon_details['type'] == 'full_cart'){
                $item_discount = false;
            }
        }
        foreach ($order->order_items as $item) {
            if($item_discount){
                $discount = is_numeric($item->discount) ? $item->discount/$item->quantity : 0;
            }else{
                $discount = ($order->discount/$order->order_items->count())/$item->quantity;
            }
            $price = $item->unit_price - $discount;

            $lineItems[] = [
                'price_data' => [
                    'currency' => 'eur',
                    'product_data' => ['name' => $item->product_details->name ?? $item->name],
                    'unit_amount' => (float)$price * 100,
                ],
                'quantity' => $item->quantity,
            ];
        }

        $session = Session::create([
            'payment_method_types' => ['card'],
            'line_items' => $lineItems,
            'mode' => 'payment',
            'customer_email' => User::where('id', $customer_id)->pluck('email')->first(),
            'success_url' => env('STRIPE_SUCCESS_URL') . '?session_id={CHECKOUT_SESSION_ID}',
            'cancel_url' => env('STRIPE_CANCEL_URL'),
            'shipping_address_collection' => [
                'allowed_countries' => ['FR'],
            ],
            'phone_number_collection' => [
                'enabled' => true,
            ],
            'client_reference_id' => $order_id,
        ]);

        return $session->url;
    }

    public function stripeSuccess(Request $request)
    {
        Stripe::setApiKey(env('STRIPE_SECRET'));

        $session = Session::retrieve([
            'id' => $request->query('session_id'),
            'expand' => ['customer_details', 'shipping'],
        ]);

        if($session){
            $shipping = $session->collected_information->shipping_details;
            $address = $shipping->address;
            $arr = [
                'payment_status' => $session->payment_status,
                'delivery_address' => $shipping->name.' - '.$address->line1.' '.$address->line2.', '.$address->postal_code.', '.$address->city.', '.$address->country,
                'phone_number' => $session->customer_details->phone ?? null,
                'status' => 'processing'
            ];
            Order::where('id', $session->client_reference_id)->update($arr);

            $customer_id = Order::where('id', $session->client_reference_id)->pluck('customer_id')->first();
            $customer_email = User::where('id', $customer_id)->pluck('email')->first();
            $customer_phone = $session->customer_details->phone;
            $arr = [
                'shipping_details' => json_encode($session->collected_information->shipping_details),
                'billing_details' => json_encode($session->customer_details),
                'customer_name' => $shipping->name,
                'customer_email' => $customer_email,
                'customer_phone' => $customer_phone
            ];
            foreach($arr as $k => $v){
                OrderDetail::create(array('order_id' => $session->client_reference_id, 'meta_key' => $k, 'meta_value' => $v));
            }

            $order_number = Order::where('id', $session->client_reference_id)->pluck('order_number')->first();

            // send mail
            $order = Order::where('id', $session->client_reference_id)->first();
            if($address->line2){
                $sa = $address->line1.' '.$address->line2.', '.$address->postal_code.', '.$address->city.', '.$address->country;
            }else{
                $sa = $address->line1.', '.$address->postal_code.', '.$address->city.', '.$address->country;
            }
            $data = [
                'order_id' => $order_number,
                'customer_name' => $shipping->name,
                'email' => $customer_email,
                'phone' => $customer_phone,
                'shipping_address' => $sa,
                'subtotal' => $order->order_details['subtotal'],
                'shipping' => $order->shipping_charges,
                'discount' => $order->discount,
                'total' => $order->total_amount,
                'rental_start_date' => $order->rental_start_date,
                'rental_end_date' => $order->rental_end_date,
                'date' => date('Y-m-d', strtotime($order->created_at)),
                'status' => ucfirst($order->status),
                'payment_status' => ucfirst($order->payment_status),
                'type' => ucfirst($order->type)
            ];
            foreach($order->order_items as $i){
                $data['items'][] = [
                    'name' => $i->product_details->name,
                    'image' => $i->product_details->image_url,
                    'qty' => $i->quantity,
                    'price' => $i->unit_price,
                    'discount' => $i->discount
                ];
            }
            // create the pdf attachment
            $pdf = PDF::loadView('emails.orders.invoice', $data);
            $invoicePath = storage_path('app/public/invoices');
            if (!file_exists($invoicePath)) {
                mkdir($invoicePath, 0755, true);
            }
            $pdfPath = storage_path('app/public/invoices/invoice-'.$order_number.'.pdf');
            $pdf->save($pdfPath);

            // send mails
            Mail::to($customer_email)->send(new OrderSummary($data));
            Mail::to(env('ADMIN_EMAIL'))->send(new OrderAlert($data));

            return redirect(env('STRIPE_SUMMARY_URL').'/'.$order_number);
        }
    }

    public function stripeCancel(Request $request)
    {
        return redirect(env('STRIPE_ORDERS_URL'));
    }

    // list of clients
    public function clients(Request $request)
    {
        $saleCustomers = array();
        $saleOrderCustomers = Order::select(
                'customer_id',
                DB::raw('COUNT(DISTINCT id) as total_orders'),
                DB::raw('MAX(id) as latest_order_id'),
                DB::raw('MAX(delivery_address) as delivery_address') // latest delivery address used
            )
            ->where('type', 'purchase')
            ->whereNotNull('delivery_address')
            ->groupBy('customer_id')
            ->orderByDesc('latest_order_id')
            ->get();

        if(!$saleOrderCustomers->isEmpty()){
            foreach($saleOrderCustomers as $c){
                $user = User::find($c->customer_id);
                if($user){
                    $saleCustomers[] = [
                        'id' => $c->customer_id,
                        'total_orders' => $c->total_orders,
                        'type' => 'purchase',
                        'address' => $c->delivery_address,
                        'name' => $user->name,
                        'phone' => $user->phone,
                        'email' => $user->email,
                        'created' => $user->created_at
                    ];
                }
            }
        }

        $rentCustomers = array();
        $rentOrderCustomers = Order::select(
                'customer_id',
                DB::raw('COUNT(DISTINCT id) as total_orders'),
                DB::raw('MAX(id) as latest_order_id'),
                DB::raw('MAX(delivery_address) as delivery_address') // latest delivery address used
            )
            ->where('type', 'location')
            ->whereNotNull('delivery_address')
            ->groupBy('customer_id')
            ->orderByDesc('latest_order_id')
            ->get();

        if(!$rentOrderCustomers->isEmpty()){
            foreach($rentOrderCustomers as $c){
                $user = User::find($c->customer_id);
                if($user){
                    $rentCustomers[] = [
                        'id' => (int)$c->customer_id,
                        'total_orders' => $c->total_orders,
                        'type' => 'location',
                        'address' => $c->delivery_address,
                        'name' => $user->name,
                        'phone' => $user->phone,
                        'email' => $user->email,
                        'created' => $user->created_at
                    ];
                }
            }
        }

        return ['sale' => $saleCustomers, 'rental' => $rentCustomers];
    }
}
