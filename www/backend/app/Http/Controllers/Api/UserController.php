<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Api\BaseController;
use Laravel\Sanctum\PersonalAccessToken;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Validator;
use Hash;
use Carbon\Carbon;
use Carbon\CarbonPeriod;
use App\Models\User;
use App\Models\UserMeta;
use App\Models\DevisRequest;
use App\Models\Order;
use App\Models\SavTicket;
use App\Http\Traits\ImageTrait;
use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Facades\Queue;
use Illuminate\Support\Facades\DB;
use App\Mail\ForgetPassword;
use App\Mail\RequestAQuote;
use App\Mail\ContactUs;
use Illuminate\Support\Facades\Mail;
use Twilio\Rest\Client as TwilioClient;

class UserController extends BaseController
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

    /**
     * Control the user registration
     */
    public function register(Request $request)
    {
        $messages = [
            'phone.required' => 'Le téléphone est requis.',
            'name.required' => 'Le nom est obligatoire.',
            'email.required' => 'L’adresse e-mail est obligatoire.',
            'email.email' => 'L’adresse e-mail doit être valide.',
            'email.unique' => 'Cette adresse e-mail est déjà utilisée.',
            'password.required' => 'Le mot de passe est obligatoire.',
        ];
        $validator = Validator::make($request->all(), [
            'name' => 'required',
            'phone' => 'required',
            'email' => 'required|email|unique:users,email',
            'password' => 'required',
        ], $messages);

        if($validator->fails()){
            return $this->sendError($validator->errors()->first());
        }

        if(User::where('email', $request->email)->exists()){
            return $this->sendError("L'email a déjà été pris", []);
        }

        $input = $request->all();
        $input['password'] = Hash::make($input['password']);
        $user = User::create($input);

        if($user){
            $user = User::find($user->id);

            $auth = Auth::loginUsingId($user->id);
            if($auth){
                $fcm_token = $request->fcm_token ?? "";
                $user->update([ 'fcm_token' => $fcm_token ]);
                $user['token'] =  $user->createToken('MyAppToken')->plainTextToken;
            }
            $success['user'] =  $user;            
            return $this->sendResponse('Inscription réussie', $success);
        }else{
            return $this->sendError('Réessayez plus tard', array('error ' => [$user]));
        }
    }

    /**
     * Control the user login
     */
    public function login(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'email' => 'required',
            'password' => 'required'
        ]);

        if($validator->fails()){
            return $this->sendError('Identifiants invalides', $validator->errors());
        }

        $arr = array(
            'email' => $request->email,
            'password' => $request->password
        );

        if(!request('code')){
            if(!Auth::validate($arr)){
                return $this->sendError('Identifiants invalides', ['error' => 'Unauthorised', 'email' => $request->email, 'response_type' => 2]);
            }else{
                $user = User::where('email', $request->email)->first();
                $check = $this->sendSMSCode($user);
                if($check != '1'){
                    UserMeta::where('user_id', $user->id)->where('meta_key', 'login_otp')->delete();
                    return $this->sendError('Réessayez plus tard', array());
                }else{
                    $success['requires_verification'] = true;
                    return $this->sendResponse("Veuillez vérifier votre numéro de téléphone enregistré pour l'OTP.", $success);
                }
            }
        }else{

            $user = User::where('email', $request->email)->first();
            if(!UserMeta::where([['user_id', $user->id], ['meta_key', 'login_otp'], ['meta_value', $request->code]])->exists()){
                return $this->sendError('Code invalide. Veuillez vérifier et réessayer de vous connecter.', array());
            }else{
                $auth = Auth::attempt($arr);
                if($auth){
                    $user = Auth::user();
                    $fcm_token = $request->fcm_token ?? $user->fcm_token;

                    $user->update([ 'fcm_token' => $fcm_token ]);
                    $token = $user->createToken('MyAppToken');
                    $user['token'] =  $token->plainTextToken;
                    $success['user'] =  $user;

                    return $this->sendResponse('Connexion réussie', $success);
                }else{
                    return $this->sendError('Identifiants invalides', ['error' => 'Unauthorised', 'email' => $request->email, 'response_type' => 2]);
                }
            }
        }
    }

    /**
     * Send SMS for verification
     */
    public function sendSMSCode($user='', $phone='', $code = '', $additional = '')
    {
        if(!$code){
            $code = rand(1000, 9999);
        }

        if($user){
            UserMeta::updateOrCreate(
                ['user_id' => $user->id, 'meta_key' => 'login_otp'],
                ['meta_value' => $code],
            );

            $receiverNumber = $user->phone;
        }else{
            $receiverNumber = $phone;
        }
        $message = $code. " est votre code de vérification de Sonopresta";

        if($additional){
            $message .= ' '.$additional;
        }

        return $this->sendSMS($receiverNumber, $message);
    }

    public function sendSMS($number, $message)
    {
        try {
            $account_sid = env('TWILIO_SID');
            $auth_token = env('TWILIO_TOKEN');
            $twilio_number = env('TWILIO_FROM');

            $client = new TwilioClient($account_sid, $auth_token);
            $client->messages->create($number, [
                'from' => $twilio_number,
                'body' => $message]);

            return 1;

        }
        catch (RestException $e) {
            return $e->getMessage();
        }
        catch (Exception $e) {
            return $e->getMessage();
        }
    }

    /**
     * verify email
     */
    public function verifyEmail(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'email' => 'required',
            'code' => 'required'
        ]);

        if($validator->fails()){
            return $this->sendError('Try again later!', $validator->errors());
        }

        $user = User::where('email', $request->email)->first();
        if($user){
            $code = UserMeta::where([['user_id', $user->id], ['meta_key', 'email_verification_code'], ['meta_value', $request->code]])->first();
            if($code){

                User::where('id', $user->id)->update(array('verified' => 1));

                $success = array();
                $auth = Auth::loginUsingId($user->id);
                if($auth){
                    $user = Auth::user();
                    $fcm_token = $request->fcm_token ?? $user->fcm_token;
        
                    $user->update([ 'fcm_token' => $fcm_token ]);
                    $token = $user->createToken('MyAppToken');
                    $success['token'] =  $token->plainTextToken;
                    $success['user'] =  $user;
                    $success['response_type'] = 1;

                    UserMeta::where([['user_id', $user->id], ['meta_key', 'email_verification_code']])->delete();
                }

                return $this->sendResponse('Email verified', $success);
            }else{
                return $this->sendError('Code does not match', ['response_type' => 2]);
            }
        }else{
            return $this->sendError('Try again later!', []);
        }
    }

    /**
     * User logout
     */
    public function logout(Request $request)
    {
        $request->user()->tokens()->delete();
        return $this->sendResponse('Logout successful', []);
    }

    /**
     * forget password request
     */
    public function forgetPasswordRequest(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'email' => 'required',
        ]);

        if($validator->fails()){
            return $this->sendError("L'e-mail est requis", $validator->errors());
        }

        $user = User::where('email', $request->email)->first();
        if($user){
            $check = $this->sendForgetPasswordEmail($user);
            if($check != '1'){
                return $this->sendError('Réessayez plus tard', array('error ' => [$check]));
            }else{
                return $this->sendResponse('Un OTP de réinitialisation de mot de passe a été envoyé à votre adresse e-mail.', ['email' => $request->email]);
            }

        }else{
            return $this->sendError("L'e-mail n'existe pas", array());
        }
    }


    /**
     * forget password
     */
    public function forgetPassword(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'email' => 'required',
            'password' => 'required|min:8',
            'confirm_password' => 'required|same:password',
            'otp' => 'required'
        ]);

        if($validator->fails()){
            return $this->sendError('Veuillez vérifier les détails', $validator->errors());
        }

        $user = User::where('email', $request->email)->first();
        if($user){
            if(UserMeta::where([['user_id', $user->id], ['meta_key', 'forget_password_otp'], ['meta_value', $request->otp]])->exists()){
                $check = User::where('email', $request->email)->update(['password' => Hash::make($request->password)]);
                if($check){
                    UserMeta::where([['user_id', $user->id], ['meta_key', 'forget_password_otp']])->delete();
                    return $this->sendResponse('Changement de mot de passe réussi', array('email' => $request->email));
                }else{
                    return $this->sendError('Réessayez plus tard', array());
                }
            }else{
                return $this->sendError('Le code ne correspond pas', array());
            }
        }else{
            return $this->sendError('Réessayez plus tard', array());
        }
    }

    /**
     * Reset password
     * 
     * @param password
     */
    public function resetPassword(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'phone' => 'required',
            'password' => 'required|min:8',
        ]);

        if($validator->fails()){
            return $this->sendError('Validation error', $validator->errors());
        }

        $input = $request->all();
        $input = $request->except(['phone']);
        $input['password'] = Hash::make($request->password);
        if(strpos($request->phone, '+') == ''){
            $request->phone = '+'.$request->phone;
        }
        $check = User::where('phone', $request->phone)->update($input);
        if($check){
            return $this->sendResponse('Password reset successfully', ['phone' => $request->phone]);
        }else{
            return $this->sendError('Phone not found', ['phone' => $request->phone]);
        }
    }

    /**
     * forget password mail
     */
    public function sendForgetPasswordEmail($user)
    {
        if($user){
            $code = rand(1000000, 9999999);

            UserMeta::updateOrCreate(
                ['user_id' => $user->id,
                'meta_key' => 'forget_password_otp'],
                ['meta_value' => $code],
            );

            $data = array('email' => $user->email, 'code' => $code, 'name' => $user->first_name.' '.$user->last_name);
            Mail::to($user->email)->send(new ForgetPassword($data));

            return true;
        }

        return false;
    }


    /**
     * Send otp for email verification
     */
    public function sendVerificationEmail($user)
    {
        if($user){
            $code = rand(1000000, 9999999);

            UserMeta::updateOrCreate(
                ['user_id' => $user->id,
                'meta_key' => 'email_verification_code'],
                ['meta_value' => $code],
            );

            $data = array('email' => $user->email, 'code' => $code);
            Mail::to($user->email)->send(new EmailVerification($data));
        }

        return false;
    }

    /**
     * resend email verification mail
     */
    public function resendEmailVerificationRequest(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'email' => 'required',
        ]);

        if($validator->fails()){
            return $this->sendError('Validation error', $validator->errors());
        }

        $user = User::where('email', $request->email)->first();
        if($user){
            $this->sendVerificationEmail($user);
            return $this->sendResponse('Verification mail sended', ['email' => $request->email]);
        }else{
            return $this->sendError('Email not found', ['email' => $request->email]);
        }
    }

    
    // update user
    public function updateUser(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'user_id' => 'required',
        ]);

        if($validator->fails()){
            return $this->sendError('Validation error', $validator->errors());
        }

        $input = $request->all();
        $input = $request->except(['user_id']);
        if ($request->hasFile('profile_image')) {
            $imgPath = $this->verifyAndUpload($request, 'profile_image', 'uploads/profile_images');
            $fullimgPath = url('/') . '/api' . $imgPath;
        
            $input['profile_image'] = $fullimgPath;
        
        } 
        $check = User::where('id', $request->user_id)->update($input);
        if($check){
            return $this->sendResponse('User updated', User::find($request->user_id));
        }else{
            return $this->sendError('Try again later!', []);
        }
    }

    /**
     * change password
     */
    public function changePassword(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'user_id' => 'required',
            'password' => 'required|min:8',
            'confirm_password' => 'required|same:password',
        ]);

        if($validator->fails()){
            return $this->sendError($validator->errors()->first());
        }

        $user = User::where('id', $request->user_id)->first();
        if($user){
            $check = User::where('id', $request->user_id)->update(['password' => Hash::make($request->password)]);
            if($check){
                return $this->sendResponse('Password change successfully', array());
            }else{
                return $this->sendError('Try again later', array());
            }
        }else{
            return $this->sendError('Try again later', array());
        }
    }

    // get a quote
    public function getAQuote(Request $request)
    {
        // store the data in database
        $quote = DevisRequest::create($request->all());

        try {
            // send the mail
            Mail::to(env('QUOTE_EMAIL'))->send(new RequestAQuote($request->all()));

            return $this->sendResponse(
                'Demande de devis envoyée ! Vous recevrez une confirmation par email dans quelques instants.',
                []
            );
        } catch (\Exception $e) {
            return $this->sendError('Réessayez plus tard', ['error' => $e->getMessage()]);
        }
    }

    // send contact us mail
    public function contactMail(Request $request)
    {
        try {
            // send the mail
            Mail::to(env('QUOTE_EMAIL'))->send(new ContactUs($request->all()));

            return $this->sendResponse(
                'Message envoyé ! Nous vous répondrons dans les plus brefs délais.',
                []
            );
        } catch (\Exception $e) {
            return $this->sendError('Réessayez plus tard', ['error' => $e->getMessage()]);
        }
    }

    public function customerStats(Request $request)
    {
        $total_orders = Order::where('customer_id', $this->user_id)->count();
        $total_processing = Order::where('customer_id', $this->user_id)
                                ->where('status', 'processing')->count();
        $next_rental = Order::where('customer_id', $this->user_id)
                        ->whereNotNull('rental_end_date')
                        ->where('rental_end_date', '>=', Carbon::now())
                        ->orderBy('rental_end_date', 'asc')
                        ->pluck('rental_end_date')->first();
        $total_tickets = SavTicket::where('customer_id', $this->user_id)->count();

        $return = [
            'total_orders' => $total_orders,
            'total_processing' => $total_processing,
            'next_rental' => $next_rental,
            'total_tickets' => $total_tickets
        ];
        return $this->sendResponse('Customer stats', $return);
    }

    public function adminStats(Request $request)
    {
        $now = Carbon::now();

        $currentMonthStart = $now->copy()->startOfMonth();
        $currentMonthEnd = $now->copy()->endOfMonth();
        
        $lastMonthStart = $now->copy()->subMonth()->startOfMonth();
        $lastMonthEnd = $now->copy()->subMonth()->endOfMonth();
    

        // orders
        $total_orders = Order::where('payment_status', 'paid')->count();
        $currentOrders = Order::whereBetween('created_at', [$currentMonthStart, $currentMonthEnd])
            ->where('payment_status', 'paid')->count();
        $lastOrders = Order::whereBetween('created_at', [$lastMonthStart, $lastMonthEnd])
            ->where('payment_status', 'paid')->count();

        $diff = $currentOrders - $lastOrders;
        $trend = $diff >= 0 ? 'up' : 'down';
        $percentage = $lastOrders > 0
            ? number_format(abs($diff / $lastOrders * 100))
            : '100';

        $orders = [
                'total' => $currentOrders,
                'trend' => $trend,
                'percentage' => ($trend === 'up' ? '+' : '-') . $percentage . '%',
        ];

        // calculate revenue
        $total_revenue = Order::where('payment_status', 'paid')->sum('total_amount');
        $currentRevenue = Order::whereBetween('created_at', [$currentMonthStart, $currentMonthEnd])
            ->where('payment_status', 'paid')->sum('total_amount');
        $lastRevenue = Order::whereBetween('created_at', [$lastMonthStart, $lastMonthEnd])
            ->where('payment_status', 'paid')->sum('total_amount');

        $diff = $currentRevenue - $lastRevenue;
        $trend = $diff >= 0 ? 'up' : 'down';
        $percentage = $lastRevenue > 0
            ? number_format(abs($diff / $lastRevenue * 100))
            : '100';

        $revenue = [
                'total' => $currentRevenue,
                'trend' => $trend,
                'percentage' => ($trend === 'up' ? '+' : '-') . $percentage . '%',
        ];

        // sales revenue
        $currentSaleRevenue = Order::whereBetween('created_at', [$currentMonthStart, $currentMonthEnd])
            ->where('payment_status', 'paid')->where('type', 'purchase')->sum('total_amount');
        $lastSaleRevenue = Order::whereBetween('created_at', [$lastMonthStart, $lastMonthEnd])
            ->where('payment_status', 'paid')->where('type', 'purchase')->sum('total_amount');

        $diff = $currentSaleRevenue - $lastSaleRevenue;
        $trend = $diff >= 0 ? 'up' : 'down';
        $percentage = $lastSaleRevenue > 0
            ? number_format(abs($diff / $lastSaleRevenue * 100))
            : '100';

        $sale_revenue = [
            'total' => $currentSaleRevenue,
            'trend' => $trend,
            'percentage' => ($trend === 'up' ? '+' : '-') . $percentage . '%',
        ];

        // rentals revenue
        $currentRentalRevenue = Order::whereBetween('created_at', [$currentMonthStart, $currentMonthEnd])
            ->where('payment_status', 'paid')->where('type', 'location')->sum('total_amount');
        $lastRentalRevenue = Order::whereBetween('created_at', [$lastMonthStart, $lastMonthEnd])
            ->where('payment_status', 'paid')->where('type', 'location')->sum('total_amount');

        $diff = $currentRentalRevenue - $lastRentalRevenue;
        $trend = $diff >= 0 ? 'up' : 'down';
        $percentage = $lastRentalRevenue > 0
            ? number_format(abs($diff / $lastRentalRevenue * 100))
            : '100';

        $rental_revenue = [
            'total' => $currentRentalRevenue,
            'trend' => $trend,
            'percentage' => ($trend === 'up' ? '+' : '-') . $percentage . '%',
        ];

        // calculate rentals
        $currentRentals = Order::whereBetween('created_at', [$currentMonthStart, $currentMonthEnd])
            ->where('payment_status', 'paid')->where('type', 'location')->count();
        $lastRentals = Order::whereBetween('created_at', [$lastMonthStart, $lastMonthEnd])
            ->where('payment_status', 'paid')->where('type', 'location')->count();

        $diff = $currentRentals - $lastRentals;
        $trend = $diff >= 0 ? 'up' : 'down';
        $percentage = $lastRentals > 0
            ? number_format(abs($diff / $lastRentals * 100))
            : '100';

        $total_rentals = [
                'total' => $currentRentals,
                'trend' => $trend,
                'percentage' => ($trend === 'up' ? '+' : '-') . $percentage . '%',
        ];

        // calculate sales
        $currentSales = Order::whereBetween('created_at', [$currentMonthStart, $currentMonthEnd])
            ->where('payment_status', 'paid')->where('type', 'purchase')->count();
        $lastSales = Order::whereBetween('created_at', [$lastMonthStart, $lastMonthEnd])
            ->where('payment_status', 'paid')->where('type', 'purchase')->count();

        $diff = $currentSales - $lastSales;
        $trend = $diff >= 0 ? 'up' : 'down';
        $percentage = $lastSales > 0
            ? number_format(abs($diff / $lastSales * 100))
            : '100';

        $sales = [
            'total' => $currentSales,
            'trend' => $trend,
            'percentage' => ($trend === 'up' ? '+' : '-') . $percentage . '%',
        ];


        // calculate average duration
        $getAverageDuration = function ($start, $end) {
            $orders = Order::where('type', 'location')
                ->whereNotNull('rental_start_date')
                ->whereNotNull('rental_end_date')
                ->where('payment_status', 'paid')
                ->whereBetween('created_at', [$start, $end])
                ->get();

            if ($orders->count() === 0) return 0;

            $totalDays = $orders->reduce(function ($carry, $order) {
                $start = Carbon::parse($order->rental_start_date);
                $end = Carbon::parse($order->rental_end_date);
                return $carry + $start->diffInDays($end);
            }, 0);

            return round($totalDays / $orders->count(), 2);
        };

        $currentAvg = $getAverageDuration($currentMonthStart, $currentMonthEnd);
        $lastAvg = $getAverageDuration($lastMonthStart, $lastMonthEnd);

        $diff = $currentAvg - $lastAvg;
        $trend = $diff >= 0 ? 'up' : 'down';

        $percentage = $lastAvg > 0
            ? number_format(abs($diff / $lastAvg * 100), 2)
            : '100';

        $average_duration =[
            'total' => round($currentAvg),
            'trend' => $trend,
            'percentage' => ($trend === 'up' ? '+' : '-') . $percentage . '%'
        ];

        // calculate tickets
        $currentTickets = SavTicket::whereBetween('created_at', [$currentMonthStart, $currentMonthEnd])
            ->where('status', 'open')->count();
        $lastTickets = SavTicket::whereBetween('created_at', [$lastMonthStart, $lastMonthEnd])
            ->where('status', 'open')->count();

        $diff = $currentTickets - $lastTickets;
        $trend = $diff >= 0 ? 'up' : 'down';
        $percentage = $lastTickets > 0
            ? number_format(abs($diff / $lastTickets * 100))
            : '100';

        $total_tickets = [
                'total' => $currentTickets,
                'trend' => $trend,
                'percentage' => ($trend === 'up' ? '+' : '-') . $percentage . '%',
        ];

        return $this->sendResponse('Admin stats', [
            'total_orders' => $total_orders,
            'orders' => $orders,
            'total_revenue' => $total_revenue,
            'rental_revenue' => $rental_revenue,
            'sales_revenue' => $sale_revenue,
            'revenue' => $revenue, 
            'rentals' => $total_rentals,
            'sales' => $sales,
            'duration' => $average_duration,
            'open_tickets' => $total_tickets,
            'rental_graph' => $this->rentalData(),
            'sales_graph' => $this->salesData()
        ]);
    }

    public function rentalData()
    {
        $now = Carbon::now();

        // Last 11 months (month-wise)
        $start = $now->copy()->subMonths(5)->startOfMonth();
        $end = $now->copy()->endOfMonth();

        $months = CarbonPeriod::create($start, '1 month', $end);
        $monthLabels = collect();

        foreach ($months as $month) {
            $monthLabels->push([
                'key' => $month->format('Y-m-01'),
                'label' => $month->format('M Y'),
                'total_rentals' => 0,
                'total_revenue' => 0,
            ]);
        }

        // Query actual data with safe alias
        $rawData = DB::table('orders')
            ->selectRaw("
                DATE_FORMAT(created_at, '%Y-%m-01') as period_key,
                COUNT(*) as total_rentals,
                SUM(total_amount) as total_revenue
            ")
            ->where('type', 'location')
            ->where('payment_status', 'paid')
            ->whereBetween('created_at', [$start, $end])
            ->groupBy(DB::raw("DATE_FORMAT(created_at, '%Y-%m-01')"))
            ->get()
            ->keyBy('period_key');

        // Merge raw data into all months list
        $last6Months = $monthLabels->map(function ($item) use ($rawData) {
            $record = $rawData[$item['key']] ?? null;

            return [
                'period' => $item['label'],
                'total_rentals' => $record ? (int) $record->total_rentals : 0,
                'total_revenue' => $record ? (float) $record->total_revenue : 0,
            ];
        });

        // This month (day-wise)
        $startOfMonth = $now->copy()->startOfMonth();
        $today = $now->copy()->endOfDay();

        $rawDailyData = DB::table('orders')
            ->selectRaw("
                DATE(created_at) as period,
                COUNT(*) as total_rentals,
                SUM(total_amount) as total_revenue
            ")
            ->where('type', 'location')
            ->where('payment_status', 'paid')
            ->whereBetween('created_at', [$startOfMonth, $today])
            ->groupBy(DB::raw("DATE(created_at)"))
            ->orderBy(DB::raw("DATE(created_at)"))
            ->get()
            ->keyBy('period');

        $dailyData = collect();
        $period = CarbonPeriod::create($startOfMonth, $today);

        foreach ($period as $date) {
            $formatted = $date->format('Y-m-d');
            $entry = $rawDailyData->get($formatted);

            $dailyData->push([
                'period' => $formatted,
                'total_rentals' => $entry ? (int) $entry->total_rentals : 0,
                'total_revenue' => $entry ? (float) $entry->total_revenue : 0,
            ]);
        }

        // This year (month-wise)
        $rawYearlyData = DB::table('orders')
            ->selectRaw("
                DATE_FORMAT(created_at, '%Y-%m-01') as period,
                COUNT(*) as total_rentals,
                SUM(total_amount) as total_revenue
            ")
            ->where('type', 'location')
            ->where('payment_status', 'paid')
            ->whereBetween('created_at', [$now->copy()->startOfYear(), $now->copy()->endOfMonth()])
            ->groupBy(DB::raw("DATE_FORMAT(created_at, '%Y-%m-01')"))
            ->orderBy(DB::raw("DATE_FORMAT(created_at, '%Y-%m-01')"))
            ->get()
            ->keyBy('period');

        $yearlyMonthData = [];
        $current = Carbon::now()->startOfYear();
        $end = Carbon::now()->startOfMonth();

        while ($current <= $end) {
            $period = $current->format('Y-m-01');
            $monthLabel = $current->locale('fr_FR')->isoFormat('MMM'); // e.g., janv., févr.

            $entry = $rawYearlyData[$period] ?? null;

            $yearlyMonthData[] = [
                'period' => $monthLabel,
                // 'date' => $period,
                'total_rentals' => (int) ($entry->total_rentals ?? 0),
                'total_revenue' => (float) ($entry->total_revenue ?? 0),
            ];

            $current->addMonth();
        }

        // Last 5 years (year-wise)
        $yearlyData = DB::table('orders')
            ->selectRaw("
                YEAR(created_at) as period,
                COUNT(*) as total_rentals,
                SUM(total_amount) as total_revenue
            ")
            ->where('type', 'location')
            ->where('payment_status', 'paid')
            ->whereBetween('created_at', [$now->copy()->subYears(4)->startOfYear(), $now->copy()->endOfYear()])
            ->groupBy(DB::raw("YEAR(created_at)"))
            ->orderBy(DB::raw("YEAR(created_at)"))
            ->get()
            ->map(function ($item) {
                return [
                    'period' => (string)$item->period,
                    'total_rentals' => (int) $item->total_rentals,
                    'total_revenue' => (float) $item->total_revenue,
                ];
            })
            ->toArray();

        return [
            'last_6_months' => $last6Months,
            'this_month' => $dailyData,
            'this_year' => $yearlyMonthData,
            'last_5_years' => $yearlyData,
        ];
    }

    public function salesData()
    {
        $now = Carbon::now();

        // Last 11 months (month-wise)
        $start = $now->copy()->subMonths(5)->startOfMonth();
        $end = $now->copy()->endOfMonth();

        $months = CarbonPeriod::create($start, '1 month', $end);
        $monthLabels = collect();

        foreach ($months as $month) {
            $monthLabels->push([
                'key' => $month->format('Y-m-01'),
                'label' => $month->format('M Y'),
                'total_sales' => 0,
                'total_revenue' => 0,
            ]);
        }

        // Query actual data with safe alias
        $rawData = DB::table('orders')
            ->selectRaw("
                DATE_FORMAT(created_at, '%Y-%m-01') as period_key,
                COUNT(*) as total_sales,
                SUM(total_amount) as total_revenue
            ")
            ->where('type', 'purchase')
            ->where('payment_status', 'paid')
            ->whereBetween('created_at', [$start, $end])
            ->groupBy(DB::raw("DATE_FORMAT(created_at, '%Y-%m-01')"))
            ->get()
            ->keyBy('period_key');

        // Merge raw data into all months list
        $last6Months = $monthLabels->map(function ($item) use ($rawData) {
            $record = $rawData[$item['key']] ?? null;

            return [
                'period' => $item['label'],
                'total_sales' => $record ? (int) $record->total_sales : 0,
                'total_revenue' => $record ? (float) $record->total_revenue : 0,
            ];
        });

        // This month (day-wise)
        $startOfMonth = $now->copy()->startOfMonth();
        $today = $now->copy()->endOfDay();

        $rawDailyData = DB::table('orders')
            ->selectRaw("
                DATE(created_at) as period,
                COUNT(*) as total_sales,
                SUM(total_amount) as total_revenue
            ")
            ->where('type', 'purchase')
            ->where('payment_status', 'paid')
            ->whereBetween('created_at', [$startOfMonth, $today])
            ->groupBy(DB::raw("DATE(created_at)"))
            ->orderBy(DB::raw("DATE(created_at)"))
            ->get()
            ->keyBy('period');

        $dailyData = collect();
        $period = CarbonPeriod::create($startOfMonth, $today);

        foreach ($period as $date) {
            $formatted = $date->format('Y-m-d');
            $entry = $rawDailyData->get($formatted);

            $dailyData->push([
                'period' => $formatted,
                'total_sales' => $entry ? (int) $entry->total_sales : 0,
                'total_revenue' => $entry ? (float) $entry->total_revenue : 0,
            ]);
        }

        // This year (month-wise)
        $rawYearlyData = DB::table('orders')
            ->selectRaw("
                DATE_FORMAT(created_at, '%Y-%m-01') as period,
                COUNT(*) as total_sales,
                SUM(total_amount) as total_revenue
            ")
            ->where('type', 'purchase')
            ->where('payment_status', 'paid')
            ->whereBetween('created_at', [$now->copy()->startOfYear(), $now->copy()->endOfMonth()])
            ->groupBy(DB::raw("DATE_FORMAT(created_at, '%Y-%m-01')"))
            ->orderBy(DB::raw("DATE_FORMAT(created_at, '%Y-%m-01')"))
            ->get()
            ->keyBy('period');

        $yearlyMonthData = [];
        $current = Carbon::now()->startOfYear();
        $end = Carbon::now()->startOfMonth();

        while ($current <= $end) {
            $period = $current->format('Y-m-01');
            $monthLabel = $current->locale('fr_FR')->isoFormat('MMM'); // e.g., janv., févr.

            $entry = $rawYearlyData[$period] ?? null;

            $yearlyMonthData[] = [
                'period' => $monthLabel,
                // 'date' => $period,
                'total_sales' => (int) ($entry->total_sales ?? 0),
                'total_revenue' => (float) ($entry->total_revenue ?? 0),
            ];

            $current->addMonth();
        }

        // Last 5 years (year-wise)
        $yearlyData = DB::table('orders')
            ->selectRaw("
                YEAR(created_at) as period,
                COUNT(*) as total_sales,
                SUM(total_amount) as total_revenue
            ")
            ->where('type', 'purchase')
            ->where('payment_status', 'paid')
            ->whereBetween('created_at', [$now->copy()->subYears(4)->startOfYear(), $now->copy()->endOfYear()])
            ->groupBy(DB::raw("YEAR(created_at)"))
            ->orderBy(DB::raw("YEAR(created_at)"))
            ->get()
            ->map(function ($item) {
                return [
                    'period' => (string)$item->period,
                    'total_sales' => (int) $item->total_sales,
                    'total_revenue' => (float) $item->total_revenue,
                ];
            })
            ->toArray();

        return [
            'last_6_months' => $last6Months,
            'this_month' => $dailyData,
            'this_year' => $yearlyMonthData,
            'last_5_years' => $yearlyData,
        ];
    }

}
