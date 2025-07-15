@php

    $count          = 1;
    $lastItem       = end($productsFeature);
    $xhtmlFeature   = '<div>';
    foreach($productsFeature as $item){
        $id              = $item['id'];
        $urlItem         = route('phoneItem',['id'=>$id]);
        $name            = $item['name'];

        $originalPriceDefault   = $item['attribute_prices'][0]['price'];
        $salePrice              = 0;

        switch ($item['price_discount_type']) {
            case 'percent':
                $saveTitle = '-'.$item['price_discount_percent'].'%';
                $salePrice = $originalPriceDefault - ($originalPriceDefault * $item['price_discount_percent']/100);
                break;
            case 'value':
                $saveTitle = '-'.$item['price_discount_value'].'$';
                $salePrice = $originalPriceDefault - $item['price_discount_value'];
                break;
        }

        $salePrice      = ($salePrice == 0) ? 'Mẫu đã hết hàng' : $salePrice . ' $';

        //media
        $imgArray        = json_decode($item['media'][0]['content'],true);
        $imgName         = $imgArray['name'];
        $imgAlt          = $imgArray['alt'];

        $imageURL        = ($imgName)? asset("images/product/$imgName") : '';

        $xhtmlFeature   .= '<div class="media">
                                <a href="'.$urlItem.'">
                                    <img class="img-fluid blur-up lazyload" src="'.$imageURL.'""
                                        alt="'.$imgAlt.'"></a>
                                <div class="media-body align-self-center">
                                    <div class="rating">
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                    </div>

                                    <a href="'.$urlItem.'" title="'.$name.'">
                                        <h6>'.$name.'</h6>
                                    </a>
                                    <h4 class="text-lowercase">'.$salePrice.'</h4>
                                </div>
                            </div>';

        if($count % 4 == 0){
            $xhtmlFeature .='</div><div>';
        }

        if($item == $lastItem){
            $xhtmlFeature .='</div>';
            break;
        }

        $count++;
    }
@endphp
<div class="theme-card">
    <h5 class="title-border">Sản phẩm nổi bật</h5>
    <div class="offer-slider slide-1">
        {!! $xhtmlFeature !!}
    </div>
</div>
