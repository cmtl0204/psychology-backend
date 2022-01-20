<?php

namespace App\Http\Resources\V1\Cecy\Registrations;

use App\Http\Requests\V1\Cecy\Registrations\RegisterStudentRequest;
use App\Http\Resources\V1\Cecy\DetailPlanifications\DetailPlanificationResource;
use Illuminate\Http\Resources\Json\JsonResource;

class RegisterStudentResource extends JsonResource
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
            'finalGrade' => $this->final_grade,
            'grade1' => $this->grade1,
            'grade2' => $this->grade2,
            'number' => $this->number,
<<<<<<< HEAD
            'registeredAt' => $this->registered_at,
=======
            'registered_at' => $this->registeredAt,
<<<<<<< HEAD
            'participante'=>RegisterParticipantResource::collection($this->participant_id),
            //id para traer el curso en el que estan inscritos o matriculados los estudiantes
            'detailPlanification' => DetailPlanificationResource::collection($this->detail_planification_id)

=======
            'participante'=>RegisterParticipantResource::collection($this->participant_id)
        
>>>>>>> 84b3a1f4342609ce7e518ca27be6802dc35c00f6
>>>>>>> db03037d4f12f6f99e45655da15572303a672e7c

        ];
    }
}
