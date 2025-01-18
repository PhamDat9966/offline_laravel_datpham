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
                    <th class="column-title">Tên hàng</th>
                    <th class="column-title">Màu sắc</th>
                    <th class="column-title">Dung lượng bộ nhớ</th>
                    <th class="column-title">Số lượng</th>
                    <th class="column-title">Đơn giá</th>
                    <th class="column-title">Hành động</th>
                </tr>
            </thead>
            <tbody>

                @if (count($cart) > 0)
                    @foreach ($cart as $key => $val)
                        @php
                            $index              = $key+1;
                            $class              = ($index % 2 == 0)? 'even' : 'odd';

                            $id                 = $val['id'];
                            $name               = $val['name'];
                            $color_name         = $val['color_name'];
                            $material_name      = $val['material_name'];
                            $quantity           = Template::showItemQuantity($controllerName,$val['quantity'],$id);
                            $price              = '<span class="price" id="price-'.$id.'">'.$val['price'].'</span>';
                            $listButtonAction   = '<a href="http://proj_news.xyz/admin96/user/delete-one-cart/27"
                                                      type="button" class="btn btn-icon btn-danger btn-delete"
                                                      data-toggle="tooltip" data-placement="top"
                                                      data-original-title="Delete">
                                                            <i class="fa fa-remove"></i>
                                                    </a>';
                        @endphp

                        <tr class="{{$class}} pointer">
                            <td>{{ $index }}</td>
                            <td width="30%">
                                <p><strong>name:</strong> {!! $name !!}</p>
                            </td>
                            <td width="10%">
                                {!! $color_name !!}
                            </td>
                            <td width="10%">
                                {!! $material_name !!}
                            </td>
                            <td>
                                {!! $quantity !!}
                            </td>
                            <td>
                                {!! $price !!}
                            </td>
                            <td class="last">
                                {!!$listButtonAction!!}
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

