<?php

namespace App\Http\Requests\V1\Cecy\Courses;

use Illuminate\Foundation\Http\FormRequest;

class DestroysCourseRequest extends FormRequest
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
      'techniques_requisites' => ['required'],
      'teaching_strategies' => ['required'],
      'evaluation_mechanisms' => ['required'],
      'learning_environments' => ['required'],
      'practice_hours' => ['required'],
      'theory_hours' => ['required'],
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
      'techniques_requisites' => 'Requisitos técnicos y generales',
      'teaching_strategies' => 'Estrategias de enseñanza',
      'evaluation_mechanisms' => 'Mecanismos de evaluación',
      'learning_environments' => 'Entorno de aprendizaje',
      'practice_hours' => 'Horas prácticas',
      'theory_hours' => 'Horas teóricas',
      'bibliographies' => 'Bibliografía',
    ];
  }
}
