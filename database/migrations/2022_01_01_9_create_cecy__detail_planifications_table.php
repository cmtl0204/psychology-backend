<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCecyDetailPlanificationsTable extends Migration
{
    public function up()
    {
        Schema::connection(env('DB_CONNECTION_CECY'))->create('detail_planifications', function (Blueprint $table) {
            $table->id();
            $table->timestamps();
            $table->softDeletes();

            $table->foreignId('classroom_id')
                ->nullable()
                ->comment('Id aula')
                ->constrained('cecy.classrooms');

            // Pendiente de revisar, para mejor crear una tabla de horarios
            $table->foreignId('day_id')
                ->nullable()
                ->comment('Id día')
                ->constrained('cecy.catalogues');

            $table->foreignId('end_time_id')
                ->nullable()
                ->comment('Id hora final')
                ->constrained('cecy.catalogues');

            $table->foreignId('planification_id')
                ->nullable()
                ->comment('Id planificación')
                ->constrained('cecy.planifications');

            $table->foreignId('start_time_id')
                ->nullable()
                ->comment('Id hora de inicio')
                ->constrained('cecy.catalogues');

            $table->foreignId('state_id')
                // ->default() que valor se muestra por defecto?
                ->nullable()
                ->comment('Estados como en proceso, finalizado')
                ->constrained('cecy.catalogues');

            $table->foreignId('workday_id')
                ->nullable()
                ->comment('Jornada laboral como matutino, vespertino o nocturno')
                ->constrained('cecy.catalogues');   

            // Pendinte de revisar con workday
            $table->integer('days_number')
                ->comment('Número de días de duración del curso');

            $table->date('ended_at')
                ->comment('Fecha final');

            $table->integer('parallel')
                ->comment('Paralelo');

            $table->date('plan_ended_at')
                ->comment('Fecha final de la planificación');

            $table->date('started_at')
                ->comment('Fecha inicio');    
        });
    }

    public function down()
    {
        Schema::connection(env('DB_CONNECTION_CECY'))->dropIfExists('detail_planifications');
    }
}
