<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCecyParticipantsTable extends Migration
{
    public function up()
    {
        Schema::connection(env('DB_CONNECTION_CECY'))->create('participants', function (Blueprint $table) {
            $table->id();
            $table->timestamps();
            $table->softDeletes();

            $table->foreignId('additional_information_id')
                ->comment('Obtiene informacion adicional de un participante')
                ->constrained('cecy.additional_informations');

            $table->foreignId('person_type_id')
                ->comment('Obtiene el tipo de persona')
                ->constrained('cecy.person_types');

            $table->foreignId('state_id')
                ->comment('Obtiene el estado de un participante')
                ->constrained('core.states');

            $table->foreignId('user_id')
                ->comment('Obtiene la informacion de un usuario')
                ->constrained('authentication.users');
        });
    }

    public function down()
    {
        Schema::connection(env('DB_CONNECTION_CECY'))->dropIfExists('participants');
    }
}
