<?php

namespace App\Models\Cecy;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use OwenIt\Auditing\Auditable as Auditing;

class Attendance extends Model
{
    use HasFactory;
    use Auditing;
    use SoftDeletes;

    protected $table = 'cecy.attendances';

    protected $fillable = [

        'duration',
        'registered_at',

    ];
    // Relationships

    public function parent()
    {
        return $this->hasMany(Attendance::class,  'detail_registration_id','cecy.detail_registration');
    }

    public function children()
    {
        return $this->belongsTo(Attendance::class, 'type_id','cecy.catalogues');
    }

    
    // Mutators
    public function setDurationAttribute($value)
    {
        $this->attributes['duration'] = strtoupper($value);
    }

    // Scopes
    public function scopeDuration($query, $company_activity)
    {
        if ($company_activity) {
            return $query->where('duration', $company_activity);
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
