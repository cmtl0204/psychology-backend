<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCecyInstitutionsTable extends Migration
{
   public function up()
   {
      Schema::connection(env('DB_CONNECTION_CECY'))->create('institutions', function (Blueprint $table) {
         $table->id();
         $table->timestamps();
         $table->softDeletes();

         $table->string('code')
            ->nullable()
            ->comment('codigo de institucion');

         $table->string('name')
            ->comment('Nombre de la institucion');

         $table->string('logo')
            ->comment('Logo de insitutcion');

         $table->text('slogan')
            ->comment('Slogan del instituto');
      });
   }

   public function down()
   {
      Schema::connection(env('DB_CONNECTION_CECY'))->dropIfExists('institutions');
   }
}
