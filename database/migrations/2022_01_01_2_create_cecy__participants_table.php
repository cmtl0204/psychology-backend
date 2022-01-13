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
                ->comment('Informacion adicional que se relaciona con un participante.')
                ->constrained('cecy.additional_informations');

            $table->foreignId('person_type_id')
                ->comment('Obtiene el tipo de participante que se inscribe a un curso. ejemplo: externo, egresado, graduado')
                ->constrained('cecy.catalogues');

            $table->foreignId('user_id')
                ->comment('Información de un usuario que se relaciona a un participante de un curso')
                ->constrained('authentication.users');
        });
    }

    public function down()
    {
        Schema::connection(env('DB_CONNECTION_CECY'))->dropIfExists('participants');
    }
}
