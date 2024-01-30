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
                    <th class="column-title">Name</th>
                    <th class="column-title">Trạng thái</th>
                    <th class="column-title">Ordering</th>
                    <th class="column-title">Type menu</th>
                    <th class="column-title">Type open</th>
                    <th class="column-title">Menu cha</th>
                    <th class="column-title">Ghi chú</th>
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
                            $ordering           = $val['ordering'];
                            $type_menu          = $val['type_menu'];
                            $type_open          = $val['type_open'];
                            $parent_id          = $val['parent_id'];
                            $note               = $val['note'];

                        @endphp

                        <tr class="{{$class}} pointer">
                            <td>{{ $index }}</td>
                            <td width="15%">
                                <p><strong>Name:</strong> {!! $name !!}</p>
                            </td>
                            <td>
                                {!!$status!!}
                            </td>
                            <td>
                                {!!$ordering!!}
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
                            <td width="15%">
                                {!!$note!!}
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

