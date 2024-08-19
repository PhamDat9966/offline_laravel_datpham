<?php

$prefixAdmin    = config('zvn.url.prefix_admin'); //admin69

Route::group(['prefix'=>$prefixAdmin,'namespace'=>'Admin','middleware'=>['permission.admin']], function(){

    // ====================== APPOINTMENT ======================
    $prefix         =   'contact';
    $controllerName =   'contact';
    Route::group(['prefix'=>$prefix],function () use($controllerName) {

        $controller =   ucfirst($controllerName) . 'Controller@';
        Route::get('/', [
            'as'    => $controllerName,
            'uses'  => $controller . 'index'
        ]);

    });

});



$prefixNews     = config('zvn.url.prefix_news');
Route::group(['prefix'=>$prefixNews, 'namespace'=>'News'], function(){
    $prefix         =   'lien-he';
    $controllerName =   'contact';
    Route::group(['prefix'=>$prefix],function () use($controllerName) {

        $controller =   ucfirst($controllerName) . 'Controller@';
        Route::get('/', [
            'as'    => $controllerName,
            'uses'  => $controller . 'index'
        ]);
    });
});
