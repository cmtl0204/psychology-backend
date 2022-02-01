<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCecyRegistrationRequirementsTable extends Migration
{
    public function up()
    {
        Schema::connection(env('DB_CONNECTION_CECY'))->create('registration_requirement', function (Blueprint $table) {
            $table->id();
            $table->timestamps();
            $table->softDeletes();

            $table->foreignId('registration_id')
                ->nullable()
                ->comment('fk de registro de estudiante')
                ->constrained('cecy.registrations');

            $table->foreignId('requirement_id')
                ->nullable()
                ->comment('fk de requisitos para registro del estudiante')
                ->constrained('cecy.requirements');

            $table->string('url')
                ->nullable()
                ->comment('dirección del archivo donde esta guardado');
        });
    }
    public function down()
    {
        Schema::connection(env('DB_CONNECTION_CECY'))->dropIfExists('registration_requirement');
    }
}
