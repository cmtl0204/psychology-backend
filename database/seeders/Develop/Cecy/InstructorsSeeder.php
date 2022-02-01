<?php

namespace Database\Seeders\Develop\Cecy;

use App\Models\Cecy\Catalogue;
use App\Models\Cecy\Instructor;
use Faker\Factory;
use Illuminate\Database\Seeder;

class InstructorsSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $this->createInstructorsCatalogue();
        $this->createInstructors();
    }

    public function createInstructorsCatalogue()
    {
        //Campos que son de catalogo
        //type_id (hecho)
        //state_id (hecho)
        $catalogue = json_decode(file_get_contents(storage_path() . "/catalogue.json"), true);
        Catalogue::factory(5)->sequence(
            [
                'code' => $catalogue['instructor_state']['active'],
                'name' => 'Activo',
                'type' => $catalogue['instructor_state']['type'],
                'description' => 'Cuando un instructor se encuentra activo para impartir clases'
            ],
            [
                'code' => $catalogue['instructor_state']['inactive'],
                'name' => 'Inactivo',
                'type' => $catalogue['instructor_state']['type'],
                'description' => 'Cuando ya no es un instructor del cecy se retiro el docente, no califica entre otros'
            ],
            [
                'code' => $catalogue['instructor_type']['senescyt'],
                'name' => 'Senescyt',
                'type' => $catalogue['instructor_type']['type'],
                'description' => 'Cuando el instructor es parte de la Senescyt'
            ],
            [
                'code' => $catalogue['instructor_type']['setec'],
                'name' => 'Setec',
                'type' => $catalogue['instructor_type']['type'],
                'description' => 'Cuando un instructor es parte de la Setec'
            ],
            [
                'code' => $catalogue['instructor_type']['external'],
                'name' => 'Externo',
                'type' => $catalogue['instructor_type']['type'],
                'description' => 'Cuando un instructor es independiente o externo a la institución'
            ]
        )->create();
    }
    public function  createInstructors()
    {
        $faker = Factory::create();

        $states = Catalogue::where('type', 'INSTRUCTOR_STATE')->get();
        $types = Catalogue::where('type', 'INSTRUCTOR')->get();

        for ($i = 6; $i <= 35; $i++) {
            Instructor::factory()->create(
                [
                    'state_id' =>  $this->$faker->randomElement($states->id()),
                    'type_id' => $this->$faker->randomElement($types->id()),
                    'user_id' => $i
                ]
            )->create();
        }
    }
}
