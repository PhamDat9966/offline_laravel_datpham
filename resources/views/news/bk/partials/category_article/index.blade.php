@extends('news.en.main')               {{-- @extends sẽ load nội dung của template() sau cùng, cụ thể ở đây ta sẽ thực hiện khối lệnh php trước --}}
{{-- @include('news.en.main') --}}     {{-- @include sẽ load nội dung của template() theo trình tự, cụ thể ở đây ta sẽ thực hiện load template
                                                trước sau đó mới thực hiện khối lệnh php--}}
@php
  //  dd($itemCategoryArticle->toArray());
@endphp
@section('content')
    <!-- Content Container -->
    <div class="section-category">
        @include('news.en.block.breadcrumb',['item'=>$itemCategoryArticle])

        <div class="content_container container_category">
           <div class="featured_title">
              <div class="container">
                 <div class="row">

                    <!-- Main Content -->
                    <div class="col-lg-9">

                        @include('news.en.pages.category_article.child-index.category',['itemCategoryArticle'=>$itemCategoryArticle])

                    </div>
                    <!-- Sidebar -->
                    <div class="col-lg-3">
                        <div class="sidebar">
                            <!-- Latest Posts -->
                            @include('news.en.block.lasted-posts',['items'=>$itemsLatest])
                            <!-- Advertisement -->
                            @include('news.en.block.advertisement',['itemsAdvertisement'=>[]])
                            <!-- Most Viewed -->
                            @include('news.en.block.most-viewed',['itemsMostViewed'=>[]])
                            <!-- Tags -->
                            @include('news.en.block.tags',['itemsTags'=>[]])
                        </div>
                    </div>
                 </div>
              </div>
           </div>
        </div>
     </div>
@endsection

