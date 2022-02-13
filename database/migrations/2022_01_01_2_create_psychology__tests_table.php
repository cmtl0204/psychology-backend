<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreatePsychologyTestsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('answers', function (Blueprint $table) {
            $table->id();
            $table->timestamps();
            $table->softDeletes();

            $table->foreignId('user_id')
                ->constrained('authentication.users');

            $table->foreignId('province_id')
                ->constrained('core.locations');

            $table->foreignId('canton_id')
                ->constrained('core.locations');

            $table->string('father_identification')
                ->nullable();

            $table->string('father_email')
                ->nullable();

            $table->string('father_name')
                ->nullable();

            $table->string('father_lastname')
                ->nullable();

            $table->string('father_phone')
                ->nullable();

            $table->boolean('terms_condition');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('respuestas');
    }
}
