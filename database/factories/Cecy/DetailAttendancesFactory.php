<?php

namespace Database\Factories;

use App\Models\Cecy\Attendance;
use App\Models\Cecy\Catalogue;
use App\Models\Cecy\DetailAttendance;
use App\Models\Cecy\Registration;
use Illuminate\Database\Eloquent\Factories\Factory;

class DetailAttendancesFactory extends Factory
{
    /**
     * The name of the factory's corresponding model.
     *
     * @var string
     */
    protected $model = DetailAttendance::class;
    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {

        $registration = Registration::where('state_id', 'REGISTERED')->values('id');
        $attendance = Attendance::get();

        $catalogue = json_decode(file_get_contents(storage_path() . "/catalogue.json"), true);

        $present = Catalogue::where('code', $catalogue['attendance']['present']);
        $backwardness = Catalogue::where('code', $catalogue['attendance']['backwardness']);
        $absent = Catalogue::where('code', $catalogue['attendance']['absent']);

        return [
            'attendance_id' => $this->faker->randomElement($attendance),
            'registration_id' => $this->faker->randomElement($registration),
            'type_id' => $this->faker->randomElement([$present, $backwardness, $absent]),
        ];
    }
}
