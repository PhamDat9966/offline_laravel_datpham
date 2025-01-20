@php
    use App\Helpers\Template as Template;
    use App\Helpers\Hightlight as Hightlight;
    $data = $items->toArray();
    $data = $data['data'];
    //dd($data,$colorList);
@endphp
<div class="x_content">
    <div class="table-responsive">
        <table class="table table-striped jambo_table bulk_action">
            <thead>
                <tr class="headings">
                    <th class="column-title">#</th>
                    <th class="column-title">Tên sản phẩm</th>
                    <th class="column-title">Màu sắc</th>
                    <th class="column-title">Dung lượng</th>
                    <th class="column-title">Giá</th>
                </tr>
            </thead>
            <tbody>

                @if (count($items) > 0)
                <ul id="sortable">
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
                                    $color   = '<div class="color-box text-center" style="background: '.$colorVal['color'].';"><span style="color: '.$color_opposite.';">'.$colorVal['name'].'</span></div>';
                                }
                            }


                            $material               = Hightlight::show($val['material_name'], $params['search'] , 'material_name');

                            $price                  = Template::showItemPrice($controllerName,$val['price'],$id);
                        @endphp
                        <li data-id="{{ $dataId  }}">
                            {{ $index }}
                            <p><strong>Name:</strong> {!! $name !!}</p>
                            {!!$color!!}
                            {!!$material!!}
                            {!!$price!!}
                            {{--  <tr class="{{$class}} pointer">
                                <td>{{ $index }}</td>
                                <td width="30%">
                                    <p><strong>Name:</strong> {!! $name !!}</p>
                                </td>
                                <td width="20%">
                                    {!!$color!!}
                                </td>
                                <td width="20%">
                                    {!!$material!!}
                                </td>
                                <td class="last">
                                    {!!$price!!}
                                </td>
                            </tr>  --}}
                        </li>
                    @endforeach
                </ul>
                @else
                    @include('admin.templates.list_empty',['colspan'=>6])
                @endif

            </tbody>
        </table>
    </div>
</div>

