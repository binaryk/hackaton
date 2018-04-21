@extends('frontend.layouts.app')

@section('title', app_name() . ' | '.__('navs.general.home'))

@section('content')
    <teacher-dashboard></teacher-dashboard>
@endsection
@section('right')
    <div>
        <top-users :users="{{ $topUsers }}"></top-users>
    </div>
@endsection