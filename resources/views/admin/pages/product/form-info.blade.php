@extends('admin.main')

@php
    use App\Helpers\template as Template;
    use App\Helpers\Form as FormTemplate;

    //dd($attributesWithValue);

    $request = Request::capture();
    global $host;
    $host = $request->getHost();
    $host = 'http://'.$host;

    $id             = (isset($item['id']))? $item['id'] : '';
    $name           = (isset($item['name']))? $item->name : '';
    $slug           = (isset($item['slug']))? $item->slug : '';
    $status         = (isset($item['status']))? $item->status : '';
    $category       = (isset($item['category_id']))? $item->category_id : '';
    $description    = (isset($item['content']))? $item->description : '';

    $formlabelAttr     = Config::get('zvn.template.form_label');
    $formInputAttr     = Config::get('zvn.template.form_input');
    $formCkeditorAttr  = Config::get('zvn.template.form_ckeditor');
    $inputHiddenID     = Form::hidden('id' , $id);

    $statusValue       = [
                                'default'    => Config::get('zvn.template.status.all.name'),
                                'active'     => Config::get('zvn.template.status.active.name'),
                                'inactive'   => Config::get('zvn.template.status.inactive.name')
                          ];
    $categoryValue  = $itemsCategory;

    $inputNameArticle  = '<input class="form-control col-md-6 col-xs-12"
                                 name="name"
                                 type="text"
                                 value="'.$name.'"
                                 id="name_article"
                                 data-auto-increment="'.$autoIncrement.'"
                          >';

    $elementsAttribute  = [];
    $inputAttributes    = '';

    $i = 0;

    foreach($attributesWithValue as $attribute){

        $elementsAttribute[$i]['label'] = Form::label($attribute['attribute_name'], ucfirst($attribute['attribute_name']), $formlabelAttr);

        $inputAttributes     = '<div class="col-md-12 col-xs-12">';

        foreach($attribute['attribute_values'] as $attributeValues){
            $inputAttributes .= '<div style="position: relative;margin:5px;">';
            $inputAttributes .=     '<div class="checkbox checkbox-wrapper-8" style="position: relative;">';
            $inputAttributes .=         '<input name="attribute_value[]" style="margin-left:0px;margin:0px" class="tgl tgl-skewed"
                                                type="checkbox"
                                                value="'.$attributeValues['value_id'].'$'.$attributeValues['value_name'].'"
                                                id="'.$attributeValues['value_id'].'"
                                        >';

            $inputAttributes .=         '<label class="tgl-btn" data-tg-off="OFF" data-tg-on="ON" for="'.$attributeValues['value_id'].'"></label>';
            $inputAttributes .=     '</div>';
            $inputAttributes .=     '<strong style="margin-left: 2px;margin-top: 2px;">' . $attributeValues['value_name'] . '</strong>';
            $inputAttributes .='</div>';
        }
        $inputAttributes     .= '</div>';

        $elementsAttribute[$i]['element'] = $inputAttributes;

        $i++;
    }

    //Dropzone thumb
    $thumbs = '<input type="file" name="file" style="display: none;">';

    // Dồn các thẻ thành 1 mảng, chuyển các class lặp lại vào zvn.php rồi dùng config::get để lấy ra
    $elements   = [
        [
            'label'     =>  Form::label('name', 'Name', $formlabelAttr),
            'element'   =>  $inputNameArticle                            // Với collective trong mảng này chính là các thuộc..
                                                                                                    // ..tính như class, id , name của thẻ input
        ],
        [
            'label'     =>  Form::label('slug', 'Slug', $formlabelAttr),
            'element'   =>  Form::text('slug', $slug,   $formInputAttr)  // Với collective trong mảng này chính là các thuộc..
                                                                                                    // ..tính như class, id , name của thẻ input
        ],
        [
            'label'     =>  Form::label('description', 'Description',$formlabelAttr),
            'element'   =>  Form::textarea('description', $description, $formInputAttr)
        ],
        [
            'label'     =>  Form::label('thumbs', 'Thumbs',$formlabelAttr),
            'type'      =>  "dropzone"
        ],
        [
            'label'     =>  Form::label('status', 'Status', $formlabelAttr),
            'element'   =>  Form::select('status', $statusValue, $status, $formInputAttr)
            //Chú thích form::select(name,array Input for select, giá trị select ban đầu mặc định là default nếu rỗng, class)
        ],
        [
            'label'     =>  Form::label('category', 'Category', $formlabelAttr),
            'element'   =>  Form::select('category_id', $categoryValue, $category, $formInputAttr)
        ],
        [
            'element'   =>  $inputHiddenID . Form::submit('Save',['class'=>'btn btn-success']),
            'type'      =>  'btn-submit'
        ]

    ];

    // Xác định vị trí muốn chèn (ví dụ chèn vào sau phần tử có khóa 2)
    $position = 3;
    // Tách mảng elements làm 2 phần rồi chèn các phần tử của mảng elementsAttribute vào giữa
    $firstPart = array_slice($elements, 0, $position, true);
    $secondPart = array_slice($elements, $position, null, true);

    // Ghép elementsAttribute vào phần thứ nhất
    $formElements01 = array_merge($firstPart, $elementsAttribute);
    // Nối phần thứ 2 vào phần đã ghép
    $elements   = array_merge($formElements01, $secondPart);

@endphp

@section('content')
<!-- page content -->
@include('admin.templates.page_header', ['pageIndex' => false])

@include('admin.templates.error')

<!--box-lists-->
<div class="row">
    <div class="col-md-12 col-sm-12 col-xs-12">
        <div class="x_panel">
            @include('admin.templates.x_title',['title'=>'Form'])
            <!-- x Content -->
            <div class="x_content" style="display: block;">
                {{-- Thẻ Form::open chính là thẻ form trong html với nhiều thuộc tính hơn, lấy từ đối tượng Collective --}}
                {!! Form::open([
                        'url'               =>  Route($controllerName.'/save'),
                        'method'            =>  'POST',
                        'accept-charset'    =>  'UTF-8',
                        'enctype'           =>  'multipart/form-data',
                        'class'             =>  'form-horizontal form-label-left',
                        'id'                =>  'main-form'
                    ]) !!}

                    {!! FormTemplate::show($elements)!!}

                {!! Form::close() !!}
                {{--  custom file preview dropzone   --}}

                <div id="tpl" style="display: none;">
                    <div class="dz-preview dz-file-preview">
                        <div class="dz-image" style="margin:auto">
                            <img data-dz-thumbnail />
                        </div>
                        <div class="dz-details">
                            <div class="dz-size"><span data-dz-size></span></div>
                            <div class="dz-filename"><span data-dz-name></span></div>
                        </div>
                        <div class="dz-progress"><span class="dz-upload" data-dz-uploadprogress></span></div>
                        <div class="dz-success-mark"><span>✔</span></div>
                        <div class="dz-error-mark"><span>✘</span></div>
                        <div class="dz-error-message"><span data-dz-errormessage></span></div>
                        <div style="margin-top: 5px"  class="input-thumb">
                            <input type="text" placeholder="Alt ảnh" name="thumb[alt][]" class="dz-custom-input">
                        </div>
                    </div>
                </div>

                {{--  End custom file preview dropzone  --}}
            </div>
            <!-- end x Content -->
        </div>
    </div>
</div>
<!-- /page content -->
@endsection

@section('after_script')
    <script src="{{asset('admin/js/ckeditor/ckeditor.js')}}"></script>
    <script>
        // Khởi tạo CKEditor, tích hợp với Laravel file manager
        CKEDITOR.replace('description', {
            filebrowserImageBrowseUrl: '/laravel-filemanager?type=Images',
            filebrowserImageUploadUrl: '/laravel-filemanager/upload?type=Images&_token={{ csrf_token() }}',
            filebrowserBrowseUrl: '/laravel-filemanager?type=Files',
            filebrowserUploadUrl: '/laravel-filemanager/upload?type=Files&_token={{ csrf_token() }}'
        });
    </script>

    <!-- jQuery UI Sortable -->
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css">

    <script>
    $(document).ready(function() {

        Dropzone.autoDiscover = false;
        /*Dropzone.autoDiscover = false Ngăn Dropzone tự động tìm kiếm các form với class "dropzone".
          Dùng cho trường hợp tạo dropzone cho thẻ div thay vì form */
        let uploadedDocumentMap = {};
        let isSubmitting = false;           // Cờ theo dõi trạng thái submit form

        var myDropzone = new Dropzone("div#mydropzone", {
            url: "{{route($controllerName.'/media')}}",
            dictDefaultMessage: "Kéo thả hình ảnh vào để tải lên",
            dictRemoveFile: "Xóa",
            acceptedFiles: ".jpeg,.jpg,.png,.gif",
            addRemoveLinks: true,
            previewTemplate: document.querySelector('#tpl').innerHTML,
            headers: {
                'X-CSRF-TOKEN': "{{ csrf_token() }}"
            },

            init: function () {

                const dropzoneInstance = this;
                const uploadedFiles = {}; // Đối tượng lưu trữ các file đã tải lên

                // Khởi tạo Sortable trên khu vực preview của Dropzone
                $("#mydropzone").sortable({
                    items: ".dz-preview", // Chỉ sắp xếp các file preview
                    cursor: "move",
                    opacity: 0.7,
                    update: function (event, ui) {
                        const sortedPreviews = $(this).sortable("toArray");
                        console.log("Thứ tự mới:", sortedPreviews);
                    }
                });

                // Lắng nghe sự kiện thêm file để cập nhật Sortable
                this.on("addedfile", function (file) {
                    $("#mydropzone").sortable("refresh"); // Làm mới Sortable sau khi thêm file
                });

                // Khi upload thành công, nhận phản hồi từ server
                this.on("success", function (file, response) {
                    isSubmitting = true; // Đặt cờ, nhằm ngăn chặn sự kiện `beforeunload` clear file temp

                    if (response.name) {
                        uploadedFiles[file.upload.uuid] = response.name; // Lưu bằng UUID của file
                        console.log("Tệp đã tải lên:",  uploadedFiles[file.upload.uuid]);
                    }

                    // Gắn hidden input chứa thông tin file đã upload
                    $(file.previewElement)
                        .find('.input-thumb')
                        .append(`<input type="hidden" name="thumb[name][]" value="${response.name}">`);

                    // Lưu thông tin file đã upload vào biến
                    uploadedDocumentMap[file.name] = response.name;
                });

                // Sự kiện khi nhấn nút "Xóa"
                this.on("removedfile", function (file) {

                    const serverFileName = uploadedFiles[file.upload.uuid]; // Lấy tên file từ đối tượng

                    if (serverFileName) {

                        console.log("File server name:", serverFileName);

                        // Gửi yêu cầu xóa file đến server
                        $.ajax({
                            url:"{{route($controllerName.'/deleteMedia')}}",
                            method: "POST",
                            data: {
                                _token: "{{ csrf_token() }}",
                                fileName: serverFileName
                            },
                            success: function (response) {
                                console.log("File đã được xóa:", response);
                            },
                            error: function (xhr) {
                                console.error("Lỗi khi xóa file:", xhr.responseText);
                            }
                        });
                    } else {
                        console.warn("Không tìm thấy tên file trên server.");
                    }
                });

            }

            {{--  success: function(file, response){
                $(file, previewElement)
                    .find('.input-thumb')
                    .append('<input type="hidden" name="[name][]" value="${response.name}">');
                uploadedDocumentMap[file.name] = response.name;
            },
            removedfile: function (file){
                file.previewElement.remove();
                var name = '';
                if(typeof file.nam !== 'undefined') {

                } else {
                    name = uploadedDocumentMap[file.name]
                }
            },
            error: function (file, response){
                return false;
            }  --}}

        });

    });

    /*  Cleanup file ảnh qua Sự Kiện Form (f5 hoặc refresh)
        Sự kiện được kích hoạt khi trang được tải lại (refresh/F5) hoặc khi người dùng thoát khỏi form hoặc không submit*/
    window.addEventListener("beforeunload", function (e) {

        if (isSubmitting) {
            // Nếu đang submit form, không kích hoạt xóa file tạm
            return;
        }

        // Gửi yêu cầu AJAX để xóa file tạm
        $.ajax({
            url: "{{route($controllerName.'/cleanupTemporaryFiles')}}",
            method: "POST",
            data: {
                _token: "{{ csrf_token() }}" // CSRF Token
            },
            success: function (response) {
                console.log("Đã dọn dẹp file tạm:", response);
            },
            error: function (xhr) {
                console.error("Lỗi khi dọn dẹp file tạm:", xhr.responseText);
            }
        });
    });

    </script>

@endsection


