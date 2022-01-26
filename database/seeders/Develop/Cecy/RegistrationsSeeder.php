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
    //CREAR AQUI LAS SEMILLAS PARA REGISTRATIONS
    public function run()
    {
        $participant=Participant::factory()->count(5)->create();
        $detailPlanification=DetailPlanification::factory()->count(5)->create();
        Registration::factory()
        ->count(10)
        ->has(RegistrationRequirement::factory()->count(10))
        ->for($participant)
        ->for($detailPlanification)
        ->create();
    }
}
