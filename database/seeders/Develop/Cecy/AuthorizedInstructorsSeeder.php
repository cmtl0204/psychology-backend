<?php

namespace Database\Seeders\Develop\Cecy;

use App\Models\Cecy\Instructor;
use App\Models\Cecy\ProfileInstructorCourse;
use Illuminate\Database\Seeder;

class AuthorizedInstructorsSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        // AuthorizedInstructor::factory()->create();

        $profileInstructorCourses = ProfileInstructorCourse::get();
        $instructors = Instructor::get();
        foreach ($instructors as $instructor) {
            foreach ($profileInstructorCourses as $profileInstructorCourse) {
                $instructor->profileInstructorCourses()->attach(
                    $profileInstructorCourse->id
                );
            }
        }
    }

}
