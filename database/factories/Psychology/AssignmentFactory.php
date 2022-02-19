<?php

namespace Database\Factories\Psychology;

use App\Models\Authentication\User;
use Illuminate\Database\Eloquent\Factories\Factory;
use App\Models\Psychology\Assignment;

class AssignmentFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array
     */

    protected $model = Assignment::class;

    public function definition()
    {
        return [
            'user_id' => $this->faker->randomElement(User::get()),
            'ended_at' => $this->faker->dateTime(),
            'observations' => $this->faker->sentences(),
            'started_at' => $this->faker->dateTime(),
        ];
    }
}
