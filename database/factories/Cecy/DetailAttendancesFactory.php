<?php

namespace Database\Factories;

use App\Models\Cecy\Attendance;
use App\Models\Cecy\Catalogue;
use App\Models\Cecy\Registration;
use Illuminate\Database\Eloquent\Factories\Factory;

class DetailAttendancesFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {

        $registration = Registration::where('state_id','REGISTERED')->values('id');
        $attendance = Attendance::get();

        $catalogue = json_decode(file_get_contents(storage_path() . "/catalogue.json"), true);

        $present = Catalogue::where('code', $catalogue['type_attendace']['present']);
        $backwardness = Catalogue::where('code', $catalogue['type_attendace']['backwardness']);
        $absent = Catalogue::where('code', $catalogue['type_attendace']['absent']);

        return [
            'attendance_id' => $this->faker->randomElement($attendance),
            'registration_id' =>$this->faker->randomElement($registration),
            'type_id' => $this->faker->randomElement([$present, $backwardness, $absent]),
        ];
    }
}
