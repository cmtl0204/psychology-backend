<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCecyInstitutionsTable extends Migration
{
    public function up()
    {
        Schema::connection(env('DB_CONNECTION_CECY'))->create('cecy_institutions', function (Blueprint $table) {
            $table->id();
            $table->timestamps();
            $table->softDeletes();

            $table->string('code')
               ->nullable();
              
            $table->string('logo')
               ->comment('Logo de insitutcion');

            $table->string('name')
               ->comment('Nombre de la institucion');

            $table->text('slogan')
               ->comment('Slogan del instituto');

            $table->string('state_id')
               ->nullable();
        });
    }

    public function down()
    {
        Schema::connection(env('DB_CONNECTION_CECY'))->dropIfExists('cecy_institutions');
    }
}
