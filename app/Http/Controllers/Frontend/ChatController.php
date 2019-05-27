<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Controller;
use App\Models\Auth\User;

class ChatController extends Controller
{

    public function privateChat(User $user)
    {
        $users = User::with('roles')->orderBy('reputation', 'desc')->get();
        return view('frontend.chat.private-chat', ['users' => $users, 'chatWithUser' => $user]);
    }
}
