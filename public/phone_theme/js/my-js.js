$(document).ready(function() {
    //View modal product
    $('.quick-view-btn').on('click', function() {
        var id              = $(this).data('id');
        var name            = $(this).data('name');
        var description     = $(this).data('description');
        var imageurl        = $(this).data('imageurl');
        var price           = $(this).data('price');
        var salePrice       = $(this).data('salePrice');

        var priceAll        = salePrice + '$ <del>'+price+' $</del>';

        //Gán lần lượt các giá trị của product vào modal view
        $('#quick-view').find('.book-name').text(name)
        $('#quick-view').find('.book-description').text(description);
        $('#quick-view').find('.book-picture').attr('src', imageurl);
        $('#quick-view').find('.book-price').text(salePrice);

        console.log(id,name,imageurl);

        // $.ajax({
        //     url: url,
        //     method: "GET",
        //     data: {
        //         id: id
        //     },
        //     success: function(response) {
        //         console.log(response);
        //         // alert("Thứ tự đã được lưu lại!");
        //     },
        //     error: function(xhr) {
        //         alert("Có lỗi xảy ra: " + xhr.responseText);
        //     }
        // });
    });

});
