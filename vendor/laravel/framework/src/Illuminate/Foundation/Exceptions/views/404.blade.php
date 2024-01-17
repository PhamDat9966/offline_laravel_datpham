@extends('news.main')               {{-- @extends sẽ load nội dung của template() sau cùng, cụ thể ở đây ta sẽ thực hiện khối lệnh php trước --}}
{{-- @include('news.main') --}}     {{-- @include sẽ load nội dung của template() theo trình tự, cụ thể ở đây ta sẽ thực hiện load template
                                                trước sau đó mới thực hiện khối lệnh php--}}
@section('content')

    <!-- Content Container -->
    <div class="content_container">
        <div class="container">
            <div class="row">
                <!-- Main Content -->
                <div class="col-lg-12">
                    <div class="main_content">

                    @php
                        $name   = '404';
                        $thumb  = asset('news/images/404/404.jpg');
                    @endphp

                    <div class="post_image">
                        <img src="{{ $thumb }}" alt="{{ $name }}" class="img-fluid w-100">
                    </div>

                    </div>
                </div>
                <div class="col-lg-12">
                    <div class="row">
                        <div class="home_button mx-auto text-center"><a href="{{route('home')}}">Quay về trang chủ</a></div>
                    </div>
                </div>

            </div>
        </div>
    </div>

@endsection


