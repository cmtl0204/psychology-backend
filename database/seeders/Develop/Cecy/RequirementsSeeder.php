<?php

namespace Database\Seeders\Develop\Cecy;

use App\Models\Cecy\Catalogue;
use App\Models\Cecy\Requirement;
use Faker\Factory as Faker;
use Illuminate\Database\Seeder;

class RequirementsSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $this->createRequirementsCatalogue();
        $this->createRequirements();
    }

    public function createRequirementsCatalogue()
    {
        //Campos que son de catalogo
        //state_id
        $catalogue = json_decode(file_get_contents(storage_path() . "/catalogue.json"), true);

        Catalogue::factory()->secuence(
            [
                'code' => $catalogue['requirement_state']['enabled'],
                'name' => 'Habilitado',
                'type' => $catalogue['requirement_state']['type'],
                'description' => 'Cuando el estado del requerimiento se encuentra habilitado'
            ],
            [
                'code' => $catalogue['requirement_state']['disabled'],
                'name' => 'Deshabilitado',
                'type' => $catalogue['requirement_state']['type'],
                'description' => 'Cuando el estado del requerimiento se encuentra deshabilitado'
            ],
        )->create();
    }
    public function createRequirements()
    {
        $faker = Faker::create();

        $states = Catalogue::where('type', 'REQUIREMENT_STATE')->get();

        Requirement::factory(3)->sequence(
            //Cedula
            [
                'state_id' => $faker->randomElement($states),
                'name' => 'Cedula',
                'required' => $faker->randomElement([true, false])
            ],
            [
                'state_id' => $faker->randomElement($states),
                'name' => 'Certificado de pago',
                'required' => $faker->randomElement([true, false])
            ],
            [
                'state_id' => $faker->randomElement($states),
                'name' => 'Certificado no adedudar',
                'required' => $faker->randomElement([true, false])
            ]
        )->create();
    }
}
