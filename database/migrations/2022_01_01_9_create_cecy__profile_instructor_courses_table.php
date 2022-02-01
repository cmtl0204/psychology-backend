<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCecyProfileInstructorCoursesTable extends Migration
{
    public function up()
    {
        Schema::connection(env('DB_CONNECTION_CECY'))->create('profile_instructor_courses', function (Blueprint $table) {
            $table->id();
            $table->timestamps();
            $table->softDeletes();

            // Pendiente
            $table->foreignId('course_id')
                ->nullable()
                ->constrained('cecy.courses');

            $table->json('required_experiences')
                ->comment('experiencia del instrucotr para impartir un curso');

            $table->json('required_knowledges')
                ->comment('conocimiento del instructor para impartir un curso');

            $table->json('required_skills')
                ->comment('habilidades del instructor para impartir un curso');
        });
    }

    public function down()
    {
        Schema::connection(env('DB_CONNECTION_CECY'))->dropIfExists('profile_instructor_courses');
    }
}
