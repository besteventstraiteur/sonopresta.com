<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Api\BaseController;
use Laravel\Sanctum\PersonalAccessToken;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Validator;
use Hash;
use Carbon\Carbon;
use App\Models\Client;
use App\Http\Traits\ImageTrait;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Mail;

class ClientController extends BaseController
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

    public function list(Request $request)
    {
        return Client::all();
    }
    
    public function create(Request $request)
    {
        $input = $request->all();
        $client = Client::create($input);
        if($client){
            return $this->sendResponse('Client added', Client::find($client->id));
        }else{  
            return $this->sendError('Try again later', []);
        }
    }

    public function update(Request $request)
    {
        $input = $request->except(['client_id']);
        $check = Client::where('id', $request->client_id)->update($input);
        if($check){
            return $this->sendResponse('Client updated', Client::find($request->client_id));
        }else{  
            return $this->sendError('Try again later', []);
        }
    }

    public function delete(Request $request)
    {
        $check = Client::where('id', $request->client_id)->delete();
        if($check){
            return $this->sendResponse('Client deleted', []);
        }else{  
            return $this->sendError('Try again later', []);
        }
    }
}
