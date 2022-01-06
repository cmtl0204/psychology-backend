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

            $table->date('started_at')
                ->comment('Fecha inicio');

            $table->date('ended_at')
                ->comment('Fecha final');

            $table->integer('day')
                ->comment('Número de día');

            $table->date('plan_ended_at')
                ->comment('');

            $table->integer('parallel')
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
