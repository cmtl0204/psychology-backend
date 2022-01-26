<?php

namespace Database\Seeders\Cecy;

use Illuminate\Database\Seeder;

class AuthorizedInstructorsSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $this->createAuthorizedInstructorsCatalogue();
        $this->createAuthorizedInstructors();
    }

    public function createAuthorizedInstructorsCatalogue()
    {
        //Campos que son de catalogo
    }
    public function createAuthorizedInstructors()
    {
    }
}
