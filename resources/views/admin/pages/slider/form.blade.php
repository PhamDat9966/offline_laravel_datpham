@extends('admin.main')

@php
    use App\Helpers\template as Template;
    use App\Helpers\Form as FormTemplate;

    $id             = (isset($item['id']))? $item['id'] : '';
    $name           = (isset($item['name']))? $item->name : '';
    $description    = (isset($item['description']))? $item->description : '';
    $link           = (isset($item['link']))? $item->link : '';
    $status         = (isset($item['status']))? $item->status : '';
    $thumb          = (isset($item['thumb']))? $item->thumb : '';

    // OR
    // $name           = (isset($item->name))? $item->name : '';
    // $description    = (isset($item->description))? $item->description : '';
    // $link           = (isset($item->link))? $item->link : '';
    // $status         = (isset($item->status))? $item->status : 'null';
    // $thumb          = (isset($item->thumb))? $item->thumb : 'null';

    // Đối tượng Form là của Collective
    // $nameLabel  =   Form::label('name', 'Name', ['class' => 'control-label col-md-3 col-sm-3 col-xs-12']);
    // $nameInput  =   Form::text('name', $name, ['class' => 'form-control col-md-6 col-xs-12','id'=>'name']);

    // $descriptionLabel   =   Form::label('description', 'Description', ['class' => 'control-label col-md-3 col-sm-3 col-xs-12']);
    // $descriptionInput   =   Form::text('description', $description , ['class' => 'form-control col-md-6 col-xs-12','id'=>'description']);

    $formlabelClass     = Config::get('zvn.template.form_label.class');
    $formInputClass     = Config::get('zvn.template.form_input.class');
    $inputHiddenID      = Form::hidden('id' , $id);
    $inputHiddenThumb   = Form::hidden('thumb_current', $thumb );

    $statusValue        = [
                                'default'    => Config::get('zvn.template.status.all.name'),
                                'active'     => Config::get('zvn.template.status.active.name'),
                                'inactive'   => Config::get('zvn.template.status.inactive.name')
                          ];

    // Dồn các thẻ thành 1 mảng, chuyển các class lặp lại vào zvn.php rồi dùng config::get để lấy ra
    $elements   = [
        [
            'label'     =>  Form::label('name', 'Name', ['class' => $formlabelClass]),
            'element'   =>  Form::text('name', $name,   ['class' => $formInputClass,'id'=>'name'])  // Với collective trong mảng này chính là các thuộc..
                                                                                                    // ..tính như class, id , name của thẻ input
        ],
        [
            'label'     =>  Form::label('description', 'Description',   ['class' => $formlabelClass]),
            'element'   =>  Form::text('description', $description ,    ['class' => $formInputClass,'id'=>'name'])
        ],
        [
            'label'     =>  Form::label('link', 'Link',   ['class' => $formlabelClass]),
            'element'   =>  Form::text('link', $link ,    ['class' => $formInputClass,'id'=>'link'])
        ],
        [
            'label'     =>  Form::label('status', 'Status',   ['class' => $formlabelClass]),
            'element'   =>  Form::select('size', $statusValue, $status, ['class' => $formInputClass ])
        ],
                [
            'label'     =>  Form::label('thumb', 'Thumb',   ['class' => $formlabelClass]),
            'element'   =>  Form::file('image', ['class' => $formInputClass, 'id' => 'thumb', 'name'=>'thumb' ]),
            'type'      =>  'thumb',
            'thumb'     =>  (!empty($item['id'])) ? Template::showItemThumb($controllerName, $thumb , $name) : ''
        ],
        [
            'element'   =>  $inputHiddenID . $inputHiddenThumb . Form::submit('Save',['class'=>'btn btn-success']),
            'type'      =>  'btn-submit'
        ]

    ];

@endphp

@section('content')
<!-- page content -->
@include('admin.templates.page_header', ['pageIndex' => false])

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
                    {{-- Gợi ý --}}
                    {{-- <div class="form-group">
                        {!! $nameLabel !!}
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            {!! $nameInput !!}
                        </div>
                    </div>

                    <div class="form-group">
                        {!! $descriptionLabel !!}
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            {!! $descriptionInput !!}
                        </div>
                    </div> --}}

                {!! Form::close() !!}
                {{-- <form method="POST" action="http://proj_news.xyz/admin123/slider/save" accept-charset="UTF-8" enctype="multipart/form-data" class="form-horizontal form-label-left" id="main-form">
                    <input name="_token" type="hidden" value="m4wsEvprE9UQhk4WAexK6Xhg2nGQwWUOPsQAZOQ5">
                    <div class="form-group">
                        <label for="name" class="control-label col-md-3 col-sm-3 col-xs-12">Name</label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input class="form-control col-md-6 col-xs-12" name="name" type="text" value="Ưu đãi học phí" id="name">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="description" class="control-label col-md-3 col-sm-3 col-xs-12">Description</label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input class="form-control col-md-6 col-xs-12" name="description" type="text" value="Tổng hợp các trương trình ưu đãi học phí hàng tuần..." id="description">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="status" class="control-label col-md-3 col-sm-3 col-xs-12">Status</label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <select class="form-control col-md-6 col-xs-12" id="status" name="status">
                                <option value="default">Select status</option>
                                <option value="active" selected="selected">Kích hoạt</option>
                                <option value="inactive">Chưa kích hoạt</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="link" class="control-label col-md-3 col-sm-3 col-xs-12">Link</label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input class="form-control col-md-6 col-xs-12" name="link" type="text" value="https://zendvn.com/uu-dai-hoc-phi-tai-zendvn/" id="link">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="thumb" class="control-label col-md-3 col-sm-3 col-xs-12">Thumb</label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input class="form-control col-md-6 col-xs-12" name="thumb" type="file" id="thumb">
                            <p style="margin-top: 50px;"><img src="http://proj_news.xyz/images/slider/LWi6hINpXz.jpeg" alt="Ưu đãi học phí" class="zvn-thumb"></p>
                        </div>
                    </div>
                    <div class="ln_solid"></div>
                    <div class="form-group">
                        <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                            <input name="id" type="hidden" value="3">
                            <input name="thumb_current" type="hidden" value="LWi6hINpXz.jpeg">
                            <input class="btn btn-success" type="submit" value="Save">
                        </div>
                    </div>
                </form> --}}
            </div>
            <!-- end x Content -->
        </div>
    </div>
</div>

<!-- /page content -->
@endsection

