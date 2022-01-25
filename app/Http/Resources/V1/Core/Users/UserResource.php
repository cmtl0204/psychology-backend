<?php

namespace App\Http\Resources\V1\Core\Users;

use Illuminate\Http\Resources\Json\JsonResource;
use App\Http\Resources\V1\Core\Catalogues\CatalogueResource;
Use App\Http\Resources\V1\Core\EmailResource;
Use App\Http\Resources\V1\Core\PhoneResource;
class UserResource extends JsonResource
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
            'avatar' => $this->avatar,
            'username' => $this->username,
            'name' => $this->name,
            'lastname' => $this->lastname,
            'email' => $this->email,
            'phone' => $this->phone,
            'birthdate' => $this->birthdate,
            'emails' => EmailResource::collection($this->emails),
            'phones' => PhoneResource::collection($this->phones),
            'identificationType' => CatalogueResource::make($this->identificationType),
            'sex' => CatalogueResource::make($this->sex),
            'gender' => CatalogueResource::make($this->gender),
            'bloodType' => CatalogueResource::make($this->bloodType),
            'ethnicOrigin' => CatalogueResource::make($this->ethnicOrigin),
            'civilStatus' => CatalogueResource::make($this->civilStatus),
            'emailVerifiedAt' => $this->email_verified_at,
            'passwordChanged' => $this->password_changed,
            'updatedAt' => $this->updated_at,
        ];
    }

//    public function with($request)
//    {
//        return [
//            'message' => [
//                'summary' => '',
//                'detail' => ''
//            ]
//        ];
//    }
}
