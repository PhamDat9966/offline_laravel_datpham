@extends('admin.main')

@section('content')
    <!-- page content -->
    @include('admin.templates.page_header', ['pageIndex' => false])

    @include('admin.templates.error')

        {{--  @include('admin.pages.article.form-add')  --}}
    {{--  <div class="row">
        <div class="col-md-12 col-sm-12 col-xs-12">
            <div class="x_content">
                <ul class="nav nav-tabs bar_tabs" role="tablist">
                    <li class="nav-item active">
                        <a class="nav-link active">Tiếng Việt</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link">Englist</a>
                    </li>
                </ul>
                <div class="tab-content">
                    <div class="tab-pane fade active in" role="tabpanel" aria-labelledby="home-tab">
                        <div class="tab-pane fade show active in" id="home" role="tabpanel" aria-labelledby="home-tab">
                            <div class="x_content" style="display: block;">
                                @include('admin.pages.article.form-add-vi')
                            </div>
                        </div>
                    </div>
                </div>
                <div class="tab-content">
                    <div class="tab-pane fade" role="tabpanel" aria-labelledby="home-tab">
                        <div class="tab-pane fade show active in" id="home" role="tabpanel" aria-labelledby="home-tab">
                            <div class="x_content" style="display: block;">
                                @include('admin.pages.article.form-add-en')
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>  --}}

{{--  <div class="row">
    <div class="col-md-12 col-sm-12 col-xs-12">
        <div class="x_content">
            <ul class="nav nav-tabs bar_tabs" id="myTab" role="tablist">
                <li class="nav-item active">
                    <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="false">Profile</a>
                </li>
            </ul>
            <div class="tab-content" id="myTabContent">
                <div class="tab-pane fade show active in" id="home" role="tabpanel" aria-labelledby="home-tab">
                Raw denim you probably havent heard of them jean shorts Austin. Nesciunt tofu stumptown aliqua, retro synth master cleanse. Mustache cliche tempor, williamsburg carles vegan helvetica. Reprehenderit butcher retro keffiyeh dreamcatcher
                    synth. Cosby sweater eu banh mi, qui irure terr.
                </div>
                <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
                    Food truck fixie locavore, accusamus mcsweeneys marfa nulla single-origin coffee squid. Exercitation +1 labore velit, blog sartorial PBR leggings next level wes anderson artisan four loko farm-to-table craft beer twee. Qui photo
                    booth letterpress, commodo enim craft beer mlkshk aliquip
                </div>
            </div>
        </div>
    </div>
</div>  --}}
<div class="row">
    <div class="col-md-12 col-sm-12 col-xs-12">
        <div class="x_content">
            <ul class="nav nav-tabs bar_tabs" id="myTab" role="tablist">
                <li class="nav-item active">
                    <a class="nav-link active" id="formvn-tab" data-toggle="tab" href="#formvn" role="tab" aria-controls="formvn" aria-selected="true">Tiếng Việt</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" id="formen-tab" data-toggle="tab" href="#formen" role="tab" aria-controls="formen" aria-selected="false">English</a>
                </li>
            </ul>
            <div class="tab-content" id="myTabContent">
                <div class="tab-pane fade active in" id="formvn" role="tabpanel" aria-labelledby="formvn-tab">
                    @include('admin.pages.article.form-add-vi')
                </div>
                <div class="tab-pane fade" id="formen" role="tabpanel" aria-labelledby="formen-tab">
                    @include('admin.pages.article.form-add-en')
                </div>
            </div>
            @include('admin.pages.article.form-add-merged')
        </div>
    </div>
</div>

@endsection

@section('after_script')
    {{--  <script src="{{asset('admin/js/ckeditor/ckeditor.js')}}"></script>  --}}
    <script>
        // Khởi tạo CKEditor, tích hợp với Laravel file manager với những input textarea có id = 'ckeditor' hoặc id = 'content'
        {{--  CKEDITOR.replace('ckeditor', {
            filebrowserImageBrowseUrl: '/laravel-filemanager?type=Images',
            filebrowserImageUploadUrl: '/laravel-filemanager/upload?type=Images&_token={{ csrf_token() }}',
            filebrowserBrowseUrl: '/laravel-filemanager?type=Files',
            filebrowserUploadUrl: '/laravel-filemanager/upload?type=Files&_token={{ csrf_token() }}'
        });  --}}
        {{--  CKEDITOR.replace('content', {
            filebrowserImageBrowseUrl: '/laravel-filemanager?type=Images',
            filebrowserImageUploadUrl: '/laravel-filemanager/upload?type=Images&_token={{ csrf_token() }}',
            filebrowserBrowseUrl: '/laravel-filemanager?type=Files',
            filebrowserUploadUrl: '/laravel-filemanager/upload?type=Files&_token={{ csrf_token() }}'
        });  --}}

    </script>
@endsection
