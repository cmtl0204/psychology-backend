<?php

namespace Database\Seeders\Cecy;

use Illuminate\Database\Seeder;

class PrerequisitesSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $this->createPrerequisitesCatalogue();
        $this->createPrerequisites();
    }

    public function createPrerequisitesCatalogue()
    {
        //Campos que son de catalogo
    }
    public function createPrerequisites()
    {
    }
}
