<?php

namespace App\Models\Cecy;

use App\Models\Authentication\User;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use OwenIt\Auditing\Contracts\Auditable;
use OwenIt\Auditing\Auditable as Auditing;
use Illuminate\Database\Eloquent\SoftDeletes;

class Classroom extends Model implements Auditable
{
    use HasFactory;
    use Auditing;
    use SoftDeletes;

    protected $table = 'cecy.classrooms';

    protected $fillable = [
        'description',
        'capacity',
        'code',
        'name',
    ];

    // Relationships

    public function type()
    {
        return $this->belongsTo(Catalogue::class);
    }

    public function detailPlanifications()
    {
        return $this->hasMany(DetailPlanification::class);
    }

    // Mutators
    public function setDescriptionAttribute($value)
    {
        $this->attributes['description'] = strtoupper($value);
    }

    public function setCodeAttribute($value)
    {
        $this->attributes['code'] = strtoupper($value);
    }

    public function setNameAttribute($value)
    {
        $this->attributes['name'] = strtoupper($value);
    }
    // Scopes

    public function scopeDescriptionSources($query, $description)
    {
        if ($description) {
            return $query->Where('description', $description);
        }
    }

    public function scopeCodeSources($query, $code)
    {
        if ($code) {
            return $query->Where('code', $code);
        }
    }

    public function scopeNameSources($query, $name)
    {
        if ($name) {
            return $query->Where('name', $name);
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
