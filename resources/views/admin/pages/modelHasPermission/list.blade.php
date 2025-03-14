@php
    use App\Helpers\Template as Template;
    use App\Helpers\Hightlight as Hightlight;

    $urlUserSearch          = Route($controllerName) . '/user-search';
    $urlPermissionSearch    = Route($controllerName) . '/permission-search';
@endphp

<div class="x_content">
    <div class="table-responsive">
        <table class="table table-striped jambo_table bulk_action">
            <thead>
                <tr class="headings">
                    <th class="column-title">#</th>
                    <th class="column-title">Model Info</th>
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
                            $modelId            = $val['model_id'];
                            $username           = $val['username'];
                            $email              = $val['email'];
                            $modelType          = $val['model_type'];

                            $permissionId       = $val['permission_id'];

                            $permissionName     = Hightlight::show($val['permission_name'], $params['search'] , 'name');
                           // $listButtonAction   = Template::showButtonActionRoleHasPermission($controllerName, $roleId,$permissionId);

                        @endphp

                        <tr class="{{$class}} pointer">
                            <td>{{ $index }}</td>
                            <td width="40%">
                                <p><strong>Id User:</strong> {!! $modelId !!}</p>
                                <p><strong>Username:</strong> {!! $username !!}</p>
                                <p><strong>Email:</strong> {!! $email !!}</p>
                                <p><strong>Model Type:</strong> {!! $modelType !!}</p>
                            </td>
                            <td width="40%">
                                <p><strong>Permission Id:{!! $permissionId !!}</strong></p>
                                <p><strong>Permission Name:{!! $permissionName !!}</strong></p>
                            </td>
                            <td class="last">
                                {!!!!}
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


@section('popup')
<!-- Modal -->
<div class="modal fade" id="popupForm" tabindex="-1" aria-labelledby="popupFormLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h3 class="modal-title" id="popupFormLabel">Gán quyền có sẵn cho một vai trò</h3>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="{{route($controllerName.'/save')}}" method="POST">
                    @csrf
                    <label for="model">Người dùng trong Model:</label>
                    <select name="user_id" id="user_search" class="form-control" style="width: 100%" data-url="{{$urlUserSearch}}">
                        <option value="">Nhập hoặc chọn tên user...</option>
                    </select>

                    <label for="model">Quyền - Permission:</label>
                    <select name="permission_id" id="permission_search" class="form-control" style="width: 100%" data-url="{{$urlPermissionSearch}}">
                        <option value="">Nhập hoặc chọn permission...</option>
                    </select>

                    {{--  <label for="permission">Quyền - Permission:</label>
                    <select name="permission_id" id="permission" class="form-control">
                        @foreach ($permissionList as $keyP=>$permission)
                            <option value="{{$permission['id']}}">{{$permission['name']}}</option>
                        @endforeach
                    </select>  --}}

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
