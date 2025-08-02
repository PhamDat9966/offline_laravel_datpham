$(document).ready(function() {
    //View modal product
    $('.quick-view-btn').on('click', function() {
        var id              = $(this).data('id');
        var name            = $(this).data('name');
        var description     = $(this).data('description');
        var imageurl        = $(this).data('imageurl');
        var price           = $(this).data('price');
        var salePrice       = $(this).data('sale-price');
        var urlItem         = $(this).data('url-item');

        var colorID         = $(this).data('color-id');
        var materialID      = $(this).data('material-id');
        var colorName       = $(this).data('color-name');
        var materialName    = $(this).data('material-name');

        var urlAddToCart    = $(this).data('url-add-cart');

        var priceAll        = salePrice + '$ <del>'+price+' $</del>';

        //Kiểm tra xem giá có phải là '' hay không. Nếu là '' thì hiển thị 'mẫu đã hết hàng'
        if(price == '' || price == null || price == undefined){
            priceAll        = '<span class="text-danger">Mẫu đã hết hàng</span>';
        }

        //Gán lần lượt các giá trị của product vào modal view
        $('#quick-view').find('.book-name').text(name)
        $('#quick-view').find('.book-description').text(description);
        $('#quick-view').find('.book-picture').attr('src', imageurl);
        $('#quick-view').find('.book-price').html(priceAll);
        $('#quick-view').find('.btn-view-book-detail').attr('href', urlItem);

        //Gán data vào button "chọn mua"
        $('#quick-view').find('.add-to-cart').data('id', id);
        $('#quick-view').find('.add-to-cart').data('name', name);
        $('#quick-view').find('.add-to-cart').data('color-id', colorID);
        $('#quick-view').find('.add-to-cart').data('material-id', materialID);
        $('#quick-view').find('.add-to-cart').data('color-name', colorName);
        $('#quick-view').find('.add-to-cart').data('material-name', materialName);
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

    $('.delete-element-cart').on('click',function(){
        //e.preventDefault(); // tránh chuyển trang nếu là thẻ <a>

        var button = $(this); // lưu lại nút được click
        var url         = $(this).data('url');
        var product_id  = $(this).data('product-id');
        var color_id    = $(this).data('color-id');
        var material_id = $(this).data('material-id');
        console.log(url,product_id,color_id,material_id);

        $.ajax({
            url: url,
            method: "GET",
            data: {
                product_id: product_id,
                color_id: color_id,
                material_id: material_id
            },
            success: function(response) {
                //Xóa sản phẩm ra khỏi giỏ hàng
                $('.cart-item[data-product-id="' + product_id + '"][data-color-id="' + color_id + '"][data-material-id="' + material_id + '"]').fadeOut(300, function() {
                    $(this).remove();
                });
                //Cập nhật số lượng sản phẩm tại badge icon:
                $('.badge').text(response.quantity);
                //Cập nhật tổng giá sản phẩm
                $('.totalPrice').text(response.totalPrice);
            },
            error: function(xhr) {
                alert("Có lỗi xảy ra: " + xhr.responseText);
            }
        });

    });

    //Cập nhật số lượng sản phẩm - Tối ưu hóa với debounce và validation
    var updateQuantityTimeout;
    $('.update-quantity').on('change', function() {
        var $input = $(this);
        var urlUpdateQuantity = $input.data('url-update-quantity');
        var product_id = $input.data('product-id');
        var color_id = $input.data('color-id');
        var material_id = $input.data('material-id');
        var quantity = parseInt($input.val());

        // Validation
        if (isNaN(quantity) || quantity < 1) {
            alert('Số lượng phải là số nguyên dương!');
            $input.val(1); // Reset về 1
            return;
        }

        // Clear previous timeout
        clearTimeout(updateQuantityTimeout);

        // Add loading state
        $input.prop('disabled', true).addClass('loading');

        // Debounce - delay 500ms before making AJAX call
        updateQuantityTimeout = setTimeout(function() {
            console.log('Updating quantity:', {
                url: urlUpdateQuantity,
                product_id: product_id,
                color_id: color_id,
                material_id: material_id,
                quantity: quantity
            });

            $.ajax({
                url: urlUpdateQuantity,
                method: "GET",
                data: {
                    product_id: product_id,
                    color_id: color_id,
                    material_id: material_id,
                    quantity: quantity
                },
                success: function(response) {
                    console.log('Quantity update response:', response);

                    // Cập nhật tổng giá sản phẩm với selector tối ưu
                    var $totalPriceElement = $('.totalPriceElement[data-product-id="' + product_id + '"][data-color-id="' + color_id + '"][data-material-id="' + material_id + '"]');
                    if ($totalPriceElement.length) {
                        $totalPriceElement.text(response.totalPriceElement);
                    }

                    // Cập nhật tổng giá sản phẩm trong cart
                    $('.totalPrice').text(response.totalPrice);

                    // Cập nhật số lượng sản phẩm tại badge icon
                    $('.badge').text(response.quantity);

                    // Show success message (optional)
                    if (response.message) {
                        showNotification(response.message, 'success');
                    }
                },
                error: function(xhr, status, error) {
                    console.error('Error updating quantity:', error);

                    // Show user-friendly error message
                    var errorMessage = 'Có lỗi xảy ra khi cập nhật số lượng!';
                    if (xhr.responseJSON && xhr.responseJSON.message) {
                        errorMessage = xhr.responseJSON.message;
                    }

                    showNotification(errorMessage, 'error');

                    // Revert to previous value if possible
                    var previousValue = $input.data('previous-value') || 1;
                    $input.val(previousValue);
                },
                complete: function() {
                    // Remove loading state
                    $input.prop('disabled', false).removeClass('loading');
                }
            });
        }, 500); // 500ms debounce delay
    });

    // Store previous value when input is focused
    $('.update-quantity').on('focus', function() {
        $(this).data('previous-value', $(this).val());
    });

    // Helper function to show notifications
    function showNotification(message, type) {
        // Create notification element
        var $notification = $('<div class="notification notification-' + type + '">' + message + '</div>');

        // Add styles
        $notification.css({
            position: 'fixed',
            top: '20px',
            right: '20px',
            padding: '10px 15px',
            borderRadius: '5px',
            color: 'white',
            zIndex: 9999,
            fontSize: '14px',
            fontWeight: 'bold'
        });

        // Set background color based on type
        if (type === 'success') {
            $notification.css('backgroundColor', '#28a745');
        } else if (type === 'error') {
            $notification.css('backgroundColor', '#dc3545');
        }

        // Add to body
        $('body').append($notification);

        // Auto remove after 3 seconds
        setTimeout(function() {
            $notification.fadeOut(300, function() {
                $(this).remove();
            });
        }, 3000);
    }
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
    var productName         = $(this).data('name');
    var url                 = $(this).data('url');
    var thumb               = $(this).data('thumb');
    var selectedColor       = $(this).data('color-id');
    var selectedMaterial    = $(this).data('material-id');
    var colorName           = $(this).data('color-name');
    var materialName        = $(this).data('material-name');

    // In ra console
    console.log('Item Id:', itemID);
    console.log('Item Name:', name);
    console.log('Color Id:', selectedColor,'-',colorName);
    console.log('Material ID:', selectedMaterial,'-',materialName);
    console.log('Url:', url);

    //Việc còn lại là tạo Ajax, gọi route rồi đưa về controller để xử lý
    $.ajax({
        type: "GET",
        url: url,
        data: {
                itemID: itemID,
                productName: productName,
                colorID: selectedColor,
                materialID: selectedMaterial,
                colorName:colorName,
                materialName:materialName
                },
        success: function (response) {
            //alert('Sản phẩm đã được thêm vào giỏ hàng!');
            console.log(response);
            if(response == 'true'){
                $('#message').find('.book-name')
                    .removeClass('text-danger')     // Xoá class cũ (nếu có)
                    .addClass('text-success')       // Thêm màu xanh
                    .html('Sản phẩm đã được thêm vào giỏ hàng!');

                $('#message').find('.book-description')
                    .html('Cám ơn bạn đã ủng hộ sản phẩm của chúng tôi.');

                $('#message').modal('show');
            }else{
                $('#message').find('.book-name')
                    .removeClass('text-success')    // Xoá class cũ (nếu có)
                    .addClass('text-danger')        // Thêm màu đỏ
                    .html('Mẫu này đã hết hàng!');

                $('#message').find('.book-description')
                    .html('Bạn hãy chọn sản phẩm khác hoặc mẫu còn hàng.');

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
