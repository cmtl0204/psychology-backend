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

            $table->foreignId('type_id')
                ->nullable()
                ->comment('para saber si esta presente,inasistente o atrasado ')
                ->constrained('cecy.catalogues');

            // Pendiente el tipo de datos si es entero, time
            $table->time('duration')
                ->comment('Duracion de la asistencia en el curso');

            $table->date('registered_at')
                ->comment('Fecha de la asistencia la cual sera guardada');
        });
    }

    public function down()
    {
        Schema::connection(env('DB_CONNECTION_CECY'))->dropIfExists('attendances');
    }
}
