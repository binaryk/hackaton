<?php

namespace App\Http\Controllers;

use App\Models\Api\Student;
use App\Models\Api\Teacher;
use App\Models\Auth\User;
use App\Repositories\Frontend\Api\StudentRepository;
use App\Repositories\Frontend\Api\TeacherRepository;
use Illuminate\Foundation\Bus\DispatchesJobs;
use Illuminate\Routing\Controller as BaseController;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Foundation\Auth\Access\AuthorizesRequests;

/**
 * Class Controller.
 */
class Controller extends BaseController
{
    use AuthorizesRequests, DispatchesJobs, ValidatesRequests;

    /**
     * Get Auth user
     * @return \App\Models\Auth\User|null
     */
    public function getUser() {
        return \Auth::user();
    }

    /**
     * Get Student or Teacher
     * @param null $id
     * @return \Illuminate\Database\Eloquent\Model|null|object|static
     */
    public function getUserInfo($id = null) {
        $user = $id ? User::with('roles')->find($id) : $this->getUser();
        if($user->hasRole('student')){
            $user->student = Student::where('user_id', $user->id)->with('disciplines')->first();
        } else if($user->hasRole('teacher')){
            $user->teacher = Teacher::where('user_id', $user->id)->with('disciplines')->first();
        }

        return $user;
    }
}
