<?php

namespace Database\Seeders\Cecy;

use App\Models\Cecy\Instructor;
use Illuminate\Database\Seeder;

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
