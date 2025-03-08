@extends('admin.main')

@php
    use App\Helpers\template as Template;
    $xhtmlAreaSearch            =   Template::showAreaSearch($controllerName, $params['search']);
    $xhtmlRoleHasPermission     = '<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#popupForm">
                                        Thêm vai trò cho quyền
                                   </button>';
@endphp

@section('content')
<!-- page content -->
@include('admin.templates.page_header', ['pageIndex' => false])

@include('admin.templates.zvn_notily')
@include('admin.templates.error')
<div class="row">
    <div class="col-md-12 col-sm-12 col-xs-12">
        <div class="x_panel">
            @include('admin.templates.x_title',['title'=>'Bộ lọc'])
            <div class="x_content">
                <div class="row">
                    <div class="col-md-4">
                        {!! $xhtmlRoleHasPermission !!}
                    </div>
                    <div class="col-md-2">
                    </div>
                    <div class="col-md-2">
                    </div>
                    <div class="col-md-4">
                        {!!$xhtmlAreaSearch!!}
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!--box-lists-->
<div class="row">
    <div class="col-md-12 col-sm-12 col-xs-12">
        <div class="x_panel">
            @include('admin.templates.x_title',['title'=>'Danh sách'])
            <!--List content-->
            @include("admin.pages.roleHasPermission.list")
            <!--end List-->
        </div>
    </div>
</div>
<!--end-box-lists-->
<!--box-pagination-->
@if (count($items) > 0)
<div class="row">
    <div class="col-md-12 col-sm-12 col-xs-12">
        <div class="x_panel">
            @include('admin.templates.x_title',['title'=>'Phân trang'])
            @include('admin.templates.pagination')
        </div>
    </div>
</div>
@endif
<!--end-box-pagination-->
<!-- /page content -->
@endsection


@section('popup')
<!-- Modal -->
<div class="modal fade" id="popupForm" tabindex="-1" aria-labelledby="popupFormLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h3 class="modal-title" id="popupFormLabel">Thêm quyền cho vai trò</h3>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="{{route($controllerName.'/save')}}" method="POST">
                    @csrf
                    <label for="role">Vai trò - Role:</label>
                    <select name="role_id" id="role" class="form-control">
                        @foreach ($roleList as $keyR=>$role)
                            <option value="{{$role['id']}}">{{$role['name']}}</option>
                        @endforeach
                    </select>

                    <label for="permission">Quyền - Permission:</label>
                    <select name="permission_id" id="permission" class="form-control">
                        @foreach ($permissionList as $keyP=>$permission)
                            <option value="{{$permission['id']}}">{{$permission['name']}}</option>
                        @endforeach
                    </select>

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
