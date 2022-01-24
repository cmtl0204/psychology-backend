<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCecyNotificationsTable extends Migration
{
    public function up()
    {
        Schema::connection(env('DB_CONNECTION_CECY'))->create('notifications', function (Blueprint $table) {
            $table->id();
            $table->timestamps();
            $table->softDeletes();

            $table->foreignId('user_receive_id')
            ->comment('Informacion del usuario')
            ->constrained('authentication.users');

            $table->foreignId('user_send_id')
            ->comment('Informacion del usuario')
            ->constrained('authentication.users');

            // El comentario no corresponde -3
            $table->foreignId('state_id')
                ->comment('Id del tema principal')
                ->constrained('cecy.catalogues');

            $table->text('description')
                ->nullable('Descripción breve de la notificación')
                ->comment('Descripcion');

            $table->string('title')
                ->comment('Titulo del tema de la notificacion');
        });
    }

    public function down()
    {
        Schema::connection(env('DB_CONNECTION_CECY'))->dropIfExists('notifications');
    }
}
