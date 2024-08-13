<?php
namespace App\Helpers;
use Config; // Ở đây nó là một đối tượng
use Carbon\Carbon;

class Template{

    public static function showItemHistory($by, $time, $filterValue = null){
        $pubDate = Carbon::parse($time);
        $pubDate = $pubDate->toDateString();

        $stringtime = date(Config::get('zvn.format.short_time'),strtotime($time));
        if($filterValue == $pubDate ){
            $stringtime = '<span class="highlight">'. $stringtime .'</span>';
        }

        $xhtml  = sprintf('
            <p><i class="fa fa-user"></i> %s</p>
            <p><i class="fa fa-clock-o"></i> %s</p>', $by,$stringtime);
        return  $xhtml;
    }

    public static function showItemHistoryModified($by, $time, $id, $filterValue = null){
        $pubDate = Carbon::parse($time);
        $pubDate = $pubDate->toDateString();

        $stringtime = date(Config::get('zvn.format.short_time'),strtotime($time));

        if($filterValue == $pubDate ){
            $stringtime = '<span class="highlight">'. $stringtime .'</span>';
        }

        $xhtml  = sprintf('
            <p class="modified-by-'.$id.'"><i class="fa fa-user"></i> %s</p>
            <p class="modified-'.$id.'"><i class="fa fa-clock-o"></i> %s</p>', $by,$stringtime);
        return  $xhtml;
    }

    public static function showButtonFilter($controllerName,$itemsStatusCount,$currentFilterStatus,$paramsSearch,$currentParams = null){

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

                if($paramsSearch['value'] != ''){
                    $link .= '&search_field='.$paramsSearch['field'] . '&search_value=' . $paramsSearch['value'];
                }

                foreach (['display', 'is_home', 'category', 'type','date'] as $filterKey) {
                    if (isset($currentParams['filter'][$filterKey]) && $currentParams['filter'][$filterKey] != '') {
                        $link .= "&filter_$filterKey=" . $currentParams['filter'][$filterKey];
                    }
                }

                // /*category*/
                // if(isset($currentParams['filter']['display'])){
                //     if($currentParams['filter']['display'] != ''){
                //         $link .= '&filter_display='. $currentParams['filter']['display'];
                //     }
                // }
                // if(isset($currentParams['filter']['is_home'])){
                //     if($currentParams['filter']['is_home'] != ''){
                //         $link .= '&filter_is_home='. $currentParams['filter']['is_home'];
                //     }
                // }

                // /*article*/
                // if(isset($currentParams['filter']['category'])){
                //     if($currentParams['filter']['category'] != ''){
                //         $link .= '&filter_category='. $currentParams['filter']['category'];
                //     }
                // }
                // if(isset($currentParams['filter']['type'])){
                //     if($currentParams['filter']['type'] != ''){
                //         $link .= '&filter_type='. $currentParams['filter']['type'];
                //     }
                // }

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

    public static function showAppointmentButtonFilter($controllerName,$itemsStatusCount,$currentFilterStatus,$paramsSearch,$currentParams = null){

        $xhtml          = '';
        $tmplStatus     = Config::get('zvn.template.statusAppointment');

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

                if($paramsSearch['value'] != ''){
                    $link .= '&search_field='.$paramsSearch['field'] . '&search_value=' . $paramsSearch['value'];
                }

                foreach (['display', 'is_home', 'category', 'type','date'] as $filterKey) {
                    if (isset($currentParams['filter'][$filterKey]) && $currentParams['filter'][$filterKey] != '') {
                        $link .= "&filter_$filterKey=" . $currentParams['filter'][$filterKey];
                    }
                }

                $class   = ($currentFilterStatus == $statusValue) ? 'btn-danger' : 'btn-primary';
                $xhtml  .= sprintf('<a href="%s" type="button" class="btn %s"> %s <span class="badge bg-white">%s</span></a>',
                                    $link,$class,$currentTemplateStatus['name'],$item['count']
                                );
            }
        }

        return $xhtml;
    }

    public static function showAreaSearch($controllerName, $paramsSearch){

        $xhtml              = null;
        $tmplField          = Config::get('zvn.template.search');
        $fieldInController  = Config::get('zvn.config.search');
        $controllerName     = (array_key_exists($controllerName,$fieldInController)) ? $controllerName : 'default';
        $xhtmlField         = null;

        foreach($fieldInController[$controllerName] as $field){ // all id
            $xhtmlField     .= sprintf('<li><a href="#" class="select-field" data-field="%s">%s</a></li>', $field , $tmplField[$field]['name'] );//Thanh <li></li>
        }

        $searchValue    = $paramsSearch['value'];
        $searchFiel     = ($paramsSearch['field'] !=='') ? $paramsSearch['field'] : 'all';

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
            <button id="status-%s" data-url="%s" data-class="%s" class="btn btn-round %s status-ajax">%s</button>',$id ,$link ,$currentStatus['class'] ,$currentStatus['class'], $currentStatus['name']);
        // $xhtml  = sprintf('
        //     <a href="%s" type="button" class="btn btn-round %s">%s</a>', $link , $currentStatus['class'], $currentStatus['name']);
        return  $xhtml;
    }

    public static function showItemStatusAppointment($controllerName , $id , $status){
        // status       class           name
        // active       btn-success     Kich hoat
        // inactive     btn-info        Chua duoc kich hoat

        $tmplStatus     =   Config::get('zvn.template.statusAppointment');

        // $statusValue    =  array_key_exists($statusValue,$tmplStatus) ? $statusValue:'default';
        // $currentTemplateStatus  = $tmplStatus[$statusValue];    //$value['status'] active inactive block

        $statusValue    =  array_key_exists($status,$tmplStatus) ? $status:'default';
        $currentStatus  = $tmplStatus[$statusValue];
        $link           = route($controllerName. '/status',['status'=>$status, 'id'=>$id]);

        $xhtml  = sprintf('
            <button id="status-%s" data-url="%s" data-class="%s" class="btn btn-round %s status-ajax">%s</button>',$id ,$link ,$currentStatus['class'] ,$currentStatus['class'], $currentStatus['name']);
        // $xhtml  = sprintf('
        //     <a href="%s" type="button" class="btn btn-round %s">%s</a>', $link , $currentStatus['class'], $currentStatus['name']);
        return  $xhtml;
    }

    public static function showItemContact($controllerName , $id , $status){
        // status       class           name
        // active       btn-success     Kich hoat
        // inactive     btn-info        Chua duoc kich hoat

        $tmplStatus     =   Config::get('zvn.template.contact');

        // $statusValue    =  array_key_exists($statusValue,$tmplStatus) ? $statusValue:'default';
        // $currentTemplateStatus  = $tmplStatus[$statusValue];    //$value['status'] active inactive block

        $statusValue    =  array_key_exists($status,$tmplStatus) ? $status:'default';
        $currentStatus  = $tmplStatus[$statusValue];
        $link           = route($controllerName. '/status',['status'=>$status, 'id'=>$id]);

        $xhtml  = sprintf('
            <button id="status-%s" data-url="%s" data-class="%s" class="btn btn-round %s status-ajax">%s</button>',$id ,$link ,$currentStatus['class'] ,$currentStatus['class'], $currentStatus['name']);
        return  $xhtml;
    }

    public static function showItemSelect($controllerName , $id , $displayValue , $fieldName){

        $tmplDisplay     = Config::get('zvn.template.' . $fieldName);
        $link            = route($controllerName. '/' .$fieldName ,[$fieldName=>'value_new', 'id'=>$id]);

        $xhtml   =sprintf('<select id="select-change-%s" name="select_change_attr_ajax" data-url=%s class="form-control input-sm">',$id,$link);
        foreach($tmplDisplay as $key => $value){
            $xhtmlSelect = '';
            if($key == $displayValue) $xhtmlSelect = 'selected="selected"';
            $xhtml  .=sprintf('<option value="%s" %s>%s</option>', $key , $xhtmlSelect,$value['name']);
        }
        $xhtml  .='</select>';
        return  $xhtml;
    }

    public static function showItemSelectWithArray($controllerName , $id , $displayValue , $fieldName, $array){

        $tmplDisplay     = $array;
        $link            = route($controllerName. '/' .$fieldName ,[$fieldName=>'value_new', 'id'=>$id]);

        $xhtml   =sprintf('<select id="select-change-%s" name="select_change_attr_ajax" data-url=%s class="form-control input-sm">',$id,$link);
        foreach($tmplDisplay as $key => $value){
            $xhtmlSelect = '';
            if($key == $displayValue) $xhtmlSelect = 'selected="selected"';
            $xhtml  .=sprintf('<option value="%s" %s>%s</option>', $key , $xhtmlSelect,$value);
        }
        $xhtml  .='</select>';
        return  $xhtml;
    }

    public static function showItemIsHome($controllerName , $id , $isHomeValue){
        $tmplIsHome             = Config::get('zvn.template.is_home');

        $isHomeValue            = array_key_exists($isHomeValue,$tmplIsHome) ? $isHomeValue:true;
        $currentTemplateIsHome  = $tmplIsHome[$isHomeValue];
        $link                   = route( $controllerName. '/isHome',['isHome'=>$isHomeValue, 'id'=>$id]);
        $xhtml  = sprintf('
            <button id="isHome-%s" data-url="%s" data-class=%s class="btn btn-round %s is-home-ajax">%s</button>',$id ,$link , $currentTemplateIsHome['class'] ,$currentTemplateIsHome['class'], $currentTemplateIsHome['name']);
        return  $xhtml;
    }

    public static function showItemOrdering($controllerName , $orderingValue , $id){

        $link                   = route( $controllerName. '/ordering',['ordering'=>'value_new', 'id'=>$id]);
        $xhtml  = sprintf('
        <input type="number" class="form-control ordering" id="ordering-%s" data-url="%s" min="1" max="999"  value="%s" style="width: 60px">', $id , $link ,$orderingValue);
        return  $xhtml;
    }

    public static function showItemDisplay($controllerName , $id , $displayValue){
        $tmplDisplay    = Config::get('zvn.template.display');

        $link           = route($controllerName. '/display',['display'=>'value_new', 'id'=>$id]);

        $xhtml   =sprintf('<select id="select-change-%s" name="select_change_attr_ajax" data-url=%s class="form-control input-sm">',$id,$link);
        foreach($tmplDisplay as $key => $value){
            $xhtmlSelect = '';
            if($key == $displayValue) $xhtmlSelect = 'selected="selected"';
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

    public static function showAvatar($thumbName , $thumbAlt){

        $xhtml  = sprintf('
                <img src="%s" alt="%s" class="zvn-thumb" />', asset("images/user/$thumbName"), $thumbAlt);
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

    /* Filter Selectbox */
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

    public static function showItemTypeFilter($controllerName , $typeFilterValue){
        $tmplDisplay    = Config::get('zvn.template.type_filter');

        // $link           = route($controllerName. '/displayFilter',['display'=>$isHomeFilterValue]);
        $link           = route($controllerName);

        $xhtml   =sprintf('<select name="select_change_type_filter" data-url=%s class="form-control input-sm">',$link);
        foreach($tmplDisplay as $key => $value){
            $xhtmlSelect = '';
            if(strval($key) == strval($typeFilterValue)) $xhtmlSelect = 'selected="selected"';
            $xhtml  .=sprintf('<option value="%s" %s>%s</option>', $key , $xhtmlSelect,$value['name']);
        }
        $xhtml  .='</select>';
        return  $xhtml;
    }

    public static function showItemCategoryFilter($controllerName , $categoryFilterValue = null, $categoryList = null){
        $tmplCategory   = $categoryList;
        $link           = route($controllerName);

        $xhtml   =sprintf('<select name="select_change_is_category_filter" data-url=%s class="form-control input-sm">',$link);
        foreach($tmplCategory as $key => $value){
            $xhtmlSelect = '';
            if(strval($value['id']) == strval($categoryFilterValue)) $xhtmlSelect = 'selected="selected"';
            $xhtml  .=sprintf('<option value="%s" %s>%s</option>', $value['id'] , $xhtmlSelect , $value['name']);
        }
        $xhtml  .='</select>';
        return  $xhtml;
    }

    public static function showItemSexFilter($controllerName , $typeFilterValue){
        $tmplDisplay    = Config::get('zvn.template.type_sex');

        // $link           = route($controllerName. '/displayFilter',['display'=>$isHomeFilterValue]);
        $link           = route($controllerName);

        $xhtml   =sprintf('<select name="select_change_sex_filter" data-url=%s class="form-control input-sm">',$link);
        foreach($tmplDisplay as $key => $value){
            $xhtmlSelect = '';
            if(strval($key) == strval($typeFilterValue)) $xhtmlSelect = 'selected="selected"';
            $xhtml  .=sprintf('<option value="%s" %s>%s</option>', $key , $xhtmlSelect,$value['name']);
        }
        $xhtml  .='</select>';
        return  $xhtml;
    }

    public static function showItemFilterSimpleFrontend($filterValue, $firstElement){
        // $firstElement có value là rỗng trong select box, nó sẽ ko tham gia vào quá trình gửi dữ liệu với $_GET hoặc $_POST
        $tmpList     = config('zvn.template.'.$filterValue.'');
        $xhtml       ='<select class="form-control" name="'.$filterValue.'">';
        $xhtml      .=   '<option selected value="">'.$firstElement.'</option>';
        foreach ($tmpList as $key=>$value) {
            $xhtml  .=    '<option value="'.$key.'">'.$value.'</option>';
        }
        $xhtml      .= '</select>';
        return $xhtml;
    }

    public static function showItemFilterSimpleFrontendWithArray($arrayList, $filterName ,$firstElement){

        $xhtml        ='<select class="form-control" name="'.$filterName.'">';
        $xhtml       .=   '<option selected value="">'.$firstElement.'</option>';
        foreach ($arrayList as $value) {
            $xhtml   .=    '<option value="'.$value['id'].'">'.$value['address'].'</option>';
        }
        $xhtml       .= '</select>';

        return $xhtml;
    }

    public static function showBranchGoogleMapSelect($controllerName,$arrayList, $name, $itemGooglemap){
        $link         = route($controllerName);
        $xhtml        = sprintf('<select name=%s data-url=%s class="form-control">',$name,$link);

        foreach ($arrayList as $value) {
            if(isset($itemGooglemap) && !empty($itemGooglemap) && ($value['id'] == $itemGooglemap['id'])){
                $xhtml       .=   '<option selected value="">'.$itemGooglemap['address'].'</option>';
            }else{
                $xhtml   .=    '<option value="'.$value['id'].'">'.$value['address'].'</option>';
            }
        }
        $xhtml       .= '</select>';

        return $xhtml;
    }

    public static function showDataFrontEnd($datatime){
        return date_format(date_create($datatime), Config::get('zvn.format.short_time'));
    }

    public static function showContent($content,$lenght,$prefix = '...'){
        $content = str_replace(['<p>','</p>'], '', $content);
        return preg_replace('/\s+?(\S+)?$/','', substr($content,0, $lenght)).$prefix;
    }

    public static function showCreatedFilter($creadedFilter){
        $xhtml  =  '<div class="input-group">
                        <span class="input-group-addon" id="basic-addon1">Created: </span>
                        <input type="text" id="datepicker" name="created" class="form-control" placeholder="Choose a date" value="'.$creadedFilter.'">
                    </div>';
        return $xhtml;
    }

    public static function showModifiedFilter($modifiedFilter){
        $xhtml  =  '<div class="input-group">
                        <span class="input-group-addon" id="basic-addon1">Modified: </span>
                        <input type="text" class="datepicker" name="modified" class="form-control" placeholder="Choose a date" value="'.$modifiedFilter.'">
                    </div>';
        return $xhtml;
    }

    public static function showTimeMeet($timeMeetFilter){
        $xhtml  =  '<div class="input-group">
                        <span class="input-group-addon" id="basic-addon1">TimeMeet: </span>
                        <input type="text" id="datepicker" name="timeMeet" class="form-control" placeholder="Choose a date" value="'.$timeMeetFilter.'">
                    </div>';
        return $xhtml;
    }

    public static function showDateFilter($dateFilter){
        $xhtml = '<div class="input-group">
                    <span class="input-group-addon" id="basic-addon1">Lọc theo ngày-tháng-năm: </span>
                    <input type="text" id="datepicker" name="date" class="form-control" placeholder="Choose a date" value="'.$dateFilter.'">
                 </div>';
       return $xhtml;
    }
}
