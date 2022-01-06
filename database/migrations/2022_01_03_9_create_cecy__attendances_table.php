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

            $table->date('registered_at')
            ->comment('Fecha de la asistencia la cual sera guardada ');

            $table->string('duration')
            ->comment('Duracion de la asistencia en el curso');

            $table->foreignId('type_id')
            ->nullable()
            ->comment('')
            ->constrained('cecy.catalogues');

        });
    }

    public function down()
    {
        Schema::connection(env('DB_CONNECTION_CECY'))->dropIfExists('attendances');
    }
}
