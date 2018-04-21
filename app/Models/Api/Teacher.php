<?php

namespace App\Models\Api;

use App\Models\Auth\Traits\Method\RoleMethod;
use App\Models\Auth\Traits\Attribute\RoleAttribute;
use App\Models\Auth\User;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Teacher.
 */
class Teacher extends Model
{
    protected $table = 'teachers';

    protected $fillable = ['user_id', 'school_id'];

    protected $timestamp = false;

    public function disciplines() {
        return $this->belongsToMany(Discipline::class, 'teacher_disciplines');
    }

    public function user() {
        return $this->hasOne(User::class, 'id', 'user_id');
    }
}
