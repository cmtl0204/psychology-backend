<?php

namespace App\Models\Cecy;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use OwenIt\Auditing\Contracts\Auditable;
use OwenIt\Auditing\Auditable as Auditing;
use Illuminate\Database\Eloquent\SoftDeletes;

class Planification extends Model implements Auditable
{
    use HasFactory;
    use Auditing;
    use SoftDeletes;

    protected $table = 'cecy.planifications';

    protected $fillable = [
        'area',
        'needs',
        'sector',
        'started_at',
        'ended_at',
    ];

    // Relationships
    public function course()
    {
        return $this->belongsTo(Course::class);
    }

    public function schoolPeriod()
    {
        return $this->belongsTo(SchoolPeriod::class);
    }

    public function responsibleCourse()
    {
        return $this->belongsTo(Authoritie::class);
    }

    public function responsibleCecy()
    {
        return $this->belongsTo(Authoritie::class);
    }

    // Mutators
    public function setAreaAttribute($value)
    {
        $this->attributes['area'] = strtoupper($value);
    }

    public function setSectorAttribute($value)
    {
        $this->attributes['sector'] = strtoupper($value);
    }

    // Scopes
    public function scopeArea($query, $area)
    {
        if ($area) {
            return $query->where('area', $area);
        }
    }

    public function scopeSector($query, $sector)
    {
        if ($sector) {
            return $query->orWhere('sector', $sector);
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
