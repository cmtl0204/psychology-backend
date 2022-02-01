<?php

namespace App\Models\Cecy;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use OwenIt\Auditing\Contracts\Auditable;
use OwenIt\Auditing\Auditable as Auditing;
use Illuminate\Database\Eloquent\SoftDeletes;

class Institution extends Model implements Auditable
{
    use HasFactory;
    use Auditing;
    use SoftDeletes;

    protected $table = 'cecy.institutions';

    protected $fillable = [
        'code',
        'logo',
        'name',
        'slogan'
    ];

    public function authorities()
    {
        $this->hasMany(Authority::class);
    }

    // Mutators
    public function setCodeAttribute($value)
    {
        $this->attributes['code'] = strtoupper($value);
    }

    public function setLogoAttribute($value)
    {
        $this->attributes['logo'] = strtoupper($value);
    }

    public function setNameAttribute($value)
    {
        $this->attributes['name'] = strtoupper($value);
    }

    public function setSloganAttribute($value)
    {
        $this->attributes['slogan'] = strtoupper($value);
    }

    //scopes
    public function scopeCode($query, $code)
    {
        if ($code) {
            return $query->where('code', $code);
        }
    }

    public function scopeName($query, $name)
    {
        if ($name) {
            return $query->where('name', $name);
        }
    }

    // public function scopeLogo($query, $logo)
    // {
    //     if ($logo) {
    //         return $query->where('logo', $logo);
    //     }
    // }

    public function scopeSlogan($query, $slogan)
    {
        if ($slogan) {
            return $query->where('slogan', $slogan);
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
