$(document).ready(function() {
    $('#datepicker').datepicker({
        format: 'yyyy-mm-dd',
        autoclose: true,
        todayHighlight: true
    }).on('changeDate', function(e) {
        var selectedDate = $(this).val();
        var pathname        = window.location.pathname; //path hien tai không bao gồm param, tức là chỉ lấy đến hết dấu hỏi

        let $inputSearchField           = $("input[name  = search_field]");
        let $inputSearchValue           = $("input[name  = search_value]");

        var search_field    = $inputSearchField.val();
        var search_value    = $inputSearchValue.val();

        let params          = ['filter_status'];
        let link            = '';
        var searchParams    = new URLSearchParams(window.location.search);

        $.each( params, function( key, value ) {
            if (searchParams.has(value) ) {
                link += value + "=" + searchParams.get(value) + "&";
            }
        });

        //window.location.href    = pathname + '?' + 'filter_date=' +  selectedDate;
        window.location.href    = pathname + '?' + link + 'filter_date=' +  selectedDate + '&' + 'search_field=' + search_field + '&' + 'search_value=' + search_value.replace(/\s+/g, '+').toLowerCase();

    });
});
