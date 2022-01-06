<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCecyCoursesTable extends Migration
{
    public function up()
    {
        Schema::connection(env('DB_CONNECTION_CECY'))->create('courses', function (Blueprint $table) {
            $table->id();
            $table->timestamps();
            $table->softDeletes();


            $table->foreignId('authority_id')
                ->constrained('cecy.authorities');

            $table->foreignId('career_id')
                ->constrained('core.careers');

            $table->foreignId('area_id')
                ->constrained('cecy.catalogues');

            $table->foreignId('level_id')
                ->constrained('cecy.catalogues');

            $table->foreignId('modality_id')
                ->constrained('cecy.catalogues');

            $table->foreignId('participant_type_id') //¿Qué es?
                ->constrained('cecy.catalogues');

            $table->foreignId('schedules_id')
                ->constrained('cecy.catalogues');

            $table->foreignId('course_type_id')
                ->constrained('cecy.catalogues');

            $table->foreignId('academic_period_id')
                ->constrained('cecy.catalogues');

            $table->foreignId('certified_type_id')
                ->constrained('cecy.catalogues');

            $table->foreignId('speciality_id')
                ->constrained('cecy.catalogues');

            $table->string('code')
                ->comment('Código del curso')
                ->nullable();

            $table->string('name')
                ->comment('Nombre del curso')
                ->nullable();

            $table->string('summary')
                ->comment('Resumen del curso')
                ->nullable();

            $table->string('observation')
                ->comment('Observación de curso')
                ->nullable();

            $table->string('objective')
                ->comment('Objetivo del curso')
                ->nullable();

            $table->string('requiered_installing_sources')
                ->commnent('Fuentes de instación necesaria')
                ->nullable();

            $table->string('practice_requiered_resources')
                ->commnent('Recursos para aprendizaje práctico')
                ->nullable();

            $table->string('aimtheory_required_resources')
                ->comment('Recursos para aprendizaje teórico')
                ->nullable();

            $table->string('nro_record')
                ->comment('Número de record')
                ->nullable();

            $table->string('learning_teaching_strategy')
                ->comment('Aprendizaje estrategia de enseñanza')
                ->nullable();

            $table->string('local_proposal')
                ->comment('Propuesta local')
                ->nullable();

            $table->string('project')
                ->comment('Proyect')
                ->nullable();

            $table->string('setec_name')
                ->comment('Nombre del setec')
                ->nullable();

            $table->string('abbreviation')
                ->comment('Abreviación')
                ->nullable();

            $table->string('categoria')
                ->comment('Abreviación')
                ->nullable();

            $table->boolean('free')
                ->comment('Gratuidad')
                ->nullable();

            $table->integer('attached')
                ->nullable();

            $table->double('cost')
                ->comment('Costo del curso')
                ->nullable();

            $table->integer('duration')
                ->commnet('Duración')
                ->nullable();

            $table->integer('theory_hours')
                ->commnet('Duración')
                ->nullable();

            $table->integer('practice_hours')
                ->nullable();

            $table->json('needs')
                ->comment('Necesidades')
                ->nullable();

            $table->json('target_group')
                ->commnent('Tarjeta de grupo')
                ->nullable();

            $table->json('facilities')
                ->comment('instalaciones')
                ->nullable();

            $table->json('theoretical_phase')
                ->comment('Fase teórica')
                ->nullable();

            $table->json('practical_phase')
                ->comment('Fase práctica')
                ->nullable();

            $table->json('cross_cutting_topics')
                ->commnent('Temas transversales')
                ->nullable();

            $table->json('bibliographys')
                ->commnent('Bibliografías')
                ->nullable();

            $table->json('requirements')
                ->comments('Requerimientos')
                ->nullable();

            $table->json('teaching_strategies')
                ->comments('Estrategias de enseñanza')
                ->nullable();



            $table->date('proposed_date')
                ->comment('Fecha propuesta')
                ->nullable();

            $table->date('approval_date')
                ->comment('Fecha de aprobación')
                ->nullable();

            $table->date('need_date_at')
                ->nullable();

            $table->date('expiration_date')
                ->commnent('Fecha de espiración')
                ->nullable();

            $table->date('autorization_date')
                ->comment('Fecha de autorización')
                ->nullable();

            $table->integer('schedules_id')
                ->nullable()
                ->comment('')
                ->constrained('cecy.catalogues');

            $table->string('project')
                ->comment('Proyecto')
                ->nullable();

            $table->integer('capacity')
                ->comment('Capacidad')
                ->nullable();
        });
    }

    public function down()
    {
        Schema::connection(env('DB_CONNECTION_CECY'))->dropIfExists('courses');
    }
}
