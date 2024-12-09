@extends('admin.main')

@php
    use App\Helpers\template as Template;
    use App\Helpers\Form as FormTemplate;

    $request = Request::capture();
    global $host;
    $host = $request->getHost();
    $host = 'http://'.$host;

    $id             = (isset($item['id']))? $item['id'] : '';
    $code           = (isset($item['code']))? $item->code : '';
    $type           = (isset($item['type']))? $item->type : '';
    $value          = (isset($item['value']))? $item->value : '';
    $start_time     = (isset($item['start_time']))? $item->start_time : '';
    $end_time       = (isset($item['end_time']))? $item->end_time : '';
    $start_price    = (isset($item['start_price']))? $item->start_price : '';
    $end_price      = (isset($item['end_price']))? $item->end_price : '';
    $total          = (isset($item['total']))? $item->total : '';
    $total_use      = (isset($item['total_use']))? $item->total_use : '';
    $status         = (isset($item['status']))? $item->status : '';

    $formlabelAttr     = Config::get('zvn.template.form_label');
    $formInputAttr     = Config::get('zvn.template.form_input');

    $statusValue       = [
                                'default'    => Config::get('zvn.template.status.all.name'),
                                'active'     => Config::get('zvn.template.status.active.name'),
                                'inactive'   => Config::get('zvn.template.status.inactive.name')
                          ];

    $inputCode            = '<div class="input-group">
                                <input id="code" class="form-control" type="text" name="code" value="'.$code.'">
                                <span class="input-group-btn">
                                    <a id="btn-genarate-coupon-code" class="btn btn-success">
                                        Tạo lại mã
                                    </a>
                                </span>
                            </div>';

    $typeValue          = [
                                'default'   => 'Chọn hình thức giảm giá',
                                'percent'   => Config::get('zvn.template.type_coupon_discount.percent.name'),
                                'price'     => Config::get('zvn.template.type_coupon_discount.price.name')
                            ];
    $daterange          = '<input class="form-control col-md-6 col-xs-12"
                                 name="daterange"
                                 type="text"
                                 value=""
                                 id="daterange"
                        >';

    $submitButton      = '<input name="id" type="hidden" value="'.$id.'">
                          <input class="btn btn-success" name="taskEditInfo" type="submit" value="Save">';

    // Dồn các thẻ thành 1 mảng, chuyển các class lặp lại vào zvn.php rồi dùng config::get để lấy ra
    $elements   = [
        [
            'label'     =>  Form::label('code', 'Code', $formlabelAttr),
            'element'   =>  $inputCode                            // Với collective trong mảng này chính là các thuộc..
                                                                                                    // ..tính như class, id , name của thẻ input
        ],
        [
            'label'     =>  Form::label('type', 'Loại giảm giá', $formlabelAttr),
            'element'   =>  Form::select('type', $typeValue, $type, $formInputAttr)
        ],
        [
            'label'     =>  Form::label('value', 'Giá trị', $formlabelAttr),
            'element'   =>  Form::number('value', $value,   $formInputAttr)  // Với collective trong mảng này chính là các thuộc..
                                                                                                    // ..tính như class, id , name của thẻ input
        ],
        [
            'label'     =>  Form::label('daterange', 'Thời gian áp dụng', $formlabelAttr),
            'element'   =>  $daterange
        ],
        [
            'label'     =>  Form::label('status', 'Status', $formlabelAttr),
            'element'   =>  Form::select('status', $statusValue, $status, $formInputAttr)
            //Chú thích form::select(name,array Input for select, giá trị select ban đầu mặc định là default nếu rỗng, class)
        ],
        [
            'label'     => Form::label('', '', $formlabelAttr),
            'element'   => $submitButton
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

@section('after_script')
<!-- CSS -->
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
<!-- Moment.js -->
<script src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<!-- Date Range Picker -->
<script src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>

<script>
$(document).ready(function () {
    $('input[name="daterange"]').daterangepicker({
        opens: 'right', // Cửa sổ mở sang bên phải
        locale: {
            format: 'DD/MM/YYYY', // Định dạng ngày tháng
            separator: ' - ', // Dấu phân cách giữa 2 ngày
            applyLabel: 'Áp dụng',
            cancelLabel: 'Hủy',
            fromLabel: 'Từ',
            toLabel: 'Đến',
            daysOfWeek: ['CN', 'T2', 'T3', 'T4', 'T5', 'T6', 'T7'],
            monthNames: [
                'Tháng 1', 'Tháng 2', 'Tháng 3', 'Tháng 4', 'Tháng 5', 'Tháng 6',
                'Tháng 7', 'Tháng 8', 'Tháng 9', 'Tháng 10', 'Tháng 11', 'Tháng 12'
            ],
            firstDay: 1
        },
        startDate: moment().startOf('month'), // Ngày bắt đầu mặc định
        endDate: moment().endOf('month'), // Ngày kết thúc mặc định
    });

    $('#btn-genarate-coupon-code').click(function() {
        // Hàm tạo chuỗi ngẫu nhiên 6 ký tự
        function generateRandomString(length) {
            let characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
            let result = '';
            for (let i = 0; i < length; i++) {
                result += characters.charAt(Math.floor(Math.random() * characters.length));
            }
            return result;
        }

        // Gán chuỗi ngẫu nhiên vào input với ID code
        $('#code').val(generateRandomString(6));
    })
});

</script>
@endsection


