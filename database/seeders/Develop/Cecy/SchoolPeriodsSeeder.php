<?php

namespace Database\Seeders\Cecy;

use Illuminate\Database\Seeder;
use App\Models\Cecy\SchoolPeriod;
use App\Models\Cecy\Catalogue;
use Illuminate\Support\Facades\DB;

class SchoolPeriodsSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $this->createSchoolPeriodsCatalogue();
        $this->createSchoolPeriods();
    }

    public function createSchoolPeriodsCatalogue()
    {
        //Campos que son de catalogo
        //state_id (hecho)
        $catalogues = json_decode(file_get_contents(storage_path() . "/catalogue.json"), true);
        Catalogue::factory()->sequence(
            [
                'code' => $catalogues['school_period_state']['current'],
                'name' => 'CURRENT',
                'type' => $catalogues['school_period_state']['type'],
            ],
            [
                'code' => $catalogues['school_period_state']['historical'],
                'name' => 'HISTORICAL',
                'type' => $catalogues['school_period_state']['type'],
            ],

        )->create();
    }
    public function createSchoolPeriods()
    {
        SchoolPeriod::factory()->create();
        DB::select("insert into cecy.school_periods(state_id, code, name,minimun_note, ended_at, started_at)VALUES('','2021-1','70','2021-04-01','2021-01-04')");
        DB::select("insert into cecy.school_periods(state_id, code, name,minimun_note, ended_at, started_at)VALUES('','2021-2','70','2021-04-01','2021-01-04')");
        DB::select("insert into cecy.school_periods(state_id, code, name,minimun_note, ended_at, started_at)VALUES('','2022-1','70','2021-04-01','2021-01-04')");
        DB::select("insert into cecy.school_periods(state_id, code, name,minimun_note, ended_at, started_at)VALUES('','2022-2','70','2021-04-01','2021-01-04')");
    }
}
