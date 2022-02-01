<?php

namespace App\Http\Resources\V1\Cecy\Registrations;

use App\Http\Resources\V1\Cecy\Catalogues\CatalogueResource;
use App\Http\Resources\V1\Cecy\DetailPlanifications\DetailPlanificationResource;
use App\Http\Resources\V1\Cecy\Participants\ParticipantResource;
use App\Models\Cecy\Catalogue;
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
            'detail_planification.id' => DetailPlanificationResource::make($this->detailPlanification),
            'participant.id' => ParticipantResource::make($this->participant),
            'state.id' => CatalogueResource::make($this->state),
            'stateCourse.id' => Catalogue::make($this->stateCourse),
            'type.id' => CatalogueResource::make($this->type),
            'typeParticipant.id' => CatalogueResource::make($this->typeParticipant),
            'finalGrade' => $this->final_grade,
            'grade1' => $this->grade1,
            'grade2' => $this->grade2,
            'number' => $this->number,
            'observations' => $this->observations,
            'registeredAt' => $this->registered_at,
        ];
    }
}
