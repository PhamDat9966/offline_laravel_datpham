@extends('admin.main')

@php
    use App\Helpers\template as Template;
    use App\Helpers\Form as FormTemplate;

    $formlabelAttr     = Config::get('zvn.template.form_label');
    $formInputAttr     = Config::get('zvn.template.form_input');

    $statusValue        = [
                            'default'    => Config::get('zvn.template.status.all.name'),
                            'active'     => Config::get('zvn.template.status.active.name'),
                            'inactive'   => Config::get('zvn.template.status.inactive.name')
                          ];


    $bcc        = (!empty($item->bcc))? $item->bcc : 'email01@gmail,email02@mail.com';
    $tagsInput  = '<input type="text" value="'.$bcc.'" data-role="tagsinput" class="tags" name="bcc">';

    $elements = [];
    $i=0; //phần tử định vị

    foreach ($itemsAttribute as $itemAttribute) {
        //Lấy các name của từng Attributevalue nối vào tags theo attribute_id
        $ids        = '';
        $tags       = '';
        foreach ($itemsAttributevalue as $tagValue) {
            if($tagValue['attribute_id'] == $itemAttribute['id']){
                $ids    .= $tagValue['id'] . ',';
                $tags   .= $tagValue['name'] . ',';
                // $tags   .= $tagValue['id'] .':'. $tagValue['name'] . ',';
            }
        }
        $ids  = rtrim($ids, ",");
        $tags = rtrim($tags, ",");
        /* Ý tưởng: tạo 2 input, một thẻ chứa các tag name của các phần tử, một thẻ chứa các id của phần tử.
            Sau đó dùng jquery để đồng bộ trong tác vụ `xóa tags`: attribute.js */

        // input chứa tập hợp các name dưới dạng tags
        $tagsInput               = '<input type="text" value="'.$tags.'" data-role="tagsinput" class="tags" name="'.$itemAttribute['name'].'">';
        $elements[$i]['label']   = Form::label( $itemAttribute['name'] , ucwords($itemAttribute['name']) , $formlabelAttr );
        $elements[$i]['element'] = $tagsInput;
        // input chứa tập hợp các id tương ứng dưới dạng hidden
        $i=$i+1;
        $iputHiddenIDS           = '<input type="hidden" id="'.$itemAttribute['name'].'_ids" name="'.$itemAttribute['name'].'_ids" value="'.$ids.'">';
        $elements[$i]['label']   = Form::label( $itemAttribute['name'] .'-ids' , ucwords($itemAttribute['name']) .'-ids' , $formlabelAttr );
        $elements[$i]['element'] = $iputHiddenIDS;
        $i++;
    }

    $elements[$i]['element'] = Form::submit('Save',['class'=>'btn btn-success']);
    $elements[$i]['type']    = 'btn-submit';

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
