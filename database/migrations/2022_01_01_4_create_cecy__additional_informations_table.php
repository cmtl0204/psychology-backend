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


            $table->foreignId('level_instruction_id')
                ->comment('Nivel de instrucción ejem: Primer nivel, segundo nivel, tercer nivel')
                ->constrained('cecy.catalogues');

            $table->foreignId('registration_id')
                ->comment('Informacion adicional de trabajo para el registro')
                ->constrained('cecy.registrations');

            $table->string('company_activity')
                ->comment('actividad de la empresa');

            $table->string('company_address')
                ->comment('direccion fisica de empresa');

            $table->string('company_email')
                ->comment('correo de empresa');

            $table->string('company_name')
                ->comment('nombre de empresa');

            $table->string('company_phone')
                ->comment('telefono de empresa');

            $table->boolean('company_sponsored')
                ->comment('la empresa patrocina el curso true->la empresa patrocina, false-> no patrocina');

            $table->string('contact_name')
                ->comment('nombre de contacto que patrocina');

            $table->json('course_follows')
                ->nullable()
                ->comment('cursos que te gustaria seguir? Array');

            $table->json('course_knows')
                ->comment('como se entero del curso? Array');

            $table->boolean('worked')
                ->comment('el participante trabaja, true -> trabaja, false -> no trabaja');
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
