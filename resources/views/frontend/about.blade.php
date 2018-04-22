@extends('frontend.layouts.app')

@section('title', app_name() . ' | About Us')

@section('styles')
    <style>
        .container-fluid {
            height:100vh;
            background: url({!! asset('images/login.jpg') !!});
            background-opacity: 0.7;
            background-position: center;
            background-size: cover;
            padding-top: 200px;
            background-repeat: no-repeat;
        }
        .form-control, select {
            border-radius: 20px;
            font-weight: 600;
            color: #2da754 !important;
        }
        .navbar {
            margin-bottom: 0 !important;
        }
    </style>
@endsection
@section('content')
    <div class="row justify-content-center">
        <div class="col col-sm-8 align-self-center">
            <div class="card">
                <div class="card-header">
                    <strong>
                        About Us
                    </strong>
                </div><!--card-header-->

                <div class="card-body">
                    Platforma Millenium e-learning asigura accesul la schimbul de cunostinte pentru un target aflat la orice distanta dand posibilitatea de a invata in orice moment si intr-un timp foarte scurt.
                    Metodele de invatare clasice sunt inlocuite de ajutorul intelectual intergenerational oferit intr-un format prietenos
                </div><!--card-body-->
            </div><!--card-->
        </div><!--col-->
    </div><!--row-->
@endsection
