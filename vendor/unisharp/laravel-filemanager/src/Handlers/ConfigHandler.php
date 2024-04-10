<?php

namespace UniSharp\LaravelFilemanager\Handlers;

class ConfigHandler
{
    public function userField()
    {
        return auth()->user()->id;
    }

    // Biến giả
    // public function userField()
    // {
    //     if (auth()->check()) {
    //         return auth()->user()->id;
    //     } else {
    //         // Trả về giá trị mặc định hoặc xử lý theo yêu cầu của bạn
    //         return null; // hoặc trả về giá trị mặc định khác
    //     }
    // }
}
