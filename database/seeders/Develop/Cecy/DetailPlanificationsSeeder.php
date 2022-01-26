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
        $faker = Factory::create();
        $classrooms = Classroom::all();
        $days = Catalogue::where('type', 'DAY')->get();
        $workdays = Catalogue::where('type', 'WORKDAY')->get();
        $paralels = Catalogue::where('type', 'PARALLEL_NAME')->get();
        $states = Catalogue::where('type', 'DETAIL_PLANIFICATION_STATE')->get();
        $planifications = Planification::all();
        foreach ($planifications as $planification) {
            for ($i = 0; $i <= 1; $i++) {
                DetailPlanification::factory()->create(
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
