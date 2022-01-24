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
                ->constrained('cecy.institutions');

            // No tiene relacion el campo con los ejemplos
            $table->foreignId('position_id')
                ->comment('Cargo en el cecy. activo, inactivo, vacaciones, permiso medico')
                ->constrained('cecy.catalogues');

            // Esta foreign key debe estar despues de state_id
            $table->foreignId('user_id')
                ->comment('Informacion del usuario')
                ->constrained('authentication.users');

            // Falta ejemplos -2
            $table->foreignId('state_id')
                ->comment('Estado de una autoridad')
                ->constrained('cecy.catalogues');

            $table->date('position_started_at')
                ->comment('Fecha de inicio de la gestion');

            $table->date('position_ended_at')
                ->comment('Fecha final de la gestion');

            // si no estoy mal firma electronica es electronic_signature
            $table->string('firm')
                ->comment('Código de la firma electrónica');
        });
    }

    public function down()
    {
        Schema::connection(env('DB_CONNECTION_CECY'))->dropIfExists('authorities');
    }
}
