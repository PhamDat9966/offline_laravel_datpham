<?php

namespace App\Http\Controllers\News;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\View;
use App\Models\RssnewsModel;
use App\Helpers\Feed;
use App\Helpers\Pagination;

use Illuminate\Support\Facades\Session;
use Illuminate\Session\Store;

use Illuminate\Support\Facades\App;
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
    protected $locale;
    public function __construct()
    {
        // share bien $controllerName cho all view
        View::share('controllerName',$this->controllerName);
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

        $this->params['page']               = $request->input('page');
        $this->params['search_value_rss']   = $request->input('search_value_rss');

        View::share('title','Tin tức tổng hợp');
        $rssnewsModel   = new RssnewsModel();
        $itemsRssnews   = $rssnewsModel->listItems(null, ['task'=>'news-list-items']);
        //dd($itemsRssnews);
        $itemsCoin  = Feed::getCoin();

        return view($this->pathViewController . 'index',[
            'params'    =>$this->params,
            'items'     =>$itemsRssnews,
            'itemsCoin' =>$itemsCoin
       ]);
    }

    public function getGold(){
        $itemsGold  = Feed::getGold();
        // Cách viết để dễ hiều: Lấy toàn bộ nội dung của html `box-gold` tại `view` có gáng mảng itemsGold
        $viewContentGold = View::make($this->pathViewController . 'child-index.box-gold',['itemsGold' =>$itemsGold])->with('itemsGold', $itemsGold)->render();
        return $viewContentGold;

    //     return view($this->pathViewController . 'child-index.box-gold',[
    //         'itemsGold' =>$itemsGold
    //    ]);

    }

    public function getCoin(){
        $itemsCoin  = Feed::getCoin();
        $viewContentCoin = View::make($this->pathViewController . 'child-index.box-coin',['itemsCoin' =>$itemsCoin])->with('itemsCoin', $itemsCoin)->render();
        return $viewContentCoin;

    //     return view($this->pathViewController . 'child-index.box-coin',[
    //         'itemsCoin' =>$itemsCoin
    //    ]);

    }

}

