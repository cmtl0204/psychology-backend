<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreatePsychologyResultsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::connection(env('DB_CONNECTION_PSYCHOLOGY'))->create('results', function (Blueprint $table) {
            $table->id();
            $table->timestamps();
            $table->softDeletes();

            $table->foreignId('answer_id')
                ->constrained('psychology.answers');

            $table->foreignId('question_id')
                ->constrained('psychology.questions');

            $table->foreignId('test_id')
                ->constrained('psychology.tests');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::connection(env('DB_CONNECTION_PSYCHOLOGY'))->dropIfExists('results');
    }
}
