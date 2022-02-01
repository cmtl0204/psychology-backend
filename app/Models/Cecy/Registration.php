<?php

namespace App\Models\Cecy;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use OwenIt\Auditing\Contracts\Auditable;
use OwenIt\Auditing\Auditable as Auditing;
use Illuminate\Database\Eloquent\SoftDeletes;

class Registration extends Model implements Auditable
{
    use HasFactory;
    use Auditing;
    use SoftDeletes;

    protected $table = 'cecy.registrations';

    protected $fillable = [
        'final_grade',
        'grade1',
        'grade2',
        'number',
        'observations',
        'registered_at',
    ];

    public function additionalInformation()
    {
        $this->hasOne(AdditionalInformation::class);
    }

    public function certificates()
    {
        return $this->morphMany(Certificate::class, 'certificateable');
    }
    // Relationships
    public function detailPlanification()
    {
        return $this->belongsTo(DetailPlanification::class);
    }

    public function participant()
    {
        return $this->belongsTo(Participant::class);
    }

    public function requirements()
    {
        $this->belongsToMany(Requirement::class);
    }

    public function state()
    {
        return $this->belongsTo(Catalogue::class);
    }

    public function stateCourse()
    {
        return $this->belongsTo(Catalogue::class);
    }

    public function type()
    {
        return $this->belongsTo(Catalogue::class);
    }

    public function typeParticipant()
    {
        return $this->belongsTo(Catalogue::class);
    }

    // Mutators
    public function setObservationsAttribute($value)
    {
        $this->attributes['observations'] = strtoupper($value);
    }
    // Scopes
    public function scopeCode($query, $observations)
    {
        if ($observations) {
            return $query->orWhere('observations', $observations);
        }
    }
    public function scopeDetailPlanification($query, $detailPlanification)
    {
        if ($detailPlanification) {
            return $query->orWhere('detail_planification_id', $detailPlanification->id);
        }
    }
    public function scopeParticipant($query, $participant)
    {
        if ($participant) {
            return $query->orWhere('participant_id', $participant->id);
        }
    }
    public function scopeState($query, $state)
    {
        if ($state) {
            return $query->orWhere('state_id', $state->id);
        }
    }
    public function scopeStateCourse($query, $stateCourse)
    {
        if ($stateCourse) {
            return $query->orWhere('state_course_id', $stateCourse->id);
        }
    }
    public function scopeType($query, $type)
    {
        if ($type) {
            return $query->orWhere('type_id', $type->id);
        }
    }
    public function scopeTypeParticipant($query, $typeParticipant)
    {
        if ($typeParticipant) {
            return $query->orWhere('type_participant_id', $typeParticipant->id);
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
