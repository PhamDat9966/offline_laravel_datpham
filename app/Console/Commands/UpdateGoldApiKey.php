<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Storage;

class UpdateGoldApiKey extends Command
{
    /**
     * Phương thúc tự động cập nhật API key.
     *
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'api:update-gold-key';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Get new API key from vnappmob and save it';

    /**
     * Create a new command instance.
     *
     * @return void
     */
    public function __construct()
    {
        parent::__construct();
    }

    /**
     * Execute the console command.
     *
     * @return int
     */
    public function handle()
    {

        $response = Http::get('https://api.vnappmob.com/api/request_api_key?scope=gold');
        \Log::info('Lệnh update gold API key đã chạy lúc: ' . now());

        if ($response->successful()) {
            // Phân tích JSON, lấy API key từ kết quả
            $dataApiKey = $response->json();
            $apiKey = $dataApiKey['results']; // Chuỗi key, không phải mảng con

            // Lưu API key vào file trong storage/app
            Storage::put('gold_api_key.txt', $apiKey);

            $this->info('API key updated successfully: ' . $apiKey);
        } else {
            // Ghi log lỗi khi không thể lấy được key
            $this->error('Failed to update API key.');
        }
    }
}
