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

$prefixAdmin    = config('zvn.url.prefix_admin'); //admin99

Route::group(['prefix'=>$prefixAdmin], function(){

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

    // ====================== END DASHBOARD ======================

    // ====================== SLIDER ======================
    $prefix         =   'slider';
    $controllerName =   'slider';
    Route::group(['prefix'=>$prefix],function () use($controllerName) {

        $controller =   ucfirst($controllerName) . 'Controller@';
        Route::get('/', [
            'as'    => $controllerName,
            'uses'  => $controller . 'index'
        ]);

        Route::get('delete', [
            'as'    =>'abc',
            'uses'  => $controller . 'delete'
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



    });
    // ====================== END SLIDER ======================

    $prefix     =   'category';
    Route::group(['prefix'=>'category'],function () use($prefix) {

        $controller =   ucfirst($prefix) . 'Controller@';

        //Route::get('/', $controller . 'index');
        Route::get('/', [
                'as'    => $prefix,
                'uses'  => $controller . 'index'
        ]);

        Route::get('form/{id?}', $controller . 'form')->where('id', '[0-9]+');
        Route::get('delete/{id}', $controller . 'delete')->where('id', '[0-9]+');
        Route::get('change-status-{status}/{id}', $controller . 'status')->where('id', '[0-9]+');

    });

});

