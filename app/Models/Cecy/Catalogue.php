<?php

namespace App\Models\Cecy;

use App\Models\Core\File;
use App\Models\Core\Image;
use App\Traits\FileTrait;
use App\Traits\ImageTrait;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use OwenIt\Auditing\Contracts\Auditable;
use OwenIt\Auditing\Auditable as Auditing;
use Illuminate\Database\Eloquent\SoftDeletes;

class Catalogue extends Model implements Auditable
{
    use HasFactory;
    use Auditing;
    use SoftDeletes;
    use FileTrait;
    use ImageTrait;

    protected $table = 'core.catalogues';

    protected $fillable = [
        'code',
        'icon',
        'name',
        'type',
    ];

    // Relationships
    public function parent()
    {
        return $this->belongsTo(Catalogue::class, 'parent_id', 'core.catalogues');
    }

    public function children()
    {
        return $this->hasMany(Catalogue::class, 'parent_id', 'core.catalogues');
    }

    public function files()
    {
        return $this->morphMany(File::class, 'fileable');
    }

    public function images()
    {
        return $this->morphMany(Image::class, 'imageable');
    }

    public function planifications()
    {
        return $this->hasMany(Planification::class);
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
    public function scopeType($query, $type)
    {
        if ($type) {
            return $query->where('type', $type);
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
