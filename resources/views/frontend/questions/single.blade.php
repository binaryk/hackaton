@extends('frontend.layouts.app')

@section('title', app_name() . ' | '.__('navs.general.home'))

@section('content')
    <question-layout :question="{{ json_encode($question)  }}"></question-layout>
    <add-comment :user_id="{{auth()->user()->id}}" :question_id="{{$question->id}}"></add-comment>
    <comments-list :question_id="{{ $question->id }}"></comments-list>
@endsection
@section('right')
    <div>
        Lorem ipsum dolor sit amet, consectetur adipisicing elit. Accusantium aliquam dolore eveniet id ipsa, officia quas quibusdam repellat sit ullam vel veniam voluptas voluptatum? Deleniti error excepturi impedit! Ex, odit.
    </div>
@endsection

