@extends('frontend.layouts.app')

@section('content')
    <add-question @on-submit="" :user_id="{{auth()->user()->id}}"></add-question>
@endsection