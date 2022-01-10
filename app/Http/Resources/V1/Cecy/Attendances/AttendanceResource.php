<?php

namespace App\Http\Resources\V1\Cecy\Attendances;

use Illuminate\Http\Resources\Json\JsonResource;

class AttendanceResource extends JsonResource
{
    public function toArray($request)
    {
        return [
            'id' => $this->id,
            'duration' => $this->duration,
            'registered_at' => $this->registered_at,
        ];
    }
}
