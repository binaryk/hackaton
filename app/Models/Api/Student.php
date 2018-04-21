<?php

namespace App\Models\Api;

use App\Models\Auth\Traits\Method\RoleMethod;
use App\Models\Auth\Traits\Attribute\RoleAttribute;
use App\Models\Auth\User;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Student.
 */
class Student extends Model
{
    protected $table = 'students';

    protected $fillable = ['user_id', 'school_id', 'classroom', 'created_at', 'updated_at'];

    protected $timestamp = false;

    public function disciplines() {
        return $this->belongsToMany(Discipline::class, 'student_disciplines');
    }

    public function user() {
        return $this->hasOne(User::class, 'id', 'user_id');
    }
}
