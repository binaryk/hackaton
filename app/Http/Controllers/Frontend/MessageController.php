<?php

namespace App\Http\Controllers\Frontend;

use App\Events\MessageSentEvent;
use App\Message;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

use App\Http\Controllers\Controller;

class MessageController extends Controller
{

    public function __construct()
    {
        $this->middleware('auth');
    }

    public function fetch() {
        return Message::with('user')->get();
    }

    public function sentMessage() {
        $user = Auth::user();

        $message = $user->messages()->create([
            'message' => request()->message
        ]);

        broadcast(new MessageSentEvent($user, $message));
    }
}
