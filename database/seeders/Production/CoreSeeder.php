<?php

namespace Database\Seeders\Production;

use App\Models\Authentication\System;
use App\Models\Core\Career;
use App\Models\Core\Catalogue;
use App\Models\Core\Email;
use App\Models\Core\Institution;
use App\Models\Core\Location;
use App\Models\Authentication\Menu;
use App\Models\Core\Phone;
use App\Models\Authentication\User;
use App\Models\Core\State;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Spatie\Permission\Models\Permission;
use Spatie\Permission\Models\Role;

class CoreSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $this->createInstitutions();
        $this->createCareers();
    }

    private function createInstitutions()
    {
        Institution::factory(4)->sequence(
            [
                'code' => 'ABC1',
                'name' => 'INSTITUTO SUPERIOR TECNOLOGICO DE TURISMO Y PATRIMONIO YAVIRAC',
                'short_name' => 'YAVIRAC',
                'acronym' => 'ISTY'
            ],
            [
                'code' => 'ABC2',
                'name' => 'INSTITUTO SUPERIOR TECNOLOGICO BENITO JUAREZ',
                'short_name' => 'BENITO JUAREZ',
                'acronym' => 'ISTBJ'
            ],
            [
                'code' => 'ABC3',
                'name' => 'INSTITUTO SUPERIOR TECNOLOGICO GRAN COLOMBIA',
                'short_name' => 'GRAN COLOMBIA',
                'acronym' => 'ISTGC'
            ],
            [
                'code' => 'ABC4',
                'name' => 'INSTITUTO SUPERIOR TECNOLOGICO 24 DE MAYO',
                'short_name' => '24 DE MAYO',
                'acronym' => 'IST24M'
            ],
        )->create();
    }

    private function createCareers()
    {
        Career::factory(7)->sequence(
            [
                'institution_id' => 1,
                'name' => 'TECNOLOGIA SUPERIOR EN DESARROLLO DE SOFTWARE',
                'acronym' => 'DS'
            ],
            [
                'institution_id' => 1,
                'name' => 'TECNOLOGIA SUPERIOR EN MARKETING',
                'acronym' => 'MKT'
            ],
            [
                'institution_id' => 1,
                'name' => 'TECNOLOGIA EN MARKETING',
                'acronym' => 'MK'
            ],
            [
                'institution_id' => 1,
                'name' => 'DISEÑO DE MODAS CON NIVEL EQUIVALENTE A TECNOLOGIA SUPERIOR',
                'acronym' => 'DS'
            ],
            [
                'institution_id' => 1,
                'name' => 'TECNICO SUPERIOR EN ARTE CULINARIO ECUATORIANO',
                'acronym' => 'AC'
            ],
            [
                'institution_id' => 1,
                'name' => 'GUIA NACIONAL DE TURISMO CON NIVEL EQUIVALENTE A TECNOLOGIA SUPERIOR',
                'acronym' => 'GN'
            ],
            [
                'institution_id' => 1,
                'name' => 'TECNOLOGIA SUPERIOR EN CONTROL DE INCENDIOS Y OPERACIONES DE RESCATE',
                'acronym' => 'CIOR'
            ],
        )->create();

        Career::factory(1)->sequence(
            [
                'institution_id' => 2,
                'name' => 'TECNOLOGIA SUPERIOR EN DESARROLLO DE SOFTWARE',
                'acronym' => 'DS'
            ]
        )->create();

        Career::factory(1)->sequence(
            [
                'institution_id' => 3,
                'name' => 'DISEÑO DE MODAS CON NIVEL EQUIVALENTE A TECNOLOGIA SUPERIOR',
                'acronym' => 'DS'
            ]
        )->create();

        Career::factory(2)->sequence(
            [
                'institution_id' => 4,
                'name' => 'TECNOLOGIA SUPERIOR EN MARKETING',
                'acronym' => 'MKT'
            ],
            [
                'institution_id' => 4,
                'name' => 'TECNOLOGIA EN MARKETING',
                'acronym' => 'MK'
            ]
        )->create();
    }
}
