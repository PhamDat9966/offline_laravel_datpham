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

});
