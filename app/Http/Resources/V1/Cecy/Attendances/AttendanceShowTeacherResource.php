<?php

namespace App\Http\Resources\V1\Cecy\Attendances;

use App\Models\Cecy\Catalogue;
use App\Models\Cecy\DetailPlanification;
use Illuminate\Http\Resources\Json\JsonResource;

class AttendanceShowTeacherResource extends JsonResource
{
    public function toArray($request)
    {
        return [
            'id' => $this->id,
            'detail_planification_id' => DetailPlanification::make($this->DetailPlanification),
            'type_id' => Catalogue::make($this->type_id),
            'duration' => $this->duration,
            'registered_at' => $this->registered_at,
        ];
    }
}
