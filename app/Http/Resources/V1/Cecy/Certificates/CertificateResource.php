<?php

namespace App\Http\Resources\V1\Cecy\Certificates;

use App\Http\Resources\V1\Cecy\Catalogues\CatalogueResource;
use App\Http\Resources\V1\Cecy\Registrations\RegistrationResource as RegistrationsRegistrationResource;
use Illuminate\Http\Resources\Json\JsonResource;


class CertificateResource extends JsonResource
{
    public function toArray($request)
    {
        return [
            'id' => $this->id,
            'certificable' => RegistrationsRegistrationResource::collection($this->certificable_id),  
            'state' => CatalogueResource::collection($this->state_id),
            'code'=>$this->state_id,
            'issued'=>$this->issued_at
        ];
    }
}


