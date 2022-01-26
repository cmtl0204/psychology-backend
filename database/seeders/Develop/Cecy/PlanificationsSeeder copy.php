<?php

namespace Database\Seeders\Cecy;

use App\Models\Cecy\Planification;
use Illuminate\Database\Seeder;

class PlanificationsSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        Planification::factory()->sequence(
            [
                'course_id' => '',
                'detail_school_period_id' => '',
                'vicerrector_id' => '',
                'responsible_course_id' => '',
                'responsible_ocs_id' => '',
                'responsible_cecy_id' => '',
                'state_id' => '',
                'approved_at' => '',
                'code' => '',
                'ended_at' => '',
                'needs' => '',
                'observations' => '',
                'started_at' => '',
            ],
            [
                'course_id' => '',
                'detail_school_period_id' => '',
                'vicerrector_id' => '',
                'responsible_course_id' => '',
                'responsible_ocs_id' => '',
                'responsible_cecy_id' => '',
                'state_id' => '',
                'approved_at' => '',
                'code' => '',
                'ended_at' => '',
                'needs' => '',
                'observations' => '',
                'started_at' => '',
            ],
            [
                'course_id' => '',
                'detail_school_period_id' => '',
                'vicerrector_id' => '',
                'responsible_course_id' => '',
                'responsible_ocs_id' => '',
                'responsible_cecy_id' => '',
                'state_id' => '',
                'approved_at' => '',
                'code' => '',
                'ended_at' => '',
                'needs' => '',
                'observations' => '',
                'started_at' => '',
            ],
            [
                'course_id' => '',
                'detail_school_period_id' => '',
                'vicerrector_id' => '',
                'responsible_course_id' => '',
                'responsible_ocs_id' => '',
                'responsible_cecy_id' => '',
                'state_id' => '',
                'approved_at' => '',
                'code' => '',
                'ended_at' => '',
                'needs' => '',
                'observations' => '',
                'started_at' => '',
            ],
            [
                'course_id' => '',
                'detail_school_period_id' => '',
                'vicerrector_id' => '',
                'responsible_course_id' => '',
                'responsible_ocs_id' => '',
                'responsible_cecy_id' => '',
                'state_id' => '',
                'approved_at' => '',
                'code' => '',
                'ended_at' => '',
                'needs' => '',
                'observations' => '',
                'started_at' => '',
            ],
        )->create();
    }
}
