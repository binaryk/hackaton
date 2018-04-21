<?php

namespace App\Http\Controllers\Frontend\User;

use App\Http\Controllers\Controller;
use App\Models\Api\Student;
use App\Repositories\Frontend\Api\StudentDisciplinesRepository;
use App\Repositories\Frontend\Api\StudentRepository;
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

    /**
     * @var StudentRepository
     */
    protected $studentRepository;

    /**
     * ProfileController constructor.
     *
     * @param UserRepository $userRepository
     * @param StudentDisciplinesRepository $studentDisciplinesRepository
     */
    public function __construct(UserRepository $userRepository, StudentDisciplinesRepository $studentDisciplinesRepository, StudentRepository $studentRepository)
    {
        $this->userRepository = $userRepository;
        $this->studentDisciplinesRepository = $studentDisciplinesRepository;
        $this->studentRepository = $studentRepository;
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

        $this->updateDisciplines($request->get('disciplines'), $request->user()->id);

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
        $student = $this->studentRepository->where('user_id', $id)->first();

        $this->studentDisciplinesRepository->where('student_id', $student->id)->delete();
        foreach($data as $d) {
            $this->studentDisciplinesRepository->create(['student_id' => $student->id, 'discipline_id' => $d]);
        }
    }
}
