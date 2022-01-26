<?php

namespace Database\Seeders\Cecy;

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
        //CREAR AQUI LAS SEMILLAS PARA ATTENDANCE
        Attendance::factory(150)->create();

        //ejemplo con insert
        $this->createDetailAttendance();

    }
    public function createDetailAttendance()
    {
        DB::select("insert into cecy.attendances(detail_planification_id, duration, registered_at)
                                VALUES('El id del detalle planficiacion de un curso','duracion de la clase','fecha de la asistencia')");
    }
}
