@extends('admin.main')
@section('content')
    <!-- page content -->
    @include('admin.templates.page_header', ['pageIndex' => false])
    @include('admin.templates.error')
    <!-- /page content -->
    @if (isset($item['id']))
        <div class="row">
            @include('admin.pages.user.form-info')
            @include('admin.pages.user.form-change-password')
        </div>
    @else
        @include('admin.pages.user.form-add')
    @endif

@endsection

