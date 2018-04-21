<?php

namespace App\Http\Composers;

use App\Models\Auth\User;
use Illuminate\View\View;

/**
 * Class GlobalComposer.
 */
class GlobalComposer
{
    /**
     * Bind data to the view.
     *
     * @param View $view
     *
     * @return void
     */
    public function compose(View $view)
    {
        $user = auth()->user();
        $user->update(['last_activity' => new \DateTime()]);
        $user->save();

        $topUsers = User::orderBy('reputation', 'desc')->take(5)->get();

        $view->with('logged_in_user', auth()->user());
        $view->with('topUsers', $topUsers);
    }
}
