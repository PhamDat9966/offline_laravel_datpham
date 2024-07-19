@extends('admin.main')

@section('content')
<!-- page content -->
@include('admin.templates.page_header', ['pageIndex' => false])

@include('admin.templates.error')
@php
    $generalClassActive   = '';
    $emailClassActive     = '';
    $socialClassActive    = '';
    $type = (isset($params['type'])) ? $params['type'] : '';
    switch ($type) {
        case 'general':
            $generalClassActive = 'active';
            break;
        case 'email':
            $emailClassActive = 'active';
            break;
        case 'social':
            $socialClassActive = 'active';
            break;
    }
@endphp

<!--box-lists-->

<div class="row">
    <div class="col-md-12 col-sm-12 col-xs-12">
        <div class="x_content">
            <ul class="nav nav-tabs bar_tabs" role="tablist">
                <li class="nav-item {!!$generalClassActive!!}">
                    <a class="nav-link {!!$generalClassActive!!}" href="{!! route('setting',['type'=>'general']) !!}">Cấu hình chung</a>
                </li>
                <li class="nav-item {!!$emailClassActive!!}">
                    <a class="nav-link {!!$emailClassActive!!}" href="{!! route('setting',['type'=>'email']) !!}">Email</a>
                </li>
                <li class="nav-item {!!$socialClassActive!!}">
                    <a class="nav-link {!!$socialClassActive!!}" href="{!! route('setting',['type'=>'social']) !!}">Social</a>
                </li>
            </ul>
            <div class="tab-content">
                <div class="tab-pane fade active in" role="tabpanel" aria-labelledby="home-tab">
                    @switch($type)
                        @case('general')
                            @include('admin.pages.setting.child-index.from-general')
                            @break
                        @case('email')
                            @include('admin.pages.setting.child-index.from-email-account')
                            @include('admin.pages.setting.child-index.from-email-bcc')
                            @break
                        @case('social')
                            @include('admin.pages.setting.child-index.from-social')
                            @break
                        @default
                            @include('admin.pages.setting.child-index.from-general')
                            @break
                    @endswitch
                </div>
            </div>
        </div>
    </div>
</div>

{{-- <div class="row">
    <div class="col-md-12 col-sm-12 col-xs-12">
        <div class="x_content">
            <ul class="nav nav-tabs bar_tabs" id="myTab" role="tablist">
                <li class="nav-item active">
                    <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true" aria-expanded="true">Cấu hình chung</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" id="email-tab" data-toggle="tab" href="#email" role="tab" aria-controls="email" aria-selected="false" aria-expanded="false">Email</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" id="social-tab" data-toggle="tab" href="#social" role="tab" aria-controls="social" aria-selected="false">Social</a>
                </li>
            </ul>
            <div class="tab-content" id="myTabContent">
                <div class="tab-pane fade active in" id="home" role="tabpanel" aria-labelledby="home-tab">
                    @include('admin.pages.setting.child-index.general',['title'=>'Đây là cấu hình chung'])
                </div>

                <div class="tab-pane fade" id="email" role="tabpanel" aria-labelledby="email-tab">
                    @include('admin.pages.setting.child-index.email',['title'=>'Đây là cấu hình chung'])
                </div>
                <div class="tab-pane fade" id="social" role="tabpanel" aria-labelledby="social-tab">
                    @include('admin.pages.setting.child-index.social',['title'=>'Đây là cấu hình chung'])
                </div>

            </div>
        </div>
    </div>
</div> --}}

<!-- /page content -->
@endsection

