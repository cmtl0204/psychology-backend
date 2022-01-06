<?php

namespace App\Models\Cecy;

use App\Models\Authentication\User;
use App\Models\Core\Institution;
use App\Models\Core\State;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use OwenIt\Auditing\Auditable as Auditing;

class AdditionalInformation extends Model
{
    use HasFactory;
    use Auditing;
    use SoftDeletes;

    protected $table = 'cecy.authorities';

    protected $fillable = [
        'position_started_at',
        'position_ended_at',
    ];
    // Relationships

    public function institution()
    {
        return $this->hasMany(Institution::class, 'institution_id', 'core.institutions');
    }
    public function user()
    {
        return $this->hasMany(User::class, 'user_id', 'authentication.users');
    }
    public function state()
    {
        return $this->hasMany(State::class, 'state_id', 'cecy.catalogues');
    }
    public function position()
    {
        return $this->hasMany(State::class, 'position_id', 'cecy.catalogues');
    }

    // Mutators
    public function setPositionStartedAttribute($value)
    {
        $this->attributes['position_started_at'] = strtoupper($value);
    }

    public function setPositionEndedAttribute($value)
    {
        $this->attributes['position_ended_at'] = strtoupper($value);
    }


    // Scopes
    public function scopePositionStarted($query, $position_started_at)
    {
        if ($position_started_at) {
            return $query->where('position_started_at', $position_started_at);
        }
    }

    public function scopePositionEnded($query, $position_ended_at)
    {
        if ($position_ended_at) {
            return $query->where('position_ended_at', $position_ended_at);
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
