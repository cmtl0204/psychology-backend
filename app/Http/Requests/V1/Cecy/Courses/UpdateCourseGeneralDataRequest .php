<?php

namespace App\Http\Requests\V1\Cecy\Courses;

use Illuminate\Foundation\Http\FormRequest;

class UpdateCourseGeneralDataRequest extends FormRequest
{
  public function authorize()
  {
    return true;
  }
  public function rules()
  {
    return [
     
      'career.id' => ['required', 'integer'],
      'category.id' => ['required', 'integer'],
      'certifiedType.id' => ['required', 'integer'],
      'courseType.id' => ['required', 'integer'],
      'modality.id' => ['required', 'integer'],
      'speciality.id' => ['required', 'integer'],
      'abbreviation' => ['required', 'string', 'max:100'],
      'duration' => ['required', 'integer'],
      // 'name' => ['required', 'string', 'max:200'],
      'needs' => ['required', 'json'],
      'project' => ['required', 'string', 'max:1000'],
      'summary' => ['required',  'string', 'max:1000'],
     
    ];
  }

  public function attributes()
  {
    return [
     
      'career.id' => 'Id de la carrera',
      'category.id' => 'Id de la categoria',
      'certifiedType.id' => 'Id del tipo de certitificado',
      'courseType.id' => 'Id del tipo de curso',
      'modality.id' => 'Id  de la modalidad',
      'abbreviation' => 'Abreviación',
      'duration' => 'Duración',
      // 'name' => 'Nombre',
      'needs' => 'Necesidades',
      'project' => 'Proyecto',
      'summary' => 'Sumario',
    ];
  }
}
