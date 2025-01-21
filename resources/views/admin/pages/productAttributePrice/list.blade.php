@php
    use App\Helpers\Template as Template;
    use App\Helpers\Hightlight as Hightlight;
    $data = $items->toArray();
    $data = $data['data'];
    //dd($data,$colorList);

    $stt_col        = 'col-xs-1';
    $name_col       = 'col-xs-3';
    $color_col      = 'col-xs-2';
    $material_col   = 'col-xs-2';
    $price_col      = 'col-xs-3';
    $action_col     = 'col-xs-1';

@endphp
<div class="x_content">
            <thead>
                <ul class="row headings">
                    <li class="column-title {{$stt_col}}">#</th>
                    <li class="column-title {{$name_col}}">Tên sản phẩm</th>
                    <li class="column-title {{$color_col}}">Màu sắc</th>
                    <li class="column-title {{$material_col}}">Dung lượng</th>
                    <li class="column-title {{$price_col}}">Giá</th>
                    <li class="column-title {{$action_col}}">Hành động</th>
                </ul>
            </thead>
            <tbody>

                @if (count($items) > 0)
                <ul id="sortable" style="list-style: none; padding: 0;">
                    @foreach ($data as $key => $val)
                        @php
                            $index              = $key+1;
                            $dataId           = $key;
                            $class              = ($index % 2 == 0)? 'even' : 'odd';

                            $id                     = $val['id'];
                            $name                   = Hightlight::show($val['product_name'], $params['search'] , 'product_name');

                            $color_id               = $val['color_id'];
                            $color_name             = $val['color_name'];
                            foreach($colorList as $key=>$colorVal){
                                if($colorVal['id'] == $color_id){
                                    //Lấy màu ngược lại với màu của thẻ thuộc lính color, sau đó gắn vào text để nhìn rõ ký tự trong thành màu hơn
                                    $color_opposite = Template::getComplementaryColor($colorVal['color']);
                                    $color   = '<div class="color-box text-center padding-color" style="background: '.$colorVal['color'].';"><span style="color: '.$color_opposite.';">'.$colorVal['name'].'</span></div>';
                                }
                            }

                            $material               = Hightlight::show($val['material_name'], $params['search'] , 'material_name');
                            $price                  = Template::showItemPrice($controllerName,$val['price'],$id);
                            $action                 = 'action list';

                        @endphp
                        <li data-id="{{ $dataId  }}">
                            <ul class="row double" style="list-style: none; padding: 0;">
                                <li class="{{$stt_col}}">{{ $index }}</li>
                                <li class="{{$name_col}}">{!! $name !!}</li>
                                <li class="{{$color_col}}">{!!$color!!}</p></li>
                                <li class="{{$material_col}}">{!!$material!!}</li>
                                <li class="{{$price_col}}">{!!$price!!}</li>
                                <li class="{{$action_col}}">{!!$action!!}</li>
                            </ul>
                        </li>
                    @endforeach
                </ul>
                @else
                    @include('admin.templates.list_empty',['colspan'=>6])
                @endif

            </tbody>
</div>

