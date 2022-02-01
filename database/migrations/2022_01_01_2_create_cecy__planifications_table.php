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

            $table->foreignId('course_id')
                ->comment('Id del curso al que esta atado la planificación')
                ->constrained('cecy.courses');

            $table->foreignId('detail_school_period_id')
                ->comment('Id del periodo escolar')
                ->constrained('cecy.detail_school_periods');

            $table->foreignId('responsible_course_id')
                ->comment('Id del docente responsable del curso')
                ->constrained('cecy.instructors');

            $table->foreignId('responsible_cecy_id')
                ->comment('Id del responsable del cecy')
                ->constrained('cecy.authorities');

            $table->foreignId('responsible_ocs_id')
                ->comment('Id de responsable del ocs')
                ->constrained('cecy.authorities');

            $table->foreignId('state_id')
                ->comment('Por aprobar, culminada ...')
                ->constrained('cecy.catalogues');

            $table->foreignId('vicerrector_id')
                ->comment('Id del periodo escolar')
                ->constrained('cecy.authorities');



            $table->date('approved_at')
                ->comment('Fecha de aprobación de la planificación');

            $table->string('code')
                ->nullable()
                ->comment('Código del detalle de planificación: SENESCYT-FF-V001-2021');

            $table->date('ended_at')
                ->comment('Fecha en la que se espera terminar la planificación');

            $table->json('needs')
                ->comment('Se puede hacer una copia de las propias necesidades del curso de ser necesario');

            $table->json('observations')
                ->comment('En caso de que no se apruebe la planificaciopn se pone una observacion del porque no se acepta');

            $table->date('started_at')
                ->comment('Fecha en que inicia la planificación');
        });
    }

    public function down()
    {
        Schema::connection(env('DB_CONNECTION_CECY'))->dropIfExists('planifications');
    }
}
