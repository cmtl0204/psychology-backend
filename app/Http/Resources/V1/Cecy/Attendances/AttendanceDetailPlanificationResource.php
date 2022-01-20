<?php

namespace App\Http\Resources\V1\Cecy\Attendances;


use Illuminate\Http\Resources\Json\JsonResource;

class AttendanceDetailPlanificationResource extends JsonResource
{
    public function toArray($request)
    {
        return [
            'id' => this -> id,
            'starTime' => this -> start_time,
            'endTime' => this -> end_time,
            'planificacion' => AttendancePlanificationResource::collection($this->planification_id)
        ];
    }
}

