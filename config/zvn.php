<?php

return [
    'url'       =>[
        'prefix_admin'      =>'admin69',
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
        'form_label_edit'=>[
            'class'         => 'control-label col-md-4 col-sm-3 col-xs-12',
        ],
        'form_input'=>[
            'class'         => 'form-control col-md-6 col-xs-12',
        ],
        'form_ckeditor'=>[
            'class'         => 'form-control col-md-6 col-xs-12 ckeditor',
        ],
        'status'=>[
            'all'           =>  ['name'=>'Tất cả',          'class'=>'btn-info'],
            'active'        =>  ['name'=>'Kích hoạt',       'class'=>'btn-success'],
            'inactive'      =>  ['name'=>'Chưa kích hoạt',  'class'=>'btn-info'],
            'block'         =>  ['name'=>'Bị khóa',         'class'=>'btn-info'],
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
        'type_filter'=>[
            'all'           =>  ['name'=>'Tất cả'],
            'feature'       =>  ['name'=>'Nổi bật'],
            'normal'        =>  ['name'=>'Bình thường'],
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
        ],
        'button'            =>[
            'edit'      =>  ['class'=>'btn-success',            'title'=>'Edit',    'icon'=>'fa-pencil',    'route-name'=> '/form'],
            'delete'    =>  ['class'=>'btn-danger btn-delete',  'title'=>'Delete',  'icon'=>'fa-trash',     'route-name'=> '/delete'],
            'info'      =>  ['class'=>'btn-info',               'title'=>'View',    'icon'=>'fa-pencil',    'route-name'=> '/delete'],
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
    ],
    'config'    =>[
        'search'    =>[
            'default'   =>  ['all','id','fullname'],
            'slider'    =>  ['all','id','name','description','link'],
            'category'  =>  ['all','id','name'],
            'article'   =>  ['all','name','content'],
            'rss'       =>  ['all','name','link'],
            'user'      =>  ['all','username','email','fullname']
        ],
        'button'    =>[
            'default'   =>  ['edit','delete'],
            'slider'    =>  ['edit','delete','info'],
            'category'  =>  ['edit','delete'],
            'article'   =>  ['edit','delete'],
            'user'      =>  ['edit','delete'],
            'rss'       =>  ['edit','delete'],
            'menu'      =>  ['edit','delete']
        ]
    ]
];
