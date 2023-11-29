@extends('admin.main')
@section('content')
    <!-- page content -->
    @include('admin.templates.page_header', ['pageIndex' => false])
    @include('admin.templates.error')
    <!-- /page content -->
    @if (isset($item['id']))
        @include('admin.pages.user.form-info')
    @else
        @include('admin.pages.user.form-add')
    @endif

@endsection

