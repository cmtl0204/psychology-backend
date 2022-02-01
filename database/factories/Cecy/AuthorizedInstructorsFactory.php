<?php

namespace Database\Factories;

use App\Models\Cecy\Instructor;
use App\Models\Cecy\ProfileInstructorCourse;
use Illuminate\Database\Eloquent\Factories\Factory;

class AuthorizedInstructorsFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {

        $instructor = Instructor::get();
        $profileInstructor = ProfileInstructorCourse::get();


        return [
            'instructor_id' => $this->faker->randomElement($instructor),
            'profile_instructor_course_id' => $this->faker->randomElement($profileInstructor),

        ];
    }
}
