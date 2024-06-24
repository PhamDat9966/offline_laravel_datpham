<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Cache;

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

        // Lưu thông báo vào cache.
        Cache::put('daily_task_message', 'Daily task executed successfully.', now()->addMinutes(5));

    }
}
