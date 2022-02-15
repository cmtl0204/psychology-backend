<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreatePsychologyStatesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::connection(env('DB_CONNECTION_PSYCHOLOGY'))->create('states', function (Blueprint $table) {
            $table->id();
            $table->timestamps();
            $table->softDeletes();

            $table->string('code')
                ->nullable();

            $table->text('description')
                ->nullable();

            $table->string('name');

            $table->integer('order')
                ->unsigned();

            $table->boolean('state')
                ->default(true);

            $table->string('type');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::connection(env('DB_CONNECTION_PSYCHOLOGY'))->dropIfExists('states');
    }
}
