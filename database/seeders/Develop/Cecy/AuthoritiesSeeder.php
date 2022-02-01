<?php

namespace Database\Seeders\Develop\Cecy;

use App\Models\Cecy\Authority;
use App\Models\Cecy\Catalogue;
use App\Models\Cecy\Institution;
use Faker\Factory;
use Illuminate\Database\Seeder;

class AuthoritiesSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $this->createAuthoritiesCatalogue();
        $this->createAuthoritiess();
    }

    public function createAuthoritiesCatalogue()
    {
        //Campos que son de catalogo
        //state_id
        //position_id
        $catalogue = json_decode(file_get_contents(storage_path() . "/catalogue.json"), true);
        Catalogue::factory(9)->sequence(
            [
                'code' => $catalogue['authority_state']['on_vocation'],
                'name' => 'Vacaciones',
                'type' => $catalogue['authority_state']['type'],
                'description' => 'Cuando una autoridad se encuentra de vacaciones'
            ],
            [
                'code' => $catalogue['authority_state']['medical_consent'],
                'name' => 'Permiso médico',
                'type' => $catalogue['authority_state']['type'],
                'description' => 'Cuando una autoridad se encuentra con permiso médico'
            ],
            [
                'code' => $catalogue['authority_state']['active'],
                'name' => 'Activo',
                'type' => $catalogue['authority_state']['type'],
                'description' => 'Cuando una autoridad se encuentra actualmente activa'
            ],
            [
                'code' => $catalogue['authority_state']['inactive'],
                'name' => 'Inactivo',
                'type' => $catalogue['authority_state']['type'],
                'description' => 'Cuando una autoridad se encuentra actualmente inactiva'
            ],
            [
                'code' => $catalogue['position']['rector'],
                'name' => 'Rector',
                'type' => $catalogue['position']['type'],
                'description' => 'Cuando la autoridad es el Rector'
            ],
            [
                'code' => $catalogue['position']['vicerector'],
                'name' => 'Vicerector',
                'type' => $catalogue['position']['type'],
                'description' => 'Cuando la autoridad es el Vicerrector'
            ],
            [
                'code' => $catalogue['position']['representative_ocs'],
                'name' => 'Represetante OCS',
                'type' => $catalogue['position']['type'],
                'description' => 'Cuando la autoridad es el representante del OCS'
            ],
            [
                'code' => $catalogue['position']['logistics'],
                'name' => 'Logistica',
                'type' => $catalogue['position']['type'],
                'description' => 'Cuando la autoridad es parte de logística'
            ],
            [
                'code' => $catalogue['position']['cecy'],
                'name' => 'Cecy',
                'type' => $catalogue['position']['type'],
                'description' => 'Cuando la autoridad es el reponsable del CECY'
            ]
        )->create();
    }
    public function createAuthoritiess()
    {
        $catalogue = json_decode(file_get_contents(storage_path() . "/catalogue.json"), true);
        $faker = Factory::create();

        $institutions = Institution::get();
        $position_rector = Catalogue::where('code', $catalogue['position']['rector']);
        $position_vicerector = Catalogue::where('code', $catalogue['position']['vicerector']);
        $position_representative_ocs = Catalogue::where('code', $catalogue['position']['representative_ocs']);
        $position_cecy = Catalogue::where('code', $catalogue['position']['cecy']);
        $state = Catalogue::where('code', $catalogue['authority_state']['active']);

        Authority::factory(4)->sequence(
            //RECTOR
            [
                'intitution_id' => $this->$faker->randomElement($institutions),
                'position_id' => $position_rector->id(),
                'state_id' => $state,
                'user_id' => 2,
                'position_started_at' => $this->$faker->dateTimeBetween('-1 months', '+1 months'),
                'position_ended_at' => $this->$faker->dateTimeBetween('+2 months', '+3 months'),
                'electronic_signature' => $this->$faker->text()
            ],
            //VICERECTOR
            [
                'intitution_id' => $this->$faker->randomElement($institutions),
                'position_id' => $position_vicerector->id(),
                'state_id' => $state,
                'user_id' => 3,
                'position_started_at' => $this->$faker->dateTimeBetween('-1 months', '+1 months'),
                'position_ended_at' => $this->$faker->dateTimeBetween('+2 months', '+3 months'),
                'electronic_signature' => $this->$faker->text()
            ],
            //REPRESENTANTE_OCS
            [
                'intitution_id' => $this->$faker->randomElement($institutions),
                'position_id' => $position_representative_ocs->id(),
                'state_id' => $state,
                'user_id' => 4,
                'position_started_at' => $this->$faker->dateTimeBetween('-1 months', '+1 months'),
                'position_ended_at' => $this->$faker->dateTimeBetween('+2 months', '+3 months'),
                'electronic_signature' => $this->$faker->text()
            ],
            //REPRESENTANTE CECY
            [
                'intitution_id' => $this->$faker->randomElement($institutions),
                'position_id' => $position_cecy->id(),
                'state_id' => $state,
                'user_id' => 5,
                'position_started_at' => $this->$faker->dateTimeBetween('-1 months', '+1 months'),
                'position_ended_at' => $this->$faker->dateTimeBetween('+2 months', '+3 months'),
                'electronic_signature' => $this->$faker->text()
            ],
        )->create();
    }
}
