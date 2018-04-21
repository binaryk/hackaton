@extends('frontend.layouts.app')

@section('title', app_name() . ' | '.__('navs.general.home'))

@section('content')
    <users-list :users="{{ json_encode($users)  }}" :teachers="{{ json_encode($teachers) }}"></users-list>
@endsection
@section('right')
    <div>
        <top-users :users="{{ $topUsers }}"></top-users>
    </div>
@endsection

