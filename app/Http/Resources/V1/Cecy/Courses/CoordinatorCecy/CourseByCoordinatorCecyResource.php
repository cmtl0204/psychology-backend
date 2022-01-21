<?php

namespace App\Http\Resources\V1\Cecy\Courses;

use App\Http\Resources\V1\Cecy\Catalogues\CatalogueResource;
use App\Http\Resources\V1\Cecy\Instructors\InstructorResource;
use App\Http\Resources\V1\Core\CareerResource;
use App\Models\Cecy\Planification;
use App\Models\Cecy\SchoolPeriod;
use Illuminate\Http\Resources\Json\JsonResource;

class CourseByCoordinatorCecyResource extends JsonResource
{
    public function toArray($request)
    {
        return [
            'id' => $this->id,
            'academicPeriod' => SchoolPeriod::make($this->academicPeriod),
            'career' => CareerResource::make($this->career),
            'planifications'=>Planification::collection($this->course),
            'state' => CatalogueResource::make($this->state),
            'code' => $this->code,
            'name' => $this->name,
            'approved_at' => $this->approved_at,
            'expired_at' => $this->expired_at,
            'observations'=> $this->observations,
        ];
    }
}
