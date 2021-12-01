<?php

namespace Database\Factories\Core;

use App\Models\Core\Career;
use App\Models\Core\Institution;
use Illuminate\Database\Eloquent\Factories\Factory;

class CareerFactory extends Factory
{
    /**
     * The name of the factory's corresponding model.
     *
     * @var string
     */
    protected $model = Career::class;

    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        $institutions = Institution::get();
        return [
            'institution_id' => $institutions[rand(0, sizeof($institutions) - 1)],
            'name' => $this->faker->word(),
        ];
    }
}
