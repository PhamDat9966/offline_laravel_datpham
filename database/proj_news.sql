-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th6 29, 2024 lúc 03:14 PM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `proj_news`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `article`
--

CREATE TABLE `article` (
  `id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `content` text DEFAULT NULL,
  `status` varchar(225) DEFAULT NULL,
  `thumb` varchar(255) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `modified_by` varchar(255) DEFAULT NULL,
  `publish_at` date DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

--
-- Đang đổ dữ liệu cho bảng `article`
--

INSERT INTO `article` (`id`, `category_id`, `name`, `content`, `status`, `thumb`, `created`, `created_by`, `modified`, `modified_by`, `publish_at`, `type`) VALUES
(4, 1, 'Liverpool chỉ được nâng Cup phiên bản nếu vô địch hôm nay', '<p>Đội b&oacute;ng th&agrave;nh phố cảng sẽ kh&ocirc;ng n&acirc;ng Cup nguy&ecirc;n bản nếu vượt mặt Man City ở v&ograve;ng cuối Ngoại hạng Anh.</p>\n\n<p>Liverpool k&eacute;m Man City một điểm trước khi tiếp Wolverhampton tr&ecirc;n s&acirc;n nh&agrave; Anfield v&agrave;o ng&agrave;y Chủ Nhật. Ở trận đấu c&ugrave;ng giờ, Man City sẽ l&agrave;m kh&aacute;ch tới s&acirc;n Brighton v&agrave; biết một chiến thắng sẽ gi&uacute;p họ bảo vệ th&agrave;nh c&ocirc;ng ng&ocirc;i v&ocirc; địch. Kể từ khi c&aacute;c trận v&ograve;ng cuối Ngoại hạng Anh sẽ chơi đồng loạt c&ugrave;ng l&uacute;c, ban tổ chức phải đặt một chiếc cup phi&ecirc;n bản giống thật tại Anfield ph&ograve;ng trường hợp Liverpool v&ocirc; địch. Chiếc cup giả n&agrave;y thường được d&ugrave;ng trong c&aacute;c sự kiện quảng b&aacute; của Ngoại hạng Anh.&nbsp;</p>', 'active', 'L3Yuzln8II.png', '2019-05-04 00:00:00', 'hailan', '2019-05-17 00:00:00', 'hailan', '2019-04-29', 'normal'),
(5, 1, 'Bottas giành pole chặng thứ ba liên tiếp', '<p>Tay đua Phần Lan đ&aacute;nh bại đồng đội Lewis Hamilton ở v&ograve;ng ph&acirc;n hạng GP T&acirc;y Ban Nha h&ocirc;m 11/5.</p>\r\n\r\n<p>Valtteri Bottas nhanh hơn Hamilton 0,634 gi&acirc;y v&agrave; nhanh hơn người về thứ ba&nbsp;Sebastian Vettel 0,866 gi&acirc;y. Tay đua của Red Bull&nbsp;Max Verstappen nhanh thứ tư, trong khi&nbsp;Charles Leclerc về thứ năm.</p>', 'active', 'iQ1RXPioFZ.jpeg', '2019-05-04 00:00:00', 'hailan', '2019-05-17 00:00:00', 'hailan', '2019-04-28', 'normal'),
(6, 1, 'HLV Cardiff: \'Man Utd sẽ không vô địch trong 10 năm tới\'', '<p>Neil Warnock tỏ ra nghi ngờ về tương lai của Man Utd dưới thời HLV Solskjaer.</p>\r\n\r\n<p>&quot;Một số người nghĩ Man Utd cần từ hai đến ba kỳ chuyển nhượng nữa để gi&agrave;nh danh hiệu&quot;, HLV Neil Warnock chia sẻ. &quot;T&ocirc;i th&igrave; nghĩ c&oacute; thể l&agrave; 10 năm. T&ocirc;i kh&ocirc;ng thấy học&oacute; khả năng bắt kịp hai CLB h&agrave;ng đầu trong khoảng bốn hay năm năm tới&quot;.</p>\r\n\r\n<p>Lần cuối Man Utd v&ocirc; địch l&agrave; m&ugrave;a 2012-2013 dưới thời HLV Sir Alex Ferguson. Kể từ đ&oacute; đến nay, &quot;Quỷ đỏ&quot; kh&ocirc;ng c&ograve;n duy tr&igrave; được vị thế ứng cử vi&ecirc;n v&ocirc; địch h&agrave;ng đầu.&nbsp;</p>', 'active', 'ReChSfB95C.jpeg', '2019-05-04 00:00:00', 'hailan', '2019-05-17 00:00:00', 'hailan', '2019-05-30', 'normal'),
(7, 2, 'Đại học Anh đưa khóa học hạnh phúc vào chương trình giảng dạy', '<p>Kh&oacute;a học diễn ra trong 12 tuần, sinh vi&ecirc;n năm nhất Đại học Bristol sẽ được kh&aacute;m ph&aacute; hạnh ph&uacute;c l&agrave; g&igrave; v&agrave; l&agrave;m thế n&agrave;o để đạt được n&oacute;.</p>\r\n\r\n<p>Đại học Bristol (Anh) quyết định đưa kh&oacute;a học hạnh ph&uacute;c v&agrave;o giảng dạy từ th&aacute;ng 9 năm nay nhằm giảm thiểu t&igrave;nh trạng tự tử ở sinh vi&ecirc;n, sau khi 12 sinh vi&ecirc;n ở một trường kh&aacute;c quy&ecirc;n sinh trong ba năm qua. Gi&aacute;o sư Bruce Hood, nh&agrave; t&acirc;m l&yacute; học chuy&ecirc;n nghi&ecirc;n cứu về c&aacute;ch thức hoạt động của bộ n&atilde;o v&agrave; con người, sẽ giảng dạy m&ocirc;n học mới n&agrave;y.</p>', 'active', 'hoyOyXJrzx.png', '2019-05-04 00:00:00', 'hailan', '2019-05-17 00:00:00', 'hailan', '2019-05-05', 'normal'),
(8, 6, '11 cách đơn giản dạy trẻ quản lý thời gian', '<p>Phụ huynh h&atilde;y tạo cảm gi&aacute;c vui vẻ, hướng dẫn trẻ thiết lập những ưu ti&ecirc;n h&agrave;ng ng&agrave;y để ch&uacute;ng c&oacute; thể tự quản l&yacute; thời gian hiệu quả.</p>\r\n\r\n<p>&quot;Nhanh l&ecirc;n&quot;, &quot;Con c&oacute; biết mấy giờ rồi kh&ocirc;ng&quot;, &quot;Điều g&igrave; l&agrave;m con mất nhiều thời gian như vậy&quot;..., l&agrave; những c&acirc;u n&oacute;i quen thuộc của phụ huynh để nhắc nhở con về kh&aacute;i niệm thời gian. Thay v&igrave; n&oacute;i những c&acirc;u tr&ecirc;n, phụ huynh c&oacute; thể dạy con c&aacute;ch quản l&yacute; giờ giấc ngay từ khi ch&uacute;ng c&ograve;n nhỏ.</p>', 'active', 'Phe2pSOC5Q.jpeg', '2019-05-04 00:00:00', 'hailan', '2023-11-17 00:00:00', 'phamdat', '2019-07-30', 'normal'),
(9, 3, 'Vì sao không hút thuốc vẫn bị ung thư phổi?', '<p>D&ugrave; kh&ocirc;ng h&uacute;t thuốc, bạn vẫn c&oacute; nguy cơ ung thư phổi do h&iacute;t phải kh&oacute;i thuốc, tiếp x&uacute;c với kh&iacute; radon hoặc sống trong m&ocirc;i trường &ocirc; nhiễm.&nbsp;</p>\r\n\r\n<p>Người kh&ocirc;ng h&uacute;t thuốc vẫn c&oacute; thể bị ung thư phổi.&nbsp;Tr&ecirc;n&nbsp;<em>Journal of the Royal Society of Medicine</em>,&nbsp;c&aacute;c nh&agrave; khoa học từ&nbsp;Hiệp hội Ung thư Mỹ cho biết 20% bệnh nh&acirc;n ung thư phổi kh&ocirc;ng bao giờ h&uacute;t thuốc.&nbsp;Nghi&ecirc;n cứu 30 năm tr&ecirc;n 1,2 triệu người của tổ chức n&agrave;y cũng chỉ ra số người kh&ocirc;ng h&uacute;t thuốc bị ung thư phổi đang gia tăng. Hầu hết bệnh nh&acirc;n chỉ được chẩn đo&aacute;n khi đ&atilde; bước sang giai đoạn nghi&ecirc;m trọng kh&ocirc;ng thể điều trị.&nbsp;</p>', 'active', 'tPa7bgOesm.png', '2019-05-04 00:00:00', 'hailan', '2019-05-17 00:00:00', 'hailan', '2019-08-30', 'normal'),
(10, 4, '10 hãng hàng không  tốt nhất thế giới năm 2019', '<p>Qatar l&agrave; quốc gia duy nhất tr&ecirc;n thế giới c&oacute; h&atilde;ng h&agrave;ng kh&ocirc;ng v&agrave; s&acirc;n bay tốt nhất năm 2019.</p>\r\n\r\n<p>C&aacute;c s&acirc;n bay được đ&aacute;nh gi&aacute; dựa tr&ecirc;n 3 yếu tố: hiệu suất đ&uacute;ng giờ, chất lượng dịch vụ, thực phẩm v&agrave; lựa chọn mua sắm. Yếu tố đầu ti&ecirc;n chiếm 60% số điểm, hai ti&ecirc;u ch&iacute; c&ograve;n lại chiếm 20%. Dữ liệu của AirHelp được dựa tr&ecirc;n thống k&ecirc; từ nhiều nh&agrave; cung cấp thương mại, c&ugrave;ng cơ sở dữ liệu đ&aacute;nh gi&aacute; ri&ecirc;ng v&agrave; 40.000 khảo s&aacute;t h&agrave;nh kh&aacute;ch được thu thập từ hơn 40 quốc gia trong năm 2018.</p>', 'active', '8GlYE3KYtZ.png', '2019-05-04 00:00:00', 'hailan', '2019-05-17 00:00:00', 'hailan', '2019-09-30', 'normal'),
(11, 5, 'Phát hiện bụt mọc cổ thụ hơn 2.600 tuổi ở Mỹ', '<p>Ph&aacute;t hiện mới gi&uacute;p bụt mọc trở th&agrave;nh một trong những c&acirc;y sinh sản hữu t&iacute;nh gi&agrave; nhất thế giới, vượt xa ước t&iacute;nh trước đ&acirc;y của c&aacute;c chuy&ecirc;n gia.</p>\r\n\r\n<p>C&aacute;c nh&agrave; khoa học ph&aacute;t hiện một c&acirc;y bụt mọc &iacute;t nhất đ&atilde; 2.624 tuổi ở v&ugrave;ng đầm lầy s&ocirc;ng Black, bang Bắc Carolina, Mỹ, theo nghi&ecirc;n cứu đăng tr&ecirc;n tạp ch&iacute;&nbsp;<em>Environmental Research Communications</em>&nbsp;h&ocirc;m 9/5.&nbsp;</p>\r\n\r\n<p>Nh&oacute;m nghi&ecirc;n cứu bắt gặp bụt mọc cổ thụ n&agrave;y trong l&uacute;c nghi&ecirc;n cứu v&ograve;ng tuổi của c&acirc;y để t&igrave;m hiểu về lịch sử kh&iacute; hậu tại miền đ&ocirc;ng nước Mỹ. Ngo&agrave;i thể hiện tuổi thọ, độ rộng v&agrave; m&agrave;u sắc của v&ograve;ng tuổi tr&ecirc;n th&acirc;n c&acirc;y c&ograve;n cho biết mức độ ẩm ướt hay kh&ocirc; hạn của năm tương ứng.</p>', 'active', 'a09zB7BiwV.jpeg', '2019-05-12 00:00:00', 'hailan', '2019-05-17 00:00:00', 'hailan', '2019-05-12', 'normal'),
(12, 6, 'Apple có thể không nâng cấp iOS 13 cho iPhone SE, 6', '<p>Những mẫu iPhone ra mắt từ 2014 v&agrave; iPhone SE c&oacute; thể kh&ocirc;ng được l&ecirc;n đời hệ điều h&agrave;nh iOS 13 ra mắt th&aacute;ng 6 tới.</p>\r\n\r\n<p>Theo&nbsp;<em>Phone Arena</em>, hệ điều h&agrave;nh iOS 13 sắp tr&igrave;nh l&agrave;ng tại hội nghị WWDC 2019 sẽ kh&ocirc;ng hỗ trợ một loạt iPhone đời cũ của Apple. Trong đ&oacute;, đ&aacute;ng ch&uacute; &yacute; l&agrave; c&aacute;c mẫu iPhone vẫn c&ograve;n được nhiều người d&ugrave;ng sử dụng như iPhone 6, 6s Plus hay SE.&nbsp;</p>', 'active', '9jOZGc7BJK.png', '2019-05-12 00:00:00', 'hailan', '2019-05-17 00:00:00', 'hailan', '2019-05-10', 'normal'),
(13, 7, 'Hình dung về Honda Jazz thế hệ mới', '<p>Thế hệ thứ tư của mẫu hatchback Honda tiết chế bớt những đường n&eacute;t g&acirc;n guốc, thể thao để thay bằng n&eacute;t trung t&iacute;nh, hợp mắt người d&ugrave;ng hơn.&nbsp;</p>\r\n\r\n<p>Những h&igrave;nh ảnh đầu ti&ecirc;n về Honda Jazz (Fit tại Nhật Bản) thế hệ mới bắt đầu xuất hiện tr&ecirc;n đường thử. D&ugrave; chưa phải thiết kế ho&agrave;n chỉnh, thay đổi của mẫu hatchback cỡ B cho thấy những đường n&eacute;t trung t&iacute;nh m&agrave; xe sắp sở hữu. Điều n&agrave;y tr&aacute;i ngược với tạo h&igrave;nh g&acirc;n guốc, thể thao ở thế hệ thứ ba hiện tại của Jazz.&nbsp;</p>', 'active', 'g2c7mYXBPW.png', '2019-05-12 00:00:00', 'hailan', '2019-05-17 00:00:00', 'hailan', '2019-05-12', 'normal'),
(14, 1, 'Hà Nội vào vòng knock-out AFC Cup', '<p>ĐKVĐ V-League đ&aacute;nh bại&nbsp;Tampines Rovers 2-0 v&agrave;o chiều 15/5 để đứng đầu bảng F.</p>\r\n\r\n<p>Tiếp đối thủ đến từ Singapore trong t&igrave;nh thế buộc phải thắng để tự quyết v&eacute; đi tiếp, H&agrave; Nội đ&atilde; c&oacute; trận đấu dễ d&agrave;ng. C&oacute; thể n&oacute;i, kết quả của trận đấu được định đoạt trong hiệp một khi Oseni v&agrave; Th&agrave;nh Chung lần lượt ghi b&agrave;n cho đội chủ nh&agrave;. Trong khi đ&oacute;, Tampines Rovers phải trả gi&aacute; cho lối chơi th&ocirc; bạo khi Yasir Hanapi nhận thẻ v&agrave;ng thứ hai rời s&acirc;n. Tiền vệ n&agrave;y bị trừng phạt bởi pha đ&aacute;nh nguội với Th&agrave;nh Chung ở đầu trận, sau đ&oacute; l&agrave; t&igrave;nh huống phạm lỗi &aacute;c &yacute; với Đ&igrave;nh Trọng.</p>', 'inactive', 'e7YyFZJCc8.jpeg', '2019-05-15 00:00:00', 'hailan', '2019-05-17 00:00:00', 'hailan', '2019-05-10', 'normal'),
(15, 1, 'Man City vẫn dự Champions League mùa 2019-2020', '<p>Việc điều tra vi phạm luật c&ocirc;ng bằng t&agrave;i ch&iacute;nh của chủ s&acirc;n Etihad chưa thể ho&agrave;n th&agrave;nh trong v&ograve;ng một năm tới.</p>\r\n\r\n<p><em>Sports Mail</em>&nbsp;(Anh)&nbsp;cho biết, &aacute;n phạt cấm tham dự Champions League một m&ugrave;a với Man City, do vi phạm luật c&ocirc;ng bằng t&agrave;i ch&iacute;nh (FFP), chỉ được đưa ra sớm nhất v&agrave;o m&ugrave;a 2020-2021.</p>\r\n\r\n<p>Trong bức thư ngỏ gửi tới truyền th&ocirc;ng Anh, Man City viết: &quot;Ch&uacute;ng t&ocirc;i hợp t&aacute;c một c&aacute;ch thiện ch&iacute; với Tiểu ban kiểm so&aacute;t t&agrave;i ch&iacute;nh c&aacute;c CLB của UEFA (CFCB). CLB tin tưởng v&agrave;o sự độc lập v&agrave; cam kết của CFCB h&ocirc;m 7/3, rằng sẽ kh&ocirc;ng kết luận g&igrave; trong thời gian điều tra&quot;.</p>', 'active', 'exzJEG4WDU.jpeg', '2019-05-15 00:00:00', 'hailan', '2019-05-17 00:00:00', 'hailan', '2019-05-10', 'normal'),
(16, 2, 'Những câu đố giúp rèn luyện trí não', '<p>Bạn cần quan s&aacute;t, suy luận logic v&agrave; c&oacute; vốn từ vựng tiếng Anh để giải quyết những c&acirc;u đố dưới đ&acirc;y.</p>\r\n\r\n<p>C&acirc;u 1:&nbsp;Mike đến một buổi phỏng vấn xin việc. Anh đ&atilde; g&acirc;y ấn tượng với gi&aacute;m đốc về những kỹ năng v&agrave; kinh nghiệm của m&igrave;nh. Tuy nhi&ecirc;n, để quyết định c&oacute; nhận Mike hay kh&ocirc;ng, nữ gi&aacute;m đốc đưa ra một c&acirc;u đố h&oacute;c b&uacute;a v&agrave; y&ecirc;u cầu Mike trả lời trong 30 gi&acirc;y.</p>\r\n\r\n<p>Nội dung c&acirc;u đố: H&atilde;y đưa ra 30 từ tiếng Anh kh&ocirc;ng c&oacute; chữ &quot;a&quot; xuất hiện trong đ&oacute;?&nbsp;</p>\r\n\r\n<p>Mike dễ d&agrave;ng giải quyết c&acirc;u đố. Theo bạn anh ấy n&oacute;i những từ tiếng Anh n&agrave;o để kịp trả lời trong 30 gi&acirc;y?</p>', 'active', 'TpcocqUjob.png', '2019-05-15 00:00:00', 'hailan', '2024-01-30 00:00:00', 'admin', '2019-05-10', 'feature'),
(17, 3, 'Cách nhận biết mật ong nguyên chất và pha trộn', '<p>Mật ong nguy&ecirc;n chất sẽ kh&ocirc;ng thấm qua tờ giấy, lắng xuống đ&aacute;y ly nước v&agrave; bị kiến ăn, kh&aacute;c với mật ong bị pha trộn tạp chất.</p>\r\n\r\n<p>Dược sĩ V&otilde; H&ugrave;ng Mạnh, Trưởng khoa Dược Bệnh viện Y học d&acirc;n tộc cổ truyền B&igrave;nh Định, cho biết thị trường c&oacute; nhiều loại mật ong bị pha trộn, chỉ nh&igrave;n bề ngo&agrave;i hay ngửi m&ugrave;i chưa chắc ph&acirc;n biệt được.</p>\r\n\r\n<p>Theo dược sĩ H&ugrave;ng, một c&aacute;ch ph&acirc;n biệt thật giả l&agrave; lấy cọng h&agrave;nh tươi nh&uacute;ng v&agrave;o lọ mật ong, lấy ra chừng v&agrave;i ph&uacute;t. Cọng l&aacute; h&agrave;nh sẽ chuyển từ m&agrave;u xanh l&aacute; sang sậm nếu mật ong thật. Ngo&agrave;i ra, c&oacute; thể nhỏ giọt mật v&agrave;o nơi c&oacute; kiến, nếu kiến kh&ocirc;ng bu giọt mật th&igrave; cũng l&agrave; mật ong thật.</p>\r\n\r\n<p>Ng&agrave;y nay, nhiều người đặt mật ong v&agrave;o ngăn đ&aacute; tủ lạnh, sau 24 giờ m&agrave; kh&ocirc;ng c&oacute; hiện tượng đ&ocirc;ng đ&aacute; th&igrave; l&agrave; mật thật.</p>', 'active', 'xvEqmF5uyJ.png', '2019-05-15 00:00:00', 'hailan', '2019-05-17 00:00:00', 'hailan', '2019-05-10', 'normal'),
(18, 4, 'Nhiều tour mùa hè giảm giá hàng chục triệu đồng', '<p>C&aacute;c tour trong v&agrave; ngo&agrave;i nước đều được giảm gi&aacute; mạnh để k&iacute;ch cầu du lịch trong dịp h&egrave;, nhiều chương tr&igrave;nh khuyến m&atilde;i l&ecirc;n đến h&agrave;ng chục triệu đồng.</p>\r\n\r\n<p>Sau khi so s&aacute;nh tiền v&eacute; m&aacute;y bay, ph&ograve;ng kh&aacute;ch sạn ở Bali để chuẩn bị cho kỳ nghỉ h&egrave; của gia đ&igrave;nh, anh Sơn (ngụ quận 2, TP HCM) quyết định chuyển sang mua tour trọn g&oacute;i v&igrave; tiết kiệm hơn.</p>', 'active', 'd2ABCeBzoR.jpeg', '2019-05-15 00:00:00', 'hailan', '2019-05-17 00:00:00', 'hailan', '2019-05-15', 'normal'),
(19, 7, 'BMW i8 Roadster - xe mui trần dẫn đường ở Formula E', '<p>Dịp cuối tuần qua, BMW giới thiệu chiếc xe dẫn đường, l&agrave;m nhiệm vụ đảm bảo an to&agrave;n tại giải đua xe Formula E. Giải đua tương tự giải F1, nhưng to&agrave;n bộ xe đua sử dụng động cơ điện.</p>\r\n\r\n<p>i8 Roadster Safety Car dựa tr&ecirc;n chiếc i8 Roadster ti&ecirc;u chuẩn, nhưng c&oacute; những thay đổi để trở th&agrave;nh chiếc xe dẫn đường chuy&ecirc;n dụng. Ngoại h&igrave;nh c&oacute; một số đặc điểm ấn tượng hơn so với nguy&ecirc;n bản. K&iacute;nh chắn gi&oacute; kiểu d&agrave;nh cho xe đua, trọng t&acirc;m hạ thấp 15 mm.</p>', 'active', '9fbeUKTBpU.png', '2019-05-15 00:00:00', 'hailan', '2019-05-17 00:00:00', 'hailan', '2019-05-10', 'normal'),
(20, 2, 'Tia cực tím tại Hà Nội ở mức \'nguy hiểm\'', '<p>Chỉ số tia UV tại H&agrave; Nội ng&agrave;y 18-19/5 l&ecirc;n tới 11, mức được đ&aacute;nh gi&aacute; l&agrave; &quot;nguy hiểm&quot; dễ khiến da, mắt bị bỏng nhiệt.</p>\r\n\r\n<p>H&agrave; Nội đang trải qua đợt nắng n&oacute;ng gay gắt. Theo Trung t&acirc;m Dự b&aacute;o Kh&iacute; tượng Thủy văn Quốc gia, nhiệt độ cao nhất ở H&agrave; Nội ng&agrave;y 18/5 dao động trong khoảng 37 đến 39 độ C, c&oacute; nơi tr&ecirc;n 39 độ.&nbsp;Trang&nbsp;<em>World Weather Online</em>&nbsp;của Anh dự b&aacute;o chỉ số tia cực t&iacute;m tại H&agrave; Nội hai ng&agrave;y 18-19/5 đạt mức 11.&nbsp;</p>', 'active', 'C4DtP4ico8.png', '2019-05-17 00:00:00', 'hailan', '2024-02-19 00:00:00', 'admin', '2019-05-16', 'normal'),
(21, 2, 'Blockchain và trí tuệ nhân tạo AI làm thay đổi giáo dục trực tuyến', '<p>Blockchain khiến dữ liệu trở n&ecirc;n c&ocirc;ng khai, minh bạch với người học, AI gi&uacute;p cải thiện khả năng tương t&aacute;c v&agrave; giảng dạy với từng c&aacute; nh&acirc;n.</p>\r\n\r\n<p>Sự b&ugrave;ng nổ của Internet v&agrave; những c&ocirc;ng nghệ mới như chuỗi khối (Blockchain) v&agrave; tr&iacute; tuệ nh&acirc;n tạo (AI) đ&atilde; g&oacute;p phần l&agrave;m thay đổi nền gi&aacute;o dục tr&ecirc;n to&agrave;n thế giới, h&igrave;nh th&agrave;nh những nền tảng Online Learning với nhiều ưu thế.</p>\r\n\r\n<p><strong>Mobile Learning dự b&aacute;o l&agrave; &quot;Cuộc c&aacute;ch mạng tiếp theo&quot; của gi&aacute;o dục trực tuyến</strong></p>\r\n\r\n<p>Theo nghi&ecirc;n cứu của Global Market Insights, thị trường gi&aacute;o dục trực tuyến to&agrave;n cầu đang c&oacute; tốc độ ph&aacute;t triển nhanh chưa từng thấy khi nền tảng hạ tầng Internet ng&agrave;y c&agrave;ng ho&agrave;n thiện v&agrave; phủ s&oacute;ng rộng khắp. Gi&aacute; trị c&aacute;c start-up về EdTech (C&ocirc;ng ty c&ocirc;ng nghệ chuy&ecirc;n về gi&aacute;o dục) to&agrave;n cầu được ước t&iacute;nh hơn 190 tỷ USD v&agrave;o năm 2018 v&agrave; dự kiến vượt hơn 300 tỷ USD v&agrave;o năm 2025.</p>', 'active', 'gCPGos7mhY.png', '2019-05-17 00:00:00', 'hailan', '2019-05-17 00:00:00', 'hailan', '2019-05-16', 'normal'),
(22, 6, 'Huawei nói lệnh cấm sẽ khiến Mỹ tụt hậu về 5G', '<p>Huawei khẳng định sắc lệnh mới của Mỹ sẽ chỉ c&agrave;ng khiến qu&aacute; tr&igrave;nh triển khai c&ocirc;ng nghệ 5G ở nước n&agrave;y th&ecirc;m chậm chạp v&agrave; đắt đỏ.</p>\r\n\r\n<p>H&atilde;ng c&ocirc;ng nghệ Trung Quốc tự nhận l&agrave; &quot;người dẫn đầu kh&ocirc;ng ai s&aacute;nh kịp về c&ocirc;ng nghệ 5G&quot;, n&ecirc;n việc bị hạn chế kinh doanh ở Mỹ chỉ dẫn đến kết cục l&agrave; Mỹ sẽ bị &quot;tụt lại ph&iacute;a sau&quot; trong việc triển khai c&ocirc;ng nghệ kết nối di động thế hệ mới</p>', 'active', 'nt1QxhKUXM.jpeg', '2019-05-17 00:00:00', 'hailan', '2023-11-12 00:00:00', 'phamdat', '2019-05-16', 'normal'),
(23, 6, 'Asus ra mắt Zenfone 6 với camera lật tự động', '<p>Với thiết kế m&agrave;n h&igrave;nh tr&agrave;n viền ho&agrave;n to&agrave;n kh&ocirc;ng tai thỏ, camera ch&iacute;nh 48 megapixel tr&ecirc;n Zenfone 6 c&oacute; thể lật từ sau ra trước biến th&agrave;nh camera selfie.</p>\r\n\r\n<p>Zenfone 6 l&agrave; một trong những smartphone c&oacute; viền m&agrave;n h&igrave;nh mỏng nhất tr&ecirc;n thị trường với tỷ lệ m&agrave;n h&igrave;nh hiển thị chiếm tới 92% diện t&iacute;ch mặt trước. M&aacute;y c&oacute; m&agrave;n h&igrave;nh 6,4 inch tr&agrave;n viền ra cả bốn cạnh, kh&ocirc;ng tai thỏ như một số mẫu Zenfone trước v&agrave; cũng kh&ocirc;ng d&ugrave;ng thiết kế đục lỗ như Galaxy S10, S10+...</p>', 'inactive', 'aiC6j6fWZY.png', '2019-05-17 00:00:00', 'hailan', '2024-03-22 00:00:00', 'dat123', '2019-05-16', 'normal');

--
-- Bẫy `article`
--
DELIMITER $$
CREATE TRIGGER `updateTotalElementsAfterDeleteArticle` AFTER DELETE ON `article` FOR EACH ROW BEGIN
  UPDATE `totalelements`
  SET ElementCount = ElementCount - 1
  WHERE `TableName` = 'article';
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `updateTotalElementsAfterUpdateArticle` AFTER UPDATE ON `article` FOR EACH ROW BEGIN
  -- Assuming that the primary key of the article table is 'id'
  IF NEW.id <> OLD.id THEN
    UPDATE `totalelements`
    SET ElementCount = ElementCount + 1
    WHERE `TableName` = 'article';
  END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `updateTotalElementsArticle` AFTER INSERT ON `article` FOR EACH ROW BEGIN
  UPDATE `totalelements`
  SET ElementCount = ElementCount + 1
  WHERE `TableName` = 'article';
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `article_views`
--

CREATE TABLE `article_views` (
  `id` int(11) NOT NULL,
  `article_id` int(11) DEFAULT NULL,
  `views` int(11) DEFAULT 0,
  `created` datetime NOT NULL DEFAULT current_timestamp(),
  `status` varchar(255) DEFAULT NULL,
  `modified` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Đang đổ dữ liệu cho bảng `article_views`
--

INSERT INTO `article_views` (`id`, `article_id`, `views`, `created`, `status`, `modified`) VALUES
(1, 23, 1, '2024-02-29 00:00:00', 'active', '2024-02-29 13:46:40'),
(2, 16, 2, '2024-03-12 00:00:00', 'active', '2024-03-12 09:05:57'),
(3, 15, 2, '2024-03-25 00:00:00', 'active', '2024-03-25 14:44:49'),
(4, 21, 1, '2024-06-17 00:00:00', 'active', '2024-06-17 23:55:11'),
(5, 22, 1, '2024-06-17 00:00:00', 'active', '2024-06-17 23:56:14');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` text NOT NULL,
  `ordering` int(11) DEFAULT NULL,
  `is_home` tinyint(1) DEFAULT NULL,
  `display` varchar(255) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `created_by` varchar(45) DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `modified_by` varchar(45) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=DYNAMIC;

--
-- Đang đổ dữ liệu cho bảng `category`
--

INSERT INTO `category` (`id`, `name`, `status`, `ordering`, `is_home`, `display`, `created`, `created_by`, `modified`, `modified_by`) VALUES
(1, 'Thể thao', 'active', 1, 1, 'list', '2019-05-04 00:00:00', 'admin', '2019-05-12 00:00:00', 'hailan'),
(2, 'Giáo dục', 'inactive', 3, 1, 'list', '2019-05-04 00:00:00', 'admin', '2024-03-20 00:00:00', 'admin'),
(3, 'Sức khỏe', 'active', 4, 0, 'list', '2019-05-04 00:00:00', 'admin', '2024-03-20 00:00:00', 'admin'),
(4, 'Du lịch', 'inactive', 7, 0, 'list', '2019-05-04 00:00:00', 'admin', '2024-03-22 00:00:00', 'admin'),
(5, 'Khoa học', 'active', 8, 1, 'grid', '2019-05-04 00:00:00', 'admin', '2024-03-22 00:00:00', 'dat123'),
(6, 'Số hóa', 'active', 9, 1, 'grid', '2019-05-04 00:00:00', 'admin', '2024-03-22 00:00:00', 'dat123'),
(7, 'Xe - Ô tô', 'inactive', 14, 0, 'list', '2019-05-04 00:00:00', 'admin', '2024-03-25 00:00:00', 'admin'),
(8, 'Kinh doanh', 'active', 17, 1, 'list', '2019-05-16 00:00:00', 'hailan', '2024-03-22 00:00:00', 'dat123');

--
-- Bẫy `category`
--
DELIMITER $$
CREATE TRIGGER `updateTotalElements` AFTER INSERT ON `category` FOR EACH ROW BEGIN
  UPDATE totalelements
  SET ElementCount = ElementCount + 1
  WHERE TableName = 'category';
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `updateTotalElementsAfterDelete` AFTER DELETE ON `category` FOR EACH ROW BEGIN
  UPDATE totalelements
  SET ElementCount = ElementCount - 1
  WHERE TableName = 'category';
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `updateTotalElementsAfterUpdate` AFTER UPDATE ON `category` FOR EACH ROW BEGIN
  -- Assuming that the primary key of the article table is 'id'
  IF NEW.id <> OLD.id THEN
    UPDATE totalelements
    SET ElementCount = ElementCount + 1
    WHERE TableName = 'category';
  END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `menu`
--

CREATE TABLE `menu` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` varchar(10) DEFAULT '''0''',
  `url` varchar(255) NOT NULL,
  `ordering` int(11) DEFAULT NULL,
  `type_menu` varchar(255) DEFAULT NULL,
  `type_open` varchar(255) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `container` varchar(255) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `created_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `modified_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Đang đổ dữ liệu cho bảng `menu`
--

INSERT INTO `menu` (`id`, `name`, `status`, `url`, `ordering`, `type_menu`, `type_open`, `parent_id`, `container`, `note`, `created`, `created_by`, `modified`, `modified_by`) VALUES
(1, 'Trang chủ', 'active', '/', 1, 'link', 'new_window', NULL, NULL, 'main-menu', NULL, NULL, '2024-03-22 00:00:00', 'dat123'),
(2, 'Sản phẩm', 'active', '#', 2, 'category_product', 'current', NULL, NULL, '<p>main-menu</p>', NULL, NULL, '2024-03-26 00:00:00', 'admin'),
(3, 'Blog', 'active', '#', 3, 'category_article', 'current', NULL, NULL, '<p>main-menu</p>', NULL, NULL, '2024-03-26 00:00:00', 'admin'),
(4, 'câu đố trí não', 'active', '/bai-viet/nhung-cau-do-giup-ren-luyen-tri-nao-16.php', 4, 'link', 'current', 3, NULL, NULL, NULL, NULL, '2024-03-26 00:00:00', 'admin'),
(5, 'Test-02', 'inactive', '#', 6, 'link', '2', 3, NULL, NULL, NULL, NULL, '2024-03-26 00:00:00', 'admin'),
(6, 'Category', 'active', '/chuyen-muc', 7, 'link', 'current', 3, '', NULL, NULL, NULL, '2024-03-26 00:00:00', 'admin'),
(7, 'Article', 'active', '/bai-viet', 8, 'category_article', 'current', 3, '', '<p>Article container</p>', NULL, NULL, '2024-03-26 00:00:00', 'admin'),
(8, 'Tin tức tổng hợp', 'active', '/tin-tuc-tong-hop', 14, 'category_product', 'current', NULL, NULL, '<p>main-menu</p>', NULL, NULL, '2024-03-26 00:00:00', 'admin'),
(9, 'Hình ảnh', 'active', '/thu-vien-hinh-anh', 13, 'link', 'current', NULL, NULL, '<p>main-menu</p>', NULL, NULL, '2024-03-26 00:00:00', 'admin'),
(20, 'Category-content', 'inactive', '#', 7, 'link', 'current', 3, 'category', NULL, NULL, NULL, '2024-03-26 00:00:00', 'admin'),
(21, 'Article-container', 'inactive', '/', 5, 'category_article', 'current', NULL, 'article', '<p>Article container</p>', NULL, NULL, '2024-03-26 00:00:00', 'admin'),
(23, 'Giáo Dục', 'active', '/chuyen-muc/category-giao-duc-2.html', 10, 'link', NULL, 3, NULL, '<p>category-giaoduc-id=2</p>', NULL, NULL, '2024-03-26 00:00:00', 'admin'),
(24, 'Tia cực tím', 'inactive', '/bai-viet/tia-cuc-tim-tai-ha-noi-o-muc-nguy-hiem-20.php', 11, 'link', 'current', NULL, NULL, 'Tia cực tím tại Hà Nội ở mức \'nguy hiểm\'-id=20', NULL, NULL, NULL, NULL),
(30, 'Zendvn', 'active', 'https://zendvn.com/', 12, 'link', '_new', NULL, NULL, '<p>Trang web zendvn</p>', '2024-02-28 00:00:00', 'admin', '2024-02-29 00:00:00', 'admin'),
(37, 'Thể thao', 'active', '/chuyen-muc/category-the-thao-1.html', 10, 'link', NULL, 6, NULL, '<p>category-the-thao-1=2</p>', NULL, NULL, '2024-03-26 00:00:00', 'admin'),
(38, 'Sức khỏe', 'active', '/chuyen-muc/category-suc-khoe-3.html', 10, 'link', NULL, 6, NULL, '<p>category-suc-khoe-3=2</p>', NULL, NULL, '2024-03-26 00:00:00', 'admin'),
(39, 'Khoa học', 'active', '/chuyen-muc/category-khoa-hoc-5.html', 10, 'link', NULL, 6, NULL, '<p>category-khoa-hoc-5=5</p>', NULL, NULL, '2024-03-26 00:00:00', 'admin'),
(40, 'Số hóa', 'active', '/chuyen-muc/category-so-hoa-6.html', 10, 'link', NULL, 6, NULL, '<p>category-so-hoa-6=6</p>', NULL, NULL, '2024-03-26 00:00:00', 'admin'),
(41, 'Kinh doanh', 'active', '/chuyen-muc/category-kinh-doanh-8.html', 10, 'link', NULL, 6, NULL, '<p>category-kinh-doanh-8=8</p>', NULL, NULL, '2024-03-26 00:00:00', 'admin'),
(43, 'Tia cực tím', 'active', '/bai-viet/tia-cuc-tim-tai-ha-noi-o-muc-nguy-hiem-20.php', 10, 'link', NULL, 7, NULL, '<p>article-tia-cuc-tim-tai-ha-noi-20</p>', NULL, NULL, '2024-03-26 00:00:00', 'admin'),
(44, 'Blockchain và trí tuệ nhân tạo', 'active', '/bai-viet/blockchain-va-tri-tue-nhan-tao-ai-lam-thay-doi-giao-duc-truc-tuyen-21.php', 10, 'link', NULL, 7, NULL, '<p>article-blockchain-va-tri-tue-nhan-tao-ai-lam-thay-doi-giao-duc-truc-tuyen-21</p>', NULL, NULL, '2024-03-26 00:00:00', 'admin'),
(45, 'Đại học Anh đưa khóa học hạnh phúc', 'active', '/bai-viet/dai-hoc-anh-dua-khoa-hoc-hanh-phuc-vao-chuong-trinh-giang-day-7.php', 10, 'link', NULL, 7, NULL, '<p>article-dai-hoc-anh-dua-khoa-hoc-hanh-phuc-vao-chuong-trinh-giang-day-7</p>', NULL, NULL, '2024-03-26 00:00:00', 'admin');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `rss`
--

CREATE TABLE `rss` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` varchar(45) DEFAULT NULL,
  `link` varchar(200) NOT NULL,
  `ordering` int(11) DEFAULT NULL,
  `source` varchar(45) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `modified_by` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci ROW_FORMAT=COMPACT;

--
-- Đang đổ dữ liệu cho bảng `rss`
--

INSERT INTO `rss` (`id`, `name`, `status`, `link`, `ordering`, `source`, `created`, `created_by`, `modified`, `modified_by`) VALUES
(1, 'Thế giới - vnexpress', 'active', 'https://vnexpress.net/rss/the-gioi.rss', 10, 'vnexpress', '2023-12-25 07:05:36', 'phamdat', '2024-06-29 00:00:00', 'admin'),
(3, 'Sức khỏe - vnexpress', 'inactive', 'https://vnexpress.net/rss/suc-khoe.rss', 10, 'vnexpress', '2023-12-25 07:05:36', 'phamdat', '2024-06-17 00:00:00', 'admin'),
(6, 'Số hóa - vnexpress', 'inactive', 'https://vnexpress.net/rss/so-hoa.rss', 11, 'vnexpress', '2023-12-25 00:00:00', 'admin', '2024-06-17 00:00:00', 'admin'),
(7, 'Thể Thao - vnexpress', 'inactive', 'https://vnexpress.net/rss/the-thao.rss', 10, 'vnexpress', '2023-12-27 00:00:00', 'admin', '2024-06-17 00:00:00', 'admin'),
(8, 'Thời sự - thanhnien', 'inactive', 'https://thanhnien.vn/rss/thoi-su.rss', 5, 'thanhnien', '2023-12-27 00:00:00', 'admin', '2024-06-29 00:00:00', 'admin'),
(9, 'Nhịp sống số - tuoitre', 'inactive', 'https://tuoitre.vn/rss/nhip-song-so.rss', 1, 'tuoitre', '2023-12-27 00:00:00', 'admin', '2024-06-29 00:00:00', 'admin');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `rssnews`
--

CREATE TABLE `rssnews` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `pubDate` datetime DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  `thumb` varchar(255) DEFAULT NULL,
  `created_by` varchar(100) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `domain` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Đang đổ dữ liệu cho bảng `rssnews`
--

INSERT INTO `rssnews` (`id`, `title`, `description`, `pubDate`, `link`, `thumb`, `created_by`, `status`, `domain`) VALUES
(3166, 'Ông Biden xoa dịu cử tri sau cuộc tranh luận với ông Trump', 'Tổng thống Biden tin tưởng ông sẽ vượt qua Trump trong cuộc đua vào Nhà Trắng, dù gây thất vọng khi tranh luận trực tiếp với đối thủ.', '2024-06-29 07:54:06', 'https://vnexpress.net/ong-biden-xoa-diu-cu-tri-sau-cuoc-tranh-luan-voi-ong-trump-4764016.html', 'https://i1-vnexpress.vnecdn.net/2024/06/29/Biden-1719618720-4609-1719618750.png?w=1200&h=0&q=100&dpr=1&fit=crop&s=EfY_fBoz6vyrVLLWVX6O-w', 'VNExpress', 'active', 'vnexpress'),
(3167, 'Ông Putin: Nga cần chế tạo tên lửa bị cấm trong hiệp ước INF', 'Ông Putin nói Mỹ triển khai tên lửa bị cấm theo hiệp ước INF ở nhiều nơi, nên Nga cần sản xuất vũ khí tương tự để đối phó.', '2024-06-29 07:02:02', 'https://vnexpress.net/ong-putin-nga-can-che-tao-ten-lua-bi-cam-trong-hiep-uoc-inf-4764009.html', 'https://i1-vnexpress.vnecdn.net/2024/06/29/9m7291-1719617244-8072-1719617274.jpg?w=1200&h=0&q=100&dpr=1&fit=crop&s=rBeDj56lYJdak1kZ_kSkXQ', 'VNExpress', 'active', 'vnexpress'),
(3168, '\'Quan hệ Việt - Nhật đang trong giai đoạn tốt đẹp nhất từ trước đến nay\'', 'Đại sứ Ito Naoki đề cao quan hệ Việt Nam - Nhật Bản, cho rằng hai nước còn nhiều cơ hội hợp tác kinh tế và đào tạo nguồn lao động.', '2024-06-28 22:20:23', 'https://vnexpress.net/quan-he-viet-nhat-dang-trong-giai-doan-tot-dep-nhat-tu-truoc-den-nay-4763807.html', 'https://i1-vnexpress.vnecdn.net/2024/06/28/itonaoki2JPG-1719571856-5286-1719571965.jpg?w=1200&h=0&q=100&dpr=1&fit=crop&s=OOO84GUbVwv64Nhj0ZYLBg', 'VNExpress', 'active', 'vnexpress'),
(3169, 'Belarus triển khai pháo phản lực đến biên giới giáp Ukraine', 'Belarus tuyên bố tăng cường biện pháp bảo vệ biên giới, trong đó có triển khai đơn vị pháo phản lực, sau \"sự cố an ninh\" tại vùng giáp Ukraine.', '2024-06-28 19:43:15', 'https://vnexpress.net/belarus-trien-khai-phao-phan-luc-den-bien-gioi-giap-ukraine-4763964.html', 'https://i1-vnexpress.vnecdn.net/2024/06/28/polonez1-1719575472-7246-1719575518.jpg?w=1200&h=0&q=100&dpr=1&fit=crop&s=oYgAkaoz76QahnIZ9KV6ZA', 'VNExpress', 'active', 'vnexpress'),
(3170, 'Canada lập kế hoạch sơ tán hơn 20.000 người khỏi Lebanon', 'Tham mưu trưởng quân đội Canada xác nhận nước này đang lập kế hoạch sơ tán công dân khỏi Lebanon, kêu gọi đồng minh phối hợp.', '2024-06-28 18:30:42', 'https://vnexpress.net/canada-lap-ke-hoach-so-tan-hon-20-000-nguoi-khoi-lebanon-4763843.html', 'https://i1-vnexpress.vnecdn.net/2024/06/28/danh-bom-lebanon-1719567267-8483-1719567574.jpg?w=1200&h=0&q=100&dpr=1&fit=crop&s=wrqHGFF3UJUjc-9-YdAheg', 'VNExpress', 'active', 'vnexpress'),
(3171, 'Dân Ấn Độ đổ xô mua điều hòa giữa nắng nóng', 'Nhu cầu mua điều hòa của người dân Ấn Độ tăng vọt khi nhiều khu vực ở nước này trải qua đợt nắng nóng chưa từng có trong nhiều năm.', '2024-06-28 17:52:57', 'https://vnexpress.net/dan-an-do-do-xo-mua-dieu-hoa-giua-nang-nong-4763863.html', 'https://i1-vnexpress.vnecdn.net/2024/06/28/UHGM4QLWUFKDFPYBOBQDIRMTPI-171-6156-8891-1719565950.jpg?w=1200&h=0&q=100&dpr=1&fit=crop&s=Ts_sKqAoJlzoKCcr0-0x6w', 'VNExpress', 'active', 'vnexpress'),
(3172, 'Nhóm nữ y tá Anh phản đối dùng chung phòng thay đồ với người chuyển giới', 'Các y tá ở một bệnh viện ở đông bắc Anh kiện cơ quan quản lý do cho phép đàn ông chuyển giới sử dụng phòng thay đồ nữ.', '2024-06-28 17:28:47', 'https://vnexpress.net/nhom-nu-y-ta-anh-phan-doi-dung-chung-phong-thay-do-voi-nguoi-chuyen-gioi-4763882.html', 'https://i1-vnexpress.vnecdn.net/2024/06/28/nhs-nurses-sue-over-transgende-3267-4667-1719564898.jpg?w=1200&h=0&q=100&dpr=1&fit=crop&s=N87qnwyl3rCML8K14jfZ_w', 'VNExpress', 'active', 'vnexpress'),
(3173, 'Những điểm nhấn trong màn tranh luận Trump - Biden', 'Ông Biden gặp nhiều khó khăn khi phát biểu, trong khi ông Trump liên tục đưa ra những tuyên bố không chính xác trong cuộc tranh luận tổng thống đầu tiên năm nay.', '2024-06-28 17:23:25', 'https://vnexpress.net/nhung-diem-nhan-trong-man-tranh-luan-trump-biden-4763823.html', 'https://i1-vnexpress.vnecdn.net/2024/06/28/AP24180069859651-1719566002-5003-1719566199.jpg?w=1200&h=0&q=100&dpr=1&fit=crop&s=QEsqRdyCeXueYyUl8x6h4Q', 'VNExpress', 'active', 'vnexpress'),
(3174, 'Ông Medvedev cảnh báo về nguy cơ chiến tranh sau lệnh bắt của ICC', 'Phó chủ tịch Hội đồng An ninh Nga Medvedev cảnh báo việc không công nhận quyền miễn trừ tư pháp của giới chức các nước \"có thể dẫn tới thế chiến\".', '2024-06-28 16:06:00', 'https://vnexpress.net/ong-medvedev-canh-bao-ve-nguy-co-chien-tranh-sau-lenh-bat-cua-icc-4763638.html', 'https://i1-vnexpress.vnecdn.net/2024/06/28/1422765-1719540982-5632-1719541009.jpg?w=1200&h=0&q=100&dpr=1&fit=crop&s=R8QVdYHCmQ2i656Iqdp_ew', 'VNExpress', 'active', 'vnexpress'),
(3175, 'Trung Quốc nêu mục tiêu phát triển 10 năm tới', 'Giới chức Trung Quốc đặt ra các mục tiêu phát triển cho thập kỷ tới, chủ trương cân bằng giữa các yếu tố kinh tế với xã hội, phát triển với an ninh.', '2024-06-28 15:58:48', 'https://vnexpress.net/trung-quoc-neu-muc-tieu-phat-trien-10-nam-toi-4763808.html', 'https://i1-vnexpress.vnecdn.net/2024/06/28/5563187178137268182b-trung-quo-3967-7043-1719565085.jpg?w=1200&h=0&q=100&dpr=1&fit=crop&s=vgOz3ZGlpnpn-h6MZBGCGA', 'VNExpress', 'active', 'vnexpress'),
(3176, 'Cựu cảnh sát trưởng Mỹ bị khởi tố vì không ngăn được xả súng trường học', 'Đại bồi thẩm đoàn bang Texas khởi tố cựu cảnh sát trưởng Arredondo vì không ngăn được vụ xả súng năm 2022 ở trường Uvalde, khiến 21 người thiệt mạng.', '2024-06-28 15:25:05', 'https://vnexpress.net/cuu-canh-sat-truong-my-bi-khoi-to-vi-khong-ngan-duoc-xa-sung-truong-hoc-4763725.html', 'https://i1-vnexpress.vnecdn.net/2024/06/28/canh-sat-my-1719548577-5541-1719548668.jpg?w=1200&h=0&q=100&dpr=1&fit=crop&s=-FY3YGu92vt2K14-QXTmkQ', 'VNExpress', 'active', 'vnexpress'),
(3177, 'Màn khẩu chiến trong tranh luận Trump - Biden', 'Tổng thống Biden và ứng viên Cộng hòa Trump công kích nhau về vấn đề kinh tế, quyền phá thai, cựu chiến binh, rắc rối pháp lý trong cuộc tranh luận trực tiếp.', '2024-06-28 15:23:29', 'https://vnexpress.net/man-khau-chien-trong-tranh-luan-trump-biden-4763833.html', 'https://i1-vnexpress.vnecdn.net/2024/06/28/CNN95171719563285-1719563864-9424-1719563907.png?w=1200&h=0&q=100&dpr=1&fit=crop&s=gYbkep8qNG2Olg_CTyhnhg', 'VNExpress', 'active', 'vnexpress'),
(3178, 'Đảng viên Dân chủ tranh cãi về màn tranh luận của ông Biden', 'Một số đảng viên Dân chủ thất vọng về màn tranh luận của ông Biden với Trump, số khác cho rằng Tổng thống đã cho thấy tầm nhìn tích cực về tương lai nước Mỹ.', '2024-06-28 14:49:34', 'https://vnexpress.net/dang-vien-dan-chu-tranh-cai-ve-man-tranh-luan-cua-ong-biden-4763726.html', 'https://i1-vnexpress.vnecdn.net/2024/06/28/AFP2024062834ZM4B7v1HighResPre-4157-4875-1719549209.jpg?w=1200&h=0&q=100&dpr=1&fit=crop&s=V7shca5JQFFHEzOj-QlDYQ', 'VNExpress', 'active', 'vnexpress'),
(3179, 'Ukraine tuyên bố đẩy lùi Nga khỏi quận ở thành trì Chasov Yar', 'Quân đội Ukraine thông báo đẩy lùi đối phương khỏi một quận thuộc Chasov Yar, thành trì ở tỉnh Donetsk đang bị lực lượng Nga mở chiến dịch công phá.', '2024-06-28 14:24:04', 'https://vnexpress.net/ukraine-tuyen-bo-day-lui-nga-khoi-quan-o-thanh-tri-chasov-yar-4763633.html', 'https://i1-vnexpress.vnecdn.net/2024/06/28/ukraine-399-7405-1711117773-6557-1719539104.jpg?w=1200&h=0&q=100&dpr=1&fit=crop&s=V7xG72bC_V-1HJWlzQpLQw', 'VNExpress', 'active', 'vnexpress'),
(3180, 'Leo lên miệng núi lửa làm lễ cầu mưa', 'Mỗi khi trời hạn hán, người Tenggerese ở Đông Java lại trèo lên miệng núi lửa Bromo cao hơn 2.300 m để làm lễ cầu thần linh phù hộ cho mùa màng bội thu.', '2024-06-28 14:05:54', 'https://vnexpress.net/leo-len-mieng-nui-lua-lam-le-cau-mua-4763718.html', 'https://i1-vnexpress.vnecdn.net/2024/06/28/1-1719545016.jpg?w=1200&h=0&q=100&dpr=1&fit=crop&s=9N2nxPCkXZMZQ8XZPJoyOQ', 'VNExpress', 'active', 'vnexpress'),
(3181, 'Trợ lý ông Trump reo hò sau cuộc tranh luận tổng thống', 'Các trợ lý của Trump vỗ tay reo hò sau khi ông rời sân khấu, ca ngợi ông đã chiến thắng trước Tổng thống Biden trong cuộc tranh luận đầu tiên năm nay.', '2024-06-28 11:40:54', 'https://vnexpress.net/tro-ly-ong-trump-reo-ho-sau-cuoc-tranh-luan-tong-thong-4763733.html', 'https://i1-vnexpress.vnecdn.net/2024/06/28/afp-20240628-34zm48m-v1-highre-8910-4878-1719550278.jpg?w=1200&h=0&q=100&dpr=1&fit=crop&s=FhW3c7owjMIAaxYsHz1z_g', 'VNExpress', 'active', 'vnexpress'),
(3182, 'Hezbollah tập kích căn cứ Israel', 'Hezbollah phóng hàng chục rocket vào căn cứ quân sự ở miền bắc Israel để đáp trả các cuộc tập kích của Tel Aviv khiến 4 thành viên nhóm thiệt mạng.', '2024-06-28 10:45:25', 'https://vnexpress.net/hezbollah-tap-kich-can-cu-israel-4763585.html', 'https://i1-vnexpress.vnecdn.net/2024/06/28/afp-20240626-34zc7zr-v1-highre-2705-9267-1719535801.jpg?w=1200&h=0&q=100&dpr=1&fit=crop&s=BMmHyvZP8V4dOmDrDMUtIw', 'VNExpress', 'active', 'vnexpress'),
(3183, 'Người Israel biểu tình trước nhà Thủ tướng Netanyahu', 'Người biểu tình phản đối chính phủ Israel tuần hành đến nhà Thủ tướng Benjamin Netanyahu, đốt lửa trên con phố bên ngoài và kêu gọi ông từ chức.', '2024-06-28 10:15:28', 'https://vnexpress.net/nguoi-israel-bieu-tinh-truoc-nha-thu-tuong-netanyahu-4763598.html', 'https://i1-vnexpress.vnecdn.net/2024/06/28/afp-20240627-34zl8vz-v2-highre-9943-4286-1719538566.jpg?w=1200&h=0&q=100&dpr=1&fit=crop&s=nJJ82hVzcW4-anuHJedJeA', 'VNExpress', 'active', 'vnexpress'),
(3184, 'Nga xác nhận dùng tên lửa siêu vượt âm tập kích sân bay Ukraine', 'Nga thông báo dùng tên lửa siêu vượt âm Kinzhal và nhiều vũ khí khác tấn công các căn cứ Ukraine, trong đó có sân bay sắp tiếp nhận tiêm kích phương Tây.', '2024-06-28 09:15:07', 'https://vnexpress.net/nga-xac-nhan-dung-ten-lua-sieu-vuot-am-tap-kich-san-bay-ukraine-4763630.html', 'https://i1-vnexpress.vnecdn.net/2024/06/28/kinzhal3-1719539126-1806-1719539253.jpg?w=1200&h=0&q=100&dpr=1&fit=crop&s=Vct0lWbCZ8gsOVz2KdvrUA', 'VNExpress', 'active', 'vnexpress'),
(3185, 'Ông Trump và ông Biden tranh luận trực tiếp', 'Ông Trump và ông Biden lần đầu tranh luận trực tiếp trong cuộc đua vào Nhà Trắng năm nay, hai ứng viên công kích nhau về vấn đề kinh tế, quyền phá thai và cả các vấn đề cá nhân.', '2024-06-28 07:56:57', 'https://vnexpress.net/ong-trump-va-ong-biden-tranh-luan-truc-tiep-4763602-tong-thuat.html', 'https://i1-vnexpress.vnecdn.net/2024/06/28/trumpbidencombophoto1694449617-5754-5294-1719564540.jpg?w=1200&h=0&q=100&dpr=1&fit=crop&s=uqKN4UnJVjBFbk8pR4_YXg', 'VNExpress', 'active', 'vnexpress'),
(3186, 'Chính phủ Bolivia đã nhận tin tình báo về âm mưu đảo chính', 'Chính phủ Bolivia nhận tin tình báo về một âm mưu đảo chính từ vài tuần trước, nhưng không rõ thời điểm biến cố này có thể xảy ra.', '2024-06-28 07:19:10', 'https://vnexpress.net/chinh-phu-bolivia-da-nhan-tin-tinh-bao-ve-am-muu-dao-chinh-4763578.html', 'https://i1-vnexpress.vnecdn.net/2024/06/28/afp-20240627-aa-27062024-17481-6151-1679-1719532113.jpg?w=1200&h=0&q=100&dpr=1&fit=crop&s=J7W3rdWOY3_6f6G_XY2GUg', 'VNExpress', 'active', 'vnexpress'),
(3187, 'Cách ông Trump chuẩn bị cho lần tranh luận với ông Biden', 'Ông Trump không tập dượt, mà chỉ trích tính khách quan của cuộc tranh luận với Tổng thống Biden dù nó chưa diễn ra, dường như để chuẩn bị cho kịch bản bất lợi.', '2024-06-28 00:00:00', 'https://vnexpress.net/cach-ong-trump-chuan-bi-cho-lan-tranh-luan-voi-ong-biden-4763175.html', 'https://i1-vnexpress.vnecdn.net/2024/06/27/AFP2024060634VQ6VRv1HighResUsV-4178-1975-1719467600.jpg?w=1200&h=0&q=100&dpr=1&fit=crop&s=orAjmx-6Wl6LiRsCGXkxPA', 'VNExpress', 'active', 'vnexpress'),
(3188, 'Sri Lanka kêu gọi quân đội Nga cho công dân nước này giải ngũ', 'Chính phủ Sri Lanka đề nghị Nga cho phép công dân Sri Lanka tham chiến tại Ukraine được chấm dứt hợp đồng, giải ngũ và hồi hương.', '2024-06-28 11:19:13', 'https://vnexpress.net/sri-lanka-keu-goi-quan-doi-nga-cho-cong-dan-nuoc-nay-giai-ngu-4763674.html', 'https://i1-vnexpress.vnecdn.net/2024/06/28/afp-20240302-aa-02032024-15585-5680-1523-1719541373.jpg?w=1200&h=0&q=100&dpr=1&fit=crop&s=AHRRkUvYCX4ZpHuSy-_kJw', 'VNExpress', 'active', 'vnexpress');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `slider`
--

CREATE TABLE `slider` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `link` varchar(200) NOT NULL,
  `thumb` text DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `modified_by` varchar(255) DEFAULT NULL,
  `status` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci ROW_FORMAT=COMPACT;

--
-- Đang đổ dữ liệu cho bảng `slider`
--

INSERT INTO `slider` (`id`, `name`, `description`, `link`, `thumb`, `created`, `created_by`, `modified`, `modified_by`, `status`) VALUES
(1, 'Khóa học lập trình Frontend Master', 'Khóa học sẽ giúp bạn trở thành một chuyên gia Frontend với đầy đủ các kiến thức về HTML, CSS, JavaScript, Bootstrap, jQuery, chuyển PSD thành HTML ...', 'https://zendvn.com/khoa-hoc-lap-trinh-frontend-master/', 'rEpDUQCxe4.jpeg', '2019-04-15 00:00:00', 'hailan', '2019-04-24 13:28:03', 'hailan', 'active'),
(2, 'Học lập trình trực tuyến', 'Học trực tuyến giúp bạn tiết kiệm chi phí, thời gian, cập nhật được nhiều kiến thức mới nhanh nhất và hiệu quả nhất', 'https://zendvn.com/', 'K6B1O6UNCb.jpeg', '2019-04-18 00:00:00', 'hailan', '2019-04-24 13:28:06', 'hailan', 'inactive'),
(3, 'Ưu đãi học phí', 'Tổng hợp các trương trình ưu đãi học phí hàng tuần, hàng tháng đến tất các các bạn với các mức giảm đặc biệt 50%, 70%,..', 'https://zendvn.com/uu-dai-hoc-phi-tai-zendvn/', 'LWi6hINpXz.jpeg', '2019-04-24 00:00:00', 'hailan', '2019-04-24 13:28:09', NULL, 'active'),
(4, 'Lập trình PHP', 'Khóa học được xây dựng dựa trên kinh nghiệm làm dự án thực tế của ZendVN, ngoài ra khóa học còn sử dụng các tài liệu từ trang Google, stackoverflow.com và các trang web khác.', 'https://zendvn.com/khoa-hoc-lap-trinh-php-chuyen-sau', 'UIFAVEbuoa.jpeg', '2019-04-24 00:00:00', 'hailan', '2024-03-25 00:00:00', 'admin', 'active'),
(5, 'Lập trình Laravel', 'Đây là khóa học nâng cao, ZendVN chỉ nhận các bạn học viên đã học xong khóa học Lập trình PHP Offline tại ZendVN; hoặc các bạn đã có làm các project về PHP, MVC, OOP, jQuery Ajax\r\nKhóa học Lập trình Laravel sẽ hướng dẫn học viên sử dụng Laravel để xây dựng nhiều loại website khác nhau trong thực tế: doanh nghiệp, tin tức, bán hàng, đa ngôn ngữ. ', 'https://zendvn.com/lap-trinh-laravel-offline-off', 'DZeaWRlkPA.png', '2019-04-24 00:00:00', 'hailan', '2024-03-18 00:00:00', 'dat123', 'active'),
(6, 'Nền tảng & Tư duy lập trình', 'Khóa học Nền tảng & Tư duy lập trình giúp bạn trang bị nền tảng lập trình vững chắc để có thể theo được nghề lập trình và duy trì đam mê với nghề. Các kỹ năng phân tích giải quyết vấn đề, tìm kiếm Google, xử lý lỗi cũng sẽ được hướng dẫn trong khóa học.', 'https://zendvn.com/nen-tang-va-tu-duy-lap-trinh-off', 'ofcAvQCCIQ.png', '2019-04-24 00:00:00', 'hailan', '2024-03-18 00:00:00', 'dat123', 'active');

--
-- Bẫy `slider`
--
DELIMITER $$
CREATE TRIGGER `updateTotalElementsAfterDeleteSlider` AFTER DELETE ON `slider` FOR EACH ROW BEGIN
  UPDATE `totalelements`
  SET ElementCount = ElementCount - 1
  WHERE `TableName` = 'slider';
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `updateTotalElementsAfterUpdateSlider` AFTER UPDATE ON `slider` FOR EACH ROW BEGIN
  -- Assuming that the primary key of the article table is 'id'
  IF NEW.id <> OLD.id THEN
    UPDATE `totalelements`
    SET ElementCount = ElementCount + 1
    WHERE `TableName` = 'slider';
  END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `updateTotalElementsSlider` AFTER INSERT ON `slider` FOR EACH ROW BEGIN
  UPDATE `totalelements`
  SET ElementCount = ElementCount + 1
  WHERE `TableName` = 'slider';
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `totalelements`
--

CREATE TABLE `totalelements` (
  `TableName` varchar(255) NOT NULL,
  `ElementCount` int(11) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Đang đổ dữ liệu cho bảng `totalelements`
--

INSERT INTO `totalelements` (`TableName`, `ElementCount`, `icon`) VALUES
('article', 20, '<i class=\"fa fa-newspaper-o\"></i>'),
('category', 8, '<i class=\"fa fa-tasks\"></i>'),
('slider', 6, '<i class=\"fa fa-sliders\"></i>'),
('user', 9, '<i class=\"fa fa-users\"></i>');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `fullname` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `level` varchar(10) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `created_by` varchar(45) DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `modified_by` varchar(45) DEFAULT NULL,
  `status` varchar(10) DEFAULT '0',
  `usually_category` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci ROW_FORMAT=COMPACT;

--
-- Đang đổ dữ liệu cho bảng `user`
--

INSERT INTO `user` (`id`, `username`, `email`, `fullname`, `password`, `avatar`, `level`, `created`, `created_by`, `modified`, `modified_by`, `status`, `usually_category`) VALUES
(1, 'admin', 'admin@gmail.com', 'admin123456', 'e10adc3949ba59abbe56e057f20f883e', 'ZnrJ4VWN7s.png', 'admin', '2014-12-10 08:55:35', 'admin', '2024-03-20 00:00:00', 'admin', 'active', '1,2,2,2,1,1,1,6,6,6,6,6,6,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2'),
(2, 'hailan', 'hailan@gmail.com', 'hailan', 'e10adc3949ba59abbe56e057f20f883e', '1eSGmvZ3gM.jpeg', 'admin', '2014-12-13 07:20:03', 'admin', '2024-03-22 00:00:00', 'dat123', 'active', NULL),
(3, 'user123', 'test@gmail.com', 'user123', 'e10adc3949ba59abbe56e057f20f883e', 'Hb1QSn1CL8.png', 'member', '2019-05-04 00:00:00', 'admin', '2024-03-23 00:00:00', 'admin', 'inactive', NULL),
(4, 'user456', 'user456@gmail.com', 'user456', 'e10adc3949ba59abbe56e057f20f883e', 'g0r3gYefFo.png', 'member', '2019-05-04 00:00:00', 'admin', '2024-03-23 00:00:00', 'admin', 'active', NULL),
(5, 'dat123', 'phamdat999666@gmail.com', 'Dat123', 'e10adc3949ba59abbe56e057f20f883e', 'zpzZTLYNzb.png', 'admin', '2023-11-28 00:00:00', 'phamdat', '2023-11-29 00:00:00', 'phamdat', 'active', NULL),
(6, 'phamdat9997778', 'phamdat999999999@gmail.com', 'Phamdat123123213', NULL, 'pL1DxiUtai.jpg', 'admin', '2023-11-28 00:00:00', 'phamdat', '2024-03-22 00:00:00', 'admin', 'active', NULL),
(8, 'admin999', 'phamdat999999999663123213216@gmail.com', 'Dat123312321321321', '123456', '9k04uy61T5.jpg', 'admin', '2023-11-29 00:00:00', 'phamdat', '2023-11-29 00:00:00', 'phamdat', 'active', NULL),
(9, 'member0011', 'member999666@gmail.com', 'Member0011', 'd41d8cd98f00b204e9800998ecf8427e', 'uajxH2pLAp.jpg', 'member', '2023-11-29 00:00:00', 'phamdat', '2024-01-19 00:00:00', 'admin', 'inactive', NULL),
(15, 'member00111', 'phamdat999666111@gmail.com', 'Member00111', 'e10adc3949ba59abbe56e057f20f883e', 'MxO2Afexqg.png', 'member', '2024-01-22 00:00:00', 'admin', NULL, NULL, 'active', NULL);

--
-- Bẫy `user`
--
DELIMITER $$
CREATE TRIGGER `updateTotalElementsAfterDeleteUser` AFTER DELETE ON `user` FOR EACH ROW BEGIN
  UPDATE `totalelements`
  SET ElementCount = ElementCount - 1
  WHERE `TableName` = 'user';
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `updateTotalElementsAfterUpdateUser` AFTER UPDATE ON `user` FOR EACH ROW BEGIN
  -- Assuming that the primary key of the article table is 'id'
  IF NEW.id <> OLD.id THEN
    UPDATE `totalelements`
    SET ElementCount = ElementCount + 1
    WHERE `TableName` = 'user';
  END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `updateTotalElementsUser` AFTER INSERT ON `user` FOR EACH ROW BEGIN
  UPDATE `totalelements`
  SET ElementCount = ElementCount + 1
  WHERE `TableName` = 'user';
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user_agents`
--

CREATE TABLE `user_agents` (
  `id` int(11) NOT NULL,
  `agent` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `timestamps` datetime DEFAULT current_timestamp(),
  `article_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=DYNAMIC;

--
-- Đang đổ dữ liệu cho bảng `user_agents`
--

INSERT INTO `user_agents` (`id`, `agent`, `timestamps`, `article_id`) VALUES
(1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', '2024-03-25 07:45:16', 15),
(2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', '2024-03-25 07:45:16', 16),
(3, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36', '2024-03-25 07:45:16', 16),
(4, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-03-25 07:45:16', 23),
(5, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', '2024-03-25 14:52:54', 16),
(6, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', '2024-03-25 14:52:55', 16),
(7, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', '2024-03-25 14:52:55', 16),
(8, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', '2024-03-25 15:33:26', 16),
(9, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', '2024-03-25 15:33:27', 16),
(10, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', '2024-03-25 15:33:27', 16),
(11, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', '2024-03-25 15:35:53', 16),
(12, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', '2024-03-25 15:35:54', 16),
(13, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', '2024-03-25 15:35:54', 16),
(14, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', '2024-03-25 16:05:17', 16),
(15, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', '2024-03-25 16:05:18', 16),
(16, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', '2024-03-25 16:05:18', 16),
(17, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', '2024-03-25 16:19:14', 16),
(18, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', '2024-03-25 16:19:15', 16),
(19, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', '2024-03-25 16:19:15', 16),
(20, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', '2024-03-26 05:40:31', 16),
(21, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', '2024-03-26 05:40:32', 16),
(22, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', '2024-03-26 05:40:33', 16),
(23, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', '2024-03-26 06:32:25', 4),
(24, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', '2024-03-26 06:32:26', 4),
(25, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', '2024-03-26 06:32:26', 4),
(26, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', '2024-03-26 13:53:08', 16),
(27, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', '2024-03-26 13:53:09', 16),
(28, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', '2024-03-26 13:53:09', 16),
(29, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', '2024-05-02 02:38:02', 15),
(30, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', '2024-05-02 02:38:03', 15),
(31, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', '2024-05-02 02:38:03', 15),
(32, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', '2024-05-02 04:19:07', 22),
(33, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', '2024-05-02 04:19:08', 22),
(34, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', '2024-05-02 04:19:08', 22),
(35, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', '2024-05-02 04:20:36', 22),
(36, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', '2024-05-02 04:23:14', 22),
(37, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', '2024-05-02 04:29:47', 22),
(38, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', '2024-05-02 04:29:48', 22),
(39, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', '2024-05-02 04:29:48', 22),
(40, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', '2024-05-02 04:30:04', 21),
(41, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', '2024-05-02 04:30:05', 21),
(42, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', '2024-05-02 04:30:05', 21),
(43, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', '2024-05-02 04:30:40', 21),
(44, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', '2024-05-02 04:30:41', 21),
(45, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', '2024-05-02 04:30:41', 21),
(46, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', '2024-05-02 04:34:21', 21),
(47, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', '2024-05-02 04:34:22', 21),
(48, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', '2024-05-02 04:34:22', 21),
(49, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', '2024-05-02 04:35:15', 21),
(50, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', '2024-05-02 04:35:16', 21),
(51, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', '2024-05-02 04:35:16', 21),
(52, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', '2024-05-02 04:35:56', 21),
(53, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', '2024-05-02 04:35:57', 21),
(54, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', '2024-05-02 04:35:57', 21),
(55, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', '2024-05-02 04:36:17', 21),
(56, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', '2024-05-02 04:36:17', 21),
(57, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', '2024-05-02 04:36:18', 21),
(58, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', '2024-05-02 04:36:32', 21),
(59, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', '2024-05-02 04:36:33', 21),
(60, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', '2024-05-02 04:36:33', 21),
(61, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', '2024-05-02 04:36:50', 21),
(62, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', '2024-05-02 04:36:51', 21),
(63, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', '2024-05-02 04:36:51', 21),
(64, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', '2024-05-02 04:37:41', 21),
(65, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', '2024-05-02 04:37:42', 21),
(66, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', '2024-05-02 04:37:42', 21),
(67, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', '2024-06-21 11:26:26', 16),
(68, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', '2024-06-21 11:26:27', 16),
(69, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', '2024-06-21 11:26:27', 16),
(70, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', '2024-06-21 11:31:31', 16),
(71, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', '2024-06-21 11:31:32', 16),
(72, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', '2024-06-21 11:31:32', 16),
(73, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', '2024-06-21 11:32:53', 16),
(74, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', '2024-06-21 11:32:54', 16),
(75, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', '2024-06-21 11:32:54', 16),
(76, 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Mobile Safari/537.36', '2024-06-21 11:33:11', 16),
(77, 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Mobile Safari/537.36', '2024-06-21 11:33:12', NULL),
(78, 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Mobile Safari/537.36', '2024-06-21 11:33:12', 16),
(79, 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Mobile Safari/537.36', '2024-06-21 11:35:00', 16),
(80, 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Mobile Safari/537.36', '2024-06-21 11:35:01', 16),
(81, 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Mobile Safari/537.36', '2024-06-21 11:35:01', 16),
(82, 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Mobile Safari/537.36', '2024-06-21 11:35:05', 16),
(83, 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Mobile Safari/537.36', '2024-06-21 11:35:07', 16),
(84, 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Mobile Safari/537.36', '2024-06-21 11:35:07', 16),
(85, 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Mobile Safari/537.36', '2024-06-21 11:35:22', 16),
(86, 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Mobile Safari/537.36', '2024-06-21 11:35:24', 16),
(87, 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Mobile Safari/537.36', '2024-06-21 11:35:24', 16),
(88, 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Mobile Safari/537.36', '2024-06-21 11:35:28', 16),
(89, 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Mobile Safari/537.36', '2024-06-21 11:35:29', NULL),
(90, 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Mobile Safari/537.36', '2024-06-21 11:35:29', 16),
(91, 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Mobile Safari/537.36', '2024-06-21 11:36:29', 16),
(92, 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Mobile Safari/537.36', '2024-06-21 11:36:30', 16),
(93, 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Mobile Safari/537.36', '2024-06-21 11:36:30', 16),
(94, 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Mobile Safari/537.36', '2024-06-21 11:37:06', 16),
(95, 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Mobile Safari/537.36', '2024-06-21 11:37:07', 16),
(96, 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Mobile Safari/537.36', '2024-06-21 11:37:07', 16),
(97, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', '2024-06-21 12:49:34', 16),
(98, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', '2024-06-21 12:49:35', 16),
(99, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', '2024-06-21 12:49:35', 16),
(100, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', '2024-06-21 12:52:16', 16),
(101, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', '2024-06-21 12:52:17', 16),
(102, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', '2024-06-21 12:52:17', 16),
(103, 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Mobile Safari/537.36', '2024-06-21 12:53:24', 16),
(104, 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Mobile Safari/537.36', '2024-06-21 12:53:26', 16),
(105, 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Mobile Safari/537.36', '2024-06-21 12:53:26', 16),
(106, 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Mobile Safari/537.36', '2024-06-21 12:54:36', 16),
(107, 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Mobile Safari/537.36', '2024-06-21 12:54:37', 16),
(108, 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Mobile Safari/537.36', '2024-06-21 12:54:37', 16),
(109, 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Mobile Safari/537.36', '2024-06-21 12:55:07', 16),
(110, 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Mobile Safari/537.36', '2024-06-21 12:55:08', 16),
(111, 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Mobile Safari/537.36', '2024-06-21 12:55:09', 16),
(112, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', '2024-06-21 12:56:14', 16),
(113, 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Mobile Safari/537.36', '2024-06-21 12:56:17', 16),
(114, 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Mobile Safari/537.36', '2024-06-21 12:56:17', 16),
(115, 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Mobile Safari/537.36', '2024-06-21 12:57:32', 16),
(116, 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Mobile Safari/537.36', '2024-06-21 12:57:33', 16),
(117, 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Mobile Safari/537.36', '2024-06-21 12:57:34', 16),
(118, 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Mobile Safari/537.36', '2024-06-21 12:57:42', 16),
(119, 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Mobile Safari/537.36', '2024-06-21 12:57:43', 16),
(120, 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Mobile Safari/537.36', '2024-06-21 12:57:43', 16),
(121, 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Mobile Safari/537.36', '2024-06-21 12:58:05', 16),
(122, 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Mobile Safari/537.36', '2024-06-21 12:58:07', 16),
(123, 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Mobile Safari/537.36', '2024-06-21 12:58:07', 16),
(124, 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Mobile Safari/537.36', '2024-06-21 13:00:59', 16),
(125, 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Mobile Safari/537.36', '2024-06-21 13:01:01', 16),
(126, 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Mobile Safari/537.36', '2024-06-21 13:01:01', 16),
(127, 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Mobile Safari/537.36', '2024-06-21 13:02:18', 16),
(128, 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Mobile Safari/537.36', '2024-06-21 13:02:19', 16),
(129, 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Mobile Safari/537.36', '2024-06-21 13:02:20', 16),
(130, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', '2024-06-21 13:03:33', 16),
(131, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', '2024-06-21 13:03:34', 16),
(132, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', '2024-06-21 13:03:34', 16),
(133, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', '2024-06-21 13:05:29', 16),
(134, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', '2024-06-21 13:05:30', 16),
(135, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', '2024-06-21 13:05:30', 16),
(136, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', '2024-06-21 13:05:41', 16),
(137, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', '2024-06-21 13:05:42', NULL),
(138, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', '2024-06-21 13:05:42', 16),
(139, 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Mobile Safari/537.36', '2024-06-21 13:06:10', 16),
(140, 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Mobile Safari/537.36', '2024-06-21 13:06:11', 16),
(141, 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Mobile Safari/537.36', '2024-06-21 13:06:12', 16),
(142, 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Mobile Safari/537.36', '2024-06-21 13:06:33', 16),
(143, 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Mobile Safari/537.36', '2024-06-21 13:06:34', 16),
(144, 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Mobile Safari/537.36', '2024-06-21 13:06:35', 16),
(145, 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Mobile Safari/537.36', '2024-06-21 13:06:38', 16),
(146, 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Mobile Safari/537.36', '2024-06-21 13:06:39', 16),
(147, 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Mobile Safari/537.36', '2024-06-21 13:06:40', 16),
(148, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', '2024-06-21 13:07:03', 16),
(149, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', '2024-06-21 13:07:03', 16),
(150, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', '2024-06-21 13:07:04', 16),
(151, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', '2024-06-21 13:07:11', 16),
(152, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', '2024-06-21 13:07:12', 16),
(153, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', '2024-06-21 13:07:12', 16),
(154, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', '2024-06-21 13:15:40', 16),
(155, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', '2024-06-21 13:15:41', 16),
(156, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', '2024-06-21 13:15:41', 16),
(157, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', '2024-06-21 13:16:35', 16),
(158, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', '2024-06-21 13:16:36', 16),
(159, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', '2024-06-21 13:16:36', 16),
(160, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', '2024-06-21 13:17:06', 16),
(161, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', '2024-06-21 13:17:07', 16),
(162, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', '2024-06-21 13:17:07', 16),
(163, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', '2024-06-21 13:20:02', 16),
(164, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', '2024-06-21 13:20:03', 16),
(165, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', '2024-06-21 13:20:03', 16),
(166, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', '2024-06-21 13:20:58', 16),
(167, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', '2024-06-21 13:20:59', 16),
(168, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', '2024-06-21 13:20:59', 16),
(169, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', '2024-06-21 13:21:01', 16),
(170, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', '2024-06-21 13:21:01', 16),
(171, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', '2024-06-21 13:21:02', 16),
(172, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', '2024-06-21 13:27:02', 16),
(173, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', '2024-06-21 13:27:03', 16),
(174, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', '2024-06-21 13:27:03', 16),
(175, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', '2024-06-21 13:31:48', 16),
(176, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', '2024-06-21 13:31:49', 16),
(177, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', '2024-06-21 13:31:49', 16),
(178, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', '2024-06-21 13:44:49', 20),
(179, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', '2024-06-21 13:44:50', 20),
(180, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', '2024-06-21 13:44:51', 20),
(181, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', '2024-06-21 13:45:16', 16),
(182, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', '2024-06-21 13:45:17', 16),
(183, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', '2024-06-21 13:45:17', 16),
(184, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', '2024-06-21 13:45:23', 21),
(185, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', '2024-06-21 13:45:24', 21),
(186, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', '2024-06-21 13:45:24', 21),
(187, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', '2024-06-21 13:50:49', 16),
(188, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', '2024-06-21 13:50:50', 16),
(189, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', '2024-06-21 13:50:50', 16),
(190, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', '2024-06-21 13:52:35', 21),
(191, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', '2024-06-21 13:52:36', 21),
(192, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', '2024-06-21 13:52:36', 21),
(193, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', '2024-06-21 13:54:35', 21),
(194, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', '2024-06-21 13:54:36', 21),
(195, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', '2024-06-21 13:54:36', 21),
(196, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', '2024-06-21 13:56:42', 20),
(197, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', '2024-06-21 13:56:43', 20),
(198, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', '2024-06-21 13:56:43', 20),
(199, 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Mobile Safari/537.36', '2024-06-21 13:57:40', 20),
(200, 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Mobile Safari/537.36', '2024-06-21 13:57:41', 20),
(201, 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Mobile Safari/537.36', '2024-06-21 13:57:42', 20),
(202, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', '2024-06-21 13:59:06', 21),
(203, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', '2024-06-21 13:59:07', 21),
(204, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', '2024-06-21 13:59:07', 21),
(205, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', '2024-06-21 14:00:00', 21),
(206, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', '2024-06-21 14:00:01', 21),
(207, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', '2024-06-21 14:00:01', 21),
(208, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', '2024-06-21 14:00:31', 7),
(209, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', '2024-06-21 14:00:32', 7),
(210, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', '2024-06-21 14:00:32', 7),
(211, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', '2024-06-21 14:01:24', 21),
(212, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', '2024-06-21 14:01:25', 21),
(213, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', '2024-06-21 14:01:25', 21),
(214, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', '2024-06-21 14:01:27', 7),
(215, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', '2024-06-21 14:01:28', 7),
(216, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', '2024-06-21 14:01:28', 7),
(217, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', '2024-06-21 14:01:32', 20),
(218, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', '2024-06-21 14:01:33', 20),
(219, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', '2024-06-21 14:01:33', 20),
(220, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', '2024-06-21 14:05:35', 20),
(221, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', '2024-06-21 14:05:36', 20),
(222, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', '2024-06-21 14:05:36', 20),
(223, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', '2024-06-21 14:14:42', 20),
(224, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', '2024-06-21 14:14:43', 20),
(225, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', '2024-06-21 14:14:43', 20),
(226, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', '2024-06-22 02:15:21', 16),
(227, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', '2024-06-22 02:15:22', 16),
(228, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', '2024-06-22 02:15:22', 16),
(229, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', '2024-06-25 03:08:45', 16),
(230, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', '2024-06-25 03:08:46', 16),
(231, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', '2024-06-25 03:08:46', 16),
(232, 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Mobile Safari/537.36', '2024-06-25 03:09:34', 16),
(233, 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Mobile Safari/537.36', '2024-06-25 03:09:34', 16),
(234, 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Mobile Safari/537.36', '2024-06-25 03:09:35', 16),
(235, 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Mobile Safari/537.36', '2024-06-25 03:09:35', 16);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `article`
--
ALTER TABLE `article`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Chỉ mục cho bảng `article_views`
--
ALTER TABLE `article_views`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Chỉ mục cho bảng `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent_menu_id` (`parent_id`);

--
-- Chỉ mục cho bảng `rss`
--
ALTER TABLE `rss`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Chỉ mục cho bảng `rssnews`
--
ALTER TABLE `rssnews`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `slider`
--
ALTER TABLE `slider`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Chỉ mục cho bảng `totalelements`
--
ALTER TABLE `totalelements`
  ADD PRIMARY KEY (`TableName`);

--
-- Chỉ mục cho bảng `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Chỉ mục cho bảng `user_agents`
--
ALTER TABLE `user_agents`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `article`
--
ALTER TABLE `article`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT cho bảng `article_views`
--
ALTER TABLE `article_views`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT cho bảng `menu`
--
ALTER TABLE `menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT cho bảng `rss`
--
ALTER TABLE `rss`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT cho bảng `rssnews`
--
ALTER TABLE `rssnews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3189;

--
-- AUTO_INCREMENT cho bảng `slider`
--
ALTER TABLE `slider`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT cho bảng `user_agents`
--
ALTER TABLE `user_agents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=236;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `menu`
--
ALTER TABLE `menu`
  ADD CONSTRAINT `menu_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `menu` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
