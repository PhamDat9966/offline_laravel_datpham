<?php
namespace App\Helpers;
use Illuminate\Support\Str;
class URL{
    public static function linkCategory($id,$name){
        $name = Str::slug($name);
        return route('category/index',[
            'category_id'   =>  $id ,
            'category_name' =>  $name
        ]);
    }

    public static function linkArticle($id,$name){
        $name = Str::slug($name);
        return route('article/index',[
            'article_id'   =>  $id ,
            'article_name' =>  $name
        ]);
    }
}
