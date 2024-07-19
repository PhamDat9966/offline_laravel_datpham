@php
    use App\Helpers\template as Template;
    use App\Helpers\Form as FormTemplate;

    $formlabelAttr     = Config::get('zvn.template.form_label');
    $formInputAttr     = Config::get('zvn.template.form_input');
    $formCkeditorAttr  = Config::get('zvn.template.form_ckeditor');

    $id                = (isset($params['id']))? $params['id'] : '';
    $bcc               = (isset($item['bcc']))? $item->bcc : 'email01@gmail,email02@mail.com';
    $inputHiddenID     = Form::hidden('id' , $id);

    $tagsInput = '<input type="text" value="'.$bcc.'" data-role="tagsinput" class="tags">';
    $elements   = [
        [
            'label'     =>  Form::label('bcc','Bcc',$formlabelAttr),
            'element'   =>  $tagsInput
        ],
        [
            'element'   =>  $inputHiddenID . Form::submit('Save',['class'=>'btn btn-success']),
            'type'      =>  'btn-submit'
        ]

    ];

@endphp
<div class="row">
    <div class="col-md-12 col-sm-12 col-xs-12">
        <div class="x_panel">
            <div class="tab-pane fade show active in" id="bcc" role="tabpanel" aria-labelledby="home-tab">
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
            </div>
        </div>
    </div>
</div>
