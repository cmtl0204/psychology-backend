<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCecyAdditionalInformationsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::connection(env('DB_CONNECTION_CECY'))->create('additional_informations', function (Blueprint $table) {
            $table->id();
            $table->timestamps();
            $table->softDeletes();

            $table->boolean('worked')
                ->comment('el participante trabaja?');

            $table->string('company_name')
                ->comment('nombre de empresa');

            $table->string('company_activity')
                ->comment('actividad de la empresa');

            $table->string('company_address')
                ->comment('direccion fisica de empresa');

            $table->string('company_phone')
                ->comment('telefono de empresa');

            $table->string('company_email')
                ->comment('correo de empresa');

            $table->boolean('company_sponsor')
                ->comment('la empresa patrocina el curso (auspiciada)');

            $table->string('contact_name')
                ->comment('nombre de contacto que patrocina');

            $table->string('level_instruction')
                ->comment('Nivel de instrucción del participante');

            $table->json('know_course')
                ->comment('como se entero del curso? Array');

            $table->json('course_follow')
                ->nullable()
                ->comment('cursos que te gustaria seguir? Array');

        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::connection(env('DB_CONNECTION_CECY'))->dropIfExists('additional_informations');
    }
}
