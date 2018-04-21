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
                    E-learning refers to learning and teaching using electronic media and requires the use of information and communication technologies combined with electronic media (Simonson, Smaldino, Albright, & Zvacek, 2000; Kok, 2013). <br />In education, e-learning should center on the student with the teacher serving as the learning facilitator. Teaching should always be about the needs and abilities of the students and how learning will happen easily for them.<br /> Learning is an ongoing process that must be purposeful and intentional for each student so that they may reach their fullest potential. <br />
                    An e-learning culture is one in which the emphasis is on the teacher, the student, and the technology used to facilitate that learning experience (Simonson et al., 2000; Kok, 2013).
                </div><!--card-body-->
            </div><!--card-->
        </div><!--col-->
    </div><!--row-->
@endsection
