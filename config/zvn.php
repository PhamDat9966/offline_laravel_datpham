<?php

return [
    'url'       =>[
        'prefix_admin'      =>'admin69',
        'prefix_news'       =>'news69',
        'prefix_bookstore'  =>'bookstore'
    ],
    'format'    =>[
        'short_time'        =>'d/m/Y',
        'long_time'         =>'H:m:s d/m/Y'
    ],
    'template'  =>[

        'form_label'=>[
            'class'         => 'control-label col-md-3 col-sm-3 col-xs-12',
        ],
        'form_input'=>[
            'class'         => 'form-control col-md-6 col-xs-12',
        ],

        'status'=>[
            'all'           =>  ['name'=>'Tất cả',          'class'=>'btn-info'],
            'active'        =>  ['name'=>'Kích hoạt',       'class'=>'btn-info'],
            'inactive'      =>  ['name'=>'Chưa kích hoạt',  'class'=>'btn-info'],
            'block'         =>  ['name'=>'Bị khóa',         'class'=>'btn-info'],
            'default'       =>  ['name'=>'Chưa xác định',   'class'=>'btn-info']
        ],
        'is_home'=>[
            1               =>  ['name'=>'Hiển thị',          'class'=>'btn-primary'],
            0               =>  ['name'=>'Không hiển thị',    'class'=>'btn-warning'],
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
        ]
    ],
    'config'    =>[
        'search'    =>[
            'default'   =>  ['all','id','fullname'],
            'slider'    =>  ['all','id','name','description','link'],
            'category'    =>  ['all','id','name']
        ],
        'button'    =>[
            'default'   =>  ['edit','delete'],
            'slider'    =>  ['edit','delete','info'],
            'category'  =>  ['edit','delete']
        ]
    ]
];
