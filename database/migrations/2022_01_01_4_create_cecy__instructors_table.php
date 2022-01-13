<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCecyInstructorsTable extends Migration
{
    public function up()
    {
        Schema::connection(env('DB_CONNECTION_CECY'))->create('instructors', function (Blueprint $table) {
            $table->id();
            $table->timestamps();
            $table->softDeletes();

            $table->foreignId('user_id')
                ->nullable()
                ->comment('usuario de autenticación')
                ->constrained('authentication.users');

            $table->foreignId('state_id')
                ->nullable()
                ->comment('Estado de autoridad activo, inactivo')
                ->constrained('cecy.catalogues');

            $table->foreignId('type_id')
                ->nullable()
                ->comment('Un instructor puede ser de la setec o docente de la senescyt')
                ->constrained('cecy.catalogues');
        });
    }

    public function down()
    {
        Schema::connection(env('DB_CONNECTION_CECY'))->dropIfExists('instructors');
    }
}
