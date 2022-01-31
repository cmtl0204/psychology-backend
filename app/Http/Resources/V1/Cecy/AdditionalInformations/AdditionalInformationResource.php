<?php

namespace App\Http\Resources\V1\Cecy\AdditionalInformations;

use App\Http\Resources\V1\Cecy\Registrations\RegistrationResource;
use App\Models\Cecy\Registration;
use Illuminate\Http\Resources\Json\JsonResource;

class AdditionalInformationResource extends JsonResource
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
            'registration' => RegistrationResource::make($this->registration),
            'companyActivity' => $this->company_activity,
            'companyAddress' => $this->company_address,
            'companyEmail' => $this->company_email,
            'companyAddress' => $this->company_name,
            'companyPhone' => $this->company_phone,
            'companySponsor' => $this->company_sponsor,
            'contactName' => $this->contact_name,
            'levelInstruction' => $this->level_instruction,
            'courseKnow' => $this->course_know,
            'courseFollow' => $this->course_follow,
            'worked' => $this->worked,
        ];
    }
}
