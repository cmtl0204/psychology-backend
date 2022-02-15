<?php

namespace Database\Factories\Psychology;

use Illuminate\Database\Eloquent\Factories\Factory;
use App\Models\Psychology\Answer;

class AnswerFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array
     */

    protected $model = Answer::class;

    public function definition()
    {
        return [
            'class'=>$this->faker->randomElement([]),
            'icon'=>$this->faker->randomElement([]),
            'value'=>$this->faker->word(),
        ];
    }
}
