<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCecyDetailPlanificationsTable extends Migration
{
    public function up()
    {
        Schema::connection(env('DB_CONNECTION_CECY'))->create('detail_planifications', function (Blueprint $table) {
            $table->id();
            $table->timestamps();
            $table->softDeletes();

            $table->foreignId('state_id')
                ->nullable()
                ->comment('')
                ->constrained('cecy.catalogues');

            $table->foreignId('status_id')
                ->nullable()
                ->comment('Estado')
                ->constrained('cecy.catalogues');
                
            $table->foreignId('classroom_id')
                ->nullable()
                ->comment('Id aula')
                ->constrained('cecy.catalogues');
                
            $table->foreignId('day_id')
                ->nullable()
                ->comment('Id día')
                ->constrained('cecy.catalogues'); 
                
            $table->foreignId('start_time_id')
                ->nullable()
                ->comment('Id hora de inicio')
                ->constrained('cecy.catalogues');
                
            $table->foreignId('end_time_id')
                ->nullable()
                ->comment('Id hora final')
                ->constrained('cecy.catalogues');    

            $table->string('code_certified')
                ->comment('Código del certificado');
            
            $table->date('date_start_at')
                ->comment('Fecha inicio');

            $table->date('date_end_at')
                ->comment('Fecha final');

            $table->integer('nro_day')
                ->comment('Número de día');    
                
            $table->date('planned_end_date_at')
                ->comment('');

            $table->integer('paralel')
                ->comment('Paralelo');
                
            $table->string('state_certified')
                ->comment('Estado del certificado');     
                
            $table->integer('workday')
                ->comment('Días trabajados');
       
        });
    }

    public function down()
    {
        Schema::connection(env('DB_CONNECTION_CECY'))->dropIfExists('detail_planifications');
    }
}
