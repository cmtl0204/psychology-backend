<?php

namespace Database\Seeders\Cecy;

use App\Models\Cecy\Attendance;
use App\Models\Cecy\Catalogue;
use App\Models\Cecy\DetailAttendance;
use App\Models\Cecy\Registration;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class DetailAttendancesSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $this->createDetailAttendances();
        $this->createDetailAttendancesCatalogue();
    }

    public function createDetailAttendancesCatalogue()
    {
        //Campos que son de catalogo
        //type_id
        $catalogues = json_decode(file_get_contents(storage_path() . "/catalogue.json"), true);
        Catalogue::factory()->sequence(
            [
                'code' => $catalogues['attendance']['present'],
                'name' => 'PRESENT',
                'type' => $catalogues['attendance']['type'],
            ],
            [
                'code' => $catalogues['attendance']['backwardness'],
                'name' => 'BACKWARDNESS',
                'type' => $catalogues['attendance']['type'],
            ],
            [
                'code' => $catalogues['attendance']['absent'],
                'name' => 'ABSENT',
                'type' => $catalogues['attendance']['type'],
            ],
        )->create();
    }
    public function createDetailAttendances()
    {
        DetailAttendance::factory(3500)->create();
    }
}
