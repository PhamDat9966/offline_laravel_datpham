{{--  @extends('admin.main')  --}}

@php
    use App\Helpers\template as Template;
    use App\Helpers\Form as FormTemplate;
    //dd($itemEn->toArray());

    $request = Request::capture();
    global $host;
    $host = $request->getHost();
    $host = 'http://'.$host;

    $nameEn           = (isset($itemEn['name']))? $itemEn->name : '';
    $slugEn           = (isset($itemEn['slug']))? $itemEn->slug : '';

    $formlabelAttr     = Config::get('zvn.template.form_label');
    $formInputAttr     = Config::get('zvn.template.form_input');
    $formCkeditorAttr  = Config::get('zvn.template.form_ckeditor');

    $inputNameArticleEn  = '<input class="form-control col-md-6 col-xs-12 name_article"
                                 name="name-en"
                                 type="text"
                                 value="' . htmlspecialchars($nameEn, ENT_QUOTES, 'UTF-8') . '"
                                 id="category_article_en"
                                 data-auto-increment="'.$autoIncrement.'"
                          >';
    $inputSlugEn      = '<input  class="form-control col-md-6 col-xs-12"
                                    name="slug-en"
                                    type="text"
                                    id="slug-en"
                                    value="'.$slugEn.'"
                        >';

    // Dồn các thẻ thành 1 mảng, chuyển các class lặp lại vào zvn.php rồi dùng config::get để lấy ra
    $elements   = [
        [
            'label'     =>  Form::label('name', 'Name', $formlabelAttr),
            'element'   =>  $inputNameArticleEn
        ],
        [
            'label'     =>  Form::label('slug', 'Slug', $formlabelAttr),
            'element'   =>  $inputSlugEn
        ]
    ];

@endphp


<div class="tab-pane fade show active in" id="form-en" role="tabpanel" aria-labelledby="home-tab">
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
</div>
