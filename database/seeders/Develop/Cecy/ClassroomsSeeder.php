<?php

namespace Database\Seeders\Cecy;

use App\Models\Cecy\Catalogue;
use App\Models\Cecy\Classrooms;
use Illuminate\Database\Seeder;
//use Illuminate\Support\Facades\DB;

class ClassroomsSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        //CREAR AQUI LAS SEMILLAS PARA ClLASSROOMS

        $this->createTypeClassrooms();
        $this->createClassrooms();

    }
    public function createTypeClassrooms()
    {
        $catalogues = json_decode(file_get_contents(storage_path() . "/catalogue.json"), true);
        Catalogue::factory(3)->sequence(
            [
                'code' => $catalogues['catalogue']['classroom_type']['office'],
                'name' => 'OFFICE',
                'type' => $catalogues['catalogue']['classroom_type']['type'],
                'description' => 'oficina donde se van hacer practicas del curso'

            ],
            [
                'code' => $catalogues['catalogue']['classroom_type']['classroom_class'],
                'name' => 'CLASSROOM_CLASS',
                'type' => $catalogues['catalogue']['classroom_type']['type'],
                'description' => 'Aula de clase donde se van hacer practicas del curso'

            ],
            [
                'code' => $catalogues['catalogue']['classroom_type']['laboratory'],
                'name' => 'LABORATORY',
                'type' => $catalogues['catalogue']['classroom_type']['type'],
                'description' => 'Laboratorio donde se van hacer practicas del curso'

            ],
        )->create();
    }

    public  function createClassrooms()
    {
        Classrooms::factory(10)->create();
        
        /* DB::select("insert into cecy.classroom(state_id, description, capacity, code, name)VALUES('','Este aula esta en el edificio del Yavirac','40','A001','Aula1')");
        DB::select("insert into cecy.classroom(state_id, description, capacity, code, name)VALUES('','Este aula esta en el cenepa','20','A002','Aula2')");
        DB::select("insert into cecy.classroom(state_id, description, capacity, code, name)VALUES('','Este laboratorio esta en el cenepa','30','L001','Laboratorio1')");
        DB::select("insert into cecy.classroom(state_id, description, capacity, code, name)VALUES('','Este laboratorio esta en el cenepa','20','L002','Laboratorio2')");
        DB::select("insert into cecy.classroom(state_id, description, capacity, code, name)VALUES('','Este aula esta en el edificio del Yavirac','10','A003','Aula3')");
        DB::select("insert into cecy.classroom(state_id, description, capacity, code, name)VALUES('','Este aula esta en el edificio del Yavirac','80','A004','Aula4')");
        DB::select("insert into cecy.classroom(state_id, description, capacity, code, name)VALUES('','Este laboratorio esta en el edificio del Yavirac','20','L003','Laboratorio3')");
        DB::select("insert into cecy.classroom(state_id, description, capacity, code, name)VALUES('','Este laboratorio esta en el edificio del Yavirac','10','L004','Laboratorio4')");
        DB::select("insert into cecy.classroom(state_id, description, capacity, code, name)VALUES('','Esta oficina esta en el edificio del Yavirac','30','O001','Oficina1')");
        DB::select("insert into cecy.classroom(state_id, description, capacity, code, name)VALUES('','Esta oficina esta en el edificio del Yavirac','30','O002','Oficina2')"); */

    }
}
