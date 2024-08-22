$(document).ready(function() {
    // test
	// var ojbectURL	= window.location;
    // console.log(ojbectURL);
	// var searchParams = new URLSearchParams(window.location.search);
	// var paramsString	 = (searchParams.get('search_value').replace(/\s+/g,'+'));
	// console.log(paramsString);
    // end test

	let $btnSearchRss        = $("button#btn-search-rss");
	let $btnClearSearch	     = $("button#btn-clear-search-rss");

	let $inputSearchValue = $("input[name  = search_value_rss]");
    let $selectChangeGoogleMap      = $("select[name =  select_change_is_googlemap_filter]");

    $btnSearchRss.click(function(){

        var pathname = window.location.pathname; //path hien tai không bao gồm param, tức là chỉ lấy đến hết dấu hỏi
        var search_value    = $inputSearchValue.val();
        let link            = 'page=1';

        window.location.href    = pathname + '?' + link + '&' + 'search_value_rss=' + search_value.replace(/\s+/g, '+').toLowerCase();

    });

	// $btnClearSearch.click(function() {
	// 	var pathname	= window.location.pathname;
	// 	let searchParams= new URLSearchParams(window.location.search);

	// 	params 			= ['page', 'filter_status', 'select_filter'];

	// 	let link		= "";
	// 	$.each( params, function( key, value ) {
	// 		if (searchParams.has(value) ) {
	// 			link += value + "=" + searchParams.get(value) + "&"
	// 		}
	// 	});

	// 	window.location.href = pathname + "?" + link.slice(0,-1);
	// });
	$btnClearSearch.click(function() {
		let $path 	= window.location.pathname;
		let searchParams	= new URLSearchParams(window.location.search);

		let $filter = "filter_status";
		let link	= '';
		if(searchParams.has($filter)){
			link	+= $filter + "=" + searchParams.get($filter) + "&";
		}
		window.location.href	= $path + "?" +link.slice(0,-1);

	});

    //ajax box-gold
    $.ajax({
		url		: $('#box-gold').data('url'),
		type	: 'GET',
		success	: function(data){
            $('#box-gold').html(data);
		}
	})

    //ajax box-coin
    $.ajax({
        url		: $('#box-coin').data('url'),
        type	: 'GET',
        success	: function(data){
            $('#box-coin').html(data);
        }
    })

    $selectChangeGoogleMap.on('change',function(){
        var select_value  = $(this).val();
        var url           = $(this).attr('data-url');
        //var pathname	= window.location.pathname;

        let searchParams = new URLSearchParams(window.location.search);

        // params 			= ['filter_status','search_field', 'search_value'];
        // let link        = '';

        // $.each( params, function( key, value ) {
		// 	if (searchParams.has(value) ) {
		// 		link += value + "=" + searchParams.get(value) + "&"
		// 	}
		// });
        window.location.href    = url + '?' + 'filter_googlemap=' + select_value;

        // url = url+'?filter_display='+select_value;
        // console.log(url);
    });

});

$(document).ready(function() {
    /* dropdown menu */
    // jQuery('li.dropdown').hover(function() {
    //     jQuery(this).find('.dropdown-menu').stop(true, true).delay(100).fadeIn(500);
    //   }, function() {
    //   jQuery(this).find('.dropdown-menu').stop(true, true).delay(700).fadeOut(500);
    // });

    // jQuery('li.dropdown').hover(function() {
    //     jQuery(this).find('.dropdown-menu').stop(true, true).delay(100).fadeIn(500);
    //   });

    $('.dropdown a').click(function() {
        $('ul .dropdown-menu .dropdown-submenu').addClass('show');
    });

});

// Phone liên hệ
$(document).ready(function() {
    $('#submitModal').on('click', function() {
        var input = $('#modal-input').val();
        // Phải nhập số điện thoại từ 9 đến 12 ký tự và phải nhập số
        var isValid = /^\d{9,12}$/.test(input);

        if (!isValid) {
            // alert('Số điện thoại của bạn không hợp lệ, hãy nhập ký tự số và nhập từ 9 đến 12 số');
            $(".modal-body p").html("Số điện thoại của bạn không hợp lệ! Vui lòng nhập ký tự số và nhập từ 9 đến 12 số</b>");
        } else {
            // Thực hiện gửi dữ liệu nếu input hợp lệ
            $.ajax({
                url: 'http://proj_news.xyz/phonecontact',
                method: 'GET',
                data: {
                    input: input,
                    _token: '{{ csrf_token() }}'  // Bao gồm CSRF token nếu cần
                },
                success: function(response) {
                    $('#exampleModal').modal('hide');
                    alert('Your data has been sent!');
                    console.log(response);
                },
                error: function(xhr, status, error) {
                    alert('There was an error sending your data.');
                }
            });
        }
    });
});

// localStorage
$(document).ready(function() {

    $('#contact-form').on('submit', function() {
        localStorage.setItem("name",$('#contact-form [name="name"]').val());
        localStorage.setItem("email",$('#contact-form [name="email"]').val());
        localStorage.setItem("phone",$('#contact-form [name="phone"]').val());

    });

    if ($('#contact-form') . length > 0){ // Kiểm tra xem có phần tử nào trên trang với ID là contact-form hay không
        $('#contact-form [name="name"]').val(localStorage.getItem("name"));
        $('#contact-form [name="email"]').val(localStorage.getItem("email"));
        $('#contact-form [name="phone"]').val(localStorage.getItem("phone"));
    }
});
