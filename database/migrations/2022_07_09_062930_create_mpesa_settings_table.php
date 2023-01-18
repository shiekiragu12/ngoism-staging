<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('mpesa_settings', function (Blueprint $table) {
            $table->id();
            $table->string('mpesa_passkey')->nullable();
            $table->string('mpesa_consumerkey')->nullable();
            $table->string('mpesa_consumersecret')->nullable();
            $table->enum('mpesa_env', ['sandbox', 'live'])->default('sandbox');
            $table->string('mpesa_callbackurl');
            $table->string('mpesa_confirmationurl')->nullable();
            $table->string('mpesa_validationurl')->nullable();
            $table->string('mpesa_shortcode')->nullable();
            $table->string('mpesa_amount')->nullable();
            $table->string('mpesa_testshortcode');
            $table->tinyInteger('mpesa_status')->default(0);
            $table->string('mpesa_testpasskey');
            $table->string('mpesa_testconsumerkey');
            $table->string('mpesa_testconsumersecret');
            $table->string('mpesa_testamount')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('mpesa_settings');
    }
};
