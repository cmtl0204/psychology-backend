<?php

namespace App\Models\Cecy;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use OwenIt\Auditing\Contracts\Auditable;
use OwenIt\Auditing\Auditable as Auditing;
use Illuminate\Database\Eloquent\SoftDeletes;

class ProfileInstructionCourse extends Model implements Auditable
{
    use HasFactory;
    use Auditing;
    use SoftDeletes;

    protected $table = 'cecy.profile_instruction_courses';

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

    public function children()
    {
        return $this->hasMany(Catalogue::class, 'parent_id','core.catalogues');
    }

    // Mutators

    public function setRequiredSkillsAttribute($value)
    {
        $this->attributes['required_skills'] = strtoupper($value);
    }
    public function setRequiredExperienceAttribute($value)
    {
        $this->attributes['required_experience'] = strtoupper($value);
    }
    public function setRequiredKnowledgeAttribute($value)
    {
        $this->attributes['required_knowledge'] = strtoupper($value);
    }

    // Scopes
    public function scopeRequireSkills($query, $RequireSkills)
    {
        if ($RequireSkills) {
            return $query->where('RequireSkills', $RequireSkills);
        }
    }

    public function scopeRequireExperience($query, $RequireExperience)
    {
        if ($RequireExperience) {
            return $query->where('RequireExperience', $RequireExperience);
        }
    }
    public function scopeRequireKnowledge($query, $RequireKnowledge)
    {
        if ($RequireKnowledge) {
            return $query->where('Knowledge', $RequireKnowledge);
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
