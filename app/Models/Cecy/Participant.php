<?php

namespace App\Models\Cecy;

use App\Models\Authentication\User;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use OwenIt\Auditing\Contracts\Auditable;
use OwenIt\Auditing\Auditable as Auditing;
use Illuminate\Database\Eloquent\SoftDeletes;

class Participant extends Model implements Auditable
{
    use HasFactory;
    use Auditing;
    use SoftDeletes;

    protected $table = 'cecy.participants';


    // Relationships
    public function user()
    {
        return $this->belongsTo(User::class,  'user_id','authentication.users');
    }
    
    public function additional_information()
    {
        return $this->belongsTo(AdditionalInformation::class,  'additional_information_id','cecy.additional_informations');
    }
    
    public function person_type()
    {
        return $this->belongsTo(Catalogue::class,  'user_id','cecy.catalogues');
    }

    public function registration()
    {
        return $this->hasMany(Registrations::class, 'participant_id','cecy.participants');
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
