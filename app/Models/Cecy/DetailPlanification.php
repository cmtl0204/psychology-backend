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
        'day',
        'ended_at',
        'started_at',
        'plan_ended_at',
        'parallel',
        'workday',
    ];

    // Relationships
    public function planification()
    {
        return $this->belongsTo(Planification::class);
    }

    public function state()
    {
        return $this->belongsTo(State::class);
    }

    public function classroom()
    {
        return $this->belongsTo(Classroom::class);
    }

    public function day()
    {
        return $this->belongsTo(Day::class);
    }

    public function start_time()
    {
        return $this->belongsTo(Start_time::class);
    }

    public function end_time()
    {
        return $this->belongsTo(End_time::class);
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
