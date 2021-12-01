<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateAuthenticationPersonalAccessTokensTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::connection(env('DB_CONNECTION'))->create('personal_access_tokens', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->timestamps();

            $table->morphs('tokenable');

            $table->text('abilities')
                ->nullable();

            $table->timestamp('last_used_at')
                ->nullable();

            $table->string('name');

            $table->string('token')
                ->unique();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::connection(env('DB_CONNECTION'))->dropIfExists('personal_access_tokens');
    }
}
