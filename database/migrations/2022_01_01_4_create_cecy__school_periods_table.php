<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCecySchoolPeriodsTable extends Migration
{
    public function up()
    {
        Schema::connection(env('DB_CONNECTION_CECY'))->create('school_periods', function (Blueprint $table) {
            $table->id();
            $table->timestamps();
            $table->softDeletes();

            $table->string('code')->unique()
                ->comment('codigo unico de periodos lectivos');
            
            $table->date('end_date_at')
                ->nullable()
                ->comment('dia final del perido lectivo');

            $table->date('especial_end_date_at')
                ->nullable()
                ->comment('');

            $table->date('especial_start_date_at')
                ->nullable()
                ->comment('');

            $table->date('extraordinary_end_date_at')
                ->nullable()
                ->comment('Para obtener el codido de pais');

            $table->date('extraordinary_start_date_at')
                ->nullable()
                ->comment('Para obtener el codido de pais');

            $table->string('name')
                ->comment('nombre del periodo lectivo');

            $table->date('ordinary_end_date_at')
                ->nullable()
                ->comment('fin del periodo lectivo');

            $table->date('ordinary_state_date_at')
                ->nullable()
                ->comment('');

            $table->date('start_date')
                ->nullable()
                ->comment('');

            
        });
    }

    public function down()
    {
        Schema::connection(env('DB_CONNECTION_CECY'))->dropIfExists('school_periods');
    }
}
