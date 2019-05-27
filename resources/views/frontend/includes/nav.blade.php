<nav class="navbar navbar-expand-lg navbar-light bg-light mb-4">
    <img style="float:left; max-height: 35px;" src="/images/logo.png">
    <ul class="nav navbar-nav d-md-down-none">
        @if(auth()->user())
            <li class="nav-item px-3">
                <a class="nav-link" href="/">Pagina principala</a>
            </li>
            <li class="nav-item px-3">
                <a href="/users-list" class="nav-link">Utilizatori</a>
            </li>
            <li class="nav-item px-3">
                <a href="/resources" class="nav-link">Resurse</a>
            </li>
            @if( auth()->user()->hasRole('teacher'))
                <li class="nav-item px-3">
                    <a href="/statistics" class="nav-link">Statistici</a>
                </li>
            @endif
        @endif
    </ul>

    @guest
        <ul class="nav navbar-nav d-md-down-none">
            <li class="nav-item"><a href="{{route('frontend.about')}}" class="nav-link" {{ active_class(Active::checkRoute('frontend.contact')) }}>Despre noi</a></li>
            <li class="nav-item"><a href="{{route('frontend.auth.login')}}" class="nav-link {{ active_class(Active::checkRoute('frontend.about')) }}">Alatura-te echipei</a></li>
            <li class="nav-item"><a href="{{route('frontend.contact')}}" class="nav-link {{ active_class(Active::checkRoute('frontend.contact')) }}">{{ __('navs.frontend.contact') }}</a></li>
        </ul>
    @endguest
    <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="{{ __('labels.general.toggle_navigation') }}">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse justify-content-end" id="navbarSupportedContent">
        <ul class="navbar-nav">
            @if (config('locale.status') && count(config('locale.languages')) > 1)
                <li class="nav-item dropdown">
                    @include('includes.partials.lang')

                </li>
            @endif


            @guest
                <li class="nav-item" style="margin: 0 20px;" ><a href="{{route('frontend.auth.login')}}" class="nav-link {{ active_class(Active::checkRoute('frontend.auth.login')) }}">{{ __('navs.frontend.login') }}</a></li>

                @if (config('access.registration'))
                    <li class="nav-item"><a href="{{route('frontend.auth.register')}}" style="border:1px solid rgb(216, 166, 49);color: rgb(216, 166, 49);font-weight:600;" class="register-button nav-link {{ active_class(Active::checkRoute('frontend.auth.register')) }}">{{ __('navs.frontend.register') }}</a></li>
                @endif
            @else
                <li class="nav-item dropdown">
                    <a href="#" class="nav-link dropdown-toggle" id="navbarDropdownMenuUser" data-toggle="dropdown"
                       aria-haspopup="true" aria-expanded="false">{{ $logged_in_user->name }}</a>

                    <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuUser">
                        @can('view backend')
                            <a href="{{ route('admin.dashboard') }}" class="dropdown-item">Pagina ta</a>
                        @endcan

                        <a href="{{ route('frontend.user.account') }}" class="dropdown-item {{ active_class(Active::checkRoute('frontend.user.account')) }}">{{ __('navs.frontend.user.account') }}</a>
                        <a href="{{ route('frontend.auth.logout') }}" class="dropdown-item">{{ __('navs.general.logout') }}</a>
                    </div>
                </li>
            @endguest        </ul>
        <notifications group="foo" />
    </div>
</nav>
