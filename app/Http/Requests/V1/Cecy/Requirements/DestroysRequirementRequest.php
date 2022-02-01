<?php

namespace App\Http\Requests\V1\Cecy\Requirements;

use Illuminate\Foundation\Http\FormRequest;

class DestroysRequirementRequest extends FormRequest
{
  public function authorize()
  {
    return true;
  }
  public function rules()
  {
    return [
      'ids' => ['required'],
    ];
  }

  public function attributes()
  {
    return [
      'ids' => 'ID`s de las aulas',
    ];
  }
}
