@extends('admin.main')

@php

    use App\Helpers\template as Template;
    use App\Helpers\Form as FormTemplate;

    $id             = (isset($item['id']))? $item['id'] : '';
    $name           = (isset($item['name']))? $item->name : '';

    $formlabelAttr  = Config::get('zvn.template.form_label');
    $formInputAttr  = Config::get('zvn.template.form_input');
    $inputHiddenID  = Form::hidden('id' , $id);

    $roleValue      = [
                        'default'   => 'Chọn vai trò'
                      ];

    foreach($roleList as $role){
        $roleValue[$role['id']] = Config::get('zvn.template.role.'.$role['name'].'.name');
    }

    $permissionValue = [
                            'default'   => 'Chọn quyền'
                        ];

    foreach($permissionList as $permission){
        $permissionValue[$permission['id']] = $permission['name'];
    }

    $elements   = [
        [
            'label'     =>  Form::label('role', 'Role', $formlabelAttr),
            'element'   =>  Form::select('roles_id', $roleValue, 'default', $formInputAttr)
        ],
        [
            'label'     =>  Form::label('permission', 'Permission', $formlabelAttr),
            'element'   =>  Form::select('permission_id', $permissionValue, 'default', $formInputAttr)
        ],
        [
            'element'   =>  $inputHiddenID . Form::submit('Save',['class'=>'btn btn-success']),
            'type'      =>  'btn-submit'
        ]

    ];

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

