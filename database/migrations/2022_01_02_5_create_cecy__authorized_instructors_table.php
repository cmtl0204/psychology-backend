<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCecyAuthorizedInstructorsTable extends Migration
{
    public function up()
    {
        Schema::connection(env('DB_CONNECTION_CECY'))->create('authorized_instructors', function (Blueprint $table) {
            $table->id();

            $table->foreignId('instructor_id')
                ->nullable()
                ->constrained('cecy.catalogues');

            $table->foreignId('profile_instructor_course_id')
                ->nullable()
                ->constrained('cecy.profile_instructor_courses');    
        });
    }

    public function down()
    {
        Schema::connection(env('DB_CONNECTION_CECY'))->dropIfExists('authorized_instructors');
    }
}
