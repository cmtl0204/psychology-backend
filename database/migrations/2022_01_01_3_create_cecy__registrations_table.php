<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCecyRegistrationsTable extends Migration
{
    public function up()
    {
        Schema::connection(env('DB_CONNECTION_CECY'))->create('registrations', function (Blueprint $table) {
            $table->id();
            $table->timestamps();
            $table->softDeletes();

            $table->foreignId('detail_planification_id')
                ->nullable()
                ->comment('especificaciones de la planificacion')
                ->constrained('cecy.detail_planifications');

            $table->foreignId('participant_id')
                ->nullable()
                ->comment('Participante que se matricula')
                ->constrained('cecy.participants');

            $table->foreignId('state_id')
                ->nullable()
                ->comment('Estado de la matrícula. Inscrito, en revisión, matriculado, anulado')
                ->constrained('cecy.catalogues');

                $table->foreignId('type_id')
                ->nullable()
                ->comment('Tipo de matrícula: Ordinaria, extraordinaria, o especial')
                ->constrained('cecy.catalogues');

                $table->string('number')
                ->nullable()
                ->comment('Número de identificación de la matrícula');

                $table->date('registered_at')
                ->nullable()
                ->comment('Fecha de matrícula del participante');

            $table->unsignedFloat('final_grade')
                ->nullable()
                ->comment('nota final');

            $table->unsignedFloat('grade1')
                ->nullable()
                ->comment('Nota del primer parcial');

            $table->unsignedFloat('grade2')
                ->nullable()
                ->comment('Nota del segundo parcial');

            $table->json('observations')
                ->nullable()
                ->comment('Observaciones del estudiante');
        });
    }

    public function down()
    {
        Schema::connection(env('DB_CONNECTION_CECY'))->dropIfExists('registrations');
    }
}
