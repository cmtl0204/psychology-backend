<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateAuthenticationMenusTable extends Migration
{
    public function up()
    {
        Schema::connection(env('DB_CONNECTION'))->create('menus', function (Blueprint $table) {
            $table->id();
            $table->timestamps();
            $table->softDeletes();

            $table->foreignId('parent_id')
                ->nullable()
                ->comment('Un menu puede tener menus hijos')
                ->constrained('authentication.menus');

            $table->foreignId('role_id')
                ->nullable()
                ->comment('Un menu puede tener menus hijos')
                ->constrained('authentication.roles');

            $table->text('color')
                ->comment('color en hexadecimal')
                ->default('#9c9c9c');

            $table->text('description')
                ->nullable();

            $table->string('icon')
                ->nullable()
                ->comment('Icono de la libreria que se usa en el frontend');

            $table->string('label');

            $table->string('router_link')
                ->nullable();

            $table->string('type')
                ->nullable()
                ->comment('Para categorizar los menus');
        });
    }

    public function down()
    {
        Schema::connection(env('DB_CONNECTION'))->dropIfExists('menus');
    }
}
