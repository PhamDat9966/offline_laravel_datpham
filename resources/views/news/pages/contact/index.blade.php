@extends('news.main')               {{-- @extends sẽ load nội dung của template() sau cùng, cụ thể ở đây ta sẽ thực hiện khối lệnh php trước --}}
{{-- @include('news.main') --}}     {{-- @include sẽ load nội dung của template() theo trình tự, cụ thể ở đây ta sẽ thực hiện load template
                                                trước sau đó mới thực hiện khối lệnh php--}}
@section('content')

@php
    use App\Helpers\template as Template;
    //dd($itemGooglemap);
    $router         = route($controllerName.'/save');

    $iframe         = '<iframe src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d15677.303876297865!2d106.692556!3d10.7863269!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752f2f20ed1c49%3A0x5781806fe59379f4!2zQ8O0bmcgVHkgQ-G7lSBQaOG6p24gTOG6rXAgVHLDrG5oIFplbmQgVmnhu4d0IE5hbQ!5e0!3m2!1svi!2s!4v1723095395358!5m2!1svi!2s" width="600" height="500" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>';
    if(isset($itemGooglemap) && !empty($itemGooglemap)){
        $iframe = $itemGooglemap['googlemap'];
    }
    $xhtmlbranch    = Template::showBranchGoogleMapSelect($controllerName, $branch, 'select_change_is_googlemap_filter' ,'Chi nhánh', $itemGooglemap);
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
                        </div>
                        <div class="col-lg-12 mb-12">
                                @include('admin.templates.error')
                        </div>
                        <div class="col-lg-12 mb-12">
                            <div class="row">
                                <form method="GET" action="{{$router}}" accept-charset="UTF-8" enctype="multipart/form-data" class="contact-form row" id="main-form"><input name="_token" type="hidden" value="XGzMbjHQ5DGTCLNz6ptF0lusIBlvXcR0GJd2wRct">
                                    <div class="col-lg-6 mb-6">
                                       {!! $iframe !!}
                                    </div>
                                    <div class="col-lg-6 mb-6">
                                        <div class="input-group mb-3 ml-3">
                                            <h3>Gửi tin nhắn cho chúng tôi</h3>
                                            <p>Vui lòng để lại thông tin với chúng tôi. Chúng tôi sẽ liên hệ đến Quý Khách trong thời gian sớm nhất</p>
                                        </div>
                                        <div class="input-group mb-3 ml-3">
                                            <input type="text" name="fullname" placeholder="Họ và tên" class="form-control">
                                        </div>
                                        <div class="input-group mb-3 ml-3">
                                            <input type="text" name="email" placeholder="Email" class="form-control">
                                        </div>
                                        <div class="input-group mb-3 ml-3">
                                            <input type="text" name="phone" placeholder="Số điện thoại" class="form-control">
                                        </div>
                                        <div class="input-group mb-3 ml-3">
                                            {!! $xhtmlbranch !!}
                                        </div>
                                        <div class="input-group mb-3 ml-3">
                                            <textarea class="form-control" name="note" placeholder="Ghi chú (nếu có) ..." rows="3"></textarea>
                                        </div>
                                        <div class="input-group mb-3 ml-3">
                                            <input type="hidden" id="custId" name="id" value="">
                                            <button type="submit"  class="btn btn-primary">Đặt lịch hẹn</button>
                                        </div>
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

