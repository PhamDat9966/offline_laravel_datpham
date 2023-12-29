@extends('news.main')               {{-- @extends sẽ load nội dung của template() sau cùng, cụ thể ở đây ta sẽ thực hiện khối lệnh php trước --}}
{{-- @include('news.main') --}}     {{-- @include sẽ load nội dung của template() theo trình tự, cụ thể ở đây ta sẽ thực hiện load template
                                                trước sau đó mới thực hiện khối lệnh php--}}
@section('content')
    <!-- Content Container -->
    <div class="section-category">
        @include('news.block.breadcrumb',['item'=>['name'=>$title]])

        <div class="content_container container_category">
           <div class="featured_title">
              <div class="container">
                 <div class="row">

                    <!-- Main Content -->
                    <div class="col-lg-8">
                        @include('news.pages.rss.child-index.list',['items'=>$items])
                    </div>
                    <div class="col-lg-4">
                        @include('news.pages.rss.child-index.box-gold',['itemsGold'=>$itemsGold])
                        @include('news.pages.rss.child-index.box-coin',['itemsCoin'=>$itemsCoin])
                    </div>
                 </div>
              </div>
           </div>
        </div>
     </div>
@endsection

