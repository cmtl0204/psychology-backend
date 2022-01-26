<?php

namespace App\Models\Core;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use OwenIt\Auditing\Contracts\Auditable;
use OwenIt\Auditing\Auditable as Auditing;
use Illuminate\Database\Eloquent\SoftDeletes;

class Career extends Model implements Auditable
{
    use HasFactory;
    use Auditing;
    use SoftDeletes;

    protected $table = 'core.careers';

    protected $fillable = [
        'acronym',
        'code',
        'description',
        'name',
        'resolution_number',
        'title',
    ];

    // Relationships
    public function institution()
    {
        return $this->belongsTo(Institution::class);
    }

    public function modality()
    {
        return $this->belongsTo(Catalogue::class);
    }

    public function type()
    {
        return $this->belongsTo(Catalogue::class);
    }

    public function courses()
    {
        $this->hasMany(Course::class);
    }

    public function scopeAcronym($query, $acronym)
    {
        if ($acronym) {
            return $query->orWhere('acronym', 'ILIKE', "%$acronym%");
        }
    }

    public function scopeDescription($query, $description)
    {
        if ($description) {
            return $query->orWhere('description', 'ILIKE', "%$description%");
        }
    }

    public function scopeName($query, $name)
    {
        if ($name) {
            return $query->orWhere('name', 'ILIKE', "%$name%");
        }
    }

    public function scopeResolutionNumber($query, $resolutionNumber)
    {
        if ($resolutionNumber) {
            return $query->orWhere('resolutionNumber', 'ILIKE', "%$resolutionNumber%");
        }
    }

    public function scopeTitle($query, $title)
    {
        if ($title) {
            return $query->orWhere('title', 'ILIKE', "%$title%");
        }
    }
}
