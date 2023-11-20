<?php
$prefixNews     = 'news69';
Route::group(['prefix'=>$prefixNews, 'namespace'=>'News'], function(){

    $prefix         =   'chuyen-muc';
    $controllerName =   'category';
    Route::group(['prefix'=>$prefix],function () use($controllerName) {
        $controller =   ucfirst($controllerName) . 'Controller@';
        Route::get('/{category_name}-{category_id}.html', [
            'as'    => $controllerName . '/index',
            'uses'  => $controller . 'index'
        ])->where('category_name', '[a-zA-Z0-9-_]+')
          ->where('category_id', '[0-9]+');

    });

});
