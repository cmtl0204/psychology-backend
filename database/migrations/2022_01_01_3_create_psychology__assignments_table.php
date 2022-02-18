<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreatePsychologyAssignmentsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::connection(env('DB_CONNECTION_PSYCHOLOGY'))
            ->create('assignments', function (Blueprint $table) {
                $table->id();
                $table->timestamps();
                $table->softDeletes();

                $table->foreignId('institution_id')
                    ->constrained('psychology.institutions');

                $table->foreignId('test_id')
                    ->constrained('psychology.tests');

                $table->date('ended_at')
                ->nullable();

                $table->json('observations')
                    ->nullable();

                $table->date('started_at')
                    ->nullable();
            });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::connection(env('DB_CONNECTION_PSYCHOLOGY'))->dropIfExists('assignments');
    }
}
