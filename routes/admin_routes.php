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

    // ====================== CATEGORY ARTICLE ======================
    $prefix         =   'categoryArticle';
    $controllerName =   'categoryArticle';
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

        Route::get('move-{type}/{id}' , $controller . 'move')->name("$controllerName/move")->where('id','[0-9]+');

        // Route::get('move-{type}/{id}', [
        //     'as'    => $controllerName . '/move',
        //     'uses'  => $controller . 'move'
        // ])->where('id','[0-9]+');

    });

    // ====================== CATEGORY PRODUCT======================
    $prefix         =   'categoryProduct';
    $controllerName =   'categoryProduct';
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

        Route::get('move-{type}/{id}' , $controller . 'move')->name("$controllerName/move")->where('id','[0-9]+');

        // Route::get('move-{type}/{id}', [
        //     'as'    => $controllerName . '/move',
        //     'uses'  => $controller . 'move'
        // ])->where('id','[0-9]+');

    });

        // ====================== CATEGORY PRODUCT======================
    $prefix         =   'categoryProduct';
    $controllerName =   'categoryProduct';
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

        Route::get('move-{type}/{id}' , $controller . 'move')->name("$controllerName/move")->where('id','[0-9]+');

        // Route::get('move-{type}/{id}', [
        //     'as'    => $controllerName . '/move',
        //     'uses'  => $controller . 'move'
        // ])->where('id','[0-9]+');

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

        Route::get('change-category-{category_id}/{id}', [
            'as'    => $controllerName . '/change-category',
            'uses'  => $controller . 'changeCategory'
        ]);

    });

    // ====================== PRODUCT ======================
    $prefix         =   'product';
    $controllerName =   'product';
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

        Route::post('media/{id?}', [
            'as'    => $controllerName . '/media',
            'uses'  => $controller . 'media'
        ]);

        Route::get('change-category-{category_product_id}/{id}', [
            'as'    => $controllerName . '/change-category',
            'uses'  => $controller . 'changeCategory'
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

    // ====================== Phone contact ======================
    $prefix         =   'phone';
    $controllerName =   'phone';
    Route::group(['prefix'=>$prefix],function () use($controllerName) {

        $controller =   ucfirst($controllerName) . 'Controller@';
        Route::get('/', [
            'as'    => $controllerName,
            'uses'  => $controller . 'index'
        ]);

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

    // ====================== SETTING ======================
    $prefix         =   'setting';
    $controllerName =   'setting';
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

        Route::post('saveGeneral/{id?}', [
            'as'    => $controllerName . '/saveGeneral',
            'uses'  => $controller . 'saveGeneral'
        ]);

        Route::post('saveEmail/{id?}', [
            'as'    => $controllerName . '/saveEmail',
            'uses'  => $controller . 'saveEmail'
        ]);


        Route::post('saveSocial/{id?}', [
            'as'    => $controllerName . '/saveSocial',
            'uses'  => $controller . 'saveSocial'
        ]);
    });

    // ====================== Branch ======================
    $prefix         =   'branch';
    $controllerName =   'branch';
    Route::group(['prefix'=>$prefix],function () use($controllerName) {

        $controller =   ucfirst($controllerName) . 'Controller@';
        Route::get('/', [
            'as'    => $controllerName,
            'uses'  => $controller . 'index'
        ]);

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

        Route::get('form/{id?}', [
            'as'    => $controllerName . '/form',
            'uses'  => $controller . 'form'
        ])->where('id', '[0-9]+');
    });

    // ====================== APPOINTMENT ======================
    $prefix         =   'appointment';
    $controllerName =   'appointment';
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
            'as'    => 'admin/'. $controllerName . '/save',
            'uses'  => $controller . 'save'
        ]);

    });

    // ====================== CONTACT ======================
    $prefix         =   'contact';
    $controllerName =   'contact';
    Route::group(['prefix'=>$prefix],function () use($controllerName) {

        $controller =   ucfirst($controllerName) . 'Controller@';
        Route::get('/', [
            'as'    => 'admin.' . $controllerName,
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
            'as'    => 'admin/'. $controllerName . '/save',
            'uses'  => $controller . 'save'
        ]);

    });

    // ====================== LOGVIEWER ======================
    $prefix = 'logs';
    Route::group(['prefix' => $prefix], function () {
        Route::get('/', [
            'as' => 'admin.logs.index', // Đặt tên cho route
            'uses' => function () {
                return view('admin.pages.logs.index');
            }
        ]);
    });

    // ====================== ATTRIBUTE ======================
    $prefix         =   'attribute';
    $controllerName =   'attribute';
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

        Route::get('change-category-{category_id}/{id}', [
            'as'    => $controllerName . '/change-category',
            'uses'  => $controller . 'changeCategory'
        ]);

    });

    // ====================== ATTRIBUTE VALUE======================
    $prefix         =   'attributevalue';
    $controllerName =   'attributevalue';
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

        Route::get('change-category-{category_id}/{id}', [
            'as'    => $controllerName . '/change-category',
            'uses'  => $controller . 'changeCategory'
        ]);

    });


});

