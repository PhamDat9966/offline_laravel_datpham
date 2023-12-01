@extends('news.login')               {{-- @extends sẽ load nội dung của template() sau cùng, cụ thể ở đây ta sẽ thực hiện khối lệnh php trước --}}
{{-- @include('news.main') --}}     {{-- @include sẽ load nội dung của template() theo trình tự, cụ thể ở đây ta sẽ thực hiện load template
                                                trước sau đó mới thực hiện khối lệnh php--}}
@section('content')

    <div class="card fat">
        <div class="card-body">
            <h4 class="card-title">Login</h4>
            <form method="POST">

                <div class="form-group">
                    <label for="email">E-Mail Address</label>

                    <input id="email" type="email" class="form-control" name="email" value="" required autofocus>
                </div>

                <div class="form-group">
                    <label for="password">Password
                        <a href="forgot.html" class="float-right">
                            Forgot Password?
                        </a>
                    </label>
                    <input id="password" type="password" class="form-control" name="password" required data-eye>
                </div>

                <div class="form-group">
                    <label>
                        <input type="checkbox" name="remember"> Remember Me
                    </label>
                </div>

                <div class="form-group no-margin">
                    <button type="submit" class="btn btn-primary btn-block">
                        Login
                    </button>
                </div>
                <div class="margin-top20 text-center">
                    Don't have an account? <a href="register.html">Create One</a>
                </div>
            </form>
        </div>
    </div>
    <div class="footer">
        Copyright &copy; Your Company 2017
    </div>
@endsection

