<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Api\BaseController;
use Laravel\Sanctum\PersonalAccessToken;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Validator;
use Hash;
use Carbon\Carbon;
use App\Models\Product;
use App\Models\Category;
use App\Models\StockMovement;
use App\Http\Traits\ImageTrait;
use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Facades\Queue;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Mail;

class ProductController extends BaseController
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

    public function products(Request $request) 
    {
        if(request('type') and $request->type != 'all'){
            return Product::where('type', $request->type)->orderBy('id', 'desc')->get();
        }else{
            return Product::orderBy('id', 'desc')->get();
        }
    }

    public function rentProducts(Request $request) 
    {
        $products = Product::whereIn('type', ['both', 'location']);
        if(request('after')){
            $products = $products->where('id', '>', $request->after);
        }
        if(request('before')){
            $products = $products->where('id', '<', $request->before);
        }
        if(request('limit')){
            $products = $products->take($request->limit);
        }
        return $products->where('available', 1)->orderBy('id', 'desc')->get();
    }

    public function saleProducts(Request $request) 
    {
        $limit = request('limit')? $request->limit: 12;
        $products = Product::whereIn('type', ['both', 'vente']);
        if(request('after')){
            $products = $products->where('id', '>', $request->after);
        }
        if(request('before')){
            $products = $products->where('id', '<', $request->before);
        }
        return $products->where('available', 1)->orderBy('id', 'desc')
                    ->take($limit)->get();
    }

    public function categories(Request $request)
    {
        return Category::all();
    }

    public function rentCategories(Request $request)
    {
        $categories = Product::whereIn('type', ['both', 'location'])
                    ->where('available', 1)->pluck('category_id')->toArray();
        return Category::whereIn('id', $categories)->get();
    }

    public function saleCategories(Request $request)
    {
        $categories = Product::whereIn('type', ['both', 'vente'])
                    ->where('available', 1)->pluck('category_id')->toArray();
        return Category::whereIn('id', $categories)->get();
    }

    public function addCategory(Request $request)
    {
        $input = $request->all();
        $input['slug'] = str_replace(' ', '-', strtolower($input['name']));
        $category = Category::create($input);
        if($category){
            return $this->sendResponse('Category added', $category);
        }else{
            return $this->sendError('Try again later', []);
        }
    }

    public function updateCategory(Request $request)
    {
        $input = $request->except(['category_id']);
        $input['slug'] = str_replace(' ', '-', strtolower($input['name']));
        $check = Category::where('id', $request->category_id)->update($input);
        if($check){
            return $this->sendResponse('Category updated', []);
        }else{
            return $this->sendError('Try again later', []);
        }
    }

    public function deleteCategory(Request $request)
    {
        $check = Category::where('id', $request->category_id)->delete();
        if($check){
            return $this->sendResponse('Category deleted', []);
        }else{
            return $this->sendError('Try again later', []);
        }
    }

    public function createProduct(Request $request)
    {
        $input = $request->except(['image']);
        $response = Product::create($input);
        if($response){
            if (request('image')) {
                $imgPath = $this->verifyAndUpload($request, 'image', '/uploads/products');
                $fullimgPath = url('/') .'/api'. $imgPath;
            
                Product::where('id', $response->id)->update(array('image_url' => $fullimgPath));
            } 
            return $this->sendResponse('Le produit a été créé avec succès.', []);
        }else{
            return $this->sendError("Une erreur est survenue lors de l'enregistrement du produit.", []);
        }
    }

    public function updateProduct(Request $request)
    {
        $input = $request->except(['product_id', 'image']);
        $response = Product::where('id', $request->product_id)->update($input);
        if($response){
            if (request('image')) {
                $imgPath = $this->verifyAndUpload($request, 'image', '/uploads/products');
                $fullimgPath = url('/') .'/api'. $imgPath;
            
                Product::where('id', $request->product_id)->update(array('image_url' => $fullimgPath));
            } 
            return $this->sendResponse('Le produit a été mis à jour avec succès.', []);
        }else{
            return $this->sendError("Réessayez plus tard", []);
        }
    }

    public function deleteProduct(Request $request)
    {
        $check = Product::where('id', $request->product_id)->delete();
        if($check){
            return $this->sendResponse('"Le produit a été supprimé avec succès.', []);
        }else{
            return $this->sendError("Réessayez plus tard", []);
        }
    }

    public function stockMovements(Request $request)
    {
        return StockMovement::with('product')->get();
    }

    public function addStockMovement(Request $request)
    {
        $stock = StockMovement::create($request->all());
        if($stock){
            return $this->sendResponse('Mouvement de stock enregistré', []);
        }else{
            return $this->sendError("Une erreur est survenue lors de l'enregistrement du mouvement de stock.", []);
        }
    }

    // bulk import
    public function bulkImport(Request $request)
    {
        $data = $request->all();
        if($data){
            foreach($data as $d){
                // check the category exists
                if(isset($d['category'])){
                    $d['category_id'] = Category::where('name', $d['category'])->pluck('id')->first();
                    if(!$d['category_id']){
                        $category = Category::create(array('name' => $d['category'], 'slug' => str_replace(' ', '-', strtolower($d['category']))));
                        if($category){
                            $d['category_id'] = $category->id;
                        }
                    }

                    unset($d['category']);
                }

                Product::create($d);
            }
        }

        return true;
    }
}
