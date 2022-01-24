<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCecyRegistrationRequerimentsTable extends Migration
{
    public function up()
    {
        Schema::connection(env('DB_CONNECTION_CECY'))->create('registration_requeriments', function (Blueprint $table) {
            $table->id();
            $table->timestamps();
            $table->softDeletes();

            $table->foreignId('registration_id')
                ->nullable()
                ->comment('fk de registro de estudiante')
                ->constrained('cecy.registrations');

            $table->foreignId('requeriment_id')
                ->nullable()
                ->comment('fk de requisitos para registro del estudiante')
                ->constrained('cecy.requeriments');

            $table->string('url')
                ->nullable()
                ->comment('dirección del archivo donde esta guardado');
        });
    }
    public function down()
    {
        Schema::connection(env('DB_CONNECTION_CECY'))->dropIfExists('registration_requeriments');
    }
}
