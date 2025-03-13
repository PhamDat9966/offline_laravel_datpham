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
                    <th class="column-title">Role Id</th>
                    <th class="column-title">Permission Id</th>
                    <th class="column-title">Role Name</th>
                    <th class="column-title">Permission Name</th>
                    <th class="column-title">Hành động</th>
                </tr>
            </thead>
            <tbody>

                @if (count($items) > 0)
                    @foreach ($items as $key => $val)
                        @php

                            $index              = $key+1;
                            $class              = ($index % 2 == 0)? 'even' : 'odd';

                            $permissionId       = $val['permission_id'];
                            $roleId             = $val['role_id'];
                            $permissionName     = Hightlight::show($val['permission_name'], $params['search'] , 'name');
                            $roleName           = Hightlight::show($val['role_name'], $params['search'] , 'name');
                            $listButtonAction   = Template::showButtonActionRoleHasPermission($controllerName, $roleId,$permissionId);

                        @endphp

                        <tr class="{{$class}} pointer">
                            <td>{{ $index }}</td>
                            <td width="20%">
                                 {!! $roleId !!}</p>
                            </td>
                            <td width="20%">
                                <p>{!! $permissionId !!}</p>
                            </td>
                            <td>
                                 {!! $roleName !!}</p>
                            </td>
                            <td>
                                 {!! $permissionName !!}</p>
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

