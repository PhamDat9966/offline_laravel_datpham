@php
    use App\Helpers\Template as Template;
    use App\Helpers\Hightlight as Hightlight;

@endphp

<div class="x_content">
    <div class="title">
        <h2>Menu</h2>
        <div class="clearfix"></div>
    </div>
    <div class="table-responsive">
        <table class="table table-striped jambo_table bulk_action">
            <thead>
                <tr class="headings">
                    <th class="column-title">#</th>
                    <th class="column-title">Name</th>
                    <th class="column-title">Trạng thái</th>
                    <th class="column-title">url</th>
                    <th class="column-title">Ordering</th>
                    <th class="column-title">Type menu</th>
                    <th class="column-title">Type open</th>
                    <th class="column-title">Id cha</th>
                    <th class="column-title">Container</th>
                    <th class="column-title">Ghi chú</th>
                    <th class="column-title">Hành động</th>
                </tr>
            </thead>
            <tbody>

                @if (count($items) > 0)
                    @foreach ($items as $key => $val)
                        @php

                            $index              = $key+1;
                            $class              = ($index % 2 == 0)? 'even' : 'odd';

                            $id                 = $val['id'];
                            $name               = Hightlight::show($val['name'], $params['search'] , 'name');
                            $content            = Hightlight::show($val['content'], $params['search'] , 'content');
                            $status             = Template::showItemStatus( $controllerName,$id,$val['status']);
                            $url                = $val['url'];
                            $ordering           = $val['ordering'];
                            $type_menu          = $val['type_menu'];
                            $type_open          = $val['type_open'];
                            $parent_id          = $val['parent_id'];
                            $container          = $val['container'];
                            $note               = $val['note'];

                            $orderingAjax       = '<input class="select2_group form-control" type="number" id="quantity-menu-'.$id.'" name="quantity-menu-'.$id.'" min="1" max="999" value='.$ordering.'>';
                            $listButtonAction   = Template::showButtonAction($controllerName, $id);
                        @endphp

                        <tr class="{{$class}} pointer">
                            <td>{{ $index }}</td>
                            <td width="12%">
                                <p><strong>Name:</strong> {!! $name !!}</p>
                            </td>
                            <td>
                                {!!$status!!}
                            </td>
                            <td>
                                {!!$url!!}
                            </td>
                            <td>
                                {!!$orderingAjax!!}
                            </td>
                            <td>
                                {!!$type_menu!!}
                            </td>
                            <td>
                                {!!$type_open!!}
                            </td>
                            <td>
                                {!!$parent_id!!}
                            </td>
                            <td>
                                {!!$container!!}
                            </td>
                            <td width="10%">
                                {!!$note!!}
                            </td>
                            <td>
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

