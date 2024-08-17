<?php

namespace App\Mail;

use App\Models\SettingModel;
use Illuminate\Support\Facades\Config;
use Illuminate\Support\Facades\Mail;

class MailService
{
    private $fromTitle;
    public function __construct()
    {
        $this->fromTitle = 'Zendvn';
    }

    public function sendContactConform($data){
        $mail = json_decode(SettingModel::where('key_value','setting-email')->first()->value,true);

        if(empty($mail)){
            return false;
        }else{
            Mail::send([],[], function ($message) use ($mail,$data) {
                $message->from($mail['username'], $this->fromTitle);
                $message->to($data['email']);
                $message->subject($this->fromTitle . 'Thông báo gửi liên hệ thành công!');

                $content = sprintf('
                <p>Xin chào %s</p>
                <p>Zendvn đã nhận được thông tin liên hệ của bạn và sẽ phản hồi cho bạn trong thời gian sớm nhất</p>
                <p>Cám ơn!</p>
                ', $data['name']);
                $message->setBody($content, 'text/html');
            });
            return true;
        }
    }

    public function sendContactInfo($data){
        $mailSetting = SettingModel::where('key_value', 'setting-email')->first()->value;

        if(empty($mailSetting)){
            return false;
        }

        $mail = json_decode($mailSetting, true);

        $bccSetting = $mail['bcc'];
        $bcc = $bccSetting ? explode(',', $bccSetting) : [];

        Mail::send([], [], function ($message) use ($mail, $data, $bcc) {
            $message->from($mail['username'], $this->fromTitle);
            if (!empty($bcc)) {
                $message->bcc($bcc);
            }

            $message->subject('Thông báo gửi liên hệ từ ' . $data['name']);

            $content = sprintf(
                '<p>Name: %s</p><p>Email: %s</p><p>Phone: %s</p><p>Message: %s</p>',
                $data['name'], $data['email'], $data['phone'], $data['message']
            );
            $message->setBody($content, 'text/html');
        });

        return true;
    }

    // public function sendContactInfo($data){
    //     $mail = json_decode(SettingModel::where('key_value','setting-email')->first()->value,true);

    //     if(empty($mail)){
    //         return false;
    //     }else{
    //         Mail::send([],[], function ($message) use ($mail,$data) {
    //             $message->from($mail['username'], $this->fromTitle);
    //             $bcc    = explode(',',SettingModel::where('key_value','setting-bcc')->first()->value,true);
    //             $message->bcc($bcc);

    //             $message->subject('Thông báo gửi liên hệ từ ' . $data['name']);

    //             $content = sprintf('
    //             <p>Name: %</p>
    //             <p>Email: %</p>
    //             <p>Phone: %</p>
    //             <p>Message: %</p>
    //             ', $data['name'], $data['email'], $data['phone'], $data['message']);
    //             $message->setBody($content, 'text/html');
    //         });
    //         return true;
    //     }
    // }
}
