<?php

namespace App\Http\Resources\V1\Cecy\Topics;

use Illuminate\Http\Resources\Json\JsonResource;

class TopicResource extends JsonResource
{
    public function toArray($request)
    {
        return [
            'id' => $this->id,
            // 'course' => CourseResource::make($this->parent),
            'parent' => TopicResource::make($this->parent),
            // 'nivel' => CatalogueResource::make($this->parent),
            'description' => $this->description,
        ];
    }
}
