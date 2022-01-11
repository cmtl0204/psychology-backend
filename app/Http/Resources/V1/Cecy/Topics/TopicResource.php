<?php

namespace App\Http\Resources\V1\Cecy\Topics;

use Illuminate\Http\Resources\Json\JsonResource;

class TopicResource extends JsonResource
{
    public function toArray($request)
    {
        return [
            'id' => $this->id,
            'parent' => TopicResource::make($this->parent),
            'level' => CatalogueResource::make($this->level),
            'description' => $this->description,
        ];
    }
}
