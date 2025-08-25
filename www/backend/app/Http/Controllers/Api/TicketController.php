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
use App\Models\SavTicket;
use App\Models\SavMessage;
use App\Models\SavAttachment;
use App\Http\Traits\ImageTrait;
use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Facades\Queue;
use Illuminate\Support\Facades\DB;
use App\Mail\Tickets\NewMessage;
use Illuminate\Support\Facades\Mail;

class TicketController extends BaseController
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

    public function tickets(Request $request)
    {
        if(request('customer_id')){
            $tickets = SavTicket::where('customer_id', $request->customer_id)->orderBy('id', 'desc')->get();
        }else{
            $tickets = SavTicket::orderBy('id', 'desc')->get();
        }
        $success['tickets'] = $tickets;
        $success['total_open'] = SavTicket::where('status', 'open')->count();
        $success['total_in_progress'] = SavTicket::where('status', 'in_progress')->count();
        $success['total_closed'] = SavTicket::where('status', 'closed')->count();
        return $this->sendResponse('Tickets', $success);
    }

    public function createTicket(Request $request)
    {
        $input = $request->all();
        if(!isset($input['customer_id'])){
            $input['customer_id'] = $this->user_id;
        }
        $ticket = SavTicket::create($request->all());
        if($ticket){
            return $this->sendResponse('Ticket created', $ticket);
        }else{
            return $this->sendError('Try again later', []);
        }
    }

    public function updateTicket(Request $request)
    {
        $input = $request->except(['ticket_id']);
        $check = SavTicket::where('id', $request->ticket_id)->update($input);
        if($check){
            return $this->sendResponse('Ticket updated', []);
        }else{
            return $this->sendError('Try again later', []);
        }
    }

    public function createMessage(Request $request)
    {
        $input = $request->all();
        $input['user_id'] = User::where('role', 'admin')->pluck('id')->first();
        $message = SavMessage::create($input);
        if($message){
            if(!request('is_internal')){
                $receiver = User::where('id', $message->user_id)->first();
                $data = [
                    'receiver_name' => $receiver->name,
                    'sender_name' => User::where('id', $message->sender_id)->pluck('name')->first(),
                    'ticket_id' => 'SUP-'.$message->ticket_id,
                    'ticket_title' => SavTicket::where('id', $message->ticket_id)->pluck('title')->first(),
                    'message' => $message->message,
                ];

                Mail::to($receiver->email)->send(new NewMessage($data));
            }

            return $this->sendResponse('Message created', $message);
        }else{
            return $this->sendError('Try again later', []);
        }
    }

    public function ticketDetails(Request $request, $ticket_id)
    {
        $success = [];
        if($this->user->role == 'admin'){
            $ticket = SavTicket::where('id', $ticket_id);
        }else{
            $ticket = SavTicket::where('id', $ticket_id)->where('customer_id', $this->user_id);
            if(!SavTicket::where('id', $ticket_id)->where('customer_id', $this->user_id)->exists()){
                $success['redirect'] = true;
            }
        }
        $ticket = $ticket->orderBy('id', 'desc')->first();
        $success['details'] = $ticket;
        return $this->sendResponse('Ticket Details', $success);
    }
}
