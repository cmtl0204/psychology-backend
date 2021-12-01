<?php

namespace App\Http\Resources\V1\Core\Authentications;

use Illuminate\Http\Resources\Json\JsonResource;

class MenuResource extends JsonResource
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
            'label' => $this->label,
            'icon' => $this->icon,
            'routerLink' => $this->router_link,
            'items' => $this->when(sizeof($this->items)>0, MenuResource::collection($this->items)),
        ];
    }
}
