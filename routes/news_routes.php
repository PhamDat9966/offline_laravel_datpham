<?php

$prefixNews     = config('zvn.url.prefix_news'); //news69

Route::group(['prefix'=>$prefixNews, 'namespace'=>'News'], function(){

    // ====================== HOME ======================
    $prefix         =   '';
    $controllerName =   'home';
    Route::group(['prefix'=>$prefix],function () use($controllerName) {

        $controller =   ucfirst($controllerName) . 'Controller@';
        Route::get('/', [
            'as'    => $controllerName,
            'uses'  => $controller . 'index'
        ]);

    });

    // ====================== CATEGORY ======================
    $prefix         =   'chuyen-muc';
    $controllerName =   'category';
    Route::group(['prefix'=>$prefix],function () use($controllerName) {
        $controller =   ucfirst($controllerName) . 'Controller@';
        Route::get('/{category_name}-{category_id}.html', [
            'as'    => $controllerName . '/index',      // Đây là tên để gọi rounte tại 1 vị trí nào đó trên vỉew
            'uses'  => $controller . 'index'            // Đây là đường dẫn đến controller
        ])->where('category_name', '[a-zA-Z0-9-_]+')
          ->where('category_id', '[0-9]+');

    });

    // ====================== ARTICLE ======================
    $prefix         =   'bai-viet';
    $controllerName =   'article';
    // Tại đây middleware sẽ ghi lại user-Agent vào csdl để dùng làm dữ liệu để so sánh
    Route::group(['prefix'=>$prefix,'middleware'=>['userAgent.middleware']],function () use($controllerName) {
        $controller =   ucfirst($controllerName) . 'Controller@';
        Route::get('/{article_name}-{article_id}.php', [
            'as'    => $controllerName . '/index',      // Đây là tên để gọi rounte tại 1 vị trí nào đó trên vỉew
            'uses'  => $controller . 'index'            // Đây là đường dẫn đến controller
        ])->where('article_name', '[a-zA-Z0-9-_]+')
            ->where('article_id', '[0-9]+');

    });

    // ====================== NOTIFY ======================
    $prefix         =   '';
    $controllerName =   'notify';
    Route::group(['prefix'=>$prefix],function () use($controllerName) {
        $controller =   ucfirst($controllerName) . 'Controller@';
        Route::get('/no-permission', [
            'as'    => $controllerName . '/noPermission',      // Đây là tên để gọi rounte tại 1 vị trí nào đó trên vỉew
            'uses'  => $controller . 'noPermission'            // Đây là đường dẫn đến controller
        ]);
    });

    // ====================== LOGIN ======================
    $prefix         =   '';
    $controllerName =   'auth';
    Route::group(['prefix'=>$prefix],function () use($controllerName) {
        $controller =   ucfirst($controllerName) . 'Controller@';
        Route::get('/login', [
            'as'    => $controllerName . '/login',      // Đây là tên để gọi rounte tại 1 vị trí nào đó trên vỉew
            'uses'  => $controller . 'login'            // Đây là đường dẫn đến controller
        ])->middleware('check.login');

        Route::post('/postLogin', [
            'as'    => $controllerName . '/postLogin',      // Đây là tên để gọi rounte tại 1 vị trí nào đó trên vỉew
            'uses'  => $controller . 'postLogin'            // Đây là đường dẫn đến controller
        ]);
        Route::get('/logout', [
            'as'    => $controllerName . '/logout',      // Đây là tên để gọi rounte tại 1 vị trí nào đó trên vỉew
            'uses'  => $controller . 'logout'            // Đây là đường dẫn đến controller
        ]);
    });

    // ====================== RSS ======================
    $prefix         =   '';
    $controllerName =   'rss';
    Route::group(['prefix'=>$prefix],function () use($controllerName) {

        $controller =   ucfirst($controllerName) . 'Controller@';
        Route::get('/tin-tuc-tong-hop', [
            'as'    => "$controllerName/index",
            'uses'  => $controller . 'index'
        ]);

        Route::get('/get-gold', [
            'as'    => "$controllerName/get-gold",
            'uses'  => $controller . 'getGold'
        ]);

        Route::get('/get-coin', [
            'as'    => "$controllerName/get-coin",
            'uses'  => $controller . 'getCoin'
        ]);


    });
});
