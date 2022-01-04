<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCoreFilesTable extends Migration
{
    public function up()
    {
        Schema::connection(env('DB_CONNECTION_CORE'))->create('files', function (Blueprint $table) {
            $table->id();
            $table->timestamps();
            $table->softDeletes();

            $table->morphs('fileable');

            $table->text('description')
                ->nullable();

            $table->text('directory')
                ->nullable();

            $table->string('extension');

            $table->string('name');
        });
    }

    public function down()
    {
        Schema::connection(env('DB_CONNECTION_CORE'))->dropIfExists('files');
    }
}
