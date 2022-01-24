<?php

namespace App\Http\Resources\V1\Cecy\Registrations;

use Illuminate\Http\Resources\Json\JsonResource;
use App\Http\Resources\V1\Cecy\Catalogues\CatalogueResource;
use App\Http\Resources\V1\Cecy\Participants\ParticipantRecordCompetitorResource;
use App\Http\Resources\V1\Cecy\DetailPlanifications\DetailPlanificationInformNeedResource;






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
            'detailPlanification' => DetailPlanificationInformNeedResource::make($this->detail_planification)

        ];
    }
}
