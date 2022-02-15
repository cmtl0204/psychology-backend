<?php

namespace Database\Factories\Psychology;

use Illuminate\Database\Eloquent\Factories\Factory;
use App\Models\Psychology\Question;

class QuestionFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array
     */

    protected $model = Question::class;

    public function definition()
    {
        return [
            'type' => $this->faker->randomElement(['phq2', 'phq9', 'sc17', 'duel']),
            'value' => $this->faker->sentence(5),
        ];
    }
}
