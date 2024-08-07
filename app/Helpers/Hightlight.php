<?php
namespace App\Helpers;

class Hightlight{
    public static function show($input , $paramsSearch , $field ){
        //dd($paramsSearch);
        if($paramsSearch['value'] == null) return $input;
        if($paramsSearch['field'] == 'all' || $paramsSearch['field'] == $field ){
            return preg_replace("/" . preg_quote($paramsSearch['value'],"/") . "/i",'<span class="highlight">$0</span>', $input);
        }
        return $input;
    }

    public static function showRSS($input , $paramsSearch ){
        if($paramsSearch == 'null') return $input;
        if($paramsSearch == 'all' || $paramsSearch != null ){
            return preg_replace("/" . preg_quote($paramsSearch,"/") . "/i",'<span class="highlight">$0</span>', $input);
        }
        return $input;
    }
}
