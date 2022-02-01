<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCecyClassroomsTable extends Migration
{
    public function up()
    {
        Schema::connection(env('DB_CONNECTION_CECY'))->create('classrooms', function (Blueprint $table) {
            $table->id();
            $table->timestamps();
            $table->softDeletes();

            $table->foreignId('type_id')
                ->nullable()
                ->comment('Tipo de aula donde se va impartir el curso: Aula, Laboratorio, Oficina')
                ->constrained('cecy.catalogues');

            $table->text('description')
                ->nullable()
                ->comment('Descripción del aula');

            $table->integer('capacity')
                ->nullable()
                ->comment('Capacidad del aula a recibir');

            $table->string('code')
                ->nullable()
                ->comment('Código del aula');

            $table->string('name')
                ->nullable()
                ->comment('Nombre del aula');
        });
    }

    public function down()
    {
        Schema::connection(env('DB_CONNECTION_CECY'))->dropIfExists('classrooms');
    }
}
