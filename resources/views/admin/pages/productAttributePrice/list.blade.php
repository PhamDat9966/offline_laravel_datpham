@php
    use App\Helpers\Template as Template;
    use App\Helpers\Hightlight as Hightlight;
    $data = $items->toArray();
    $data = $data['data'];
    //dd($data,$colorList);
    //dd($params);

    $stt_col        = 'col-xs-1';
    $name_col       = 'col-xs-3';
    $color_col      = 'col-xs-2';
    $material_col   = 'col-xs-1';
    $price_col      = 'col-xs-3';
    $default_col    = 'col-xs-1';
    $action_col     = 'col-xs-1';

    $urlUpdateOrdering = Route($controllerName.'/updateOrdering',
                                [
                                                'filter_color'=>($params['filter']['color']) ? ($params['filter']['color']) : 'all',
                                                'filter_material'=>($params['filter']['material']) ? $params['filter']['material'] : 'all',
                                                'search_value'=>($params['search']['value']) ? ($params['search']['value']) : 'all',
                                                'search_field'=>($params['search']['field']) ? $params['search']['field'] : 'product_name',
                                             ]);
    $urlProductSearch = Route($controllerName) . '/product-search';
    //dd($materialList);

@endphp
<div class="x_content">
            <thead>
                <ul class="row headings">
                    <li class="column-title {{$stt_col}}">#</th>
                    <li class="column-title {{$name_col}}">Tên sản phẩm</th>
                    <li class="column-title {{$color_col}}">Màu sắc</th>
                    <li class="column-title {{$material_col}}">Dung lượng</th>
                    <li class="column-title {{$price_col}}">Giá</th>
                    <li class="column-title {{$default_col}}">default</th>
                    <li class="column-title {{$action_col}}">Hành động</th>
                </ul>
            </thead>
            <tbody>

                @if (count($items) > 0)
                <ul id="sortable" style="list-style: none; padding: 0;" data-url="{{$urlUpdateOrdering}}">
                    @foreach ($data as $key => $val)
                        @php
                            $index              = $val['ordering'];
                            $dataId             = $val['ordering'];
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
                            $flagDefault            = '';
                            if($val['default'] == null || $val['default'] == 0){
                                $val['default'] = 0; //Đặt lại giá trị cho tình huống null
                            }else{
                                $flagDefault    = 'checked';
                            }

                            $urlDefault = route($controllerName) . '/default';
                            /*
                                checkbox-wrapper-8
                                -Thẻ <label....> chính là "khung nhìn của button on off": với for="$id" nó sẽ target đến input có id bằng với giá trị for là $id để thay đổi checked
                            */
                            $default  = '';
                            $default .= '<div style="position: relative;margin:5px;">';
                            $default .=     '<div class="checkbox checkbox-wrapper-8 product-attribute-price-default" style="position: relative;">';
                            $default .=         '<input name="default" style="margin-left:0px;margin:0px" class="tgl tgl-skewed"
                                                                type="checkbox"
                                                                value="'.$val['default'].'"
                                                                id="'.$id.'"
                                                                data-id="'.$id.'"
                                                                data-url="'.$urlDefault.'"
                                                                '.$flagDefault.'
                                                >';
                            $default .=         '<label class="tgl-btn" data-tg-off="OFF" data-tg-on="ON" for="'.$id.'"></label>';
                            $default .=     '</div>';
                            $default .='</div>';

                        @endphp
                        <li data-id="{{ $id  }}" value={{ $dataId }}>
                            <ul class="row double" style="list-style: none; padding: 0;">
                                <li class="{{$stt_col}}">{{ $index }}</li>
                                <li class="{{$name_col}}">{!! $name !!}</li>
                                <li class="{{$color_col}}">{!!$color!!}</p></li>
                                <li class="{{$material_col}}">{!!$material!!}</li>
                                <li class="{{$price_col}}">{!!$price!!}</li>
                                <li class="{{$default_col}}">{!!$default!!}</li>
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

@section('popup')
<!-- Modal -->
<div class="modal fade" id="popupForm" tabindex="-1" aria-labelledby="popupFormLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="popupFormLabel">Thêm Thẻ Giá Cho Sản Phẩm</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="{{route($controllerName.'/save')}}" method="POST">
                    @csrf
                    <label for="product-price">Chọn sản phẩm:</label>
                    <select name="product-id" id="product-price" class="form-control" style="width: 100%" data-url="{{$urlProductSearch}}">
                        <option value="">Nhập hoặc chọn sản phẩm...</option>
                    </select>

                    <label for="color">Chọn màu sắc:</label>
                    <select name="color-id" id="color" class="form-control">
                        @foreach ($colorList as $keyC=>$color)
                            <option value="{{$color['id']}}">{{$color['name']}}</option>
                        @endforeach
                    </select>

                    <label for="material">Chọn dung lượng:</label>
                    <select name="material-id" id="material" class="form-control">
                        @foreach ($materialList as $keyM=>$material)
                            <option value="{{$material['id']}}">{{$material['name']}}</option>
                        @endforeach
                    </select>

                    <label for="price">Đặt giá:</label>
                    <input name="price" type="number" id="price" class="form-control" placeholder="Nhập giá">
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                        <button type="submit" class="btn btn-primary">Lưu</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
@endsection


