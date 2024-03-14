$(document).ready(function() {
    // test
	// var ojbectURL	= window.location;
    // console.log(ojbectURL);
	// var searchParams = new URLSearchParams(window.location.search);
	// var paramsString	 = (searchParams.get('search_value').replace(/\s+/g,'+'));
	// console.log(paramsString);
    // end test

	let $btnSearch                  = $("button#btn-search");
	let $btnClearSearch	            = $("button#btn-clear-search");

	let $inputSearchField           = $("input[name  = search_field]");
	let $inputSearchValue           = $("input[name  = search_value]");

    let $selectFilter               = $("select[name = select_filter]");
	let $selectChangeAttr           = $("select[name =  select_change_attr]");
	let $selectChangeAttrAjax       = $("select[name =  select_change_attr_ajax]");

    let $selectChangeDisplayFilter  = $("select[name =  select_change_display_filter]");
    let $selectChangeIsHomeFilter   = $("select[name =  select_change_is_home_filter]");

    let $selectChangeCategoryFilter = $("select[name =  select_change_is_category_filter]");
    let $selectChangeTypeFilter     = $("select[name =  select_change_type_filter]");

    let $inputOrdering              = $("input.ordering");

	//let searchParams= new URLSearchParams(window.location.search);
	let searchParams	= window.location.search;

	$("a.select-field").click(function(e) {
		e.preventDefault();

		let field 		= $(this).data('field');
		let fieldName 	= $(this).html();
		$("button.btn-active-field").html(fieldName + ' <span class="caret"></span>');
    	$inputSearchField.val(field);
	});

	// $btnSearch.click(function() {

	// 	var pathname	= window.location.pathname;
	// 	let searchParams= new URLSearchParams(window.location.search);
	// 	params 			= ['page', 'filter_status', 'select_field', 'select_value'];

	// 	let link		= "";
	// 	$.each( params, function( key, value ) {
	// 		if (searchParams.has(value) ) {
	// 			link += value + "=" + searchParams.get(value) + "&"
	// 		}
	// 	});

	// 	let search_field = $inputSearchField.val();
	// 	let search_value = $inputSearchValue.val();
    //     // test
	// 	// let hrefRam		 = pathname + "?" + link + 'search_field='+ search_field + '&search_value=' + search_value.replace(/\s+/g, '+').toLowerCase();// Khoảng trắng được thay bằng dấu cộng "+".
	// 	// console.log(hrefRam);
    //     // end test

    //     // Đẩy các giá trị được nhập tại các input lên url window
	// 	window.location.href = pathname + "?" + link + 'search_field='+ search_field + '&search_value=' + search_value.replace(/\s+/g, '+').toLowerCase();

	// });

    $btnSearch.click(function(){
        var pathname = window.location.pathname; //path hien tai không bao gồm param, tức là chỉ lấy đến hết dấu hỏi
        var search_field    = $inputSearchField.val();
        var search_value    = $inputSearchValue.val();

        let params          = ['filter_status','filter_is_home','filter_display','filter_category','filter_type'];
        let link            = '';
        var searchParams    = new URLSearchParams(window.location.search);

        $.each( params, function( key, value ) {
			if (searchParams.has(value) ) {
				link += value + "=" + searchParams.get(value) + "&";
			}
		});

        window.location.href    = pathname + '?' + link + 'search_field=' + search_field + '&' + 'search_value=' + search_value.replace(/\s+/g, '+').toLowerCase();

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

	//Event onchange select filter
	$selectFilter.on('change', function () {
		var pathname	= window.location.pathname;
		let searchParams= new URLSearchParams(window.location.search);

		params 			= ['page', 'filter_status', 'filter_display', 'filter_is_home' ,'search_field', 'search_value'];

		let link		= "";
		$.each( params, function( key, value ) {
			if (searchParams.has(value) ) {
				link += value + "=" + searchParams.get(value) + "&"
			}
		});

		let select_field = $(this).data('field');
		let select_value = $(this).val();
		window.location.href = pathname + "?" + link.slice(0,-1) + 'select_field='+ select_field + '&select_value=' + select_value;
 	});

	// Change attributes with selectbox
	// $selectChangeAttr.on('change', function() {
	// 	let item_id = $(this).data('id');
	// 	let url = $(this).data('url');
	// 	let csrf_token = $("input[name=csrf-token]").val();
	// 	let select_field = $(this).data('field');
	// 	let select_value = $(this).val();
	//
	// 	$.ajax({
	// 		url : url,
	// 		type : "post",
	// 		dataType: "html",
	// 		headers: {'X-CSRF-TOKEN': csrf_token},
	// 		data : {
	// 			id : item_id,
	// 			field: select_field,
	// 			value: select_value
	// 		},
	// 		success : function (result){
	// 			if(result == 1)
	// 				alert('Bạn đã cập nhật giá trị thành công!');
	// 			else
	// 				console.log(result)
	//
	// 		}
	// 	});
	// });

	// $selectChangeAttr.on('change', function() {
    //     console.log(this.value);
	// 	let select_value = $(this).val();
	// 	let $url = $(this).data('url');
	// 	window.location.href = $url.replace('value_new', select_value);
	// });

    $selectChangeDisplayFilter.on('change',function(){
        var select_value  = $(this).val();
        var url           = $(this).attr('data-url');

        let searchParams = new URLSearchParams(window.location.search);

        params 			= ['page', 'filter_status', 'filter_is_home','search_field', 'search_value'];
        let link        = '';

        $.each( params, function( key, value ) {
			if (searchParams.has(value) ) {
				link += value + "=" + searchParams.get(value) + "&"
			}
		});
        window.location.href    = url + '?' + link + 'filter_display=' + select_value;;

        // url = url+'?filter_display='+select_value;
        // console.log(url);
    });

    $selectChangeIsHomeFilter.on('change',function(){
        var select_value  = $(this).val();
        var url           = $(this).attr('data-url');

        let searchParams = new URLSearchParams(window.location.search);

        params 			= ['page', 'filter_status','filter_display', 'search_field', 'search_value'];
        let link        = '';

        $.each( params, function( key, value ) {
			if (searchParams.has(value) ) {
				link += value + "=" + searchParams.get(value) + "&"
			}
		});
        window.location.href    = url + '?' + link + 'filter_is_home=' + select_value;

        // url = url+'?filter_display='+select_value;
        // console.log(url);
    });

	$selectChangeAttrAjax.on('change', function() {
		let select_value = $(this).val();
		let $url = $(this).data('url');
		let csrf_token = $("input[name=csrf-token]").val();

		$.ajax({
			url : $url.replace('value_new', select_value),
			type : "GET",
			dataType: "json",
			headers: {'X-CSRF-TOKEN': csrf_token},
			success : function (result){
				if(result) {
					$.notify({
						message: "Cập nhật giá trị thành công!"
					}, {
						delay: 500,
						allow_dismiss: false
					});
				}else {
					console.log(result)
				}
			}
		});

	});

    /*article*/
    $selectChangeCategoryFilter.on('change',function(){
        var select_value  = $(this).val();
        var url           = $(this).attr('data-url');
        //var pathname	= window.location.pathname;

        let searchParams = new URLSearchParams(window.location.search);

        params 			= ['filter_status','search_field', 'search_value'];
        let link        = '';

        $.each( params, function( key, value ) {
			if (searchParams.has(value) ) {
				link += value + "=" + searchParams.get(value) + "&"
			}
		});
        window.location.href    = url + '?' + link + 'filter_category=' + select_value;

        // url = url+'?filter_display='+select_value;
        // console.log(url);
    });

    $selectChangeTypeFilter.on('change',function(){
        var select_value  = $(this).val();
        var url           = $(this).attr('data-url');
        //var pathname	= window.location.pathname;

        let searchParams = new URLSearchParams(window.location.search);

        params 			= ['filter_status','filter_category','search_field', 'search_value'];
        let link        = '';

        $.each( params, function( key, value ) {
			if (searchParams.has(value) ) {
				link += value + "=" + searchParams.get(value) + "&"
			}
		});
        window.location.href    = url + '?' + link + 'filter_type=' + select_value;

        // url = url+'?filter_display='+select_value;
        // console.log(url);
    });

    //Confirm button delete item
	$('.btn-delete').on('click', function() {
		if(!confirm('Bạn có chắc muốn xóa phần tử?'))
			return false;
	});

	//Init datepicker
	// $('.datepicker').datepicker({
	// 	format: 'dd-mm-yyyy',
	// });

    $('.status-ajax').on('click', function() {
        let url             = $(this).data('url');
        let btn             = $(this);
        let currentClass    = $(this).data('class');

        $.ajax({
            type: "GET",
            url: url,

            success: function (response) {

                var newClass = 'btn btn-round status-ajax ' + response.status.class;
                btn.removeClass();
                btn.addClass(newClass);

                btn.data("class", response.class);

                btn.attr('data-class',response.class)
                btn.html(response.status.name);

                btn.data("url", response.link);         // thay đổi `url` và  lưu trữ nó trong bộ nhớ của jQuery
                btn.attr('data-url',response.link)      // thay đổi `url` HTML
                btn.notify("Cập nhật thành công!",
                    { className: "success" , position:"top"  }
                );
            }
        });
	});

    $('.is-home-ajax').on('click', function() {
        let url             = $(this).data('url');
        let btn             = $(this);
        let currentClass    = $(this).data('class');

        $.ajax({
            type: "GET",
            url: url,

            success: function (response) {
                var responseArr = $.parseJSON(response);

                btn.removeClass();
                btn.addClass(responseArr.isHome.class);
                btn.html(responseArr.isHome.name);
                btn.data("url", responseArr.link);         // thay đổi `url` và  lưu trữ nó trong bộ nhớ của jQuery
                btn.attr('data-url',responseArr.link)      // thay đổi `url` HTML
                btn.notify("Cập nhật thành công!",
                    { className: "success" , position:"top"  }
                );
            }
        });
	});

    // Change Ajax Category Display
    $selectChangeAttr.on('change',function(){
        let element       = $(this);
        var selectValue   = $(this).val();
        var url           = $(this).data('url');
        url               = url.replace("value_new",selectValue)
        $.ajax({
            type: "GET",
            url: url,
            success: function (response) {
                element.notify("Cập nhật thành công!",
                    { className: "success" , position:"top"  }
                );
            }
        });
    });

    $inputOrdering.on('change',function(){
        let element      = $(this);
        var selectValue  = $(this).val();
        var url          = $(this).data('url');
        var inputId      = $(this).attr("id");
        url              = url.replace("value_new",selectValue);
        $.ajax({
            type: "GET",
            url: url,
            success: function (response) {
                var responseArr = $.parseJSON(response);
                var modified    = responseArr.modified;
                var modifiedBy  = responseArr.modified_by;

                var modifiedText = '<i class="fa fa-user"></i>'+' '+modified;
                $("p.modified-"+inputId).html(modifiedText);

                var modifiedBytText = '<i class="fa fa-clock-o"></i>'+' '+modifiedBy;
                $("p.modified-by-"+inputId).html(modifiedBytText);

                element.notify("Cập nhật thành công!",
                    { className: "success" , position:"top"  }
                );
            }
        });
    });

});
