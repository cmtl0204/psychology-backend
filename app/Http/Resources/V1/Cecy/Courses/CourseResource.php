<?php

namespace App\Http\Resources\V1\Cecy\Courses;

use Illuminate\Http\Resources\Json\JsonResource;

class CourseResource extends JsonResource
{
    public function toArray($request)
    {
        return [
            'id' => $this->id,
            'name' => $this->name,
            'area' => CatalogueResource::make($this->area),
            'speciality' => CatalogueResource::make($this->speciality),
            'alignment' => $this->alignment,
            'objective' => $this->objective,
            'techniques_requisites' => $this->techniques_requisites,
            'teaching_strategies' => $this->teaching_strategies,
            'evaluation_mechanisms' => $this->evaluation_mechanisms,
            'learning_environments' => $this->learning_environments,
            'practice_hours' => $this->practice_hours,
            'theory_hours' => $this->theory_hours,
            'bibliographies' => $this->bibliographies,
        ];
    }
}
