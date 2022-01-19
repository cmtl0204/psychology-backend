<?php

namespace App\Http\Requests\V1\Cecy\Courses;

use Illuminate\Foundation\Http\FormRequest;

class CourseRequest extends FormRequest
{
    public function authorize()
    {
        return true;
    }
    public function rules()
    {
        return [
          'area.id' => ['required', 'integer'],
          'speciality.id' => ['required', 'integer'],
          'alignment' => ['required', 'max:100'],
          'objective' => ['required'],
          'techniquesRequisites' => ['required'],
          'teachingStrategies' => ['required'],
          'evaluationMechanisms' => ['required'],
          'learningEnvironments' => ['required'],
          'practiceHours' => ['required'],
          'theoryHours' => ['required'],
          'bibliographies' => ['required'],
      ];
    }

    public function attributes()
    {
        return [
          'area.id' => 'Área del curso',
          'speciality.id' => 'Especialidad',
          'alignment' => 'Alineación',
          'objective' => 'Objetivo',
          'techniquesRequisites' => 'Requisitos técnicos y generales',
          'teachingStrategies' => 'Estrategias de enseñanza',
          'evaluationMechanisms' => 'Mecanismos de evaluación',
          'learningEnvironments' => 'Entorno de aprendizaje',
          'practiceHours' => 'Horas prácticas',
          'theoryHours' => 'Horas teóricas',
          'bibliographies' => 'Bibliografía',
        ];
    }
}
