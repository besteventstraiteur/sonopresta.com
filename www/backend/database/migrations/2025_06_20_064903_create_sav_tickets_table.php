<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('sav_tickets', function (Blueprint $table) {
            $table->id();
            $table->string('title');
            $table->string('status')->default('open')->comment('open, in_progress, closed');
            $table->string('product_id')->nullable();
            $table->string('order_id')->nullable();
            $table->integer('customer_id')->nullable();
            $table->longText('description')->nullable();
            $table->string('priority');
            $table->integer('assigned_to')->nullable();
            $table->integer('closed_at')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('sav_tickets');
    }
};
