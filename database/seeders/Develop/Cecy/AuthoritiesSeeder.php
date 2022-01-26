<?php

namespace Database\Seeders\Cecy;

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
    }
    public function createAuthoritiess()
    {
    }
}
