<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    public function up(): void
    {
        Schema::create('products', function (Blueprint $table) {
            $table->id();
            $table->string('name')->nullable();
            $table->longText('description')->nullable();
            $table->longText('short_description')->nullable();
            $table->string('image_url')->nullable();
            $table->string('category_id')->nullable();
            $table->string('brand')->nullable();
            $table->integer('stock')->nullable();
            $table->integer('min_stock')->nullable();
            $table->float('weight')->nullable();
            $table->integer('sale_price')->nullable();
            $table->integer('daily_price')->nullable();
            $table->boolean('available')->nullable();
            $table->boolean('featured')->nullable();
            $table->integer('rented_out')->nullable();
            $table->string('type')->nullable()->comment('both, vente, location');
            $table->integer('free_shipping')->default(0);
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('products');
    }
};