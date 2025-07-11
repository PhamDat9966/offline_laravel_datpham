@extends('phone.main')

@section('content')
    <!-- Home slider -->
    @include('phone.block.slider')
    <!-- Home slider end -->

    <!-- Top Collection -->
    @include('phone.pages.home.child-index.feature-collection',['items'=>$itemsFeature])
    <!-- Top Collection end-->

    <!-- service layout -->
    @include('phone.block.service')
    <!-- service layout  end -->

    <!-- Tab product -->
    @include('phone.pages.home.child-index.category-feature',['categoryIsFeatures'=>$categoryIsFeatures])
    <!-- Tab product end -->

    <!--Modal message-->
    @include('phone.block.quick-view')
    @include('phone.block.message')
    <!--End Modal message-->

    <!-- Quick-view modal popup start-->
    <div class="modal fade bd-example-modal-lg theme-modal" id="quick-view" tabindex="-1" role="dialog"
        aria-hidden="true">
        <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
            <div class="modal-content quick-view-modal">
                <div class="modal-body">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                            aria-hidden="true">X</span></button>
                    <div class="row">
                        <div class="col-lg-6 col-xs-12">
                            <div class="quick-view-img"><img src="images/quick-view-bg.jpg" alt=""
                                    class="w-100 img-fluid blur-up lazyload book-picture"></div>
                        </div>
                        <div class="col-lg-6 rtl-text">
                            <div class="product-right">
                                <h2 class="book-name">Lorem ipsum dolor sit amet consectetur adipisicing elit. Maiores,
                                    distinctio.</h2>
                                <h3 class="book-price">26.910 ₫ <del>39.000 ₫</del></h3>
                                <div class="border-product">
                                    <div class="book-description">Lorem ipsum dolor sit amet consectetur, adipisicing
                                        elit. Unde quae cupiditate delectus laudantium odio molestiae deleniti facilis
                                        itaque ut vero architecto nulla officiis in nam qui, doloremque iste. Incidunt,
                                        in?</div>
                                </div>
                                <div class="product-description border-product">
                                    <h6 class="product-title">Số lượng</h6>
                                    <div class="qty-box">
                                        <div class="input-group">
                                            <span class="input-group-prepend">
                                                <button type="button" class="btn quantity-left-minus" data-type="minus"
                                                    data-field="">
                                                    <i class="ti-angle-left"></i>
                                                </button>
                                            </span>
                                            <input type="text" name="quantity" class="form-control input-number"
                                                value="1">
                                            <span class="input-group-prepend">
                                                <button type="button" class="btn quantity-right-plus" data-type="plus"
                                                    data-field="">
                                                    <i class="ti-angle-right"></i>
                                                </button>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                                <div class="product-buttons">
                                    <a href="#" class="btn btn-solid mb-1 btn-add-to-cart">Chọn Mua</a>
                                    <a href="item.html" class="btn btn-solid mb-1 btn-view-book-detail">Xem chi tiết</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Quick-view modal popup end-->
@endsection
