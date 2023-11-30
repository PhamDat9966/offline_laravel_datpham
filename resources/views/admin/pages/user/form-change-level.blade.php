@php
    use App\Helpers\template as Template;
    use App\Helpers\Form as FormTemplate;

    $id             = (isset($item['id']))? $item['id'] : '';
    $level          = (isset($item['level']))? $item->level : '';

    $formlabelAttr     = Config::get('zvn.template.form_label_edit');
    $formInputAttr     = Config::get('zvn.template.form_input');
    $inputHiddenID     = Form::hidden('id' , $id);

    $inputHiddenTask   = Form::hidden('task', 'change-level' );

    $levelValue        = [
                                'default'    => 'Select level',
                                'admin'      => Config::get('zvn.template.level.admin.name'),
                                'member'     => Config::get('zvn.template.level.member.name')
                        ];

    // Dồn các thẻ thành 1 mảng, chuyển các class lặp lại vào zvn.php rồi dùng config::get để lấy ra
    $elements   = [
        [
            'label'     =>  Form::label('level', 'Level', $formlabelAttr),
            'element'   =>  Form::select('level', $levelValue, $level, $formInputAttr)
        ],
        [
            'element'   =>  $inputHiddenID . $inputHiddenTask . Form::submit('Save',['class'=>'btn btn-success']),
            'type'      =>  'btn-submit-edit'
        ]
    ];

@endphp
<div class="col-md-6 col-sm-12 col-xs-12">
    <div class="x_panel">
        @include('admin.templates.x_title',['title'=>'Quyền Truy Cập'])
        <!-- x Content -->
        <div class="x_content" style="display: block;">
            {!! Form::open([
                    'url'               =>  Route($controllerName.'/change-level-post'),
                    'method'            =>  'POST',
                    'accept-charset'    =>  'UTF-8',
                    'enctype'           =>  'multipart/form-data',
                    'class'             =>  'form-horizontal form-label-left',
                    'id'                =>  'main-form'
                ]) !!}
            {!! FormTemplate::show($elements)!!}
        </div>
        <!-- end x Content -->
    </div>
</div>

