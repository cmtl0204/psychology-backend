<?php

namespace Database\Seeders\Develop\Cecy;

use App\Models\Cecy\Attendance;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class AttendancesSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $this->createAttendancesCatalogue();
        $this->createAttendances();
    }

    public function createAttendancesCatalogue()
    {
        //Campos que son de catalogo
    }
    public function createAttendances()
    {
        Attendance::factory(70)->create();
    }
}
