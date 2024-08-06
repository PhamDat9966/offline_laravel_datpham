@extends('news.main')               {{-- @extends sẽ load nội dung của template() sau cùng, cụ thể ở đây ta sẽ thực hiện khối lệnh php trước --}}
{{-- @include('news.main') --}}     {{-- @include sẽ load nội dung của template() theo trình tự, cụ thể ở đây ta sẽ thực hiện load template
                                                trước sau đó mới thực hiện khối lệnh php--}}
@section('content')

@php
    $router     = route($controllerName.'/save');
    $timeMeet   = '<input type="text" id="datetime-picker" name="timeMeet" class="form-control" placeholder="Chọn ngày và giờ gặp mặt">';

    $xhtmlbranch        ='<select class="form-control" name="branch">';
    $xhtmlbranch       .=   '<option selected value="">Chi nhánh</option>';
    foreach ($branch as $value) {
        $xhtmlbranch   .=    '<option value="'.$value['id'].'">'.$value['address'].'</option>';
    }
    $xhtmlbranch    .= '</select>';

    $sexList         = config('zvn.template.sex');
    $xhtmlSex        ='<select class="form-control" name="sex">';
    $xhtmlSex       .=   '<option selected value="">Giới tính</option>';
    foreach ($sexList as $sexKey=>$sexValue) {
        $xhtmlSex   .=    '<option value="'.$sexKey.'">'.$sexValue.'</option>';
    }
    $xhtmlSex    .= '</select>';

    $serviceList     = config('zvn.template.service');
    $xhtmlService    ='<select class="form-control" name="service">';
    $xhtmlService   .=   '<option selected value="">Dịch vụ</option>';
    foreach ($serviceList as $serviceKey=>$serviceValue) {
        $xhtmlService   .=    '<option value="'.$serviceKey.'">'.$serviceValue.'</option>';
    }
    $xhtmlService    .= '</select>';

   // dd($sexList);

@endphp
    <!-- Content Container -->
    <div class="section-category">
        @include('news.block.breadcrumb',['item'=>['name'=>$title]])
        <div class="content_container container_appointment">
           <div class="featured_title">
               <div class="container">
                    <div class="row">
                        <div class="col-lg-12 mb-12">
                            <!--main content -->
                            <div class="title-box mb-4">
                                @include('admin.templates.zvn_notily')
                            </div>
                            <div class="title-box mb-4">
                                <p>Vui lòng để lại thông tin, nhu cầu của quý khách. Chúng tôi sẽ liên hệ đến Quý Khách trong thời gian sớm nhất</p>
                            </div>
                        </div>
                        <div class="col-lg-12 mb-12">
                                @include('admin.templates.error')
                        </div>
                        <div class="col-lg-12 mb-12">
                            <div class="row">
                                    <form method="GET" action="{{$router}}" accept-charset="UTF-8" enctype="multipart/form-data" class="contact-form row" id="main-form"><input name="_token" type="hidden" value="XGzMbjHQ5DGTCLNz6ptF0lusIBlvXcR0GJd2wRct">
                                        <div class="col-lg-7 mb-7">
                                            <div class="row">
                                                <div class="col-lg-6 mb-6">
                                                    <div class="input-group mb-3">
                                                        <input type="text" name="fullname" placeholder="Họ và tên" class="form-control">
                                                    </div>
                                                    <div class="input-group mb-3">
                                                        {!! $timeMeet !!}
                                                    </div>
                                                    <div class="input-group mb-3">
                                                        <input type="text" name="phone" placeholder="Số điện thoại" class="form-control">
                                                    </div>
                                                </div>
                                                <div class="col-lg-6 mb-6">
                                                    <div class="input-group mb-3">
                                                        <input type="text" name="email" placeholder="Email" class="form-control">
                                                    </div>
                                                    <div class="input-group mb-3">
                                                        {!!$xhtmlService !!}
                                                    </div>
                                                    <div class="input-group mb-3">
                                                        {!! $xhtmlSex !!}
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-lg-5 mb-5">
                                            <div class="row">
                                                <div class="input-group mb-3">
                                                    {!! $xhtmlbranch !!}
                                                </div>
                                                <div class="input-group mb-3">
                                                    <textarea class="form-control" name="note" placeholder="Ghi chú (nếu có) ..." rows="3"></textarea>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-md-12">
                                            <input type="hidden" id="custId" name="id" value="">
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

