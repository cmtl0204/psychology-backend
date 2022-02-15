<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreatePsychologyAnswersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::connection(env('DB_CONNECTION_PSYCHOLOGY'))->create('answers', function (Blueprint $table) {
            $table->id();
            $table->timestamps();
            $table->softDeletes();

            $table->foreignId('question_id')
                ->constrained('psychology.questions');

            $table->string('class')
            ->nullable();

            $table->string('icon')
                ->nullable();

            $table->integer('order')
                ->unsigned()
                ->nullable();

            $table->integer('score')
                ->unsigned();

            $table->text('value');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::connection(env('DB_CONNECTION_PSYCHOLOGY'))->dropIfExists('answers');
    }
}
