<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

Route::get('/about', function () {
    return "About";
});

$prefixAdmin    = config('zvn.url.prefix_admin'); //admin69
$prefixNews     = config('zvn.url.prefix_news'); //news69

Route::group(['prefix'=>$prefixAdmin,'namespace'=>'Admin'], function(){

    // ====================== DASHBOARD ======================
    $prefix         =   'dashboard';
    $controllerName =   'dashboard';
    Route::group(['prefix'=>$prefix],function () use($controllerName) {

        $controller =   ucfirst($controllerName) . 'Controller@';
        Route::get('/', [
            'as'    => $controllerName,
            'uses'  => $controller . 'index'
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

});

// $prefixNews = 'news69'
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
    Route::group(['prefix'=>$prefix],function () use($controllerName) {
        $controller =   ucfirst($controllerName) . 'Controller@';
        Route::get('/{article_name}-{article_id}.php', [
            'as'    => $controllerName . '/index',      // Đây là tên để gọi rounte tại 1 vị trí nào đó trên vỉew
            'uses'  => $controller . 'index'            // Đây là đường dẫn đến controller
        ])->where('article_name', '[a-zA-Z0-9-_]+')
            ->where('article_id', '[0-9]+');

    });

    // ====================== LOGIN ======================
    $prefix         =   '';
    $controllerName =   'auth';
    Route::group(['prefix'=>$prefix],function () use($controllerName) {
        $controller =   ucfirst($controllerName) . 'Controller@';
        Route::get('/login', [
            'as'    => $controllerName . '/login',      // Đây là tên để gọi rounte tại 1 vị trí nào đó trên vỉew
            'uses'  => $controller . 'login'            // Đây là đường dẫn đến controller
        ]);
        Route::get('/postLogin', [
            'as'    => $controllerName . '/postLogin',      // Đây là tên để gọi rounte tại 1 vị trí nào đó trên vỉew
            'uses'  => $controller . 'postLogin'            // Đây là đường dẫn đến controller
        ]);
        Route::get('/logout', [
            'as'    => $controllerName . '/logout',      // Đây là tên để gọi rounte tại 1 vị trí nào đó trên vỉew
            'uses'  => $controller . 'logout'            // Đây là đường dẫn đến controller
        ]);
    });
});
