<?php

namespace App\Http\Resources\V1\Cecy\Prerequisites;

use App\Models\Cecy\Course;
use Illuminate\Http\Resources\Json\JsonResource;
// use Illuminate\Http\Re

class PrerequisiteResource extends JsonResource
{
    public function toArray($request)
    {
        return [
            'id' => $this->id,
            'course' => Course::make($this->course),
            'prerequisite' => Course::make($this->prerequisite_id)
        ];
    }
}
