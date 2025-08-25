<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Api\BaseController;
use Laravel\Sanctum\PersonalAccessToken;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Validator;
use Hash;
use Carbon\Carbon;
use App\Models\Blog;
use App\Http\Traits\ImageTrait;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Mail;

class BlogController extends BaseController
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
        $blog = Blog::orderBy('id', 'desc');
        if(request('status')){
            $blog = $blog->where('status', $request->status);
        }
        if(request('limit')){
            $blog = $blog->take($request->limit);
        }
        return $blog->get();
    }
    
    public function create(Request $request)
    {
        $input = $request->except(['image']);
        $input['slug'] = str_replace(' ', '-', strtolower($input['title']));
        $response = Blog::create($input);
        if($response){
            if (request('image')) {
                $imgPath = $this->verifyAndUpload($request, 'image', '/uploads/blogs');
                $fullimgPath = url('/') .'/api'. $imgPath;
            
                Blog::where('id', $response->id)->update(array('image_url' => $fullimgPath));
            } 
            return $this->sendResponse('Blod added', []);
        }else{
            return $this->sendError("Try again later", []);
        }
    }

    public function update(Request $request)
    {
        $input = $request->except(['post_id', 'image']);
        $response = Blog::where('id', $request->post_id)->update($input);
        if($response){
            if (request('image')) {
                $imgPath = $this->verifyAndUpload($request, 'image', '/uploads/blogs');
                $fullimgPath = url('/') .'/api'. $imgPath;
            
                Blog::where('id', $request->post_id)->update(array('image_url' => $fullimgPath));
            } 
            return $this->sendResponse('Blog updated', []);
        }else{
            return $this->sendError("Try again later", []);
        }
    }

    public function delete(Request $request)
    {
        $check = Blog::where('id', $request->post_id)->delete();
        if($check){
            return $this->sendResponse('Blog deleted', []);
        }else{  
            return $this->sendError('Try again later', []);
        }
    }

    public function details(Request $request, $slug)
    {
        $blog = Blog::where('slug', $slug)->first();
        if($blog){
            return $this->sendResponse('Blog details', $blog);
        }else{  
            return $this->sendError('Try again later', []);
        }
    }
}
