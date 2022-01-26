<?php

namespace Database\Seeders\Cecy;

use App\Models\Cecy\DetailPlanification;
use App\Models\Cecy\Instructor;
use App\Models\Cecy\Topic;
use Illuminate\Database\Seeder;

class DetailPlanificationsInstructorSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {

        $this->createDetailPlanificationsInstructorCatalogue();
        $this->createDetailPlanificationsInstructor();
    }

    public function createDetailPlanificationsInstructorCatalogue()
    {
        //Campos que son de catalogo
    }

    public function createDetailPlanificationsInstructor()
    {
        //CREAR AQUI LAS SEMILLAS PARA DETAILPLANIFICATIONS
        Instructor::factory(10)->create();
        $detailPlanifications = DetailPlanification::factory(10)->create();
        $instructors = Instructor::get();
        $topics = Topic::get();

        foreach ($instructors as $instructor) {
            foreach ($detailPlanifications as $detailPlanification) {
                $instructor->detailPlanifications()->attach($detailPlanification->id,
                    ['topic_id' => $topics[rand(0, sizeof($topics) - 1)]]);
            }
        }
    }
}
