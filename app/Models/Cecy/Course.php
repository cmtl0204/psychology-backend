<?php

namespace App\Models\Cecy;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use OwenIt\Auditing\Contracts\Auditable;
use OwenIt\Auditing\Auditable as Auditing;
use Illuminate\Database\Eloquent\SoftDeletes;

class Course extends Model implements Auditable
{
    use HasFactory;
    use Auditing;
    use SoftDeletes;

    protected $table = 'cecy.courses';

    protected $fillable = [
        'career',
        'code',
        'name',
        'cost',
        'photo',
        'summary',
        'free',
        'duration',
        'observation',
        'objetive',
        'needs',
        'target_group',
        'facilities',
        'theoretical_phase',
        'required_installing_source',
        'cross_cutting_topics',
        'bibliographys',
        'requirements',
        'teaching_strategies',
        'practice_hours',
        'practics_required_resources',
        'aimtheory_required_resorces',
        'learning_teaching_strategy',
        'number_record',
        'proposed_date',
        'approved_date',
        'need_date',
        'expiration_date',
        'local_proposal',
        'project',
        'setec_name',
        'attached',
        'abbreviation',
        'techniques_requisites',
        'evaluation_mechanims',
        'category'
       
    ];

    // Relationships
    public function career()
    {
        return $this->belongsTo(Catalogue::class);
    }

    public function modality()
    {
        return $this->belongsTo(Catalogue::class);
    }

    public function state()
    {
        return $this->belongsTo(Catalogue::class);
    }

    public function participant_type()
    {
        return $this->belongsTo(Catalogue::class);
    }

    public function area()
    {
        return $this->belongsTo(Catalogue::class);
    }

    public function level()
    {
        return $this->belongsTo(Catalogue::class);
    }

    public function person_proposal()
    {
        return $this->belongsTo(Catalogue::class);
    }

    public function schedules()
    {
        return $this->belongsTo(Catalogue::class);
    }

    public function course_type()
    {
        return $this->belongsTo(Catalogue::class);
    }

    public function speciality()
    {
        return $this->belongsTo(Catalogue::class);
    }

    public function academy_period()
    {
        return $this->belongsTo(Catalogue::class);
    }

    public function certified_type()
    {
        return $this->belongsTo(Catalogue::class);
    }

    function topics()
    {
        return $this->hasMany(Topic::class);
    }
    public function profileInstructorCourses()
    {
        return $this->hasMany(ProfileInstructor::class);
    }
    public function planifications()
    {
        return $this->hasMany(Planification::class);
    }
    public function prerequisites()
    {
        return $this->hasMany(Prerequisite::class);
    }

    public function children()
    {
        return $this->hasMany(Catalogue::class, 'parent_id','core.catalogues');
    }

    // Mutators
    public function setCareerAttribute($value)
    {
        $this->attributes['career'] = strtoupper($value);
    }

    public function setCodeAttribute($value)
    {
        $this->attributes['code'] = strtoupper($value);
    }
    public function setNameAttribute($value)
    {
        $this->attributes['name'] = strtoupper($value);
    }
    public function setCostAttribute($value)
    {
        $this->attributes['cost'] = strtoupper($value);
    }
    public function setPhotoAttribute($value)
    {
        $this->attributes['photo'] = strtoupper($value);
    }
    public function setSummaryAttribute($value)
    {
        $this->attributes['summary'] = strtoupper($value);
    }
    public function setFreeAttribute($value)
    {
        $this->attributes['free'] = strtoupper($value);
    }
    public function setDurationAttribute($value)
    {
        $this->attributes['duration'] = strtoupper($value);
    }
    public function setObservationAttribute($value)
    {
        $this->attributes['observation'] = strtoupper($value);
    }
    public function setObjetiveAttribute($value)
    {
        $this->attributes['objetive'] = strtoupper($value);
    }
    public function setNeedsAttribute($value)
    {
        $this->attributes['needs'] = strtoupper($value);
    }
    public function setTargetGroupAttribute($value)
    {
        $this->attributes['target_group'] = strtoupper($value);
    }
    public function setFacilitiesAttribute($value)
    {
        $this->attributes['facilities'] = strtoupper($value);
    }
    public function setTheoreticalPhaseAttribute($value)
    {
        $this->attributes['theoretical_phase'] = strtoupper($value);
    }
    public function setRequiredInstallingSourceAttribute($value)
    {
        $this->attributes['required_installing_source'] = strtoupper($value);
    }
    public function setCrossCuttingTopicsAttribute($value)
    {
        $this->attributes['cross_cutting_topics'] = strtoupper($value);
    }
    public function setBibliographysAttribute($value)
    {
        $this->attributes['bibliographys'] = strtoupper($value);
    }
    public function setRequirementsAttribute($value)
    {
        $this->attributes['requirements'] = strtoupper($value);
    }
    public function setTeachingStrategiesAttribute($value)
    {
        $this->attributes['teaching_strategies'] = strtoupper($value);
    }
    public function setPracticeHoursAttribute($value)
    {
        $this->attributes['practice_hours'] = strtoupper($value);
    }
    public function setPracticsRequiredResourcesAttribute($value)
    {
        $this->attributes['practics_required_resources'] = strtoupper($value);
    }
    public function setAimtheoryRequiredResorcesAttribute($value)
    {
        $this->attributes['aimtheory_required_resorces'] = strtoupper($value);
    }
    public function setLearningTeachingStrategyAttribute($value)
    {
        $this->attributes['learning_teaching_strategy'] = strtoupper($value);
    }
    public function setNumberRecordAttribute($value)
    {
        $this->attributes['number_record'] = strtoupper($value);
    }
    public function setProposedDateAttribute($value)
    {
        $this->attributes['proposed_date'] = strtoupper($value);
    }
    public function setApprovedDateAttribute($value)
    {
        $this->attributes['approved_date'] = strtoupper($value);
    }
    public function setNeedDateAttribute($value)
    {
        $this->attributes['need_date'] = strtoupper($value);
    }
    public function setExpirationDateAttribute($value)
    {
        $this->attributes['expiration_date'] = strtoupper($value);
    }
    public function setLocalProposalAttribute($value)
    {
        $this->attributes['local_proposal'] = strtoupper($value);
    }
    public function setProjectAttribute($value)
    {
        $this->attributes['project'] = strtoupper($value);
    }
    public function setSetecNameAttribute($value)
    {
        $this->attributes['setec_name'] = strtoupper($value);
    }
    public function setAttachedAttribute($value)
    {
        $this->attributes['attached'] = strtoupper($value);
    }
    public function setAbbreviationAttribute($value)
    {
        $this->attributes['abbreviation'] = strtoupper($value);
    }
    public function setTechniquesRequisitesAttribute($value)
    {
        $this->attributes['techniques_requisites'] = strtoupper($value);
    }
    public function setEvaluationMechanimsAttribute($value)
    {
        $this->attributes['evaluation_mechanims'] = strtoupper($value);
    }
    public function setCategoryAttribute($value)
    {
        $this->attributes['category'] = strtoupper($value);
    }

    // Scopes
    public function scopeType($query, $type)
    {
        if ($type) {
            return $query->where('type', $type);
        }
    }

    public function scopeCustomOrderBy($query, $sorts)
    {
        if (!empty($sorts[0])) {
            foreach ($sorts as $sort) {
                $field = explode('-', $sort);
                if (empty($field[0]) && in_array($field[1], $this->fillable)) {
                    $query = $query->orderByDesc($field[1]);
                } else if (in_array($field[0], $this->fillable)) {
                    $query = $query->orderBy($field[0]);
                }
            }
            return $query;
        }
    }
    

    public function scopeCode($query, $code)
    {
        if($code){
            return $query->where('code', $code);
        }
    }

    public function scopePhoto($query, $photo)
    {
        if($photo){
            return $query->where('photo', $photo);
        }
    }

    public function scopeSummary($query, $summary)
    {
        if($summary){
            return $query->where('summary', $summary);
        }
    }

    public function scopeObservation($query, $observation)
    {
        if($observation){
            return $query->where('observation', $observation);
        }
    }

    public function scopeObjective($query, $objective)
    {
        if($objective){
            return $query->where('objective', $objective);
        }
    }

    public function scopeNeeds($query, $needs)
    {
        if($needs){
            return $query->where('needs', $needs);
        }
    }
    
    public function scopeTarget_group($query, $target_group)
    {
        if($target_group){
            return $query->where('target_group', $target_group);
        }
    }

    public function scopeFacilities($query, $facilities)
    {
        if($facilities){
            return $query->where('facilities', $facilities);
        }
    }

    public function scopeTheoretical_phase($query, $theoretical_phase)
    {
        if($theoretical_phase){
            return $query->where('theoretical_phase', $theoretical_phase);
        }
    }

    public function scopePractical_phase($query, $practical_phase)
    {
        if($practical_phase){
            return $query->where('practical_phase', $practical_phase);
        }
    }

    public function scopeRequiered_installing_sources($query, $practical_phase)
    {
        if($practical_phase){
            return $query->where('practical_phase', $practical_phase);
        }
    }

    public function scopeCross_cutting_topics($query, $cross_cutting_topics)
    {
        if($cross_cutting_topics){
            return $query->where('cross_cutting_topics', $cross_cutting_topics);
        }
    }


    public function scopeBibliographys($query, $bibliographys)
    {
        if($bibliographys){
            return $query->where('bibliographys', $bibliographys);
        }
    }

    public function scopeRequirements($query, $requirements)
    {
        if($requirements){
            return $query->where('requirements', $requirements);
        }
    }

    public function scopePractice_requiered_resources($query, $practice_requiered_resources)
    {
        if($practice_requiered_resources){
            return $query->where('practice_requiered_resources', $practice_requiered_resources);
        }
    }

    public function scopeAimtheory_required_resources($query, $aimtheory_required_resources)
    {
        if($aimtheory_required_resources){
            return $query->where('aimtheory_required_resources', $aimtheory_required_resources);
        }
    }

    public function scopeLearning_teaching_strategy($query, $learning_teaching_strategy)
    {
        if($learning_teaching_strategy){
            return $query->where('learning_teaching_strategy', $learning_teaching_strategy);
        }
    }

    public function scopeNro_record($query, $nro_record)
    {
        if($nro_record){
            return $query->where('nro_record', $nro_record);
        }
    }

    public function scopePerson_proposal_id($query, $person_proposal_id)
    {
        if($person_proposal_id){
            return $query->where('person_proposal_id', $person_proposal_id);
        }
    }

    public function scopeLocal_proposal($query, $local_proposal)
    {
        if($local_proposal){
            return $query->where('local_proposal', $local_proposal);
        }
    }

    public function scopeProject($query, $project)
    {
        if($project){
            return $query->where('project', $project);
        }
    }

    
}
