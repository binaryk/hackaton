@extends('frontend.layouts.app')

@section('title', app_name() . ' | '.__('navs.general.home'))

@section('content')
    <question-layout :question="{{ json_encode($question)  }}" :user="{{ json_encode($user) }}"></question-layout>
@endsection
@section('right')
    <div>
        <top-users :users="{{ $topUsers }}"></top-users>
    </div>
@endsection

