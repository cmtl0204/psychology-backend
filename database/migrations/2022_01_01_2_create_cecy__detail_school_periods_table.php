<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCecyDetailSchoolPeriodsTable extends Migration
{
    public function up()
    {
        Schema::connection(env('DB_CONNECTION_CECY'))->create('detail_school_periods', function (Blueprint $table) {
            $table->id();
            $table->timestamps();
            $table->softDeletes();

            $table->foreignId('school_period_id')
                ->comment('Id del periodo escolar')
                ->constrained('cecy.school_periods');

            $table->date('anulation_ended_at')
                ->nullable()
                ->comment('fecha de inicio de anulación de matrícula');

            $table->date('anulation_started_at')
                ->nullable()
                ->comment('fecha de fin de anulación de matrícula');

            $table->date('especial_ended_at')
                ->nullable()
                ->comment('fecha de finalización periodo especial');

            $table->date('especial_started_at')
                ->nullable()
                ->comment('fecha de inicio periodo especial');

            $table->date('extraordinary_ended_at')
                ->comment('fecha de finalización periodo extraordinario');

            $table->date('extraordinary_started_at')
                ->comment('fecha de inicio periodo extraordinario');

            $table->date('ordinary_ended_at')
                ->comment('fin del periodo ordinario');

            $table->date('ordinary_started_at')
                ->nullable()
                ->comment('Inicio del periodo ordinario');
        });
    }

    public function down()
    {
        Schema::connection(env('DB_CONNECTION_CECY'))->dropIfExists('detail_school_periods');
    }
}
