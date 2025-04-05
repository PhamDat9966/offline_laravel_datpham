<?php

namespace App\Http\Controllers\News;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\View;
use Illuminate\Support\Facades\File; // Import thư viện File
use Illuminate\Support\Facades\App;

class GalleryshowController extends Controller
{
    private $pathViewController  = 'news.pages.gallery.';
    private $controllerName      = 'gallery';
    private $params              = [];
    private $model;
    protected $locale;

    public function __construct()
    {
        // share biến $controllerName cho tất cả view
        View::share('controllerName', $this->controllerName);
        $this->middleware(function ($request, $next) {
            $locale                 = App::getLocale();
            $this->locale           = $locale;
            $this->params['locale'] = $locale;

            View::share('locale',$this->locale);
            return $next($request);
        });
    }

    public function index(Request $request)
    {
        view()->share('title', 'Thư viện hình ảnh');
        $directory  = public_path(config('zvn.path.gallery'));
        //$directory  = public_path('images/shares'); // Đảm bảo đường dẫn thư mục đúng

        $images     = File::files($directory);
        return view($this->pathViewController . 'index', compact('images'));
    }
}
