<?php

namespace App\Http\Controllers\News;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\View;

use App\Models\RssModel;

use Illuminate\Support\Facades\Session;
use Illuminate\Session\Store;

use App\Helpers\Feed;
use App\Helpers\Pagination;

class RssController extends Controller
{
    private $pathViewController  = 'news.pages.rss.';
    private $controllerName      = 'rss';
    private $params              = [];
    private $model;
    public $_pagination = array(
                                  'totalItemsPerPage' => 6,
                                  'pageRange'         => 3,
                                  'currentPage'       => 1,
                                );

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
        $itemsCoin  = Feed::getCoin();

        $totalItems = count($data);

        $page = 1;
        if ($request->input('page') != null) {
            $page = $request->input('page');
            $this->_pagination['currentPage']  = $page;
        }

        //Cắt mảng
        $elementCurrent = $page*($this->_pagination['totalItemsPerPage']);
        $data = array_slice($data, $elementCurrent, $this->_pagination['totalItemsPerPage']);

        $pagination = new Pagination($totalItems,$this->_pagination);
        $paginationShow = $pagination->showPagination(route('rss/index'));

        return view($this->pathViewController . 'index',[
            'items'     =>$data,
            'itemsGold' =>$itemsGold,
            'itemsCoin' =>$itemsCoin,
            'pagination'=>$paginationShow
       ]);
    }

}

