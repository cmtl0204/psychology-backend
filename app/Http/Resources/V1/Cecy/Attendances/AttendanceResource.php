<?php

namespace App\Http\Resources\V1\Cecy\Attendances;

use App\Models\Cecy\Catalogue;
use App\Models\Cecy\DetailPlanification;
use Illuminate\Http\Resources\Json\JsonResource;

class AttendanceResource extends JsonResource
{
    public function toArray($request)
    {
        return [
            'id' => $this->id,
            'type_id' => Catalogue::make($this->type_id),
            'duration' => $this->duration,
            'registered_at' => $this->registered_at,
        ];
    }
}
