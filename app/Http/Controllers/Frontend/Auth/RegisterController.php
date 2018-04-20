<?php

namespace App\Http\Controllers\Frontend\Auth;

use App\Http\Controllers\Controller;
use App\Http\Requests\RegisterRequest;
use App\Helpers\Frontend\Auth\Socialite;
use App\Events\Frontend\Auth\UserRegistered;
use App\Models\Api\Discipline;
use App\Models\Api\School;
use App\Models\Api\TeacherDisciplines;
use App\Repositories\Frontend\Api\StudentRepository;
use App\Repositories\Frontend\Api\TeacherRepository;
use Illuminate\Foundation\Auth\RegistersUsers;
use App\Repositories\Frontend\Auth\UserRepository;

/**
 * Class RegisterController.
 */
class RegisterController extends Controller
{
    use RegistersUsers;

    /**
     * @var UserRepository
     */
    protected $userRepository;

    /**
     * @var StudentRepository
     */
    protected $studentRepository;

    /**
     * @var TeacherRepository
     */
    protected $teacherRepository;

    /**
     * @var TeacherDisciplines
     */
    protected $teacherDisciplines;

    /**
     * RegisterController constructor.
     *
     * @param UserRepository $userRepository
     * @param StudentRepository $studentRepository
     * @param TeacherRepository $teacherRepository
     * @param TeacherDisciplines $teacherDisciplines
     */
    public function __construct(UserRepository $userRepository, StudentRepository $studentRepository, TeacherRepository $teacherRepository, TeacherDisciplines $teacherDisciplines)
    {
        $this->userRepository = $userRepository;
        $this->studentRepository = $studentRepository;
        $this->teacherRepository = $teacherRepository;
        $this->teacherDisciplines = $teacherDisciplines;
    }

    /**
     * Where to redirect users after login.
     *
     * @return string
     */
    public function redirectPath()
    {
        return route(home_route());
    }

    /**
     * Show the application registration form.
     *
     * @return \Illuminate\Http\Response
     */
    public function showRegistrationForm()
    {
        $schools = School::all();
        $disciplines = Discipline::all();
        abort_unless(config('access.registration'), 404);

        return view('frontend.auth.register')
            ->with('schools', $schools)
            ->with('disciplines', $disciplines)
            ->withSocialiteLinks((new Socialite)->getSocialLinks());
    }

    /**
     * @param RegisterRequest $request
     *
     * @return \Illuminate\Http\RedirectResponse|\Illuminate\Routing\Redirector
     * @throws \Throwable
     */
    public function register(RegisterRequest $request)
    {
        $userData = $request->only('first_name', 'last_name', 'email', 'password', 'type', 'school_id', 'classroom', 'disciplines');
        $user = $this->userRepository->create($request->only('first_name', 'last_name', 'email', 'password', 'type', 'school_id'));

        // If is teacher
        if($userData['type'] == 1) {
            $teacher = $this->teacherRepository->create(['user_id' => $user->id, 'school_id' => $userData['school_id']]);

            if(is_array($userData['disciplines'])){
                foreach($userData['disciplines'] as $discipline) {
                    $this->teacherDisciplines->create(['teacher_id' => $teacher->id, 'discipline_id' => $discipline]);
                }
            }
        }else{
            // If is student
            $this->studentRepository->create(['user_id' => $user->id, 'school_id' => $userData['school_id'], 'classroom' => $userData['classroom']]);
        }

        // If the user must confirm their email or their account requires approval,
        // create the account but don't log them in.
        if (config('access.users.confirm_email') || config('access.users.requires_approval')) {
            event(new UserRegistered($user));

            return redirect($this->redirectPath())->withFlashSuccess(
                config('access.users.requires_approval') ?
                    __('exceptions.frontend.auth.confirmation.created_pending') :
                    __('exceptions.frontend.auth.confirmation.created_confirm')
            );
        } else {
            auth()->login($user);

            event(new UserRegistered($user));

            return redirect($this->redirectPath());
        }
    }
}
