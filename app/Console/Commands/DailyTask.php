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

        foreach($data as $value){
            // Chuyển đổi thời gian về dạng Y-m-d
            $pubDate = Carbon::parse($value['pubDate']);
            $pubDate = $pubDate->toDateString();
            //Lọc lại chỉ lấy những tin trùng với ngày hôm nay $now
            if($nowDay == $pubDate){
                $dataNews[] = $value;
            }
        }

        // Xóa toàn bộ các tin tức cũ.
        DB::table('rssnews')->delete();

        // Ghi lại các tin tức mới đã lọc vào table
        // Chay http://proj_news.xyz/run-daily-task để kiểm tra kết quả

        foreach ($dataNews as $item) {
            DB::table('rssnews')->insert([
                'title' => $item['title'],
                'description' => $item['description'],
                'pubDate' => Carbon::parse($item['pubDate']),
                'link' => $item['link'],
                'thumb' => $item['thumb'],
                'created_by' => $item['created_by']
            ]);
        }

        // Lưu thông báo vào cache.
        //Cache::put('dataNew', $dataNew);
        Cache::put('daily_task_message', 'Daily task executed successfully.', now()->addMinutes(5));

    }
}
