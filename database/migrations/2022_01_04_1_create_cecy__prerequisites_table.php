<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCecyPrerequisitesTable extends Migration
{
    public function up()
    {
        Schema::connection(env('DB_CONNECTION_CECY'))->create('prerequisites', function (Blueprint $table) {
            $table->id();
            $table->timestamps();
            $table->softDeletes();

            $table->foreignId('course_id')
                ->nullable()
                ->constrained('cecy.courses');

            $table->foreignId('parent_id')
                ->nullable()
                ->comment('Un catalogo puede tener catalogos hijos')
                ->constrained('cecy.catalogues');

            $table->foreignId('state_id')
                ->nullable()
                ->comment('Un catalogo puede tener catalogos hijos')
                ->constrained('cecy.catalogues');

        });
    }

    public function down()
    {
        Schema::connection(env('DB_CONNECTION_CECY'))->dropIfExists('prerequisites');
    }
}
