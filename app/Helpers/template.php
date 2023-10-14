<?php
namespace App\Helpers;
use Config; // Ở đây nó là một đối tượng

class Template{

    public static function showItemHistory($by, $time){
        $xhtml  = sprintf('
            <p><i class="fa fa-user"></i> %s</p>
            <p><i class="fa fa-clock-o"></i> %s</p>', date(Config::get('zvn.format.short_time'),strtotime($time)), $by);
        return  $xhtml;
    }

    public static function showButtonFilter($itemsStatusCount){
        $xhtml          = '';
        $tmplStatus     = Config::get('zvn.template.status');

        if(count($itemsStatusCount) > 0){

            array_unshift($itemsStatusCount,[
                'count' =>array_sum(array_column($itemsStatusCount,'count')),
                'status'=>'all'
            ]);

            foreach($itemsStatusCount as $item){
                $statusValue    = $item['status'];
                $statusValue    =  array_key_exists($statusValue,$tmplStatus) ? $statusValue:'default';

                $currentTemplateStatus  = $tmplStatus[$statusValue];    //$value['status'] active inactive block
                $xhtml  .= sprintf('<a href="#" type="button" class="btn %s"> %s <span class="badge bg-white">%s</span></a>',
                                    $currentTemplateStatus['class'],$currentTemplateStatus['name'],$item['count']
                                );
            }
        }

        return $xhtml;
        // <a href="?filter_status=all" type="button"
        //     class="btn btn-primary">
        // All <span class="badge bg-white">4</span>
        // </a>
        // <a href="?filter_status=active"
        //     type="button" class="btn btn-success">
        // Active <span class="badge bg-white">2</span>
        // </a>
        // <a href="?filter_status=inactive"
        //     type="button" class="btn btn-success">
        // Inactive <span class="badge bg-white">2</span>
        // </a>
    }

    public static function showItemStatus($controllerName , $id , $status){
        // status       class           name
        // active       btn-success     Kich hoat
        // inactive     btn-info        Chua duoc kich hoat

        $tmplStatus     =   Config::get('zvn.template.status');
        //$tmplStatus     =   config('zvn.template.status');

        // $statusValue    =  array_key_exists($statusValue,$tmplStatus) ? $statusValue:'default';
        // $currentTemplateStatus  = $tmplStatus[$statusValue];    //$value['status'] active inactive block

        $statusValue    =  array_key_exists($status,$tmplStatus) ? $status:'default';
        $currentStatus  = $tmplStatus[$statusValue];
        $link           = route( $controllerName. '/status',['status'=>$status, 'id'=>$id]);

        $xhtml  = sprintf('
            <a href="%s" type="button" class="btn btn-round %s">%s</a>', $link , $currentStatus['class'], $currentStatus['name']);
        return  $xhtml;
    }

    public static function showItemThumb($controllerName , $thumbName , $thumbAlt){

        $xhtml  = sprintf('
            <p><img src="%s" alt="%s" class="zvn-thumb" /></p>', asset("images/$controllerName/$thumbName"), $thumbAlt);
        return  $xhtml;
    }

    public static function showButtonAction($controllerName, $id){
        $tmplButton = [
            'edit'      =>  ['class'=>'btn-success',            'title'=>'Edit',    'icon'=>'fa-pencil',    'route-name'=> $controllerName . '/form'],
            'delete'    =>  ['class'=>'btn-danger btn-delete',  'title'=>'Delete',  'icon'=>'fa-trash',     'route-name'=> $controllerName . '/delete'],
            'info'      =>  ['class'=>'btn-info',               'title'=>'View',    'icon'=>'fa-pencil',    'route-name'=> $controllerName . '/delete'],
        ];

        $buttonInArea   =   [
            'default'   =>  ['edit','delete'],
            'slider'    =>  ['edit','delete']
        ];

        $controllerName = (array_key_exists($controllerName, $buttonInArea)) ? $controllerName : 'default';
        $listButtons    = $buttonInArea[$controllerName];

        $xhtml   ='<div class="zvn-box-btn-filter">';
        foreach($listButtons as $btn){
            $currentButton  = $tmplButton[$btn];
            //$link           = $currentButton['route-name'];
            $link           = route($currentButton['route-name'], ['id'=>$id]);
            $xhtml  .=sprintf('<a href="%s" type="button" class="btn btn-icon %s" data-toggle="tooltip" data-placement="top" data-original-title="%s">
                                        <i class="fa %s"></i>
                                </a>',$link, $currentButton['class'],$currentButton['title'],$currentButton['icon']);
        }
        $xhtml  .='</div>';
        return  $xhtml;
    }

}

//          class    title   icon    route-name
//edit
//deltet

// <a href="http://proj_news.xyz/admin123/slider/form/3" type="button" class="btn btn-icon btn-success" data-toggle="tooltip" data-placement="top" data-original-title="Edit">
//      <i class="fa fa-pencil"></i>
// </a>
// <a href="http://proj_news.xyz/admin123/slider/delete/3" type="button" class="btn btn-icon btn-danger btn-delete" data-toggle="tooltip" data-placement="top" data-original-title="Delete">
//      <i class="fa fa-trash"></i>
// </a>';

// <a href="http://proj_news.xyz/admin123/slider/form/3" type="button" class="btn btn-icon btn-success" data-toggle="tooltip" data-placement="top" data-original-title="Edit">
//     <i class="fa fa-pencil"></i>
// </a>

// <a href="http://proj_news.xyz/admin123/slider/delete/3" type="button" class="btn btn-icon btn-danger btn-delete" data-toggle="tooltip" data-placement="top" data-original-title="Delete">
//     <i class="fa fa-trash"></i>
// </a>
