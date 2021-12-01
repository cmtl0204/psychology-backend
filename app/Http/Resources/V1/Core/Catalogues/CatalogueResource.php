<?php

namespace App\Http\Resources\V1\Core\Catalogues;

use Illuminate\Http\Resources\Json\JsonResource;

class CatalogueResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param \Illuminate\Http\Request $request
     * @return array
     */
    public function toArray($request)
    {
        return [
            'id' => $this->id,
            'code' => $this->code,
            'name' => $this->name,
            'icon' => $this->icon,
            'description' => $this->description,
            'color' => $this->color,
//            'parent'=>$this->when($this->parent, CatalogueResource::make($this->parent)),
            'parent' => CatalogueResource::make($this->parent),
        ];
    }
}
