<?php

namespace App\Models\Cecy;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use OwenIt\Auditing\Contracts\Auditable;
use OwenIt\Auditing\Auditable as Auditing;
use Illuminate\Database\Eloquent\SoftDeletes;

class DetailInformation extends Model implements Auditable
{
    use HasFactory;
    use Auditing;
    use SoftDeletes;

    protected $table = 'cecy.detail_informations';

    protected $fillable = [
        'code_certified',
        'day',
        'ended_at',
        'started_at',
        'state_certified',
        'plan_ended_at',
        'parallel',
        'workday',
    ];

    // Relationships
    public function planification()
    {
        return $this->belongsTo(Planification::class, 'planification_id','core.catalogues');
    }

    public function state()
    {
        return $this->belongsTo(State::class, 'state_id','cecy.catalogues');
    }

    public function classroom()
    {
        return $this->belongsTo(Classroom::class, 'classroom_id','cecy.catalogues');
    }

    public function day()
    {
        return $this->belongsTo(Day::class, 'day_id','cecy.catalogues');
    }

    public function start_time()
    {
        return $this->belongsTo(Start_time::class, 'start_time_id','cecy.catalogues');
    }

    public function end_time()
    {
        return $this->belongsTo(End_time::class, 'end_time_id','cecy.catalogues');
    }

    // Mutators
    public function setCodeCertifiedAttribute($value)
    {
        $this->attributes['code_certified'] = strtoupper($value);
    }

    public function setDayAttribute($value)
    {
        $this->attributes['day'] = strtoupper($value);
    }

    public function setEndedAtAttribute($value)
    {
        $this->attributes['ended_at'] = strtoupper($value);
    }

    public function setStartedAtAttribute($value)
    {
        $this->attributes['started_at'] = strtoupper($value);
    }

    public function setStateCertifiedAttribute($value)
    {
        $this->attributes['state_certified'] = strtoupper($value);
    }

    public function setPlanEndedAtAttribute($value)
    {
        $this->attributes['plan_ended_at'] = strtoupper($value);
    }

    public function setParallelAttribute($value)
    {
        $this->attributes['parallel'] = strtoupper($value);
    }

    public function setWorkdayAttribute($value)
    {
        $this->attributes['workday'] = strtoupper($value);
    }

    // Scopes
    public function scopeCodeCertified($query, $code_certified)
    {
        if ($code_certified) {
            return $query->where('code_certified', $code_certified);
        }
    }

    public function scopeStateCertified($query, $state_certified)
    {
        if ($state_certified) {
            return $query->where('state_certified', $state_certified);
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
