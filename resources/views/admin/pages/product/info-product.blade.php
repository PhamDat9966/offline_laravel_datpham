@php
    use App\Helpers\Template as Template;
    //dd($item->toArray());
    $id             = (isset($item['id']))? $item['id'] : '';
    $name           = (isset($item['name']))? $item->name : '';
    $slug           = (isset($item['slug']))? $item->slug : '';
    $status         = (isset($item['status']))? $item->status : '';
    $category       = (isset($item['category_product_id']))? $item->category_product_id : '';
    $description    = (isset($item['description']))? $item->description : '';

    /*Hình ảnh*/
    $thumbContent       = json_decode($item['media'][0]['content']);
    $thumbName          = $thumbContent->name;
    $thumb              = Template::showProductThumb($controllerName,$thumbName,$name);
    $xhtmlMedia         = '';
    foreach($item['media'] as $key=>$media){
        $mediaContent   = json_decode($media['content']);
        $mediaName      = $mediaContent->name;
        $xhtmlMedia    .= '<a>' .Template::showProductThumb($controllerName,$mediaName,$name). '</a>';
    }

    /*Màu sắc và dung lượng*/
    $xhtmlColors         = '<ul class="list-inline prod_color display-layout">';
    $xhtmlStorage        = '<ul class="list-inline prod_size display-layout">';
    foreach($item['attributes'] as $attkey=>$attribute){
        if($attribute['color-picker']){
            $xhtmlColors    .=  '<li>
                                    <p>'.$attribute['attribute_value_name'].'</p>
                                    <div class="color" style="background:'.$attribute['color-picker'].';color:#ffffff;"></div>
                                </li>';
        }

        //Sử dụng id định danh của dung lượng là 2 'material', để xác định những nội dung nào cần xuất ra ở storage
        if($attribute['attribute_id'] == 2){
            $xhtmlStorage   .=' <li>
                                    <button type="button" class="btn btn-default btn-xs" data-id="'.$attribute['attribute_value_id'].'">'.$attribute['attribute_value_name'].'</button>
                                </li>';
        }
    }
    $xhtmlColors        .= '</ul>';
    $xhtmlStorage       .= '</ul>';


@endphp

<div class="row">
    <div class="col-md-12 col-sm-12 ">
    <div class="x_panel">
        <div class="x_title">
        <h2>Thông tin sản phẩm</h2>
        <ul class="nav navbar-right panel_toolbox">
            <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
            </li>
            <li class="dropdown">
                <li><a class="close-link"><i class="fa fa-close"></i></a>
            </li>
        </ul>
        <div class="clearfix"></div>
        </div>
        <div class="x_content">

        <div class="col-md-7 col-sm-7 ">
            <div class="product-image">
                {!! $thumb !!}
            </div>
            <div class="product_gallery">
                {!! $xhtmlMedia !!}
            </div>
        </div>

        <div class="col-md-5 col-sm-5 " style="border:0px solid #e5e5e5;">

            <h3 class="prod_title">{!!ucfirst($name)!!}</h3>
                {!! $description !!}
            <br />

            <div class="">
                <h2>Màu sắc</h2>
                {!! $xhtmlColors !!}

            </div>
            <br />

            <div class="">
            <h2>Dung lượng <small>Hãy chọn một thuộc tính</small></h2>
                {!! $xhtmlStorage !!}
            </div>
            <br />

            <div class="">
            <div class="product_price">
                <h1 class="price">Ksh80.00</h1>
                <span class="price-tax">Ex Tax: Ksh80.00</span>
                <br>
            </div>
            </div>

            <div class="">
            <button type="button" class="btn btn-default btn-lg">Add to Cart</button>
            <button type="button" class="btn btn-default btn-lg">Add to Wishlist</button>
            </div>

        </div>
        </div>
    </div>
    </div>
</div>
