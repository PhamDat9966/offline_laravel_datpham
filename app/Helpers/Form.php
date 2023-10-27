<?php
namespace App\Helpers;
use Config; // Ở đây nó là một đối tượng

class Form{

    public static function show( $elements ){
        $xhtml   = '';
        foreach( $elements as $element ){
            // echo '<pre>';
            // print_r( $element );
            // echo '</pre>';
            $xhtml  .=sprintf('<div class="form-group">
                                    %s
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        %s
                                    </div>
                                </div>',$element['label'],$element['element']);

        }
        return $xhtml;
    }
}

// <div class="form-group">
//     {!! $nameLabel !!}
//     <div class="col-md-6 col-sm-6 col-xs-12">
//         {!! $nameInput !!}
//     </div>
// </div>

// <div class="form-group">
//     {!! $descriptionLabel !!}
//     <div class="col-md-6 col-sm-6 col-xs-12">
//         {!! $descriptionInput !!}
//     </div>
// </div>
