<?php

namespace Database\Seeders\Cecy;

use App\Models\Cecy\DetailPlanification;
use App\Models\Cecy\Participant;
use App\Models\Cecy\Registration;
use App\Models\Cecy\RegistrationRequirement;
use Illuminate\Database\Seeder;

class RegistrationsSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $this->createRegistrationsCatalogue();
        $this->createRegistrations();
    }

    public function createRegistrationsCatalogue()
    {
        //Campos que son de catalogo
        //type_id
        //state_id
        //state_course_id
    }
    public function createRegistrations()
    {
        $participant = Participant::factory()->count(5)->create();
        $detailPlanification = DetailPlanification::factory()->count(5)->create();
        Registration::factory()
            ->count(10)
            ->has(RegistrationRequirement::factory()->count(10))
            ->for($participant)
            ->for($detailPlanification)
            ->create();
    }
}
