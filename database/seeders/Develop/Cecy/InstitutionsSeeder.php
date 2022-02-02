<?php

namespace Database\Seeders\Develop\Cecy;

use App\Models\Cecy\Institution;
use Illuminate\Database\Seeder;

class InstitutionsSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $this->createInstitutionsCatalogue();
        $this->createInstitutions();
    }
    public function createInstitutionsCatalogue()
    {
        //Campos que son de catalogo
    }
    public function createInstitutions()
    {
        Institution::factory(1)->sequence(
            [
                'code' => 'CECY2022',
                'name' => 'CENTRO DE FORMACIÓN INTEGRAL y SERVICIOS ESPECIALZADOS YAVIRAC',
                'logo' => 'CECY',
                'slogan' => 'Formando profesionales'
            ]
        )->create();
    }
}
