@extends('news.en.main')               {{-- @extends sẽ load nội dung của template() sau cùng, cụ thể ở đây ta sẽ thực hiện khối lệnh php trước --}}
{{-- @include('news.en.main') --}}     {{-- @include sẽ load nội dung của template() theo trình tự, cụ thể ở đây ta sẽ thực hiện load template
                                                trước sau đó mới thực hiện khối lệnh php--}}
@section('content')

@php
    use App\Helpers\template as Template;

    $router     = route($controllerName.'/save');
    $timeMeet   = '<input type="text" id="datetime-picker" name="timeMeet" class="form-control" placeholder="Chọn ngày và giờ gặp mặt">';
    $xhtmlbranch    = Template::showItemFilterSimpleFrontendWithArray($branch, 'branch' ,'Chi nhánh');
    $xhtmlSex       = Template::showItemFilterSimpleFrontend('sex', 'Giới tính');
    $xhtmlService   = Template::showItemFilterSimpleFrontend('service', 'Dịch vụ');

@endphp
    <!-- Content Container -->
    <div class="section-category">
        @include('news.en.block.breadcrumb',['item'=>['name'=>$title]])
        <div class="content_container container_appointment">
           <div class="featured_title">
               <div class="container">
                    <div class="row">
                        <div class="col-lg-12 mb-12">
                            <!--main content -->
                            <div class="title-box mb-4">
                                @include('news.en.templates.zvn_notily')
                            </div>
                            <div class="title-box mb-4">
                                <p>Vui lòng để lại thông tin, nhu cầu của quý khách. Chúng tôi sẽ liên hệ đến Quý Khách trong thời gian sớm nhất</p>
                            </div>
                        </div>
                        <div class="col-lg-12 mb-12">
                                @include('news.en.templates.error')
                        </div>
                        <div class="col-lg-12 mb-12">
                            <div class="row">
                                <form method="GET" action="{{$router}}" accept-charset="UTF-8" enctype="multipart/form-data" class="contact-form row" id="main-form"><input name="_token" type="hidden" value="XGzMbjHQ5DGTCLNz6ptF0lusIBlvXcR0GJd2wRct">
                                    <div class="col-lg-12 mb-12">
                                        <div class="row">
                                            <div class="col-lg-6 mb-6">
                                                <div class="input-group mb-3">
                                                    <input type="text" name="fullname" placeholder="Họ và tên" class="form-control">
                                                </div>
                                                <div class="input-group mb-3">
                                                    {!! $timeMeet !!}
                                                </div>
                                                <div class="input-group mb-3">
                                                    {!!$xhtmlService !!}
                                                </div>
                                            </div>
                                            <div class="col-lg-6 mb-6">
                                                <div class="input-group mb-3">
                                                    <input type="text" name="phone" placeholder="Số điện thoại" class="form-control">
                                                </div>
                                                <div class="input-group mb-3">
                                                    <input type="text" name="email" placeholder="Email" class="form-control">
                                                </div>
                                                <div class="input-group mb-3">
                                                    {!! $xhtmlSex !!}
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-lg-12 mb-12">
                                        <div class="input-group mb-3">
                                            {!! $xhtmlbranch !!}
                                        </div>
                                        <div class="input-group mb-3">
                                            <textarea class="form-control" name="note" placeholder="Ghi chú (nếu có) ..."  rows="5"></textarea>
                                        </div>
                                    </div>

                                    <div class="col-md-12">
                                        <button type="submit"  class="btn btn-primary">Đặt lịch hẹn</button>
                                    </div>

                                </form>
                                <!--/main content -->
                            </div>
                        </div>

                 </div>
              </div>
           </div>
        </div>
     </div>
@endsection

