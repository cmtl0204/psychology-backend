<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCecySchoolPeriodsTable extends Migration
{
    public function up()
    {
        Schema::connection(env('DB_CONNECTION_CECY'))->create('school_periods', function (Blueprint $table) {
            $table->id();
            $table->timestamps();
            $table->softDeletes();

            $table->foreignId('state_id')
                ->nullable()
                ->comment('estado del periodo lectivo ej: actual, antiguo')
                ->constrained('cecy.catalogues');

            $table->string('code')->unique()
                ->comment('codigo unico de periodos lectivos ej: 2021-2022');

            $table->date('ended_at')
                ->comment('Fecha de finalización del perido lectivo');

            $table->integer('minimum_note')
                ->comment('minimo de nota para aprovar los cursos');

            $table->string('name')
                ->comment('nombre del periodo lectivo');


            $table->date('started_at')
                ->comment('Fecha de inicio del perido lectivo');
        });
    }

    public function down()
    {
        Schema::connection(env('DB_CONNECTION_CECY'))->dropIfExists('school_periods');
    }
}
