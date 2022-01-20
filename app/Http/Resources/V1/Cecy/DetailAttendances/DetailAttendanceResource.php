<?php

namespace App\Http\Resources\V1\Cecy\Attendances;

use App\Models\Cecy\Attendance;
use App\Models\Cecy\Registration;
use Illuminate\Http\Resources\Json\JsonResource;

class DetailAttendanceResource extends JsonResource
{
    public function toArray($request)
    {
        return [
            'id' => $this->id,
            'registration_id' => Registration::make($this->registration_id),
            'attendance_id' => Attendance::make($this->attendance_id)
        ];
    }
}
