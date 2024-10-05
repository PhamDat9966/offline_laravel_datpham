@extends('admin.main')

@section('content')
    <!-- page content -->
    @include('admin.templates.page_header', ['pageIndex' => false])

    @include('admin.templates.error')

    @if (isset($item['id']))
        <div class="row">
            @include('admin.pages.article.form-info')
            @include('admin.pages.article.form-change-category')
        </div>
    @else
        @include('admin.pages.article.form-add')
    @endif
@endsection

@section('script')
    <!-- Đưa mã nguồn CKEditor vào -->
    <script src="{{asset('admin/js/ckeditor/ckeditor.js')}}"></script>
    <script>
        // Khởi tạo CKEditor, tích hợp với Laravel file manager
        CKEDITOR.replace('content', {
            filebrowserImageBrowseUrl: '/laravel-filemanager?type=Images',
            filebrowserImageUploadUrl: '/laravel-filemanager/upload?type=Images&_token={{ csrf_token() }}',
            filebrowserBrowseUrl: '/laravel-filemanager?type=Files',
            filebrowserUploadUrl: '/laravel-filemanager/upload?type=Files&_token={{ csrf_token() }}'
        });
    </script>
@endsection
