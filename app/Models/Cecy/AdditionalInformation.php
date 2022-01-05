<?php

namespace App\Models\Cecy;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use OwenIt\Auditing\Auditable as Auditing;

class AdditionalInformation extends Model
{
    use HasFactory;
    use Auditing;
    use SoftDeletes;

    protected $table = 'cecy.additional_information';

    protected $fillable = [
        'company_activity',
        'company_address',
        'company_email',
        'company_name',
        'company_phone',
        'company_sponsor',
        'contact_name',
        'level_instruction',
        'know_course',
        "course_follow",
        'worked',
    ];
    // Relationships

    public function children()
    {
        return $this->hasMany(Catalogue::class, 'parent_id','core.catalogues');
    }

    // Mutators
    public function setCodeAttribute($value)
    {
        $this->attributes['code'] = strtoupper($value);
    }

    public function setNameAttribute($value)
    {
        $this->attributes['name'] = strtoupper($value);
    }

    // Scopes
    public function scopeCompanyActivity($query, $company_activity)
    {
        if ($company_activity) {
            return $query->where('company_activity', $company_activity);
        }
    }

    public function scopeCompanyAddress($query, $company_address)
    {
        if ($company_address) {
            return $query->where('company_address', $company_address);
        }
    }

    public function scopeCompanyEmail($query, $company_email)
    {
        if ($company_email) {
            return $query->where('company_email', $company_email);
        }
    }

    public function scopeCompanyName($query, $company_name)
    {
        if ($company_name) {
            return $query->where('company_name', $company_name);
        }
    }

    public function scopeCompanyPhone($query, $company_phone)
    {
        if ($company_phone) {
            return $query->where('company_phone', $company_phone);
        }
    }

    public function scopeContactName($query, $contact_name)
    {
        if ($contact_name) {
            return $query->where('contact_name', $contact_name);
        }
    }
    public function scopeLevelInstruction($query, $level_instruction)
    {
        if ($level_instruction) {
            return $query->where('level_instruction', $level_instruction);
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
