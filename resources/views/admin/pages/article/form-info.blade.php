@php
    use App\Helpers\template as Template;
    use App\Helpers\Form as FormTemplate;

    $request = Request::capture();
    global $host;
    $host = $request->getHost();
    $host = 'http://'.$host;

   // dd($item);

    $id             = (isset($item['id']))? $item['id'] : '';
    $name           = (isset($item['name']))? $item->name : '';
    $slug           = (isset($item['slug']))? $item->slug : '';
    $status         = (isset($item['status']))? $item->status : '';
    $content        = (isset($item['content']))? $item->content : '';
    $thumb          = (isset($item['thumb']))? $item->thumb : '';

    $formlabelAttr     = Config::get('zvn.template.form_label_02');
    $formInputAttr     = Config::get('zvn.template.form_input_10');
    $formCkeditorAttr  = Config::get('zvn.template.form_ckeditor');
    $inputHiddenID     = Form::hidden('id' , $id);
    $inputHiddenThumb  = Form::hidden('thumb_current', $thumb );

    $statusValue       = [
                                'default'    => Config::get('zvn.template.status.all.name'),
                                'active'     => Config::get('zvn.template.status.active.name'),
                                'inactive'   => Config::get('zvn.template.status.inactive.name')
                          ];
    $categoryValue  = $itemsCategory;

    $inputNameArticle  = '<input class="form-control col-md-10 col-xs-12"
                                 name="name"
                                 type="text"
                                 value="'.$name.'"
                                 id="name_article"
                                 data-auto-increment="'.$autoIncrement.'"
                          >';

    $submitButton      = '<input name="id" type="hidden" value="'.$id.'">
                          <input name="thumb_current" type="hidden" value="'.$thumb.'">
                          <input class="btn btn-success" name="taskEditInfo" type="submit" value="Save">';

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
            'label'     =>  Form::label('content', 'Content',$formlabelAttr),
            'element'   =>  Form::textarea('content', $content, $formInputAttr)
        ],
        [
            'label'     =>  Form::label('status', 'Status', $formlabelAttr),
            'element'   =>  Form::select('status', $statusValue, $status, $formInputAttr)
            //Chú thích form::select(name,array Input for select, giá trị select ban đầu mặc định là default nếu rỗng, class)
        ],
        [
            'label'     =>  Form::label('thumb', 'Thumb', $formlabelAttr),
            'element'   =>  Form::file('thumb',  $formInputAttr),
            'type'      =>  'thumb',
            'thumb'     =>  (!empty($item['id'])) ? Template::showItemThumb($controllerName, $thumb , $name) : ''
        ],
        [
            'label'     => Form::label('', '', $formlabelAttr),
            'element'   => $submitButton
        ],
        // [
        //     'element'   =>  $inputHiddenID . $inputHiddenThumb . Form::submit('Save',['class'=>'btn btn-success','name'=>'taskEditInfo']),
        //     'type'      =>  'btn-submit'
        // ]
    ];

@endphp

<!--box-lists-->
<div class="col-md-9 col-sm-12 col-xs-12">
    <div class="x_panel">
        @include('admin.templates.x_title',['title'=>'Form Edit Info'])
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

