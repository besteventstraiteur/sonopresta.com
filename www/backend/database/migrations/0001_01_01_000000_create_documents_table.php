<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    public function up(): void
    {
        Schema::create('documents', function (Blueprint $table) {
            $table->string('id')->primary();
            $table->string('number')->nullable();
            $table->string('type')->nullable();
            $table->string('status')->nullable();
            $table->json('content')->nullable();
            $table->integer('total_amount')->nullable();
            $table->string('order_id')->nullable();
            $table->string('template_id')->nullable();
            $table->string('devis_request_id')->nullable();
            $table->string('accepted_at')->nullable();
            $table->string('paid_at')->nullable();
            $table->string('sent_at')->nullable();
            $table->string('due_date')->nullable();
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('documents');
    }
};