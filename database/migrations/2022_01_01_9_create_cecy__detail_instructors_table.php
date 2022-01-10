<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCecyDetailInstructorsTable extends Migration
{
    public function up()
    {
        Schema::connection(env('DB_CONNECTION_CECY'))->create('detail_instructors', function (Blueprint $table) {
            $table->id();
            $table->timestamps();
            $table->softDeletes();

            $table->foreignId('instructor_id')
                ->nullable()
                ->comment('trae toda la informacion de la tabla instructor')
                ->constrained('cecy.instructors');

            $table->foreignId('detail_planification_id')
                ->nullable()
                ->comment('trae la informacion del detail_planification')
                ->constrained('cecy.detail_planifications');

            $table->foreignId('state_certified')
                ->nullable()
                ->comment('Estado del certificado')
                ->constrained('cecy.catalogues');

/*             $table->string('state_certified')
                ->comment('Estado del certificado'); */

            $table->string('code_certified')
                ->comment('Código del certificado');
        });
    }

    public function down()
    {
        Schema::connection(env('DB_CONNECTION_CECY'))->dropIfExists('detail_instructors');
    }
}
