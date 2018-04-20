@extends('frontend.layouts.app')

@section('title', app_name() . ' | '.__('labels.frontend.auth.register_box_title'))

@push('after-styles')
    <style>
        #disciplines {
            display: none;
        }
    </style>
@endpush
@section('content')

    <div class="row justify-content-center align-items-center">
        <div class="col col-sm-8 align-self-center">
            <div class="card">
                <div class="card-header">
                    <strong>
                        {{ __('labels.frontend.auth.register_box_title') }}
                    </strong>
                </div><!--card-header-->

                <div class="card-body">
                    {{ html()->form('POST', route('frontend.auth.register.post'))->open() }}
                    <div class="row">
                        <div class="col-12 col-md-12">
                            <div class="form-group">
                                <label for="first_name">First name</label>
                                <input type="text" name="first_name" class="form-control" placeholder="First name">
                            </div>
                        </div>
                        <div class="col-12 col-md-12">
                            <div class="form-group">
                                <label for="last_name">Last name</label>
                                <input type="text" name="last_name" class="form-control" placeholder="Last name">
                            </div>
                        </div>

                        <div class="col-12 col-md-12">
                            <div class="form-group">
                                <label for="email">E-mail</label>
                                <input type="text" name="email" class="form-control" placeholder="E-mail">
                            </div>
                        </div>

                        <div class="col-12 col-md-12">
                            <div class="form-group">
                                <label for="password">Password</label>
                                <input type="password" name="password" class="form-control" placeholder="Password">
                            </div>
                        </div>

                        <div class="col-12 col-md-12">
                            <div class="form-group">
                                <label for="password_confirmation">Password confirmation</label>
                                <input type="password" name="password_confirmation" class="form-control" placeholder="Password confirmation">
                            </div>
                        </div>


                        <div class="col-12 col-md-12">
                            <div class="form-group">
                                <label for="school_id">School</label>
                                <select name="school_id" class="form-control" id="">
                                    @foreach ($schools as $school)
                                        <option value="{{ $school->id }}">{{ $school->name }}</option>
                                    @endforeach
                                </select>
                            </div>
                        </div>

                        <div class="col-12 col-md-12">
                            <div class="form-group">
                                <label for="type">Type</label>
                                <select name="type" class="form-control" id="">
                                    <option value="0">Student</option>
                                    <option value="1">Teacher</option>
                                </select>
                            </div>
                        </div>

                        <div class="col-12 col-md-12" >
                            <div class="form-group" id="classroom">
                                <label for="classroom">Classroom</label>
                                <select name="classroom" class="form-control" id="">
                                    <option value="1">I</option>
                                    <option value="2">II</option>
                                    <option value="3">III</option>
                                    <option value="4">IV</option>
                                    <option value="5">V</option>
                                    <option value="6">VI</option>
                                    <option value="7">VII</option>
                                    <option value="8">VIII</option>
                                    <option value="9">IX</option>
                                    <option value="10">X</option>
                                    <option value="11">XI</option>
                                    <option value="12">XII</option>
                                </select>
                            </div>
                        </div>

                        <div class="col-12 col-md-12" >
                            <div class="form-group" id="disciplines">
                                <label for="disciplines">Disciplines</label>
                                <select name="disciplines[]" multiple class="form-control" id="">
                                    @foreach ($disciplines as $discipline)
                                        <option value="{{ $discipline->id }}">{{ $discipline->name }}</option>
                                    @endforeach
                                </select>
                            </div>
                        </div>

                        <div class="col-12 col-md-12">
                            <div class="form-group">
                                <input type="submit" class="form-control btn btn-success"  value="Submit"/>
                            </div>
                        </div>
                    </div>
                </div><!-- card-body -->
            </div><!-- card -->
        </div><!-- col-md-8 -->
    </div><!-- row -->
@endsection

@push('after-scripts')
    @if (config('access.captcha.registration'))
        {!! Captcha::script() !!}
    @endif
    <script>
        $('[name="type"]').on('change', function() {
            console.log(this.value);
            if(this.value == 0){
                console.log("classroom");
                $("#classroom").show();
                $("#disciplines").hide();
            }else{
                console.log("dis");
                $("#classroom").hide();
                $("#disciplines").show();
            }
        })
    </script>
@endpush
