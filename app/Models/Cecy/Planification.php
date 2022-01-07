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
        'ended_at',
        'especial_ended_date_at',
        'especial_started_date_at',
        'extraordinary_inscription_ended_at',
        'extraordinary_inscription_started_at',
        'needs',
        'ordinary_inscription_ended_at',
        'ordinary_inscription_started_at',
        'started_at'
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
