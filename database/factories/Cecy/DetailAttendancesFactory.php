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
        $attendance = Attendance::all()->values('id');
        $catalogue = Catalogue::all()->values('id');
        return [
            'attendance_id' => $attendance,
            'registration_id' => $registration,
            'type_id' => $catalogue,
        ];
    }
}
