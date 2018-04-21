<?php


namespace App\Http\Controllers\Frontend\User;

use App\Http\Controllers\Controller;
use App\Models\Api\Student;
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
        $users = Student::with('user')->with('disciplines')->get();
        return view('frontend.users.list')->with(compact('users'));
    }

    public function singleView($id)
    {
        $user = $this->getUserInfo($id);
        $classmates = [];
        if($user instanceof Student){
            $classmates = Student::where('classroom', '=', $user->classroom)->where( 'id', '<>', $user->id)->with('user')->get();
        }
        return view('frontend.users.single')->with(compact('user', 'classmates'));
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
}
