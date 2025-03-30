@extends('news.en.main')               {{-- @extends sẽ load nội dung của template() sau cùng, cụ thể ở đây ta sẽ thực hiện khối lệnh php trước --}}
{{-- @include('news.en.main') --}}     {{-- @include sẽ load nội dung của template() theo trình tự, cụ thể ở đây ta sẽ thực hiện load template
                                                trước sau đó mới thực hiện khối lệnh php--}}
@section('content')
    @include('news.en.block.slider')

    <!-- Content Container -->
    <div class="content_container">
        <div class="container">
            <div class="row">
                <!-- Main Content -->
                <div class="col-lg-9">
                    <div class="main_content">
                        <!-- Featured -->
                        @if ($itemsUsually != null)
                            @include('news.en.block.usually',['items'=>$itemsUsually])
                        @endif
                        <!-- Featured -->
                        @include('news.en.block.featured',['items'=>$itemsFeature])

                        <!-- Category -->
                        @include('news.en.pages.home.child-index.category',['itemsCategory'=>$itemsCategory])

                    </div>
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

@endsection

