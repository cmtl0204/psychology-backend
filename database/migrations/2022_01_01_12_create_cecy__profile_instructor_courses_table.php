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

            $table->timestamp('created_at')
                ->comment('');

            $table->text('require_experience')
                ->comment('');

            $table->text('require_knowledge')
                ->comment('');

            $table->text('require_skill')
            ->comment('');

            $table->boolean('stated_id')
                ->comment('');

            $table->timestamp('updated_at')
            ->comment('');


        });
    }

    public function down()
    {
        Schema::connection(env('DB_CONNECTION_CECY'))->dropIfExists('profile_instructor_courses');
    }
}
