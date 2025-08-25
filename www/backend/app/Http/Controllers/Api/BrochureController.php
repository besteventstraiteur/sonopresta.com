<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Api\BaseController;
use Laravel\Sanctum\PersonalAccessToken;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Validator;
use Hash;
use Carbon\Carbon;
use App\Models\Brochure;
use App\Http\Traits\ImageTrait;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Mail;

class BrochureController extends BaseController
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
        $brochure = Brochure::orderBy('id', 'desc');
        if(request('status')){
            $brochure = $brochure->where('status', $request->status);
        }
        if(request('limit')){
            $brochure = $brochure->take($request->limit);
        }
        return $brochure->get();
    }

    public function create(Request $request)
    {
        $input = $request->except(['file']);

        // Create brochure record first
        $response = Brochure::create($input);

        if ($response) {
            if ($request->hasFile('file')) {
                $file = $request->file('file');

                // Ensure it's a valid PDF
                if ($file->getClientOriginalExtension() !== 'pdf') {
                    return $this->sendError('Le fichier doit être au format PDF.', []);
                }

                $fileName = time() . '_' . uniqid() . '.' . $file->getClientOriginalExtension();
                $destinationPath = public_path('/uploads/brochures');

                // Ensure directory exists
                if (!file_exists($destinationPath)) {
                    mkdir($destinationPath, 0755, true);
                }

                // Move the file
                $file->move($destinationPath, $fileName);

                // Create file URL
                $fullImgPath = url('/api/uploads/brochures/' . $fileName);

                // Update record
                Brochure::where('id', $response->id)->update([
                    'file_path' => $fullImgPath
                ]);
            }

            return $this->sendResponse('Brochure added', []);
        } else {
            return $this->sendError("Try again later", []);
        }
    }

    public function delete(Request $request)
    {
        $brochure = Brochure::find($request->brochure_id);

        if (!$brochure) {
            return $this->sendError('Brochure introuvable', []);
        }

        // Extract file path and delete file from public folder
        if ($brochure->file_path) {
            // Extract only the relative path (after '/uploads/brochures/')
            $relativePath = str_replace(url('/api'), '', $brochure->file_path);
            $fullPath = public_path($relativePath);

            if (file_exists($fullPath)) {
                unlink($fullPath); // 🧨 deletes the file
            }
        }

        // Delete the brochure record
        $brochure->delete();

        return $this->sendResponse('Brochure supprimée avec succès', []);
    }

}
