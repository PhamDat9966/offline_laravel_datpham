<?php

namespace App\Providers;

use Illuminate\Support\Facades\Config;
use Illuminate\Support\ServiceProvider;
use App\Models\SettingModel;

class MailServiceProvider extends ServiceProvider
{
    /**
     * Register services.
     *
     * @return void
     */
    public function register()
    {
        // Đăng ký các dịch vụ liên quan đến email
    }

    /**
     * Bootstrap services.
     *
     * @return void
     */
    public function boot()
    {
        // Cấu hình các dịch vụ email tại đây
        $mail = json_decode(SettingModel::where('key_value','setting-email')->first()->value,true);
        if(empty($mail)){
            return false;
        }else{
            Config::set('mail.username',$mail['username']);
            Config::set('mail.password',$mail['password']);
        }
    }
}
