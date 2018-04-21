<?php

namespace App\Http\Controllers\Frontend;

use App\Events\MessageSentEvent;
use App\Message;

use App\Models\Auth\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

use App\Http\Controllers\Controller;

class MessageController extends Controller
{

    public function __construct()
    {
        $this->middleware('auth');
    }

    public function fetch(User $user) {
        return Message::with(['sentByUser', 'sentToUser'])->where('sent_by', $user->id)->orWhere('sent_to', $user->id)->get();
    }

    public function sentMessage(User $user) {
        $sentBy = Auth::user();
        $sentTo = $user;

        $message = Message::create([
            'sent_by' => $sentBy->id,
            'sent_to' => $user->id,
            'message' => request()->message
        ]);

        broadcast(new MessageSentEvent($sentBy, $sentTo, $message));
    }
}
