@extends('admin.main')

@php


@endphp

@section('content')
<!-- page content -->
@include('admin.templates.page_header', ['pageIndex' => false])

@include('admin.templates.error')
    <!-- /page content -->
    @if (isset($item['id']))
        <div class="row">
            @include('admin.pages.article.form-info')
            @include('admin.pages.article.form-change-category')
        </div>
    @else
        @include('admin.pages.article.form-add')
    @endif

@endsection

