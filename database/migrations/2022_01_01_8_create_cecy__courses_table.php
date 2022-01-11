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

            $table->foreignId('academic_period_id')
                ->comment()
                ->constrained('cecy.catalogues');

            $table->foreignId('authority_id')
                ->comment()
                ->constrained('cecy.authorities');

            $table->foreignId('area_id')
                ->comment()
                ->constrained('cecy.catalogues');

            $table->foreignId('career_id')
                ->comment()
                ->constrained('core.careers');

            $table->foreignId('category_id')
                ->comment('Categoría a la cual pertenece el curso')
                ->constrained('cecy.catalogues');

            $table->foreignId('certified_type_id')
                ->comment()
                ->constrained('cecy.catalogues');

            $table->foreignId('course_type_id')
                ->comment()
                ->constrained('cecy.catalogues');

            $table->foreignId('level_id')
                ->comment()
                ->constrained('cecy.catalogues');

            $table->foreignId('modality_id')
                ->comment()
                ->constrained('cecy.catalogues');

            $table->foreignId('participant_type_id')
                ->comment() //¿Qué es?
                ->constrained('cecy.catalogues');

            $table->foreignId('schedule_id')
                ->comment()
                ->constrained('cecy.catalogues');

            $table->foreignId('speciality_id')
                ->comment()
                ->constrained('cecy.catalogues');

            $table->string('abbreviation')
                ->comment('Abreviación')
                ->nullable();

            $table->string('alignment')
                ->comment('Alineación del curso')
                ->nullable();

            $table->date('approved_at')
                ->comment('Fecha en que se aprobo el curso')
                ->nullable();

            $table->date('authorized_at')
                ->comment('Fecha en que se autorizo el curso')
                ->nullable();

            $table->json('bibliographies')
                ->comment('Bibliografías')
                ->nullable();

            $table->string('code')
                ->comment('Código del curso')
                ->nullable();

            // revisar si se deja cost o se pone price
            $table->double('price')
                ->comment('Precio del curso')
                ->nullable();

            $table->json('cross_cutting_topics')
                ->comment('Temas transversales')
                ->nullable();

            $table->integer('duration')
                ->comment('Duración medida en horas')
                ->nullable();

            $table->json('evaluation_mechanisms')
                ->comment('Mecanismos de evaluación')
                ->nullable();

            $table->date('expired_at')
                ->comment('Fecha de expiración del curso')
                ->nullable();

            $table->json('facilities')
                ->comment('instalaciones')
                ->nullable();

            $table->boolean('free')
                ->comment('Si el curso es gratuito es true y si no es false')
                ->nullable();

            $table->string('name')
                ->comment('Nombre del curso')
                ->nullable();

            $table->json('needs')
                ->comment('Necesidades')
                ->nullable();

            $table->date('needed_at')
                ->nullable();

            $table->string('record_number')
                ->comment('Número de record')
                ->nullable();

            $table->json('learning_environments')
                ->comment('Entorno de aprendizaje')
                ->nullable();

            $table->string('local_proposal')
                ->comment('Propuesta local')
                ->nullable();

            $table->string('objective')
                ->comment('Objetivo del curso')
                ->nullable();

            $table->string('observation')
                ->comment('Observación de curso')
                ->nullable();

            // revisar
            $table->json('practical_phases')
                ->comment('Fase práctica')
                ->nullable();

            $table->integer('practice_hours')
                ->comment('Número de horas prácticas del curso')
                ->nullable();

            $table->date('proposed_at')
                ->comment('Fecha en que se propuso el curso')
                ->nullable();

            // revisar para que sirve este campo
            $table->string('project')
                ->comment('Proyect')
                ->nullable();

            $table->string('required_installing_sources')
                ->comment('Fuentes de instación necesaria')
                ->nullable();

            $table->string('setec_name')
                ->comment('Nombre del setec')
                ->nullable();

            $table->string('summary')
                ->comment('Resumen del curso')
                ->nullable();

            $table->json('target_groups')
                ->comment('Tarjeta de grupo')
                ->nullable();

            $table->json('teaching_strategies')
                ->comment('Estrategias de enseñanza')
                ->nullable();

            $table->json('techniques_requisites')
                ->comment('Requisitos técnicos y generales del curso')
                ->nullable();

            $table->json('theoretical_phases')
                ->comment('Fase teórica')
                ->nullable();

            // revisar
            $table->integer('theory_hours')
                ->comment('Duración horas teoricas')
                ->nullable();
        });
    }

    public function down()
    {
        Schema::connection(env('DB_CONNECTION_CECY'))->dropIfExists('courses');
    }
}
