<?php

namespace App\Http\Resources\V1\Cecy\Attendances;

use Illuminate\Http\Resources\Json\JsonResource;

class AttendancePlanificationResource extends JsonResource
{
    public function toArray($request)
    {
        return [
            'id' => this -> id,
            'startedAt' => this -> started_at,
            'endedAt' => this -> ended_at,
        ];
    }
}
