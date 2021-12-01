<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCoreCareersTable extends Migration
{
    public function up()
    {
        Schema::connection(env('DB_CONNECTION_CORE'))->create('careers', function (Blueprint $table) {
            $table->id();
            $table->timestamps();
            $table->softDeletes();

            $table->foreignId('institution_id')
                ->constrained('core.Institutions');

            $table->foreignId('modality_id')
                ->nullable()
                ->constrained('core.catalogues');

            $table->foreignId('type_id')
                ->nullable()
                ->constrained('core.catalogues');

            $table->string('acronym')
                ->nullable();

            $table->string('code')
                ->nullable();

            $table->text('description')
                ->nullable();

            $table->string('logo')
                ->nullable();

            $table->string('name');

            $table->string('resolution_number')
                ->nullable();

            $table->text('short_name')
                ->nullable();

            $table->string('title')
                ->nullable();
        });
    }

    public function down()
    {
        Schema::connection(env('DB_CONNECTION_CORE'))->dropIfExists('careers');
    }
}
