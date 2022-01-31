<?php

namespace Database\Seeders\Cecy;

use App\Models\Cecy\Instructor;
use Illuminate\Database\Seeder;
use Faker\Factory;

class CertificatesSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $this->createCertificatesCatalogue();
        $this->createCertificates();
        $faker = Factory::create();
        $certificates = [];
        for($i=0; $i<=14;$i++){
            $certificates[] = [
                'code'=> $faker->swiftBicNumber,
                'issued_at'=> $faker->dateTime()
            ];
        }
        
    }

    public function createCertificatesCatalogue()
    {
        //Campos que son de catalogo
        //state_id
    }

    public function createCertificates()
    {
        $instructors = Instructor::get();
        foreach ($instructors as $instructor) {
            foreach ($instructor->detailPlanifications as $detailPlanification) {
                echo $detailPlanification->pivot->id;
            }
        }
    }
}
