<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCecyAttendancesTable extends Migration
{
    public function up()
    {
        Schema::connection(env('DB_CONNECTION_CECY'))->create('attendances', function (Blueprint $table) {
            $table->id();
            $table->timestamps();
            $table->softDeletes();

            $table->foreignId('detail_registration_id')
                ->constrained('cecy.detail_registration');
            
            $table->string('created_at');

            $table->date('date')
            ->omment('Fecha de la asistencia la cual sera guardada ');

            $table->string('duration')
            ->omment('Duracion de la asistencia en el curso');

            $table->string('photograpic_registry_id')
            ->omment('Registro fotografico del curso');

            $table->boolean('state_id');

            $table->time('type_id');

            $table->string('updated_at');
        });
    }

    public function down()
    {
        Schema::connection(env('DB_CONNECTION_CECY'))->dropIfExists('attendances');
    }
}
