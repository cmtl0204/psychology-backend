<?php

namespace Database\Seeders\Cecy;

use App\Models\Cecy\Catalogue;
use App\Models\Cecy\Classroom;
use App\Models\Cecy\DetailPlanification;
use App\Models\Cecy\Planification;
use Illuminate\Database\Seeder;
use Faker\Factory;

class DetailPlanificationsSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $this->createDetailPlanificationsCatalogue();
        $this->createDetailPlanifications();
    }

    public function createDetailPlanificationsCatalogue()
    {
        $catalogue = json_decode(file_get_contents(storage_path() . "/catalogue.json"), true);

        //workdays
        Catalogue::create(
            [
                'code' => $catalogue['workday']['evening'],
                'name' => 'VESPERTINA',
                'type' => $catalogue['workday']['type'],
            ],
            [
                'code' => $catalogue['location']['morning'],
                'name' => 'MATUTINA',
                'type' => $catalogue['workday']['type'],
            ],
            [
                'code' => $catalogue['location']['nocturnal'],
                'name' => 'NOCTURNA',
                'type' => $catalogue['workday']['type'],
            ]
        );
        //paralels
        Catalogue::create(
            [
                'code' => $catalogue['parallel_name']['a'],
                'name' => 'A',
                'type' => $catalogue['parallel_name']['type'],
            ],
            [
                'code' => $catalogue['parallel_name']['b'],
                'name' => 'B',
                'type' => $catalogue['parallel_name']['type'],
            ]
        );
        //days
        Catalogue::create(
            [
                'code' => $catalogue['day']['monday-friday'],
                'name' => 'LUNES_VIERNES',
                'type' => $catalogue['day']['type'],
            ],
            [
                'code' => $catalogue['day']['monday-sunday'],
                'name' => 'LUNES_DOMINGO',
                'type' => $catalogue['day']['type'],
            ],
            [
                'code' => $catalogue['day']['sundays'],
                'name' => 'DOMINGOS',
                'type' => $catalogue['day']['type'],
            ],
            [
                'code' => $catalogue['day']['saturdays'],
                'name' => 'SABADOS',
                'type' => $catalogue['day']['type'],
            ]
        );
        //detail_planification_states
        Catalogue::create(
            [
                'code' => $catalogue['detail_planification_state']['to_be_approved'],
                'name' => 'POR APROBAR',
                'type' => $catalogue['detail_planification_state']['type'],
            ],
            [
                'code' => $catalogue['detail_planification_state']['culminated'],
                'name' => 'CULMINADO',
                'type' => $catalogue['detail_planification_state']['type'],
            ],
            [
                'code' => $catalogue['detail_planification_state']['in_process'],
                'name' => 'EN PROCESO',
                'type' => $catalogue['detail_planification_state']['type'],
            ],
            [
                'code' => $catalogue['detail_planification_state']['not_approved'],
                'name' => 'NO APROBADO',
                'type' => $catalogue['detail_planification_state']['type'],
            ],
            [
                'code' => $catalogue['detail_planification_state']['approved'],
                'name' => 'APROBADO',
                'type' => $catalogue['detail_planification_state']['type'],
            ]
        );
    }
    public function createDetailPlanifications()
    {
        $faker = Factory::create();
        $classrooms = Classroom::all();
        $days = Catalogue::where('type', 'DAY')->get();
        $workdays = Catalogue::where('type', 'WORKDAY')->get();
        $paralels = Catalogue::where('type', 'PARALLEL_NAME')->get();
        $states = Catalogue::where('type', 'DETAIL_PLANIFICATION_STATE')->get();
        $planifications = Planification::all();
        foreach ($planifications as $planification) {
            for ($i = 0; $i <= 1; $i++) {
                DetailPlanification::create(
                    [
                        'classroom_id' => $classrooms[rand(0, sizeof($classrooms) - 1)],
                        'day_id' => $days[rand(0, sizeof($days) - 1)],
                        'paralel_id' => $paralels[rand(0, sizeof($paralels) - 1)],
                        'planification_id' => $planification,
                        'workday_id' => $workdays[rand(0, sizeof($workdays) - 1)],
                        'state_id' => $states[rand(0, sizeof($states) - 1)],
                        'end_time' => $faker->$faker->time(),
                        'observations' => $faker->sentences(3),
                        'plan_ended_at' => $faker->date(),
                        'registrations_left' => $faker->randomDigit(),
                        'start_time' => $faker->time()
                    ]
                );
            }
        }
    }
}
