<!DOCTYPE html>
@langrtl
    <html lang="{{ app()->getLocale() }}" dir="rtl">
@else
    <html lang="{{ app()->getLocale() }}">
@endlangrtl
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="csrf-token" content="{{ csrf_token() }}">
        <title>@yield('title', app_name())</title>
        <meta name="description" content="@yield('meta_description', 'Laravel 5 Boilerplate')">
        <meta name="author" content="@yield('meta_author', 'Anthony Rappa')">
        @yield('meta')

        {{-- See https://laravel.com/docs/5.5/blade#stacks for usage --}}
        @stack('before-styles')

        <!-- Check if the language is set to RTL, so apply the RTL layouts -->
        <!-- Otherwise apply the normal LTR layouts -->
        {{ style(mix('css/frontend.css')) }}
        {{ style(mix('css/backend.css')) }}

        @stack('after-styles')
        @yield('styles')
        <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
    </head>
    <body>
        <div id="app">
            @include('includes.partials.logged-in-as')
            @if(auth()->user())
             @include('frontend.includes.nav')
            @endif

            <div class="container-fluid">
                @yield('parallax')
                @include('includes.partials.messages')
                <div class="row col-md-12">
                    <div class="col-md-2"></div>
                    <div class="col-md-7 main-panel">
                        @yield('content')
                    </div>

                    @if(auth()->user())
                    <div class="col-md-3 rigth-sidebar">
                        @yield('right')
                    </div>
                    @endif
                </div>
            </div><!-- container -->
        </div><!-- #app -->

        <!-- Scripts -->
        @stack('before-scripts')
        {!! script(mix('js/frontend.js')) !!}
        @stack('after-scripts')

        @include('includes.partials.ga')
    </body>
</html>
