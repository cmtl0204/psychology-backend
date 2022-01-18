<?php
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCecyPhotograficRecordsTable extends Migration
{
    public function up()
    {
        Schema::connection(env('DB_CONNECTION_CECY'))->create('photografic_records', function (Blueprint $table) {
            $table->id();
            $table->timestamps();
            $table->softDeletes();

            $table->foreignId('detail_planification_id')
                ->constrained('cecy.detail_planifications');

            // Pendiente el tipo de datos si es entero, time
            $table->string('url_imagen')
                ->comment('direccion de la imagen(evidencia fotografica)');

            $table->string('description')
                ->comment('descripcion del curso');

            $table->integer('number_week')
                ->comment('numero de la semana que se impartio el curso');

            $table->date('week')
                ->comment('fecha del dia que se guardo la evidencia fotografica');
        });
    }

    public function down()
    {
        Schema::connection(env('DB_CONNECTION_CECY'))->dropIfExists('photografic_records');
    }
}
