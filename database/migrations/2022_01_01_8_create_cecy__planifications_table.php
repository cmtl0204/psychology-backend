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
                ->constrained('cecy.courses');

            $table->foreignId('responsible_course_id')
                ->constrained('cecy.authorities');

            $table->foreignId('responsible_cecy_id')
                ->constrained('cecy.authorities');

            $table->foreignId('school_period_id')
                ->constrained('cecy.school_periods');

            $table->foreignId('state_id')
                ->constrained('cecy.catalogues');

            $table->text('sector_id')
                ->constrained('cecy.catalogues');

            $table->text('area')
                ->nullable();

            $table->json('needs')
                ->comment('Necesidades');

            $table->date('started_at')
                ->comment('Fecha en que inicia la planificación');

            $table->date('ended_at')
                ->comment('Fecha en la que se espera terminar la planificación');
        });
    }

    public function down()
    {
        Schema::connection(env('DB_CONNECTION_CECY'))->dropIfExists('planifications');
    }
}
