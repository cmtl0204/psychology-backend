<?php

namespace Database\Seeders\Develop\Cecy;

use App\Models\Cecy\Authority;
use App\Models\Cecy\Catalogue;
use App\Models\Cecy\Course;
use App\Models\Cecy\DetailSchoolPeriod;
use App\Models\Cecy\Instructor;
use App\Models\Cecy\Planification;
use App\Models\Core\State;
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
        $catalogue = json_decode(file_get_contents(storage_path() . "/catalogue.json"), true);
        //Campos que son de catalogo
        //state_id
        Catalogue::factory()->secuence(
            [
                'code' => State::TO_BE_APPROVED,
                'name' => 'POR APROBADO',
                'type' => $catalogue['planification_state']['type'],
                'description' => 'Falta poner una descripción'
            ],
            [
                'code' => State::COMPLETED,
                'name' => 'COMPLETADO',
                'type' => $catalogue['planification_state']['type'],
                'description' => 'Falta poner una descripción'
            ],
            [
                'code' => State::IN_PROCESS,
                'name' => 'EN PROCESO',
                'type' => $catalogue['planification_state']['type'],
                'description' => 'Falta poner una descripción'
            ],
            [
                'code' => State::NOT_APPROVED,
                'name' => 'NO APROBADO',
                'type' => $catalogue['planification_state']['type'],
                'description' => 'Falta poner una descripción'
            ],
            [
                'code' => State::APPROVED,
                'name' => 'APROBADO',
                'type' => $catalogue['planification_state']['type'],
                'description' => 'Falta poner una descripción'
            ]
        )->create();
    }
    public function createPlanifications()
    {
        $faker = Factory::create();
        $courses = Course::all();
        $culminatedState = Catalogue::where('code', State::CULMINATED)->get();
        $approvedState = Catalogue::where('code', State::APPROVED)->get();
        $cecy = Catalogue::where('code', 'CECY')->get();
        $ocs = Catalogue::where('code', 'REPRESENTATIVE_OCS')->get();
        $vicerectorposition = Catalogue::where('code', 'VICERECTOR')->get();
        $responsableCecy = Authority::where('position_id', $cecy)->get();
        $responsableOcs = Authority::where('position_id', $ocs)->get();
        $vicerector = Authority::where('position_id', $vicerectorposition)->get();
        $responsablesCourse = Instructor::all();
        $detailSchoolPeriods = DetailSchoolPeriod::all();

        for ($i = 1; $i < 6; $i++) {
            $schoolPeriod = $detailSchoolPeriods[$i]->schoolPeriod();
            $state = $schoolPeriod->state();
            $planificationState =  $approvedState;
            
            if ($state->code === State::HISTORICAL) {
                $planificationState =  $culminatedState;
            }

            Planification::create(
                [
                    'course_id' => $courses[$i],
                    'detail_school_period_id' => $detailSchoolPeriods[$i],
                    'vicerector_id' => $vicerector->id(),
                    'responsible_course_id' => $responsablesCourse[rand(0, sizeof($responsablesCourse) - 1)],
                    'responsible_ocs_id' => $responsableOcs->id(),
                    'responsible_cecy_id' => $responsableCecy->id(),
                    'state_id' => $planificationState->id,
                    'approved_at' => $faker->date(),
                    'code' => $faker->word(),
                    'ended_at' => $faker->date('+2 months', '+3 months'),
                    'needs' => json_encode(["necesidad_1" => $faker->sentences(), "necesidad_2" => $faker->sentences()]),
                    'observations' => json_encode(["observación_1" => $faker->sentences(), "observación_2" => $faker->sentences()]),
                    'started_at' => $faker->dateTimeBetween('-1 months', '+1 months'),
                ]
            );
        }
    }
}
