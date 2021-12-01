<?php

namespace App\Models\Core;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use OwenIt\Auditing\Contracts\Auditable;
use OwenIt\Auditing\Auditable as Auditing;
use Illuminate\Database\Eloquent\SoftDeletes;

class Address extends Model implements Auditable
{
    use HasFactory;
    use Auditing;
    use SoftDeletes;

    protected $table = 'core.address';

    protected $fillable = [
        'latitude',
        'longitude',
        'main_street',
        'secondary_street',
        'number',
        'post_code',
        'reference',
    ];

    function location()
    {
        return $this->belongsTo(Location::class);
    }
    function sector()
    {
        return $this->belongsTo(Catalogue::class);
    }
    // Mutators
    public function setMainStreetAttribute($value)
    {
        $this->attributes['main_street'] = strtoupper($value);
    }

    public function setSecondaryStreetAttribute($value)
    {
        $this->attributes['secondary_street'] = strtoupper($value);
    }

    public function setNumberAttribute($value)
    {
        $this->attributes['number'] = strtoupper($value);
    }

    public function setPostCodeAttribute($value)
    {
        $this->attributes['post_code'] = strtoupper($value);
    }

}
