// $(document).ready(function() {
//     // Gửi yêu cầu Ajax đến /run-daily-task khi trang được tải
//     $.ajax({
//         url: '/run-daily-task',
//         type: 'GET',
//         success: function(response) {
//             console.log(response.message);
//         },
//         error: function(response) {
//             console.log('Failed to run daily task.');
//         }
//     });

// });

$(document).ready(function() {
     $.ajax({
         url: dailyTaskUrl,
         type: 'GET',
         success: function(response) {
             console.log(response.message);
         },
         error: function(response) {
             console.log('Failed to run daily task.');
         }
     });
 });
