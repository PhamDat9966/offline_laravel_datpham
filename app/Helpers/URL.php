<?php
namespace App\Helpers;
use Illuminate\Support\Str;
class URL{
    public static function linkCategory($id,$name){
        $id   = (int)$id;
        $nameCategory = Str::slug($name);
        $nameCategory = 'category-'.$nameCategory; // Đây là 1 lỗi cực kỳ vớ vẩn, chưa tìm ra được cách giải quyết, tạm thời phải dùng đến kết nối chuỗi 'category-'
        return route('category/index',[
            'category_id'   =>  $id,
            'category_name' =>  $nameCategory

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
