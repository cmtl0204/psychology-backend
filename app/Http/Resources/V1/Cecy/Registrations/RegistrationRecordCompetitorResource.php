<?php

namespace App\Http\Resources\V1\Cecy\Registrations;

use Illuminate\Http\Resources\Json\JsonResource;

class RegistrationRecordCompetitorResource extends JsonResource
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
            'id' => $this->id,
            'state' => CatalogueResource::make($this->state),
            'participant' => ParticipantRecordCompetitorResource::collection($this->participant),
            'detailPlanification' => DetailPlanificationInformNeedResource::collection($this->detail_planification)

        ];
    }
}
