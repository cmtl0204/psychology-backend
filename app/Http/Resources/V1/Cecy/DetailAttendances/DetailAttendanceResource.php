<?php

namespace App\Http\Resources\V1\Cecy\DetailAttendances;


use App\Http\Resources\V1\Cecy\Attendances\AttendanceResource;
use App\Http\Resources\V1\Cecy\Registrations\RegistrationResource;
use Illuminate\Http\Resources\Json\JsonResource;

class DetailAttendanceResource extends JsonResource
{
    public function toArray($request)
    {
        return [
            'id' => $this->id,
            'registration_id' => RegistrationResource::collection($this->registration_id),
            'attendance_id' => AttendanceResource::collection($this->attendance_id)
        ];
    }
}
