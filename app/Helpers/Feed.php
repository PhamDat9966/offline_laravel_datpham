<?php
namespace App\Helpers;

class Feed{
    public static function read($itemRss){
        // echo '<pre>';
        // print_r($itemRss);
        // echo '</pre>';
        $result = [];

        foreach ($itemRss as $value) {
            switch (Feed::checkSourceLink($value['source'], $value['link'])) {
                case 'thanhnien':
                    $data   = Feed::readThanhnien($value['link']);
                    $result = array_merge_recursive($result,$data);
                    break;
                case 'vnexpress':
                    $data   = Feed::readVNExpress($value['link']);
                    $result = array_merge_recursive($result,$data);
                    break;
                case 'tuoitre':
                    $data = Feed::readTuoiTre($value['link']);
                    break;
            }

        }

        return $result;
    }

    public static function checkSourceLink($source, $link)
    {
        $sourceFromLink = explode('.', parse_url($link, PHP_URL_HOST))[0];
        return ($source == $sourceFromLink);
    }

    public static function readVNExpress($link){

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

    public static function readTuoiTre($link) // name
    {
        try {
            $data = simplexml_load_file($link, "SimpleXMLElement", LIBXML_NOCDATA);
            $data = json_encode($data);
            $data = json_decode($data, TRUE);
            $data = $data['channel']['item'];

            foreach ($data as $key => $value) {
                unset($data[$key]['guid']);
                $tmp1 = [];
                $tmp2 = [];

                preg_match('/src="([^"]*)"/i', $value['description'], $tmp1);
                preg_match('/.*<\/a>(.*)/', $value['description'], $tmp2);

                $data[$key]['description'] = $tmp2[1] ?? $value['description'];
                $data[$key]['thumb'] = $tmp1[1] ?? '';
            }
            return $data;
        } catch (\Throwable $th) {
            return [];
        }
    }

    public static function readThanhnien($link){

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

                $pattern = '/<img[^>]*\s*src=["\']([^"\']*)["\']/i';
                preg_match($pattern,$value['description'], $tmp1);

                $tmp2[1] = preg_replace('/<[^>]*>/', '', $value['description']);

                $data[$key]['description']  = $tmp2[1];
                $data[$key]['thumb']        = $tmp1[1] ?? '';
            }

            return $data;
        } catch (\Throwable $th) {
            return [];
        }

    }
}
