<?php

namespace App\Models\Psychology;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use OwenIt\Auditing\Auditable as Auditing;
use OwenIt\Auditing\Contracts\Auditable;

class Question extends Model implements Auditable
{
    use HasFactory;
    use Auditing;

    protected $table = 'psychology.questions';

    protected $fillable = [
        'order',
        'type',
        'value',
    ];

    public function answers()
    {
        return $this->hasMany(Answer::class);
    }

    public function scopeType($query, $type)
    {
        if ($type) {
            return $query->where('type', '=', $type);
        }
    }

    public function scopeValue($query, $value)
    {
        if ($value) {
            return $query->where('value', 'ILIKE', "%$value%");
        }
    }
}




