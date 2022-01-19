<?php

namespace App\Http\Requests\V1\Cecy\Planifications;

use Illuminate\Foundation\Http\FormRequest;

class UpdatePlanificationRequest extends FormRequest
{
  public function authorize()
  {
    return true;
  }
  public function rules()
  {
    return [
      'area.id' => ['required', 'integer'],
      'course.id' => ['required', 'integer'],
      'detailSchoolPeriod.id' => ['required', 'integer'],
      'responsible.id' => ['required', 'integer'],
      'sector.id' => ['required', 'integer'],
      'state.id' => ['required', 'integer'],
      'code' => ['required', 'string', 'max:100'],
      'endedAt' => ['required', 'date'],
      'needs' => ['required', 'json'],
      'numberDays' => ['required', 'integer'],
      'startedAt' => ['required', 'date']
    ];
  }

  public function attributes()
  {
    return [
      'academicPeriod.id' => 'Id del area',
      'course.id' => 'Id del curso',
      'responsible.id' => 'Id del responsable',
      'detailSchoolPeriod.id' => 'Id de detalle periodo escolar',
      'sector.id' => 'Id del sector',
      'state.id' => 'Id del estado',
      'code' => 'Código',
      'endedAt' => 'Fecha fin',
      'needs' => 'necesidades',
      'numberDays' => 'Número de dias',
      'startedAt' => 'Fecha inicio'
    ];
  }
}
