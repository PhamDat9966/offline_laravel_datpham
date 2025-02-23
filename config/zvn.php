<?php

return [
    'url'       =>[
        'prefix_admin'      =>'admin96',
        'prefix_news'       =>'',
        'prefix_bookstore'  =>'bookstore'
    ],
    'format'    =>[
        'short_time'        =>'d/m/Y',
        'long_time'         =>'H:m:s d/m/Y'
    ],
    'path'       =>[
        'gallery'           =>'images/shares'
    ],
    'template'  =>[
        'font_awesome'=>[
            'user'          =>'<i class="fa fa-user"></i>',
            'clock'         =>'<i class="fa fa-clock-o"></i>'
        ],
        'form_label'=>[
            'class'         => 'control-label col-md-3 col-sm-3 col-xs-12',
        ],
        'form_label_02'=>[
            'class'         => 'control-label col-md-2 col-sm-3 col-xs-12',
        ],
        'form_label_edit'=>[
            'class'         => 'control-label col-md-4 col-sm-3 col-xs-12',
        ],
        'form_input'=>[
            'class'         => 'form-control col-md-6 col-xs-12',
        ],
        'form_input_10'=>[
            'class'         => 'form-control col-md-10 col-xs-12',
        ],
        'form_ckeditor'=>[
            'class'         => 'form-control col-md-6 col-xs-12 ckeditor',
        ],
        'form_area'=>[
            'class'         => 'form-control col-md-6 col-xs-12',
        ],
        'status'=>[
            'all'           =>  ['name'=>'Tất cả',          'class'=>'btn-info'],
            'active'        =>  ['name'=>'Kích hoạt',       'class'=>'btn-success'],
            'inactive'      =>  ['name'=>'Chưa kích hoạt',  'class'=>'btn-info'],
            'block'         =>  ['name'=>'Bị khóa',         'class'=>'btn-info'],
            'default'       =>  ['name'=>'Chưa xác định',   'class'=>'btn-info']
        ],
        'statusAppointment'=>[
            'all'           =>  ['name'=>'Tất cả',          'class'=>'btn-info'],
            'active'        =>  ['name'=>'Đã liên hệ',      'class'=>'btn-info'],
            'inactive'      =>  ['name'=>'Chưa liên hệ',    'class'=>'btn-danger'],
            'default'       =>  ['name'=>'Chưa xác định',   'class'=>'btn-info']
        ],
        'contact'=>[
            'active'        =>  ['name'=>'Đã liên hệ',      'class'=>'btn-success'],
            'inactive'      =>  ['name'=>'Chưa liên hệ',    'class'=>'btn-danger'],
            'default'       =>  ['name'=>'Chưa xác định',   'class'=>'btn-info']
        ],
        'is_home'=>[
            1               =>  ['name'=>'Hiển thị',          'class'=>'btn-primary'],
            0               =>  ['name'=>'Không hiển thị',    'class'=>'btn-warning'],
        ],
        'type'=>[
            'feature'       =>  ['name'=>'Nổi bật'],
            'normal'        =>  ['name'=>'Bình thường'],
        ],
        'default'=>[
            'select'            =>  ['name'=>'Hãy chọn trạng thái'],
            'default'           =>  ['name'=>'Mặc định'],
            'normal'            =>  ['name'=>'Bình thường'],
        ],
        'type_filter'=>[
            'all'           =>  ['name'=>'Tất cả'],
            'feature'       =>  ['name'=>'Nổi bật'],
            'normal'        =>  ['name'=>'Bình thường'],
        ],
        'type_coupon_filter'=>[
            'all'           =>  ['name'=>'Tất cả'],
            'percent'       =>  ['name'=>'Lọc theo %'],
            'price'         =>  ['name'=>'Lọc theo giảm giá trực tiếp'],
        ],
        'type_sex'=>[
            'all'           =>  ['name'=>'Giới tính'],
            'nam'           =>  ['name'=>'Nam'],
            'nu'            =>  ['name'=>'Nữ'],
            'other'         =>  ['name'=>'Khác'],
        ],
        'is_home_filter'=>[
            'all'           =>  ['name'=>'Tất cả'],
            1               =>  ['name'=>'Hiển thị'],
            0               =>  ['name'=>'Không hiển thị'],
        ],
        'display_filter'=>[
            'all'           =>  ['name'=>'Tất cả'],
            'list'          =>  ['name'=>'Danh sánh'],
            'grid'          =>  ['name'=>'Lưới'],
        ],
        'display'=>[
            'list'          =>  ['name'=>'Danh sánh'],
            'grid'          =>  ['name'=>'Lưới'],
        ],
        'search'=>[
            'all'           =>  ['name'=>'Search by All'],
            'id'            =>  ['name'=>'Search by ID'],
            'name'          =>  ['name'=>'Search by Name'],
            'username'      =>  ['name'=>'Search by Username'],
            'fullname'      =>  ['name'=>'Search by Fullname'],
            'email'         =>  ['name'=>'Search by Email'],
            'description'   =>  ['name'=>'Search by Description'],
            'link'          =>  ['name'=>'Search by Link'],
            'content'       =>  ['name'=>'Search by Content'],
            'phonenumber'   =>  ['name'=>'Search by Phonenumber'],
            'address'       =>  ['name'=>'Search by Address'],
            'phone'         =>  ['name'=>'Search by Phone'],
            'slug'          =>  ['name'=>'Search by Slug'],
            'code'          =>  ['name'=>'Search by Code'],
            'value'         =>  ['name'=>'Search by Value'],
            'cost'          =>  ['name'=>'Search by Cost'],
            'product_name'  =>  ['name'=>"Search by Product's name"]
        ],
        'button'            =>[
            'edit'      =>  ['class'=>'btn-success',            'title'=>'Edit',    'icon'=>'fa-pencil',    'route-name'=> '/form'],
            'delete'    =>  ['class'=>'btn-danger btn-delete',  'title'=>'Delete',  'icon'=>'fa-trash',     'route-name'=> '/delete'],
            'info'      =>  ['class'=>'btn-info',               'title'=>'View',    'icon'=>'fa-info',      'route-name'=> '/info'],
        ],
        'buttonAppointment' =>[
            'edit'      =>  ['class'=>'btn-success',            'title'=>'Edit',    'icon'=>'fa-pencil',    'route-name'=> '/form'],
            'delete'    =>  ['class'=>'btn-danger btn-delete',  'title'=>'Delete',  'icon'=>'fa-trash',     'route-name'=> '/delete'],
            'info'      =>  ['class'=>'btn-info',               'title'=>'View',    'icon'=>'fa-info',      'route-name'=> '/info'],
        ],
        'level'=>[
            'admin'         =>  ['name'=>'Quản trị hệ thống'],
            'member'        =>  ['name'=>'Người dùng thông thường'],
        ],
        'type_open'=>[
            'current'    => ['name'=>'Mở tại cửa sổ hiện hành'],
            '_new'       => ['name'=>'Mở cửa sổ mới'],
            '_blank'     => ['name'=>'Mở một tab mới']
        ],
        'type_menu'=>[
            'link'              => ['name'=>'Kiểu đường Link'],
            'category_product'  => ['name'=>'Kiểu Category Product'],
            'category_article'  => ['name'=>'Kiểu Category Article']
        ],
        'container'=>[
            'none'          => 'Không chứa container',
            'category'      => 'Category',
            'article'       => 'Article'
        ],
        'sex'=>[
            'nam'           => 'Nam',
            'nu'            => 'Nữ',
            'other'         => 'Khác'
        ],
        'service'=>[
            'science'       => 'Khóa học',
            'book'          => 'Sách',
            'internship'    => 'Thực tập'
        ],
        'type_coupon_discount'=>[
            'percent'       => ['name'=>'Giảm theo %'],
            'price'         => ['name'=>'Giảm trực tiếp']
        ],
    ],
    'config'    =>[
        'search'    =>[
            'default'               =>  ['all','id','fullname'],
            'slider'                =>  ['all','id','name','description','link'],
            'categoryArticle'       =>  ['all','id','name'],
            'categoryProduct'       =>  ['all','id','name'],
            'article'               =>  ['all','name','slug','content'],
            'rss'                   =>  ['all','name','link'],
            'user'                  =>  ['all','username','email','fullname'],
            'phone'                 =>  ['all','phonenumber'],
            'branch'                =>  ['all','name','address'],
            'appointment'           =>  ['all','name','phonenumber','email'],
            'contact'               =>  ['all','name','email','phone'],
            'attribute'             =>  ['all','name'],
            'attributevalue'        =>  ['all','name'],
            'product'               =>  ['all','name','slug'],
            'coupon'                =>  ['all','code','value'],
            'shipping'              =>  ['all','name','cost'],
            'productAttributePrice' =>  ['product_name']
        ],
        'button'    =>[
            'default'           =>  ['edit','delete'],
            'slider'            =>  ['edit','delete'],
            'categoryArticle'   =>  ['edit','delete'],
            'categoryProduct'   =>  ['edit','delete'],
            'article'           =>  ['edit','delete'],
            'product'           =>  ['info','edit','delete'],
            'user'              =>  ['edit','delete'],
            'rss'               =>  ['edit','delete'],
            'rssnews'           =>  ['delete'],
            'menu'              =>  ['edit','delete'],
            'phone'             =>  ['delete'],
            'branch'            =>  ['edit','delete'],
            'appointment'       =>  ['delete'],
            'attribute'         =>  ['edit','delete'],
            'attributevalue'    =>  ['delete'],
            'coupon'            =>  ['edit','delete'],
            'shipping'          =>  ['edit','delete'],
        ],
        'lock'   =>[
            'attribute_main_id'     =>  [1,2,3],
            'prime'                 =>  'founder',
            'founder'               =>  'Người sáng lập'
        ]
    ],
    'youtube_api_key'   => 'AIzaSyBwv99Jc3ed39eSllnB77cZksyN10oZT2M',
];
