// Jquery đồng bộ hóa 2 input là tags name và ids
// Lấy thẻ input tags và input ẩn lưu id
var $tagInput = $('input[name="color"]');
var $hiddenInput = $('input[name="color_ids"]');

// Lưu danh sách các tag ban đầu
var initialTags = $tagInput.val().split(',');

// Theo dõi sự kiện khi tag được xóa
$tagInput.on('itemRemoved', function(event) {
    // Lấy ra giá trị hiện tại của các tags (trước khi xóa)
    var currentTags = initialTags;  // Lấy danh sách các tags trước khi xóa
    var currentIds = $hiddenInput.val().split(',');  // Các id hiện tại

    // Lấy ra tag vừa bị xóa
    var removedTag = event.item;  // Lấy tag name vừa bị xóa

    // Xử lý logic để xóa id tương ứng với tag vừa bị xóa
    var tagIndex = currentTags.indexOf(removedTag);  // Vị trí của tag bị xóa

    console.log('Removed Tag:', removedTag);
    console.log('Tag Index:', tagIndex);

    if (tagIndex > -1) {
        currentIds.splice(tagIndex, 1);  // Xóa id tương ứng với tag
    }

    // Cập nhật lại giá trị cho input ẩn chứa id
    $hiddenInput.val(currentIds.join(','));

    // Cập nhật lại danh sách tags
    initialTags = $tagInput.val().split(',');

    console.log('Updated IDs:', $hiddenInput.val());
});
