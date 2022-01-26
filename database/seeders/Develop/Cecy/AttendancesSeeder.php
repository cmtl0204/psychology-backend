<?php

namespace Database\Seeders\Cecy;

use App\Models\Cecy\Attendance;
use Illuminate\Database\Seeder;

class AttendancesSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        //CREAR AQUI LAS SEMILLAS PARA ATTENDANCE
        Attendance::factory(150)->create();
    }
}
