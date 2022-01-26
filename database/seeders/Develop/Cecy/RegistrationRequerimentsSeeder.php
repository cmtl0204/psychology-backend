<?php

namespace Database\Seeders\Cecy;

use App\Models\Cecy\Registration;
use App\Models\Cecy\RegistrationRequirement;
use App\Models\Cecy\Requirement;
use Illuminate\Database\Seeder;

class RegistrationRequerimentsSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $this->createRegistrationRequerimentsCatalogue();
        $this->createRegistrationRequeriments();
    }

    public function createRegistrationRequerimentsCatalogue()
    {
        //Campos que son de catalogo
    }
    public function createRegistrationRequeriments()
    {
        $registration = Registration::factory()->count(5)->create();
        $requirement = Requirement::factory()->count(5)->create();
        RegistrationRequirement::factory()
            ->count(10)
            ->for($registration)
            ->for($requirement)
            ->create();
    }
}
