<?php


namespace App\Http\Controllers\Frontend\User;

use App\Http\Controllers\Controller;
use App\Models\Api\Question;
use App\Models\Api\Student;
use App\Models\Api\Teacher;
use App\Models\Auth\User;
use App\Repositories\Backend\Auth\UserRepository;
use Illuminate\Http\Request;

/**
 * Class UserController.
 */
class UserController extends Controller
{
    /**
     * @var UserRepository
     */
    protected $userRepository;

    /**
     * UserController constructor.
     *
     * @param UserRepository $userRepository
     */
    public function __construct(UserRepository $userRepository)
    {
        $this->userRepository = $userRepository;
    }

    /**
     * Display a listing of the resource.
     *
     * @return string
     */
    public function index()
    {
        return User::with('roles')->get()->toJson();
    }

    public function listView()
    {
        $teachers = Teacher::with('user')->with('disciplines')->get();
        $users = Student::with(['user', 'school'])->with('disciplines')->get();
        return view('frontend.users.list')->with(compact('users', 'teachers'));
    }

    public function singleView($id)
    {
        $user = $this->getUserInfo($id);
        $classmates = [];
        if($user instanceof Student){
            $classmates = Student::where('classroom', '=', $user->classroom)->where( 'id', '<>', $user->id)->with('user')->get();
        }

        $lastQuestions = Question::where('user_id', $id)->orderBy('updated_at', 'desc')->take(5)->get();
        return view('frontend.users.single')->with(compact('user', 'classmates', 'id', 'lastQuestions'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }

    public function filter(Request $request){
        $schools = $request->get('schools');
        $disciplines = $request->get('disciplines');

        $users = Student::with('disciplines');
        if ($schools){
            $users->whereIn('school_id', $schools);
        }
        if ($disciplines){
            $users->whereHas('disciplines', function ($q) use ($disciplines){
               return $q->whereIn('disciplines.id', $disciplines);
            });
        }
        return $users->with('user')->get();
    }
}
