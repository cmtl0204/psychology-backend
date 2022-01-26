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
        //CREAR AQUI LAS SEMILLAS PARA DETAILATTENDANCE
        DB::statement("SET foreign_key_checks=0");
        DB::table('attendances')->truncate();
        DB::table('registrations')->truncate();
        DB::table('catalogues')->truncate();
        Attendance::truncate();
        Registration::truncate();
        DB::statement("SET foreign_key_checks=1");

        //ejemplo con inserts
        $this->createDetailAttendances();
        $this->createDetailAttendancesCatalogue();
    }

    public function createDetailAttendancesCatalogue()
    {
        $catalogues = json_decode(file_get_contents(storage_path() . "/catalogue.json"), true);
        Catalogue::factory()->sequence(
            [
                'code' => $catalogues['catalogue']['attendance']['present'],
                'name' => 'PRESENT',
                'type' => $catalogues['catalogue']['attendance']['type'],
            ],
            [
                'code' => $catalogues['catalogue']['attendance']['backwardness'],
                'name' => 'BACKWARDNESS',
                'type' => $catalogues['catalogue']['attendance']['type'],
            ],
            [
                'code' => $catalogues['catalogue']['attendance']['absent'],
                'name' => 'ABSENT',
                'type' => $catalogues['catalogue']['attendance']['type'],
            ],
        )->create();
    }
    public function createDetailAttendances()
    {
        DetailAttendance::factory(50)->create();
    }
}
