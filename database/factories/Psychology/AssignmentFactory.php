<?php

namespace Database\Factories\Psychology;

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
            'ended_at'=>$this->faker->dateTime(),
            'observations'=>$this->faker->sentences(),
            'started_at'=>$this->faker->dateTime(),
        ];
    }
}
