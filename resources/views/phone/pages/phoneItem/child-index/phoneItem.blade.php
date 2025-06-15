
@php
    use App\Helpers\Template;
    use Illuminate\Support\Str;

    $name = $item['name'];
    $description     = $item['description'];

    $saveTitle              = 0;
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

    //media
    $imgArray        = json_decode($item['media'][0]['content'],true);
    $imgName         = $imgArray['name'];
    $imgAlt          = $imgArray['alt'];

    $image           = Template::showProductThumbInPhoneItem('product',$imgName,$imgAlt);
    $imageURL        = ($imgName)? asset("images/product/$imgName") : '';

@endphp
<div class="col-lg-9 col-sm-12 col-xs-12">
    <div class="container-fluid">
        <div class="row">
            <div class="col-xl-12">
                <div class="filter-main-btn mb-2"><span class="filter-btn"><i class="fa fa-filter" aria-hidden="true"></i> filter</span></div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-4 col-xl-4">
                <div class="product-slick">
                    <div>
                        {!! $image !!}
                    </div>
                </div>
            </div>
            <div class="col-lg-8 col-xl-8 rtl-text">
                <div class="product-right">
                    <h2 class="mb-2">{{$name}}</h2>
                    <h4><del>{{$originalPriceDefault}} $</del><span> -{{$saveTitle}}%</span></h4>
                    <h3>{{$salePrice}} $</h3>
                    <div class="product-description border-product">
                        <h6 class="product-title">Số lượng</h6>
                        <div class="qty-box">
                            <div class="input-group">
                                <span class="input-group-prepend">
                                    <button type="button" class="btn quantity-left-minus" data-type="minus" data-field="">
                                        <i class="ti-angle-left"></i>
                                    </button>
                                </span>
                                <input type="text" name="quantity" class="form-control input-number" value="1">
                                <span class="input-group-prepend">
                                    <button type="button" class="btn quantity-right-plus" data-type="plus" data-field="">
                                        <i class="ti-angle-right"></i>
                                    </button>
                                </span>
                            </div>
                        </div>
                    </div>
                    <div class="product-buttons">
                        <a href="#" class="btn btn-solid ml-0"><i class="fa fa-cart-plus"></i> Chọn mua</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <section class="tab-product m-0">
        <div class="container">
            <div class="row">
                <div class="col-sm-12 col-lg-12">
                    <ul class="nav nav-tabs nav-material" id="top-tab" role="tablist">
                        <li class="nav-item"><a class="nav-link active" id="top-home-tab"
                                data-toggle="tab" href="#top-home" role="tab"
                                aria-selected="true">Mô tả sản phẩm</a>
                            <div class="material-border"></div>
                        </li>
                    </ul>
                    <div class="tab-content nav-material" id="top-tabContent">
                        <div class="tab-pane fade show active ckeditor-content" id="top-home"
                            role="tabpanel" aria-labelledby="top-home-tab">

                            {!! $description !!}

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>

