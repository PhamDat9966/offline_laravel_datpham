<?php
namespace App\Helpers;

class Feed{
    public static function read($itemRss){
        $result = [];
        foreach ($itemRss as $value) {
            $data   = Feed::readVNExpress($value['link']);
            $result = array_merge_recursive($result,$data);
        }
        return $result;
    }

    public static function readVNExpress($link ){

        try {
            $context = stream_context_create([
                'http' => [
                    'protocol_version' => '1.1',
                    'header' => 'Upgrade: HTTP/1.1'
                ]
            ]);

            $xmlString = file_get_contents($link, false, $context);

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

                $data[$key]['description']  = $tmp2[1] ?? $value['description'];
                $data[$key]['thumb']        = $tmp1[1] ?? '';
            }
            return $data;
        } catch (\Throwable $th) {
            return [];
        }

    }
}
