<?php

namespace App\Models\Cecy;

use App\Models\Core\Career;
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
        'abbreviation',
        'aimtheory_required_resources',
        'alignment',
        'approved_at',
        'attached',
        'authorized_at',
        'bibliographies',
        'category',
        'code',
        'cost',
        'cross_cutting_topics',
        'duration',
        'evaluation_mechanisms',
        'expired_at',
        'facilities',
        'free',
        'name',
        'needs',
        'needed_at',
        'nro_record',
        'learning_environments',
        'local_proposal',
        'objective',
        'observation',
        'practical_phase',
        'practice_hours',
        'practice_required_resources',
        'proposed_at',
        'project',
        'required_installing_sources',
        'setec_name',
        'summary',
        'target_group',
        'teaching_strategies',
        'techniques_requisites',
        'theoretical_phase',
        'theory_hours'
    ];

    // Relationships
    public function academicPeriod()
    {
        return $this->belongsTo(Catalogue::class);
    }

    public function authority()
    {
        return $this->belongsTo(Authority::class);
    }

    public function area()
    {
        return $this->belongsTo(Catalogue::class);
    }

    public function career()
    {
        return $this->belongsTo(Career::class);
    }

    public function certifiedType()
    {
        return $this->belongsTo(Catalogue::class);
    }

    public function courseType()
    {
        return $this->belongsTo(Catalogue::class);
    }

    public function level()
    {
        return $this->belongsTo(Catalogue::class);
    }

    public function modality()
    {
        return $this->belongsTo(Catalogue::class);
    }

    public function participantType()
    {
        return $this->belongsTo(Catalogue::class);
    }

    public function personProposal() //¿Qué es?
    {
        return $this->belongsTo(Catalogue::class);
    }

    public function schedule()
    {
        return $this->belongsTo(Catalogue::class);
    }

    public function speciality()
    {
        return $this->belongsTo(Catalogue::class);
    }

    // Mutators
    public function setAbbreviationAttribute($value)
    {
        $this->attributes['abbreviation'] = strtoupper($value);
    }

    public function setAimtheoryRequiredResourcesAttribute($value)
    {
        $this->attributes['aimtheory_required_resources'] = strtoupper($value);
    }

    public function setCategoryAttribute($value)
    {
        $this->attributes['category'] = strtoupper($value);
    }

    public function setCodeAttribute($value)
    {
        $this->attributes['code'] = strtoupper($value);
    }

    public function setNameAttribute($value)
    {
        $this->attributes['name'] = strtoupper($value);
    }

    public function setNroRecordAttribute($value)
    {
        $this->attributes['record_number'] = strtoupper($value);
    }

    public function setLearningTeachingStrategyAttribute($value)
    {
        $this->attributes['learning_teaching_strategy'] = strtoupper($value);
    }

    public function setLocalProposalAttribute($value)
    {
        $this->attributes['local_proposal'] = strtoupper($value);
    }

    public function setObjectiveAttribute($value)
    {
        $this->attributes['objective'] = strtoupper($value);
    }

    public function setObservationAttribute($value)
    {
        $this->attributes['observation'] = strtoupper($value);
    }

    public function setPracticeRequiredResourcesAttribute($value)
    {
        $this->attributes['practice_required_resources'] = strtoupper($value);
    }

    public function setProjectAttribute($value)
    {
        $this->attributes['project'] = strtoupper($value);
    }

    public function setRequiredInstallingSourcesAttribute($value)
    {
        $this->attributes['required_installing_sources'] = strtoupper($value);
    }

    public function setSetecNameAttribute($value)
    {
        $this->attributes['setec_name'] = strtoupper($value);
    }

    public function setSummaryAttribute($value)
    {
        $this->attributes['summary'] = strtoupper($value);
    }

    // Scopes

    public function scopeAbbreviation($query, $abbreviation)
    {
        if ($abbreviation) {
            return $query->where('abbreviation', $abbreviation);
        }
    }

    public function scopeAimtheoryRequiredResource($query, $aimtheory_required_resources)
    {
        if ($aimtheory_required_resources) {
            return $query->orWhere('aimtheory_required_resources', $aimtheory_required_resources);
        }
    }

    public function scopeAlignment($query, $alignment)
    {
        if ($alignment) {
            return $query->orWhere('alignment', $alignment);
        }
    }

    public function scopeCategory($query, $category)
    {
        if ($category) {
            return $query->orWhere('category', $category);
        }
    }

    public function scopeCode($query, $code)
    {
        if ($code) {
            return $query->orWhere('category', $code);
        }
    }

    public function scopeName($query, $name)
    {
        if ($name) {
            return $query->orWhere('name', $name);
        }
    }

    public function scopeNroRecord($query, $nro_record)
    {
        if ($nro_record) {
            return $query->orWhere('nro_record', $nro_record);
        }
    }

    public function scopeLocalProposal($query, $local_proposal)
    {
        if ($local_proposal) {
            return $query->orWhere('local_proposal', $local_proposal);
        }
    }

    public function scopeObjective($query, $objective)
    {
        if ($objective) {
            return $query->orWhere('objective', $objective);
        }
    }

    public function scopeObservation($query, $observation)
    {
        if ($observation) {
            return $query->orWhere('observation', $observation);
        }
    }

    public function scopePracticeRequiredResources($query, $practice_required_resources)
    {
        if ($practice_required_resources) {
            return $query->orWhere('practice_required_resources', $practice_required_resources);
        }
    }

    public function scopeProject($query, $project)
    {
        if ($project) {
            return $query->orWhere('project', $project);
        }
    }

    public function scopeRequiredInstallingSources($query, $required_installing_sources)
    {
        if ($required_installing_sources) {
            return $query->orWhere('required_installing_sources', $required_installing_sources);
        }
    }

    public function scopeSetecName($query, $setec_name)
    {
        if ($setec_name) {
            return $query->orWhere('setec_name', $setec_name);
        }
    }

    public function scopeSummary($query, $summary)
    {
        if ($summary) {
            return $query->orWhere('summary', $summary);
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
}
