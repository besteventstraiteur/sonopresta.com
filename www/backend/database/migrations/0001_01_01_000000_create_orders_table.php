<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    public function up(): void
    {
        Schema::create('orders', function (Blueprint $table) {
            $table->id();
            $table->string('customer_id')->nullable();
            $table->string('delivery_address')->nullable();
            $table->string('notes')->nullable();
            $table->string('order_number')->nullable();
            $table->string('payment_status')->nullable()->comment('paid, unpaid');
            $table->string('coupon')->nullable();
            $table->integer('discount')->nullable();
            $table->string('phone_number')->nullable();
            $table->string('rental_end_date')->nullable();
            $table->string('rental_start_date')->nullable();
            $table->string('rental_recovery')->default(0);
            $table->string('status')->nullable()->comment('pending, delivered, completed, processing, cancelled');
            $table->integer('total_amount')->nullable();
            $table->string('type')->nullable()->comment('location, purchase');
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('orders');
    }
};