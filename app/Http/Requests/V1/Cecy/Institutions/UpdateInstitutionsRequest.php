<?php

namespace App\Http\Requests\V1\Cecy\Institutions;

use Illuminate\Foundation\Http\FormRequest;

class UpdateInstitutionsRequest extends FormRequest
{
    public function authorize()
  {
    return true;
  }
  public function rules()
  {
    return [
      'code'=> ['required', 'string'],
      'name'=> ['required', 'string'],
      'logo'=> ['required', 'integer'],
      'slogan'=> ['required', 'string'],
    ];
  }

  public function attributes()
  {
    return [
      'code'=> 'Codigo de la institucion',
      'name'=> 'Nombre de la institucion',
      'logo'=> 'Logo de la institucion',
      'slogan'=> 'Slogan de la institucion',
    ];
  }
}
