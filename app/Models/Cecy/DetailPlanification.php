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
        'code',
        'days_number',
        'ended_at',
        'end_time_id',
        'observation',
        'plan_ended_at',
        'started_at',
        'start_time_id',
    ];

    // Relationships
    public function classroom()
    {
        return $this->belongsTo(Classroom::class);
    }
    public function day()
    {
        return $this->belongsTo(Catalogue::class);
    }
    public function planification()
    {
        return $this->belongsTo(Planification::class);
    }

    public function state()
    {
        return $this->belongsTo(Catalogue::class);
    }

    public function detailInstructors()
    {
        return $this->hasMany(DetailInstructor::class);
    }

    public function instructors()
    {
        return $this->belongsToMany(
            Instructor::class,
            'detail_instructors',
            'detail_planification_id',
            'instructor_id'
        );
    }

    // Mutators

    // Scopes
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
