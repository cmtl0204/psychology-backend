<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCorePhonesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::connection(env('DB_CONNECTION_CORE'))->create('phones', function (Blueprint $table) {
            $table->id();
            $table->timestamps();
            $table->softDeletes();

            $table->morphs('phoneable');

            $table->foreignId('location_id')
                ->nullable()
                ->comment('Para obtener el codido de pais')
                ->constrained('core.locations');

            $table->foreignId('operator_id')
                ->nullable()
                ->comment('CNT, MOVISTAR, CLARO')
                ->constrained('core.catalogues');

            $table->foreignId('type_id')
                ->nullable()
                ->comment('Celular, convencional, fax')
                ->constrained('core.catalogues');

            $table->string('number');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::connection(env('DB_CONNECTION_CORE'))->dropIfExists('phones');
    }
}
