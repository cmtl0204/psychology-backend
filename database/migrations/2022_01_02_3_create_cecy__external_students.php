<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCecyNotificationsTable extends Migration
{
    public function up()
    {
        Schema::connection(env('DB_CONNECTION_CECY'))->create('external_students', function (Blueprint $table) {
            $table->id();
            $table->timestamps();
            $table->softDeletes();

            $table->date('birth_at')
                ->comment('Fecha de nacimiento');

            $table->foreignId('etnia_id')
                ->comment('Mestizo, Negro, Blanco')
                ->constrained('cecy.catalogues');

            $table->foreignId('gender_id')
                ->comment('Masculino, Femenino, Otro')
                ->constrained('cecy.catalogues');

            $table->foreignId('state_id')
                ->comment('Aprobado, Rechazo, Pendiente')
                ->constrained('cecy.catalogues');

            $table->boolean('discapacity')
                ->comment('Si posee discapacidad o no');

            $table->text('discapacity_description')
                ->nullable()
                ->comment('En el caso de tener discapacidad detalle que tipo de discapacidad');

            $table->string('email')
                ->comment('Correo electrónico del estudiante externo');

            $table->string('username')
                ->comment('Nombre de usuario del estudiante externo');

            $table->string('institute_condition')
                ->comment('Condición del estudiante en el instituto');

            $table->string('identification')
                ->comment('Número de cédula del estudiante externo');

            $table->string('lastname')
                ->comment('Apellidos de estudiante externo');

            $table->string('name')
                ->comment('Nombres de estudiante externo');

            $table->integer('age')
                ->comment('Edad del estudiante externo');

            $table->integer('nacionality')
                ->comment('Edad del estudiante externo');

            $table->text('adress')
                ->comment('Dirección del estudiante');

            $table->text('conventional_phone')
                ->comment('Teléfono convencional');

            $table->text('movil_phone')
                ->comment('Teléfono movil');
        });
    }

    public function down()
    {
        Schema::connection(env('DB_CONNECTION_CECY'))->dropIfExists('external_students');
    }
}
