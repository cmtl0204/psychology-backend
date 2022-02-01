<?php

namespace Database\Seeders\Cecy;

use App\Models\Cecy\SchoolPeriod;
use Illuminate\Database\Seeder;
use Faker\Factory;
use App\Models\Cecy\DetailSchoolPeriod;

class DetailSchoolPeriodsSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $this->createDetailSchoolPeriodsCatalogue();
        $this->createDetailSchoolPeriods();
    }

    public function createDetailSchoolPeriodsCatalogue()
    {
        //Campos que son de catalogo
    }
    public function createDetailSchoolPeriods()
    {
        $historicalSchoolPeriod = SchoolPeriod::firstWhere('code', '2021-1');
        $currentSchoolPeriod = SchoolPeriod::firstWhere('code', '2021-2');

        DetailSchoolPeriod::create(
            [
                'anulation_ended_at' => '2022-04-02',
                'anulation_started_at' => '2022-03-25',
                'especial_ended_at' => '2022-03-24',
                'especial_started_at' => '2022-03-17',
                'extraordinary_ended_at' => '2022-03-16',
                'extraordinary_started_at' => '2021-03-09',
                'ordinary_ended_at' => '2022-03-08',
                'ordinary_started_at' => '2022-03-01',
                'school_period_id' => $currentSchoolPeriod,
            ]
        );
        DetailSchoolPeriod::create(
            [
                'anulation_ended_at' => '2022-01-02',
                'anulation_started_at' => '2021-12-25',
                'especial_ended_at' => '2021-12-24',
                'especial_started_at' => '2021-12-17',
                'extraordinary_ended_at' => '2021-12-16',
                'extraordinary_started_at' => '2021-12-09',
                'ordinary_ended_at' => '2021-12-08',
                'ordinary_started_at' => '2021-12-01',
                'school_period_id' => $currentSchoolPeriod,
            ]
        );
        DetailSchoolPeriod::create(
            [
                'anulation_ended_at' => '2021-06-02',
                'anulation_started_at' => '2021-05-25',
                'especial_ended_at' => '2021-05-24',
                'especial_started_at' => '2021-05-17',
                'extraordinary_ended_at' => '2021-05-16',
                'extraordinary_started_at' => '2021-05-09',
                'ordinary_ended_at' => '2021-05-08',
                'ordinary_started_at' => '2021-05-01',
                'school_period_id' => $historicalSchoolPeriod,
            ]
        );
        DetailSchoolPeriod::create(
            [
                'anulation_ended_at' => '2021-04-02',
                'anulation_started_at' => '2021-03-25',
                'especial_ended_at' => '2021-03-24',
                'especial_started_at' => '2021-03-17',
                'extraordinary_ended_at' => '2021-03-16',
                'extraordinary_started_at' => '2021-03-09',
                'ordinary_ended_at' => '2021-03-08',
                'ordinary_started_at' => '2021-03-01',
                'school_period_id' => $historicalSchoolPeriod,
            ]
        );
        DetailSchoolPeriod::create(
            [
                'anulation_ended_at' => '2021-02-02',
                'anulation_started_at' => '2021-01-25',
                'especial_ended_at' => '2021-01-24',
                'especial_started_at' => '2021-01-17',
                'extraordinary_ended_at' => '2021-01-16',
                'extraordinary_started_at' => '2021-01-09',
                'ordinary_ended_at' => '2021-01-08',
                'ordinary_started_at' => '2021-01-01',
                'school_period_id' => $historicalSchoolPeriod,
            ]
        );
    }
}
