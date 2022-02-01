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
    public function detailPlanifications()
    {
        return $this->hasMany(DetailPlanification::class);
    }

    public function type()
    {
        return $this->belongsTo(Catalogue::class);
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
    
    public function scopeDescription($query, $description)
    {
        if ($description) {
            return $query->Where('description', $description);
        }
    }

    public function scopeCode($query, $code)
    {
        if ($code) {
            return $query->Where('code', $code);
        }
    }

    public function scopeName($query, $name)
    {
        if ($name) {
            return $query->Where('name', $name);
        }
    }

    public function scopeType($query, $classroom)
    {
        if ($classroom) {
            return $query->Where('type_id', $classroom->type);
        }
    }
}
