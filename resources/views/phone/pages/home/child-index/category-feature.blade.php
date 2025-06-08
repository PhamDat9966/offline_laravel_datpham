@php
    // dd($categoryIsFeatures);
    $xhtmlTabTitle  = '<ul class="tabs tab-title">';

    $xhtmlTabContent = '<div class="tab-content-cls">';
    $i = 1;
    foreach($categoryIsFeatures as $keyCa=>$categoryIsFeature){
        $tagTitleCurrent  = '';
        $tagContentActive = '';
        if($i==1){
            $tagTitleCurrent    = 'current';
            $tagContentActive   = 'active default';
        }

        $xhtmlTabTitle .= '<li class="'.$tagTitleCurrent.'"><a href="tab-category-'.$i.'" class="my-product-tab" data-category="'.$i.'">'.$categoryIsFeature['name'].'</a></li>';
        $xhtmlTabContent   .='<div id="tab-category-'.$i.'" class="tab-content '.$tagContentActive.'">
                                <div class="no-slider row tab-content-inside">';

        foreach($categoryIsFeature['items'] as $keyItem=>$item){
            $name = "<strong style='color:red;'>".ucfirst($item['name']).': </strong>';
            $xhtmlTabContent .=     '<div class="product-box">
                                        <div class="img-wrapper">
                                            <div class="lable-block">
                                                <span class="lable4 badge badge-danger"> -35%</span>
                                            </div>
                                            <div class="front">
                                                <a href="item.html">
                                                    <img src="images/product.jpg"
                                                        class="img-fluid blur-up lazyload bg-img" alt="product">
                                                </a>
                                            </div>
                                            <div class="cart-info cart-wrap">
                                                <a href="#" title="Add to cart"><i class="ti-shopping-cart"></i></a>
                                                <a href="#" title="Quick View"><i class="ti-search" data-toggle="modal"
                                                        data-target="#quick-view"></i></a>
                                            </div>
                                        </div>
                                        <div class="product-detail">
                                            <div class="rating">
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                            </div>
                                            <a href="item.html"
                                                title="'.$item['name'].'">
                                                <h6>'.$name.'  Lorem, ipsum dolor sit amet consectetur adipisicing elit. Eius,
                                                    quasi ...</h6>
                                            </a>
                                            <h4 class="text-lowercase">48,020 đ <del>98,000 đ</del></h4>
                                        </div>
                                    </div>';
        }

        $xhtmlTabContent .=         '</div>
                                <div class="text-center"><a href="list.html" class="btn btn-solid">Xem tất cả</a></div>
                            </div>';

        $i++;
    }
    $xhtmlTabContent .='</div>';

    $xhtmlTabTitle .= '</ul>';
    //dd($xhtmlTabContent);
@endphp
<div class="title1 section-t-space title5">
    <h2 class="title-inner1">Danh mục nổi bật</h2>
    <hr role="tournament6">
</div>
<section class="p-t-0 j-box ratio_asos">
    <div class="container">
        <div class="row">
            <div class="col">
                <div class="theme-tab">
                    {!!
                       $xhtmlTabTitle
                    !!}

                    {!!
                        $xhtmlTabContent
                    !!}

                    {{-- <div class="tab-content-cls">
                        <div id="tab-category-1" class="tab-content active default">
                            <div class="no-slider row tab-content-inside">

                                <div class="product-box">
                                    <div class="img-wrapper">
                                        <div class="lable-block">
                                            <span class="lable4 badge badge-danger"> -35%</span>
                                        </div>
                                        <div class="front">
                                            <a href="item.html">
                                                <img src="images/product.jpg"
                                                    class="img-fluid blur-up lazyload bg-img" alt="product">
                                            </a>
                                        </div>
                                        <div class="cart-info cart-wrap">
                                            <a href="#" title="Add to cart"><i class="ti-shopping-cart"></i></a>
                                            <a href="#" title="Quick View"><i class="ti-search" data-toggle="modal"
                                                    data-target="#quick-view"></i></a>
                                        </div>
                                    </div>
                                    <div class="product-detail">
                                        <div class="rating">
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                        </div>
                                        <a href="item.html"
                                            title="Lorem ipsum dolor sit amet consectetur adipisicing elit. Asperiores reprehenderit incidunt vero aperiam, ipsum natus.">
                                            <h6>Lorem, ipsum dolor sit amet consectetur adipisicing elit. Eius,
                                                quasi ...</h6>
                                        </a>
                                        <h4 class="text-lowercase">48,020 đ <del>98,000 đ</del></h4>
                                    </div>
                                </div>

                            </div>
                            <div class="text-center"><a href="list.html" class="btn btn-solid">Xem tất cả</a></div>
                        </div>
                        <div id="tab-category-2" class="tab-content ">
                            <div class="no-slider row tab-content-inside">

                                <div class="product-box">
                                    <div class="img-wrapper">
                                        <div class="lable-block">
                                            <span class="lable4 badge badge-danger"> -35%</span>
                                        </div>
                                        <div class="front">
                                            <a href="item.html">
                                                <img src="images/product.jpg"
                                                    class="img-fluid blur-up lazyload bg-img" alt="product">
                                            </a>
                                        </div>
                                        <div class="cart-info cart-wrap">
                                            <a href="#" title="Add to cart"><i class="ti-shopping-cart"></i></a>
                                            <a href="#" title="Quick View"><i class="ti-search" data-toggle="modal"
                                                    data-target="#quick-view"></i></a>
                                        </div>
                                    </div>
                                    <div class="product-detail">
                                        <div class="rating">
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                        </div>
                                        <a href="item.html"
                                            title="Lorem ipsum dolor sit amet consectetur adipisicing elit. Asperiores reprehenderit incidunt vero aperiam, ipsum natus.">
                                            <h6>Lorem, ipsum dolor sit amet consectetur adipisicing elit. Eius,
                                                quasi ...</h6>
                                        </a>
                                        <h4 class="text-lowercase">48,020 đ <del>98,000 đ</del></h4>
                                    </div>
                                </div>

                            </div>
                            <div class="text-center"><a href="list.html" class="btn btn-solid">Xem tất cả</a></div>
                        </div>
                        <div id="tab-category-3" class="tab-content ">
                            <div class="no-slider row tab-content-inside">
                                <div class="product-box">
                                    <div class="img-wrapper">
                                        <div class="lable-block">
                                            <span class="lable4 badge badge-danger"> -35%</span>
                                        </div>
                                        <div class="front">
                                            <a href="item.html">
                                                <img src="images/product.jpg"
                                                    class="img-fluid blur-up lazyload bg-img" alt="product">
                                            </a>
                                        </div>
                                        <div class="cart-info cart-wrap">
                                            <a href="#" title="Add to cart"><i class="ti-shopping-cart"></i></a>
                                            <a href="#" title="Quick View"><i class="ti-search" data-toggle="modal"
                                                    data-target="#quick-view"></i></a>
                                        </div>
                                    </div>
                                    <div class="product-detail">
                                        <div class="rating">
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                        </div>
                                        <a href="item.html"
                                            title="Lorem ipsum dolor sit amet consectetur adipisicing elit. Asperiores reprehenderit incidunt vero aperiam, ipsum natus.">
                                            <h6>Lorem, ipsum dolor sit amet consectetur adipisicing elit. Eius,
                                                quasi ...</h6>
                                        </a>
                                        <h4 class="text-lowercase">48,020 đ <del>98,000 đ</del></h4>
                                    </div>
                                </div>
                                <div class="product-box">
                                    <div class="img-wrapper">
                                        <div class="lable-block">
                                            <span class="lable4 badge badge-danger"> -35%</span>
                                        </div>
                                        <div class="front">
                                            <a href="item.html">
                                                <img src="images/product.jpg"
                                                    class="img-fluid blur-up lazyload bg-img" alt="product">
                                            </a>
                                        </div>
                                        <div class="cart-info cart-wrap">
                                            <a href="#" title="Add to cart"><i class="ti-shopping-cart"></i></a>
                                            <a href="#" title="Quick View"><i class="ti-search" data-toggle="modal"
                                                    data-target="#quick-view"></i></a>
                                        </div>
                                    </div>
                                    <div class="product-detail">
                                        <div class="rating">
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                        </div>
                                        <a href="item.html"
                                            title="Lorem ipsum dolor sit amet consectetur adipisicing elit. Asperiores reprehenderit incidunt vero aperiam, ipsum natus.">
                                            <h6>Lorem, ipsum dolor sit amet consectetur adipisicing elit. Eius,
                                                quasi ...</h6>
                                        </a>
                                        <h4 class="text-lowercase">48,020 đ <del>98,000 đ</del></h4>
                                    </div>
                                </div>
                                <div class="product-box">
                                    <div class="img-wrapper">
                                        <div class="lable-block">
                                            <span class="lable4 badge badge-danger"> -35%</span>
                                        </div>
                                        <div class="front">
                                            <a href="item.html">
                                                <img src="images/product.jpg"
                                                    class="img-fluid blur-up lazyload bg-img" alt="product">
                                            </a>
                                        </div>
                                        <div class="cart-info cart-wrap">
                                            <a href="#" title="Add to cart"><i class="ti-shopping-cart"></i></a>
                                            <a href="#" title="Quick View"><i class="ti-search" data-toggle="modal"
                                                    data-target="#quick-view"></i></a>
                                        </div>
                                    </div>
                                    <div class="product-detail">
                                        <div class="rating">
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                        </div>
                                        <a href="item.html"
                                            title="Lorem ipsum dolor sit amet consectetur adipisicing elit. Asperiores reprehenderit incidunt vero aperiam, ipsum natus.">
                                            <h6>Lorem, ipsum dolor sit amet consectetur adipisicing elit. Eius,
                                                quasi ...</h6>
                                        </a>
                                        <h4 class="text-lowercase">48,020 đ <del>98,000 đ</del></h4>
                                    </div>
                                </div>
                                <div class="product-box">
                                    <div class="img-wrapper">
                                        <div class="lable-block">
                                            <span class="lable4 badge badge-danger"> -35%</span>
                                        </div>
                                        <div class="front">
                                            <a href="item.html">
                                                <img src="images/product.jpg"
                                                    class="img-fluid blur-up lazyload bg-img" alt="product">
                                            </a>
                                        </div>
                                        <div class="cart-info cart-wrap">
                                            <a href="#" title="Add to cart"><i class="ti-shopping-cart"></i></a>
                                            <a href="#" title="Quick View"><i class="ti-search" data-toggle="modal"
                                                    data-target="#quick-view"></i></a>
                                        </div>
                                    </div>
                                    <div class="product-detail">
                                        <div class="rating">
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                        </div>
                                        <a href="item.html"
                                            title="Lorem ipsum dolor sit amet consectetur adipisicing elit. Asperiores reprehenderit incidunt vero aperiam, ipsum natus.">
                                            <h6>Lorem, ipsum dolor sit amet consectetur adipisicing elit. Eius,
                                                quasi ...</h6>
                                        </a>
                                        <h4 class="text-lowercase">48,020 đ <del>98,000 đ</del></h4>
                                    </div>
                                </div>
                                <div class="product-box">
                                    <div class="img-wrapper">
                                        <div class="lable-block">
                                            <span class="lable4 badge badge-danger"> -35%</span>
                                        </div>
                                        <div class="front">
                                            <a href="item.html">
                                                <img src="images/product.jpg"
                                                    class="img-fluid blur-up lazyload bg-img" alt="product">
                                            </a>
                                        </div>
                                        <div class="cart-info cart-wrap">
                                            <a href="#" title="Add to cart"><i class="ti-shopping-cart"></i></a>
                                            <a href="#" title="Quick View"><i class="ti-search" data-toggle="modal"
                                                    data-target="#quick-view"></i></a>
                                        </div>
                                    </div>
                                    <div class="product-detail">
                                        <div class="rating">
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                        </div>
                                        <a href="item.html"
                                            title="Lorem ipsum dolor sit amet consectetur adipisicing elit. Asperiores reprehenderit incidunt vero aperiam, ipsum natus.">
                                            <h6>Lorem, ipsum dolor sit amet consectetur adipisicing elit. Eius,
                                                quasi ...</h6>
                                        </a>
                                        <h4 class="text-lowercase">48,020 đ <del>98,000 đ</del></h4>
                                    </div>
                                </div>
                                <div class="product-box">
                                    <div class="img-wrapper">
                                        <div class="lable-block">
                                            <span class="lable4 badge badge-danger"> -35%</span>
                                        </div>
                                        <div class="front">
                                            <a href="item.html">
                                                <img src="images/product.jpg"
                                                    class="img-fluid blur-up lazyload bg-img" alt="product">
                                            </a>
                                        </div>
                                        <div class="cart-info cart-wrap">
                                            <a href="#" title="Add to cart"><i class="ti-shopping-cart"></i></a>
                                            <a href="#" title="Quick View"><i class="ti-search" data-toggle="modal"
                                                    data-target="#quick-view"></i></a>
                                        </div>
                                    </div>
                                    <div class="product-detail">
                                        <div class="rating">
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                        </div>
                                        <a href="item.html"
                                            title="Lorem ipsum dolor sit amet consectetur adipisicing elit. Asperiores reprehenderit incidunt vero aperiam, ipsum natus.">
                                            <h6>Lorem, ipsum dolor sit amet consectetur adipisicing elit. Eius,
                                                quasi ...</h6>
                                        </a>
                                        <h4 class="text-lowercase">48,020 đ <del>98,000 đ</del></h4>
                                    </div>
                                </div>
                                <div class="product-box">
                                    <div class="img-wrapper">
                                        <div class="lable-block">
                                            <span class="lable4 badge badge-danger"> -35%</span>
                                        </div>
                                        <div class="front">
                                            <a href="item.html">
                                                <img src="images/product.jpg"
                                                    class="img-fluid blur-up lazyload bg-img" alt="product">
                                            </a>
                                        </div>
                                        <div class="cart-info cart-wrap">
                                            <a href="#" title="Add to cart"><i class="ti-shopping-cart"></i></a>
                                            <a href="#" title="Quick View"><i class="ti-search" data-toggle="modal"
                                                    data-target="#quick-view"></i></a>
                                        </div>
                                    </div>
                                    <div class="product-detail">
                                        <div class="rating">
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                        </div>
                                        <a href="item.html"
                                            title="Lorem ipsum dolor sit amet consectetur adipisicing elit. Asperiores reprehenderit incidunt vero aperiam, ipsum natus.">
                                            <h6>Lorem, ipsum dolor sit amet consectetur adipisicing elit. Eius,
                                                quasi ...</h6>
                                        </a>
                                        <h4 class="text-lowercase">48,020 đ <del>98,000 đ</del></h4>
                                    </div>
                                </div>
                                <div class="product-box">
                                    <div class="img-wrapper">
                                        <div class="lable-block">
                                            <span class="lable4 badge badge-danger"> -35%</span>
                                        </div>
                                        <div class="front">
                                            <a href="item.html">
                                                <img src="images/product.jpg"
                                                    class="img-fluid blur-up lazyload bg-img" alt="product">
                                            </a>
                                        </div>
                                        <div class="cart-info cart-wrap">
                                            <a href="#" title="Add to cart"><i class="ti-shopping-cart"></i></a>
                                            <a href="#" title="Quick View"><i class="ti-search" data-toggle="modal"
                                                    data-target="#quick-view"></i></a>
                                        </div>
                                    </div>
                                    <div class="product-detail">
                                        <div class="rating">
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                        </div>
                                        <a href="item.html"
                                            title="Lorem ipsum dolor sit amet consectetur adipisicing elit. Asperiores reprehenderit incidunt vero aperiam, ipsum natus.">
                                            <h6>Lorem, ipsum dolor sit amet consectetur adipisicing elit. Eius,
                                                quasi ...</h6>
                                        </a>
                                        <h4 class="text-lowercase">48,020 đ <del>98,000 đ</del></h4>
                                    </div>
                                </div>
                            </div>
                            <div class="text-center"><a href="list.html" class="btn btn-solid">Xem tất cả</a></div>
                        </div>
                    </div> --}}


                </div>
            </div>
        </div>
    </div>
</section>
