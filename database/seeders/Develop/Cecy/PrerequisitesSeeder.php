<?php

namespace Database\Seeders\Cecy;

use Illuminate\Database\Seeder;

class PrerequisitesSeeder extends Seeder
{
    public function run()
    {
        DB::table('prerequisites')->insert(
            [
                'course_id' => 1,
                'prerequisite_id' => 2,
            ],
            [
                'course_id' => 1,
                'prerequisite_id' => 3,
            ],
            [
                'course_id' => 1,
                'prerequisite_id' => 4,
            ],
            [
                'course_id' => 2,
                'prerequisite_id' => 1,
            ],
            [
                'course_id' => 2,
                'prerequisite_id' => 3,
            ],
            [
                'course_id' => 2,
                'prerequisite_id' => 5,
            ],
        );
    }
}
