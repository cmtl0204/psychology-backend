<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCecyRequirementsTable extends Migration
{
    public function up()
    {
        Schema::connection(env('DB_CONNECTION_CECY'))->create('requirements', function (Blueprint $table) {
            $table->id();
            $table->timestamps();
            $table->softDeletes();

            $table->foreignId('state_id')
                ->nullable()
                ->comment('Estado habilitado o inhabilitado')
                ->constrained('cecy.catalogues');

            $table->string('name')
                ->nullable()
                ->comment('Nombr del campo -> copia cedula, comprobante de pago');

            // El campo debe ser boolenao -2
            $table->string('required')
                ->nullable()
                ->comment('determina el requerimiento del campo true-> es requerido, false-> no es requerido');
        });
    }

    public function down()
    {
        Schema::connection(env('DB_CONNECTION_CECY'))->dropIfExists('requirements');
    }
}
