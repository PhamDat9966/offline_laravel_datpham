@extends('admin.main')

@php
    use App\Helpers\template as Template;
    $xhtmlButtonFilter  =   Template::showButtonFilter($controllerName, $itemsStatusCount, $params['filter']['status'], $params['search'], $params);
    $xhtmlAreaSearch    =   Template::showAreaSearch($controllerName, $params['search']);

    $xhtmlCategoryFilter    = Template::showItemCategoryFilter($controllerName, $params['filter']['category'], $categoryList);
    $xhtmlItemTypeFilter    = Template::showItemTypeFilter($controllerName, $params['filter']['type']);
@endphp

@section('content')
<!-- page content -->
@include('admin.templates.page_header', ['pageIndex' => true])

@include('admin.templates.zvn_notily')

<div class="row">
    <div class="col-md-12 col-sm-12 col-xs-12">
        <div class="x_panel">
            @include('admin.templates.x_title',['title'=>'Bộ lọc'])
            <div class="x_content">
                <div class="row">
                    <div class="col-md-4">
                        {!!$xhtmlButtonFilter!!}
                    </div>
                    <div class="col-md-2">
                        {!!$xhtmlCategoryFilter!!}
                    </div>
                    <div class="col-md-2">
                        {!!$xhtmlItemTypeFilter!!}
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
            @include("admin.pages.product.list")
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

