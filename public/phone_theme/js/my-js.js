$(document).ready(function() {
    //View modal product
    $('.quick-view-btn').on('click', function() {
        var id              = $(this).data('id');
        var name            = $(this).data('name');
        var description     = $(this).data('description');
        var imageurl        = $(this).data('imageurl');
        var price           = $(this).data('price');
        var salePrice       = $(this).data('salePrice');
        var urlItem         = $(this).data('url-item');

        var colorID         = $(this).data('color-id');
        var materialID      = $(this).data('material-id');

        var urlAddToCart    = $(this).data('url-add-cart');

        var priceAll        = salePrice + '$ <del>'+price+' $</del>';

        //Gán lần lượt các giá trị của product vào modal view
        $('#quick-view').find('.book-name').text(name)
        $('#quick-view').find('.book-description').text(description);
        $('#quick-view').find('.book-picture').attr('src', imageurl);
        $('#quick-view').find('.book-price').text(salePrice);
        $('#quick-view').find('.btn-view-book-detail').attr('href', urlItem);

        //Gán data vào button "chọn mua"
        $('#quick-view').find('.add-to-cart').data('id', id);
        $('#quick-view').find('.add-to-cart').data('name', name);
        $('#quick-view').find('.add-to-cart').data('color-id', colorID);
        $('#quick-view').find('.add-to-cart').data('material-id', materialID);
        $('#quick-view').find('.add-to-cart').data('url', urlAddToCart);

        // $('#quick-view').find('.add-to-cart').data('name', name);
        // $('#quick-view').find('.add-to-cart').attr('name', name);

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

        //Gán color-id cho button add cart
        var selectedColor = $('input[name="color"]:checked').val();
        $('.add-to-cart').data('color-id', selectedColor);
        $('.add-to-cart').attr('data-color-id', selectedColor);
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
        var materialId    = $(this).data('material-id');

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

        console.log('ID của nút button vừa click:', materialId,selectedColor, itemId, url);

        //Gán material-id cho button add cart
        $('.add-to-cart').data('material-id', materialId);
        $('.add-to-cart').attr('data-material-id', materialId);
        console.log('Add to cart button: color:', $('.add-to-cart').data('color-id'));
        console.log('Add to cart button: material:', $('.add-to-cart').data('material-id'));

        $.ajax({
            type: "GET",
            url: url,
            data: {
                    colorId: selectedColor,
                    materialId: materialId,
                    itemId: itemId
                  },
            success: function (response) {
                console.log(response)
                var id    = response.id;
                var priceReturn = response.price;

                if(priceReturn == null){
                    priceChoose = 0;
                    $(".price").html('Mẫu này đã hết hàng');
                }else{
                    // Cập nhật giá Item
                    var priceOriginal = priceReturn;
                    var price         = 'Mẫu này đã hết hàng';
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
    // $('.add-to-cart').on('click', function (e) {
    //      e.preventDefault(); // Ngăn click <a> gây reload/trùng lặp

    //     const itemID            = $(this).data('id');
    //     var name                = $(this).data('name');
    //     var url                 = $(this).data('url');
    //     var thumb               = $(this).data('thumb');
    //     var selectedColor       = $(this).data('color-id');
    //     var selectedMaterial    = $(this).data('material-id');

    //     // In ra console
    //     console.log('Item Id:', itemID);
    //     console.log('Item Name:', name);
    //     console.log('Color Id:', selectedColor);
    //     console.log('Material ID:', selectedMaterial);
    //     console.log('Url:', url);

    //     //Việc còn lại là tạo Ajax, gọi route rồi đưa về controller để xử lý
    //     $.ajax({
    //         type: "GET",
    //         url: url,
    //         data: {
    //                 itemID: itemID,
    //                 name: name,
    //                 colorID: selectedColor,
    //                 materialID: selectedMaterial,
    //               },
    //         success: function (response) {
    //             alert('Sản phẩm đã được thêm vào giỏ hàng!');
    //         },
    //         error: function(xhr) {
    //             alert('Lỗi thêm sản phẩm: ' + xhr.status);
    //         }
    //     });

    // });

    // // Sự kiện click vào button 'Add to Cart'
    // $('#order-cart').on('click', function () {
    //     // Lấy giá trị của radio color đã chọn
    //     const selectedColor = $('input[name="color"]:checked').val();

    //     // Lấy ID của button material được chọn
    //     const selectedMaterial = $('.btn-material.selected').data('id');

    //     // Kiểm tra nếu người dùng chưa chọn màu sắc hoặc material
    //     if (!selectedColor || !selectedMaterial) {
    //         alert('Vui lòng chọn màu sắc và dung lượng trước khi thêm vào giỏ hàng!');
    //         return;
    //     }

    //     const itemID    = $(this).data('id');
    //     var name        = $(this).data('name');
    //     var url         = $(this).data('url');
    //     var price       = priceChoose;
    //     var thumb       = $(this).data('thumb');

    //     // In ra console
    //     console.log('Item Id:', itemID);
    //     console.log('Item Name:', name);
    //     console.log('Color Id:', selectedColor);
    //     console.log('Material ID:', selectedMaterial);
    //     console.log('Url:', url);
    //     console.log('Price Choose:', price);
    //     console.log('Thumb:', thumb);

    //     if(price == null || price == 0 || price == undefined){
    //         //popup
    //         $('.modal-body').html('Hãy cập nhật giá của sản phẩm trước khi \"Add to Cart\" !');
    //         $('#cartModal').modal('show');
    //         return;
    //     }

    //     // Việc còn lại là tạo Ajax, gọi route rồi đưa về controller để xử lý
    //     $.ajax({
    //         type: "GET",
    //         url: url,
    //         data: {
    //                 itemID: itemID,
    //                 name: name,
    //                 colorID: selectedColor,
    //                 materialID: selectedMaterial,
    //                 price:price,
    //                 thumb:thumb
    //               },
    //         success: function (response) {
    //             console.log(response)
    //             console.log('Cart:',response.session.cart);
    //             var totalItem = response.totalItem;
    //             $('.badge').html(totalItem);
    //             //popup
    //             $('.modal-body').html("Sản phẩm đã được thêm vào giỏ hàng !");
    //             $('#cartModal').modal('show');
    //         }
    //     });

    // });

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

//Media Gallery
$(document).ready(function() {

    var swiperThumbs = new Swiper(".mySwiper", {
        spaceBetween: 10,
        slidesPerView: 4,
        freeMode: true,
        watchSlidesProgress: true,
    });

    // Khởi tạo Swiper chính có autoplay và điều hướng mũi tên
    var swiperMain = new Swiper(".mySwiper2", {
        spaceBetween: 10,
        loop: true,

        // Điều hướng bằng phím mũi tên trái/phải
        keyboard: {
            enabled: true,
            onlyInViewport: true,
        },

        // Tự động chuyển ảnh mỗi 5 giây
        autoplay: {
            delay: 8000,        // thời gian giữa các ảnh (miligiây)
            disableOnInteraction: false,  // không tắt autoplay sau khi người dùng tương tác
        },

        //  Các nút điều hướng (nếu có)
        navigation: {
            nextEl: ".swiper-button-next",
            prevEl: ".swiper-button-prev",
        },

        thumbs: {
            swiper: swiperThumbs,
        },
    });

    //Check color image
    //Khi click nào thuộc tính màu sắc của ảnh, ví dụ đỏ hoặc đen. Khung ảnh  chính (phía trên danh sách Swiper) sẽ di chuyển đến ảnh đã được gán thuộc tính
    //Hệ thống chỉ thực hiện hành động trên khi ảnh của sản phẩm đã được gán vào thuộc tính sản phẩm ở admin controller
    $('input[name="color"]').on('click', function() {
        var idColor = $(this).data('id-color');
        var idProduct = $(this).data('id-product');
        var url     = $(this).data('url');
        console.log(idColor,url);
        $.ajax({
            type: "GET",
            url: url,
            data: {
                    colorID: idColor,
                    productID:idProduct
                  },
            success: function (response) {
                var imageName  = response.imageName;
                console.log(imageName)
                // Tìm tất cả slide của Swiper chính
                let slides = document.querySelectorAll('.mySwiper2 .swiper-slide');

                // Lặp để tìm vị trí của ảnh
                let targetIndex = -1;
                slides.forEach((slide, index) => {
                    let img = slide.querySelector('img');
                    if (img && img.src.includes(imageName)) {
                        targetIndex = index;
                    }
                });

                // Nếu tìm thấy thì chuyển Swiper đến ảnh đó
                if (targetIndex !== -1) {
                    swiperMain.slideToLoop(targetIndex); // slideToLoop nếu bạn đang dùng loop:true
                }
            }
        });
    });

});

// Sự kiện click vào button 'Add to Cart'
$(document).on('click', '.add-to-cart', function(e) {
    e.preventDefault(); // Ngăn click <a> gây reload/trùng lặp

    const itemID            = $(this).data('id');
    var name                = $(this).data('name');
    var url                 = $(this).data('url');
    var thumb               = $(this).data('thumb');
    var selectedColor       = $(this).data('color-id');
    var selectedMaterial    = $(this).data('material-id');

    // In ra console
    console.log('Item Id:', itemID);
    console.log('Item Name:', name);
    console.log('Color Id:', selectedColor);
    console.log('Material ID:', selectedMaterial);
    console.log('Url:', url);

    //Việc còn lại là tạo Ajax, gọi route rồi đưa về controller để xử lý
    $.ajax({
        type: "GET",
        url: url,
        data: {
                itemID: itemID,
                name: name,
                colorID: selectedColor,
                materialID: selectedMaterial,
                },
        success: function (response) {
            //alert('Sản phẩm đã được thêm vào giỏ hàng!');
            console.log(response);
            if(response == 'true'){
                $('#message').find('.book-name').html('Sản phẩm đã được thêm vào giỏ hàng!');
                $('#message').find('.book-description').html('Cám ơn bạn đã ủng hộ sản phẩm của chúng tôi.');
                $('#message').modal('show');
            }else{
                $('#message').find('.book-name').html('Mẫu này đã hết hàng!');
                $('#message').find('.book-description').html('Bạn hãy chọn sản phẩm khác hoặc mẫu còn hàng.');
                $('#message').modal('show');
            }

            //Cập nhật số sản phẩm trên cart badge
            updateCartBadge();
        },
        error: function(xhr) {
            alert('Lỗi thêm sản phẩm: ' + xhr.status);
        }
    });

    //Hàm gọi route tính tổng sản phẩm.
    function updateCartBadge() {
        $.ajax({
            url: '/cart/totalQuantity',
            type: 'GET',
            success: function(data) {
                $('.badge').text(data.totalQuantity);
            }
        });
    }

});
