<?php

namespace App\Models\Cecy;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use OwenIt\Auditing\Contracts\Auditable;
use OwenIt\Auditing\Auditable as Auditing;
use Illuminate\Database\Eloquent\SoftDeletes;

class DetailPlanification extends Model implements Auditable
{
    use HasFactory;
    use Auditing;
    use SoftDeletes;

    protected $table = 'cecy.detail_planifications';
    
    protected $fillable = [
        'ended_time',
        'observations',
        'plan_ended_at',
        'registrations_left',
        'started_time',
    ];
    
    // Relationships
    public function attendaces()
    {
        return $this->hasMany(Attendance::class);
    }

    public function certificates()
    {
        return $this->morphMany(Certificate::class, 'certificateable');
    }

    public function classroom()
    {
        return $this->belongsTo(Classroom::class);
    }

    public function day()
    {
        return $this->belongsTo(Catalogue::class);
    }
    
    public function instructors()
    {
        return $this->belongsToMany(Instructor::class, 'detail_planification_instructor', 'detail_planification_id', 'instructor_id');
    }

    public function parallel()
    {
        return $this->belongsTo(Catalogue::class);
    }

    public function planification()
    {
        return $this->belongsTo(Planification::class);
    }

    public function photographicRecords()
    {
        return $this->hasMany(PhotograficRecord::class);
    }

    public function registrations()
    {
        return $this->hasMany(Registration::class);
    }
    
    public function state()
    {
        return $this->belongsTo(Catalogue::class);
    }

    public function workday()
    {
        return $this->belongsTo(Catalogue::class);
    }
    
    // Mutators

    // Scopes
    public function scopeEndedTime($query, $endedTime)
    {
        if ($endedTime) {
            return $query->where('ended_time', $endedTime);
        }
    }

    public function scopeObservations($query, $observations)
    {
        if ($observations) {
            return $query->where('observations', $observations);
        }
    }

    public function scopePlanEndedAt($query, $planEndedAt)
    {
        if ($planEndedAt) {
            return $query->where('plan_ended_at', $planEndedAt);
        }
    }

    public function scopeRegistrationsLeft($query, $registrationsLeft)
    {
        if ($registrationsLeft) {
            return $query->where('registrations_left', $registrationsLeft);
        }
    }

    public function scopeStartedTime($query, $startedTime)
    {
        if ($startedTime) {
            return $query->where('started_time', $startedTime);
        }
    }

    public function scopePlanification($query, $planification)
    {
        if ($planification) {
            return $query->orWhere('planification_id', $planification->id);
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
