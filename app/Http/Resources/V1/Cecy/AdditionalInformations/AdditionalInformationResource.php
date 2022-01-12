<?php

namespace App\Http\Resources\V1\Cecy\AdditionalInformations;

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
            'company_activity' => $this->companyActivity,
            'company_address' => $this->companyAddress,
            'company_email' => $this->companyEmail,
            'company_name' => $this->companyName,
            'company_phone' => $this->companyPhone,
            'company_sponsor' => $this->companySponsor,
            'contact_name' => $this->contactName,
            'level_instruction' => $this->levelInstruction,
            'course_know' => $this->courseKnow,
            'course_follow' => $this->courseFollow,
            'worked' => $this->worked,
        ];
    }
}
