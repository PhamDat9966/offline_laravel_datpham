<?php

namespace App\Http\Controllers\News;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\View;

use App\Models\RssModel;

use Illuminate\Support\Facades\Session;
use Illuminate\Session\Store;

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
        $rssModel    = new RssModel();
        $itemsRss    = $rssModel->listItems(null, ['task'=>'news-list-items']);

        $context = stream_context_create([
            'http' => [
                'protocol_version' => '1.1',
                'header' => 'Upgrade: HTTP/1.1'
            ]
        ]);

        $url = 'https://vnexpress.net/rss/the-gioi.rss';
        $xmlString = file_get_contents($url, false, $context);

        $data = simplexml_load_string($xmlString, 'SimpleXMLElement', LIBXML_NOCDATA);
        $data = json_encode($data);
        $data = json_decode($data, TRUE);
        $data = $data['channel']['item'];

        foreach ($data as $key => $value) {
            unset($data[$key]['guid']);
            $tmp1 = [];
            $tmp2 = [];

            preg_match('/src="([^"]*)"/i',$value['description'], $tmp1);
            $pattern = '.*br>(.*)';
            preg_match('/' .$pattern. '/',$value['description'], $tmp2);
            $data[$key]['description']  = $tmp2[1];
            $data[$key]['thumb']        = $tmp1[1];
        }

        echo '<pre>';
        print_r($data);
        echo '</pre>';
        die();

        // return view($this->pathViewController . 'index',[
        //      'params'               => $this->params,
        //      'itemsSlider'          => $itemsSlider,
        //      'itemsCategory'        => $itemsCategory,
        //      'itemsFeature'         => $itemsFeature,
        //      'itemsLatest'          => $itemsLatest,
        //      'itemsUsually'         => $itemsUsually
        // ]);
    }

}

