<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreatePsychologyTestsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::connection(env('DB_CONNECTION_PSYCHOLOGY'))->create('tests', function (Blueprint $table) {
            $table->id();
            $table->timestamps();
            $table->softDeletes();

            $table->foreignId('canton_id')
                ->constrained('core.locations');

            $table->foreignId('priority_id')
                ->nullable()
                ->constrained('psychology.priorities');

            $table->foreignId('province_id')
                ->constrained('core.locations');

            $table->foreignId('state_id')
                ->constrained('psychology.states');

            $table->foreignId('user_id')
                ->constrained('authentication.users');

            $table->integer('age');

            $table->string('code');

            $table->boolean('terms_conditions');

            $table->enum('type', ['phq9a', 'psc17']);
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::connection(env('DB_CONNECTION_PSYCHOLOGY'))->dropIfExists('tests');
    }
}
