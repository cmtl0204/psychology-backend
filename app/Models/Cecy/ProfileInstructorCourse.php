<?php

namespace App\Models\Cecy;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use OwenIt\Auditing\Contracts\Auditable;
use OwenIt\Auditing\Auditable as Auditing;
use Illuminate\Database\Eloquent\SoftDeletes;

class ProfileInstructorCourse extends Model implements Auditable
{
    use HasFactory;
    use Auditing;
    use SoftDeletes;

    protected $table = 'cecy.profile_instructor_courses';

    protected $fillable = [
        'require_experience',
        'require_knowledge',
        'require_skills',
    ];

    // Relationships
    public function course()
    {
        return $this->belongsTo(Course::class);
    }
    public function instructors()
    {
        return $this->belongsToMany(Instructor::class, 'authorized_instructors', 'instructor_id', 'profile_instructor_id');
    }
    // Mutators

    //Mis campos son de tipo JSON

    // Scopes
    
    // Mis campos son de  tipo JSON 
    

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
