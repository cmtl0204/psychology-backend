<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCecyPhotographicRecordsTable extends Migration
{
    public function up()
    {
        Schema::connection(env('DB_CONNECTION_CECY'))->create('photografic_records', function (Blueprint $table) {
            $table->id();
            $table->timestamps();
            $table->softDeletes();

            // Creo que deberia ir el id de attendances
            $table->foreignId('detail_planification_id')
                ->constrained('cecy.detail_planifications');

            $table->string('description')
                ->comment('descripcion del curso');

            $table->integer('number_week')
                ->comment('numero de la semana que se impartio el curso');

            // Debe ir solo image o url
            $table->string('url_image')
                ->comment('direccion de la imagen(evidencia fotografica)');

            // Deberia ir registered_at
            $table->date('week_at')
                ->comment('fecha del dia que se guardo la evidencia fotografica');
        });
    }

    public function down()
    {
        Schema::connection(env('DB_CONNECTION_CECY'))->dropIfExists('photografic_records');
    }
}
