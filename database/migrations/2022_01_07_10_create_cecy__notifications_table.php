<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCecyNotificationTable extends Migration
{
    public function up()
    {
        Schema::connection(env('DB_CONNECTION_CECY'))->create('notification', function (Blueprint $table) {
            $table->id();
            $table->timestamps();
            $table->softDeletes();

            $table->foreignId('user_receive_id')
            ->comment('Informacion del usuario')
            ->constrained('authentication.users');

            $table->foreignId('user_send_id')
            ->comment('Informacion del usuario')
            ->constrained('authentication.users');

            $table->foreignId('state_id')
                ->nullable()
                ->comment('Id del tema principal')
                ->constrained('cecy.catalogues');

            $table->string('activity_name')
                ->nullable()
                ->comment('Descripción del tema de la notificacion');
                
            $table->date('notification_date')
                ->nullable()
                ->comment('Fecha de la notificación');
        });
    }

    public function down()
    {
        Schema::connection(env('DB_CONNECTION_CECY'))->dropIfExists('notification');
    }
}
