
// Jquery đồng bộ hóa 2 input là tags name và ids
// Đây là mảng json ánh xạ: ánh xạ giữa tags và ids
console.log(tagToIdMap);
// Xử lý đồng bộ hóa giữa các input text và hidden
$('input[data-role="tagsinput"]').each(function() {
    var $tagInput = $(this);  // Thẻ input chứa tags
    var inputName = $tagInput.attr('name');  // Lấy tên của input (ví dụ: color, slogan, material)
    var $hiddenInput = $('#' + inputName + '_ids');  // Thẻ input hidden chứa id tương ứng

    console.log($tagInput, $hiddenInput);  // Debug để đảm bảo đã lấy đúng các input

    // Xử lý khi tag bị xóa
    $tagInput.on('itemRemoved', function(event) {
        var removedTag = event.item.trim();  // Tên của tag vừa bị xóa
        console.log('Removed tag:', removedTag);  // Kiểm tra tag vừa bị xóa

        // Loại bỏ khoảng trắng, điều này là bắt buộc nếu không phép so sánh chuỗi sẽ bị lỗi khi có khoảng trắng
        removedTag = removedTag.replace(/\s+/g, '');

        // Lấy giá trị id của tag vừa bị xóa thông qua ánh xạ
        var removedTagId = tagToIdMap[removedTag];
        console.log('ID of removed tag:', removedTagId);  // Debug để kiểm tra ID

        // Lấy tất cả các ids hiện tại
        var currentIds = $hiddenInput.val().split(',').map(id => id.trim());

        // Tìm và xóa id tương ứng
        var tagIdIndex = currentIds.indexOf(removedTagId.toString());  // Tìm vị trí của id tương ứng
        if (tagIdIndex > -1) {
            currentIds.splice(tagIdIndex, 1);  // Xóa id
        }

        // Cập nhật lại giá trị của input hidden
        $hiddenInput.val(currentIds.join(','));
        console.log('Updated IDs:', $hiddenInput.val());  // Kiểm tra xem ID đã được cập nhật chưa
    });
});


