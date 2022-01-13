<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;



class CreateCecyPlanificationsTable extends Migration
{
    public function up()
    {
        Schema::connection(env('DB_CONNECTION_CECY'))->create('planifications', function (Blueprint $table) {
            $table->id();
            $table->timestamps();
            $table->softDeletes();

            $table->foreignId('area_id')
                ->constrained('cecy.catalogues');

            $table->string('code')
                ->nullable()
                ->comment('Código del detalle de planificación: SENESCYT-FF-V001-2021');

            $table->foreignId('course_id')
                ->comment('Id del curso al que esta atado la planificación')
                ->constrained('cecy.courses');

            $table->foreignId('responsible_course_id')
                ->comment('Id del docente responsable del curso')
                ->constrained('cecy.instructors');

            $table->foreignId('responsible_cecy_id')
                ->comment('Id del responsable del cecy')
                ->constrained('cecy.authorities');

            $table->foreignId('school_period_id')
                ->comment('Id del periodo escolar')
                ->constrained('cecy.school_periods');

            $table->foreignId('sector_id')
                ->comment('Ganaderia, Industria...')
                ->constrained('cecy.catalogues');

            $table->foreignId('state_id')
                ->comment('Pendiente, Aceptada, Rechazada')
                ->constrained('cecy.catalogues');


            $table->date('ended_at')
                ->comment('Fecha en la que se espera terminar la planificación');

            $table->date('especial_ended_date_at')
                ->comment('Fecha en que termina la matriculación especial');

            $table->date('especial_started_date_at')
                ->comment('Fecha en que inicia la matriculación especial');

            $table->date('extraordinary_inscription_ended_at')
                ->comment('Fecha en que termina la matriculación extraordinaria');

            $table->date('extraordinary_inscription_started_at')
                ->comment('Fecha en que inicia la matriculación extraordinaria');

            $table->json('needs')
                ->comment('Necesidades');

            $table->date('ordinary_inscription_ended_at')
                ->comment('Fecha en que termina la matriculación ordinaria');

            $table->date('ordinary_inscription_started_at')
                ->comment('Fecha en que inicia la matriculación ordinaria');

            $table->date('started_at')
                ->comment('Fecha en que inicia la planificación');
        });
    }

    public function down()
    {
        Schema::connection(env('DB_CONNECTION_CECY'))->dropIfExists('planifications');
    }
}
