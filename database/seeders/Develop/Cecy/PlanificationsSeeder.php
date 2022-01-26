<?php

namespace Database\Seeders\Cecy;

use App\Models\Cecy\Authority;
use App\Models\Cecy\Catalogue;
use App\Models\Cecy\Course;
use App\Models\Cecy\DetailSchoolPeriod;
use App\Models\Cecy\Instructor;
use App\Models\Cecy\Planification;
use Illuminate\Database\Seeder;
use Faker\Factory;

class PlanificationsSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $this->createPlanificationsCatalogue();
        $this->createPlanifications();
    }

    public function createPlanificationsCatalogue()
    {
        //Campos que son de catalogo
        //state_id
    }
    public function createPlanifications()
    {
        $faker = Factory::create();
        $courses = Course::all();
        $states = Catalogue::where('type', 'PLANIFICATION_STATE')->get();
        $cecy = Catalogue::where('code', 'CECY')->get();
        $ocs = Catalogue::where('code', 'REPRESENTATIVE_OCS')->get();
        $vicerectorposition = Catalogue::where('code', 'VICERECTOR')->get();
        $responsablesCecy = Authority::where('position_id', $cecy)->get();
        $responsablesOcs = Authority::where('position_id', $ocs)->get();
        $vicerectors = Authority::where('position_id', $vicerectorposition)->get();
        $responsablesCourse = Instructor::all();
        $detailSchoolPeriods = DetailSchoolPeriod::all();

        foreach ($courses as $course) {
            Planification::factory()->create(
                [
                    'course_id' => $course,
                    'detail_school_period_id' => $detailSchoolPeriods[rand(0, sizeof($detailSchoolPeriods) - 1)],
                    'vicerrector_id' => $vicerectors[rand(0, sizeof($vicerectors) - 1)],
                    'responsible_course_id' => $responsablesCourse[rand(0, sizeof($responsablesCourse) - 1)],
                    'responsible_ocs_id' => $responsablesOcs[rand(0, sizeof($responsablesOcs) - 1)],
                    'responsible_cecy_id' => $responsablesCecy[rand(0, sizeof($responsablesCecy) - 1)],
                    'state_id' => $states[rand(0, sizeof($states) - 1)],
                    'approved_at' => $faker->date(),
                    'code' => $faker->word(),
                    'ended_at' => $faker->date(),
                    'needs' => $faker->sentences(),
                    'observations' => $faker->sentences(),
                    'started_at' => $faker->date(),
                ]
            );
        }
    }
}
