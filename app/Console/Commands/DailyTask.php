<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Cache;

use App\Models\RssModel;
use App\Helpers\Feed;
use Carbon\Carbon;

use Illuminate\Support\Facades\DB;

class DailyTask extends Command
{
    protected $signature = 'daily:task';
    protected $description = 'Run daily tasks';

    public function __construct()
    {
        parent::__construct();
    }

    public function handle()
    {
        // Thực hiện các tác vụ hàng ngày ở đây.
        Log::info('Daily task executed successfully.');

        $rssModel    = new RssModel();
        $itemsRss    = $rssModel->listItems(null, ['task'=>'news-list-items']);

        $data       = Feed::read($itemsRss);
        //Lọc dữ liệu theo thời gian hiện tại
        $dataNews    = array();

        // Lấy thời gian hiện tại
        $now = Carbon::now();
        $nowDay = $now->toDateString();

        $yesterday      = Carbon::yesterday();
        $yesterdayDay   = $yesterday->toDateString();
        foreach($data as $value){
            // Chuyển đổi thời gian về dạng Y-m-d
            $pubDate = Carbon::parse($value['pubDate']);
            $pubDate = $pubDate->toDateString();

            //Lọc lại chỉ lấy những tin trùng với ngày hôm nay $now
            if($nowDay == $pubDate){
                $dataNews[] = $value;
            }

        }

        $countArray = count($dataNews);

        //Trường hợp hôm nay chưa có hoặc chỉ có dưới 5 tin mới thì lấy thêm tin của ngày hôm qua
        if($countArray <= 4){
            foreach($data as $value){
                // Chuyển đổi thời gian về dạng Y-m-d
                $pubDate = Carbon::parse($value['pubDate']);
                $pubDate = $pubDate->toDateString();

                if($yesterdayDay == $pubDate){
                    $dataNews[] = $value;
                }
            }
        }

        //Trường hợp ngày hôm nay và hôm qua không có tin thì lấy mặc định (ví dụ như rss của tuoitre)
        if(empty($dataNews)){
            foreach($data as $value){
                $dataNews[] = $value;
            }
        }

        // Xóa toàn bộ các tin tức cũ.
        DB::table('rssnews')->delete();

        // Ghi lại các tin tức mới đã lọc vào table
        // Chay http://proj_news.xyz/run-daily-task để kiểm tra kết quả

        foreach ($dataNews as $item) {

            $host = parse_url($item['link'], PHP_URL_HOST);
            $hostParts = explode('.', $host);
            $domain = $hostParts[0];

            DB::table('rssnews')->insert([
                'title'         => $item['title'],
                'description'   => $item['description'],
                'pubDate'       => Carbon::parse($item['pubDate']),
                'link'          => $item['link'],
                'thumb'         => $item['thumb'],
                'created_by'    => $item['created_by'],
                'status'        => 'active',
                'domain'        => $domain
            ]);
        }

        // Lưu thông báo vào cache.
        //Cache::put('dataNew', $dataNew);
        Cache::put('daily_task_message', 'Daily task executed successfully.', now()->addMinutes(5));
        $this->info('Đã hoàn tất. Tổng cộng ' . count($dataNews) . ' tin đã được lưu.');
    }
}

