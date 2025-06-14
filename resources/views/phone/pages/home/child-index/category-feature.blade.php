@php
    use App\Helpers\Template;
    use Illuminate\Support\Str;
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

            $id              = $item['id'];
            $name            = $item['name'];
            $urlProduct      = route('product/productModalView');
            $description     = $item['description'];
            $description     = strip_tags($description);
            $description     = html_entity_decode($description);

            $descriptionMini = Str::words($item['description'], 20, '...');
            // 1. Loại bỏ các thẻ HTML
            $descriptionMini = strip_tags($descriptionMini);
            // 2. Chuyển HTML entities về ký tự thuần
            $descriptionMini = "<strong style='color:red;'>".ucfirst($item['name']).': </strong> '.html_entity_decode($descriptionMini);
            //media
            $imgArray        = json_decode($item['media'][0]['content'],true);
            $imgName         = $imgArray['name'];
            $imgAlt          = $imgArray['alt'];

            $image           = Template::showProductThumbInPhone('product',$imgName,$imgAlt);
            $imageURL        = ($imgName)? asset("images/product/$imgName") : '';

            $saveTitle       = 0;
            //price - Giá
            //Chọn giá từ phần tử đầu tiên của attribute_prices làm giá niên yết
            $originalPriceDefault   = $item['attribute_prices'][0]['price'];
            $salePrice              = 0;

            switch ($item['price_discount_type']) {
                case 'percent':
                    $saveTitle = '-'.$item['price_discount_percent'].'%';
                    $salePrice = $originalPriceDefault - ($originalPriceDefault * $item['price_discount_percent']/100);
                    break;
                case 'value':
                    $saveTitle = '-'.$item['price_discount_value'].'$';;
                    $salePrice = $originalPriceDefault - $item['price_discount_value'];
                    break;
            }

            $salePrice  = ($salePrice == 0) ? 'Hàng chưa về' : $salePrice;

            $xhtmlTabContent .=     '<div class="product-box">
                                        <div class="img-wrapper">
                                            <div class="lable-block">
                                                <span class="lable4 badge badge-danger"> '.$saveTitle.'</span>
                                            </div>
                                            <div class="front">
                                                <a href="item.html">
                                                    '.$image.'
                                                </a>
                                            </div>
                                            <div class="cart-info cart-wrap">
                                                <a href="#" title="Add to cart"><i class="ti-shopping-cart"></i></a>
                                                <a href="#" title="Quick View">
                                                    <i class="ti-search quick-view-btn" data-toggle="modal" data-target="#quick-view"
                                                                            data-id="'.$id.'"
                                                                            data-name="'.$name.'"
                                                                            data-description="'.$description.'"
                                                                            data-imageurl="'.$imageURL.'"
                                                                            data-price="'.$originalPriceDefault.'"
                                                                            data-salePrice="'.$salePrice.'"
                                                                            >
                                                    </i>
                                                </a>
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
                                                <h6>'.$descriptionMini.'</h6>
                                            </a>
                                            <h4 class="text-lowercase">'.$salePrice.'$ <del>'.$originalPriceDefault.'$</del></h4>
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
                </div>
            </div>
        </div>
    </div>
</section>
