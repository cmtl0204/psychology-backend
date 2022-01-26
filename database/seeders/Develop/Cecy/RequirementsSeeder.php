<?php

namespace Database\Seeders\Cecy;

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
    }
    public function createRequirements()
    {
    }
}
