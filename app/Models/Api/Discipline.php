<?php

namespace App\Models\Api;

use App\Models\Auth\Traits\Method\RoleMethod;
use App\Models\Auth\Traits\Attribute\RoleAttribute;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Materials.
 */
class Discipline extends Model
{
    protected $table = 'disciplines';

    protected $fillable = ['name'];

    protected $timestamp = false;
}
