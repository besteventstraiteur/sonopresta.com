<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Api\BaseController;
use Laravel\Sanctum\PersonalAccessToken;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Validator;
use Hash;
use Carbon\Carbon;
use App\Models\Order;
use App\Models\OrderItem;
use App\Mail\Orders\TodayRecovery;
use App\Mail\Orders\RemainingRecoveries;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Mail;

class AdditionalController extends BaseController
{
    public function generalCron()
    {
        $data = array();
        $today = Carbon::now()->format('Y-m-d');
        
        // get today recoveries
        $orders = Order::where('type', 'location')
            ->where('payment_status', 'paid')
            ->where('rental_recovery', 0)
            ->whereRaw("DATE(STR_TO_DATE(SUBSTRING_INDEX(rental_end_date, '+', 1), '%d %b %Y %H:%i')) = ?", [$today])
            ->get();

        if (!$orders->isEmpty()) {
            $data = array();
            foreach($orders as $order){
                $arr = [
                    'order_number' => $order->order_number,
                    'customer_name' => $order->order_details['customer_name'],
                    'phone' => $order->order_details['customer_phone'],
                    'address' => $order->address,
                    'time' => date('Y-m-d H:i', strtotime($order->rental_end_date))
                ];
                foreach($order->order_items as $i){
                    $arr['items'][] = [
                        'name' => $i->product_details->name,
                        'qty' => $i->quantity,
                    ];
                }
                $data[] = $arr;
            }
        }
        Mail::to(env('ADMIN_EMAIL'))->send(new TodayRecovery($data));

        // get remaining recoveries
        $orders = Order::where('type', 'location')
            ->where('payment_status', 'paid')
            ->where('rental_recovery', 0)
            ->whereRaw("DATE(STR_TO_DATE(SUBSTRING_INDEX(rental_end_date, '+', 1), '%d %b %Y %H:%i')) < ?", [$today])
            ->get();

        if (!$orders->isEmpty()) {
            $data = array();
            foreach($orders as $order){
                $arr = [
                    'order_number' => $order->order_number,
                    'customer_name' => $order->order_details['customer_name'],
                    'phone' => $order->order_details['customer_phone'],
                    'address' => $order->address,
                    'time' => date('Y-m-d H:i', strtotime($order->rental_end_date))
                ];
                foreach($order->order_items as $i){
                    $arr['items'][] = [
                        'name' => $i->product_details->name,
                        'qty' => $i->quantity,
                    ];
                }
                $data[] = $arr;
            }
        }
        Mail::to(env('ADMIN_EMAIL'))->send(new RemainingRecoveries($data));

        return true;
    }
}
