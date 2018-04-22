@extends('frontend.layouts.app')

@section('content')
    <div class="row">
        <div class="col-md-4">
            <users-chat :chat-with-user="{{ $chatWithUser }}" :users="{{ $users }}"></users-chat>
        </div>
        <div class="col-md-8">
            <private-chat :current-user="{{ Auth::user() }}" :chat-with-user="{{ $chatWithUser }}"></private-chat>
        </div>
    </div>
@endsection