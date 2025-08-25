<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    public function up(): void
    {
        Schema::create('devis_requests', function (Blueprint $table) {
            $table->id();
            $table->string('name')->nullable();
            $table->string('email')->nullable();
            $table->string('telephone')->nullable();
            $table->string('type_event')->nullable();
            $table->string('type_prestation')->nullable();
            $table->string('date_event')->nullable();
            $table->string('number_people')->nullable();
            $table->string('location')->nullable();
            $table->string('comment')->nullable();
            $table->boolean('accept_cgv')->nullable();
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('devis_requests');
    }
};