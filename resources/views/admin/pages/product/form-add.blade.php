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
            </div>
            <!-- end x Content -->
        </div>
    </div>
</div>
<!-- /page content -->
@endsection


{{--  @section('after_script')  --}}
@section('script')
    <script>
    $(document).ready(function() {

        //Dropzone.autoDiscover = false Ngăn Dropzone tự động tìm kiếm các form với class "dropzone". Dùng cho trường hợp tạo dropzone cho thẻ div thay vì form
        Dropzone.autoDiscover = false;

        var myDropzone = new Dropzone("div#mydropzone", {
            url: "{{route($controllerName.'/save')}}",
            dictDefaultMessage: "Kéo thả hình ảnh vào để tải lên",
            dictRemoveFile: "Xóa",
            acceptedFiles: ".jpeg,.jpg,.png,.gif",
            addRemoveLinks: true
        });

    });
    </script>
@endsection

