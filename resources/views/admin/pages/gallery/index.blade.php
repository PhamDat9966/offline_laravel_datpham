@extends('admin.main')

@section('content')
<!-- page content -->
@include('admin.templates.page_header', ['pageIndex' => 'none'])

@include('admin.templates.zvn_notily')

<div class="row">
    <div class="col-md-12 col-sm-12 col-xs-12">
        <iframe src="/laravel-filemanager" style="width: 100%; height: 500px; overflow: hidden; border: none;"></iframe>
    </div>
</div>

<!-- /page content -->
@endsection

