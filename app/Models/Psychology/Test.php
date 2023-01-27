<?php

namespace App\Models\Psychology;

use App\Models\Authentication\User;
use App\Models\Core\Location;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use OwenIt\Auditing\Auditable as Auditing;
use OwenIt\Auditing\Contracts\Auditable;

class Test extends Model implements Auditable
{
    use HasFactory;
    use Auditing;
    use SoftDeletes;

    protected $table = 'psychology.tests';

    protected $fillable = [
        'terms_conditions',
        'type',
        'score',
    ];

    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function priority()
    {
        return $this->belongsTo(Priority::class);
    }

    public function province()
    {
        return $this->belongsTo(Location::class);
    }

    public function canton()
    {
        return $this->belongsTo(Location::class);
    }

    public function state()
    {
        return $this->belongsTo(State::class)->orderBy('order');
    }

    public function questions()
    {
        return $this->hasMany(Question::class);
    }

    public function answers()
    {
        return $this->hasMany(Answer::class);
    }

    public function results()
    {
        return $this->hasMany(Result::class);
    }

    public function assignment()
    {
        return $this->hasOne(Assignment::class);
    }

    public function agent()
    {
        return $this->hasOne(Agent::class);
    }

    //Calcula la nota obtenida por el test
    public function grade()
    {

    }

    //Tiene las reglas de negocio para definir la prioridad de atencion
    public function setPriority()
    {
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

    public function scopeCustomSelect($query, $fields)
    {
        if (!empty($fields)) {
            $fields = explode(',', $fields);
            foreach ($fields as $field) {
                $fieldExist = array_search(strtolower($field), $fields);
                if ($fieldExist == false) {
                    unset($fields[$fieldExist]);
                }
            }

            array_unshift($fields, 'id');
            return $query->select($fields);
        }
    }

    public function scopeDate($query, $dates)
    {
        if ($dates) {
            return $query->whereBetween('tests.created_at', $dates);
        }
    }

    public function scopeProvinces($query, $provinces)
    {
        if ($provinces[0] !== '') {
            return $query->whereIn('province_id', $provinces);
        }
    }

    public function scopeStates($query, $states)
    {
        if ($states[0] !== '') {
            return $query->whereIn('state_id', $states);
        }
    }

    public function scopePriorities($query, $priorities)
    {
        if ($priorities[0] !== '') {
            return $query->whereIn('priority_id', $priorities);
        }
    }

    public function scopeCode($query, $code)
    {
        if ($code) {
            return $query->orWhere('tests.code', 'iLike', "%$code%");
        }
    }

    public function scopeUser($query, $user)
    {
        if ($user) {
            return $query->orWhereHas('user', function ($q) use ($user) {
                $q->where('username', 'iLike', "%$user%")
                    ->orWhere('name', 'iLike', "%$user%")
                    ->orWhere('lastname', 'iLike', "%$user%");
            });
        }
    }

    public function scopeAge($query, $age)
    {
        if ($age) {
            if ($age == 18) {
                return $query->where('age', '>=', 18);
            } else {
                return $query->where('age', '<', 18);
            }

        }
    }
}


