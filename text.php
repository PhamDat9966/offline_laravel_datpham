<?php

$prefixNews     = config('zvn.url.prefix_news'); //news69

Route::group(['prefix'=>$prefixNews, 'namespace'=>'News'], function(){

    $prefix         =   'lien-he';
    $controllerName =   'contact';
    Route::group(['prefix'=>$prefix],function () use($controllerName) {

        $controller =   ucfirst($controllerName) . 'Controller@';
        Route::get('/', [
            'as'    => $controllerName,
            'uses'  => $controller . 'index'
        ]);

        Route::post('postContact/{id?}', [
            'as'    => $controllerName . '/postContact',
            'uses'  => $controller . 'postContact'
        ]);


    });

});
