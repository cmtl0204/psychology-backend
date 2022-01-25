<?php

namespace Database\Factories;

use App\Models\Cecy\Attendance;
use Illuminate\Database\Eloquent\Factories\Factory;

class AttendanceFactory extends Factory
{
    /**
     * The name of the factory's corresponding model.
     *
     * @var string
     */
    protected $model = Attendance::class;

    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        return [
            'detail_planification_id' => $this->faker->numberBetween(1, 10),
            'duration' => $this->faker->numberBetween(1, 3),
            'registered_at' => $this->faker->creditCardNumber(),
        ];
    }
}
