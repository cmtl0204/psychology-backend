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

            $table->foreignId('code_id')
                ->comment('Id del código')
                ->constrained('cecy.classrooms');

            $table->foreignId('state_id')
                ->nullable()
                ->comment('Estado si esta disponible o no disponible')
                ->constrained('cecy.classrooms');

            $table->integer('capacity')
                ->nullable()
                ->comment('Capacidad del aula a recibir');     

            $table->string('description')
                ->nullable()
                ->comment('Descripción del aula'); 
            
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
