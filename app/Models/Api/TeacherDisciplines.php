<?php

namespace App\Models\Api;

use App\Models\Auth\Traits\Method\RoleMethod;
use App\Models\Auth\Traits\Attribute\RoleAttribute;
use Illuminate\Database\Eloquent\Model;

/**
 * Class TeacherDisciplines.
 */
class TeacherDisciplines extends Model
{
    protected $table = 'teacher_disciplines';

    protected $fillable = ['teacher_id', 'discipline_id'];

    protected $timestamp = false;
}
