<?php

$prefixAdmin    = config('zvn.url.prefix_admin'); //admin69

Route::group(['prefix'=>$prefixAdmin,'namespace'=>'Admin','middleware'=>['permission.admin']], function(){

    // ====================== DASHBOARD ======================
    $prefix         =   '';
    $controllerName =   'dashboard';
    Route::group(['prefix'=>$prefix],function () use($controllerName) {

        $controller =   ucfirst($controllerName) . 'Controller@';
        Route::get('/', [
            'as'    => $controllerName,
            'uses'  => $controller . 'index'
        ]);

        Route::get('updateDoashboard', [
            'as'    => $controllerName . '/updateDoashboard',
            'uses'  => $controller . 'updateDoashboard'
        ]);

    });

    // ====================== SLIDER ======================
    $prefix         =   'slider';
    $controllerName =   'slider';
    Route::group(['prefix'=>$prefix],function () use($controllerName) {

        $controller =   ucfirst($controllerName) . 'Controller@';
        Route::get('/', [
            'as'    => $controllerName,
            'uses'  => $controller . 'index'
        ]);

        Route::get('form/{id?}', [
            'as'    => $controllerName . '/form',
            'uses'  => $controller . 'form'
        ])->where('id', '[0-9]+');

        Route::get('delete/{id}', [
            'as'    => $controllerName . '/delete',
            'uses'  => $controller . 'delete'
        ])->where('id', '[0-9]+');

        Route::get('change-status-{status}/{id}', [
            'as'    => $controllerName . '/status',
            'uses'  => $controller . 'status'
        ]);

        Route::post('save/{id?}', [
            'as'    => $controllerName . '/save',
            'uses'  => $controller . 'save'
        ]);

    });

    // ====================== CATEGORY ======================
    $prefix         =   'category';
    $controllerName =   'category';
    Route::group(['prefix'=>$prefix],function () use($controllerName) {

        $controller =   ucfirst($controllerName) . 'Controller@';
        Route::get('/', [
            'as'    => $controllerName,
            'uses'  => $controller . 'index'
        ]);

        Route::get('form/{id?}', [
            'as'    => $controllerName . '/form',
            'uses'  => $controller . 'form'
        ])->where('id', '[0-9]+');

        Route::get('delete/{id}', [
            'as'    => $controllerName . '/delete',
            'uses'  => $controller . 'delete'
        ])->where('id', '[0-9]+');

        Route::get('change-status-{status}/{id}', [
            'as'    => $controllerName . '/status',
            'uses'  => $controller . 'status'
        ]);

        Route::get('change-is-home-{isHome}/{id}', [
            'as'    => $controllerName . '/isHome',
            'uses'  => $controller . 'isHome'
        ]);

        Route::get('change-display-{display}/{id}', [
            'as'    => $controllerName . '/display',
            'uses'  => $controller . 'display'
        ]);

        Route::get('change-display-filter-{display}', [
            'as'    => $controllerName . '/displayFilter',
            'uses'  => $controller . 'displayFilter'
        ]);

        Route::get('change-ordering-{ordering}/{id}', [
            'as'    => $controllerName . '/ordering',
            'uses'  => $controller . 'ordering'
        ]);

        Route::post('save/{id?}', [
            'as'    => $controllerName . '/save',
            'uses'  => $controller . 'save'
        ]);

    });

    // ====================== ARTICLE ======================
    $prefix         =   'article';
    $controllerName =   'article';
    Route::group(['prefix'=>$prefix],function () use($controllerName) {

        $controller =   ucfirst($controllerName) . 'Controller@';
        Route::get('/', [
            'as'    => $controllerName,
            'uses'  => $controller . 'index'
        ]);

        Route::get('form/{id?}', [
            'as'    => $controllerName . '/form',
            'uses'  => $controller . 'form'
        ])->where('id', '[0-9]+');

        Route::get('delete/{id}', [
            'as'    => $controllerName . '/delete',
            'uses'  => $controller . 'delete'
        ])->where('id', '[0-9]+');

        Route::get('change-status-{status}/{id}', [
            'as'    => $controllerName . '/status',
            'uses'  => $controller . 'status'
        ]);

        Route::get('change-type-{type}/{id}', [
            'as'    => $controllerName . '/type',
            'uses'  => $controller . 'type'
        ]);

        Route::get('change-is-home-{isHome}/{id}', [
            'as'    => $controllerName . '/isHome',
            'uses'  => $controller . 'isHome'
        ]);

        Route::get('change-display-{display}/{id}', [
            'as'    => $controllerName . '/display',
            'uses'  => $controller . 'display'
        ]);

        Route::get('change-display-filter-{display}', [
            'as'    => $controllerName . '/displayFilter',
            'uses'  => $controller . 'displayFilter'
        ]);

        Route::post('save/{id?}', [
            'as'    => $controllerName . '/save',
            'uses'  => $controller . 'save'
        ]);

    });

    // ====================== SYSTEN ======================
    $prefix         =   'system';
    $controllerName =   'system';
    Route::group(['prefix'=>$prefix],function () use($controllerName) {

        $controller =   ucfirst($controllerName) . 'Controller@';
        Route::get('/', [
            'as'    => $controllerName,
            'uses'  => $controller . 'index'
        ]);

        Route::get('form/{id?}', [
            'as'    => $controllerName . '/form',
            'uses'  => $controller . 'form'
        ])->where('id', '[0-9]+');

        Route::post('save/{id?}', [
            'as'    => $controllerName . '/save',
            'uses'  => $controller . 'save'
        ]);

    });

    // ====================== USER ======================
    $prefix         =   'user';
    $controllerName =   'user';
    Route::group(['prefix'=>$prefix],function () use($controllerName) {

        $controller =   ucfirst($controllerName) . 'Controller@';
        Route::get('/', [
            'as'    => $controllerName,
            'uses'  => $controller . 'index'
        ]);

        Route::get('form/{id?}', [
            'as'    => $controllerName . '/form',
            'uses'  => $controller . 'form'
        ])->where('id', '[0-9]+');

        Route::get('delete/{id}', [
            'as'    => $controllerName . '/delete',
            'uses'  => $controller . 'delete'
        ])->where('id', '[0-9]+');

        Route::get('change-status-{status}/{id}', [
            'as'    => $controllerName . '/status',
            'uses'  => $controller . 'status'
        ]);

        Route::get('change-level-{level}/{id}', [
            'as'    => $controllerName . '/level',
            'uses'  => $controller . 'level'
        ]);

        Route::post('save/{id?}', [
            'as'    => $controllerName . '/save',
            'uses'  => $controller . 'save'
        ]);

        Route::post('change-password', [
            'as'    => $controllerName . '/change-password',
            'uses'  => $controller . 'changePassword'
        ]);

        Route::post('change-level-post', [
            'as'    => $controllerName . '/change-level-post',
            'uses'  => $controller . 'levelPost'
        ]);

    });

    // ====================== MENU ======================
    $prefix         =   'menu';
    $controllerName =   'menu';
    Route::group(['prefix'=>$prefix],function () use($controllerName) {

        $controller =   ucfirst($controllerName) . 'Controller@';
        Route::get('/', [
            'as'    => $controllerName,
            'uses'  => $controller . 'index'
        ]);

        Route::get('form/{id?}', [
            'as'    => $controllerName . '/form',
            'uses'  => $controller . 'form'
        ])->where('id', '[0-9]+');

        Route::get('delete/{id}', [
            'as'    => $controllerName . '/delete',
            'uses'  => $controller . 'delete'
        ])->where('id', '[0-9]+');

        Route::get('change-status-{status}/{id}', [
            'as'    => $controllerName . '/status',
            'uses'  => $controller . 'status'
        ]);

        Route::get('change-ordering-{ordering}/{id}', [
            'as'    => $controllerName . '/ordering',
            'uses'  => $controller . 'ordering'
        ]);

        Route::get('change-type-menu-{type_menu}/{id}', [
            'as'    => $controllerName . '/type_menu',
            'uses'  => $controller . 'typeMenu'
        ]);

        Route::get('change-type-open-{type_open}/{id}', [
            'as'    => $controllerName . '/type_open',
            'uses'  => $controller . 'typeOpen'
        ]);

        Route::get('change-parent-{parent_id}/{id}', [
            'as'    => $controllerName . '/parent_id',
            'uses'  => $controller . 'parentId'
        ]);

        Route::post('save/{id?}', [
            'as'    => $controllerName . '/save',
            'uses'  => $controller . 'save'
        ]);

    });

    // ====================== ChangePassword ======================
    $prefix         =   'changePassword';
    $controllerName =   'changePassword';
    Route::group(['prefix'=>$prefix],function () use($controllerName) {

        $controller =   ucfirst($controllerName) . 'Controller@';

        Route::get('/', [
            'as'    => $controllerName,
            'uses'  => $controller . 'index'
        ]);

        Route::post('save/{id?}', [
            'as'    => $controllerName . '/save',
            'uses'  => $controller . 'save'
        ]);

    });

    // ====================== RSS ======================
    $prefix         =   'rss';
    $controllerName =   'rss';
    Route::group(['prefix'=>$prefix],function () use($controllerName) {

        $controller =   ucfirst($controllerName) . 'Controller@';
        Route::get('/', [
            'as'    => $controllerName,
            'uses'  => $controller . 'index'
        ]);

        Route::get('form/{id?}', [
            'as'    => $controllerName . '/form',
            'uses'  => $controller . 'form'
        ])->where('id', '[0-9]+');

        Route::get('delete/{id}', [
            'as'    => $controllerName . '/delete',
            'uses'  => $controller . 'delete'
        ])->where('id', '[0-9]+');

        Route::get('change-status-{status}/{id}', [
            'as'    => $controllerName . '/status',
            'uses'  => $controller . 'status'
        ]);

        Route::get('change-ordering-{ordering}/{id}', [
            'as'    => $controllerName . '/ordering',
            'uses'  => $controller . 'ordering'
        ]);


        Route::post('save/{id?}', [
            'as'    => $controllerName . '/save',
            'uses'  => $controller . 'save'
        ]);

    });

    // ====================== RSSNEWS ======================
    $prefix         =   'rssnews';
    $controllerName =   'rssnews';
    Route::group(['prefix'=>$prefix],function () use($controllerName) {

        $controller =   ucfirst($controllerName) . 'Controller@';
        Route::get('/', [
            'as'    => $controllerName,
            'uses'  => $controller . 'index'
        ]);

        Route::get('form/{id?}', [
            'as'    => $controllerName . '/form',
            'uses'  => $controller . 'form'
        ])->where('id', '[0-9]+');

        Route::get('delete/{id}', [
            'as'    => $controllerName . '/delete',
            'uses'  => $controller . 'delete'
        ])->where('id', '[0-9]+');

        Route::get('change-status-{status}/{id}', [
            'as'    => $controllerName . '/status',
            'uses'  => $controller . 'status'
        ]);

        Route::get('change-ordering-{ordering}/{id}', [
            'as'    => $controllerName . '/ordering',
            'uses'  => $controller . 'ordering'
        ]);


        Route::post('save/{id?}', [
            'as'    => $controllerName . '/save',
            'uses'  => $controller . 'save'
        ]);

    });

    // ====================== VIEWS DATA ======================
    $prefix         =   'dataViewsArticle';
    $controllerName =   'dataViewsArticle';
    Route::group(['prefix'=>$prefix],function () use($controllerName) {

        $controller =   ucfirst($controllerName) . 'Controller@';
        Route::get('/', [
            'as'    => $controllerName,
            'uses'  => $controller . 'index'
        ]);

        Route::get('change-status-{status}/{id}', [
            'as'    => $controllerName . '/status',
            'uses'  => $controller . 'status'
        ]);

    });
    // ====================== UserAgents ======================
    $prefix         =   'userAgents';
    $controllerName =   'userAgents';
    Route::group(['prefix'=>$prefix],function () use($controllerName) {

        $controller =   ucfirst($controllerName) . 'Controller@';
        Route::get('/', [
            'as'    => $controllerName,
            'uses'  => $controller . 'index'
        ]);

        Route::get('lean', [
            'as'    => $controllerName . '/lean',
            'uses'  => $controller . 'lean'
        ]);

    });

    // ====================== GALLERY ======================
    $prefix         =   'gallery';
    $controllerName =   'gallery';
    Route::group(['prefix'=>$prefix],function () use($controllerName) {

        $controller =   ucfirst($controllerName) . 'Controller@';
        Route::get('/', [
            'as'    => $controllerName,
            'uses'  => $controller . 'index'
        ]);

    });
});

