<?php

namespace App\Http\Resources\V1\Cecy\Registrations;

use App\Models\Cecy\DetailPlanification;
use Illuminate\Http\Resources\Json\JsonResource;

class RegistrationResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array|\Illuminate\Contracts\Support\Arrayable|\JsonSerializable
     */
    public function toArray($request)
    {
        return [
            'detail_planification_id' => DetailPlanification::make($this->registrations),
            'participant_id' => DetailPlanification::make($this->participant),
            'state_id' => DetailPlanification::make($this->state),
            'type_id' => DetailPlanification::make($this->type),
            'finalGrade' => $this->final_grade,
            'grade1' => $this->grade1,
            'grade2' => $this->grade2,
            'number' => $this->number,
            'observations' => $this->observations,
            'registeredAt' => $this->registered_at,
        ];
    }
}
