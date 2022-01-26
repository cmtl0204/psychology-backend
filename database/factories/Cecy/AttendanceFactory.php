<?php

namespace Database\Factories;

use App\Models\Cecy\Attendance;
use App\Models\Cecy\DetailPlanification;
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
        $detail = DetailPlanification::where('state_id','APPROVED')->value('id');
        return [
            'detail_planification_id' => $detail,
            'duration' => $this->faker->randomElement(['120','60']),
            'registered_at' => $this->date('d_m_Y'),
        ];
    }
}
