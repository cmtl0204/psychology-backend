<?php

namespace App\Models\Cecy;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use OwenIt\Auditing\Auditable as Auditing;

class Requirement extends Model
{
    use HasFactory;
    use Auditing;
    use SoftDeletes;

    protected $table = 'cecy.requirements';

    protected $fillable = [
        'name',
        'required',
    ];

    // Relationships

    public function registrations()
    {
        return $this->belongsToMany(Registration::class);
    }
    public function state()
    {
        return $this->belongsTo(Catalogue::class);
    }

    // Mutators
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
    
    public function scopeName($query, $name)
    {
        if ($name) {
            return $query->where('name', $name);
        }
    }

    public function scopeState($query, $requirement)
    {
        if ($requirement) {
            return $query->where('state_id', $requirement->state);
        }
    }

   
}
