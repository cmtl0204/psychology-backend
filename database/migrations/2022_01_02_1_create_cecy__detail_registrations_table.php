<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCecyDetailRegistrationsTable extends Migration
{
    public function up()
    {
        Schema::connection(env('DB_CONNECTION'))->create('detail_registrations', function (Blueprint $table) {
            $table->id();
            $table->timestamps();
            $table->softDeletes();

            $table->foreignId('registration_id') 
                ->comment('Fk de la tabla matricula')
                ->constrained('cecy.registrations');


            $table->foreignId('detail_planification_id')
                ->comment('id del detalle de la planificacion')
                ->constrained('cecy.detail_planifications');

            $table->foreignId('state_id') 
                ->nullable()
                ->comment('id del estado')
                ->constrained('cecy.catalogues');

            $table->foreignId('status_id') 
                ->comment('Datos del proceso')
                ->constrained('app.status');

            $table->foreignId('status_certificate_id') 
                ->nullable()
                ->comment('Estado del Certificado')
                ->constrained('app.status');

            $table->string('final_grade')
                ->nullable()
                ->comment('nota final');
              

            $table->foreignId('certificate_withdrawn')
                ->nullable()
                ->comment('Retirar Certificado')
                ->constrained('core.files');

            $table->json('observation')
                ->comment('Observacion del estudiante');

            $table->foreignId('cedula_id')
                ->nullable()
                ->comment('Numero de cedula')
                ->constrained('core.files');

            $table->foreignId('paid_id')
                ->nullable()
                ->comment('Pago')
                ->constrained('core.files');

            $table->string('nota1')
                ->nullable()
                ->comment('Nota del primer parcial');
               

            $table->string('nota2')
                ->nullable()
                ->comment('Nota del segundo parcial');
                

            $table->string('nota3')
                ->nullable()
                ->comment('Nota del tercer parcial');
             

        });
    }

    public function down()
    {
        Schema::connection(env('DB_CONNECTION'))->dropIfExists('detail_registrations');
    }
}
