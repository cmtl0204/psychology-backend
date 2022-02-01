<?php

namespace App\Models\Cecy;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use OwenIt\Auditing\Auditable as Auditing;

class DetailAttendance extends Model
{
    use HasFactory;
    use Auditing;
    use SoftDeletes;

    protected $table = 'cecy.detail_attendances';

    protected $fillable = [];

    // Relationships
    public function attendance()
    {
        return $this->hasMany(Attendance::class);
    }
    public function registrations()
    {
        return $this->hasMany(Registration::class);
    }
    public function catalogue()
    {
        return $this->hasMany(Catalogue::class);
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
