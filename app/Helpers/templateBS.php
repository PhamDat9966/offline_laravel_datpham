<?php
namespace App\Helpers;
use Config; // Ở đây nó là một đối tượng

class TemplateBS{

    public static function showItemHistory($by, $time){
        $xhtml  = sprintf('
            <p class="mb-0"><i class="far fa-clock"></i> %s</p>
            <p class="mb-0"><i class="far fa-user"></i> %s</p>', date(Config::get('zvn.format.short_time'),strtotime($time)), $by);
        return  $xhtml;
    }

    public static function showItemStatus($controllerName , $id , $status){
        // status       class           name
        // active       btn-success     Kich hoat
        // inactive     btn-info        Chua duoc kich hoat

        $tmplStatus     =   [
            1       =>  ['name'=>'fa-check',       'class'=>'btn-success'],
            0       =>  ['name'=>'fa-minus',       'class'=>'btn-danger']
        ];

        $currentStatus  = $tmplStatus[$status];
        $link           = route( $controllerName. '/status',['status'=>$status, 'id'=>$id]);

        $xhtml  = sprintf('
            <a href="%s" class="btn %s rounded-circle btn-sm"><i class="fas %s"></i></a>', $link , $currentStatus['class'], $currentStatus['name']);
        return  $xhtml;
    }

}

//<a href="%s" class="btn %s rounded-circle btn-sm"><i class="fas %s"></i></a>
