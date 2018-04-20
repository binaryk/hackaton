<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Controller;

/**
 * Class HomeController.
 */
class HomeController extends Controller
{
    /**
     * @return \Illuminate\View\View
     */
    public function index()
    {
        return view('frontend.index')->with(['test' => [ 'keya' => 'date' ]]);
    }

    public function table()
    {
        return view('frontend.table');
    }

    public function chat()
    {
        return view('frontend.chat');
    }

}
