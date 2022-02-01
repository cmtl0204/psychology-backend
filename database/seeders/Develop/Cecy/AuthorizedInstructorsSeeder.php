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
        AuthorizedInstructors::factory()->create();
    }

}
