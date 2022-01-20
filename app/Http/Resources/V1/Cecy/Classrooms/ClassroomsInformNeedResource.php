<?php

namespace App\Http\Resources\V1\Cecy\Classrooms;

use App\Http\Resources\V1\Cecy\DetailInstructors\DetailInstructorResource;
use Illuminate\Http\Resources\Json\JsonResource;

class ClassroomsInformNeedResource extends JsonResource
{
    public function toArray($request)
    {
        return [
            'id' => $this->id,
            'capacity' => $this->capacity,
            'name' => $this->name,
            'description'=> $this -> description
        ];
    }
}
