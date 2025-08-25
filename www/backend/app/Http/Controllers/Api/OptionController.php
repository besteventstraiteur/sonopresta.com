<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Api\BaseController;
use Laravel\Sanctum\PersonalAccessToken;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Validator;
use Hash;
use Carbon\Carbon;
use App\Models\Option;
use App\Http\Traits\ImageTrait;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Mail;

class OptionController extends BaseController
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

    public function getOption(Request $request, $key)
    {
        return Option::where('meta_key', $key)->pluck('meta_value')->first();
    }

    public function create(Request $request)
    {
        $input = $request->all();
        if($input){
            foreach($input as $key => $val){
                Option::updateOrCreate(
                    ['meta_key' => $key],
                    ['meta_value' => $val]
                );
            }

            return $this->sendResponse('Option created', []);
        }else{
            return $this->sendError('Try again later', []);
        }
    }
}
