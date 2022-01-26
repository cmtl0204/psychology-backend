<?php

namespace Database\Seeders\Cecy;

use App\Models\Cecy\Attendance;
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
    }
}
