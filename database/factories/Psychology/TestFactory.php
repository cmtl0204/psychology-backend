<?php

namespace Database\Factories\Psychology;

use App\Models\Core\Location;
use App\Models\Psychology\Priority;
use App\Models\Psychology\State;
use Illuminate\Database\Eloquent\Factories\Factory;
use App\Models\Psychology\Test;

class TestFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array
     */

    protected $model = Test::class;

    public function definition()
    {
        return [
            'age' => $this->faker->numberBetween(12, 18),
            'code' => $this->faker->ean8(),
            'terms_conditions' => true,
            'type' => $this->faker->randomElement(['phq9a', 'psc17']),
            'priority_id' => $this->faker->randomElement(Priority::get()),
            'state_id' => $this->faker->randomElement(State::get()),
            'province_id' => $this->faker->randomElement(Location::where('type_id', 2)->get()),
            'canton_id' => $this->faker->randomElement(Location::where('type_id', 3)->get())
        ];
    }
}
