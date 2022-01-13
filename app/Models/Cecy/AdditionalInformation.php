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

    protected $table = 'cecy.additional_informations';

    protected $fillable = [
        'company_activity',
        'company_address',
        'company_email',
        'company_name',
        'company_phone',
        'company_sponsor',
        'contact_name',
        'course_know',
        "course_follow",
        'worked',
    ];

    // Relationships
    public function registration()
    {
        return $this->belongsTo(Registration::class);
    }

    // Mutators
    public function setCompanyActivityAttribute($value)
    {
        $this->attributes['company_activity'] = strtoupper($value);
    }

    public function setCompanyAddressAttribute($value)
    {
        $this->attributes['company_address'] = strtoupper($value);
    }

    public function setCompanyEmailAttribute($value)
    {
        $this->attributes['company_email'] = strtoupper($value);
    }
    public function setCompanyNameAttribute($value)
    {
        $this->attributes['company_name'] = strtoupper($value);
    }
    public function setCompanyPhoneAttribute($value)
    {
        $this->attributes['company_phone'] = strtoupper($value);
    }
    public function setContactNameAttribute($value)
    {
        $this->attributes['contact_name'] = strtoupper($value);
    }

    // Scopes
    public function scopeCompanyActivity($query, $companyActivity)
    {
        if ($companyActivity) {
            return $query->where('company_activity', $companyActivity);
        }
    }

    public function scopeCompanyAddress($query, $companyAddress)
    {
        if ($companyAddress) {
            return $query->orWhere('company_address', $companyAddress);
        }
    }

    public function scopeCompanyEmail($query, $companyEmail)
    {
        if ($companyEmail) {
            return $query->orWhere('company_email', $companyEmail);
        }
    }

    public function scopeCompanyName($query, $companyName)
    {
        if ($companyName) {
            return $query->orWhere('company_name', $companyName);
        }
    }

    public function scopeCompanyPhone($query, $companyPhone)
    {
        if ($companyPhone) {
            return $query->orWhere('company_phone', $companyPhone);
        }
    }

    public function scopeContactName($query, $contactName)
    {
        if ($contactName) {
            return $query->orWhere('contact_name', $contactName);
        }
    }
    public function scopeLevelInstruction($query, $levelInstruction)
    {
        if ($levelInstruction) {
            return $query->orWhere('level_instruction', $levelInstruction);
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
