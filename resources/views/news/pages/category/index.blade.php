@extends('news.main')               {{-- @extends sẽ load nội dung của template() sau cùng, cụ thể ở đây ta sẽ thực hiện khối lệnh php trước --}}
{{-- @include('news.main') --}}     {{-- @include sẽ load nội dung của template() theo trình tự, cụ thể ở đây ta sẽ thực hiện load template
                                                trước sau đó mới thực hiện khối lệnh php--}}
@section('content')
    <!-- Content Container -->
    <div class="section-category">
        <div class="home">
           <div class="parallax_background parallax-window" data-parallax="scroll" data-image-src="{{asset('news/images/footer.jpg')}}" data-speed="0.8"></div>
           <div class="home_content_container">
              <div class="container">
                 <div class="row">
                    <div class="col">
                       <div class="home_content">
                          <div class="home_title">Thể thao</div>
                          <div class="breadcrumbs">
                             <ul class="d-flex flex-row align-items-start justify-content-start">
                                <li><a href="">Trang chủ</a></li>
                                <li>Thể thao</li>
                             </ul>
                          </div>
                       </div>
                    </div>
                 </div>
              </div>
           </div>
        </div>

        <div class="content_container container_category">
           <div class="featured_title">
              <div class="container">
                 <div class="row">

                    <!-- Main Content -->
                    <div class="col-lg-9">
                       <div class="posts">
                            @include('news.pages.category.child-index.category',['itemCategory'=>$itemCategory])
                       </div>
                    </div>
                    <!-- Sidebar -->
                    <div class="col-lg-3">
                        <div class="sidebar">
                            <!-- Latest Posts -->
                            @include('news.block.lasted-posts',['items'=>$itemsLatest])
                            <!-- Advertisement -->
                            @include('news.block.advertisement',['itemsAdvertisement'=>[]])
                            <!-- Most Viewed -->
                            @include('news.block.most-viewed',['itemsMostViewed'=>[]])
                            <!-- Tags -->
                            @include('news.block.tags',['itemsTags'=>[]])
                        </div>
                    </div>
                 </div>
              </div>
           </div>
        </div>
     </div>
@endsection

