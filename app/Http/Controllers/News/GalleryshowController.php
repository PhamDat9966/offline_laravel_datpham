<?php

namespace App\Http\Controllers\News;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\View;
use Illuminate\Support\Facades\File; // Import thư viện File

class GalleryshowController extends Controller
{
    private $pathViewController  = 'news.pages.gallery.';
    private $controllerName      = 'gallery';
    private $params              = [];
    private $model;

    public function __construct()
    {
        // share biến $controllerName cho tất cả view
        View::share('controllerName', $this->controllerName);
    }

    public function index(Request $request)
    {
        view()->share('title', 'Thư viện hình ảnh');
        //$directory  = public_path('zvn.path.gallery');
        $directory  = public_path('images/shares'); // Đảm bảo đường dẫn thư mục đúng
        $images     = File::files($directory);
        return view($this->pathViewController . 'index', compact('images'));
    }
}
