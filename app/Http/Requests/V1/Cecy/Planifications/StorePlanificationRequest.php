<?php

namespace App\Http\Requests\V1\Cecy\Planifications;

use Illuminate\Foundation\Http\FormRequest;

class StorePlanificationRequest extends FormRequest
{
  public function authorize()
  {
    return true;
  }
  public function rules()
  {
    return [
      'course.id' => ['required', 'integer'],
      'detailSchoolPeriod.id' => ['required', 'integer'],
      'responsibleCourse.id' => ['required', 'integer'],
      'responsibleOcs.id' => ['required', 'integer'],
      'responsibleCecy.id' => ['required', 'integer'],
      'state.id' => ['required', 'integer'],
      'vicerector.id' => ['required', 'integer'],
      'aprovedAt' => ['required', 'date'],
      'code' => ['required', 'string', 'max:100'],
      'endedAt' => ['required', 'date'],
      'needs' => ['required', 'json'],
      'observations' => ['required', 'json'],
      'startedAt' => ['required', 'date']
    ];
  }

  public function attributes()
  {
    return [
      'course.id' => 'Id del curso',
      'detailSchoolPeriod.id' => 'Id del detalle de periodo escolar',
      'responsibleCourse.id' => 'Id del responsable del curso',
      'responsibleOcs.id' => 'Id del responsable del Ocs',
      'responsibleCecy.id' => 'Id del responsable del cecy',
      'state.id' => 'Id del estado',
      'vicerrector.id' => 'Id del vicerrector',
      'aprovedAt' => 'Fecha de aprobación de la planificación',
      'code' => 'Código',
      'endedAt' => 'Fecha fin',
      'needs' => 'necesidades',
      'observations' => 'Observaciones',
      'startedAt' => 'Fecha inicio'
    ];
  }
}
