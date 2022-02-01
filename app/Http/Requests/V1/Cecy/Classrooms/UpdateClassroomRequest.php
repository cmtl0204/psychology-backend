<?php

namespace App\Http\Requests\V1\Cecy\Courses;

use Illuminate\Foundation\Http\FormRequest;

class UpdateClassroomRequest extends FormRequest
{
  public function authorize()
  {
    return true;
  }
  public function rules()
  {
    return [
      'type.id' => ['required', 'integer'],
      'description' => ['required', 'integer'],
      'capacity' => ['required', 'integer'],
      'code' => ['required', 'integer'],
      'name' => ['required', 'integer'],
    ];
  }

  public function attributes()
  {
    return [
      'type.id' => 'Tipo de aula',
      'description' => 'Descripción del aula',
      'capacity' => 'Capacidad del aula a recibir',
      'code' => 'Código del aula',
      'name' => 'Nombre del aula',
    ];
  }
}
