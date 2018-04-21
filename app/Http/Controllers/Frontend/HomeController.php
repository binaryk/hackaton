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
        $isLogged = auth()->user();
        $v = 'frontend.index';
        if(! $isLogged) {

            $v = 'frontend.parallax';

        }
        return view($v);
    }

    public function table()
    {
        return view('frontend.table');
    }

}
