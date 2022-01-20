<?php

namespace App\Models\Cecy;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use OwenIt\Auditing\Contracts\Auditable;
use OwenIt\Auditing\Auditable as Auditing;
use Illuminate\Database\Eloquent\SoftDeletes;

class DetailSchoolPeriod extends Model implements Auditable
{
    use HasFactory;
    use Auditing;
    use SoftDeletes;

    protected $table = 'cecy.detail_school_periods';

    protected $fillable = [
        'anulation_ended_at',
        'anulation_started_at',
        'especial_ended_at',
        'especial_started_at',
        'extraordinary_ended_at',
        'extraordinary_started_at',
        'ordinary_ended_at',
        'ordinary_started_at',
    ];

    // Relationships

    public function state()
    {
        return $this->belongsTo(Catalogue::class);
    }

    public function planifications()
    {
        $this->hasMany(Planification::class);
    }

    public function schoolPeriod()
    {
        return $this->belongsTo(SchoolPeriod::class);
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
