<?php

namespace App\Http\Requests\V1\Cecy\Classrooms;

use Illuminate\Foundation\Http\FormRequest;

class DestroysClassroomRequest extends FormRequest
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
