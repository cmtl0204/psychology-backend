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

            $table->foreignId('catalogue_id')
                ->nullable()
                ->comment('Catálogo')
                ->constrained('cecy.catalogues');

            $table->foreignId('topic_id')
                ->nullable()
                ->comment('Temas')
                ->constrained('cecy.topics');

            $table->foreignId('profile_instructor_id')
                ->nullable()
                ->comment('Perfil del instructor')
                ->constrained('cecy.profiles_instructor');

            $table->foreignId('planifications')
                ->nullable()
                ->comment('Planificación')
                ->constrained('cecy.planifications');

            $table->foreignId('prerequisite_id')
                ->nullable()
                ->commnent('Prerequisitos')
                ->constrained('cecy.prerequisites');

            $table->foreignId('participant_id')
                ->nullable()
                ->comment('Participantes')
                ->constrained('cecy.participants');

            $table->foreignId('career_id')
                ->comment('ID de las carreras')
                ->nullable()
                ->constrained('core.careers');

            $table->string('code')
                ->nullable();

            $table->string('name')
                ->comment('Nombre del curso')
                ->nullable();

            $table->double('cost')
                ->comment('Costo del curso')
                ->nullable();

            $table->text('photo')
                ->commnent('Foto')
                ->nullable();

            $table->string('summary')
                ->comment('Resumen')
                ->nullable();

            $table->boolean('free')
                ->comment('Gratuidad')
                ->nullable();

            $table->integer('duration')
                ->commnet('Duración')
                ->nullable();

            $table->foreignId('modality_id')
                ->comment('Modalidad')
                ->nullable()
                ->constrained('cecy.catalogues');

            $table->string('observation')
                ->comment('observación')
                ->nullable();

            $table->string('objective')
                ->comment('Objetivos')
                ->nullable();

            $table->string('needs')
                ->comment('Necesidades')
                ->nullable();

            $table->string('target_group')
                ->commnent('Tarjeta de grupo')
                ->nullable();

            $table->string('facilities')
                ->comment('instalaciones')
                ->nullable();

            $table->string('theoretical_phase')
                ->comment('Fase teórica')
                ->nullable();

            $table->string('practical_phase')
                ->comment('Fase práctica')
                ->nullable();

            $table->string('requiered_installing_sources')
                ->commnent('Fuentes de instación necesaria')
                ->nullable();

            $table->string('cross_cutting_topics')
                ->commnent('Temas transversales')
                ->nullable();

            $table->string('bibliographys')
                ->commnent('Bibliografías')
                ->nullable();

            $table->string('requirements')
                ->comments('Requerimientos')
                ->nullable();

            $table->foreignId('participant_type_id')
                ->comment('Id tipo participantes ')
                ->nullable()
                ->constrained('cecy.catalogues');

            $table->foreignId('level_id')
                ->nullable()
                ->comment('Nivel')
                ->constrained('cecy.catalogues');

            $table->integer('practice_hours')
                ->commnent('Horas de práctica')
                ->nullable();

            $table->integer('theory_hours')
                ->commnent('Horas teóricas')
                ->nullable();

            $table->string('practice_requiered_resources')
                ->commnent('Práctica recursos requeridos')
                ->nullable();

            $table->string('aimtheory_required_resources')
                ->comment('')
                ->nullable();

            $table->string('learning_teaching_strategy')
                ->comment('Aprendizaje estrategia de enseñanza')
                ->nullable();

            $table->string('nro_record')
                ->comment('N record')
                ->nullable();

            $table->string('person_proposal_id')
                ->comment('ID de propuesta de persona')
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

            $table->string('local_proposal')
                ->comment('Propuesta local')
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

            $table->foreignId('classroom_id')
                ->nullable()
                ->comment('')
                ->constrained('cecy.catalogues');

            $table->foreignId('course_type_id')
                ->nullable()
                ->comment('')
                ->constrained('cecy.catalogues');

            $table->foreignId('speciality_id')
                ->nullable()
                ->comment('')
                ->constrained('cecy.catalogues');

            $table->foreignId('academic_period_id')
                ->nullable()
                ->comment('')
                ->constrained('cecy.catalogues');
        });
    }

    public function down()
    {
        Schema::connection(env('DB_CONNECTION_CECY'))->dropIfExists('courses');
    }
}
