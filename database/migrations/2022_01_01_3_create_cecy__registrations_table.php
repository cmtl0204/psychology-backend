<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCecyRegistrationsTable extends Migration
{
    public function up()
    {
        Schema::connection(env('DB_CONNECTION_CECY'))->create('registrations', function (Blueprint $table) {
            $table->id();
            $table->timestamps();
            $table->softDeletes();

            $table->foreignId('participant_id')
                ->nullable()
                ->comment('FK de tabla cecy.participants')
                ->constrained('cecy.participants');

            $table->foreignId('state_id')
                ->nullable()
                ->comment('Estado de la matrícula. Inscrito, en revisión, matriculado, anulado')
                ->constrained('cecy.catalogues');

                $table->foreignId('type_id')
                ->nullable()
                ->comment('')
                ->constrained('cecy.catalogues');

                $table->string('number')
                ->nullable()
                ->comment('Número de identificación de la matrícula');

                $table->date('registered_at')
                ->nullable()
                ->comment('Fecha de matrícula del participante');
        });
    }

    public function down()
    {
        Schema::connection(env('DB_CONNECTION_CECY'))->dropIfExists('registrations');
    }
}
