<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCecyRegistrationsTable extends Migration
{
    public function up()
    {
        Schema::connection(env('DB_CONNECTION_CECY'))->create('registrations', function (Blueprint $table) {
            $table->id();
            $table->timestamps();
            $table->softDeletes();

            $table->foreignId('participant_id')
                ->nullable()
                ->comment('')
                ->constrained('cecy.participants');

            $table->foreignId('type_id')
                ->nullable()
                ->comment('')
                ->constrained('cecy.catalogues');

            $table->string('number')
                ->comment('');

            $table->date('registered_at')
                ->comment('');
        });
    }

    public function down()
    {
        Schema::connection(env('DB_CONNECTION_CECY'))->dropIfExists('registrations');
    }
}
