<?php

namespace Database\Seeders;

use Database\Seeders\Develop\AuthenticationSeeder;
use Database\Seeders\Develop\CoreSeeder;
use Database\Seeders\Develop\PsychologySeeder;

use Database\Seeders\Production\AuthenticationSeeder as AuthenticationSeederProd;
use Database\Seeders\Production\CoreSeeder as CoreSeederProd;
use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
        if (env('APP_ENV') === 'local') {
            $this->call([
                AuthenticationSeeder::class,
                CoreSeeder::class,
                PsychologySeeder::class
            ]);
        } else {
            $this->call([
                AuthenticationSeederProd::class,
                CoreSeederProd::class,
                PsychologySeeder::class
            ]);
        }
    }
}
