<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCecyAuthoritiesTable extends Migration
{
    public function up()
    {
        Schema::connection(env('DB_CONNECTION_CECY'))->create('authorities', function (Blueprint $table) {
            $table->id();
            $table->timestamps();
            $table->softDeletes();

            $table->foreignId('intitution_id')
                ->nullable()
                ->comment('Una autoridad puede pertenecer a varias instituciones')
                ->constrained('core.institutions');

            $table->foreignId('user_id')
                ->comment('Informacion del usuario')
                ->constrained('authentication.users');

            $table->foreignId('state_id')
                ->comment('Estado de una autoridad')
                ->constrained('cecy.catalogues');

            $table->foreignId('position_id')
                ->comment('Cargo en el cecy')
                ->constrained('cecy.catalogues');

            $table->date('position_started_at')
                ->comment('Fecha de inicio de la gestion');

            $table->date('position_ended_at')
                ->comment('Fecha final de la gestion');
        });
    }

    public function down()
    {
        Schema::connection(env('DB_CONNECTION_CECY'))->dropIfExists('authorities');
    }
}
