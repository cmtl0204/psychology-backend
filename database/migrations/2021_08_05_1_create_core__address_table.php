<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCoreAddressTable extends Migration
{
    public function up()
    {
        Schema::connection(env('DB_CONNECTION_CORE'))->create('address', function (Blueprint $table) {
            $table->id();
            $table->timestamps();
            $table->softDeletes();

            $table->foreignId('location_id')
                ->constrained('core.locations');

            $table->foreignId('sector_id')
                ->constrained('core.catalogues');

            $table->double('latitude')
                ->nullable();

            $table->double('longitude')
                ->nullable();

            $table->string('main_street');

            $table->string('secondary_street');

            $table->string('number')
                ->nullable()
                ->comment('número de casa');

            $table->string('post_code')
                ->nullable()
                ->comment('código postal');

            $table->text('reference')
                ->nullable();
        });
    }

    public function down()
    {
        Schema::connection(env('DB_CONNECTION_CORE'))->dropIfExists('address');
    }

}
