<?php

namespace App\Models\Api;

use App\Models\Auth\Traits\Method\RoleMethod;
use App\Models\Auth\Traits\Attribute\RoleAttribute;
use Illuminate\Database\Eloquent\Model;

/**
 * Class StudentDisciplines.
 */
class StudentDisciplines extends Model
{
    protected $table = 'student_disciplines';

    protected $fillable = ['student_id', 'discipline_id'];

    protected $timestamp = false;
}
