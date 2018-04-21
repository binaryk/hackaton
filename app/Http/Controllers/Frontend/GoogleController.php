<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Controller;
use App\Models\Api\Question;
use App\Models\Api\School;
use App\Models\Api\Student;
use App\Repositories\Frontend\Api\QuestionRepository;
use App\Models\Auth\User;
use Illuminate\Http\Request;

use Stichoza\GoogleTranslate\TranslateClient;

class GoogleController extends Controller
{

    public $questionRepository;

    public function __construct(QuestionRepository $questionRepository)
    {
        $this->questionRepository = $questionRepository;
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $to = strtolower($request->get('to'));
        $from = strtolower($request->get('from'));

        $tr = new TranslateClient($from, $to);
        return $tr->translate($request->get('message'));
    }

}
