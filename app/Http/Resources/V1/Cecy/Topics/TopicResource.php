<?php

namespace App\Http\Resources\V1\Cecy\Prerequisites;

use Illuminate\Http\Resources\Json\JsonResource;

class PrerequisiteResource extends JsonResource
{
    public function toArray($request)
    {
        // return [
        //     'id' => $this->id,
        //     'parent' => TopicResource::make($this->parent),
        //     'level' => CatalogueResource::make($this->level),
        //     'description' => $this->description,
        // ];
    }
}
