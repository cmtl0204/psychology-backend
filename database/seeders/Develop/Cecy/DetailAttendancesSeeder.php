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
       $this->createDetailAttendance();
       $this->createTypeAttendance();
    }

    public function createTypeAttendance()
    {
        $catalogues = json_decode(file_get_contents(storage_path() . "/catalogue.json"), true);
        Catalogue::factory()->sequence(
            [
                'code' => $catalogues['catalogue']['type_attendace']['present'],
                'name' => 'PRESENT',
                'type' => $catalogues['catalogue']['type_attendace']['type'],
            ],
            [
                'code' => $catalogues['catalogue']['type_attendace']['backwardness'],
                'name' => 'BACKWARDNESS',
                'type' => $catalogues['catalogue']['type_attendace']['type'],
            ],
            [
                'code' => $catalogues['catalogue']['type_attendace']['absent'],
                'name' => 'ABSENT',
                'type' => $catalogues['catalogue']['type_attendace']['type'],
            ],
        )->create();
    }
    public function createDetailAttendance()
    {
        DetailAttendance::factory(50)->create();
    }
}
