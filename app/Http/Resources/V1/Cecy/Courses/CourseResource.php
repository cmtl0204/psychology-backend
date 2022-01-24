<?php

namespace App\Http\Resources\V1\Cecy\Courses;

use App\Http\Resources\V1\Cecy\Catalogues\CatalogueResource;
use App\Http\Resources\V1\Cecy\Instructors\InstructorResource;
use App\Http\Resources\V1\Core\CareerResource;
use Illuminate\Http\Resources\Json\JsonResource;

class CourseResource extends JsonResource
{
    public function toArray($request)
    {
        return [
            'id' => $this->id,
            'academicPeriod' => CatalogueResource::make($this->academicPeriod),
            'area' => CatalogueResource::make($this->area),
            'career' => CareerResource::make($this->career),
            'category' => CatalogueResource::make($this->category),
            'capacitationType' => CatalogueResource::make($this->capacitationType),
            'certifiedType' => CatalogueResource::make($this->certifiedType),
            'complianceIndicators' => CatalogueResource::make($this->complianceIndicators),
            'control' => CatalogueResource::make($this->control),
            'courseType' => CatalogueResource::make($this->courseType),
            'modality' => CatalogueResource::make($this->modality),
            'participantType' => CatalogueResource::make($this->participantType),
            'responsible' => InstructorResource::make($this->responsible),
            'speciality' => CatalogueResource::make($this->speciality),
            'state' => CatalogueResource::make($this->state),
            'abbreviation' => $this->abbreviation,
            'alignment' => $this->alignment,
            'approvedAt' => $this->approved_at,
            'bibliographies' => $this->bibliographies,
            'code' => $this->code,
            'cost' => $this->cost,
            'duration' => $this->duration,
            'evaluationMechanisms' => $this->evaluation_mechanisms,
            'expiredAt' => $this->expired_at,
            'facilities' => $this->facilities,
            'free' => $this->free,
            'name' => $this->name,
            'needs' => $this->needs,
            'neededAt' => $this->needed_at,
            'recordNumber' => $this->record_number,
            'learningEnvironments' => $this->learning_environments,
            'localProposal' => $this->local_proposal,
            'objective' => $this->objective,
            'observation' => $this->observation,
            'practicalPhase' => $this->practical_phase,
            'practiceHours' => $this->practice_hours,
            'proposedAt' => $this->proposed_at,
            'project' => $this->project,
            'requiredInstallingSources' => $this->required_installing_sources,
            'setecName' => $this->setec_name,
            'summary' => $this->summary,
            'targetGroup' => $this->target_group,
            'teachingStrategies' => $this->teaching_strategies,
            'theoreticalPhase' => $this->theoretical_phase,
            'theoryHours' => $this->theory_hours
        ];
    }
}
