<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\UserController;
use App\Http\Controllers\Api\ProductController;
use App\Http\Controllers\Api\OrderController;
use App\Http\Controllers\Api\TicketController;
use App\Http\Controllers\Api\ClientController;
use App\Http\Controllers\Api\CouponController;
use App\Http\Controllers\Api\BlogController;
use App\Http\Controllers\Api\BrochureController;
use App\Http\Controllers\Api\OptionController;
use App\Http\Controllers\Api\AdditionalController;

// auth routes
Route::controller(UserController::class)->group(function() {
    Route::post('login', 'login');
    Route::post('register', 'register');
    Route::post('verify-email', 'verifyEmail');
    Route::post('resend-email-verification-request', 'resendEmailVerificationRequest');
    Route::post('forget-password-request', 'forgetPasswordRequest');
    Route::post('forget-password', 'forgetPassword');
    Route::post('update-user', 'updateUser')->middleware('auth:sanctum');

    Route::post('get-a-quote', 'getAQuote');
    Route::post('contact-mail', 'contactMail');

    Route::prefix('stats')->group(function() {
        Route::post('customer', 'customerStats')->middleware('auth:sanctum');
        Route::post('admin', 'adminStats')->middleware('auth:sanctum');
    });
});

// product routes
Route::controller(ProductController::class)->group(function() {
    Route::post('products', 'products');
    Route::post('products/rent', 'rentProducts');
    Route::post('products/sale', 'saleProducts');

    Route::prefix('product')->group(function() {
        Route::post('categories', 'categories');
        Route::post('categories/rent', 'rentCategories');
        Route::post('categories/sale', 'saleCategories');
        Route::post('category/add', 'addCategory');
        Route::post('category/update', 'updateCategory');
        Route::post('category/delete', 'deleteCategory');
        Route::post('create', 'createProduct');
        Route::post('update', 'updateProduct');
        Route::post('delete', 'deleteProduct');
        Route::post('bulk-import', 'bulkImport');
    });

    Route::post('stock-movements', 'stockMovements');
    Route::post('add-stock-movement', 'addStockMovement');
});

// order routes
Route::controller(OrderController::class)->group(function() {
    Route::post('save-order', 'saveOrder');
    Route::post('payment-url/{order_number}', 'paymentUrl')->middleware('auth:sanctum');
    Route::post('orders', 'orders')->middleware('auth:sanctum');
    Route::post('order-details/{number}', 'details')->middleware('auth:sanctum');
    Route::post('order-status-update/{number}', 'updateStatus')->middleware('auth:sanctum');
    Route::post('order-recovery-update/{number}', 'updateRecovery')->middleware('auth:sanctum');

    Route::prefix('stripe')->group(function() {
        Route::get('success', 'stripeSuccess');
        Route::get('cancel', 'stripeCancel');
    });
});

// clients routes
Route::post('clients', [OrderController::class, 'clients']);
Route::controller(ClientController::class)->group(function() {
    Route::middleware('auth:sanctum')->group(function() {
        // Route::post('clients', 'list');
        Route::prefix('client')->group(function() {
            Route::post('create', 'create');
            Route::post('update', 'update');
            Route::post('delete', 'delete');
        });
    });
});

// coupons routes
Route::controller(CouponController::class)->group(function() {
    Route::middleware('auth:sanctum')->group(function() {
        Route::post('coupons', 'list');
        Route::prefix('coupon')->group(function() {
            Route::post('create', 'create');
            Route::post('update', 'update');
            Route::post('delete', 'delete');
            Route::post('details', 'details');
        });
    });
});

// blogs routes
Route::controller(BlogController::class)->group(function() {
    Route::post('blogs', 'list');
    Route::prefix('blog')->group(function() {
        Route::post('create', 'create');
        Route::post('update', 'update');
        Route::post('delete', 'delete')->middleware('auth:sanctum');
        Route::post('details/{slug}', 'details');
    });
});

// brochures routes
Route::controller(BrochureController::class)->group(function() {
    Route::post('brochures', 'list');
    Route::prefix('brochure')->group(function() {
        Route::post('create', 'create');
        Route::post('delete', 'delete');
    });
});

// ticket routes
Route::controller(TicketController::class)->group(function() {
    Route::middleware('auth:sanctum')->group(function() {
        Route::post('tickets', 'tickets');
        Route::prefix('ticket')->group(function() {
            Route::post('create', 'createTicket');
            Route::post('update', 'updateTicket');
            Route::post('message', 'createMessage');
            Route::post('details/{ticket_id}', 'ticketDetails');
        });
    });
});

// options routes
Route::controller(OptionController::class)->group(function() {
    Route::post('option/create', 'create')->middleware('auth:sanctum');
    Route::post('option/{key}', 'getOption');
});

// additional routes
Route::controller(AdditionalController::class)->group(function() {
    Route::get('crons', 'generalCron');
});


Route::get('/uploads/{path}', function ($path) {
    $fullPath = public_path('uploads/' . $path);

    // Check if the file exists
    if (!File::exists($fullPath)) {
        abort(404);
    }

    // Get the file content and its MIME type
    $file = File::get($fullPath);
    $type = File::mimeType($fullPath);

    return response($file, 200)->header('Content-Type', $type)
                              ->header('Access-Control-Allow-Origin', '*');
})->where('path', '.*');