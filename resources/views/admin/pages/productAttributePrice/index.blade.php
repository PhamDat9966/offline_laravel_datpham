@extends('admin.main')

@php
    use App\Helpers\template as Template;
    //dd($colorList);
    $xhtmlAreaSearch            = Template::showAreaSearch($controllerName, $params['search']);
    $xhtmlItemColorFilter       = Template::showItemColorFilter($controllerName, $params['filter']['color'],$colorList);
    $xhtmlItemMaterialFilter    = Template::showItemMaterialFilter($controllerName, $params['filter']['material'],$materialList);
@endphp

@section('content')
<!-- page content -->
@include('admin.templates.page_header', ['pageIndex' => false])

@include('admin.templates.zvn_notily')

<div class="row">
    <div class="col-md-12 col-sm-12 col-xs-12">
        <div class="x_panel">
            @include('admin.templates.x_title',['title'=>'Bộ lọc'])
            <div class="x_content">
                <div class="row">
                    <div class="col-md-3">

                    </div>
                    <div class="col-md-2">
                        {!!$xhtmlItemColorFilter!!}
                    </div>
                    <div class="col-md-2">
                        {!!$xhtmlItemMaterialFilter!!}
                    </div>
                    <div class="col-md-5">
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
            @include("admin.pages.productAttributePrice.list")
            <!--end List-->
        </div>
    </div>
</div>
<!--end-box-lists-->
<!--box-pagination-->
Tạm thời không phân trang ở với tính năng kéo thả
{{--  @if (count($items) > 0)
<div class="row">
    <div class="col-md-12 col-sm-12 col-xs-12">
        <div class="x_panel">
            @include('admin.templates.x_title',['title'=>'Phân trang'])
            @include('admin.templates.pagination')
        </div>
    </div>
</div>
@endif  --}}
<!--end-box-pagination-->
<!-- /page content -->
@endsection

