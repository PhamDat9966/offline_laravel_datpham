@extends('news.en.login')
@section('content')
    <div class="card fat">
        <div class="card-body">
            <h4 class="card-title">Đăng Nhập</h4>
            @include('news.en.templates.error')
            @include('news.en.templates.alert')
            {!! Form::open([
                'url'               =>  Route($controllerName.'/postLogin'),
                'method'            =>  'POST',
                'accept-charset'    =>  'UTF-8',
                'id'                =>  'login-form'
            ]) !!}
                <div class="form-group">
                    {!!Form::label('email', 'E-Mail Address')!!}
                    {!!Form::email('email', '',['class'=> 'form-control','required'=>true,'autofocus'=>true])!!}
                </div>
                <div class="form-group">
                    {!!Form::label('password', 'Password')!!}
                    {!!Form::password('password',['class'=> 'form-control','required'=>true,'autofocus'=>true,'data-eye'=>true])!!}
                </div>
                <div class="form-group no-margin">
                    {!!Form::submit('Đăng Nhập',['class'=>'btn btn-primary btn-block'])!!}
                </div>
            {!! Form::close() !!}
        </div>
    </div>
    <div class="footer">
<<<<<<< HEAD:resources/views/news/en/pages/auth/login.blade.php
        <p>E-Mail: admin@gmail.com
=======
        <p>account: admin@gmail.com
>>>>>>> origin/main:resources/views/news/pages/auth/login.blade.php
        password: 123456</p>
        Copyright &copy; Your Company 2017
    </div>
@endsection

