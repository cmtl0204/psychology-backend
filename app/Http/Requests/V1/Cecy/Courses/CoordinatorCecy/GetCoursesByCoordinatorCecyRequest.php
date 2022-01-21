<?php

namespace App\Http\Requests\V1\Cecy\Courses;

use Illuminate\Foundation\Http\FormRequest;

class GetCoursesByCoordinatorCecyRequest extends FormRequest
{
  public function authorize()
  {
    return true;
  }
  public function rules()
  {
    return [
      'career.id' => ['required'],
      'academicPeriod.id' => ['required'],
      'state.id' => ['required'],
    ];
  }

  public function attributes()
  {
    return [
      'career.id' => 'Id de la carrera ',
      'academicPeriod.id' => 'Id de periodo academico ',
      'state.id' => 'Id del estado ',
    ];
  }
}
