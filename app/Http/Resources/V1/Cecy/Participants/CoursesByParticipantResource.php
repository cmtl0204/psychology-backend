<?php

namespace App\Http\Resources\V1\Cecy\Participants;

use Illuminate\Http\Resources\Json\JsonResource;

class CoursesByParticipantResource extends JsonResource
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
            'name' => $this->name,
            'code' => $this->code,
            'grade1' => $this->grade1,
            'approvedAt' => $this->approved_at,

        ];
    }
}
