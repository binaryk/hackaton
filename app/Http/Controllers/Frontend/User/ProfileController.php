<?php

namespace App\Http\Controllers\Frontend\User;

use App\Http\Controllers\Controller;
use App\Models\Api\Student;
use App\Repositories\Frontend\Api\StudentDisciplinesRepository;
use App\Repositories\Frontend\Api\StudentRepository;
use App\Repositories\Frontend\Api\TeacherDisciplinesRepository;
use App\Repositories\Frontend\Api\TeacherRepository;
use App\Repositories\Frontend\Auth\UserRepository;
use App\Http\Requests\Frontend\User\UpdateProfileRequest;

/**
 * Class ProfileController.
 */
class ProfileController extends Controller
{
    /**
     * @var UserRepository
     */
    protected $userRepository;

    /**
     * @var StudentDisciplinesRepository
     */
    protected $studentDisciplinesRepository;
    protected $teacherDisciplinesRepository;

    /**
     * @var StudentRepository
     */
    protected $studentRepository;
    protected $teacherRepository;

    /**
     * ProfileController constructor.
     *
     * @param UserRepository $userRepository
     * @param StudentDisciplinesRepository $studentDisciplinesRepository
     */
    public function __construct(UserRepository $userRepository, StudentDisciplinesRepository $studentDisciplinesRepository, StudentRepository $studentRepository, TeacherRepository $teacherRepository, TeacherDisciplinesRepository $teacherDisciplinesRepository)
    {
        $this->userRepository = $userRepository;
        $this->studentDisciplinesRepository = $studentDisciplinesRepository;
        $this->studentRepository = $studentRepository;
        $this->teacherRepository = $teacherRepository;
        $this->teacherDisciplinesRepository = $teacherDisciplinesRepository;
    }

    /**
     * @param UpdateProfileRequest $request
     *
     * @return mixed
     * @throws \App\Exceptions\GeneralException
     */
    public function update(UpdateProfileRequest $request)
    {
        $output = $this->userRepository->update(
            $request->user()->id,
            $request->only('first_name', 'last_name', 'email', 'avatar_type', 'avatar_location', 'timezone'),
            $request->has('avatar_location') ? $request->file('avatar_location') : false
        );
        if($request->get('disciplines')) {
            if($request->get('teacher') === '1') {
                $this->updateDisciplinesTeachers($request->get('disciplines'), $request->user()->id);
            } else {
                $this->updateDisciplines($request->get('disciplines'), $request->user()->id);
            }
        }

        // E-mail address was updated, user has to reconfirm
        if (is_array($output) && $output['email_changed']) {
            auth()->logout();

            return redirect()->route('frontend.auth.login')->withFlashInfo(__('strings.frontend.user.email_changed_notice'));
        }

        return redirect()->route('frontend.user.account')->withFlashSuccess(__('strings.frontend.user.profile_updated'));
    }

    /**
     * @param $data
     * @param $id
     */
    private function updateDisciplines($data, $id)
    {
        try{
            $student = $this->studentRepository->where('user_id', $id)->first();
            $this->studentDisciplinesRepository->where('student_id', $student->id)->delete();
            foreach($data as $d) {
                $this->studentDisciplinesRepository->create(['student_id' => $student->id, 'discipline_id' => $d]);
            }
        } catch(\Exception $e) {
        }
    }

    private function updateDisciplinesTeachers($data, $id)
    {
        try{
            $teacher = $this->teacherRepository->where('user_id', $id)->first();
            $this->teacherDisciplinesRepository->where('teacher_id', $teacher->id)->delete();
            foreach($data as $d) {
                $this->teacherDisciplinesRepository->create(['teacher_id' => $teacher->id, 'discipline_id' => $d]);
            }
        } catch(\Exception $e) {
        }
    }
}
