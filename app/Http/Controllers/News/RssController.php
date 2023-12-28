<?php

namespace App\Http\Controllers\News;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\View;

use App\Models\RssModel;

use Illuminate\Support\Facades\Session;
use Illuminate\Session\Store;

use App\Helpers\Feed;

class RssController extends Controller
{
    private $pathViewController  = 'news.pages.rss.';
    private $controllerName      = 'rss';
    private $params              = [];
    private $model;

    public function __construct()
    {
      // share bien $controllerName cho all view
      View::share('controllerName',$this->controllerName);
    }

    public function index(Request $request)
    {
        View::share('title','Tin tức tổng hợp');
        $rssModel    = new RssModel();
        $itemsRss    = $rssModel->listItems(null, ['task'=>'news-list-items']);

        $data       = Feed::read($itemsRss);
        $itemsGold  = Feed::getGold();

        return view($this->pathViewController . 'index',[
            'items'     =>$data,
            'itemsGold' =>$itemsGold
       ]);
    }

}

