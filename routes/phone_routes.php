<?php

//$prefixPhone     = config('zvn.url.prefix_phone');

// Route::group(['prefix' =>$prefixPhone, 'namespace' => 'Phone'], function() {

//     $prefix         =   '';
//     $controllerName =   'phone';

//     Route::group(['prefix'=>$prefix],function () use($controllerName) {

//         $controller =   ucfirst($controllerName) . 'Controller@';
//         Route::get('/', [
//             'as'    => $controllerName,
//             'uses'  => $controller . 'index'
//         ]);

//     });
// });


$prefixPhone     = config('zvn.url.prefix_phone');
$nameSpace       = 'App\Http\Controllers\Phone';

Route::prefix($prefixPhone)->group(function () use($nameSpace)  {

    $prefix         =   '';
    $controllerName =   'phoneHome';

    Route::prefix($prefix)->group(function () use($controllerName,$nameSpace) {

            $controller =    $nameSpace . '\\' . ucfirst($controllerName) . 'Controller';

            Route::get('/', [$controller, 'index'])
                  ->name($controllerName);
    });

    $prefix         =   '';
    $controllerName =   'phoneItem';

    Route::prefix($prefix)->group(function () use($controllerName,$nameSpace) {

            $controller =    $nameSpace . '\\' . ucfirst($controllerName) . 'Controller';

            Route::get('/phoneItem-{id?}', [$controller, 'index'])
                  ->where('id', '[0-9]+')
                  ->name($controllerName);
    });

});
