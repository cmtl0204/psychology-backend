<?php

namespace App\Http\Resources\V1\Cecy\AdditionalInformationRecordCompetitors;

use Illuminate\Http\Resources\Json\JsonResource;

class AdditionalInformationRecordCompetitorResource extends JsonResource
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
            'registration' => RegistrationRecordCompetitorResource::colletion($this->registration),
            'companyActivity' => $this->company_activity,
            'companyAddres' => $this->company_addres,
            'companyName' => $this->companyName,
            'companyPhone' => $this->company_phone,


        ];
    }
}
