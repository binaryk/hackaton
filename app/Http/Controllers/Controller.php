<?php

namespace App\Http\Controllers;

use App\Models\Api\Student;
use App\Models\Api\Teacher;
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
     * @return \Illuminate\Database\Eloquent\Model|null|object|static
     */
    public function getUserInfo() {
        $user = $this->getUser();
        if($user->hasRole('student'))
            return Student::where('user_id', $user->id)->with('disciplines')->first();

        return Teacher::where('user_id', $user->id)->with('disciplines')->first();
    }
}
