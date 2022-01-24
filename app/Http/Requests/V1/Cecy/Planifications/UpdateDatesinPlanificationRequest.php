<?php

namespace App\Http\Requests\V1\Cecy\Planifications;

use Illuminate\Foundation\Http\FormRequest;

class UpdateDatesinPlanificationRequest extends FormRequest
{
  public function authorize()
  {
    return true;
  }
  public function rules()
  {
    return [
      'startedAt' => ['required', 'date'],
      'startedTime' => ['required', 'date'],
      
    ];
  }

  public function attributes()
  {
    return [
      'startedAt' => 'Fecha de inicio de planificación',
      'startedTime' => 'Fecha de finalización de planificación',
      
    ];
  }
}
