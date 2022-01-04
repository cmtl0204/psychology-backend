<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCoreLocationsTable extends Migration
{
    public function up()
    {
        Schema::connection(env('DB_CONNECTION_CORE'))->create('locations', function (Blueprint $table) {
            $table->id();
            $table->timestamps();
            $table->softDeletes();

            $table->foreignId('parent_id')
                ->nullable()
                ->constrained('core.locations');

            $table->foreignId('type_id')
                ->nullable()
                ->constrained('core.catalogues');

            $table->string('alpha2_code')
                ->nullable();

            $table->string('alpha3_code')
                ->nullable();

            $table->string('calling_code')
                ->nullable();

            $table->string('capital')
                ->nullable();

            $table->string('code');

            $table->string('flag')
                ->nullable();

            $table->string('name');

            $table->string('region')
                ->nullable();

            $table->string('subregion')
                ->nullable();

            $table->json('timezones')
                ->nullable();

            $table->string('top_level_domain')
                ->nullable();
        });
    }

    public function down()
    {
        Schema::connection(env('DB_CONNECTION_CORE'))->dropIfExists('locations');
    }
}
