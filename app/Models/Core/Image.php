<?php

namespace App\Models\Core;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use OwenIt\Auditing\Contracts\Auditable;
use OwenIt\Auditing\Auditable as Auditing;
use phpseclib3\Math\BigInteger;
use Illuminate\Database\Eloquent\SoftDeletes;

/**
 * @property BigInteger id
 * @property string name
 * @property string description
 * @property string extension
 * @property string directory
 */
class Image extends Model implements Auditable
{
    use HasFactory;
    use Auditing;
    use SoftDeletes;

    protected $table = 'core.images';

    protected $fillable = [
        'name',
        'description',
        'extension',
        'directory',
    ];

    protected $appends = ['full_name', 'full_path', 'partial_path'];

    // Relationships
    public function imageable()
    {
        return $this->morphTo();
    }

    // Scopes
    public function scopeDescription($query, $description)
    {
        if ($description && $description != 'null') {
            return $query->orWhere('descriptions', 'ILIKE', "%$description%");
        }
    }

    public function scopeName($query, $name)
    {
        if ($name && $name != 'null') {
            return $query->orWhere('names', 'ILIKE', "%$name%");
        }
    }

    // Accessors
    public function getFullNameAttribute()
    {
        return "{$this->attributes['name']}.{$this->attributes['extension']}";
    }

    public function getFullPathAttribute()
    {
        return "{$this->attributes['directory']}";
    }

    public function getPartialPathAttribute()
    {
        return "{$this->attributes['id']}.{$this->attributes['extension']}";
    }

    public function setExtensionAttribute($value)
    {
        $this->attributes['extension'] = strtolower($value);
    }
}
