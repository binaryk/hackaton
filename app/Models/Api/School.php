<?php

namespace App\Models\Api;

use App\Models\Auth\Traits\Method\RoleMethod;
use App\Models\Auth\Traits\Attribute\RoleAttribute;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Role.
 */
class School extends Model
{
    protected $table = 'schools';

    protected $fillable = ['name', 'city'];

    protected $timestamp = false;
}
