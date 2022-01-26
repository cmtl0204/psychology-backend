<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCecyTopicsTable extends Migration
{
    public function up()
    {
        Schema::connection(env('DB_CONNECTION_CECY'))->create('topics', function (Blueprint $table) {
            $table->id();
            $table->timestamps();
            $table->softDeletes();

            $table->foreignId('course_id')
                ->comment('Id del curso al que pertenece')
                ->constrained('cecy.courses');

            $table->foreignId('parent_id')
            ->nullable()
            ->comment('Id del tema principal')
            ->constrained('cecy.topics');

            $table->integer('level')
                ->nullable()
                ->comment('Nivel de los temas Ej: 1 y 2');

            $table->text('description')
                ->nullable()
                ->comment('Descripción del tema o subtema');
        });
    }

    public function down()
    {
        Schema::connection(env('DB_CONNECTION_CECY'))->dropIfExists('topics');
    }
}
