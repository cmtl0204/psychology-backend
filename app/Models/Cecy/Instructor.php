<?php

namespace App\Models\Cecy;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use OwenIt\Auditing\Contracts\Auditable;
use OwenIt\Auditing\Auditable as Auditing;
use Illuminate\Database\Eloquent\SoftDeletes;

class Instructor extends Model implements Auditable
{
    use HasFactory;
    use Auditing;
    use SoftDeletes;

    protected $table = 'cecy.instructors';

    protected $fillable = [];

    // Relationships

    public function certificates()
    {
        return $this->morphMany(Certificate::class, 'certificateable');
    }

    public function courses()
    {
        return $this->hasMany(Course::class);
    }

    public function state()
    {
        return $this->belongsTo(State::class);
    }

    public function type()
    {
        return $this->belongsTo(Type::class);
    }

    public function user()
    {
        return $this->belongsTo(User::class);
    }
    public function detailInstructors()
    {
        $this->hasMany(DetailInstructor::class);
    }

    public function planifications()
    {
        return $this->hasMany(Planification::class);
    }


    public function detailPlanifications()
    {
        return $this->belongsToMany(DetailPlanification::class, 'detail_planification_instructor', 'instructor_id', 'detail_planification_id');
    }

    public function profileInstructorCourses()
    {
        return $this->belongsToMany(ProfileInstructorCourse::class, 'authorized_instructors', 'profile_instructor_id', 'instructor_id');
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
