<?php
namespace App\Helpers;
use Config; // Ở đây nó là một đối tượng

class Form{

    public static function show( $elements ){
        $xhtml   = '';
        foreach( $elements as $element ){
            $xhtml .= self::formGroup($element);
        }
        return $xhtml;
    }

    public static function formGroup( $element , $params = null ){

        $result  = '';
        $type   = (isset($element['type'])) ? $element['type'] : 'input';
        switch( $type ){
            case 'btn-submit':
                $result  =sprintf(' <div class="ln_solid"></div>
                                    <div class="form-group">
                                        <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                                            %s
                                        </div>
                                    </div>',$element['element']);
                break;
            case 'input':
                $result  =sprintf('<div class="form-group">
                                        %s
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            %s
                                        </div>
                                    </div>',$element['label'],$element['element']);
                break;
            case 'thumb':
                $result  =sprintf('<div class="form-group">
                                        %s
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            %s
                                            <p style="margin-top: 50px;">%s</p>
                                        </div>
                                    </div>',$element['label'],$element['element'],$element['thumb']);
                break;

        }
        return $result;
    }
}

// <div class="form-group">
// <label for="thumb" class="control-label col-md-3 col-sm-3 col-xs-12">Thumb</label>
// <div class="col-md-6 col-sm-6 col-xs-12">
//     <input class="form-control col-md-6 col-xs-12" name="thumb" type="file" id="thumb">
//     <p style="margin-top: 50px;"><img src="http://proj_news.xyz/images/slider/LWi6hINpXz.jpeg" alt="Ưu đãi học phí" class="zvn-thumb"></p>
// </div>
// </div>

// <div class="ln_solid"></div>
// <div class="form-group">
//     <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
//         <input name="id" type="hidden" value="3">
//         <input name="thumb_current" type="hidden" value="LWi6hINpXz.jpeg">
//         <input class="btn btn-success" type="submit" value="Save">
//     </div>
// </div>

// <div class="form-group">
//     {!! $nameLabel !!}
//     <div class="col-md-6 col-sm-6 col-xs-12">
//         {!! $nameInput !!}
//     </div>
// </div>

// <div class="form-group">
//     <label for="status" class="control-label col-md-3 col-sm-3 col-xs-12">Status</label>
//     <div class="col-md-6 col-sm-6 col-xs-12">
//         <select class="form-control col-md-6 col-xs-12" id="status" name="status">
//             <option value="default">Select status</option>
//             <option value="active" selected="selected">Kích hoạt</option>
//             <option value="inactive">Chưa kích hoạt</option>
//         </select>
//     </div>
// </div>
