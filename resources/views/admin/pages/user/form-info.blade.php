@php
    use App\Helpers\template as Template;
    use App\Helpers\Form as FormTemplate;

    $id             = (isset($item['id']))? $item['id'] : '';
    $username       = (isset($item['username']))? $item->username : '';
    $fullname       = (isset($item['fullname']))? $item->fullname : '';
    $email          = (isset($item['email']))? $item->email : '';
    $level          = (isset($item['level']))? $item->level : '';
    $status         = (isset($item['status']))? $item->status : '';
    $avatar         = (isset($item['avatar']))? $item->avatar : '';

    $formlabelAttr     = Config::get('zvn.template.form_label');
    $formInputAttr     = Config::get('zvn.template.form_input');
    $inputHiddenID     = Form::hidden('id' , $id);
    $inputHiddenThumb  = Form::hidden('avatar_current', $avatar );
    $inputHiddenTask   = Form::hidden('task', 'edit' );

    $statusValue        = [
                                'default'    => Config::get('zvn.template.status.all.name'),
                                'active'     => Config::get('zvn.template.status.active.name'),
                                'inactive'   => Config::get('zvn.template.status.inactive.name')
                          ];
    $levelValue        = [
                                'default'    => 'Select level',
                                'admin'      => Config::get('zvn.template.level.admin.name'),
                                'member'     => Config::get('zvn.template.level.member.name')
                        ];

    // Dồn các thẻ thành 1 mảng, chuyển các class lặp lại vào zvn.php rồi dùng config::get để lấy ra
    $elements   = [
        [
            'label'     =>  Form::label('username', 'Username', $formlabelAttr),
            'element'   =>  Form::text('username', $username,   $formInputAttr)  // Với collective trong mảng này chính là các thuộc..
                                                                                                    // ..tính như class, id , name của thẻ input
        ],
        [
            'label'     =>  Form::label('fullname', 'Fullname',$formlabelAttr),
            'element'   =>  Form::text('fullname', $fullname ,  $formInputAttr)
        ],
        [
            'label'     =>  Form::label('email', 'Email',$formlabelAttr),
            'element'   =>  Form::text('email', $email , $formInputAttr)
        ],
        [
            'label'     =>  Form::label('level', 'Level', $formlabelAttr),
            'element'   =>  Form::select('level', $levelValue, $level, $formInputAttr)
        ],
        [
            'label'     =>  Form::label('status', 'Status', $formlabelAttr),
            'element'   =>  Form::select('status', $statusValue, $status, $formInputAttr)
            //Chú thích form::select(name,array Input for select, giá trị select ban đầu mặc định là default nếu rỗng, class)
        ],
        [
            'label'     =>  Form::label('avatar', 'Avatar', $formlabelAttr),
            'element'   =>  Form::file('avatar',  $formInputAttr),
            'type'      =>  'thumb',
            'thumb'     =>  (!empty($item['id'])) ? Template::showItemThumb($controllerName, $avatar , $username) : ''
        ],
        [
            'element'   =>  $inputHiddenID . $inputHiddenThumb . $inputHiddenTask . Form::submit('Save',['class'=>'btn btn-success']),
            'type'      =>  'btn-submit'
        ]

    ];

@endphp

<!--box-lists-->
<div class="col-md-6 col-sm-12 col-xs-12">
    <div class="x_panel">
        @include('admin.templates.x_title',['title'=>'Form Edit Info'])
        <!-- x Content -->
        <div class="x_content" style="display: block;">
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
