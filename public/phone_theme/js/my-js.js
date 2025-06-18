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

/*product input*/
$(document).ready(function() {
    var priceChoose; //Biến toàn cục

    // Xác định price cho trường hợp default của product. Sau đó gán cho priceChoose.
    // Set price default cho product tại productAttributePrice module.
    var priceText   = $(".price").text().trim(); // Lấy nội dung và loại bỏ khoảng trắng
    var matchResult = priceText.match(/\d+/); // Tìm số trong chuỗi
    var priceNumber = matchResult ? matchResult[0] : null; // Kiểm tra nếu có số thì lấy, nếu không thì gán null

    if (priceNumber !== null) {
        priceChoose = priceNumber;
    }

    // Khi click vào color thì lặp lại quá trình chọn dung lượng
    $('input[name="color"]').on('click', function() {
        console.log('click color');
        $('.btn-material').removeClass('btn-primary');
        $('.btn-material').removeClass('selected');
        $(".price").html('Hãy chọn dung lượng');
    });

    // Gắn sự kiện click cho nút button
    $('.btn-material').on('click', function() {
        // Đánh dấu button 'material' dung lượng được chọn, vì button không phải là một input nên nó không có trạng thái checked để jquery lấy dữ liệu
        $('.btn-material').removeClass('selected'); // Bỏ class 'selected' khỏi các button khác
        $('.btn-material').removeClass('btn-primary');
        $(this).addClass('selected'); // Thêm class 'selected' cho button vừa click, đánh dấu đây là button được chọn
        $(this).addClass('btn-primary');

        // Lấy giá trị của radio button được chọn
        var selectedColor = $('input[name="color"]:checked').val();
        //console.log(selectedColor);
        // Lấy ID của nút button vừa click
        var buttonId    = $(this).data('material-id');

        // Lấy Id Item
        var itemId      = $(this).data('item-id');
        // Lấy url
        let url         = $(this).data('url');

        var saleType    = $(this).data('sale-type');
        var salePercent = $(this).data('sale-percent');
        var saleValue   = $(this).data('sale-value');

        // Kiểm tra và hiển thị kết quả
        if (selectedColor !== undefined) {
            console.log('Radio được chọn có giá trị:', selectedColor);
        } else {
            console.log('Không có radio nào được chọn.');
        }

        console.log('ID của nút button vừa click:', buttonId,selectedColor, itemId, url);

        $.ajax({
            type: "GET",
            url: url,
            data: {
                    colorId: selectedColor,
                    materialId: buttonId,
                    itemId: itemId
                  },
            success: function (response) {
                console.log(response)
                var id    = response.id;
                var priceReturn = response.price;

                if(priceReturn == null){
                    priceChoose = 0;
                    $(".price").html('Giá chưa cập nhật');
                }else{
                    // Cập nhật giá Item
                    var priceOriginal = priceReturn;
                    var price         = 'Giá chưa cập nhật';
                    if (saleType == 'percent') {
                        price   = priceOriginal - (priceOriginal*salePercent/100);
                    } else {
                        price   = priceOriginal - saleValue;
                    }
                    const priceOriginalHtml = 'Giá:<del>'+priceOriginal+' $</del><span> -'+salePercent+'%</span>';
                    $(".price-original").html(priceOriginalHtml);
                    $(".price").html(price+' $');
                    priceChoose = priceReturn;
                }

            }
        });

    });


    // Sự kiện click vào button 'Add to Cart'
    $('#order-cart').on('click', function () {
        // Lấy giá trị của radio color đã chọn
        const selectedColor = $('input[name="color"]:checked').val();

        // Lấy ID của button material được chọn
        const selectedMaterial = $('.btn-material.selected').data('id');

        // Kiểm tra nếu người dùng chưa chọn màu sắc hoặc material
        if (!selectedColor || !selectedMaterial) {
            alert('Vui lòng chọn màu sắc và dung lượng trước khi thêm vào giỏ hàng!');
            return;
        }

        const itemID    = $(this).data('id');
        var name        = $(this).data('name');
        var url         = $(this).data('url');
        var price       = priceChoose;
        var thumb       = $(this).data('thumb');

        // In ra console
        console.log('Item Id:', itemID);
        console.log('Item Name:', name);
        console.log('Color Id:', selectedColor);
        console.log('Material ID:', selectedMaterial);
        console.log('Url:', url);
        console.log('Price Choose:', price);
        console.log('Thumb:', thumb);

        if(price == null || price == 0 || price == undefined){
            //popup
            $('.modal-body').html('Hãy cập nhật giá của sản phẩm trước khi \"Add to Cart\" !');
            $('#cartModal').modal('show');
            return;
        }

        // Việc còn lại là tạo Ajax, gọi route rồi đưa về controller để xử lý
        $.ajax({
            type: "GET",
            url: url,
            data: {
                    itemID: itemID,
                    name: name,
                    colorID: selectedColor,
                    materialID: selectedMaterial,
                    price:price,
                    thumb:thumb
                  },
            success: function (response) {
                console.log(response)
                console.log('Cart:',response.session.cart);
                var totalItem = response.totalItem;
                $('.badge').html(totalItem);
                //popup
                $('.modal-body').html("Sản phẩm đã được thêm vào giỏ hàng !");
                $('#cartModal').modal('show');
            }
        });

    });

    //cart List
    $('.cart-list').on('click', function () {
        var url         = $(this).data('url');
        $.ajax({
            type: "GET",
            url: url,
            success: function (response) {
                console.log(response)
                const xhtmlCart = response.xhtmlCart;
                $('.msg_list').find('li.item-cart').remove(); //Xóa danh sách các thẻ item cart trước đó
                $('.msg_list').prepend(xhtmlCart); // cập nhật lại các thẻ li trong ul

            }
        });
    });
});
