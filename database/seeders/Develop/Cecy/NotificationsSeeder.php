<?php

namespace Database\Seeders\Cecy;

use Illuminate\Database\Seeder;

class NotificationsSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $this->createNotificationsCatalogue();
        $this->createNotifications();
    }

    public function createNotificationsCatalogue()
    {
        //Campos que son de catalogo
        //state_id
    }
    public function createNotifications()
    {
    }
}
