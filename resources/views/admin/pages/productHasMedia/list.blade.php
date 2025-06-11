@php
    use App\Helpers\Template as Template;
    use App\Helpers\Hightlight as Hightlight;
@endphp

<div class="x_content">
    <div class="table-responsive">
        <table class="table table-striped jambo_table bulk_action">
            <thead>
                <tr class="headings">
                    <th class="column-title">#</th>
                    <th class="column-title">Thông tin chung</th>
                    <th class="column-title">Hình ảnh</th>
                    <th class="column-title">Gán thuộc tính vào ảnh</th>
                    <th class="column-title">Miêu tả</th>
                    <th class="column-title">Trạng thái</th>
                    <th class="column-title">Hành động</th>
                </tr>
            </thead>
            <tbody>

                @if (count($itemsHasAttributes) > 0)
                    @foreach ($itemsHasAttributes as $key => $val)
                        @php
                            $index              = $key+1;
                            $class              = ($index % 2 == 0)? 'even' : 'odd';

                            $id                         = $val['id'];
                            $product_id                 = $val['product_id'];
                            $attribute_value_id         = $val['attribute_value_id'];
                            $nameProduct                = $val['product_name'];
                            $attribute_value_name       = $val['attribute_value_name'];
                            $mediaContent               = json_decode($val['content']);
                            $mediaName                  = $mediaContent->name;
                            $mediaAlt                   = $mediaContent->alt;
                            $mediaSize                  = $mediaContent->size;
                            $mediaShow                  = Template::showItemMedia('product',$val);

                            //dd($mediaContent);

                            //$action                 = Template::showButtonActionProductHasAttribute($controllerName,$product_id ,$attribute_value_id);
                        @endphp

                        <tr class="{{$class}} pointer">
                            <td>{{ $index }}</td>
                            <td width="15%">
                                <p><strong>Name:</strong> {!! $nameProduct !!}</p>
                                <p><strong>Media:</strong> {!! $mediaName !!}</p>
                                <p>Alt: {!! $mediaAlt !!}</p>
                                <p>Size: {!! $mediaSize !!}</p>
                            </td>
                            <td width="10%">
                                {!!$mediaShow!!}
                            </td>
                            <td width="10%">
                                {!!$attribute_value_name!!}
                            </td>
                            <td class="last">

                            </td>
                        </tr>
                    @endforeach

                @else
                    @include('admin.templates.list_empty',['colspan'=>6])
                @endif

            </tbody>
        </table>
    </div>
</div>

