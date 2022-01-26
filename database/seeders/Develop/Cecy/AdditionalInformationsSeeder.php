<?php

namespace Database\Seeders\Cecy;

use Illuminate\Database\Seeder;

class AdditionalInformationsSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $this->createAdditionalInformationsCatalogue();
        $this->createAdditionalInformations();
    }

    public function createAdditionalInformationsCatalogue()
    {
        //Campos que son de catalogo
        //level_instruction_id
    }
    public function createAdditionalInformations()
    {
    }
}
