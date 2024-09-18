
@php
    use App\Helpers\template as Template;
    use App\Helpers\Form as FormTemplate;

    $request = Request::capture();
    global $host;
    $host = $request->getHost();
    $host = 'http://'.$host;

    $id             = (isset($item['id']))? $item['id'] : '';
    $category       = (isset($item['category_id']))? $item->category_id : '';

    $formlabelAttr     = Config::get('zvn.template.form_label');
    $formInputAttr     = Config::get('zvn.template.form_input');
    $formCkeditorAttr  = Config::get('zvn.template.form_ckeditor');
    $inputHiddenID     = Form::hidden('id' , $id);

    $categoryValue  = $itemsCategory;

    // Dồn các thẻ thành 1 mảng, chuyển các class lặp lại vào zvn.php rồi dùng config::get để lấy ra
    $elements   = [
        [
            'label'     =>  Form::label('category', 'Category', $formlabelAttr),
            'element'   =>  Form::select('category_id', $categoryValue, $category, $formInputAttr)
        ],
        [
            'element'   =>  $inputHiddenID . Form::submit('Save',['class'=>'btn btn-success','name'=>'taskChangeCategory']),
            'type'      =>  'btn-submit'
        ]

    ];

@endphp

<!--box-lists-->
<div class="col-md-3 col-sm-12 col-xs-12">
    <div class="x_panel">
        @include('admin.templates.x_title',['title'=>'Category'])
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

                {!! FormTemplate::showArticleInfo($elements)!!}

            {!! Form::close() !!}
        </div>
        <!-- end x Content -->
    </div>
</div>



