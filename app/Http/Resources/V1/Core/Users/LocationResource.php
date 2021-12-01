<?php

namespace App\Http\Resources\V1\Core\Users;

use Illuminate\Http\Resources\Json\JsonResource;

class LocationResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function toArray($request)
    {
        return [
            'id'=>$this->id,
            'code'=>$this->code,
            'name'=>$this->name,
            'alpha2_code'=>$this->alpha2_code,
            'alpha3_code'=>$this->alpha3_code,
            'calling_code'=>$this->calling_code,
            'flag'=>$this->flag,
        ];
    }
}
