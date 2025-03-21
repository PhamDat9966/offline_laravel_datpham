-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th3 18, 2025 lúc 08:04 AM
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
-- Cấu trúc bảng cho bảng `appointment`
--

CREATE TABLE `appointment` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `timeMeet` datetime NOT NULL,
  `phonenumber` int(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `appoint` varchar(255) NOT NULL,
  `sex` varchar(255) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `branch_info` text DEFAULT NULL,
  `note` text NOT NULL,
  `status` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Đang đổ dữ liệu cho bảng `appointment`
--

INSERT INTO `appointment` (`id`, `name`, `timeMeet`, `phonenumber`, `email`, `appoint`, `sex`, `branch_id`, `branch_info`, `note`, `status`) VALUES
(2, 'Member001', '2024-08-01 12:00:00', 22345678, 'test@gmail.com', 'dv1', 'nam', 1, NULL, '3231 1daasda sadsad xc', 'inactive'),
(3, 'Phamdat123123213', '2024-08-01 12:00:00', 12345678, 'admin@gmail.com', 'dv1', 'nam', 2, NULL, 'dasdas daasdasd dasdas dsa dá', 'inactive'),
(4, 'Member0011', '2024-08-01 12:00:00', 22345678, 'admin@gmail.com', 'dv1', 'nu', 2, NULL, '312a add dá dsadas d đâs', 'inactive'),
(5, 'test01', '2024-08-03 12:00:00', 12345678, 'test@gmail.com', 'science', 'nam', 1, 'Chi nhánh 1 -Tầng 5, Tòa nhà Songdo, 62A Phạm Ngọc Thạch, Phường 6, Quận 3, Hồ Chí Minh', '123123123123', 'active'),
(6, 'Dat123', '2024-08-03 12:00:00', 12345678, 'test@gmail.com', 'science', 'nam', 2, 'Chi nhánh 2- 757C Kha Vạn Cân, P.Linh Tây, Thủ Đức, Hcm', '312321321 312312  asaas cxzc xcas', 'inactive'),
(7, 'Member00111', '2024-08-06 12:00:00', 22345678, 'admin@gmail.com', 'book', 'nam', 3, 'Chi nhánh 3- 523 Đỗ Xuân Hợp, Block C chung cư The Art, KDCQ10', 'Member00111', 'inactive'),
(8, 'Member002', '2024-08-07 12:00:00', 12345678, 'test@gmail.com', 'science', 'nam', 2, 'Chi nhánh 2- 757C Kha Vạn Cân, P.Linh Tây, Thủ Đức, Hcm', 'dsadasdasd dasda', 'inactive'),
(9, 'Phamdat123123213', '2024-08-20 12:00:00', 12345678, 'phamdat9966@gmail.com', 'science', 'nam', 1, 'Chi nhánh 1 - Tầng 5, Tòa nhà Songdo, 62A Phạm Ngọc Thạch, Phường 6, Quận 3, Hồ Chí Minh', 'test', 'inactive');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `article`
--

CREATE TABLE `article` (
  `id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
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

INSERT INTO `article` (`id`, `category_id`, `name`, `slug`, `content`, `status`, `thumb`, `created`, `created_by`, `modified`, `modified_by`, `publish_at`, `type`) VALUES
(4, 2, 'Liverpool chỉ được nâng Cup phiên bản nếu vô địch hôm nay', 'bv-liverpool-chi-duoc-nang-cup-phien-ban-neu-vo-dich-hom-nay-4', '<p>Đội b&oacute;ng th&agrave;nh phố cảng sẽ kh&ocirc;ng n&acirc;ng Cup nguy&ecirc;n bản nếu vượt mặt Man City ở v&ograve;ng cuối Ngoại hạng Anh.</p>\r\n\r\n<p>Liverpool k&eacute;m Man City một điểm trước khi tiếp Wolverhampton tr&ecirc;n s&acirc;n nh&agrave; Anfield v&agrave;o ng&agrave;y Chủ Nhật. Ở trận đấu c&ugrave;ng giờ, Man City sẽ l&agrave;m kh&aacute;ch tới s&acirc;n Brighton v&agrave; biết một chiến thắng sẽ gi&uacute;p họ bảo vệ th&agrave;nh c&ocirc;ng ng&ocirc;i v&ocirc; địch. Kể từ khi c&aacute;c trận v&ograve;ng cuối Ngoại hạng Anh sẽ chơi đồng loạt c&ugrave;ng l&uacute;c, ban tổ chức phải đặt một chiếc cup phi&ecirc;n bản giống thật tại Anfield ph&ograve;ng trường hợp Liverpool v&ocirc; địch. Chiếc cup giả n&agrave;y thường được d&ugrave;ng trong c&aacute;c sự kiện quảng b&aacute; của Ngoại hạng Anh.&nbsp;</p>', 'active', 'L3Yuzln8II.png', '2024-05-01 00:00:00', 'hailan', '2024-09-19 00:00:00', 'admin', '2019-04-29', 'normal'),
(5, 2, 'Bottas giành pole chặng thứ ba liên tiếp', NULL, '<p>Tay đua Phần Lan đ&aacute;nh bại đồng đội Lewis Hamilton ở v&ograve;ng ph&acirc;n hạng GP T&acirc;y Ban Nha h&ocirc;m 11/5.</p>\r\n\r\n<p>Valtteri Bottas nhanh hơn Hamilton 0,634 gi&acirc;y v&agrave; nhanh hơn người về thứ ba&nbsp;Sebastian Vettel 0,866 gi&acirc;y. Tay đua của Red Bull&nbsp;Max Verstappen nhanh thứ tư, trong khi&nbsp;Charles Leclerc về thứ năm.</p>', 'active', 'iQ1RXPioFZ.jpeg', '2019-05-04 00:00:00', 'hailan', '2024-08-29 00:00:00', 'admin', '2019-04-28', 'normal'),
(6, 2, 'HLV Cardiff: \'Man Utd sẽ không vô địch trong 10 năm tới\'', 'bv-hlv-cardiff-man-utd-se-khong-vo-dich-trong-10-nam-toi-6', '<p>Neil Warnock tỏ ra nghi ngờ về tương lai của Man Utd dưới thời HLV Solskjaer.</p>\r\n\r\n<p>&quot;Một số người nghĩ Man Utd cần từ hai đến ba kỳ chuyển nhượng nữa để gi&agrave;nh danh hiệu&quot;, HLV Neil Warnock chia sẻ. &quot;T&ocirc;i th&igrave; nghĩ c&oacute; thể l&agrave; 10 năm. T&ocirc;i kh&ocirc;ng thấy học&oacute; khả năng bắt kịp hai CLB h&agrave;ng đầu trong khoảng bốn hay năm năm tới&quot;.</p>\r\n\r\n<p>Lần cuối Man Utd v&ocirc; địch l&agrave; m&ugrave;a 2012-2013 dưới thời HLV Sir Alex Ferguson. Kể từ đ&oacute; đến nay, &quot;Quỷ đỏ&quot; kh&ocirc;ng c&ograve;n duy tr&igrave; được vị thế ứng cử vi&ecirc;n v&ocirc; địch h&agrave;ng đầu.&nbsp;</p>', 'active', 'ReChSfB95C.jpeg', '2019-05-04 00:00:00', 'hailan', '2024-08-29 00:00:00', 'admin', '2019-05-30', 'normal'),
(7, 6, 'Đại học Anh đưa khóa học hạnh phúc vào chương trình giảng dạy', 'bv-dai-hoc-anh-dua-khoa-hoc-hanh-phuc-vao-chuong-trinh-giang-day-7', '<p>Kh&oacute;a học diễn ra trong 12 tuần, sinh vi&ecirc;n năm nhất Đại học Bristol sẽ được kh&aacute;m ph&aacute; hạnh ph&uacute;c l&agrave; g&igrave; v&agrave; l&agrave;m thế n&agrave;o để đạt được n&oacute;.</p>\r\n\r\n<p>Đại học Bristol (Anh) quyết định đưa kh&oacute;a học hạnh ph&uacute;c v&agrave;o giảng dạy từ th&aacute;ng 9 năm nay nhằm giảm thiểu t&igrave;nh trạng tự tử ở sinh vi&ecirc;n, sau khi 12 sinh vi&ecirc;n ở một trường kh&aacute;c quy&ecirc;n sinh trong ba năm qua. Gi&aacute;o sư Bruce Hood, nh&agrave; t&acirc;m l&yacute; học chuy&ecirc;n nghi&ecirc;n cứu về c&aacute;ch thức hoạt động của bộ n&atilde;o v&agrave; con người, sẽ giảng dạy m&ocirc;n học mới n&agrave;y.</p>', 'active', 'hoyOyXJrzx.png', '2019-05-04 00:00:00', 'hailan', '2024-08-29 00:00:00', 'admin', '2019-05-05', 'normal'),
(8, 6, '11 cách đơn giản dạy trẻ quản lý thời gian', 'bv-11-cach-don-gian-day-tre-quan-ly-thoi-gian-8', '<p>Phụ huynh h&atilde;y tạo cảm gi&aacute;c vui vẻ, hướng dẫn trẻ thiết lập những ưu ti&ecirc;n h&agrave;ng ng&agrave;y để ch&uacute;ng c&oacute; thể tự quản l&yacute; thời gian hiệu quả.</p>\r\n\r\n<p>&quot;Nhanh l&ecirc;n&quot;, &quot;Con c&oacute; biết mấy giờ rồi kh&ocirc;ng&quot;, &quot;Điều g&igrave; l&agrave;m con mất nhiều thời gian như vậy&quot;..., l&agrave; những c&acirc;u n&oacute;i quen thuộc của phụ huynh để nhắc nhở con về kh&aacute;i niệm thời gian. Thay v&igrave; n&oacute;i những c&acirc;u tr&ecirc;n, phụ huynh c&oacute; thể dạy con c&aacute;ch quản l&yacute; giờ giấc ngay từ khi ch&uacute;ng c&ograve;n nhỏ.</p>', 'active', 'Phe2pSOC5Q.jpeg', '2019-05-04 00:00:00', 'hailan', '2024-08-29 00:00:00', 'admin', '2019-07-30', 'normal'),
(9, 4, 'Vì sao không hút thuốc vẫn bị ung thư phổi?', 'bv-vi-sao-khong-hut-thuoc-van-bi-ung-thu-phoi-9', '<p>D&ugrave; kh&ocirc;ng h&uacute;t thuốc, bạn vẫn c&oacute; nguy cơ ung thư phổi do h&iacute;t phải kh&oacute;i thuốc, tiếp x&uacute;c với kh&iacute; radon hoặc sống trong m&ocirc;i trường &ocirc; nhiễm.&nbsp;</p>\r\n\r\n<p>Người kh&ocirc;ng h&uacute;t thuốc vẫn c&oacute; thể bị ung thư phổi.&nbsp;Tr&ecirc;n&nbsp;<em>Journal of the Royal Society of Medicine</em>,&nbsp;c&aacute;c nh&agrave; khoa học từ&nbsp;Hiệp hội Ung thư Mỹ cho biết 20% bệnh nh&acirc;n ung thư phổi kh&ocirc;ng bao giờ h&uacute;t thuốc.&nbsp;Nghi&ecirc;n cứu 30 năm tr&ecirc;n 1,2 triệu người của tổ chức n&agrave;y cũng chỉ ra số người kh&ocirc;ng h&uacute;t thuốc bị ung thư phổi đang gia tăng. Hầu hết bệnh nh&acirc;n chỉ được chẩn đo&aacute;n khi đ&atilde; bước sang giai đoạn nghi&ecirc;m trọng kh&ocirc;ng thể điều trị.&nbsp;</p>', 'active', 'tPa7bgOesm.png', '2019-05-04 00:00:00', 'hailan', '2024-08-29 00:00:00', 'admin', '2019-08-30', 'normal'),
(10, 6, '10 hãng hàng không  tốt nhất thế giới năm 2019', 'bv-10-hang-hang-khong-tot-nhat-the-gioi-nam-2019-10', '<p>Qatar l&agrave; quốc gia duy nhất tr&ecirc;n thế giới c&oacute; h&atilde;ng h&agrave;ng kh&ocirc;ng v&agrave; s&acirc;n bay tốt nhất năm 2019.</p>\r\n\r\n<p>C&aacute;c s&acirc;n bay được đ&aacute;nh gi&aacute; dựa tr&ecirc;n 3 yếu tố: hiệu suất đ&uacute;ng giờ, chất lượng dịch vụ, thực phẩm v&agrave; lựa chọn mua sắm. Yếu tố đầu ti&ecirc;n chiếm 60% số điểm, hai ti&ecirc;u ch&iacute; c&ograve;n lại chiếm 20%. Dữ liệu của AirHelp được dựa tr&ecirc;n thống k&ecirc; từ nhiều nh&agrave; cung cấp thương mại, c&ugrave;ng cơ sở dữ liệu đ&aacute;nh gi&aacute; ri&ecirc;ng v&agrave; 40.000 khảo s&aacute;t h&agrave;nh kh&aacute;ch được thu thập từ hơn 40 quốc gia trong năm 2018.</p>', 'active', '8GlYE3KYtZ.png', '2019-05-04 00:00:00', 'hailan', '2024-08-29 00:00:00', 'admin', '2019-09-30', 'normal'),
(11, 6, 'Phát hiện bụt mọc cổ thụ hơn 2.600 tuổi ở Mỹ', 'bv-phat-hien-but-moc-co-thu-hon-2600-tuoi-o-my-11', '<p>Ph&aacute;t hiện mới gi&uacute;p bụt mọc trở th&agrave;nh một trong những c&acirc;y sinh sản hữu t&iacute;nh gi&agrave; nhất thế giới, vượt xa ước t&iacute;nh trước đ&acirc;y của c&aacute;c chuy&ecirc;n gia.</p>\r\n\r\n<p>C&aacute;c nh&agrave; khoa học ph&aacute;t hiện một c&acirc;y bụt mọc &iacute;t nhất đ&atilde; 2.624 tuổi ở v&ugrave;ng đầm lầy s&ocirc;ng Black, bang Bắc Carolina, Mỹ, theo nghi&ecirc;n cứu đăng tr&ecirc;n tạp ch&iacute;&nbsp;<em>Environmental Research Communications</em>&nbsp;h&ocirc;m 9/5.&nbsp;</p>\r\n\r\n<p>Nh&oacute;m nghi&ecirc;n cứu bắt gặp bụt mọc cổ thụ n&agrave;y trong l&uacute;c nghi&ecirc;n cứu v&ograve;ng tuổi của c&acirc;y để t&igrave;m hiểu về lịch sử kh&iacute; hậu tại miền đ&ocirc;ng nước Mỹ. Ngo&agrave;i thể hiện tuổi thọ, độ rộng v&agrave; m&agrave;u sắc của v&ograve;ng tuổi tr&ecirc;n th&acirc;n c&acirc;y c&ograve;n cho biết mức độ ẩm ướt hay kh&ocirc; hạn của năm tương ứng.</p>', 'active', 'a09zB7BiwV.jpeg', '2019-05-12 00:00:00', 'hailan', '2024-08-29 00:00:00', 'admin', '2019-05-12', 'normal'),
(12, 6, 'Apple có thể không nâng cấp iOS 13 cho iPhone SE, 6', 'bv-apple-co-the-khong-nang-cap-ios-13-cho-iphone-se-6-12', '<p>Những mẫu iPhone ra mắt từ 2014 v&agrave; iPhone SE c&oacute; thể kh&ocirc;ng được l&ecirc;n đời hệ điều h&agrave;nh iOS 13 ra mắt th&aacute;ng 6 tới.</p>\r\n\r\n<p>Theo&nbsp;<em>Phone Arena</em>, hệ điều h&agrave;nh iOS 13 sắp tr&igrave;nh l&agrave;ng tại hội nghị WWDC 2019 sẽ kh&ocirc;ng hỗ trợ một loạt iPhone đời cũ của Apple. Trong đ&oacute;, đ&aacute;ng ch&uacute; &yacute; l&agrave; c&aacute;c mẫu iPhone vẫn c&ograve;n được nhiều người d&ugrave;ng sử dụng như iPhone 6, 6s Plus hay SE.&nbsp;</p>', 'active', '9jOZGc7BJK.png', '2019-05-12 00:00:00', 'hailan', '2024-08-29 00:00:00', 'admin', '2019-05-10', 'normal'),
(13, 8, 'Hình dung về Honda Jazz thế hệ mới', 'bv-hinh-dung-ve-honda-jazz-the-he-moi-13', '<p>Thế hệ thứ tư của mẫu hatchback Honda tiết chế bớt những đường n&eacute;t g&acirc;n guốc, thể thao để thay bằng n&eacute;t trung t&iacute;nh, hợp mắt người d&ugrave;ng hơn.&nbsp;</p>\r\n\r\n<p>Những h&igrave;nh ảnh đầu ti&ecirc;n về Honda Jazz (Fit tại Nhật Bản) thế hệ mới bắt đầu xuất hiện tr&ecirc;n đường thử. D&ugrave; chưa phải thiết kế ho&agrave;n chỉnh, thay đổi của mẫu hatchback cỡ B cho thấy những đường n&eacute;t trung t&iacute;nh m&agrave; xe sắp sở hữu. Điều n&agrave;y tr&aacute;i ngược với tạo h&igrave;nh g&acirc;n guốc, thể thao ở thế hệ thứ ba hiện tại của Jazz.&nbsp;</p>', 'active', 'g2c7mYXBPW.png', '2019-05-12 00:00:00', 'hailan', '2024-08-29 00:00:00', 'admin', '2019-05-12', 'normal'),
(14, 2, 'Hà Nội vào vòng knock-out AFC Cup', 'bv-ha-noi-vao-vong-knock-out-afc-cup-14', '<p>ĐKVĐ V-League đ&aacute;nh bại&nbsp;Tampines Rovers 2-0 v&agrave;o chiều 15/5 để đứng đầu bảng F.</p>\r\n\r\n<p>Tiếp đối thủ đến từ Singapore trong t&igrave;nh thế buộc phải thắng để tự quyết v&eacute; đi tiếp, H&agrave; Nội đ&atilde; c&oacute; trận đấu dễ d&agrave;ng. C&oacute; thể n&oacute;i, kết quả của trận đấu được định đoạt trong hiệp một khi Oseni v&agrave; Th&agrave;nh Chung lần lượt ghi b&agrave;n cho đội chủ nh&agrave;. Trong khi đ&oacute;, Tampines Rovers phải trả gi&aacute; cho lối chơi th&ocirc; bạo khi Yasir Hanapi nhận thẻ v&agrave;ng thứ hai rời s&acirc;n. Tiền vệ n&agrave;y bị trừng phạt bởi pha đ&aacute;nh nguội với Th&agrave;nh Chung ở đầu trận, sau đ&oacute; l&agrave; t&igrave;nh huống phạm lỗi &aacute;c &yacute; với Đ&igrave;nh Trọng.</p>', 'active', 'e7YyFZJCc8.jpeg', '2019-05-15 00:00:00', 'hailan', '2024-08-29 00:00:00', 'admin', '2019-05-10', 'normal'),
(15, 2, 'Man City vẫn dự Champions League mùa 2019-2020', 'bv-man-city-van-du-champions-league-mua-2019-2020-15', '<p>Việc điều tra vi phạm luật c&ocirc;ng bằng t&agrave;i ch&iacute;nh của chủ s&acirc;n Etihad chưa thể ho&agrave;n th&agrave;nh trong v&ograve;ng một năm tới.</p>\r\n\r\n<p><em>Sports Mail</em>&nbsp;(Anh)&nbsp;cho biết, &aacute;n phạt cấm tham dự Champions League một m&ugrave;a với Man City, do vi phạm luật c&ocirc;ng bằng t&agrave;i ch&iacute;nh (FFP), chỉ được đưa ra sớm nhất v&agrave;o m&ugrave;a 2020-2021.</p>\r\n\r\n<p>Trong bức thư ngỏ gửi tới truyền th&ocirc;ng Anh, Man City viết: &quot;Ch&uacute;ng t&ocirc;i hợp t&aacute;c một c&aacute;ch thiện ch&iacute; với Tiểu ban kiểm so&aacute;t t&agrave;i ch&iacute;nh c&aacute;c CLB của UEFA (CFCB). CLB tin tưởng v&agrave;o sự độc lập v&agrave; cam kết của CFCB h&ocirc;m 7/3, rằng sẽ kh&ocirc;ng kết luận g&igrave; trong thời gian điều tra&quot;.</p>', 'active', 'exzJEG4WDU.jpeg', '2019-05-15 00:00:00', 'hailan', '2024-08-29 00:00:00', 'admin', '2019-05-10', 'normal'),
(16, 6, 'Những câu đố giúp rèn luyện trí não', 'bv-nhung-cau-do-giup-ren-luyen-tri-nao-16', '<p>Bạn cần quan s&aacute;t, suy luận logic v&agrave; c&oacute; vốn từ vựng tiếng Anh để giải quyết những c&acirc;u đố dưới đ&acirc;y.</p>\r\n\r\n<p>C&acirc;u 1:&nbsp;Mike đến một buổi phỏng vấn xin việc. Anh đ&atilde; g&acirc;y ấn tượng với gi&aacute;m đốc về những kỹ năng v&agrave; kinh nghiệm của m&igrave;nh. Tuy nhi&ecirc;n, để quyết định c&oacute; nhận Mike hay kh&ocirc;ng, nữ gi&aacute;m đốc đưa ra một c&acirc;u đố h&oacute;c b&uacute;a v&agrave; y&ecirc;u cầu Mike trả lời trong 30 gi&acirc;y.</p>\r\n\r\n<p>Nội dung c&acirc;u đố: H&atilde;y đưa ra 30 từ tiếng Anh kh&ocirc;ng c&oacute; chữ &quot;a&quot; xuất hiện trong đ&oacute;?&nbsp;</p>\r\n\r\n<p>Mike dễ d&agrave;ng giải quyết c&acirc;u đố. Theo bạn anh ấy n&oacute;i những từ tiếng Anh n&agrave;o để kịp trả lời trong 30 gi&acirc;y?</p>', 'active', 'TpcocqUjob.png', '2019-05-15 00:00:00', 'hailan', '2024-08-29 00:00:00', 'admin', '2019-05-10', 'feature'),
(17, 4, 'Cách nhận biết mật ong nguyên chất và pha trộn', 'bv-cach-nhan-biet-mat-ong-nguyen-chat-va-pha-tron-17', '<p>Mật ong nguy&ecirc;n chất sẽ kh&ocirc;ng thấm qua tờ giấy, lắng xuống đ&aacute;y ly nước v&agrave; bị kiến ăn, kh&aacute;c với mật ong bị pha trộn tạp chất.</p>\r\n\r\n<p>Dược sĩ V&otilde; H&ugrave;ng Mạnh, Trưởng khoa Dược Bệnh viện Y học d&acirc;n tộc cổ truyền B&igrave;nh Định, cho biết thị trường c&oacute; nhiều loại mật ong bị pha trộn, chỉ nh&igrave;n bề ngo&agrave;i hay ngửi m&ugrave;i chưa chắc ph&acirc;n biệt được.</p>\r\n\r\n<p>Theo dược sĩ H&ugrave;ng, một c&aacute;ch ph&acirc;n biệt thật giả l&agrave; lấy cọng h&agrave;nh tươi nh&uacute;ng v&agrave;o lọ mật ong, lấy ra chừng v&agrave;i ph&uacute;t. Cọng l&aacute; h&agrave;nh sẽ chuyển từ m&agrave;u xanh l&aacute; sang sậm nếu mật ong thật. Ngo&agrave;i ra, c&oacute; thể nhỏ giọt mật v&agrave;o nơi c&oacute; kiến, nếu kiến kh&ocirc;ng bu giọt mật th&igrave; cũng l&agrave; mật ong thật.</p>\r\n\r\n<p>Ng&agrave;y nay, nhiều người đặt mật ong v&agrave;o ngăn đ&aacute; tủ lạnh, sau 24 giờ m&agrave; kh&ocirc;ng c&oacute; hiện tượng đ&ocirc;ng đ&aacute; th&igrave; l&agrave; mật thật.</p>', 'active', 'xvEqmF5uyJ.png', '2019-05-15 00:00:00', 'hailan', '2024-08-29 00:00:00', 'admin', '2019-05-10', 'normal'),
(18, 6, 'Nhiều tour mùa hè giảm giá hàng chục triệu đồng', 'bv-nhieu-tour-mua-he-giam-gia-hang-chuc-trieu-dong-18', '<p>C&aacute;c tour trong v&agrave; ngo&agrave;i nước đều được giảm gi&aacute; mạnh để k&iacute;ch cầu du lịch trong dịp h&egrave;, nhiều chương tr&igrave;nh khuyến m&atilde;i l&ecirc;n đến h&agrave;ng chục triệu đồng.</p>\r\n\r\n<p>Sau khi so s&aacute;nh tiền v&eacute; m&aacute;y bay, ph&ograve;ng kh&aacute;ch sạn ở Bali để chuẩn bị cho kỳ nghỉ h&egrave; của gia đ&igrave;nh, anh Sơn (ngụ quận 2, TP HCM) quyết định chuyển sang mua tour trọn g&oacute;i v&igrave; tiết kiệm hơn.</p>', 'active', 'd2ABCeBzoR.jpeg', '2019-05-15 00:00:00', 'hailan', '2024-08-29 00:00:00', 'admin', '2019-05-15', 'normal'),
(19, 8, 'BMW i8 Roadster - xe mui trần dẫn đường ở Formula E', 'bv-bmw-i8-roadster---xe-mui-tran-dan-duong-o-formula-e-19', '<p>Dịp cuối tuần qua, BMW giới thiệu chiếc xe dẫn đường, l&agrave;m nhiệm vụ đảm bảo an to&agrave;n tại giải đua xe Formula E. Giải đua tương tự giải F1, nhưng to&agrave;n bộ xe đua sử dụng động cơ điện.</p>\r\n\r\n<p>i8 Roadster Safety Car dựa tr&ecirc;n chiếc i8 Roadster ti&ecirc;u chuẩn, nhưng c&oacute; những thay đổi để trở th&agrave;nh chiếc xe dẫn đường chuy&ecirc;n dụng. Ngoại h&igrave;nh c&oacute; một số đặc điểm ấn tượng hơn so với nguy&ecirc;n bản. K&iacute;nh chắn gi&oacute; kiểu d&agrave;nh cho xe đua, trọng t&acirc;m hạ thấp 15 mm.</p>', 'active', '9fbeUKTBpU.png', '2019-05-15 00:00:00', 'hailan', '2024-08-29 00:00:00', 'admin', '2019-05-10', 'normal'),
(20, 6, 'Tia cực tím tại Hà Nội ở mức \'nguy hiểm\'', 'bv-tia-cuc-tim-tai-ha-noi-o-muc-nguy-hiem-20', '<p>Chỉ số tia UV tại H&agrave; Nội ng&agrave;y 18-19/5 l&ecirc;n tới 11, mức được đ&aacute;nh gi&aacute; l&agrave; &quot;nguy hiểm&quot; dễ khiến da, mắt bị bỏng nhiệt.</p>\r\n\r\n<p><img alt=\"\" src=\"http://proj_news.xyz/images/article/tia-cuc-tim-hanoi.png\" style=\"height:171px; width:674px\" /></p>\r\n\r\n<p>H&agrave; Nội đang trải qua đợt nắng n&oacute;ng gay gắt. Theo Trung t&acirc;m Dự b&aacute;o Kh&iacute; tượng Thủy văn Quốc gia, nhiệt độ cao nhất ở H&agrave; Nội ng&agrave;y 18/5 dao động trong khoảng 37 đến 39 độ C, c&oacute; nơi tr&ecirc;n 39 độ.&nbsp;Trang&nbsp;<em>World Weather Online</em>&nbsp;của Anh dự b&aacute;o chỉ số tia cực t&iacute;m tại H&agrave; Nội hai ng&agrave;y 18-19/5 đạt mức 11.&nbsp;</p>', 'active', 'C4DtP4ico8.png', '2019-05-17 00:00:00', 'hailan', '2024-08-29 00:00:00', 'admin', '2019-05-16', 'normal'),
(21, 3, 'Blockchain và trí tuệ nhân tạo AI làm thay đổi giáo dục trực tuyến', 'bv-blockchain-va-tri-tue-nhan-tao-ai-lam-thay-doi-giao-duc-truc-tuyen-21', '<p>Blockchain khiến dữ liệu trở n&ecirc;n c&ocirc;ng khai, minh bạch với người học, AI gi&uacute;p cải thiện khả năng tương t&aacute;c v&agrave; giảng dạy với từng c&aacute; nh&acirc;n.</p>\r\n\r\n<p>Sự b&ugrave;ng nổ của Internet v&agrave; những c&ocirc;ng nghệ mới như chuỗi khối (Blockchain) v&agrave; tr&iacute; tuệ nh&acirc;n tạo (AI) đ&atilde; g&oacute;p phần l&agrave;m thay đổi nền gi&aacute;o dục tr&ecirc;n to&agrave;n thế giới, h&igrave;nh th&agrave;nh những nền tảng Online Learning với nhiều ưu thế.</p>\r\n\r\n<p><strong>Mobile Learning dự b&aacute;o l&agrave; &quot;Cuộc c&aacute;ch mạng tiếp theo&quot; của gi&aacute;o dục trực tuyến</strong></p>\r\n\r\n<p>Theo nghi&ecirc;n cứu của Global Market Insights, thị trường gi&aacute;o dục trực tuyến to&agrave;n cầu đang c&oacute; tốc độ ph&aacute;t triển nhanh chưa từng thấy khi nền tảng hạ tầng Internet ng&agrave;y c&agrave;ng ho&agrave;n thiện v&agrave; phủ s&oacute;ng rộng khắp. Gi&aacute; trị c&aacute;c start-up về EdTech (C&ocirc;ng ty c&ocirc;ng nghệ chuy&ecirc;n về gi&aacute;o dục) to&agrave;n cầu được ước t&iacute;nh hơn 190 tỷ USD v&agrave;o năm 2018 v&agrave; dự kiến vượt hơn 300 tỷ USD v&agrave;o năm 2025.</p>', 'active', 'Im5BdAHqV1.png', '2019-05-17 00:00:00', 'hailan', '2024-09-16 00:00:00', 'admin', '2019-05-16', 'normal'),
(22, 6, 'Huawei nói lệnh cấm sẽ khiến Mỹ tụt hậu về 5G', 'bv-huawei-noi-lenh-cam-se-khien-my-tut-hau-ve-5g-22', '<p>Huawei khẳng định sắc lệnh mới của Mỹ sẽ chỉ c&agrave;ng khiến qu&aacute; tr&igrave;nh triển khai c&ocirc;ng nghệ 5G ở nước n&agrave;y th&ecirc;m chậm chạp v&agrave; đắt đỏ.</p>\r\n\r\n<p>H&atilde;ng c&ocirc;ng nghệ Trung Quốc tự nhận l&agrave; &quot;người dẫn đầu kh&ocirc;ng ai s&aacute;nh kịp về c&ocirc;ng nghệ 5G&quot;, n&ecirc;n việc bị hạn chế kinh doanh ở Mỹ chỉ dẫn đến kết cục l&agrave; Mỹ sẽ bị &quot;tụt lại ph&iacute;a sau&quot; trong việc triển khai c&ocirc;ng nghệ kết nối di động thế hệ mới</p>', 'active', 'nt1QxhKUXM.jpeg', '2019-05-17 00:00:00', 'hailan', '2024-08-29 00:00:00', 'admin', '2019-05-16', 'normal'),
(23, 7, 'Asus ra mắt Zenfone 6 với camera lật tự động', 'bv-asus-ra-mat-zenfone-6-voi-camera-lat-tu-dong-23', '<p>Với thiết kế m&agrave;n h&igrave;nh tr&agrave;n viền ho&agrave;n to&agrave;n kh&ocirc;ng tai thỏ, camera ch&iacute;nh 48 megapixel tr&ecirc;n Zenfone 6 c&oacute; thể lật từ sau ra trước biến th&agrave;nh camera selfie.</p>\r\n\r\n<p>Zenfone 6 l&agrave; một trong những smartphone c&oacute; viền m&agrave;n h&igrave;nh mỏng nhất tr&ecirc;n thị trường với tỷ lệ m&agrave;n h&igrave;nh hiển thị chiếm tới 92% diện t&iacute;ch mặt trước. M&aacute;y c&oacute; m&agrave;n h&igrave;nh 6,4 inch tr&agrave;n viền ra cả bốn cạnh, kh&ocirc;ng tai thỏ như một số mẫu Zenfone trước v&agrave; cũng kh&ocirc;ng d&ugrave;ng thiết kế đục lỗ như Galaxy S10, S10+...</p>', 'active', 'aiC6j6fWZY.png', '2019-05-17 00:00:00', 'hailan', '2024-10-26 00:00:00', 'admin', '2019-05-16', 'normal'),
(34, 7, 'trí tuệ nhân tạo AI', 'bv-tri-tue-nhan-tao-ai-34', '<p>Trong thời đại m&agrave; tiến bộ c&ocirc;ng nghệ kh&ocirc;ng chỉ l&agrave; một lựa chọn m&agrave; c&ograve;n l&agrave; điều cần thiết, c&aacute;c doanh nghiệp đang ng&agrave;y c&agrave;ng chuyển sang sử dụng Tr&iacute; tuệ nh&acirc;n tạo (AI) để hợp l&yacute; h&oacute;a hoạt động, n&acirc;ng cao hiệu quả v&agrave; đạt được hiệu quả hoạt động xuất sắc. Việc t&iacute;ch hợp AI trong khu&ocirc;n khổ Vận h&agrave;nh xuất sắc (Operational Excellence) hay Lean Six Sigma kh&ocirc;ng chỉ c&oacute; thể tối ưu h&oacute;a hoạt động, quy tr&igrave;nh v&agrave; hệ thống của c&ocirc;ng ty m&agrave; c&ograve;n đ&oacute;ng g&oacute;p đ&aacute;ng kể v&agrave;o văn h&oacute;a cải tiến li&ecirc;n tục v&agrave; tạo ra gi&aacute; trị.&nbsp;</p>\r\n\r\n<p><img alt=\"\" src=\"http://proj_news.xyz/images/article/tri-tue-nhan-tao-ai-la-gi-ung-dung-nhu-the-nao-trong-cuoc-song--6.jpg\" style=\"height:354px; width:630px\" /></p>\r\n\r\n<p>B&agrave;i viết n&agrave;y t&igrave;m hiểu c&aacute;c c&acirc;u hỏi &#39;tại sao&#39;, &#39;c&aacute;i g&igrave;&#39;, &#39;như thế n&agrave;o&#39; v&agrave; &#39;điều g&igrave; sẽ xảy ra tiếp theo&#39; khi &aacute;p dụng AI trong kinh doanh, n&ecirc;u bật cả những cơ hội v&agrave; th&aacute;ch thức m&agrave; n&oacute; mang lại.</p>', 'active', 'cC2FlDJ7S3.jpg', '2024-08-23 00:00:00', 'admin', '2025-02-10 00:00:00', 'admin', NULL, NULL);

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
(1, 23, 4, '2024-02-29 00:00:00', 'active', '2024-02-29 13:46:40'),
(2, 16, 5, '2024-03-12 00:00:00', 'active', '2024-03-12 09:05:57'),
(3, 15, 4, '2024-03-25 00:00:00', 'active', '2024-03-25 14:44:49'),
(4, 21, 4, '2024-06-17 00:00:00', 'active', '2024-06-17 23:55:11'),
(5, 22, 3, '2024-06-17 00:00:00', 'active', '2024-06-17 23:56:14'),
(6, 4, 2, '2024-09-17 00:00:00', 'active', '2024-09-18 04:27:19'),
(7, 35, 1, '2024-10-16 00:00:00', 'active', '2024-10-16 13:48:04'),
(8, 34, 4, '2024-10-16 00:00:00', 'active', '2024-10-16 13:55:55'),
(9, 20, 6, '2024-10-21 00:00:00', 'active', '2024-10-21 08:46:15'),
(10, 18, 2, '2024-10-21 00:00:00', 'active', '2024-10-21 08:51:07'),
(11, 14, 1, '2024-10-21 00:00:00', 'active', '2024-10-21 08:55:23'),
(12, 11, 1, '2024-10-21 00:00:00', 'active', '2024-10-21 08:59:21'),
(13, 7, 2, '2024-10-21 00:00:00', 'active', '2024-10-21 09:05:09'),
(14, 6, 1, '2024-10-21 00:00:00', 'active', '2024-10-21 09:05:59'),
(15, 3, 1, '2024-10-21 00:00:00', 'active', '2024-10-21 09:06:06'),
(16, 5, 1, '2024-10-21 00:00:00', 'active', '2024-10-21 09:06:12');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `attribute`
--

CREATE TABLE `attribute` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `status` varchar(225) DEFAULT NULL,
  `fieldClass` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Đang đổ dữ liệu cho bảng `attribute`
--

INSERT INTO `attribute` (`id`, `name`, `status`, `fieldClass`) VALUES
(1, 'color', 'active', 'màu sắc'),
(2, 'material', 'active', 'dung lượng'),
(3, 'slogan', 'active', 'khẩu hiệu');

--
-- Bẫy `attribute`
--
DELIMITER $$
CREATE TRIGGER `before_attribute_delete` BEFORE DELETE ON `attribute` FOR EACH ROW DELETE FROM attribute_value
  WHERE attribute_id = OLD.id
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `attribute_value`
--

CREATE TABLE `attribute_value` (
  `id` int(11) NOT NULL,
  `attribute_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `fieldClass` varchar(255) DEFAULT NULL,
  `status` varchar(225) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `created_by` varchar(225) DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `modified_by` varchar(225) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Đang đổ dữ liệu cho bảng `attribute_value`
--

INSERT INTO `attribute_value` (`id`, `attribute_id`, `name`, `color`, `fieldClass`, `status`, `created`, `created_by`, `modified`, `modified_by`) VALUES
(1, 1, 'vàng', '#d5ff05', NULL, 'active', NULL, NULL, NULL, NULL),
(2, 1, 'đỏ', '#ff0000', NULL, 'active', NULL, NULL, NULL, NULL),
(3, 1, 'xanh', '#0011ff', NULL, 'active', NULL, NULL, NULL, NULL),
(56, 2, '128 GB', NULL, NULL, 'active', '2024-12-23 00:00:00', 'admin', NULL, NULL),
(57, 2, '256 GB', NULL, NULL, 'active', '2024-12-23 00:00:00', 'admin', NULL, NULL),
(58, 2, '512 GB', NULL, NULL, 'active', '2024-12-23 00:00:00', 'admin', NULL, NULL),
(59, 3, 'zenvn', NULL, NULL, 'active', '2024-12-23 00:00:00', 'admin', NULL, NULL),
(60, 3, 'Laravel', NULL, NULL, 'active', '2024-12-23 00:00:00', 'admin', NULL, NULL);

--
-- Bẫy `attribute_value`
--
DELIMITER $$
CREATE TRIGGER `before_attribute_value_delete` BEFORE DELETE ON `attribute_value` FOR EACH ROW DELETE FROM product_has_attribute
  WHERE attribute_value_id = OLD.id
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `branch`
--

CREATE TABLE `branch` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` text NOT NULL,
  `googlemap` text DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `modified_by` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Đang đổ dữ liệu cho bảng `branch`
--

INSERT INTO `branch` (`id`, `name`, `address`, `googlemap`, `status`, `created`, `created_by`, `modified`, `modified_by`) VALUES
(1, 'Chi nhánh 1 ', 'Tầng 5, Tòa nhà Songdo, 62A Phạm Ngọc Thạch, Phường 6, Quận 3, Hồ Chí Minh', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3918.360420162197!2d106.73409077043847!3d10.860167434007112!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x317527d5640014e7%3A0x3bb323b29d50dca9!2zWmVuZFZOIC0gxJDDoG8gVOG6oW8gTOG6rXAgVHLDrG5oIFZpw6pu!5e0!3m2!1svi!2s!4v1723180040792!5m2!1svi!2s\" width=\"600\" height=\"500\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>', 'active', '2024-08-03 02:09:49', 'admin', NULL, NULL),
(2, 'Chi nhánh 2', '757C Kha Vạn Cân, P.Linh Tây, Thủ Đức, Hcm', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3918.394524423644!2d106.75456067408862!3d10.857567757693781!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752790c6385033%3A0xcea70174e60f1df1!2zNzU3QyDEkC4gS2hhIFbhuqFuIEPDom4sIEtodSBQaOG7kSAzLCBUaOG7pyDEkOG7qWMsIEjhu5MgQ2jDrSBNaW5oLCBWaeG7h3QgTmFt!5e0!3m2!1svi!2s!4v1723180130179!5m2!1svi!2s\" width=\"600\" height=\"500\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>', 'active', '2024-08-03 02:10:01', 'admin', NULL, NULL),
(3, 'Chi nhánh 3', '523 Đỗ Xuân Hợp, Block C chung cư The Art, KDCQ10', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d7837.938494461986!2d106.76874347770996!3d10.81366530000001!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3175270f5c87c7f5%3A0x7523fa4ea7f3c8fa!2sChung%20C%C6%B0%20The%20Art!5e0!3m2!1svi!2s!4v1723180243970!5m2!1svi!2s\" width=\"600\" height=\"500\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>', 'active', '2024-08-03 02:10:09', 'admin', '2024-10-26 00:00:00', 'admin');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `category_article`
--

CREATE TABLE `category_article` (
  `id` int(11) NOT NULL,
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `status` text NOT NULL,
  `is_home` tinyint(1) DEFAULT NULL,
  `display` varchar(255) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `created_by` varchar(45) DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `modified_by` varchar(45) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `_lft` int(11) DEFAULT NULL,
  `_rgt` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=DYNAMIC;

--
-- Đang đổ dữ liệu cho bảng `category_article`
--

INSERT INTO `category_article` (`id`, `name`, `slug`, `status`, `is_home`, `display`, `created`, `created_by`, `modified`, `modified_by`, `parent_id`, `_lft`, `_rgt`) VALUES
(1, 'Root', '', 'active', 0, '', NULL, '', NULL, '', NULL, 1, 20),
(2, 'Thể Thao', 'cm-the-thao-2', 'active', 1, 'grid', '2024-09-10 00:00:00', 'dat123', '2024-09-20 00:00:00', 'dat123', 3, 3, 6),
(3, 'Giáo dục', 'cm-giao-duc-3', 'active', 1, 'list', '2024-09-10 00:00:00', 'dat123', '2024-10-21 00:00:00', 'admin', 1, 2, 7),
(4, 'Sức khỏe', 'cm-suc-khoe-4', 'active', 1, 'grid', '2024-09-10 00:00:00', 'dat123', '2024-10-21 00:00:00', 'admin', 1, 8, 15),
(5, 'Du lịch', 'cm-du-lich-5', 'active', 0, 'list', '2024-09-10 00:00:00', 'dat123', '2025-02-11 00:00:00', 'admin', 4, 9, 12),
(6, 'Khoa học', 'cm-khoa-hoc-6', 'active', 1, 'grid', '2024-09-10 00:00:00', 'dat123', '2024-09-20 00:00:00', 'dat123', 4, 13, 14),
(7, 'Số hóa', 'cm-so-hoa-7', 'active', 1, 'grid', '2024-09-10 00:00:00', 'dat123', '2025-02-11 00:00:00', 'admin', 5, 10, 11),
(8, 'Xe - Ô tô', 'cm-xe-o-to-8', 'active', 1, 'list', '2024-09-10 00:00:00', 'dat123', '2024-09-20 00:00:00', 'dat123', 1, 16, 17),
(9, 'Kinh doanh', 'cm-kinh-doanh-9', 'active', 0, 'grid', '2024-09-10 00:00:00', 'dat123', '2025-02-10 00:00:00', 'admin', 1, 18, 19),
(10, 'Thể thao child001', 'cm-the-thao-child001-10', 'active', 0, 'list', '2024-09-10 00:00:00', 'dat123', '2025-02-11 00:00:00', 'admin', 2, 4, 5);

--
-- Bẫy `category_article`
--
DELIMITER $$
CREATE TRIGGER `updateTotalElements` AFTER INSERT ON `category_article` FOR EACH ROW BEGIN
  UPDATE totalelements
  SET ElementCount = ElementCount + 1
  WHERE TableName = 'category_article';
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `updateTotalElementsAfterDelete` AFTER DELETE ON `category_article` FOR EACH ROW BEGIN
  UPDATE totalelements
  SET ElementCount = ElementCount - 1
  WHERE TableName = 'category_article';
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `updateTotalElementsAfterUpdate` AFTER UPDATE ON `category_article` FOR EACH ROW BEGIN
  -- Assuming that the primary key of the article table is 'id'
  IF NEW.id <> OLD.id THEN
    UPDATE totalelements
    SET ElementCount = ElementCount + 1
    WHERE TableName = 'category_article';
  END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `category_product`
--

CREATE TABLE `category_product` (
  `id` int(11) NOT NULL,
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `status` text NOT NULL,
  `is_home` tinyint(1) DEFAULT NULL,
  `display` varchar(255) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `created_by` varchar(45) DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `modified_by` varchar(45) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `_lft` int(11) DEFAULT NULL,
  `_rgt` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=DYNAMIC;

--
-- Đang đổ dữ liệu cho bảng `category_product`
--

INSERT INTO `category_product` (`id`, `name`, `slug`, `status`, `is_home`, `display`, `created`, `created_by`, `modified`, `modified_by`, `parent_id`, `_lft`, `_rgt`) VALUES
(1, 'Root', '', 'active', 0, '', NULL, '', NULL, '', NULL, 1, 20),
(6, 'Điện thoại', 'cm-dien-thoai-6', 'active', NULL, 'list', '2024-10-22 00:00:00', 'dat123', '2024-10-26 00:00:00', 'admin', 1, 2, 9),
(3, 'Laptop', 'cm-laptop-3', 'active', NULL, NULL, '2024-10-22 00:00:00', 'dat123', '2024-10-24 00:00:00', 'admin', 4, 11, 12),
(4, 'Máy tính', 'cm-may-tinh--4', 'active', NULL, 'grid', '2024-10-22 00:00:00', 'dat123', '2024-10-24 00:00:00', 'admin', 1, 10, 15),
(5, 'Đồng hồ', 'cm-dong-ho-5', 'active', NULL, NULL, '2024-10-22 00:00:00', 'dat123', '2024-10-22 00:00:00', 'dat123', 1, 16, 17),
(7, 'Tivi', 'cm-tivi-7', 'active', NULL, NULL, '2024-10-29 00:00:00', 'admin', '2024-10-29 00:00:00', 'admin', 1, 18, 19),
(8, 'Iphone', 'cm-iphone-8', 'active', NULL, NULL, '2024-10-29 00:00:00', 'admin', '2024-10-29 00:00:00', 'admin', 6, 3, 4),
(9, 'Samsung', 'cm-samsung-9', 'active', NULL, NULL, '2024-10-29 00:00:00', 'admin', '2024-10-29 00:00:00', 'admin', 6, 5, 6),
(10, 'decktop', 'cm-decktop-10', 'active', NULL, NULL, '2024-10-29 00:00:00', 'admin', '2024-10-29 00:00:00', 'admin', 4, 13, 14),
(11, 'oppo', 'cm-oppo-11', 'active', NULL, NULL, '2025-02-06 00:00:00', 'admin', '2025-02-06 00:00:00', 'admin', 6, 7, 8);

--
-- Bẫy `category_product`
--
DELIMITER $$
CREATE TRIGGER `before_category_product_delete` BEFORE DELETE ON `category_product` FOR EACH ROW DELETE FROM product
  WHERE category_product_id = OLD.id
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `contact`
--

CREATE TABLE `contact` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` text NOT NULL,
  `message` text NOT NULL,
  `status` varchar(255) NOT NULL,
  `time` datetime NOT NULL,
  `ip_address` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Đang đổ dữ liệu cho bảng `contact`
--

INSERT INTO `contact` (`id`, `name`, `email`, `phone`, `message`, `status`, `time`, `ip_address`) VALUES
(1, 'abc123', 'admin@gmail.com', '123213213', 'dsdad dasdasd đấ dasdas', 'inactive', '2024-08-19 11:10:00', '127.0.0.1'),
(2, 'abc1234', 'admin@gmail.com', '123456789112345', 'dadasda dá đấ dasdas dsadas', 'inactive', '2024-08-19 11:15:00', '127.0.0.1'),
(3, 'test01', 'test@gmail.com', '22345678', 'sadasd dadas dasd asdas', 'inactive', '2024-08-19 12:38:00', '127.0.0.1');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `coupon`
--

CREATE TABLE `coupon` (
  `id` int(11) NOT NULL,
  `code` varchar(255) NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  `value` int(11) NOT NULL,
  `start_time` datetime NOT NULL DEFAULT current_timestamp(),
  `end_time` datetime NOT NULL DEFAULT current_timestamp(),
  `start_price` int(11) NOT NULL,
  `end_price` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `total_use` int(11) NOT NULL,
  `status` varchar(255) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `modified_by` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Đang đổ dữ liệu cho bảng `coupon`
--

INSERT INTO `coupon` (`id`, `code`, `type`, `value`, `start_time`, `end_time`, `start_price`, `end_price`, `total`, `total_use`, `status`, `created`, `created_by`, `modified`, `modified_by`) VALUES
(1, '5KOyp5', 'percent', 10, '2024-12-06 16:12:01', '2024-12-23 08:12:01', 50000, 100000, 10, 0, 'active', '2024-12-07 08:20:01', 'admin', '2024-12-12 00:00:00', 'admin'),
(2, 'tg2CJM', 'percent', 30, '2024-12-02 15:12:00', '2024-12-31 23:12:59', 30000, 50000, 10, 0, 'active', '2024-12-12 00:00:00', 'admin', '2024-12-13 00:00:00', 'admin'),
(3, '2ywu0e', 'price', 10000, '2024-12-03 06:12:00', '2025-01-02 16:01:59', 10000, 50000, 20, 0, 'active', '2024-12-14 00:00:00', 'admin', '2024-12-21 00:00:00', 'admin');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `media`
--

CREATE TABLE `media` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `attribute_value_id` int(11) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `is_video` varchar(225) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `media_type` enum('default','attribute') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Đang đổ dữ liệu cho bảng `media`
--

INSERT INTO `media` (`id`, `product_id`, `attribute_value_id`, `content`, `position`, `url`, `is_video`, `description`, `media_type`) VALUES
(144, 27, NULL, '{\"name\":\"OVJBUaMpMD.jpg\",\"alt\":\"default\",\"size\":92638}', NULL, '', 'false', 'image not for attribute_values', 'default'),
(145, 27, NULL, '{\"name\":\"eIW2UNXs6l.jpg\",\"alt\":\"01\",\"size\":23260}', NULL, '', 'false', 'image not for attribute_values', 'default'),
(146, 27, NULL, '{\"name\":\"rOCb4BTVVV.png\",\"alt\":\"02\",\"size\":285090}', NULL, '', 'false', 'image not for attribute_values', 'default'),
(147, 28, NULL, '{\"name\":\"HNH5dG7sgH.jpg\",\"alt\":\"default\",\"size\":76803}', NULL, '', 'false', 'image not for attribute_values', 'default'),
(148, 28, NULL, '{\"name\":\"flST3ixxW2.jpg\",\"alt\":\"01\",\"size\":36345}', NULL, '', 'false', 'image not for attribute_values', 'default'),
(149, 28, NULL, '{\"name\":\"fYC0oCXJfz.jpg\",\"alt\":\"02\",\"size\":31082}', NULL, '', 'false', 'image not for attribute_values', 'default'),
(150, 29, NULL, '{\"name\":\"fucrsJPeVY.png\",\"alt\":\"oppo-01\",\"size\":139815}', NULL, '', 'false', 'image not for attribute_values', 'default'),
(151, 29, NULL, '{\"name\":\"jcIKlXjftY.jpg\",\"alt\":\"oppo-02\",\"size\":44541}', NULL, '', 'false', 'image not for attribute_values', 'default'),
(152, 29, NULL, '{\"name\":\"QvL0eruDDp.jpg\",\"alt\":\"oppo-03\",\"size\":36885}', NULL, '', 'false', 'image not for attribute_values', 'default');

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
(1, 'Trang chủ', 'active', '/', 1, 'link', 'new_window', NULL, NULL, 'main-menu', NULL, NULL, '2024-10-26 00:00:00', 'admin'),
(2, 'Sản phẩm', 'inactive', '#', 2, 'category_product', 'current', NULL, NULL, '<p>main-menu</p>', NULL, NULL, '2024-09-23 00:00:00', 'admin'),
(3, 'Blog', 'inactive', '#', 3, 'category_article', 'current', NULL, NULL, '<p>main-menu</p>', NULL, NULL, '2024-10-16 00:00:00', 'admin'),
(4, 'câu đố trí não', 'inactive', '/bv-nhung-cau-do-giup-ren-luyen-tri-nao-16.php', 4, 'link', 'current', 3, NULL, NULL, NULL, NULL, '2024-09-13 00:00:00', 'dat123'),
(5, 'Test-02', 'inactive', '#', 6, 'link', '2', 3, NULL, NULL, NULL, NULL, '2024-03-26 00:00:00', 'admin'),
(6, 'Category', 'active', '/chuyen-muc', 7, 'link', 'current', 3, NULL, NULL, NULL, NULL, '2024-09-13 00:00:00', 'dat123'),
(7, 'Article', 'active', '/bv', 8, 'category_article', 'current', 3, NULL, '<p>Article no container</p>', NULL, NULL, '2024-08-24 00:00:00', 'admin'),
(8, 'Tin tức tổng hợp', 'active', '/tin-tuc-tong-hop', 14, 'category_product', 'current', NULL, NULL, '<p>main-menu</p>', NULL, NULL, '2024-03-26 00:00:00', 'admin'),
(9, 'Hình ảnh', 'active', '/thu-vien-hinh-anh', 13, 'link', 'current', NULL, NULL, '<p>main-menu</p>', NULL, NULL, '2024-03-26 00:00:00', 'admin'),
(10, 'Liên hệ', 'active', '/lien-he', 20, 'link', 'current', NULL, NULL, '<p>main-menu</p>', '2024-08-08 00:00:00', 'admin', '2024-08-08 00:00:00', 'admin'),
(20, 'Danh Mục', 'active', '#', 7, 'link', 'current', NULL, 'category', NULL, NULL, NULL, '2024-09-13 00:00:00', 'dat123'),
(21, 'Article-container', 'inactive', '/', 15, 'category_article', 'current', 3, 'article', '<p>Article container</p>', NULL, NULL, '2024-08-24 00:00:00', 'admin'),
(23, 'Giáo Dục', 'active', '/cm-category-giao-duc-2.php', 10, 'link', 'current', 3, NULL, '<p>category-giaoduc-id=2</p>', NULL, NULL, '2024-09-19 00:00:00', 'admin'),
(24, 'Tia cực tím', 'inactive', '/bv-tia-cuc-tim-tai-ha-noi-o-muc-nguy-hiem-20.php', 11, 'link', 'current', NULL, NULL, 'Tia cực tím tại Hà Nội ở mức \'nguy hiểm\'-id=20', NULL, NULL, '2024-09-13 00:00:00', 'dat123'),
(30, 'Zendvn', 'active', 'https://zendvn.com/', 12, 'link', '_new', NULL, NULL, '<p>Trang web zendvn</p>', '2024-02-28 00:00:00', 'admin', '2024-02-29 00:00:00', 'admin'),
(37, 'Thể thao', 'active', '/cm-category-the-thao-1.php', 10, 'link', 'current', 6, NULL, '<p>category-the-thao-1=2</p>', NULL, NULL, '2024-09-19 00:00:00', 'admin'),
(38, 'Sức khỏe', 'active', '/cm-category-suc-khoe-3.php', 10, 'link', 'current', 6, NULL, '<p>category-suc-khoe-3=2</p>', NULL, NULL, '2024-09-19 00:00:00', 'admin'),
(39, 'Khoa học', 'active', '/cm-category-khoa-hoc-5.php', 10, 'link', 'current', 6, NULL, '<p>category-khoa-hoc-5=5</p>', NULL, NULL, '2024-09-19 00:00:00', 'admin'),
(40, 'Số hóa', 'active', '/cm-category-so-hoa-6.php', 10, 'link', 'current', 6, NULL, '<p>category-so-hoa-6=6</p>', NULL, NULL, '2024-09-19 00:00:00', 'admin'),
(41, 'Kinh doanh', 'active', '/cm-category-kinh-doanh-8.php', 10, 'link', 'current', 6, NULL, '<p>category-kinh-doanh-8=8</p>', NULL, NULL, '2024-09-19 00:00:00', 'admin'),
(43, 'Tia cực tím', 'active', '/bv-tia-cuc-tim-tai-ha-noi-o-muc-nguy-hiem-20.php', 10, 'link', NULL, 7, NULL, '<p>article-tia-cuc-tim-tai-ha-noi-20</p>', NULL, NULL, '2024-03-26 00:00:00', 'admin'),
(44, 'Blockchain và trí tuệ nhân tạo', 'active', '/bv-blockchain-va-tri-tue-nhan-tao-ai-lam-thay-doi-giao-duc-truc-tuyen-21.php', 10, 'link', NULL, 7, NULL, '<p>article-blockchain-va-tri-tue-nhan-tao-ai-lam-thay-doi-giao-duc-truc-tuyen-21</p>', NULL, NULL, '2024-03-26 00:00:00', 'admin'),
(45, 'Đại học Anh đưa khóa học hạnh phúc', 'active', '/bv-dai-hoc-anh-dua-khoa-hoc-hanh-phuc-vao-chuong-trinh-giang-day-7.php', 10, 'link', NULL, 7, NULL, '<p>article-dai-hoc-anh-dua-khoa-hoc-hanh-phuc-vao-chuong-trinh-giang-day-7</p>', NULL, NULL, '2024-03-26 00:00:00', 'admin');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2025_02_26_042416_create_permission_tables', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `model_has_permissions`
--

INSERT INTO `model_has_permissions` (`permission_id`, `model_type`, `model_id`) VALUES
(16, 'App\\Models\\UserModel', 3);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `total_price` decimal(10,2) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_details`
--

CREATE TABLE `order_details` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `color_id` int(11) DEFAULT NULL,
  `material_id` int(11) DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `controller_select` varchar(255) DEFAULT NULL,
  `permission_action` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`, `controller_select`, `permission_action`) VALUES
(11, 'delete-user', 'web', '2025-03-14 17:00:00', NULL, 'UserController', 'delete'),
(12, 'access-article', 'web', '2025-03-14 17:00:00', NULL, 'ArticleController', 'access'),
(13, 'create-article', 'web', '2025-03-14 17:00:00', NULL, 'ArticleController', 'create'),
(14, 'edit-article', 'web', '2025-03-14 17:00:00', NULL, 'ArticleController', 'edit'),
(15, 'delete-article', 'web', '2025-03-14 17:00:00', NULL, 'ArticleController', 'delete'),
(16, 'access-user', 'web', '2025-03-14 17:00:00', NULL, 'UserController', 'access'),
(17, 'create-user', 'web', '2025-03-14 17:00:00', NULL, 'UserController', 'create'),
(18, 'edit-user', 'web', '2025-03-14 17:00:00', NULL, 'UserController', 'edit');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `phonecontact`
--

CREATE TABLE `phonecontact` (
  `id` int(11) NOT NULL,
  `phonenumber` int(200) NOT NULL,
  `status` varchar(225) NOT NULL,
  `created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Đang đổ dữ liệu cho bảng `phonecontact`
--

INSERT INTO `phonecontact` (`id`, `phonenumber`, `status`, `created`) VALUES
(1, 11111, 'active', '2024-07-04 00:00:00'),
(3, 1113333, 'inactive', '2024-07-04 08:43:00'),
(4, 1234567890, 'inactive', '2024-07-05 11:53:00'),
(5, 1111111111, 'inactive', '2024-07-06 13:01:00');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `category_product_id` int(11) NOT NULL,
  `description` text DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `created_by` varchar(225) DEFAULT NULL,
  `maketing_price` int(11) DEFAULT NULL,
  `is_new` int(11) DEFAULT NULL,
  `is_sale` int(11) DEFAULT NULL,
  `is_best_seller` int(11) DEFAULT NULL,
  `is_show_contact` int(11) DEFAULT NULL,
  `is_availabe` int(11) DEFAULT NULL,
  `total_rating` int(11) DEFAULT NULL,
  `fieldClass` varchar(255) DEFAULT NULL,
  `fieldWeb` varchar(255) DEFAULT NULL,
  `modified_by` varchar(255) DEFAULT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Đang đổ dữ liệu cho bảng `product`
--

INSERT INTO `product` (`id`, `name`, `slug`, `category_product_id`, `description`, `status`, `price`, `created`, `created_by`, `maketing_price`, `is_new`, `is_sale`, `is_best_seller`, `is_show_contact`, `is_availabe`, `total_rating`, `fieldClass`, `fieldWeb`, `modified_by`, `modified`) VALUES
(27, 'samsung s24', 'bv-samsung-s24-39', 9, '<p><strong>Samsung s24</strong> l&agrave; si&ecirc;u phẩm&nbsp;<strong>smartphone</strong>&nbsp;đỉnh cao mở đầu năm 2024 đến từ nh&agrave; Samsung với chip&nbsp;<strong>Snapdragon 8 Gen 3 For Galaxy</strong>&nbsp;mạnh mẽ, c&ocirc;ng nghệ tương lai&nbsp;<strong>Galaxy AI</strong>&nbsp;c&ugrave;ng&nbsp;<strong>khung viền Titan</strong>&nbsp;đẳng cấp hứa hẹn sẽ mang tới nhiều sự thay đổi lớn về mặt thiết kế v&agrave; cấu h&igrave;nh.&nbsp;<strong>SS&nbsp;Galaxy S24 bản Ultra</strong>&nbsp;sở hữu m&agrave;n h&igrave;nh&nbsp;<strong>6.8 inch</strong>&nbsp;<strong>Dynamic AMOLED 2X</strong>&nbsp;tần số qu&eacute;t&nbsp;<strong>120Hz</strong>. M&aacute;y cũng sở hữu&nbsp;<strong>camera ch&iacute;nh 200MP</strong>, camera zoom quang học 50MP, camera tele 10MP v&agrave; camera g&oacute;c si&ecirc;u rộng 12MP.</p>\r\n\r\n<p>&nbsp;</p>', 'active', NULL, '2025-01-06 00:00:00', 'admin', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2025-02-12 00:00:00'),
(28, 'iphone 15', 'bv-iphone-15-39', 8, '<p><strong>iPhone 15 Pro Max&nbsp;</strong>hứa hẹn đem tới trải nghiệm h&igrave;nh ảnh với độ sắc n&eacute;t v&agrave; mượt m&agrave; cao nhờ sở hữu m&agrave;n h&igrave;nh&nbsp;<strong>Super Retina XDR OLED 6.7 inch</strong>&nbsp;tần số qu&eacute;t&nbsp;<strong>120Hz</strong>. Nhờ vận h&agrave;nh với&nbsp;<strong>chipset A17 Pro</strong>&nbsp;sản xuất tr&ecirc;n tiến tr&igrave;nh 3nm,&nbsp;thế hệ&nbsp;<a href=\"https://cellphones.com.vn/mobile/apple/iphone-15.html\" target=\"_blank\"><strong>iPhone 15</strong></a>&nbsp;bản Pro Max&nbsp;đảm bảo vận h&agrave;nh mạnh mẽ v&agrave; tiết kiệm pin tối ưu. Đặc biệt, m&aacute;y c&ograve;n sở hữu cụm c<strong>amera ch&iacute;nh 48MP</strong>&nbsp;c&ugrave;ng khả năng&nbsp;<strong>zoom quang học 5x</strong>, gi&uacute;p iPhone 15 Pro Max trở th&agrave;nh lựa chọn tuyệt vời cho người đam m&ecirc; nhiếp ảnh v&agrave; quay phim chuy&ecirc;n nghiệp.</p>', 'active', NULL, '2025-01-06 00:00:00', 'admin', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2025-02-06 00:00:00'),
(29, 'OPPO Reno10 Pro', 'bv-oppo-reno10-pro-39', 11, '<p>B&ecirc;n cạnh đ&oacute;, với bộ nhớ RAM 12 GB, OPPO Reno10 Pro&nbsp;Plus c&oacute; thể đối ph&oacute; với t&aacute;c vụ đa nhiệm, cho ph&eacute;p bạn mở nhiều ứng dụng c&ugrave;ng một l&uacute;c m&agrave; kh&ocirc;ng gặp bất kỳ kh&oacute; khăn n&agrave;o về hiệu suất. Kết hợp với dung lượng bộ nhớ trong l&ecirc;n tới 256 GB v&agrave; khe cắm thẻ nhớ microSD, chiếc smartphone n&agrave;y kh&ocirc;ng chỉ đảm bảo hiệu suất mượt m&agrave;, m&agrave; c&ograve;n cung cấp kh&ocirc;ng gian lưu trữ rộng lớn để lưu trữ v&agrave; truy cập dữ liệu nhanh ch&oacute;ng, tiện lợi.</p>', 'active', NULL, '2025-02-06 00:00:00', 'admin', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2025-02-14 00:00:00');

--
-- Bẫy `product`
--
DELIMITER $$
CREATE TRIGGER `before_product_media_delete` BEFORE DELETE ON `product` FOR EACH ROW DELETE FROM media
    WHERE product_id = OLD.id
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `before_product_product_attribute_price_delete` BEFORE DELETE ON `product` FOR EACH ROW DELETE FROM product_attribute_price
    WHERE product_id = OLD.id
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `before_product_product_has_attribute_delete` BEFORE DELETE ON `product` FOR EACH ROW DELETE FROM product_has_attribute 
    WHERE product_id = OLD.id
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_attribute_price`
--

CREATE TABLE `product_attribute_price` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `color_id` int(11) NOT NULL,
  `material_id` int(11) NOT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `color_name` varchar(255) DEFAULT NULL,
  `material_name` varchar(255) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `status` varchar(225) DEFAULT NULL,
  `ordering` int(11) DEFAULT NULL,
  `default` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Đang đổ dữ liệu cho bảng `product_attribute_price`
--

INSERT INTO `product_attribute_price` (`id`, `product_id`, `color_id`, `material_id`, `product_name`, `color_name`, `material_name`, `price`, `status`, `ordering`, `default`) VALUES
(50, 27, 1, 58, 'samsung s24', 'vàng', '512 GB', NULL, 'active', 1, 1),
(53, 28, 1, 56, 'iphone 15', 'vàng', '128 GB', 1200, 'active', 5, 1),
(60, 28, 1, 57, 'iphone 15', 'vàng', '256 GB', NULL, 'active', 6, 0),
(71, 28, 2, 56, 'iphone 15', 'đỏ', '128 GB', 1800, 'active', 7, 0),
(72, 28, 2, 57, 'iphone 15', 'đỏ', '256 GB', NULL, 'active', 8, 0),
(73, 27, 1, 57, 'samsung s24', 'vàng', '256 GB', 2000, 'active', 2, 0),
(77, 27, 3, 57, 'samsung s24', 'xanh', '256 GB', 1500, 'active', 3, 0),
(78, 27, 3, 58, 'samsung s24', 'xanh', '512 GB', 3000, 'active', 4, 0),
(79, 29, 1, 58, 'OPPO Reno10 Pro', 'vàng', '512 GB', NULL, 'active', 9, 1),
(80, 29, 3, 58, 'OPPO Reno10 Pro', 'xanh', '512 GB', NULL, 'active', 10, 0),
(87, 29, 2, 58, 'OPPO Reno10 Pro', 'đỏ', '512 GB', 4000, 'active', 11, NULL),
(89, 29, 1, 56, 'OPPO Reno10 Pro', 'vàng', '128 GB', 1200, 'active', 12, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_has_attribute`
--

CREATE TABLE `product_has_attribute` (
  `id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `attribute_value_id` int(11) DEFAULT NULL,
  `product_name` varchar(225) DEFAULT NULL,
  `attribute_value_name` varchar(225) DEFAULT NULL,
  `product_id_relation` int(11) DEFAULT NULL,
  `ordering` int(11) DEFAULT NULL,
  `default` varchar(255) DEFAULT NULL,
  `fieldClass` varchar(255) DEFAULT NULL,
  `status` varchar(225) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Đang đổ dữ liệu cho bảng `product_has_attribute`
--

INSERT INTO `product_has_attribute` (`id`, `product_id`, `attribute_value_id`, `product_name`, `attribute_value_name`, `product_id_relation`, `ordering`, `default`, `fieldClass`, `status`) VALUES
(132, 27, 1, 'samsung s24', 'vàng', NULL, NULL, 'true', NULL, 'active'),
(135, 27, 58, 'samsung s24', '512 GB', NULL, NULL, NULL, NULL, 'active'),
(136, 28, 1, 'iphone 15', 'vàng', NULL, NULL, 'true', NULL, 'active'),
(138, 28, 56, 'iphone 15', '128 GB', NULL, NULL, NULL, NULL, 'active'),
(141, 28, 57, 'iphone 15', '256 GB', NULL, NULL, NULL, NULL, 'active'),
(145, 28, 2, 'iphone 15', 'đỏ', NULL, NULL, NULL, NULL, 'active'),
(146, 27, 57, 'samsung s24', '256 GB', NULL, NULL, NULL, NULL, 'active'),
(147, 28, 3, 'iphone 15', 'xanh', NULL, NULL, NULL, NULL, 'active'),
(148, 27, 3, 'samsung s24', 'xanh', NULL, NULL, NULL, NULL, 'active'),
(149, 29, 1, 'OPPO Reno10 Pro', 'vàng', NULL, NULL, NULL, NULL, 'active'),
(150, 29, 3, 'OPPO Reno10 Pro', 'xanh', NULL, NULL, NULL, NULL, 'active'),
(151, 29, 58, 'OPPO Reno10 Pro', '512 GB', NULL, NULL, NULL, NULL, 'active'),
(153, 29, 2, 'OPPO Reno10 Pro', 'đỏ', NULL, NULL, NULL, NULL, 'active'),
(155, 29, 56, 'OPPO Reno10 Pro', '128 GB', NULL, NULL, NULL, NULL, 'active');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'founder', 'web', '2025-02-26 13:01:30', '2025-02-26 13:01:30'),
(2, 'admin', 'web', '2025-02-26 13:01:30', '2025-02-26 13:01:30'),
(3, 'member', 'web', '2025-02-26 13:36:08', '2025-02-26 13:36:08'),
(4, 'guest', 'web', '2025-02-26 13:36:08', '2025-02-26 13:36:08'),
(16, 'test01', 'web', '2025-03-10 17:00:00', NULL);

--
-- Bẫy `roles`
--
DELIMITER $$
CREATE TRIGGER `before_delete_role` BEFORE DELETE ON `roles` FOR EACH ROW DELETE FROM role_has_permissions WHERE role_id = OLD.id
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `permission_name` varchar(255) DEFAULT NULL,
  `role_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`, `permission_name`, `role_name`) VALUES
(16, 2, 'access-user', 'admin');

--
-- Bẫy `role_has_permissions`
--
DELIMITER $$
CREATE TRIGGER `before_insert_role_has_permissions` BEFORE INSERT ON `role_has_permissions` FOR EACH ROW BEGIN
    DECLARE perm_name VARCHAR(255);
    DECLARE role_name VARCHAR(255);

    -- Lấy tên quyền từ bảng permissions
    SELECT name INTO perm_name FROM permissions WHERE id = NEW.permission_id;

    -- Lấy tên vai trò từ bảng roles
    SELECT name INTO role_name FROM roles WHERE id = NEW.role_id;

    -- Gán giá trị vào NEW trước khi INSERT
    SET NEW.permission_name = perm_name;
    SET NEW.role_name = role_name;
END
$$
DELIMITER ;

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
(1, 'Thế giới - vnexpress', 'active', 'https://vnexpress.net/rss/the-gioi.rss', 12, 'vnexpress', '2023-12-25 07:05:36', 'phamdat', '2024-07-02 00:00:00', 'admin'),
(3, 'Sức khỏe - vnexpress', 'inactive', 'https://vnexpress.net/rss/suc-khoe.rss', 9, 'vnexpress', '2023-12-25 07:05:36', 'phamdat', '2024-07-02 00:00:00', 'admin'),
(6, 'Số hóa - vnexpress', 'inactive', 'https://vnexpress.net/rss/so-hoa.rss', 22, 'vnexpress', '2023-12-25 00:00:00', 'admin', '2024-07-02 00:00:00', 'dat123'),
(7, 'Thể Thao - vnexpress', 'inactive', 'https://vnexpress.net/rss/the-thao.rss', 10, 'vnexpress', '2023-12-27 00:00:00', 'admin', '2024-07-02 00:00:00', 'dat123'),
(8, 'Thời sự - thanhnien', 'inactive', 'https://thanhnien.vn/rss/thoi-su.rss', 5, 'thanhnien', '2023-12-27 00:00:00', 'admin', '2024-07-02 00:00:00', 'admin'),
(9, 'Nhịp sống số - tuoitre', 'inactive', 'https://tuoitre.vn/rss/nhip-song-so.rss', 1, 'tuoitre', '2023-12-27 00:00:00', 'admin', '2024-07-02 00:00:00', 'admin');

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
(3305, 'Israel tuyên bố không kích hàng trăm mục tiêu ở Lebanon', 'Israel thông báo triển khai chiến đấu cơ không kích hàng trăm mục tiêu trong cuộc tấn công dữ dội nhất vào miền nam Lebanon suốt gần một năm qua.', '2024-09-20 07:00:03', 'https://vnexpress.net/israel-tuyen-bo-khong-kich-hang-tram-muc-tieu-o-lebanon-4794858.html', 'https://i1-vnexpress.vnecdn.net/2024/09/20/afp-20240919-36gq9xl-v1-highre-6220-1938-1726789788.jpg?w=1200&h=0&q=100&dpr=1&fit=crop&s=C-sdaX4Rhrq-aQahXC6XWg', 'VNExpress', 'active', 'vnexpress'),
(3306, 'Ông Putin: Sản lượng UAV Nga tăng gấp 10 lần trong năm 2024', 'Tổng thống Putin nói Nga dự kiến xuất xưởng gần 1,4 triệu UAV trong năm nay, gấp 10 lần năm ngoái, nhằm phục vụ chiến dịch tại Ukraine.', '2024-09-20 06:44:29', 'https://vnexpress.net/ong-putin-san-luong-uav-nga-tang-gap-10-lan-trong-nam-2024-4794839.html', 'https://i1-vnexpress.vnecdn.net/2024/09/20/20240919T133856Z1954520243RC2P-6068-4408-1726788458.jpg?w=1200&h=0&q=100&dpr=1&fit=crop&s=HHWVYlYe0UJphQHBZVubaA', 'VNExpress', 'active', 'vnexpress'),
(3307, 'Thủ lĩnh Hezbollah: Israel đã vượt mọi lằn ranh đỏ', 'Thủ lĩnh Hezbollah cáo buộc Israel đứng sau loạt vụ nổ thiết bị liên lạc ở Lebanon, mô tả hành động này đã \"vượt mọi lằn ranh đỏ\".', '2024-09-19 22:39:19', 'https://vnexpress.net/thu-linh-hezbollah-israel-da-vuot-moi-lan-ranh-do-4794831.html', 'https://i1-vnexpress.vnecdn.net/2024/09/19/AFP2024091936GN2MWv1HighResLeb-1407-8192-1726759325.jpg?w=1200&h=0&q=100&dpr=1&fit=crop&s=wHKh6XSDg0kboNbDtIns-w', 'VNExpress', 'active', 'vnexpress'),
(3308, 'Nga tuyên bố tập kích \'trung tâm liên lạc đặc biệt\' của Ukraine', 'Nga tuyên bố tập kích cơ sở liên lạc chủ chốt và loạt mục tiêu quan trọng ở Ukraine, trong khi Kiev tuyên bố chặn đòn tấn công của Moskva.', '2024-09-19 20:58:43', 'https://vnexpress.net/nga-tuyen-bo-tap-kich-trung-tam-lien-lac-dac-biet-cua-ukraine-4794811.html', 'https://i1-vnexpress.vnecdn.net/2024/09/19/su-34-u-1726754010-3900-1726754281.jpg?w=1200&h=0&q=100&dpr=1&fit=crop&s=bde_NdQ1_icFIpSUHBEdNA', 'VNExpress', 'active', 'vnexpress'),
(3309, 'Loạt vụ nổ thiết bị liên lạc giáng đòn đau vào Hezbollah', 'Hàng loạt thiết bị phát nổ khiến nhiều thành viên Hezbollah bị thương tổn vĩnh viễn và ảnh hưởng nghiêm trọng tới mạng lưới liên lạc, làm suy yếu hoạt động của nhóm.', '2024-09-19 20:51:23', 'https://vnexpress.net/loat-vu-no-thiet-bi-lien-lac-giang-don-dau-vao-hezbollah-4794493.html', 'https://i1-vnexpress.vnecdn.net/2024/09/19/ap24263468462211-1726752590-8530-1726753336.jpg?w=1200&h=0&q=100&dpr=1&fit=crop&s=YtZRwkCbaqK_QXfaqOYUnQ', 'VNExpress', 'active', 'vnexpress'),
(3310, 'Tổng Bí thư, Chủ tịch nước sẽ phát biểu trước Đại hội đồng Liên Hợp Quốc', 'Tổng Bí thư, Chủ tịch nước Tô Lâm sẽ có các bài phát biểu tại Hội nghị Thượng đỉnh Tương lai và Đại hội đồng Liên Hợp Quốc khóa 79, trong chuyến công du Mỹ.', '2024-09-19 19:19:08', 'https://vnexpress.net/tong-bi-thu-chu-tich-nuoc-se-phat-bieu-truoc-dai-hoi-dong-lien-hop-quoc-4794791.html', 'https://i1-vnexpress.vnecdn.net/2024/09/19/z5779784759716-be0fb659c318773-7831-1529-1726745718.jpg?w=1200&h=0&q=100&dpr=1&fit=crop&s=Ld4iVoROCKqa1qDlJY8Z7Q', 'VNExpress', 'active', 'vnexpress'),
(3311, 'Israel tuyên bố phá âm mưu ám sát Thủ tướng Netanyahu', 'Cảnh sát Israel bắt một công dân với cáo buộc được Iran chiêu mộ để lập kế hoạch ám sát các quan chức, trong đó có Thủ tướng Netanyahu.', '2024-09-19 18:54:59', 'https://vnexpress.net/israel-tuyen-bo-pha-am-muu-am-sat-thu-tuong-netanyahu-4794721.html', 'https://i1-vnexpress.vnecdn.net/2024/09/19/cats-1726739075-1947-1726739107.jpg?w=1200&h=0&q=100&dpr=1&fit=crop&s=69hR7TY64YF2YWKv4A6hYg', 'VNExpress', 'active', 'vnexpress'),
(3312, 'Công ty Bulgaria bị nghi bán máy nhắn tin nổ ở Lebanon', 'Bulgaria mở cuộc điều tra một công ty bị nghi tham gia quá trình bán loạt máy nhắn tin cho Hezbollah trước khi chúng phát nổ ở Lebanon.', '2024-09-19 18:39:33', 'https://vnexpress.net/cong-ty-bulgaria-bi-nghi-ban-may-nhan-tin-no-o-lebanon-4794794.html', 'https://i1-vnexpress.vnecdn.net/2024/09/19/AFP2024091836GL2KWv2HighResLeb-8172-8208-1726744694.jpg?w=1200&h=0&q=100&dpr=1&fit=crop&s=cgdyNOMkKRb9b5ImS_oFMw', 'VNExpress', 'active', 'vnexpress'),
(3313, 'Hai ngày Lebanon hỗn loạn vì loạt vụ nổ thiết bị liên lạc', 'Các vụ nổ máy nhắn tin, bộ đàm liên tiếp trong hai ngày làm 37 người thiệt mạng và hơn 2.900 người bị thương, khiến Lebanon rơi vào hỗn loạn.', '2024-09-19 18:13:11', 'https://vnexpress.net/hai-ngay-lebanon-hon-loan-vi-loat-vu-no-thiet-bi-lien-lac-4794786.html', 'https://i1-vnexpress.vnecdn.net/2024/09/19/afp2024091836gl3v7v2highre1603-4865-4157-1726744391.jpg?w=1200&h=0&q=100&dpr=1&fit=crop&s=fidzaCvcmJSNEorZAHywuQ', 'VNExpress', 'active', 'vnexpress'),
(3314, 'Việt Nam kêu gọi các bên ở Trung Đông kiềm chế', 'Việt Nam quan tâm theo dõi tình hình, kêu gọi các bên liên quan ở Trung Đông kiềm chế và chấm dứt xung đột, theo người phát ngôn Bộ Ngoại giao.', '2024-09-19 16:46:41', 'https://vnexpress.net/viet-nam-keu-goi-cac-ben-o-trung-dong-kiem-che-4794734.html', 'https://i1-vnexpress.vnecdn.net/2024/09/19/pham-thu-hang-4-1726737791-6594-1726739179.jpg?w=1200&h=0&q=100&dpr=1&fit=crop&s=5nVfRItl9EGAaBkhU9yXXA', 'VNExpress', 'active', 'vnexpress'),
(3315, 'Việt Nam đề nghị các nước hỗ trợ tàu thuyền trú bão Soulik', 'Bộ Ngoại giao cho biết đã đề nghị Trung Quốc và các nước trong khu vực cho tàu thuyền Việt Nam trú bão Soulik, hỗ trợ cứu hộ nếu cần thiết.', '2024-09-19 16:32:53', 'https://vnexpress.net/viet-nam-de-nghi-cac-nuoc-ho-tro-tau-thuyen-tru-bao-soulik-4794747.html', 'https://i1-vnexpress.vnecdn.net/2024/09/19/z5842543246033-ad3ba54b56c96fa-3837-3209-1726737342.jpg?w=1200&h=0&q=100&dpr=1&fit=crop&s=9ufgGNemnUVtCL9I50o8Rg', 'VNExpress', 'active', 'vnexpress'),
(3316, 'Tàu cao tốc Nhật Bản bung khớp nối, tách rời toa', 'Tàu shinkansen đang di chuyển ở đông bắc Nhật Bản thì bị bung khớp nối, tách làm đôi và phải dừng khẩn cấp, không có thương vong trong sự việc.', '2024-09-19 16:19:22', 'https://vnexpress.net/tau-cao-toc-nhat-ban-bung-khop-noi-tach-roi-toa-4794629.html', 'https://i1-vnexpress.vnecdn.net/2024/09/19/460357105-917779957049202-9128-1566-6014-1726721340.jpg?w=1200&h=0&q=100&dpr=1&fit=crop&s=HIbfCkuo2OshkeLIwA9SsA', 'VNExpress', 'active', 'vnexpress'),
(3317, 'Tổng Bí thư, Chủ tịch nước Tô Lâm sắp công du Mỹ, Cuba', 'Tổng Bí thư, Chủ tịch nước Tô Lâm sẽ tham dự các sự kiện của Liên Hợp Quốc, làm việc tại Mỹ và thăm cấp nhà nước Cuba.', '2024-09-19 12:55:44', 'https://vnexpress.net/tong-bi-thu-chu-tich-nuoc-to-lam-sap-cong-du-my-cuba-4794277.html', 'https://i1-vnexpress.vnecdn.net/2024/09/18/to-ng-bi-thu-1726649785-7866-1726649816.jpg?w=1200&h=0&q=100&dpr=1&fit=crop&s=p8LaJRf-jK-tyyxwI-f2cg', 'VNExpress', 'active', 'vnexpress'),
(3318, 'Mỹ phát hiện thi thể nghi phạm xả súng cao tốc', 'Cảnh sát Mỹ tìm thấy thi thể được cho là kẻ xả súng trên cao tốc bang Kentucky khiến 5 người bị thương, kết thúc gần hai tuần truy lùng.', '2024-09-19 11:52:34', 'https://vnexpress.net/my-phat-hien-thi-the-nghi-pham-xa-sung-cao-toc-4794570.html', 'https://i1-vnexpress.vnecdn.net/2024/09/19/phat-hien-thi-the-nghi-pham-23-9705-8557-1726722167.jpg?w=1200&h=0&q=100&dpr=1&fit=crop&s=2njLDvW3iCg9mU7OtkZSKw', 'VNExpress', 'active', 'vnexpress'),
(3319, 'Israel - Hezbollah tập kích nhau', 'Hezbollah phóng 40 rocket vào lãnh thổ Israel, đòn đánh đầu tiên sau vụ máy nhắn tin phát nổ, Tel Aviv sau đó điều máy bay tập kích đáp trả.', '2024-09-19 11:31:28', 'https://vnexpress.net/israel-hezbollah-tap-kich-nhau-4794566.html', 'https://i1-vnexpress.vnecdn.net/2024/09/19/Israel-1726718166-5177-1726718594.png?w=1200&h=0&q=100&dpr=1&fit=crop&s=bj3mD7fpzn8a7qJ-EvFnRA', 'VNExpress', 'active', 'vnexpress'),
(3320, 'Lý do Hezbollah sử dụng máy nhắn tin', 'Một loạt vụ tấn công nhằm vào thành viên cấp cao đã khiến Hezbollah ra quy định hạn chế dùng điện thoại di động, chủ yếu sử dụng máy nhắn tin nhằm tránh nguy cơ bị theo dõi.', '2024-09-19 11:02:00', 'https://vnexpress.net/ly-do-hezbollah-su-dung-may-nhan-tin-4794173.html', 'https://i1-vnexpress.vnecdn.net/2024/09/18/apollo-6883-1726630828-1726649-6085-1429-1726649865.png?w=1200&h=0&q=100&dpr=1&fit=crop&s=jBCINDYoBbGsijvUoPe2og', 'VNExpress', 'active', 'vnexpress'),
(3321, 'Mỹ nói tin tặc Iran đã gửi tài liệu của chiến dịch Trump cho đội ngũ ông Biden', 'Mỹ cáo buộc tin tặc Iran đánh cắp tài liệu không công khai từ chiến dịch Trump và gửi cho đội ngũ dưới quyền ông Biden.', '2024-09-19 10:11:15', 'https://vnexpress.net/my-noi-tin-tac-iran-da-gui-tai-lieu-cua-chien-dich-trump-cho-doi-ngu-ong-biden-4794468.html', 'https://i1-vnexpress.vnecdn.net/2024/09/19/Trump-1726705169-5482-1726705577.png?w=1200&h=0&q=100&dpr=1&fit=crop&s=1AZFJcqNhY2kbmU9ctq0sw', 'VNExpress', 'active', 'vnexpress'),
(3322, 'Mẫu bộ đàm phát nổ hàng loạt của Hezbollah', 'Giới chức Lebanon nói loạt bộ đàm của Hezbollah bị nổ là do công ty Nhật chế tạo, nhưng hãng tuyên bố đã ngừng sản xuất thiết bị từ lâu.', '2024-09-19 09:59:05', 'https://vnexpress.net/mau-bo-dam-phat-no-hang-loat-cua-hezbollah-4794509.html', 'https://i1-vnexpress.vnecdn.net/2024/09/19/5563187178137268500a-hezbollah-4428-8614-1726711022.jpg?w=1200&h=0&q=100&dpr=1&fit=crop&s=JvT1q0bD0ewt_2j0qtb7MQ', 'VNExpress', 'active', 'vnexpress'),
(3323, 'Bà Harris dẫn trước ông Trump ở ba bang chiến trường', 'Bà Harris dẫn trước ông Trump ở ba bang chiến trường có thể quyết định cuộc đua vào Nhà Trắng, với cách biệt ít nhất 5 điểm ở Pennsylvania, Michigan.', '2024-09-19 07:37:25', 'https://vnexpress.net/ba-harris-dan-truoc-ong-trump-o-ba-bang-chien-truong-4794467.html', 'https://i1-vnexpress.vnecdn.net/2024/09/19/ap24255043023737-1726703825-2000-1726704377.jpg?w=1200&h=0&q=100&dpr=1&fit=crop&s=8HIiCW2A4Sm6bJMYKH6jEw', 'VNExpress', 'active', 'vnexpress'),
(3324, 'LHQ yêu cầu Israel ngừng chiếm đóng lãnh thổ Palestine', 'Đại hội đồng LHQ thông qua nghị quyết yêu cầu Israel rút khỏi các vùng lãnh thổ Palestine trong vòng 12 tháng, Tel Aviv phản đối động thái.', '2024-09-19 06:54:49', 'https://vnexpress.net/lhq-yeu-cau-israel-ngung-chiem-dong-lanh-tho-palestine-4794460.html', 'https://i1-vnexpress.vnecdn.net/2024/09/19/LHQ-1726701034-4191-1726701716.png?w=1200&h=0&q=100&dpr=1&fit=crop&s=Tf8RrNMb6ytqY-YqOpMbEA', 'VNExpress', 'active', 'vnexpress'),
(3325, 'Triều Tiên tuyên bố thử tên lửa mang đầu đạn 4,5 tấn', 'Lãnh đạo Triều Tiên Kim Jong-un giám sát thử nghiệm tên lửa đạn đạo chiến thuật mới sử dụng đầu đạn siêu lớn và tên lửa hành trình cải tiến.', '2024-09-19 06:40:15', 'https://vnexpress.net/trieu-tien-tuyen-bo-thu-ten-lua-mang-dau-dan-4-5-tan-4794463.html', 'https://i1-vnexpress.vnecdn.net/2024/09/19/tenluatrieutien17JPG-172670264-9668-4926-1726702769.jpg?w=1200&h=0&q=100&dpr=1&fit=crop&s=gtjsIuJQ7g7zpfL_QsjFGQ', 'VNExpress', 'active', 'vnexpress'),
(3326, 'Áp lực đè nặng Sở Mật vụ sau vụ ông Trump suýt bị ám sát', 'Hai tháng sau vụ ám sát hụt, ông Trump tiếp tục đối mặt âm mưu ám sát ở Florida, khiến Sở Mật vụ lần nữa rơi vào tầm ngắm chỉ trích.', '2024-09-19 05:00:00', 'https://vnexpress.net/ap-luc-de-nang-so-mat-vu-sau-vu-ong-trump-suyt-bi-am-sat-4793229.html', 'https://i1-vnexpress.vnecdn.net/2024/09/18/us-secret-service-insists-trum-8745-3736-1726663629.jpg?w=1200&h=0&q=100&dpr=1&fit=crop&s=pOxxv8vzTF-6Wk6kwyTRNw', 'VNExpress', 'active', 'vnexpress'),
(3327, 'Ukraine đối mặt áp lực xây \'kế hoạch B\' cho xung đột với Nga', 'Giới chức phương Tây muốn Ukraine vạch ra mục tiêu thực tế hơn cho xung đột, khi lực lượng Nga tiếp tục đà tiến quân trên nhiều mặt trận.', '2024-09-19 01:00:00', 'https://vnexpress.net/ukraine-doi-mat-ap-luc-xay-ke-hoach-b-cho-xung-dot-voi-nga-4792353.html', 'https://i1-vnexpress.vnecdn.net/2024/09/13/ap24255573595957-1726226576-3626-1726227115.jpg?w=1200&h=0&q=100&dpr=1&fit=crop&s=lxMS8apft_fLqnAupMnnEQ', 'VNExpress', 'active', 'vnexpress'),
(3328, 'Những phụ nữ Chile ngại sinh con', 'Camila Ramirez, 29 tuổi, không muốn từ bỏ cuộc sống tự do và dễ chịu để làm mẹ, không chỉ một mình cô có suy nghĩ này.', '2024-09-19 00:00:00', 'https://vnexpress.net/nhung-phu-nu-chile-ngai-sinh-con-4794150.html', 'https://i1-vnexpress.vnecdn.net/2024/09/18/AFP-20240918-36FE6QB-v1-HighRe-5048-3291-1726643168.jpg?w=1200&h=0&q=100&dpr=1&fit=crop&s=0LrbqV1lqlYoIabl2p7Z_A', 'VNExpress', 'active', 'vnexpress');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `setting`
--

CREATE TABLE `setting` (
  `id` int(11) NOT NULL,
  `key_value` varchar(255) NOT NULL,
  `value` text NOT NULL,
  `status` varchar(255) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `modified_by` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Đang đổ dữ liệu cho bảng `setting`
--

INSERT INTO `setting` (`id`, `key_value`, `value`, `status`, `created`, `created_by`, `modified`, `modified_by`) VALUES
(1, 'setting-general', '{\"logo\":\"\\/images\\/logo\\/logo-topmargin.JPG\",\"hotline\":\"123456789123\",\"timeword\":\"124\\/124\",\"copyright\":\"@2020 - B\\u1ea3n quy\\u1ec1n c\\u00f4ng ty l\\u1eadp tr\\u00ecnh Zendvn\",\"address\":\"S\\u1ed1 01, Kh\\u1ed1i A1, To\\u00e0 nh\\u00e0 \\u0110\\u1ea1t Gia, 43 \\u0110\\u01b0\\u1eddng C\\u00e2y Keo, Tam Ph\\u00fa, Th\\u1ee7 \\u0110\\u1ee9c, H\\u1ed3 Ch\\u00ed Minh\",\"introduction\":\"<p>C&ocirc;ng Ty C\\u1ed5 Ph\\u1ea7n L\\u1eadp Tr&igrave;nh Zend Vi\\u1ec7t Nam - M&atilde; s\\u1ed1 thu\\u1ebf: 0314390745. Gi\\u1ea5y ph&eacute;p \\u0111\\u0103ng k&yacute; kinh doanh s\\u1ed1 0314390745 do S\\u1edf K\\u1ebf ho\\u1ea1ch v&agrave; \\u0110\\u1ea7u t\\u01b0 Th&agrave;nh ph\\u1ed1 H\\u1ed3 Ch&iacute; Minh c\\u1ea5p ng&agrave;y 09\\/05\\/2017<\\/p>\",\"googlemap\":\"<iframe src=\\\"https:\\/\\/www.google.com\\/maps\\/embed?pb=!1m18!1m12!1m3!1d3918.3604198520575!2d106.73612927408858!3d10.86016745764545!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x317527d5640014e7%3A0x3bb323b29d50dca9!2zWmVuZFZOIC0gxJDDoG8gVOG6oW8gTOG6rXAgVHLDrG5oIFZpw6pu!5e0!3m2!1svi!2s!4v1721455847550!5m2!1svi!2s\\\" width=\\\"600\\\" height=\\\"450\\\" style=\\\"border:0;\\\" allowfullscreen=\\\"\\\" loading=\\\"lazy\\\" referrerpolicy=\\\"no-referrer-when-downgrade\\\"><\\/iframe>\",\"taskGeneral\":\"Save\"}', 'active', '2024-07-20 14:33:27', 'Admin', '2024-07-23 00:00:00', 'admin'),
(2, 'setting-email', '{\"username\":\"phamdat999666@gmail.com\",\"password\":\"phnfqmrkrrcawnhq\",\"bcc\":\"phamdat9966@gmail.com,phamdinh01011945@gmail.com\",\"taskEmailAccount\":\"Save\"}', 'active', '2024-07-20 14:33:27', 'Admin', '2024-07-23 00:00:00', 'admin'),
(3, 'setting-social', '{\"facebook\":\"https:\\/\\/www.facebook.com\\/zendvngroup12345\",\"youtube\":\"https:\\/\\/www.youtube.com\\/user\\/zendvn\",\"google\":\"https:\\/\\/www.youtube.com\\/user\\/zendvn\"}', 'active', '2024-07-20 14:33:27', 'Admin', '2024-07-23 00:00:00', 'admin'),
(4, 'setting-video', 'https://www.youtube.com/watch?v=vo1XjuLVaZo&list=PLv6GftO355AsZFXlWLKob6tMsWZa4VCY1', 'active', '2024-07-20 14:33:27', 'Admin', '2024-07-23 00:00:00', 'admin');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `shipping`
--

CREATE TABLE `shipping` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `cost` int(11) NOT NULL,
  `status` varchar(225) DEFAULT NULL,
  `ordering` int(11) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `modified_by` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

--
-- Đang đổ dữ liệu cho bảng `shipping`
--

INSERT INTO `shipping` (`id`, `name`, `cost`, `status`, `ordering`, `created`, `created_by`, `modified`, `modified_by`) VALUES
(1, 'Hồ Chí Minh', 30000, 'active', 1, '2024-12-19 13:18:21', 'admin', NULL, NULL),
(2, 'Cần thơ', 50000, 'active', NULL, '2024-12-19 00:00:00', 'admin', '2024-12-19 00:00:00', 'admin');

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
(1, 'Khóa học lập trình Frontend Master', 'Khóa học sẽ giúp bạn trở thành một chuyên gia Frontend với đầy đủ các kiến thức về HTML, CSS, JavaScript, Bootstrap, jQuery, chuyển PSD thành HTML ...', 'https://zendvn.com/khoa-hoc-lap-trinh-frontend-master/', 'rEpDUQCxe4.jpeg', '2024-04-01 00:00:00', 'hailan', '2024-04-12 13:28:03', 'hailan', 'active'),
(2, 'Học lập trình trực tuyến', 'Học trực tuyến giúp bạn tiết kiệm chi phí, thời gian, cập nhật được nhiều kiến thức mới nhanh nhất và hiệu quả nhất', 'https://zendvn.com/', 'K6B1O6UNCb.jpeg', '2019-04-18 00:00:00', 'hailan', '2019-04-24 13:28:06', 'hailan', 'inactive'),
(3, 'Ưu đãi học phí', 'Tổng hợp các trương trình ưu đãi học phí hàng tuần, hàng tháng đến tất các các bạn với các mức giảm đặc biệt 50%, 70%,..', 'https://zendvn.com/uu-dai-hoc-phi-tai-zendvn/', 'LWi6hINpXz.jpeg', '2019-04-24 00:00:00', 'hailan', '2024-07-02 00:00:00', 'admin', 'active'),
(4, 'Lập trình PHP', 'Khóa học được xây dựng dựa trên kinh nghiệm làm dự án thực tế của ZendVN, ngoài ra khóa học còn sử dụng các tài liệu từ trang Google, stackoverflow.com và các trang web khác.', 'https://zendvn.com/khoa-hoc-lap-trinh-php-chuyen-sau', 'UIFAVEbuoa.jpeg', '2019-04-24 00:00:00', 'hailan', '2024-03-25 00:00:00', 'admin', 'active'),
(5, 'Lập trình Laravel', 'Đây là khóa học nâng cao, ZendVN chỉ nhận các bạn học viên đã học xong khóa học Lập trình PHP Offline tại ZendVN; hoặc các bạn đã có làm các project về PHP, MVC, OOP, jQuery Ajax\r\nKhóa học Lập trình Laravel sẽ hướng dẫn học viên sử dụng Laravel để xây dựng nhiều loại website khác nhau trong thực tế: doanh nghiệp, tin tức, bán hàng, đa ngôn ngữ. ', 'https://zendvn.com/lap-trinh-laravel-offline-off', 'DZeaWRlkPA.png', '2019-04-24 00:00:00', 'hailan', '2024-03-18 00:00:00', 'dat123', 'active'),
(6, 'Nền tảng & Tư duy lập trình', 'Khóa học Nền tảng & Tư duy lập trình giúp bạn trang bị nền tảng lập trình vững chắc để có thể theo được nghề lập trình và duy trì đam mê với nghề. Các kỹ năng phân tích giải quyết vấn đề, tìm kiếm Google, xử lý lỗi cũng sẽ được hướng dẫn trong khóa học.', 'https://zendvn.com/nen-tang-va-tu-duy-lap-trinh-off', 'ofcAvQCCIQ.png', '2024-07-01 00:00:00', 'hailan', '2024-07-12 00:00:00', 'dat123', 'active');

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
('article', 21, '<i class=\"fa fa-newspaper-o\"></i>'),
('category_article', 19, '<i class=\"fa fa-tasks\"></i>'),
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
  `created` datetime DEFAULT NULL,
  `created_by` varchar(45) DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `modified_by` varchar(45) DEFAULT NULL,
  `status` varchar(10) DEFAULT '0',
  `usually_category` varchar(255) DEFAULT NULL,
  `roles_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci ROW_FORMAT=COMPACT;

--
-- Đang đổ dữ liệu cho bảng `user`
--

INSERT INTO `user` (`id`, `username`, `email`, `fullname`, `password`, `avatar`, `created`, `created_by`, `modified`, `modified_by`, `status`, `usually_category`, `roles_id`) VALUES
(1, 'admin', 'admin@gmail.com', 'admin123456', 'e10adc3949ba59abbe56e057f20f883e', 'ZnrJ4VWN7s.png', '2024-07-01 00:00:00', 'admin', '2025-02-23 00:00:00', 'admin', 'active', '6,6,6,6,6,6,6,6,6,6,6,7,7,7,6,6,6,2,7,6,6,6,6,6,6,6,6,6,6,7,7,7,6,6,6', 1),
(2, 'hailan', 'hailan@gmail.com', 'hailan', 'e10adc3949ba59abbe56e057f20f883e', '1eSGmvZ3gM.jpeg', '2014-12-13 07:20:03', 'admin', '2025-02-23 00:00:00', 'admin', 'active', NULL, 1),
(3, 'user123', 'phamdat9966@gmail.com', 'user123', 'e10adc3949ba59abbe56e057f20f883e', 'Hb1QSn1CL8.png', '2019-05-04 00:00:00', 'admin', '2025-03-17 00:00:00', 'user123', 'active', NULL, 3),
(4, 'user456', 'user456@gmail.com', 'user456', 'e10adc3949ba59abbe56e057f20f883e', 'g0r3gYefFo.png', '2019-05-04 00:00:00', 'admin', '2025-03-06 00:00:00', 'user123', 'active', NULL, 4),
(5, 'dat123', 'phamdat999666@gmail.com', 'Dat123', 'e10adc3949ba59abbe56e057f20f883e', 'zpzZTLYNzb.png', '2023-11-28 00:00:00', 'phamdat', '2025-03-14 00:00:00', 'admin', 'active', ',6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,3,3,3,3,2,2,2,3,3,3,2,2,2', 2),
(6, 'phamdat9997778', 'phamdat999999999@gmail.com', 'Phamdat123123213', NULL, 'pL1DxiUtai.jpg', '2023-11-28 00:00:00', 'phamdat', '2025-03-06 00:00:00', 'user123', 'active', NULL, 4),
(8, 'admin999', 'phamdat999999999663123213216@gmail.com', 'Dat123312321321321', '123456', '9k04uy61T5.jpg', '2023-11-29 00:00:00', 'phamdat', '2025-02-25 00:00:00', 'admin', 'active', NULL, 2),
(9, 'member0011', 'member999666@gmail.com', 'Member0011', 'd41d8cd98f00b204e9800998ecf8427e', 'uajxH2pLAp.jpg', '2023-11-29 00:00:00', 'phamdat', '2025-02-25 00:00:00', 'admin', 'active', NULL, 3),
(15, 'member00111', 'phamdat999666111@gmail.com', 'Member00111', 'e10adc3949ba59abbe56e057f20f883e', 'MxO2Afexqg.png', '2024-01-22 00:00:00', 'admin', '2025-03-18 00:00:00', 'admin', 'active', NULL, 16);

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
(1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', '2025-02-25 07:28:36', NULL),
(2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', '2025-02-25 07:28:36', 3),
(3, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', '2025-02-25 07:28:36', 4),
(4, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', '2025-02-25 07:28:37', 4),
(5, 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Mobile Safari/537.36', '2025-02-25 07:28:37', 5),
(6, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', '2025-02-25 07:28:37', 6),
(7, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', '2025-02-25 07:28:37', 7),
(8, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', '2025-02-25 07:28:37', 7),
(9, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', '2025-02-25 07:28:37', 11),
(10, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', '2025-02-25 07:28:37', 14),
(11, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', '2025-02-25 07:28:37', 15),
(12, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', '2025-02-25 07:28:37', 15),
(13, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', '2025-02-25 07:28:37', 15),
(14, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', '2025-02-25 07:28:37', 15),
(15, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', '2025-02-25 07:28:37', 16),
(16, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36', '2025-02-25 07:28:37', 16),
(17, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', '2025-02-25 07:28:37', 16),
(18, 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Mobile Safari/537.36', '2025-02-25 07:28:37', 16),
(19, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', '2025-02-25 07:28:37', 16),
(20, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', '2025-02-25 07:28:37', 18),
(21, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', '2025-02-25 07:28:37', 18),
(22, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', '2025-02-25 07:28:37', 20),
(23, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', '2025-02-25 07:28:37', 20),
(24, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', '2025-02-25 07:28:38', 20),
(25, 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Mobile Safari/537.36', '2025-02-25 07:28:38', 20),
(26, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', '2025-02-25 07:28:38', 20),
(27, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', '2025-02-25 07:28:38', 20),
(28, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', '2025-02-25 07:28:39', 21),
(29, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', '2025-02-25 07:28:39', 21),
(30, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', '2025-02-25 07:28:39', 21),
(31, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', '2025-02-25 07:28:39', 21),
(32, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', '2025-02-25 07:28:39', 22),
(33, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', '2025-02-25 07:28:40', 22),
(34, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', '2025-02-25 07:28:40', 22),
(35, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', '2025-02-25 07:28:41', 23),
(36, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', '2025-02-25 07:28:41', 23),
(37, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2025-02-25 07:28:41', 23),
(38, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', '2025-02-25 07:28:41', 23),
(39, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', '2025-02-25 07:28:41', 34),
(40, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', '2025-02-25 07:28:42', 34),
(41, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', '2025-02-25 07:28:42', 34),
(42, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', '2025-02-25 07:28:42', 34),
(43, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', '2025-02-25 07:28:42', 35);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `appointment`
--
ALTER TABLE `appointment`
  ADD PRIMARY KEY (`id`);

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
-- Chỉ mục cho bảng `attribute`
--
ALTER TABLE `attribute`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `attribute_value`
--
ALTER TABLE `attribute_value`
  ADD PRIMARY KEY (`id`),
  ADD KEY `attribute_id` (`attribute_id`);

--
-- Chỉ mục cho bảng `branch`
--
ALTER TABLE `branch`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `category_article`
--
ALTER TABLE `category_article`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Chỉ mục cho bảng `category_product`
--
ALTER TABLE `category_product`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Chỉ mục cho bảng `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `coupon`
--
ALTER TABLE `coupon`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `attribute_value_id` (`attribute_value_id`);

--
-- Chỉ mục cho bảng `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent_menu_id` (`parent_id`);

--
-- Chỉ mục cho bảng `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Chỉ mục cho bảng `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Chỉ mục cho bảng `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `color_id` (`color_id`),
  ADD KEY `material_id` (`material_id`);

--
-- Chỉ mục cho bảng `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Chỉ mục cho bảng `phonecontact`
--
ALTER TABLE `phonecontact`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_product_id`);

--
-- Chỉ mục cho bảng `product_attribute_price`
--
ALTER TABLE `product_attribute_price`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `color_id` (`color_id`),
  ADD KEY `material_id` (`material_id`);

--
-- Chỉ mục cho bảng `product_has_attribute`
--
ALTER TABLE `product_has_attribute`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `product_has_attribute_index_0` (`product_id`,`attribute_value_id`),
  ADD KEY `attribute_value_id` (`attribute_value_id`);

--
-- Chỉ mục cho bảng `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Chỉ mục cho bảng `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

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
-- Chỉ mục cho bảng `setting`
--
ALTER TABLE `setting`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `setting_key` (`key_value`);

--
-- Chỉ mục cho bảng `shipping`
--
ALTER TABLE `shipping`
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
-- AUTO_INCREMENT cho bảng `appointment`
--
ALTER TABLE `appointment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `article`
--
ALTER TABLE `article`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT cho bảng `article_views`
--
ALTER TABLE `article_views`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT cho bảng `attribute`
--
ALTER TABLE `attribute`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `attribute_value`
--
ALTER TABLE `attribute_value`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT cho bảng `branch`
--
ALTER TABLE `branch`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `category_article`
--
ALTER TABLE `category_article`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT cho bảng `category_product`
--
ALTER TABLE `category_product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT cho bảng `contact`
--
ALTER TABLE `contact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `coupon`
--
ALTER TABLE `coupon`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `media`
--
ALTER TABLE `media`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=153;

--
-- AUTO_INCREMENT cho bảng `menu`
--
ALTER TABLE `menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT cho bảng `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT cho bảng `phonecontact`
--
ALTER TABLE `phonecontact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT cho bảng `product_attribute_price`
--
ALTER TABLE `product_attribute_price`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=90;

--
-- AUTO_INCREMENT cho bảng `product_has_attribute`
--
ALTER TABLE `product_has_attribute`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=156;

--
-- AUTO_INCREMENT cho bảng `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT cho bảng `rss`
--
ALTER TABLE `rss`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT cho bảng `rssnews`
--
ALTER TABLE `rssnews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3329;

--
-- AUTO_INCREMENT cho bảng `setting`
--
ALTER TABLE `setting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `shipping`
--
ALTER TABLE `shipping`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `slider`
--
ALTER TABLE `slider`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT cho bảng `user_agents`
--
ALTER TABLE `user_agents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `attribute_value`
--
ALTER TABLE `attribute_value`
  ADD CONSTRAINT `attribute_value_ibfk_1` FOREIGN KEY (`attribute_id`) REFERENCES `attribute` (`id`);

--
-- Các ràng buộc cho bảng `media`
--
ALTER TABLE `media`
  ADD CONSTRAINT `media_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  ADD CONSTRAINT `media_ibfk_2` FOREIGN KEY (`attribute_value_id`) REFERENCES `attribute_value` (`id`) ON DELETE SET NULL;

--
-- Các ràng buộc cho bảng `menu`
--
ALTER TABLE `menu`
  ADD CONSTRAINT `menu_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `menu` (`id`);

--
-- Các ràng buộc cho bảng `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `order_details_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_details_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_details_ibfk_3` FOREIGN KEY (`color_id`) REFERENCES `attribute_value` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `order_details_ibfk_4` FOREIGN KEY (`material_id`) REFERENCES `attribute_value` (`id`) ON DELETE SET NULL;

--
-- Các ràng buộc cho bảng `product_attribute_price`
--
ALTER TABLE `product_attribute_price`
  ADD CONSTRAINT `product_attribute_price_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  ADD CONSTRAINT `product_attribute_price_ibfk_2` FOREIGN KEY (`color_id`) REFERENCES `attribute_value` (`id`),
  ADD CONSTRAINT `product_attribute_price_ibfk_3` FOREIGN KEY (`material_id`) REFERENCES `attribute_value` (`id`);

--
-- Các ràng buộc cho bảng `product_has_attribute`
--
ALTER TABLE `product_has_attribute`
  ADD CONSTRAINT `product_has_attribute_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  ADD CONSTRAINT `product_has_attribute_ibfk_2` FOREIGN KEY (`attribute_value_id`) REFERENCES `attribute_value` (`id`);

--
-- Các ràng buộc cho bảng `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
