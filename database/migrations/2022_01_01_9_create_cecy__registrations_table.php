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

            $table->foreignId('state_id')
                ->nullable()
                ->comment('')
                ->constrained('cecy.catalogues');

            $table->foreignId('type_id')
                ->nullable()
                ->comment('')
                ->constrained('cecy.catalogues');

            $table->number('number')
                ->comment('')
                ->default('#9c9c9c');

            $table->date('registered_at')
                ->comment('');
        });
    }

    public function down()
    {
        Schema::connection(env('DB_CONNECTION_CECY'))->dropIfExists('registrations');
    }
}
