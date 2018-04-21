@extends('frontend.layouts.app')

@section('content')
    <div class="row mb-4">
        <div class="col">
            <div class="card">
                <div class="card-header">
                    <i class="fas fa-tachometer-alt"></i> Profilul utilizatorului
                    <strong>

                    </strong>
                </div><!--card-header-->

                <div class="card-body">
                    <div class="row">
                        <div class="col col-sm-4 order-1 order-sm-2  mb-4">
                            <div class="card mb-4 bg-light">
                                <img class="card-img-top" src="{{ $user->picture }}" alt="Profile Picture">

                                <div class="card-body">
                                    <h4 class="card-title">
                                        {{ $user->name }}<br/>
                                    </h4>

                                    <div class="card-text">
                                        <p><i class="fas fa-envelope"></i> &nbsp; {{ $user->email }}<br/></p>
                                        <p><i class="fas fa-calendar-check"></i> &nbsp; {{ __('strings.frontend.general.joined') }} {{ $user->created_at->format('F jS, Y') }}</p>
                                        <p><i class="fa fa-star"></i>  &nbsp; {{ (int) $user->reputation }}</p>
                                    </div>

                                    <p class="card-text">

                                        <a href="/privateChat/{!! $id !!}" class="btn btn-info btn-sm mb-1">
                                            <i class="fas fa-envelope"></i> Trimite mesaj
                                        </a>
                                    </p>
                                </div>
                            </div>
                        </div><!--col-md-4-->
                        <div class="col-md-8 order-2 order-sm-1">
                            @if(count($user->disciplines) > 0)
                                <div class="row">
                                    <div class="col">
                                        <div class="card mb-4">
                                            <div class="card-header">
                                                Subiecte de interes
                                            </div><!--card-header-->

                                            <div class="card-body">
                                                <ul class="list-group">

                                                    @foreach($user->disciplines as $discipline)
                                                        <li class="list-group-item d-flex list-group-item-action justify-content-between align-items-center">
                                                            {{ $discipline->name }}
                                                        </li>
                                                    @endforeach
                                                </ul>
                                            </div><!--card-body-->
                                        </div><!--card-->
                                    </div><!--col-md-6-->
                                </div><!--row-->
                            @endif
                            @if(count($classmates) > 0)
                                <div class="row">
                                    <div class="col">
                                        <div class="card mb-4">
                                            <div class="card-header">
                                                Subiecte de interes
                                            </div><!--card-header-->

                                            <div class="card-body">
                                                <ul class="list-group">
                                                    @foreach($classmates as $classmate)
                                                        <li class="list-group-item d-flex list-group-item-action justify-content-between align-items-center">
                                                            {{ $classmate->first_name }} {{ $classmate->last_name }}
                                                        </li>
                                                    @endforeach
                                                </ul>
                                            </div><!--card-body-->
                                        </div><!--card-->
                                    </div><!--col-md-6-->
                                </div><!--row-->
                            @endif

                            <div class="row">
                                <div class="col">
                                    <div class="card mb-4">
                                        <div class="card-header">
                                            Ultimele topicuri active
                                        </div><!--card-header-->

                                        <div class="card-body">
                                            <ul class="list-group">
                                                <li class="list-group-item d-flex list-group-item-action justify-content-between align-items-center">
                                                    Cras justo odio ...
                                                    <span class="badge badge-primary badge-pill">14</span>
                                                </li>
                                                <li class="list-group-item d-flex list-group-item-action justify-content-between align-items-center">
                                                    Dapibus ac facilisis in ...
                                                    <span class="badge badge-primary badge-pill">2</span>
                                                </li>
                                                <li class="list-group-item d-flex list-group-item-action justify-content-between align-items-center">
                                                    Morbi leo risus ...
                                                    <span class="badge badge-primary badge-pill">1</span>
                                                </li>
                                            </ul>
                                        </div><!--card-body-->
                                    </div><!--card-->
                                </div><!--col-md-6-->
                            </div><!--row-->
                        </div><!--col-md-8-->
                    </div><!-- row -->
                </div> <!-- card-body -->
            </div><!-- card -->
        </div><!-- row -->
    </div><!-- row -->
@endsection
