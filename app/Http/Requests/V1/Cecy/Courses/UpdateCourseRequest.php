<?php

namespace App\Http\Requests\V1\Cecy\Courses;

use Illuminate\Foundation\Http\FormRequest;

class UpdateCourseRequest extends FormRequest
{
  public function authorize()
  {
    return true;
  }
  public function rules()
  {
    return [
      'academicPeriod.id' => ['required', 'integer'],
      'area.id' => ['required', 'integer'],
      'entityCcertification.id' => ['required', 'integer'],
      'career.id' => ['required', 'integer'],
      'category.id' => ['required', 'integer'],
      'capacitationType.id' => ['required', 'integer'],
      'certifiedType.id' => ['required', 'integer'],
      'complianceIndicators.id' => ['required', 'integer'],
      'control.id' => ['required', 'integer'],
      'courseType.id' => ['required', 'integer'],
      'modality.id' => ['required', 'integer'],
      'meansVerification.id' => ['required', 'integer'],
      'participantType.id' => ['required', 'integer'],
      'responsible.id' => ['required', 'integer'],
      'speciality.id' => ['required', 'integer'],
      'state.id' => ['required', 'integer'],
      'abbreviation' => ['required', 'string', 'max:100'],
      'alignment' => ['required', 'string', 'max:1000'],
      'approvedAt' => ['required', 'date'],
      'bibliographies' => ['required', 'json'],
      'code' => ['required', 'max:100'],
      'cost' => ['required', 'double'],
      'duration' => ['required', 'integer'],
      'evaluationMechanisms' => ['required', 'json'],
      'expiredAt' => ['required', 'date'],
      'facilities' => ['required', 'json'],
      'free' => ['required', 'boolean'],
      'name' => ['required', 'string', 'max:200'],
      'needs' => ['required', 'json'],
      'neededAt' => ['required', 'date'],
      'recordNumber' => ['required', 'string', 'max:100'],
      'learningEnvironments' => ['required', 'json'],
      'localProposal' => ['required', 'string', 'max:1000'],
      'objective' => ['required', 'string', 'max:1000'],
      'observation' => ['required', 'string', 'max:1000'],
      'practicalPhases' => ['required', 'json'],
      'practiceHours' => ['required', 'integer'],
      'proposedAt' => ['required', 'date'],
      'project' => ['required', 'string', 'max:1000'],
      'requiredInstallingSources' => ['required', 'json'],
      'setecName' => ['required',  'string', 'max:100'],
      'summary' => ['required',  'string', 'max:1000'],
      'targetGroups' => ['required',  'json'],
      'teachingStrategies' => ['required', 'json'],
      'techniquesRequisites' => ['required', 'json'],
      'theoreticalPhases' => ['required', 'json'],
      'theoryHours' => ['required', 'json'],
    ];
  }

  public function attributes()
  {
    return [
      'academicPeriod.id' => 'Id del periodo académico',
      'area.id' => 'Id del Area',
      'career.id' => 'Id de la carrera',
      'category.id' => 'Id de la categoria',
      'capacitationType.id' => 'Id del tipo de capacitación',
      'certifiedType.id' => 'Id del tipo de certitificado',
      'complianceIndicators.id' => 'Id del indidcador de cumplimiento',
      'control.id' => 'Id del control',
      'courseType.id' => 'Id del tipo de curso',
      'frecuency.id' => 'Id  de la frecuencia',
      'modality.id' => 'Id  de la modalidad',
      'participantType.id' => 'Id del tipo de participante',
      'responsible.id' => 'Id del reponsable del curso',
      'speciality.id' => 'Id de la especialidad',
      'state.id' => 'Id del estado del curso',
      'abbreviation' => 'Abreviación',
      'alignment' => 'Alineaciones',
      'approvedAt' => 'Fecha de aprobación',
      'bibliographies' => 'Bibliografias',
      'code' => 'Código',
      'cost' => 'Costo',
      'duration' => 'Duración',
      'evaluationMechanisms' => 'Mecanismos de evaluación',
      'expiredAt' => 'Fecha de expiración',
      'facilities' => 'Facilidades',
      'free' => 'Gratuidad',
      'name' => 'Nombre',
      'needs' => 'Necesidades',
      'neededAt' => 'Fecha de necesidad',
      'recordNumber' => 'Número de record',
      'learningEnvironments' => 'Entornos de aprendizaje',
      'localProposal' => 'Proposito local',
      'objective' => 'Objetivo',
      'observation' => 'Observación',
      'practicalPhases' => 'Fase práctica',
      'practiceHours' => 'Horas prácticas',
      'proposedAt' => 'Fecha de propuesta',
      'project' => 'Proyecto',
      'requiredInstallingSources' => 'Fuentes de instalación requeridas',
      'setecName' => 'Nombre de la setec',
      'summary' => 'Sumario',
      'targetGroups' => 'Grupos destinatorios',
      'teachingStrategies' => 'Estrategias de enseñanza',
      'techniquesRequisites' => 'Requistos ténicos',
      'theoreticalPhases' => 'Fases teóricas',
      'theoryHours' => 'Horas teóricas'
    ];
  }
}
