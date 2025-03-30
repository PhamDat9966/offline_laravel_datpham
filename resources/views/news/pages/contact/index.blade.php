@extends('news.main')               {{-- @extends sẽ load nội dung của template() sau cùng, cụ thể ở đây ta sẽ thực hiện khối lệnh php trước --}}
{{-- @include('news.main') --}}     {{-- @include sẽ load nội dung của template() theo trình tự, cụ thể ở đây ta sẽ thực hiện load template
                                                trước sau đó mới thực hiện khối lệnh php--}}
@section('content')

@php
    use App\Helpers\template as Template;

    $router         = route($controllerName.'/postContact');

    $iframe         = '<iframe src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d15677.303876297865!2d106.692556!3d10.7863269!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752f2f20ed1c49%3A0x5781806fe59379f4!2zQ8O0bmcgVHkgQ-G7lSBQaOG6p24gTOG6rXAgVHLDrG5oIFplbmQgVmnhu4d0IE5hbQ!5e0!3m2!1svi!2s!4v1723095395358!5m2!1svi!2s" width="600" height="650" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>';
    if(isset($itemGooglemap) && !empty($itemGooglemap)){
        $iframe = $itemGooglemap['googlemap'];
    }
    $iframe = preg_replace('/height="\d+"/', 'height="520"', $iframe);
    $xhtmlbranch    = Template::showBranchGoogleMapSelect($controllerName, $branch, 'select_change_is_googlemap_filter', $itemGooglemap);

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
                                @include('news.templates.zvn_notily')
                            </div>
                        </div>
                        <div class="col-lg-12 mb-12">
                            <div class="row">
                                <form method="POST" action="{{$router}}" accept-charset="UTF-8" enctype="multipart/form-data" class="contact-form row" id="contact-form">
                                    @csrf
                                    <div class="col-lg-6 mb-6">
                                       {!! $iframe !!}
                                       <div class="input-group">
                                            <label for="branch">Chi nhánh :</label>
                                            {!! $xhtmlbranch !!}
                                        </div>
                                    </div>
                                    <div class="col-lg-6 mb-6">
                                        <div class="input-group mb-3 ml-3">
                                            <h3>Gửi tin nhắn cho chúng tôi</h3>
                                            <p>Vui lòng để lại thông tin với chúng tôi. Chúng tôi sẽ liên hệ đến Quý Khách trong thời gian sớm nhất</p>
                                        </div>
                                        <div class="mb-3 ml-3">
                                            @include('news.templates.error')
                                        </div>
                                        <div class="input-group ml-3">
                                            <label for="fullname">Họ tên:</label>
                                        </div>
                                        <div class="input-group mb-3 ml-3">
                                            <input type="text" name="name" class="form-control">
                                        </div>
                                        <div class="input-group ml-3">
                                            <label for="email">Email:</label>
                                        </div>
                                        <div class="input-group mb-3 ml-3">
                                            <input type="text" name="email" class="form-control">
                                        </div>
                                        <div class="input-group ml-3">
                                            <label for="phone">Số điện thoại:</label>
                                        </div>
                                        <div class="input-group mb-3 ml-3">
                                            <input type="text" name="phone" class="form-control">
                                        </div>
                                        <div class="input-group ml-3">
                                            <label for="message">Lời nhắn:</label>
                                        </div>
                                        <div class="input-group mb-3 ml-3">
                                            <textarea class="form-control" name="message" rows="3"></textarea>
                                        </div>
                                        <div class="input-group mb-3 ml-3">
                                            <button type="submit"  class="btn btn-primary">Gửi tin nhắn</button>
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

