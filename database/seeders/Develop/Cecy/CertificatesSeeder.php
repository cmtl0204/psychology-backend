<?php

namespace Database\Seeders\Cecy;

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
    }
}
