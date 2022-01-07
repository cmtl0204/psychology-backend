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
                ->constrained('cecy.catalogues');

            $table->foreignId('authority_id')
                ->constrained('cecy.authorities');

            $table->foreignId('area_id')
                ->constrained('cecy.catalogues');

            $table->foreignId('career_id')
                ->constrained('core.careers');

            $table->foreignId('certified_type_id')
                ->constrained('cecy.catalogues');

            $table->foreignId('course_type_id')
                ->constrained('cecy.catalogues');

            $table->foreignId('level_id')
                ->constrained('cecy.catalogues');

            $table->foreignId('modality_id')
                ->constrained('cecy.catalogues');

            $table->foreignId('participant_type_id') //¿Qué es?
                ->constrained('cecy.catalogues');

            $table->foreignId('schedul_id')
                ->constrained('cecy.catalogues');

            $table->foreignId('speciality_id')
                ->constrained('cecy.catalogues');

            $table->string('abbreviation')
                ->comment('Abreviación')
                ->nullable();

            $table->string('aimtheory_required_resources')
                ->comment('Recursos para aprendizaje teórico')
                ->nullable();

            $table->string('alignment')
                ->comment('Alineación del curso')
                ->nullable();

            $table->date('approved_at')
                ->comment('Fecha en que se aprobo el curso')
                ->nullable();

            $table->integer('attached')
                ->nullable();

            $table->date('authorized_at')
                ->comment('Fecha en que se autorizo el curso')
                ->nullable();

            $table->json('bibliographys')
                ->commnent('Bibliografías')
                ->nullable();

            $table->string('category')
                ->comment('Categoría a la cual pertenece el curso')
                ->nullable();

            $table->string('code')
                ->comment('Código del curso')
                ->nullable();

            $table->double('cost')
                ->comment('Costo del curso')
                ->nullable();

            $table->json('cross_cutting_topics')
                ->commnent('Temas transversales')
                ->nullable();

            $table->integer('duration')
                ->commnet('Duración')
                ->nullable();

            $table->json('evaluation_mechanism')
                ->comments('Mecanismos de evaluación')
                ->nullable();

            $table->date('expired_at')
                ->commnent('Fecha de expiración del curso')
                ->nullable();

            $table->json('facilities')
                ->comment('instalaciones')
                ->nullable();

            $table->boolean('free')
                ->comment('Gratuidad')
                ->nullable();

            $table->string('name')
                ->comment('Nombre del curso')
                ->nullable();

            $table->json('needs')
                ->comment('Necesidades')
                ->nullable();

            $table->date('needed_at')
                ->nullable();

            $table->string('nro_record')
                ->comment('Número de record')
                ->nullable();

            $table->json('learning_environment')
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

            $table->json('practical_phase')
                ->comment('Fase práctica')
                ->nullable();

            $table->integer('practice_hours')
                ->comment('Número de horas prácticas del curso')
                ->nullable();

            $table->string('practice_required_resources')
                ->commnent('Recursos para aprendizaje práctico')
                ->nullable();

            $table->date('proposed_at')
                ->comment('Fecha en que se propuso el curso')
                ->nullable();

            $table->string('project')
                ->comment('Proyect')
                ->nullable();

            $table->string('required_installing_sources')
                ->commnent('Fuentes de instación necesaria')
                ->nullable();

            $table->string('setec_name')
                ->comment('Nombre del setec')
                ->nullable();

            $table->string('summary')
                ->comment('Resumen del curso')
                ->nullable();

            $table->json('target_group')
                ->commnent('Tarjeta de grupo')
                ->nullable();

            $table->json('teaching_strategies')
                ->comments('Estrategias de enseñanza')
                ->nullable();

            $table->json('techniques_requisites')
                ->comments('Requisitos técnicos y generales del curso')
                ->nullable();

            $table->json('theoretical_phase')
                ->comment('Fase teórica')
                ->nullable();

            $table->integer('theory_hours')
                ->commnet('Duración')
                ->nullable();
        });
    }

    public function down()
    {
        Schema::connection(env('DB_CONNECTION_CECY'))->dropIfExists('courses');
    }
}
