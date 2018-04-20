@extends('frontend.layouts.app')

@section('title', app_name() . ' | '.__('navs.general.home'))

@section('content')
    <questions-list></questions-list>
@endsection
@section('right')
    <div>
        Lorem ipsum dolor sit amet, consectetur adipisicing elit. Accusantium aliquam dolore eveniet id ipsa, officia quas quibusdam repellat sit ullam vel veniam voluptas voluptatum? Deleniti error excepturi impedit! Ex, odit.
    </div>
@endsection

