<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCecyParticipantCourseTable extends Migration
{
    public function up()
    {
        Schema::connection(env('DB_CONNECTION_CECY'))->create('participant_course', function (Blueprint $table) {
            $table->id();

            $table->foreignId('course_id')
                ->constrained('cecy.courses');

            $table->foreignId('participant_type_id')
                ->constrained('cecy.catalogues');
        });
    }

    public function down()
    {
        Schema::connection(env('DB_CONNECTION_CECY'))->dropIfExists('participant_course');
    }
}
