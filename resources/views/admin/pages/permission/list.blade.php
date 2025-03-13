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
                    <th class="column-title">Guard Name</th>
                    <th class="column-title">Category Name</th>
                    <th class="column-title">Kiểu bài viết</th>
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
                            $guardName         = $val['guard_name'];
                            $createdHistory     = Template::showItemHistory('',$val['created_at'], null);
                            $modifiedHistory    = Template::showItemHistoryModified('',$val['updated_at'],$id,null);
                            $listButtonAction   = Template::showButtonAction($controllerName, $id);

                        @endphp

                        <tr class="{{$class}} pointer">
                            <td>{{ $index }}</td>
                            <td width="30%">
                                <p>{!! $name !!}</p>
                            </td>
                            <td width="30%">
                                 {!! $guardName !!}</p>
                            </td>
                            <td>
                                 {!! $createdHistory !!}</p>
                            </td>
                            <td>
                                 {!! $modifiedHistory !!}</p>
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

