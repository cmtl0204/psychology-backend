<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCecyDetailPlanificationInstructorTable extends Migration
{
    public function up()
    {
        Schema::connection(env('DB_CONNECTION_CECY'))->create('detail_planification_instructor', function (Blueprint $table) {
            $table->id();

            $table->foreignId('instructor_id')
                ->nullable()
                ->comment('trae toda la informacion de la tabla instructor')
                ->constrained('cecy.instructors');

            $table->foreignId('topic_id')
                ->nullable()
                ->comment('Id del tema que va a impartir el instructor')
                ->constrained('cecy.topics');

            $table->foreignId('detail_planification_id')
                ->nullable()
                ->comment('trae la informacion del detail_planification')
                ->constrained('cecy.detail_planifications');
        });
    }

    public function down()
    {
        Schema::connection(env('DB_CONNECTION_CECY'))->dropIfExists('detail_planification_instructor');
    }
}
