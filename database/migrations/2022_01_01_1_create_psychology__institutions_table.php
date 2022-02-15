<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreatePsychologyInstitutionsTable extends Migration
{
    public function up()
    {
        Schema::connection(env('DB_CONNECTION_PSYCHOLOGY'))->create('institutions', function (Blueprint $table) {
            $table->id();
            $table->timestamps();
            $table->softDeletes();

            $table->foreignId('address_id')
                ->nullable()
                ->constrained('core.address');

            $table->string('acronym')
                ->nullable();

            $table->string('code')
                ->unique()
                ->comment('Generado automaticamente por el acronym y el id ej: abc1');

            $table->string('denomination')
                ->nullable();

            $table->string('email')
                ->nullable()
                ->comment('correo electronico principal');

            $table->string('logo')
                ->nullable();

            $table->string('name');

            $table->string('phone')
                ->nullable();

            $table->string('short_name')
                ->unique();

            $table->text('slogan')
                ->nullable();

            $table->string('web')
                ->nullable();
        });
    }

    public function down()
    {
        Schema::connection(env('DB_CONNECTION_PSYCHOLOGY'))->dropIfExists('institutions');
    }
}
