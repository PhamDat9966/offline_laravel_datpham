<?php

return [
    'url'       =>[
        'prefix_admin'      =>'admin99',
        'prefix_news'       =>'news',
        'prefix_bookstore'  =>'bookstore'
    ],
    'format'    =>[
        'short_time'        =>'d/m/Y',
        'long_time'         =>'H:m:s d/m/Y'
    ],
    'template'  =>[
        'status'            =>[
            'all'           =>  ['name'=>'Tất cả',          'class'=>'btn-danger'],
            'active'        =>  ['name'=>'Kích hoạt',       'class'=>'btn-success'],
            'inactive'      =>  ['name'=>'Chưa kích hoạt',  'class'=>'btn-info']
        ]
    ]
];
