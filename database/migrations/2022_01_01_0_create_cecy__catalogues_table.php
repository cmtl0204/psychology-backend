<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCecyCataloguesTable extends Migration
{
    public function up()
    {
        Schema::connection(env('DB_CONNECTION_CECY'))->create('catalogues', function (Blueprint $table) {
            $table->id();
            $table->timestamps();
            $table->softDeletes();

            $table->foreignId('parent_id')
                ->nullable()
                ->comment('Un catalogo puede tener catalogos hijos')
                ->constrained('cecy.catalogues');

            $table->string('code')
                ->comment('No debe ser modificado una vez que se lo crea');

            $table->text('description')
                ->nullable();

            $table->string('icon')
                ->nullable()
                ->comment('Icono de la libreria que se usa en el frontend');

            $table->text('name');

            $table->string('type')
                ->unique()
                ->comment('Para categorizar los catalogos');
        });
    }

    public function down()
    {
        Schema::connection(env('DB_CONNECTION_CECY'))->dropIfExists('catalogues');
    }
}
