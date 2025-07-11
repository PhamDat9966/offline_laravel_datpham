<?php
namespace App\Helpers;

use Attribute;
use Carbon\Carbon;
use App\Models\AttributevalueModel;
use DB;
use Illuminate\Support\Facades\App;
use Illuminate\Support\Str;

class ProductHelper{
    public static function xhtmlPhoneItem($item){
        $id              = $item['id'];
        $urlItem         = route('phoneItem',['id'=>$id]);
        $name            = $item['name'];
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
                $saveTitle = '-'.$item['price_discount_value'].'$';
                $salePrice = $originalPriceDefault - $item['price_discount_value'];
                break;
        }

        $salePrice      = ($salePrice == 0) ? 'Hàng chưa về' : $salePrice;

        //Add to Cart
        $urlAddToCart           = route('authsphone/addToCart');
        $dataColorIdDefault     = $item['attribute_prices'][0]['color_id'];
        $dataMaterialIdDefault  = $item['attribute_prices'][0]['material_id'];

        $xhtml        ='<div class="product-box">
                            <div class="img-wrapper">
                                <div class="lable-block">
                                    <span class="lable4 badge badge-danger"> '.$saveTitle.'</span>
                                </div>
                                <div class="front">
                                    <a href="'.$urlItem.'">
                                        '.$image.'
                                    </a>
                                </div>
                                <div class="cart-info cart-wrap">
                                    <a href="#" class="add-to-cart" title="Add to cart"
                                                data-id="'.$id.'"
                                                data-name="'.$name.'"
                                                data-color-id="'.$dataColorIdDefault.'"
                                                data-material-id="'.$dataMaterialIdDefault.'"
                                                data-url="'.$urlAddToCart.'"
                                                ><i class="ti-shopping-cart"></i>
                                    </a>
                                    <a href="#" title="Quick View">
                                        <i class="ti-search quick-view-btn" data-toggle="modal" data-target="#quick-view"
                                                                            data-id="'.$id.'"
                                                                            data-name="'.$name.'"
                                                                            data-description="'.$description.'"
                                                                            data-imageurl="'.$imageURL.'"
                                                                            data-price="'.$originalPriceDefault.'"
                                                                            data-salePrice="'.$salePrice.'"
                                                                            data-color-id="'.$dataColorIdDefault.'"
                                                                            data-material-id="'.$dataMaterialIdDefault.'"
                                                                            data-url-item="'.$urlItem.'"
                                                                            data-url-add-cart="'.$urlAddToCart.'"
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
                                <a href="'.$urlItem.'"
                                    title="'.$item['name'].'">
                                    <h6>'.$descriptionMini.'</h6>
                                </a>
                                <h4 class="text-lowercase">'.$salePrice.'$ <del>'.$originalPriceDefault.'$</del></h4>
                            </div>
                        </div>';
        return $xhtml;
    }

}
