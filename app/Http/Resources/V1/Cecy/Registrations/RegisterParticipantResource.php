<?php

namespace App\Http\Resources\V1\Cecy\Registrations;

use App\Models\Cecy\Participant;
use Illuminate\Http\Resources\Json\JsonResource;

class RegisterParticipantResource extends JsonResource
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
        'person_type_id' => Participant::make($this->person_type_id),
        

        ];
    }
}
