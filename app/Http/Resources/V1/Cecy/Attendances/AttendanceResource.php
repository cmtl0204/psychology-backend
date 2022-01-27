<?php

namespace App\Http\Resources\V1\Cecy\Attendances;

use App\Http\Resources\V1\Cecy\DetailPlanifications\DetailPlanificationResource;
use Illuminate\Http\Resources\Json\JsonResource;

class AttendanceResource extends JsonResource
{
    public function toArray($request)
    {
        return [
            'id' => $this->id,
            'detail_planification_id' => DetailPlanificationResource::collection($this->detail_planification_id),
            'duration' => $this->duration,
            'registered_at' => $this->registered_at,
        ];
    }
}
