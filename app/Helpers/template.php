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

    public static function showButtonFilter($controllerName,$itemsStatusCount,$currentFilterStatus,$paramsSearch,$currentFilterDisplay = null,$currentFilterIsHome = null){
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

                $currentTemplateStatus  = $tmplStatus[$statusValue];
                   //$value['status'] active inactive block
                $link    = route($controllerName) . "?filter_status=" . $statusValue;

                if($paramsSearch['value'] !==''){
                    $link .= '&search_field='.$paramsSearch['field'] . '&search_value=' . $paramsSearch['value'];
                }

                if($currentFilterDisplay !==''){
                    $link .= '&filter_display='. $currentFilterDisplay;
                }
                if($currentFilterIsHome !==''){
                    $link .= '&filter_is_home='. $currentFilterIsHome;
                }

                $class   = ($currentFilterStatus == $statusValue) ? 'btn-danger' : 'btn-primary';
                $xhtml  .= sprintf('<a href="%s" type="button" class="btn %s"> %s <span class="badge bg-white">%s</span></a>',
                                    $link,$class,$currentTemplateStatus['name'],$item['count']
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

    public static function showAreaSearch($controllerName, $paramsSearch){

        $xhtml              = null;
        $tmplField          = Config::get('zvn.template.search');
        // $fieldInController  = [
        //     'default'   =>  ['all','id','fullname'],
        //     'slider'    =>  ['all','id','description']
        // ];

        // echo "<pre>";
        // print_r($paramsSearch);
        // echo "</pre>";

        $fieldInController  = Config::get('zvn.config.search');
        $controllerName     = (array_key_exists($controllerName,$fieldInController)) ? $controllerName : 'default';
        $xhtmlField         = null;

        foreach($fieldInController[$controllerName] as $field){ // all id
            $xhtmlField     .= sprintf('<li><a href="#" class="select-field" data-field="%s">%s</a></li>', $field , $tmplField[$field]['name'] );//Thanh <li></li>
        }

        $searchValue    = $paramsSearch['value'];
        $searchFiel     = ($paramsSearch['field'] !=='') ? $paramsSearch['field'] : 'all';

        //$tmplField[$searchFiel]['name'] là  'Search by All' 'Search by ID'

        $xhtml  .= sprintf('
        <div class="input-group">
            <div class="input-group-btn">
                <button type="button"
                        class="btn btn-default dropdown-toggle btn-active-field"
                        data-toggle="dropdown" aria-expanded="false">
                    %s <span class="caret"></span>
                </button>
                <ul class="dropdown-menu dropdown-menu-right" role="menu">
                    %s
                </ul>
            </div>
            <input type="text" class="form-control" name="search_value" value="%s">
            <input type="hidden" class="form-control" name="search_field" value="%s">
            <span class="input-group-btn">
            <button id="btn-clear-search" type="button" class="btn btn-success"
                    style="margin-right: 0px">Xóa tìm kiếm</button>
            <button id="btn-search" type="button" class="btn btn-primary">Tìm kiếm</button>
            </span>
        </div>', $tmplField[$searchFiel]['name'] ,$xhtmlField , $paramsSearch['value'] ,$searchFiel);

        return $xhtml;
    }

    public static function showItemStatus($controllerName , $id , $status){
        // status       class           name
        // active       btn-success     Kich hoat
        // inactive     btn-info        Chua duoc kich hoat

        $tmplStatus     =   Config::get('zvn.template.status');

        // $statusValue    =  array_key_exists($statusValue,$tmplStatus) ? $statusValue:'default';
        // $currentTemplateStatus  = $tmplStatus[$statusValue];    //$value['status'] active inactive block

        $statusValue    =  array_key_exists($status,$tmplStatus) ? $status:'default';
        $currentStatus  = $tmplStatus[$statusValue];
        $link           = route($controllerName. '/status',['status'=>$status, 'id'=>$id]);
        $xhtml  = sprintf('
            <a href="%s" type="button" class="btn btn-round %s">%s</a>', $link , $currentStatus['class'], $currentStatus['name']);
        return  $xhtml;
    }

    public static function showItemIsHome($controllerName , $id , $isHomeValue){
        $tmplIsHome             = Config::get('zvn.template.is_home');

        $isHomeValue            = array_key_exists($isHomeValue,$tmplIsHome) ? $isHomeValue:true;
        $currentTemplateIsHome  = $tmplIsHome[$isHomeValue];
        $link                   = route( $controllerName. '/isHome',['is_home'=>$isHomeValue, 'id'=>$id]);
        $xhtml  = sprintf('
            <a href="%s" type="button" class="btn btn-round %s">%s</a>', $link , $currentTemplateIsHome['class'], $currentTemplateIsHome['name']);
        return  $xhtml;
    }

    public static function showItemDisplay($controllerName , $id , $displayValue){
        $tmplDisplay    = Config::get('zvn.template.display');

        $link           = route($controllerName. '/display',['display'=>'value_new', 'id'=>$id]);

        $xhtml   =sprintf('<select name="select_change_attr" data-url=%s class="form-control input-sm">',$link);
        foreach($tmplDisplay as $key => $value){
            $xhtmlSelect = '';
            if($key == $displayValue) $xhtmlSelect = 'selected="selected"';
            $xhtml  .=sprintf('<option value="%s" %s>%s</option>', $key , $xhtmlSelect,$value['name']);
        }
        $xhtml  .='</select>';
        return  $xhtml;
    }

    public static function showItemDisplayFilter($controllerName , $displayFilterValue = null){
        $tmplDisplay    = Config::get('zvn.template.display_filter');

        // $link           = route($controllerName. '/displayFilter',['display'=>$isHomeFilterValue]);
        $link           = route($controllerName);

        $xhtml   =sprintf('<select name="select_change_display_filter" data-url=%s class="form-control input-sm">',$link);
        foreach($tmplDisplay as $key => $value){
            $xhtmlSelect = '';
            if($key == $displayFilterValue) $xhtmlSelect = 'selected="selected"';
            $xhtml  .=sprintf('<option value="%s" %s>%s</option>', $key , $xhtmlSelect,$value['name']);
        }
        $xhtml  .='</select>';
        return  $xhtml;
    }

    public static function showItemIsHomeFilter($controllerName , $isHomeFilterValue){
        $tmplDisplay    = Config::get('zvn.template.is_home_filter');

        // $link           = route($controllerName. '/displayFilter',['display'=>$isHomeFilterValue]);
        $link           = route($controllerName);

        $xhtml   =sprintf('<select name="select_change_is_home_filter" data-url=%s class="form-control input-sm">',$link);
        foreach($tmplDisplay as $key => $value){
            $xhtmlSelect = '';
            if(strval($key) == strval($isHomeFilterValue)) $xhtmlSelect = 'selected="selected"';
            $xhtml  .=sprintf('<option value="%s" %s>%s</option>', $key , $xhtmlSelect,$value['name']);
        }
        $xhtml  .='</select>';
        return  $xhtml;
    }


    public static function showItemThumb($controllerName , $thumbName , $thumbAlt){

        $xhtml  = sprintf('
            <p><img src="%s" alt="%s" class="zvn-thumb" /></p>', asset("images/$controllerName/$thumbName"), $thumbAlt);
        return  $xhtml;
    }

    public static function showButtonAction($controllerName, $id){
        $tmplButton     = Config::get('zvn.template.button');

        // $buttonInArea   =   [
        //     'default'   =>  ['edit','delete'],
        //     'slider'    =>  ['edit','delete']
        // ];
        $buttonInArea   = Config::get('zvn.config.button');

        $controllerName = (array_key_exists($controllerName, $buttonInArea)) ? $controllerName : 'default';
        $listButtons    = $buttonInArea[$controllerName];

        $xhtml   ='<div class="zvn-box-btn-filter">';
        foreach($listButtons as $btn){
            $currentButton  = $tmplButton[$btn];
            $link           = route($controllerName . $currentButton['route-name'], ['id'=>$id]);
            $xhtml         .= sprintf('<a href="%s" type="button" class="btn btn-icon %s" data-toggle="tooltip" data-placement="top" data-original-title="%s">
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
