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

            $table->foreignId('course_id')
                ->nullable()
                ->comment('')
                ->constrained('cecy.courses');

            $table->json('require_experience')
                ->comment('');

            $table->json('require_knowledge')
                ->comment('');

            $table->json('require_skills')
            ->comment('');

        });
    }

    public function down()
    {
        Schema::connection(env('DB_CONNECTION_CECY'))->dropIfExists('profile_instructor_courses');
    }
}
