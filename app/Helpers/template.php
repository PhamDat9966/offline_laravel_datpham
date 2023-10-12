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

    public static function showItemStatus($controllerName , $id , $status){
        // status       class           name
        // active       btn-success     Kich hoat
        // inactive     btn-info        Chua duoc kich hoat

        $tmplStatus     =   [
            'active'    =>  ['name'=>'Kích hoạt',       'class'=>'btn-success'],
            'inactive'  =>  ['name'=>'Chưa kích hoạt',  'class'=>'btn-info']
        ];

        $currentStatus  = $tmplStatus[$status];
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
