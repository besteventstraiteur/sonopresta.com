<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Api\BaseController;
use Laravel\Sanctum\PersonalAccessToken;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Validator;
use Hash;
use Carbon\Carbon;
use App\Models\Coupon;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Mail;

class CouponController extends BaseController
{
    public function __construct(Request $request) {
        $this->token = PersonalAccessToken::findToken($request->bearerToken());
        try{
            $this->user =  $this->token->tokenable;
            $this->user_id = $this->user->id;
        }
        catch(\Exception $e){ }
    }

    public function list(Request $request)
    {
        return Coupon::all();
    }
    
    public function create(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'code' => 'required',
            'type' => 'required',
            'discount_type' => 'required',
            'discount' => 'required',
            'expiry' => 'required',
        ]);

        if($validator->fails()){
            return $this->sendError('Identifiants invalides', $validator->errors());
        }

        $input = $request->all();
        $coupon = Coupon::create($input);
        if($coupon){
            return $this->sendResponse('Coupon added', Coupon::find($coupon->id));
        }else{  
            return $this->sendError('Try again later', []);
        }
    }

    public function update(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'coupon_id' => 'required',
            'code' => 'required',
            'type' => 'required',
            'discount_type' => 'required',
            'discount' => 'required',
            'expiry' => 'required',
        ]);

        if($validator->fails()){
            return $this->sendError('Identifiants invalides', $validator->errors());
        }

        $input = $request->except(['coupon_id']);
        $check = Coupon::where('id', $request->coupon_id)->update($input);
        if($check){
            return $this->sendResponse('Coupon updated', Coupon::find($request->coupon_id));
        }else{  
            return $this->sendError('Try again later', []);
        }
    }

    public function delete(Request $request)
    {
        $check = Coupon::where('id', $request->coupon_id)->delete();
        if($check){
            return $this->sendResponse('Coupon deleted', []);
        }else{  
            return $this->sendError('Try again later', []);
        }
    }

    public function details(Request $request)
    {
        $check = Coupon::where('code', $request->code)->first();
        if($check){
            return $this->sendResponse('Coupon details', $check);
        }else{  
            return $this->sendError('Try again later', []);
        }
    }
}
