-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th4 29, 2025 lúc 10:06 AM
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
(4, 2, 'Liverpool chỉ được nâng Cup phiên bản nếu vô địch hôm nay', 'bv-liverpool-chi-duoc-nang-cup-phien-ban-neu-vo-dich-hom-nay-4', '<p>Đội b&oacute;ng th&agrave;nh phố cảng sẽ kh&ocirc;ng n&acirc;ng Cup nguy&ecirc;n bản nếu vượt mặt Man City ở v&ograve;ng cuối Ngoại hạng Anh.</p>\n\n<p>Liverpool k&eacute;m Man City một điểm trước khi tiếp Wolverhampton tr&ecirc;n s&acirc;n nh&agrave; Anfield v&agrave;o ng&agrave;y Chủ Nhật. Ở trận đấu c&ugrave;ng giờ, Man City sẽ l&agrave;m kh&aacute;ch tới s&acirc;n Brighton v&agrave; biết một chiến thắng sẽ gi&uacute;p họ bảo vệ th&agrave;nh c&ocirc;ng ng&ocirc;i v&ocirc; địch. Kể từ khi c&aacute;c trận v&ograve;ng cuối Ngoại hạng Anh sẽ chơi đồng loạt c&ugrave;ng l&uacute;c, ban tổ chức phải đặt một chiếc cup phi&ecirc;n bản giống thật tại Anfield ph&ograve;ng trường hợp Liverpool v&ocirc; địch. Chiếc cup giả n&agrave;y thường được d&ugrave;ng trong c&aacute;c sự kiện quảng b&aacute; của Ngoại hạng Anh.&nbsp;</p>', 'active', 'L3Yuzln8II.png', '2024-05-01 00:00:00', 'hailan', '2024-09-19 00:00:00', 'admin', '2019-04-29', 'normal'),
(5, 2, 'Bottas giành pole chặng thứ ba liên tiếp', NULL, '<p>Tay đua Phần Lan đ&aacute;nh bại đồng đội Lewis Hamilton ở v&ograve;ng ph&acirc;n hạng GP T&acirc;y Ban Nha h&ocirc;m 11/5.</p>\r\n\r\n<p>Valtteri Bottas nhanh hơn Hamilton 0,634 gi&acirc;y v&agrave; nhanh hơn người về thứ ba&nbsp;Sebastian Vettel 0,866 gi&acirc;y. Tay đua của Red Bull&nbsp;Max Verstappen nhanh thứ tư, trong khi&nbsp;Charles Leclerc về thứ năm.</p>', 'active', 'iQ1RXPioFZ.jpeg', '2019-05-04 00:00:00', 'hailan', '2024-08-29 00:00:00', 'admin', '2019-04-28', 'normal'),
(6, 2, 'HLV Cardiff: \'Man Utd sẽ không vô địch trong 10 năm tới\'', 'bv-hlv-cardiff-man-utd-se-khong-vo-dich-trong-10-nam-toi-6', '<p>Neil Warnock tỏ ra nghi ngờ về tương lai của Man Utd dưới thời HLV Solskjaer.</p>\n\n<p>&quot;Một số người nghĩ Man Utd cần từ hai đến ba kỳ chuyển nhượng nữa để gi&agrave;nh danh hiệu&quot;, HLV Neil Warnock chia sẻ. &quot;T&ocirc;i th&igrave; nghĩ c&oacute; thể l&agrave; 10 năm. T&ocirc;i kh&ocirc;ng thấy học&oacute; khả năng bắt kịp hai CLB h&agrave;ng đầu trong khoảng bốn hay năm năm tới&quot;.</p>\n\n<p>Lần cuối Man Utd v&ocirc; địch l&agrave; m&ugrave;a 2012-2013 dưới thời HLV Sir Alex Ferguson. Kể từ đ&oacute; đến nay, &quot;Quỷ đỏ&quot; kh&ocirc;ng c&ograve;n duy tr&igrave; được vị thế ứng cử vi&ecirc;n v&ocirc; địch h&agrave;ng đầu.&nbsp;</p>', 'active', 'ReChSfB95C.jpeg', '2019-05-04 00:00:00', 'hailan', '2024-08-29 00:00:00', 'admin', '2019-05-30', 'feature'),
(7, 6, 'Đại học Anh đưa khóa học hạnh phúc vào chương trình giảng dạy', 'bv-dai-hoc-anh-dua-khoa-hoc-hanh-phuc-vao-chuong-trinh-giang-day-7', '<p>Kh&oacute;a học diễn ra trong 12 tuần, sinh vi&ecirc;n năm nhất Đại học Bristol sẽ được kh&aacute;m ph&aacute; hạnh ph&uacute;c l&agrave; g&igrave; v&agrave; l&agrave;m thế n&agrave;o để đạt được n&oacute;.</p>\r\n\r\n<p>Đại học Bristol (Anh) quyết định đưa kh&oacute;a học hạnh ph&uacute;c v&agrave;o giảng dạy từ th&aacute;ng 9 năm nay nhằm giảm thiểu t&igrave;nh trạng tự tử ở sinh vi&ecirc;n, sau khi 12 sinh vi&ecirc;n ở một trường kh&aacute;c quy&ecirc;n sinh trong ba năm qua. Gi&aacute;o sư Bruce Hood, nh&agrave; t&acirc;m l&yacute; học chuy&ecirc;n nghi&ecirc;n cứu về c&aacute;ch thức hoạt động của bộ n&atilde;o v&agrave; con người, sẽ giảng dạy m&ocirc;n học mới n&agrave;y.</p>', 'active', 'hoyOyXJrzx.png', '2019-05-04 00:00:00', 'hailan', '2024-08-29 00:00:00', 'admin', '2019-05-05', 'normal'),
(8, 6, '11 cách đơn giản dạy trẻ quản lý thời gian', 'bv-11-cach-don-gian-day-tre-quan-ly-thoi-gian-8', '<p>Phụ huynh h&atilde;y tạo cảm gi&aacute;c vui vẻ, hướng dẫn trẻ thiết lập những ưu ti&ecirc;n h&agrave;ng ng&agrave;y để ch&uacute;ng c&oacute; thể tự quản l&yacute; thời gian hiệu quả.</p>\r\n\r\n<p>&quot;Nhanh l&ecirc;n&quot;, &quot;Con c&oacute; biết mấy giờ rồi kh&ocirc;ng&quot;, &quot;Điều g&igrave; l&agrave;m con mất nhiều thời gian như vậy&quot;..., l&agrave; những c&acirc;u n&oacute;i quen thuộc của phụ huynh để nhắc nhở con về kh&aacute;i niệm thời gian. Thay v&igrave; n&oacute;i những c&acirc;u tr&ecirc;n, phụ huynh c&oacute; thể dạy con c&aacute;ch quản l&yacute; giờ giấc ngay từ khi ch&uacute;ng c&ograve;n nhỏ.</p>', 'active', 'Phe2pSOC5Q.jpeg', '2019-05-04 00:00:00', 'hailan', '2024-08-29 00:00:00', 'admin', '2019-07-30', 'normal'),
(9, 4, 'Vì sao không hút thuốc vẫn bị ung thư phổi?', 'bv-vi-sao-khong-hut-thuoc-van-bi-ung-thu-phoi-9', '<p>D&ugrave; kh&ocirc;ng h&uacute;t thuốc, bạn vẫn c&oacute; nguy cơ ung thư phổi do h&iacute;t phải kh&oacute;i thuốc, tiếp x&uacute;c với kh&iacute; radon hoặc sống trong m&ocirc;i trường &ocirc; nhiễm.&nbsp;</p>\r\n\r\n<p>Người kh&ocirc;ng h&uacute;t thuốc vẫn c&oacute; thể bị ung thư phổi.&nbsp;Tr&ecirc;n&nbsp;<em>Journal of the Royal Society of Medicine</em>,&nbsp;c&aacute;c nh&agrave; khoa học từ&nbsp;Hiệp hội Ung thư Mỹ cho biết 20% bệnh nh&acirc;n ung thư phổi kh&ocirc;ng bao giờ h&uacute;t thuốc.&nbsp;Nghi&ecirc;n cứu 30 năm tr&ecirc;n 1,2 triệu người của tổ chức n&agrave;y cũng chỉ ra số người kh&ocirc;ng h&uacute;t thuốc bị ung thư phổi đang gia tăng. Hầu hết bệnh nh&acirc;n chỉ được chẩn đo&aacute;n khi đ&atilde; bước sang giai đoạn nghi&ecirc;m trọng kh&ocirc;ng thể điều trị.&nbsp;</p>', 'active', 'tPa7bgOesm.png', '2019-05-04 00:00:00', 'hailan', '2024-08-29 00:00:00', 'admin', '2019-08-30', 'normal'),
(10, 6, '10 hãng hàng không  tốt nhất thế giới năm 2019', 'bv-10-hang-hang-khong-tot-nhat-the-gioi-nam-2019-10', '<p>Qatar l&agrave; quốc gia duy nhất tr&ecirc;n thế giới c&oacute; h&atilde;ng h&agrave;ng kh&ocirc;ng v&agrave; s&acirc;n bay tốt nhất năm 2019.</p>\r\n\r\n<p>C&aacute;c s&acirc;n bay được đ&aacute;nh gi&aacute; dựa tr&ecirc;n 3 yếu tố: hiệu suất đ&uacute;ng giờ, chất lượng dịch vụ, thực phẩm v&agrave; lựa chọn mua sắm. Yếu tố đầu ti&ecirc;n chiếm 60% số điểm, hai ti&ecirc;u ch&iacute; c&ograve;n lại chiếm 20%. Dữ liệu của AirHelp được dựa tr&ecirc;n thống k&ecirc; từ nhiều nh&agrave; cung cấp thương mại, c&ugrave;ng cơ sở dữ liệu đ&aacute;nh gi&aacute; ri&ecirc;ng v&agrave; 40.000 khảo s&aacute;t h&agrave;nh kh&aacute;ch được thu thập từ hơn 40 quốc gia trong năm 2018.</p>', 'active', '8GlYE3KYtZ.png', '2019-05-04 00:00:00', 'hailan', '2024-08-29 00:00:00', 'admin', '2019-09-30', 'normal'),
(11, 6, 'Phát hiện bụt mọc cổ thụ hơn 2.600 tuổi ở Mỹ', 'bv-phat-hien-but-moc-co-thu-hon-2600-tuoi-o-my-11', '<p>Ph&aacute;t hiện mới gi&uacute;p bụt mọc trở th&agrave;nh một trong những c&acirc;y sinh sản hữu t&iacute;nh gi&agrave; nhất thế giới, vượt xa ước t&iacute;nh trước đ&acirc;y của c&aacute;c chuy&ecirc;n gia.</p>\r\n\r\n<p>C&aacute;c nh&agrave; khoa học ph&aacute;t hiện một c&acirc;y bụt mọc &iacute;t nhất đ&atilde; 2.624 tuổi ở v&ugrave;ng đầm lầy s&ocirc;ng Black, bang Bắc Carolina, Mỹ, theo nghi&ecirc;n cứu đăng tr&ecirc;n tạp ch&iacute;&nbsp;<em>Environmental Research Communications</em>&nbsp;h&ocirc;m 9/5.&nbsp;</p>\r\n\r\n<p>Nh&oacute;m nghi&ecirc;n cứu bắt gặp bụt mọc cổ thụ n&agrave;y trong l&uacute;c nghi&ecirc;n cứu v&ograve;ng tuổi của c&acirc;y để t&igrave;m hiểu về lịch sử kh&iacute; hậu tại miền đ&ocirc;ng nước Mỹ. Ngo&agrave;i thể hiện tuổi thọ, độ rộng v&agrave; m&agrave;u sắc của v&ograve;ng tuổi tr&ecirc;n th&acirc;n c&acirc;y c&ograve;n cho biết mức độ ẩm ướt hay kh&ocirc; hạn của năm tương ứng.</p>', 'active', 'a09zB7BiwV.jpeg', '2019-05-12 00:00:00', 'hailan', '2024-08-29 00:00:00', 'admin', '2019-05-12', 'normal'),
(12, 6, 'Apple có thể không nâng cấp iOS 13 cho iPhone SE, 6', 'bv-apple-co-the-khong-nang-cap-ios-13-cho-iphone-se-6-12', '<p>Những mẫu iPhone ra mắt từ 2014 v&agrave; iPhone SE c&oacute; thể kh&ocirc;ng được l&ecirc;n đời hệ điều h&agrave;nh iOS 13 ra mắt th&aacute;ng 6 tới.</p>\r\n\r\n<p>Theo&nbsp;<em>Phone Arena</em>, hệ điều h&agrave;nh iOS 13 sắp tr&igrave;nh l&agrave;ng tại hội nghị WWDC 2019 sẽ kh&ocirc;ng hỗ trợ một loạt iPhone đời cũ của Apple. Trong đ&oacute;, đ&aacute;ng ch&uacute; &yacute; l&agrave; c&aacute;c mẫu iPhone vẫn c&ograve;n được nhiều người d&ugrave;ng sử dụng như iPhone 6, 6s Plus hay SE.&nbsp;</p>', 'active', '9jOZGc7BJK.png', '2019-05-12 00:00:00', 'hailan', '2024-08-29 00:00:00', 'admin', '2019-05-10', 'normal'),
(13, 8, 'Hình dung về Honda Jazz thế hệ mới', 'bv-hinh-dung-ve-honda-jazz-the-he-moi-13', '<p>Thế hệ thứ tư của mẫu hatchback Honda tiết chế bớt những đường n&eacute;t g&acirc;n guốc, thể thao để thay bằng n&eacute;t trung t&iacute;nh, hợp mắt người d&ugrave;ng hơn.&nbsp;</p>\r\n\r\n<p>Những h&igrave;nh ảnh đầu ti&ecirc;n về Honda Jazz (Fit tại Nhật Bản) thế hệ mới bắt đầu xuất hiện tr&ecirc;n đường thử. D&ugrave; chưa phải thiết kế ho&agrave;n chỉnh, thay đổi của mẫu hatchback cỡ B cho thấy những đường n&eacute;t trung t&iacute;nh m&agrave; xe sắp sở hữu. Điều n&agrave;y tr&aacute;i ngược với tạo h&igrave;nh g&acirc;n guốc, thể thao ở thế hệ thứ ba hiện tại của Jazz.&nbsp;</p>', 'active', 'g2c7mYXBPW.png', '2019-05-12 00:00:00', 'hailan', '2024-08-29 00:00:00', 'admin', '2019-05-12', 'normal'),
(14, 2, 'Hà Nội vào vòng knock-out AFC Cup', 'bv-ha-noi-vao-vong-knock-out-afc-cup-14', '<p>ĐKVĐ V-League đ&aacute;nh bại&nbsp;Tampines Rovers 2-0 v&agrave;o chiều 15/5 để đứng đầu bảng F.</p>\r\n\r\n<p>Tiếp đối thủ đến từ Singapore trong t&igrave;nh thế buộc phải thắng để tự quyết v&eacute; đi tiếp, H&agrave; Nội đ&atilde; c&oacute; trận đấu dễ d&agrave;ng. C&oacute; thể n&oacute;i, kết quả của trận đấu được định đoạt trong hiệp một khi Oseni v&agrave; Th&agrave;nh Chung lần lượt ghi b&agrave;n cho đội chủ nh&agrave;. Trong khi đ&oacute;, Tampines Rovers phải trả gi&aacute; cho lối chơi th&ocirc; bạo khi Yasir Hanapi nhận thẻ v&agrave;ng thứ hai rời s&acirc;n. Tiền vệ n&agrave;y bị trừng phạt bởi pha đ&aacute;nh nguội với Th&agrave;nh Chung ở đầu trận, sau đ&oacute; l&agrave; t&igrave;nh huống phạm lỗi &aacute;c &yacute; với Đ&igrave;nh Trọng.</p>', 'active', 'e7YyFZJCc8.jpeg', '2019-05-15 00:00:00', 'hailan', '2024-08-29 00:00:00', 'admin', '2019-05-10', 'normal'),
(15, 2, 'Man City vẫn dự Champions League mùa 2019-2020', 'bv-man-city-van-du-champions-league-mua-2019-2020-15', '<p>Việc điều tra vi phạm luật c&ocirc;ng bằng t&agrave;i ch&iacute;nh của chủ s&acirc;n Etihad chưa thể ho&agrave;n th&agrave;nh trong v&ograve;ng một năm tới.</p>\n\n<p><em>Sports Mail</em>&nbsp;(Anh)&nbsp;cho biết, &aacute;n phạt cấm tham dự Champions League một m&ugrave;a với Man City, do vi phạm luật c&ocirc;ng bằng t&agrave;i ch&iacute;nh (FFP), chỉ được đưa ra sớm nhất v&agrave;o m&ugrave;a 2020-2021.</p>\n\n<p>Trong bức thư ngỏ gửi tới truyền th&ocirc;ng Anh, Man City viết: &quot;Ch&uacute;ng t&ocirc;i hợp t&aacute;c một c&aacute;ch thiện ch&iacute; với Tiểu ban kiểm so&aacute;t t&agrave;i ch&iacute;nh c&aacute;c CLB của UEFA (CFCB). CLB tin tưởng v&agrave;o sự độc lập v&agrave; cam kết của CFCB h&ocirc;m 7/3, rằng sẽ kh&ocirc;ng kết luận g&igrave; trong thời gian điều tra&quot;.</p>', 'active', 'exzJEG4WDU.jpeg', '2019-05-15 00:00:00', 'hailan', '2024-08-29 00:00:00', 'admin', '2019-05-10', 'normal'),
(16, 6, 'Những câu đố giúp rèn luyện trí não', 'bv-nhung-cau-do-giup-ren-luyen-tri-nao-16', '<p>Bạn cần quan s&aacute;t, suy luận logic v&agrave; c&oacute; vốn từ vựng tiếng Anh để giải quyết những c&acirc;u đố dưới đ&acirc;y.</p>\r\n\r\n<p>C&acirc;u 1:&nbsp;Mike đến một buổi phỏng vấn xin việc. Anh đ&atilde; g&acirc;y ấn tượng với gi&aacute;m đốc về những kỹ năng v&agrave; kinh nghiệm của m&igrave;nh. Tuy nhi&ecirc;n, để quyết định c&oacute; nhận Mike hay kh&ocirc;ng, nữ gi&aacute;m đốc đưa ra một c&acirc;u đố h&oacute;c b&uacute;a v&agrave; y&ecirc;u cầu Mike trả lời trong 30 gi&acirc;y.</p>\r\n\r\n<p>Nội dung c&acirc;u đố: H&atilde;y đưa ra 30 từ tiếng Anh kh&ocirc;ng c&oacute; chữ &quot;a&quot; xuất hiện trong đ&oacute;?&nbsp;</p>\r\n\r\n<p>Mike dễ d&agrave;ng giải quyết c&acirc;u đố. Theo bạn anh ấy n&oacute;i những từ tiếng Anh n&agrave;o để kịp trả lời trong 30 gi&acirc;y?</p>', 'active', 'TpcocqUjob.png', '2019-05-15 00:00:00', 'hailan', '2024-08-29 00:00:00', 'admin', '2019-05-10', 'normal'),
(17, 4, 'Cách nhận biết mật ong nguyên chất và pha trộn', 'bv-cach-nhan-biet-mat-ong-nguyen-chat-va-pha-tron-17', '<p>Mật ong nguy&ecirc;n chất sẽ kh&ocirc;ng thấm qua tờ giấy, lắng xuống đ&aacute;y ly nước v&agrave; bị kiến ăn, kh&aacute;c với mật ong bị pha trộn tạp chất.</p>\r\n\r\n<p>Dược sĩ V&otilde; H&ugrave;ng Mạnh, Trưởng khoa Dược Bệnh viện Y học d&acirc;n tộc cổ truyền B&igrave;nh Định, cho biết thị trường c&oacute; nhiều loại mật ong bị pha trộn, chỉ nh&igrave;n bề ngo&agrave;i hay ngửi m&ugrave;i chưa chắc ph&acirc;n biệt được.</p>\r\n\r\n<p>Theo dược sĩ H&ugrave;ng, một c&aacute;ch ph&acirc;n biệt thật giả l&agrave; lấy cọng h&agrave;nh tươi nh&uacute;ng v&agrave;o lọ mật ong, lấy ra chừng v&agrave;i ph&uacute;t. Cọng l&aacute; h&agrave;nh sẽ chuyển từ m&agrave;u xanh l&aacute; sang sậm nếu mật ong thật. Ngo&agrave;i ra, c&oacute; thể nhỏ giọt mật v&agrave;o nơi c&oacute; kiến, nếu kiến kh&ocirc;ng bu giọt mật th&igrave; cũng l&agrave; mật ong thật.</p>\r\n\r\n<p>Ng&agrave;y nay, nhiều người đặt mật ong v&agrave;o ngăn đ&aacute; tủ lạnh, sau 24 giờ m&agrave; kh&ocirc;ng c&oacute; hiện tượng đ&ocirc;ng đ&aacute; th&igrave; l&agrave; mật thật.</p>', 'active', 'xvEqmF5uyJ.png', '2019-05-15 00:00:00', 'hailan', '2024-08-29 00:00:00', 'admin', '2019-05-10', 'normal'),
(18, 6, 'Nhiều tour mùa hè giảm giá hàng chục triệu đồng', 'bv-nhieu-tour-mua-he-giam-gia-hang-chuc-trieu-dong-18', '<p>C&aacute;c tour trong v&agrave; ngo&agrave;i nước đều được giảm gi&aacute; mạnh để k&iacute;ch cầu du lịch trong dịp h&egrave;, nhiều chương tr&igrave;nh khuyến m&atilde;i l&ecirc;n đến h&agrave;ng chục triệu đồng.</p>\r\n\r\n<p>Sau khi so s&aacute;nh tiền v&eacute; m&aacute;y bay, ph&ograve;ng kh&aacute;ch sạn ở Bali để chuẩn bị cho kỳ nghỉ h&egrave; của gia đ&igrave;nh, anh Sơn (ngụ quận 2, TP HCM) quyết định chuyển sang mua tour trọn g&oacute;i v&igrave; tiết kiệm hơn.</p>', 'active', 'd2ABCeBzoR.jpeg', '2019-05-15 00:00:00', 'hailan', '2024-08-29 00:00:00', 'admin', '2019-05-15', 'normal'),
(19, 8, 'BMW i8 Roadster - xe mui trần dẫn đường ở Formula E', 'bv-bmw-i8-roadster---xe-mui-tran-dan-duong-o-formula-e-19', '<p>Dịp cuối tuần qua, BMW giới thiệu chiếc xe dẫn đường, l&agrave;m nhiệm vụ đảm bảo an to&agrave;n tại giải đua xe Formula E. Giải đua tương tự giải F1, nhưng to&agrave;n bộ xe đua sử dụng động cơ điện.</p>\r\n\r\n<p>i8 Roadster Safety Car dựa tr&ecirc;n chiếc i8 Roadster ti&ecirc;u chuẩn, nhưng c&oacute; những thay đổi để trở th&agrave;nh chiếc xe dẫn đường chuy&ecirc;n dụng. Ngoại h&igrave;nh c&oacute; một số đặc điểm ấn tượng hơn so với nguy&ecirc;n bản. K&iacute;nh chắn gi&oacute; kiểu d&agrave;nh cho xe đua, trọng t&acirc;m hạ thấp 15 mm.</p>', 'active', '9fbeUKTBpU.png', '2019-05-15 00:00:00', 'hailan', '2024-08-29 00:00:00', 'admin', '2019-05-10', 'normal'),
(20, 6, 'Tia cực tím tại Hà Nội ở mức \'nguy hiểm\'', 'bv-tia-cuc-tim-tai-ha-noi-o-muc-nguy-hiem-20', '<p>Chỉ số tia UV tại H&agrave; Nội ng&agrave;y 18-19/5 l&ecirc;n tới 11, mức được đ&aacute;nh gi&aacute; l&agrave; &quot;nguy hiểm&quot; dễ khiến da, mắt bị bỏng nhiệt.</p>\r\n\r\n<p><img alt=\"\" src=\"http://proj_news.xyz/images/article/tia-cuc-tim-hanoi.png\" style=\"height:171px; width:674px\" /></p>\r\n\r\n<p>H&agrave; Nội đang trải qua đợt nắng n&oacute;ng gay gắt. Theo Trung t&acirc;m Dự b&aacute;o Kh&iacute; tượng Thủy văn Quốc gia, nhiệt độ cao nhất ở H&agrave; Nội ng&agrave;y 18/5 dao động trong khoảng 37 đến 39 độ C, c&oacute; nơi tr&ecirc;n 39 độ.&nbsp;Trang&nbsp;<em>World Weather Online</em>&nbsp;của Anh dự b&aacute;o chỉ số tia cực t&iacute;m tại H&agrave; Nội hai ng&agrave;y 18-19/5 đạt mức 11.&nbsp;</p>', 'active', 'C4DtP4ico8.png', '2019-05-17 00:00:00', 'hailan', '2024-08-29 00:00:00', 'admin', '2019-05-16', 'normal'),
(21, 3, 'Blockchain và trí tuệ nhân tạo AI làm thay đổi giáo dục trực tuyến', 'bv-blockchain-va-tri-tue-nhan-tao-ai-lam-thay-doi-giao-duc-truc-tuyen-21', '<p>Blockchain khiến dữ liệu trở n&ecirc;n c&ocirc;ng khai, minh bạch với người học, AI gi&uacute;p cải thiện khả năng tương t&aacute;c v&agrave; giảng dạy với từng c&aacute; nh&acirc;n.</p>\r\n\r\n<p>Sự b&ugrave;ng nổ của Internet v&agrave; những c&ocirc;ng nghệ mới như chuỗi khối (Blockchain) v&agrave; tr&iacute; tuệ nh&acirc;n tạo (AI) đ&atilde; g&oacute;p phần l&agrave;m thay đổi nền gi&aacute;o dục tr&ecirc;n to&agrave;n thế giới, h&igrave;nh th&agrave;nh những nền tảng Online Learning với nhiều ưu thế.</p>\r\n\r\n<p><strong>Mobile Learning dự b&aacute;o l&agrave; &quot;Cuộc c&aacute;ch mạng tiếp theo&quot; của gi&aacute;o dục trực tuyến</strong></p>\r\n\r\n<p>Theo nghi&ecirc;n cứu của Global Market Insights, thị trường gi&aacute;o dục trực tuyến to&agrave;n cầu đang c&oacute; tốc độ ph&aacute;t triển nhanh chưa từng thấy khi nền tảng hạ tầng Internet ng&agrave;y c&agrave;ng ho&agrave;n thiện v&agrave; phủ s&oacute;ng rộng khắp. Gi&aacute; trị c&aacute;c start-up về EdTech (C&ocirc;ng ty c&ocirc;ng nghệ chuy&ecirc;n về gi&aacute;o dục) to&agrave;n cầu được ước t&iacute;nh hơn 190 tỷ USD v&agrave;o năm 2018 v&agrave; dự kiến vượt hơn 300 tỷ USD v&agrave;o năm 2025.</p>', 'active', 'Im5BdAHqV1.png', '2019-05-17 00:00:00', 'hailan', '2024-09-16 00:00:00', 'admin', '2019-05-16', 'normal'),
(22, 6, 'Huawei nói lệnh cấm sẽ khiến Mỹ tụt hậu về 5G', 'bv-huawei-noi-lenh-cam-se-khien-my-tut-hau-ve-5g-22', '<p>Huawei khẳng định sắc lệnh mới của Mỹ sẽ chỉ c&agrave;ng khiến qu&aacute; tr&igrave;nh triển khai c&ocirc;ng nghệ 5G ở nước n&agrave;y th&ecirc;m chậm chạp v&agrave; đắt đỏ.</p>\r\n\r\n<p>H&atilde;ng c&ocirc;ng nghệ Trung Quốc tự nhận l&agrave; &quot;người dẫn đầu kh&ocirc;ng ai s&aacute;nh kịp về c&ocirc;ng nghệ 5G&quot;, n&ecirc;n việc bị hạn chế kinh doanh ở Mỹ chỉ dẫn đến kết cục l&agrave; Mỹ sẽ bị &quot;tụt lại ph&iacute;a sau&quot; trong việc triển khai c&ocirc;ng nghệ kết nối di động thế hệ mới</p>', 'active', 'nt1QxhKUXM.jpeg', '2019-05-17 00:00:00', 'hailan', '2024-08-29 00:00:00', 'admin', '2019-05-16', 'normal'),
(23, 7, 'Asus ra mắt Zenfone 6 với camera lật tự động', 'bv-asus-ra-mat-zenfone-6-voi-camera-lat-tu-dong-23', '<p>Với thiết kế m&agrave;n h&igrave;nh tr&agrave;n viền ho&agrave;n to&agrave;n kh&ocirc;ng tai thỏ, camera ch&iacute;nh 48 megapixel tr&ecirc;n Zenfone 6 c&oacute; thể lật từ sau ra trước biến th&agrave;nh camera selfie.</p>\r\n\r\n<p>Zenfone 6 l&agrave; một trong những smartphone c&oacute; viền m&agrave;n h&igrave;nh mỏng nhất tr&ecirc;n thị trường với tỷ lệ m&agrave;n h&igrave;nh hiển thị chiếm tới 92% diện t&iacute;ch mặt trước. M&aacute;y c&oacute; m&agrave;n h&igrave;nh 6,4 inch tr&agrave;n viền ra cả bốn cạnh, kh&ocirc;ng tai thỏ như một số mẫu Zenfone trước v&agrave; cũng kh&ocirc;ng d&ugrave;ng thiết kế đục lỗ như Galaxy S10, S10+...</p>', 'active', 'aiC6j6fWZY.png', '2019-05-17 00:00:00', 'hailan', '2024-10-26 00:00:00', 'admin', '2019-05-16', 'normal'),
(34, 7, 'trí tuệ nhân tạo AI', 'bv-tri-tue-nhan-tao-ai-34', '<p>Trong thời đại m&agrave; tiến bộ c&ocirc;ng nghệ kh&ocirc;ng chỉ l&agrave; một lựa chọn m&agrave; c&ograve;n l&agrave; điều cần thiết, c&aacute;c doanh nghiệp đang ng&agrave;y c&agrave;ng chuyển sang sử dụng Tr&iacute; tuệ nh&acirc;n tạo (AI) để hợp l&yacute; h&oacute;a hoạt động, n&acirc;ng cao hiệu quả v&agrave; đạt được hiệu quả hoạt động xuất sắc. Việc t&iacute;ch hợp AI trong khu&ocirc;n khổ Vận h&agrave;nh xuất sắc (Operational Excellence) hay Lean Six Sigma kh&ocirc;ng chỉ c&oacute; thể tối ưu h&oacute;a hoạt động, quy tr&igrave;nh v&agrave; hệ thống của c&ocirc;ng ty m&agrave; c&ograve;n đ&oacute;ng g&oacute;p đ&aacute;ng kể v&agrave;o văn h&oacute;a cải tiến li&ecirc;n tục v&agrave; tạo ra gi&aacute; trị.&nbsp;</p>\r\n\r\n<p><img alt=\"\" src=\"http://proj_news.xyz/images/article/tri-tue-nhan-tao-ai-la-gi-ung-dung-nhu-the-nao-trong-cuoc-song--6.jpg\" style=\"height:354px; width:630px\" /></p>\r\n\r\n<p>B&agrave;i viết n&agrave;y t&igrave;m hiểu c&aacute;c c&acirc;u hỏi &#39;tại sao&#39;, &#39;c&aacute;i g&igrave;&#39;, &#39;như thế n&agrave;o&#39; v&agrave; &#39;điều g&igrave; sẽ xảy ra tiếp theo&#39; khi &aacute;p dụng AI trong kinh doanh, n&ecirc;u bật cả những cơ hội v&agrave; th&aacute;ch thức m&agrave; n&oacute; mang lại.</p>', 'active', 'cC2FlDJ7S3.jpg', '2024-08-23 00:00:00', 'admin', '2025-04-18 00:00:00', 'admin', NULL, 'normal'),
(42, 4, 'Lợi ích của việc làm \"con Sen\"', 'bv-loi-ich-cua-viec-lam-con-sen-42', '<p>M&egrave;o ch&iacute;nh l&agrave; người bạn l&yacute; tưởng để gi&uacute;p họ kh&ocirc;ng c&ograve;n cảm gi&aacute;c c&ocirc; đơn. Sự hiện diện của m&egrave;o trong cuộc sống hằng ng&agrave;y khiến bạn giảm cảm gi&aacute;c bị c&ocirc; lập, tăng cảm gi&aacute;c hạnh ph&uacute;c. Đặc biệt khi &acirc;u yếm con m&egrave;o, chơi c&ugrave;ng ch&uacute;ng th&igrave; c&oacute; thể&nbsp;<strong>điều chỉnh nhịp tim, giảm mức cholesterol từ đ&oacute; gi&uacute;p giảm khả năng mắc bệnh tim</strong>.</p>\r\n\r\n<p><img alt=\"\" src=\"http://proj_news.xyz/images/cho be choi voi meo cung.jpg\" style=\"height:342px; width:512px\" /></p>\r\n\r\n<h3>Người bạn của người sống độc th&acirc;n</h3>\r\n\r\n<p>Phần lớn cuộc sống hiện nay c&oacute; nhiều người chọn sống độc th&acirc;n. M&egrave;o ch&iacute;nh l&agrave; người bạn l&yacute; tưởng để gi&uacute;p họ kh&ocirc;ng c&ograve;n cảm gi&aacute;c c&ocirc; đơn. Sự hiện diện của m&egrave;o trong cuộc sống hằng ng&agrave;y khiến bạn giảm cảm gi&aacute;c bị c&ocirc; lập, tăng cảm gi&aacute;c hạnh ph&uacute;c. Đặc biệt khi &acirc;u yếm con m&egrave;o, chơi c&ugrave;ng ch&uacute;ng th&igrave; c&oacute; thể điều chỉnh nhịp tim, giảm mức cholesterol từ đ&oacute; gi&uacute;p giảm khả năng mắc&nbsp;bệnh tim.</p>\r\n\r\n<h3>Chữa bệnh, l&agrave;m dịu t&acirc;m hồn</h3>\r\n\r\n<p>Tiếng k&ecirc;u gừ gừ của m&egrave;o l&uacute;c ch&uacute;ng thoải m&aacute;i c&oacute; thể gi&uacute;p giảm căng thẳng cho người nu&ocirc;i m&egrave;o. Đặc biệt tiếng k&ecirc;u đặc trưng n&agrave;y gi&uacute;p l&agrave;m dịu thần kinh, l&agrave;m giảm c&aacute;c hormone g&acirc;y căng thẳng như&nbsp;cortisol, hạ huyết &aacute;p. Chưa kể tiếng k&ecirc;u n&agrave;y của m&egrave;o c&oacute; thể t&aacute;c động t&iacute;ch cực đến tr&iacute; nhớ, tần số k&ecirc;u của m&egrave;o tương ứng với tần số rung của điện c&oacute; thể đưa v&agrave;o điều trị bệnh về xương.</p>\r\n\r\n<h3>Cải thiện chất lượng giấc ngủ, tăng cường hệ miễn dịch</h3>\r\n\r\n<p>M&egrave;o mang lại năng lượng rất l&agrave;nh t&iacute;nh, bản chất của ch&uacute;ng l&agrave; lo&agrave;i vật dịu d&agrave;ng, độc lập. Thường xuy&ecirc;n tiếp x&uacute;c với m&egrave;o c&oacute; thể giảm bớt c&aacute;c triệu chứng g&acirc;y rối loạn giấc ngủ. Chưa kể m&egrave;o rất th&iacute;ch ngủ với người, &ocirc;m ch&uacute;ng ngủ c&ugrave;ng tiếng k&ecirc;u gừ gừ đặc trưng khi m&egrave;o chui r&uacute;c v&agrave;o ngực của bạn sẽ th&uacute;c đẩy bạn ch&igrave;m nhanh v&agrave;o giấc ngủ. B&ecirc;n cạnh đ&oacute;&nbsp;<a href=\"https://nhathuoclongchau.com.vn/bai-viet/long-meo-co-hai-khong-mot-so-cach-giup-lam-giam-tac-hai-cua-long-meo.html\">l&ocirc;ng m&egrave;o</a>, nước bọt, vi tr&ugrave;ng kh&aacute;c gi&uacute;p r&egrave;n luyện cho hệ thống miễn dịch của con người, l&agrave;m cho ch&uacute;ng ta x&acirc;y dựng được hệ thống ph&ograve;ng mầm bệnh c&ugrave;ng c&aacute;c chất g&acirc;y dị ứng.</p>', 'active', 'JieTnUD6Un.jpg', '2025-04-17 00:00:00', 'admin', '2025-04-24 00:00:00', 'admin', NULL, NULL);

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
-- Cấu trúc bảng cho bảng `article_translations`
--

CREATE TABLE `article_translations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `article_id` bigint(20) UNSIGNED NOT NULL,
  `locale` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `content` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `article_translations`
--

INSERT INTO `article_translations` (`id`, `article_id`, `locale`, `name`, `slug`, `content`) VALUES
(1, 6, 'en', 'Cardiff coach: \'Man Utd will not win the championship in the next 10 years\'', 'bv-Cardiff-coach-man-utd-will-not-win-the-championship-in-the-next-10-years-6', '<p>Neil Warnock questions Man Utd\'s future under Solskjaer.\r\n\r\n\"Some people think Man Utd need two or three more transfer windows to win a title,\" coach Neil Warnock shared. \"I think it could take 10 years. I don\'t see them catching up with the top two clubs in the next four or five years.\"\r\n\r\nThe last time Man Utd won the title was in the 2012-2013 season under Sir Alex Ferguson. Since then, the \"Red Devils\" have failed to maintain their status as a top title contender.</p>'),
(2, 6, 'vi', 'HLV Cardiff: \'Man Utd sẽ không vô địch trong 10 năm tới\'', 'bv-hlv-cardiff-man-utd-se-khong-vo-dich-trong-10-nam-toi-6', '<p>Neil Warnock tỏ ra nghi ngờ về tương lai của Man Utd dưới thời HLV Solskjaer.</p>\r\n\r\n<p>&quot;Một số người nghĩ Man Utd cần từ hai đến ba kỳ chuyển nhượng nữa để gi&agrave;nh danh hiệu&quot;, HLV Neil Warnock chia sẻ. &quot;T&ocirc;i th&igrave; nghĩ c&oacute; thể l&agrave; 10 năm. T&ocirc;i kh&ocirc;ng thấy học&oacute; khả năng bắt kịp hai CLB h&agrave;ng đầu trong khoảng bốn hay năm năm tới&quot;.</p>\r\n\r\n<p>Lần cuối Man Utd v&ocirc; địch l&agrave; m&ugrave;a 2012-2013 dưới thời HLV Sir Alex Ferguson. Kể từ đ&oacute; đến nay, &quot;Quỷ đỏ&quot; kh&ocirc;ng c&ograve;n duy tr&igrave; được vị thế ứng cử vi&ecirc;n v&ocirc; địch h&agrave;ng đầu.&nbsp;</p>'),
(3, 4, 'vi', 'Liverpool chỉ được nâng Cup phiên bản nếu vô địch hôm nay', 'bv-liverpool-chi-duoc-nang-cup-phien-ban-neu-vo-dich-hom-nay-4', '<p>Đội b&oacute;ng th&agrave;nh phố cảng sẽ kh&ocirc;ng n&acirc;ng Cup nguy&ecirc;n bản nếu vượt mặt Man City ở v&ograve;ng cuối Ngoại hạng Anh.</p>\r\n\r\n<p>Liverpool k&eacute;m Man City một điểm trước khi tiếp Wolverhampton tr&ecirc;n s&acirc;n nh&agrave; Anfield v&agrave;o ng&agrave;y Chủ Nhật. Ở trận đấu c&ugrave;ng giờ, Man City sẽ l&agrave;m kh&aacute;ch tới s&acirc;n Brighton v&agrave; biết một chiến thắng sẽ gi&uacute;p họ bảo vệ th&agrave;nh c&ocirc;ng ng&ocirc;i v&ocirc; địch. Kể từ khi c&aacute;c trận v&ograve;ng cuối Ngoại hạng Anh sẽ chơi đồng loạt c&ugrave;ng l&uacute;c, ban tổ chức phải đặt một chiếc cup phi&ecirc;n bản giống thật tại Anfield ph&ograve;ng trường hợp Liverpool v&ocirc; địch. Chiếc cup giả n&agrave;y thường được d&ugrave;ng trong c&aacute;c sự kiện quảng b&aacute; của Ngoại hạng Anh.&nbsp;</p>'),
(4, 4, 'en', 'Liverpool will only lift the replica trophy if they win today', 'bv-Liverpool-will-only-lift-the-replica-trophy-if-they-win-today-4', '<p>The port city club will not lift the original trophy if they overtake Man City on the final day of the Premier League.\r\n\r\nLiverpool trail Man City by one point before hosting Wolverhampton at Anfield on Sunday. At the same time, Man City will visit Brighton, knowing that a win will secure their title defense. Since all final-round Premier League matches are played simultaneously, the organizers have placed a replica trophy at Anfield in case Liverpool wins the title. This replica trophy is usually used for Premier League promotional events.</p>'),
(7, 16, 'vi', 'Những câu đố giúp rèn luyện trí não', 'bv-nhung-cau-do-giup-ren-luyen-tri-nao-16', '<p>Bạn cần quan s&aacute;t, suy luận logic v&agrave; c&oacute; vốn từ vựng tiếng Anh để giải quyết những c&acirc;u đố dưới đ&acirc;y.</p>\r\n      \r\n      <p>C&acirc;u 1:&nbsp;Mike đến một buổi phỏng vấn xin việc. Anh đ&atilde; g&acirc;y ấn tượng với gi&aacute;m đốc về những kỹ năng v&agrave; kinh nghiệm của m&igrave;nh. Tuy nhi&ecirc;n, để quyết định c&oacute; nhận Mike hay kh&ocirc;ng, nữ gi&aacute;m đốc đưa ra một c&acirc;u đố h&oacute;c b&uacute;a v&agrave; y&ecirc;u cầu Mike trả lời trong 30 gi&acirc;y.</p> ◀\r\n      \r\n      <p>Nội dung c&acirc;u đố: H&atilde;y đưa ra 30 từ tiếng Anh kh&ocirc;ng c&oacute; chữ &quot;a&quot; xuất hiện trong đ&oacute;?&nbsp;</p>\r\n      \r\n      <p>Mike dễ d&agrave;ng giải quyết c&acirc;u đố. Theo bạn anh ấy n&oacute;i những từ tiếng Anh n&agrave;o để kịp trả lời trong 30 gi&acirc;y?</p>'),
(8, 16, 'en', 'Brain-Training Riddles', 'bv-brain-training-riddles-16', '<p>You need keen observation, logical reasoning, and a good English vocabulary to solve the following puzzles.\r\nPuzzle 1:\r\nMike attends a job interview. He impresses the director with his skills and experience. However, to decide whether to hire Mike, the female director presents him with a tricky riddle and gives him 30 seconds to answer.\r\n\r\nThe riddle: \"Name 30 English words that do not contain the letter \'a\'.\"\r\n\r\nMike easily solves the puzzle. What words do you think he said to answer within 30 seconds?</p>'),
(9, 15, 'en', 'Man City Still Eligible for the 2019-2020 Champions League', 'bv-man-city-still-eligible-for-the-2019-2020-champions-league-15', '<p>The investigation into Etihad Stadium\'s financial fair play violations will not be concluded within the next year.\r\n\r\nAccording to Sports Mail (UK), the one-season Champions League ban for Man City, due to violations of Financial Fair Play (FFP) rules, would only take effect at the earliest in the 2020-2021 season.\r\n\r\nIn an open letter to the British media, Man City stated: \"We are cooperating in good faith with UEFA\'s Club Financial Control Body (CFCB). The club trusts in CFCB\'s independence and its commitment, as stated on March 7, that no conclusions will be drawn during the investigation period.\"</p>'),
(10, 15, 'vi', 'Man City vẫn dự Champions League mùa 2019-2020', 'bv-man-city-van-du-champions-league-mua-2019-2020-15', '<p>Việc điều tra vi phạm luật c&ocirc;ng bằng t&agrave;i ch&iacute;nh của chủ s&acirc;n Etihad chưa thể ho&agrave;n th&agrave;nh trong v&ograve;ng một năm tới.</p>\r\n\r\n<p><em>Sports Mail</em>&nbsp;(Anh)&nbsp;cho biết, &aacute;n phạt cấm tham dự Champions League một m&ugrave;a với Man City, do vi phạm luật c&ocirc;ng bằng t&agrave;i ch&iacute;nh (FFP), chỉ được đưa ra sớm nhất v&agrave;o m&ugrave;a 2020-2021.</p>\r\n\r\n<p>Trong bức thư ngỏ gửi tới truyền th&ocirc;ng Anh, Man City viết: &quot;Ch&uacute;ng t&ocirc;i hợp t&aacute;c một c&aacute;ch thiện ch&iacute; với Tiểu ban kiểm so&aacute;t t&agrave;i ch&iacute;nh c&aacute;c CLB của UEFA (CFCB). CLB tin tưởng v&agrave;o sự độc lập v&agrave; cam kết của CFCB h&ocirc;m 7/3, rằng sẽ kh&ocirc;ng kết luận g&igrave; trong thời gian điều tra&quot;.</p>'),
(11, 14, 'en', 'Hanoi Advances to AFC Cup Knockout Stage', 'bv-hanoi-advances-to-aFC-cup-knockout-stage-14', '<p>The V-League defending champions defeated Tampines Rovers 2-0 on May 15 to top Group F.\r\n\r\nFacing the Singaporean opponents in a must-win match to secure their own fate, Hanoi had an easy game. The outcome was essentially decided in the first half when Oseni and Thành Chung scored for the home team. Meanwhile, Tampines Rovers paid the price for their rough play as Yasir Hanapi received a second yellow card and was sent off. The midfielder was punished for an off-the-ball foul on Thành Chung early in the game, followed by a reckless challenge on Đình Trọng.</p>'),
(12, 14, 'vi', 'Hà Nội vào vòng knock-out AFC Cup', 'bv-ha-noi-vao-vong-knock-out-afc-cup-14', '<p>ĐKVĐ V-League đánh bại Tampines Rovers 2-0 vào chiều 15/5 để đứng đầu bảng F.\r\n\r\nTiếp đối thủ đến từ Singapore trong tình thế buộc phải thắng để tự quyết vé đi tiếp, Hà Nội đã có trận đấu dễ dàng. Có thể nói, kết quả của trận đấu được định đoạt trong hiệp một khi Oseni và Thành Chung lần lượt ghi bàn cho đội chủ nhà. Trong khi đó, Tampines Rovers phải trả giá cho lối chơi thô bạo khi Yasir Hanapi nhận thẻ vàng thứ hai rời sân. Tiền vệ này bị trừng phạt bởi pha đánh nguội với Thành Chung ở đầu trận, sau đó là tình huống phạm lỗi ác ý với Đình Trọng.</p>'),
(16, 42, 'vi', 'Lợi ích của việc làm \"con Sen\"', 'bv-loi-ich-cua-viec-lam-con-sen-42', '<p>M&egrave;o ch&iacute;nh l&agrave; người bạn l&yacute; tưởng để gi&uacute;p họ kh&ocirc;ng c&ograve;n cảm gi&aacute;c c&ocirc; đơn. Sự hiện diện của m&egrave;o trong cuộc sống hằng ng&agrave;y khiến bạn giảm cảm gi&aacute;c bị c&ocirc; lập, tăng cảm gi&aacute;c hạnh ph&uacute;c. Đặc biệt khi &acirc;u yếm con m&egrave;o, chơi c&ugrave;ng ch&uacute;ng th&igrave; c&oacute; thể&nbsp;<strong>điều chỉnh nhịp tim, giảm mức cholesterol từ đ&oacute; gi&uacute;p giảm khả năng mắc bệnh tim</strong>.</p>\r\n\r\n<p><img alt=\"\" src=\"http://proj_news.xyz/images/cho be choi voi meo cung.jpg\" style=\"height:342px; width:512px\" /></p>\r\n\r\n<h3>Người bạn của người sống độc th&acirc;n</h3>\r\n\r\n<p>Phần lớn cuộc sống hiện nay c&oacute; nhiều người chọn sống độc th&acirc;n. M&egrave;o ch&iacute;nh l&agrave; người bạn l&yacute; tưởng để gi&uacute;p họ kh&ocirc;ng c&ograve;n cảm gi&aacute;c c&ocirc; đơn. Sự hiện diện của m&egrave;o trong cuộc sống hằng ng&agrave;y khiến bạn giảm cảm gi&aacute;c bị c&ocirc; lập, tăng cảm gi&aacute;c hạnh ph&uacute;c. Đặc biệt khi &acirc;u yếm con m&egrave;o, chơi c&ugrave;ng ch&uacute;ng th&igrave; c&oacute; thể điều chỉnh nhịp tim, giảm mức cholesterol từ đ&oacute; gi&uacute;p giảm khả năng mắc&nbsp;bệnh tim.</p>\r\n\r\n<h3>Chữa bệnh, l&agrave;m dịu t&acirc;m hồn</h3>\r\n\r\n<p>Tiếng k&ecirc;u gừ gừ của m&egrave;o l&uacute;c ch&uacute;ng thoải m&aacute;i c&oacute; thể gi&uacute;p giảm căng thẳng cho người nu&ocirc;i m&egrave;o. Đặc biệt tiếng k&ecirc;u đặc trưng n&agrave;y gi&uacute;p l&agrave;m dịu thần kinh, l&agrave;m giảm c&aacute;c hormone g&acirc;y căng thẳng như&nbsp;cortisol, hạ huyết &aacute;p. Chưa kể tiếng k&ecirc;u n&agrave;y của m&egrave;o c&oacute; thể t&aacute;c động t&iacute;ch cực đến tr&iacute; nhớ, tần số k&ecirc;u của m&egrave;o tương ứng với tần số rung của điện c&oacute; thể đưa v&agrave;o điều trị bệnh về xương.</p>\r\n\r\n<h3>Cải thiện chất lượng giấc ngủ, tăng cường hệ miễn dịch</h3>\r\n\r\n<p>M&egrave;o mang lại năng lượng rất l&agrave;nh t&iacute;nh, bản chất của ch&uacute;ng l&agrave; lo&agrave;i vật dịu d&agrave;ng, độc lập. Thường xuy&ecirc;n tiếp x&uacute;c với m&egrave;o c&oacute; thể giảm bớt c&aacute;c triệu chứng g&acirc;y rối loạn giấc ngủ. Chưa kể m&egrave;o rất th&iacute;ch ngủ với người, &ocirc;m ch&uacute;ng ngủ c&ugrave;ng tiếng k&ecirc;u gừ gừ đặc trưng khi m&egrave;o chui r&uacute;c v&agrave;o ngực của bạn sẽ th&uacute;c đẩy bạn ch&igrave;m nhanh v&agrave;o giấc ngủ. B&ecirc;n cạnh đ&oacute;&nbsp;<a href=\"https://nhathuoclongchau.com.vn/bai-viet/long-meo-co-hai-khong-mot-so-cach-giup-lam-giam-tac-hai-cua-long-meo.html\">l&ocirc;ng m&egrave;o</a>, nước bọt, vi tr&ugrave;ng kh&aacute;c gi&uacute;p r&egrave;n luyện cho hệ thống miễn dịch của con người, l&agrave;m cho ch&uacute;ng ta x&acirc;y dựng được hệ thống ph&ograve;ng mầm bệnh c&ugrave;ng c&aacute;c chất g&acirc;y dị ứng.</p>'),
(17, 42, 'en', 'Benefits of playing with cats', 'bv-benefits-of-playing-with-cats-42', '<p>Cats are the ideal companions to help them no longer feel lonely. The presence of cats in daily life makes you less isolated, increases happiness. Especially when cuddling cats, playing with them can regulate heart rate, reduce cholesterol levels, thereby helping to reduce the possibility of heart disease.</p>\r\n\r\n<p><img alt=\"\" src=\"http://proj_news.xyz/images/be thich choi voi meo.jpg\" style=\"height:342px; width:512px\" /></p>\r\n\r\n<p>Cure, soothe the soul<br />\r\nThe purr of a cat when they are comfortable can help reduce stress for cat owners. In particular, this characteristic cry helps calm the nerves, reduce stress hormones such as cortisol, lower blood pressure. Not to mention that this cat&#39;s cry can have a positive impact on memory, the frequency of the cat&#39;s cry corresponds to the frequency of electric vibrations that can be used to treat bone diseases.</p>\r\n\r\n<p>Improve sleep quality, strengthen the immune system<br />\r\nCats bring very benign energy, their nature is gentle, independent animals. Frequent contact with cats can reduce symptoms of sleep disorders. Not to mention that cats love to sleep with people, hugging them to sleep with the characteristic purr when the cat nestles on your chest will promote you to fall asleep quickly. In addition, cat hair, saliva, and other germs help train the human immune system, allowing us to build a system to prevent pathogens and allergens.</p>'),
(18, 34, 'en', 'artificial intelligence', 'bv-artificial-intelligence-34', '<p>In an era where technological advancement is not only an option but a necessity, businesses are increasingly turning to Artificial Intelligence (AI) to streamline operations, improve efficiency and achieve operational excellence. Integrating AI within an Operational Excellence or Lean Six Sigma framework can not only optimize a company&rsquo;s operations, processes and systems but also contribute significantly to a culture of continuous improvement and value creation.</p>\r\n\r\n<p><img alt=\"\" src=\"http://proj_news.xyz/images/ai.jfif\" style=\"height:168px; width:300px\" /></p>'),
(19, 34, 'vi', 'trí tuệ nhân tạo AI', 'bv-tri-tue-nhan-tao-ai-34', '<p>Trong thời đại m&agrave; tiến bộ c&ocirc;ng nghệ kh&ocirc;ng chỉ l&agrave; một lựa chọn m&agrave; c&ograve;n l&agrave; điều cần thiết, c&aacute;c doanh nghiệp đang ng&agrave;y c&agrave;ng chuyển sang sử dụng Tr&iacute; tuệ nh&acirc;n tạo (AI) để hợp l&yacute; h&oacute;a hoạt động, n&acirc;ng cao hiệu quả v&agrave; đạt được hiệu quả hoạt động xuất sắc. Việc t&iacute;ch hợp AI trong khu&ocirc;n khổ Vận h&agrave;nh xuất sắc (Operational Excellence) hay Lean Six Sigma kh&ocirc;ng chỉ c&oacute; thể tối ưu h&oacute;a hoạt động, quy tr&igrave;nh v&agrave; hệ thống của c&ocirc;ng ty m&agrave; c&ograve;n đ&oacute;ng g&oacute;p đ&aacute;ng kể v&agrave;o văn h&oacute;a cải tiến li&ecirc;n tục v&agrave; tạo ra gi&aacute; trị.&nbsp;</p>\r\n\r\n<p><img alt=\"\" src=\"http://proj_news.xyz/images/article/tri-tue-nhan-tao-ai-la-gi-ung-dung-nhu-the-nao-trong-cuoc-song--6.jpg\" style=\"height:354px; width:630px\" /></p>\r\n\r\n<p>B&agrave;i viết n&agrave;y t&igrave;m hiểu c&aacute;c c&acirc;u hỏi &#39;tại sao&#39;, &#39;c&aacute;i g&igrave;&#39;, &#39;như thế n&agrave;o&#39; v&agrave; &#39;điều g&igrave; sẽ xảy ra tiếp theo&#39; khi &aacute;p dụng AI trong kinh doanh, n&ecirc;u bật cả những cơ hội v&agrave; th&aacute;ch thức m&agrave; n&oacute; mang lại.</p>');

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
(1, 'Root', '', 'active', 0, '', NULL, '', NULL, '', NULL, 1, 32),
(2, 'Thể Thao', 'cm-the-thao-2', 'active', 1, 'grid', '2024-09-10 00:00:00', 'dat123', '2025-04-25 00:00:00', 'admin', 3, 13, 26),
(3, 'Giáo dục', 'cm-giao-duc-3', 'active', 1, 'list', '2024-09-10 00:00:00', 'dat123', '2025-04-25 00:00:00', 'admin', 1, 12, 27),
(4, 'Sức khỏe', 'cm-suc-khoe-4', 'active', 1, 'grid', '2024-09-10 00:00:00', 'dat123', '2025-04-25 00:00:00', 'admin', 1, 2, 11),
(5, 'Du lịch', 'cm-du-lich-5', 'active', 0, 'list', '2024-09-10 00:00:00', 'dat123', '2025-04-25 00:00:00', 'admin', 4, 3, 6),
(6, 'Khoa học', 'cm-khoa-hoc-6', 'active', 1, 'grid', '2024-09-10 00:00:00', 'dat123', '2025-04-25 00:00:00', 'admin', 4, 7, 8),
(7, 'Số hóa', 'cm-so-hoa-7', 'active', 1, 'grid', '2024-09-10 00:00:00', 'dat123', '2025-04-25 00:00:00', 'admin', 5, 4, 5),
(8, 'Xe - Ô tô', 'cm-xe-o-to-8', 'active', 1, 'list', '2024-09-10 00:00:00', 'dat123', '2025-04-25 00:00:00', 'admin', 1, 28, 29),
(9, 'Kinh doanh', 'cm-kinh-doanh-9', 'active', 0, 'grid', '2024-09-10 00:00:00', 'dat123', '2025-04-25 00:00:00', 'admin', 1, 30, 31),
(10, 'Thể thao child001', 'cm-the-thao-child001-10', 'active', 0, 'list', '2024-09-10 00:00:00', 'dat123', '2025-04-24 00:00:00', 'admin', 2, 14, 15),
(18, 'Thể thao child003', 'cm-the-thao-child003-18', 'active', NULL, NULL, '2025-04-23 00:00:00', 'admin', '2025-04-24 00:00:00', 'admin', 2, 22, 23);

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
-- Cấu trúc bảng cho bảng `category_article_translations`
--

CREATE TABLE `category_article_translations` (
  `id` int(11) NOT NULL,
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `category_article_id` int(11) DEFAULT NULL,
  `locale` varchar(11) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=DYNAMIC;

--
-- Đang đổ dữ liệu cho bảng `category_article_translations`
--

INSERT INTO `category_article_translations` (`id`, `name`, `category_article_id`, `locale`, `slug`) VALUES
(1, 'Thể Thao', 2, 'vi', 'cm-the-thao-2'),
(3, 'Giáo dục', 3, 'vi', 'cm-giao-duc-3'),
(5, 'Sức khỏe', 4, 'vi', 'cm-suc-khoe-4'),
(8, 'Tourism', 5, 'en', 'ca-tourism-5'),
(9, 'Khoa học', 6, 'vi', 'cm-khoa-hoc-6'),
(11, 'Số hóa', 7, 'vi', 'cm-so-hoa-7'),
(13, 'Xe - Ô tô', 8, 'vi', 'cm-xe-o-to-8'),
(15, 'Kinh doanh', 9, 'vi', 'cm-kinh-doanh-9'),
(17, 'Thể thao child001', 10, 'vi', 'cm-the-thao-child001-10'),
(10, 'Science', 6, 'en', 'ca-science-6'),
(2, 'Sport', 2, 'en', 'ca-sport-2'),
(4, 'Education', 3, 'en', 'ca-education-3'),
(6, 'Health', 4, 'en', 'ca-health-4'),
(12, 'Digitalization', 7, 'en', 'ca-digitalization-7'),
(14, 'car', 8, 'en ', 'ca-car-8'),
(16, 'Business', 9, 'en', 'ca-business-9'),
(18, 'Sport child001', 10, 'en', 'ca-sport-child001-10'),
(19, 'Thể thao child003', 18, 'vi', 'cm-the-thao-child003-18'),
(20, 'sport child003', 18, 'en', 'ca-sport-child003-18'),
(23, 'Du lịch', 5, 'vi', 'cm-du-lich-5');

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
(8, 'Tin tức tổng hợp', 'active', '/rss/tin-tuc-tong-hop', 14, 'category_product', 'current', NULL, NULL, '<p>main-menu</p>', NULL, NULL, '2025-04-01 00:00:00', 'admin'),
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
-- Cấu trúc bảng cho bảng `menu_translations`
--

CREATE TABLE `menu_translations` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `locale` varchar(225) DEFAULT NULL,
  `menu_id` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Đang đổ dữ liệu cho bảng `menu_translations`
--

INSERT INTO `menu_translations` (`id`, `name`, `locale`, `menu_id`) VALUES
(1, 'Home', 'en', '1'),
(2, 'Trang chủ', 'vi', '1'),
(3, 'Product', 'en', '2'),
(4, 'Sản phẩm', 'vi', '2'),
(5, 'Blog', 'en', '3'),
(6, 'Blog', 'vi', '3'),
(7, 'Brain-Training Riddles', 'en', '4'),
(8, 'câu đố trí não', 'vi', '4'),
(9, 'Test-02', 'en', '5'),
(10, 'Test-02', 'vi', '5'),
(11, 'Category', 'en', '6'),
(12, 'Category', 'vi', '6'),
(13, 'Article', 'en', '7'),
(14, 'Article', 'vi', '7'),
(15, 'news summary', 'en', '8'),
(16, 'Tin tức tổng hợp', 'vi', '8'),
(17, 'Gallery', 'en', '9'),
(18, 'Hình ảnh', 'vi', '9'),
(19, 'Contact', 'en', '10'),
(20, 'Liên hệ', 'vi', '10'),
(21, 'Directory', 'en', '20'),
(22, 'Danh mục', 'vi', '20'),
(23, 'Article-container', 'en', '21'),
(24, 'Article-container', 'vi', '21'),
(25, 'Education', 'en', '23'),
(26, 'Giáo dục', 'vi', '23'),
(27, 'Ultraviolet rays', 'en', '24'),
(28, 'Tia cực tím', 'vi', '24'),
(29, 'Zendvn', 'en', '30'),
(30, 'Zendvn', 'vi', '30'),
(31, 'Sport', 'en', '37'),
(32, 'Thể thao', 'vi', '37'),
(33, 'Health', 'en', '38'),
(34, 'Sức khỏe', 'vi', '38'),
(35, 'Science', 'en', '39'),
(36, 'Khoa học', 'vi', '39'),
(37, 'Digitalization', 'en', '40'),
(38, 'Số hóa', 'vi', '40'),
(39, 'Business', 'en', '41'),
(40, 'Kinh doanh', 'vi', '41'),
(41, 'Ultraviolet rays', 'en', '43'),
(42, 'Tia cực tím', 'vi', '43'),
(43, 'Blockchain and AI', 'en', '44'),
(44, 'Blockchain và trí tuệ nhân tạou', 'vi', '44'),
(45, 'UK university launches happiness course', 'en', '45'),
(46, 'Trường đại học Anh ra mắt khóa học hạnh phúc', 'vi', '45');

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
(29, 'OPPO Reno10 Pro', 'bv-oppo-reno10-pro-39', 11, '<p>B&ecirc;n cạnh đ&oacute;, với bộ nhớ RAM 12 GB, OPPO Reno10 Pro&nbsp;Plus c&oacute; thể đối ph&oacute; với t&aacute;c vụ đa nhiệm, cho ph&eacute;p bạn mở nhiều ứng dụng c&ugrave;ng một l&uacute;c m&agrave; kh&ocirc;ng gặp bất kỳ kh&oacute; khăn n&agrave;o về hiệu suất. Kết hợp với dung lượng bộ nhớ trong l&ecirc;n tới 256 GB v&agrave; khe cắm thẻ nhớ microSD, chiếc smartphone n&agrave;y kh&ocirc;ng chỉ đảm bảo hiệu suất mượt m&agrave;, m&agrave; c&ograve;n cung cấp kh&ocirc;ng gian lưu trữ rộng lớn để lưu trữ v&agrave; truy cập dữ liệu nhanh ch&oacute;ng, tiện lợi.</p>', 'active', NULL, '2025-02-06 00:00:00', 'admin', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2025-03-18 00:00:00');

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
(53, 28, 1, 56, 'iphone 15', 'vàng', '128 GB', 1200, 'active', 1, 1),
(73, 27, 1, 57, 'samsung s24', 'vàng', '256 GB', 2000, 'active', 4, 0),
(77, 27, 3, 57, 'samsung s24', 'xanh', '256 GB', 1500, 'active', 5, 0),
(78, 27, 3, 58, 'samsung s24', 'xanh', '512 GB', 3000, 'active', 6, 0),
(79, 29, 1, 58, 'OPPO Reno10 Pro', 'vàng', '512 GB', NULL, 'active', 7, 1),
(80, 29, 3, 58, 'OPPO Reno10 Pro', 'xanh', '512 GB', NULL, 'active', 8, 0),
(87, 29, 2, 58, 'OPPO Reno10 Pro', 'đỏ', '512 GB', 4000, 'active', 9, NULL),
(90, 28, 2, 56, 'iphone 15', 'đỏ', '128 GB', NULL, 'active', 2, 0),
(91, 28, 1, 58, 'iphone 15', 'vàng', '512 GB', NULL, 'active', 3, NULL),
(92, 29, 1, 57, 'OPPO Reno10 Pro', 'vàng', '256 GB', NULL, 'active', 10, NULL),
(93, 29, 2, 57, 'OPPO Reno10 Pro', 'đỏ', '256 GB', NULL, 'active', 11, NULL),
(94, 29, 3, 57, 'OPPO Reno10 Pro', 'xanh', '256 GB', NULL, 'active', 12, NULL);

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
(156, 28, 58, 'iphone 15', '512 GB', NULL, NULL, NULL, NULL, 'active'),
(157, 29, 57, 'OPPO Reno10 Pro', '256 GB', NULL, NULL, NULL, NULL, 'active');

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
(11, 2, 'delete-user', 'admin'),
(16, 2, 'access-user', 'admin'),
(17, 2, 'create-user', 'admin'),
(18, 2, 'edit-user', 'admin');

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
(1, 'Thế giới - vnexpress', 'active', 'https://vnexpress.net/rss/the-gioi.rss', 12, 'vnexpress', '2023-12-25 07:05:36', 'phamdat', '2025-04-29 00:00:00', 'admin'),
(3, 'Sức khỏe - vnexpress', 'inactive', 'https://vnexpress.net/rss/suc-khoe.rss', 9, 'vnexpress', '2023-12-25 07:05:36', 'phamdat', '2024-07-02 00:00:00', 'admin'),
(6, 'Số hóa - vnexpress', 'inactive', 'https://vnexpress.net/rss/so-hoa.rss', 22, 'vnexpress', '2023-12-25 00:00:00', 'admin', '2024-07-02 00:00:00', 'dat123'),
(7, 'Thể Thao - vnexpress', 'inactive', 'https://vnexpress.net/rss/the-thao.rss', 10, 'vnexpress', '2023-12-27 00:00:00', 'admin', '2024-07-02 00:00:00', 'dat123'),
(8, 'Thời sự - thanhnien', 'inactive', 'https://thanhnien.vn/rss/thoi-su.rss', 5, 'thanhnien', '2023-12-27 00:00:00', 'admin', '2024-07-02 00:00:00', 'admin'),
(9, 'Nhịp sống số - tuoitre', 'inactive', 'https://tuoitre.vn/rss/nhip-song-so.rss', 1, 'tuoitre', '2023-12-27 00:00:00', 'admin', '2025-04-29 00:00:00', 'admin');

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
(13411, 'Người Pakistan lo mất nguồn nước khi căng thẳng với Ấn Độ leo thang', 'Homla Thakhur, nông dân Pakistan, vừa phun thuốc trừ sâu lên ruộng rau gần sông Ấn, vừa lo lắng về nguy cơ Ấn Độ cắt nước ở thượng nguồn.', '2025-04-29 14:42:03', 'https://vnexpress.net/nguoi-pakistan-lo-mat-nguon-nuoc-khi-cang-thang-voi-an-do-leo-thang-4879657.html', 'https://vcdn1-vnexpress.vnecdn.net/2025/04/28/download-20-1745834880-1745835-1938-4899-1745835576.jpg?w=1200&h=0&q=100&dpr=1&fit=crop&s=ubzmPWkypbTCxv01Ifqa4w', 'VNExpress', 'active', 'vnexpress'),
(13412, 'Mỹ \'mất 7 UAV Reaper ở Yemen trong một tháng rưỡi\'', 'Quan chức Mỹ tiết lộ nước này đã mất 7 UAV MQ-9 Reaper tại Yemen kể từ giữa tháng 3, tương đương tổn thất hơn 200 triệu USD.', '2025-04-29 13:49:46', 'https://vnexpress.net/my-mat-7-uav-reaper-o-yemen-trong-mot-thang-ruoi-4880017.html', 'https://vcdn1-vnexpress.vnecdn.net/2025/04/29/MQ9Reaper-1745901780-6130-1745902010.png?w=1200&h=0&q=100&dpr=1&fit=crop&s=cvdTQn1wMwpp7yej-shIPg', 'VNExpress', 'active', 'vnexpress'),
(13413, 'Người Phần Lan giảm niềm tin vào NATO', 'Niềm tin của người Phần Lan vào đảm bảo an ninh mà NATO mang lại đã giảm mạnh, hai năm sau khi Helsinki gia nhập liên minh quân sự này.', '2025-04-29 11:48:07', 'https://vnexpress.net/nguoi-phan-lan-giam-niem-tin-vao-nato-4879990.html', 'https://vcdn1-vnexpress.vnecdn.net/2025/04/29/co-nato-1745899701-1745899716-1177-1745900319.jpg?w=1200&h=0&q=100&dpr=1&fit=crop&s=hU_N88yGgqdi5zF418rJAw', 'VNExpress', 'active', 'vnexpress'),
(13414, 'Ít nhất 70 người chết trong vụ nổ ở cảng Iran', 'Iran thông báo số người chết trong vụ nổ do \"vi phạm quy định an toàn\" ở cảng Shahid Rajaee đã tăng lên ít nhất 70.', '2025-04-29 11:37:52', 'https://vnexpress.net/it-nhat-70-nguoi-chet-trong-vu-no-o-cang-iran-4879987.html', 'https://vcdn1-vnexpress.vnecdn.net/2025/04/29/afp-20250428-aa-28042025-22016-3182-2497-1745898737.jpg?w=1200&h=0&q=100&dpr=1&fit=crop&s=2T-DW8yKQWu3QfSioRuDog', 'VNExpress', 'active', 'vnexpress'),
(13415, 'Pakistan lo nguy cơ Ấn Độ tấn công qua biên giới', 'Bộ trưởng Quốc phòng Pakistan lo ngại Ấn Độ phát động chiến dịch nhằm vào nước này, khi căng thẳng song phương leo thang.', '2025-04-29 11:28:03', 'https://vnexpress.net/pakistan-lo-nguy-co-an-do-tan-cong-qua-bien-gioi-4879975.html', 'https://vcdn1-vnexpress.vnecdn.net/2025/04/29/BTQPPakistan-1745898916-1837-1745899170.png?w=1200&h=0&q=100&dpr=1&fit=crop&s=NnJpSa1xitV081ZezMZU3A', 'VNExpress', 'active', 'vnexpress'),
(13416, 'Khách nhí làm trầy xước tranh hàng chục triệu USD', 'Bảo tàng ở Rotterdam phải gỡ bức tranh lớn của họa sĩ Mark Rothko xuống để đem đi sửa, sau khi một khách tham quan nhí làm trầy xước.', '2025-04-29 11:13:51', 'https://vnexpress.net/khach-nhi-lam-tray-xuoc-tranh-hang-chuc-trieu-usd-4879934.html', 'https://vcdn1-vnexpress.vnecdn.net/2025/04/29/download-23-1745896316-1745896-1519-9529-1745896552.jpg?w=1200&h=0&q=100&dpr=1&fit=crop&s=knWEdBU8XfeKxd73XeTRDQ', 'VNExpress', 'active', 'vnexpress'),
(13417, 'Những dấu ấn trong 100 ngày đầu tiên ông Trump nắm quyền', 'Trong 100 ngày đầu tiên nắm quyền, ông Trump tiến hành loạt hành động quyết liệt như áp thuế, tinh giản chính phủ, trục xuất người di cư bất hợp pháp, thúc đẩy đàm phán về Ukraine.', '2025-04-29 11:10:17', 'https://vnexpress.net/nhung-dau-an-trong-100-ngay-dau-tien-ong-trump-nam-quyen-4879922.html', 'https://vcdn1-vnexpress.vnecdn.net/2025/04/29/AFP-20250120-36UW2FP-v2-HighRes-TopshotUsPoliticsTrumpInauguration-1745891212.jpg?w=1200&h=0&q=100&dpr=1&fit=crop&s=jnnVcWocDtKIZ3osYS35Xg', 'VNExpress', 'active', 'vnexpress'),
(13418, 'Thủ tướng Việt Nam, Nhật Bản cùng ăn phở, uống cà phê', 'Thủ tướng Phạm Minh Chính và Thủ tướng Ishiba Shigeru cùng các phu nhân ăn sáng, uống cà phê Việt Nam và thăm Bảo tàng Lịch sử Quốc gia.', '2025-04-29 10:30:24', 'https://vnexpress.net/thu-tuong-viet-nam-nhat-ban-cung-an-pho-uong-ca-phe-4879971.html', 'https://vcdn1-vnexpress.vnecdn.net/2025/04/29/thu-tu-o-ng-a-n-sa-ng-tha-m-ba-o-ta-ng-1-1745894847-1745897337-1745897355.jpg?w=1200&h=0&q=100&dpr=1&fit=crop&s=nfsiJrBIrapGCugwvOxsCw', 'VNExpress', 'active', 'vnexpress'),
(13419, 'Canada bầu cử giữa lời đe dọa sáp nhập của ông Trump', 'Hàng triệu người Canada đi bầu cử để chọn lãnh đạo mới, giữa lúc ông Trump đăng thông điệp kêu gọi nước này trở thành \"bang thứ 51\" của Mỹ.', '2025-04-29 10:14:01', 'https://vnexpress.net/canada-bau-cu-giua-loi-de-doa-sap-nhap-cua-ong-trump-4879939.html', 'https://vcdn1-vnexpress.vnecdn.net/2025/04/29/carney-jpeg-1745893136-1745893-8634-1849-1745893328.jpg?w=1200&h=0&q=100&dpr=1&fit=crop&s=tOU-BigB42eg3AstoFNkqA', 'VNExpress', 'active', 'vnexpress'),
(13420, 'Mexico đồng ý chuyển nước cho Mỹ sau khi ông Trump dọa áp thuế', 'Mexico đồng ý lập tức chuyển hàng tỷ mét khối nước qua hệ thống đập và hồ chứa cho Mỹ tới sông biên giới, sau khi ông Trump dọa áp thuế.', '2025-04-29 09:51:31', 'https://vnexpress.net/mexico-dong-y-chuyen-nuoc-cho-my-sau-khi-ong-trump-doa-ap-thue-4879888.html', 'https://vcdn1-vnexpress.vnecdn.net/2025/04/29/2025-04-11t001210z-1681980293-6061-5196-1745889339.jpg?w=1200&h=0&q=100&dpr=1&fit=crop&s=NyJDKuV19nq-hIrF7ob3vw', 'VNExpress', 'active', 'vnexpress'),
(13421, 'Tiêm kích Ukraine rơi khi đối phó UAV Nga', 'Không quân Ukraine thông báo tiêm kích Su-27 rơi khi đối phó UAV đối phương, trong khi truyền thông Nga nói phi cơ bị F-16 đồng đội bắn rơi.', '2025-04-29 09:29:41', 'https://vnexpress.net/tiem-kich-ukraine-roi-khi-doi-pho-uav-nga-4879908.html', 'https://vcdn1-vnexpress.vnecdn.net/2025/04/29/Su27ukraine1-1745892855-5200-1745893581.jpg?w=1200&h=0&q=100&dpr=1&fit=crop&s=9okm2aw5T_uCh4EtaHI-mA', 'VNExpress', 'active', 'vnexpress'),
(13422, 'Lao xe vào trại hè Mỹ, 4 trẻ em thiệt mạng', 'Ôtô lao vào trại hè ở bang Illinois khiến ít nhất 4 trẻ thiệt mạng, chưa rõ là tai nạn hay hành động cố ý.', '2025-04-29 08:44:05', 'https://vnexpress.net/lao-xe-vao-trai-he-my-4-tre-em-thiet-mang-4879890.html', 'https://vcdn1-vnexpress.vnecdn.net/2025/04/29/2025-04-29t004251z-604587934-m-5306-2079-1745888805.jpg?w=1200&h=0&q=100&dpr=1&fit=crop&s=riE06PNKVWz1kq4Uhmey_Q', 'VNExpress', 'active', 'vnexpress'),
(13423, 'Nghị sĩ Mỹ trình loạt điều khoản để luận tội ông Trump', 'Nghị sĩ Dân chủ Thanedar trình 7 điều khoản luận tội ông Trump lên Hạ viện, cáo buộc Tổng thống đã phớt lờ hiến pháp, quốc hội và tòa án.', '2025-04-29 08:29:45', 'https://vnexpress.net/nghi-si-my-trinh-loat-dieu-khoan-de-luan-toi-ong-trump-4879881.html', 'https://vcdn1-vnexpress.vnecdn.net/2025/04/29/ap25118546767931-1745886405-6025-1745886715.jpg?w=1200&h=0&q=100&dpr=1&fit=crop&s=pj30sYnvAvxfjgcClMTimA', 'VNExpress', 'active', 'vnexpress'),
(13424, 'Chính quyền Trump nghi tạp chí Harvard phân biệt đối xử dựa trên chủng tộc', 'Chính quyền Trump thông báo điều tra Đại học Harvard và tạp chí luật Harvard Law Review với cáo buộc có các chính sách mang tính phân biệt đối xử dựa trên chủng tộc.', '2025-04-29 08:00:49', 'https://vnexpress.net/chinh-quyen-trump-nghi-tap-chi-harvard-phan-biet-doi-xu-dua-tren-chung-toc-4879882.html', 'https://vcdn1-vnexpress.vnecdn.net/2025/04/29/2024-8-21-1l-move-in-trinaldo-1904-3249-1745888449.jpg?w=1200&h=0&q=100&dpr=1&fit=crop&s=aRXqTpD4esoN1VkL1gm5Cw', 'VNExpress', 'active', 'vnexpress'),
(13425, 'Ông Zelensky ám chỉ Ukraine đứng sau vụ quan chức quân sự Nga bị hạ sát', 'Tổng thống Zelensky cho biết đã được tình báo Ukraine báo cáo về việc quan chức quân sự hàng đầu Nga bị hạ sát, ca ngợi rằng \"công lý được thực thi\".', '2025-04-29 07:24:42', 'https://vnexpress.net/ong-zelensky-am-chi-ukraine-dung-sau-vu-quan-chuc-quan-su-nga-bi-ha-sat-4879877.html', 'https://vcdn1-vnexpress.vnecdn.net/2025/04/29/AP25107566235579-1745882915-4132-1745883130.jpg?w=1200&h=0&q=100&dpr=1&fit=crop&s=ZITYgv8Z6_4ACVie7XBf7A', 'VNExpress', 'active', 'vnexpress'),
(13426, 'Tàu sân bay Mỹ \'ngoặt gấp\', khiến tiêm kích rơi xuống biển', 'Một tiêm kích F/A-18E rơi từ tàu sân bay USS Harry S. Truman xuống Biển Đỏ, nghi do chiến hạm Mỹ phải ngoặt gấp để tránh hỏa lực Houthi.', '2025-04-29 06:53:05', 'https://vnexpress.net/tau-san-bay-my-ngoat-gap-khien-tiem-kich-roi-xuong-bien-4879874.html', 'https://vcdn1-vnexpress.vnecdn.net/2025/04/29/c-8998056-1745882717-174588274-6602-1756-1745883356.jpg?w=1200&h=0&q=100&dpr=1&fit=crop&s=TggX7p7Cv9xv48WVnSTM3Q', 'VNExpress', 'active', 'vnexpress'),
(13427, 'Hậu trường cuộc gặp Trump - Zelensky tại Vatican', '57 ngày sau cuộc đấu khẩu nảy lửa tại Nhà Trắng, ông Trump và ông Zelensky bất ngờ có cơ hội gặp mặt khi cùng tới Vatican dự lễ tang Giáo hoàng Francis.', '2025-04-29 05:00:00', 'https://vnexpress.net/hau-truong-cuoc-gap-trump-zelensky-tai-vatican-4879421.html', 'https://vcdn1-vnexpress.vnecdn.net/2025/04/28/ap25116388537554-1745828536-5812-1745829491.jpg?w=1200&h=0&q=100&dpr=1&fit=crop&s=5Lyjw_1pfvYH6qN6b2Kxxw', 'VNExpress', 'active', 'vnexpress'),
(13428, 'Mỏ vàng tình báo từ bom \'Xuyên bão\' của Mỹ rơi tại Yemen', 'Quả bom GBU-53/B rơi xuống Yemen trong trạng thái nguyên vẹn có thể hé lộ nhiều công nghệ, giúp đối thủ của Mỹ tìm cách đối phó hoặc sao chép.', '2025-04-29 01:00:00', 'https://vnexpress.net/mo-vang-tinh-bao-tu-bom-xuyen-bao-cua-my-roi-tai-yemen-4879539.html', 'https://vcdn1-vnexpress.vnecdn.net/2025/04/28/GBU-1745824109-9976-1745824751.png?w=1200&h=0&q=100&dpr=1&fit=crop&s=DQ4jB6_HtyqtuoPbjSo3Pw', 'VNExpress', 'active', 'vnexpress'),
(13429, 'Dấu hiệu lỏng lẻo trong bộ máy của chính quyền ông Trump', 'Chính quyền Tổng thống Trump chuẩn bị kỷ niệm mốc 100 ngày đầu nhiệm kỳ, nhưng bộ máy hoàn hảo mà ông ca ngợi đang xuất hiện nhiều vấn đề.', '2025-04-29 00:00:00', 'https://vnexpress.net/dau-hieu-long-leo-trong-bo-may-cua-chinh-quyen-ong-trump-4878395.html', 'https://vcdn1-vnexpress.vnecdn.net/2025/04/25/afp-20250226-36yp3df-v1-highre-9095-8458-1745574076.jpg?w=1200&h=0&q=100&dpr=1&fit=crop&s=7FY-C7KkatvscpxrkRJbkw', 'VNExpress', 'active', 'vnexpress');

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
  `id` int(11) UNSIGNED NOT NULL,
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
(1, 'Khóa học lập trình Frontend Master', 'Khóa học sẽ giúp bạn trở thành một chuyên gia Frontend với đầy đủ các kiến thức về HTML, CSS, JavaScript, Bootstrap, jQuery, chuyển PSD thành HTML ...', 'https://zendvn.com/khoa-hoc-lap-trinh-frontend-master/', 'rEpDUQCxe4.jpeg', '2024-04-01 00:00:00', 'hailan', '2025-04-26 00:00:00', 'admin', 'active'),
(2, 'Học lập trình trực tuyến', 'Học trực tuyến giúp bạn tiết kiệm chi phí, thời gian, cập nhật được nhiều kiến thức mới nhanh nhất và hiệu quả nhất', 'https://zendvn.com/', 'K6B1O6UNCb.jpeg', '2019-04-18 00:00:00', 'hailan', '2025-04-26 00:00:00', 'admin', 'inactive'),
(3, 'Ưu đãi học phí', 'Tổng hợp các trương trình ưu đãi học phí hàng tuần, hàng tháng đến tất các các bạn với các mức giảm đặc biệt 50%, 70%,..', 'https://zendvn.com/uu-dai-hoc-phi-tai-zendvn/', 'LWi6hINpXz.jpeg', '2019-04-24 00:00:00', 'hailan', '2025-04-26 00:00:00', 'admin', 'active'),
(4, 'Lập trình PHP', 'Khóa học được xây dựng dựa trên kinh nghiệm làm dự án thực tế của ZendVN, ngoài ra khóa học còn sử dụng các tài liệu từ trang Google, stackoverflow.com và các trang web khác.', 'https://zendvn.com/khoa-hoc-lap-trinh-php-chuyen-sau', 'UIFAVEbuoa.jpeg', '2019-04-24 00:00:00', 'hailan', '2025-04-26 00:00:00', 'admin', 'active'),
(5, 'Lập trình Laravel', 'Đây là khóa học nâng cao, ZendVN chỉ nhận các bạn học viên đã học xong khóa học Lập trình PHP Offline tại ZendVN; hoặc các bạn đã có làm các project về PHP, MVC, OOP, jQuery AjaxKhóa học Lập trình Laravel sẽ hướng dẫn học viên sử dụng Laravel để xây dựng nhiều loại website khác nhau trong thực tế: doanh nghiệp, tin tức, bán hàng, đa ngôn ngữ.', 'https://zendvn.com/lap-trinh-laravel-offline-off', 'DZeaWRlkPA.png', '2019-04-24 00:00:00', 'hailan', '2025-04-26 00:00:00', 'admin', 'active'),
(6, 'Nền tảng & Tư duy lập trình', 'Khóa học Nền tảng & Tư duy lập trình giúp bạn trang bị nền tảng lập trình vững chắc để có thể theo được nghề lập trình và duy trì đam mê với nghề. Các kỹ năng phân tích giải quyết vấn đề, tìm kiếm Google, xử lý lỗi cũng sẽ được hướng dẫn trong khóa học.', 'https://zendvn.com/nen-tang-va-tu-duy-lap-trinh-off', 'ofcAvQCCIQ.png', '2024-07-01 00:00:00', 'hailan', '2025-04-26 00:00:00', 'admin', 'active'),
(13, 'Racoon là loài động vật dễ thương cute for my que', 'Gấu mèo (danh pháp hai phần: Procyon lotor) hay raccoon là một loài động vật có vú bản địa Bắc Mỹ. Đây là loài lớn nhất trong họ Gấu mèo (Procyonidae).', 'https://vi.wikipedia.org/wiki/G%E1%BA%A5u_m%C3%A8o', 'vUPIxiOyxW.jpg', '2025-04-26 00:00:00', 'admin', '2025-04-26 00:00:00', 'admin', 'active');

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
-- Cấu trúc bảng cho bảng `slider_translations`
--

CREATE TABLE `slider_translations` (
  `id` int(20) UNSIGNED NOT NULL,
  `slider_id` int(11) UNSIGNED NOT NULL,
  `locale` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `slider_translations`
--

INSERT INTO `slider_translations` (`id`, `slider_id`, `locale`, `name`, `description`) VALUES
(1, 13, 'vi', 'Racoon là loài động vật dễ thương cute for my que', 'Gấu mèo (danh pháp hai phần: Procyon lotor) hay raccoon là một loài động vật có vú bản địa Bắc Mỹ. Đây là loài lớn nhất trong họ Gấu mèo (Procyonidae).'),
(2, 13, 'en', 'Racoon is cute for my que', 'The raccoon (Procyon lotor) is a mammal native to North America. It is the largest species in the family Procyonidae.'),
(3, 6, 'vi', 'Nền tảng & Tư duy lập trình', 'Khóa học Nền tảng & Tư duy lập trình giúp bạn trang bị nền tảng lập trình vững chắc để có thể theo được nghề lập trình và duy trì đam mê với nghề. Các kỹ năng phân tích giải quyết vấn đề, tìm kiếm Google, xử lý lỗi cũng sẽ được hướng dẫn trong khóa học.'),
(4, 6, 'en', 'Programming Foundations and Mindset', 'The Programming Foundation & Thinking course helps you equip yourself with a solid programming foundation so you can pursue a programming career and maintain your passion for the profession. Problem-solving analysis skills, Google searches, and error handling will also be taught in the course.'),
(5, 5, 'vi', 'Lập trình Laravel', 'Đây là khóa học nâng cao, ZendVN chỉ nhận các bạn học viên đã học xong khóa học Lập trình PHP Offline tại ZendVN; hoặc các bạn đã có làm các project về PHP, MVC, OOP, jQuery AjaxKhóa học Lập trình Laravel sẽ hướng dẫn học viên sử dụng Laravel để xây dựng nhiều loại website khác nhau trong thực tế: doanh nghiệp, tin tức, bán hàng, đa ngôn ngữ.'),
(6, 5, 'en', 'Laravel Programming', 'This is an advanced course, ZendVN only accepts students who have completed the Offline PHP Programming course at ZendVN; or students who have done projects on PHP, MVC, OOP, jQuery Ajax. The Laravel Programming course will guide students to use Laravel to build many different types of websites in reality: business, news, sales, multilingual.'),
(7, 4, 'vi', 'Lập trình PHP', 'Khóa học được xây dựng dựa trên kinh nghiệm làm dự án thực tế của ZendVN, ngoài ra khóa học còn sử dụng các tài liệu từ trang Google, stackoverflow.com và các trang web khác.'),
(8, 4, 'en', 'PHP Programming', 'The course is built on ZendVN\'s real project experience, and also uses materials from Google, stackoverflow.com and other websites.'),
(9, 3, 'vi', 'Ưu đãi học phí', 'Tổng hợp các trương trình ưu đãi học phí hàng tuần, hàng tháng đến tất các các bạn với các mức giảm đặc biệt 50%, 70%,..'),
(10, 3, 'en', 'Tuition discount', 'Summary of weekly and monthly tuition discount programs for all of you with special discounts of 50%, 70%,..'),
(11, 2, 'vi', 'Học lập trình trực tuyến', 'Học trực tuyến giúp bạn tiết kiệm chi phí, thời gian, cập nhật được nhiều kiến thức mới nhanh nhất và hiệu quả nhất'),
(12, 2, 'en', 'Learn programming online', 'Online learning helps you save money, time, and update new knowledge quickly and effectively.'),
(13, 1, 'vi', 'Khóa học lập trình Frontend Master', 'Khóa học sẽ giúp bạn trở thành một chuyên gia Frontend với đầy đủ các kiến thức về HTML, CSS, JavaScript, Bootstrap, jQuery, chuyển PSD thành HTML ...'),
(14, 1, 'en', 'Frontend Master Programming Course', 'The course will help you become a Frontend expert with full knowledge of HTML, CSS, JavaScript, Bootstrap, jQuery, converting PSD to HTML ...');

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
('article', 23, '<i class=\"fa fa-newspaper-o\"></i>'),
('category_article', 20, '<i class=\"fa fa-tasks\"></i>'),
('slider', 7, '<i class=\"fa fa-sliders\"></i>'),
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
(1, 'admin', 'admin@gmail.com', 'admin123456', 'e10adc3949ba59abbe56e057f20f883e', 'ZnrJ4VWN7s.png', '2024-07-01 00:00:00', 'admin', '2025-02-23 00:00:00', 'admin', 'active', '2,2,4,4,4,7,7,7,2,2,2,7,7,7,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4', 1),
(2, 'hailan', 'hailan@gmail.com', 'hailan', 'e10adc3949ba59abbe56e057f20f883e', '1eSGmvZ3gM.jpeg', '2014-12-13 07:20:03', 'admin', '2025-02-23 00:00:00', 'admin', 'active', NULL, 1),
(3, 'user123', 'phamdat9966@gmail.com', 'user123', 'e10adc3949ba59abbe56e057f20f883e', 'Hb1QSn1CL8.png', '2019-05-04 00:00:00', 'admin', '2025-03-19 00:00:00', 'admin', 'active', NULL, 2),
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
(43, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', '2025-02-25 07:28:42', 35),
(44, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-23 10:15:52', 6),
(45, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-23 10:15:53', 6),
(46, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-23 10:15:53', 6),
(47, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-23 10:21:14', NULL),
(48, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-23 10:21:46', NULL),
(49, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-23 10:26:51', NULL),
(50, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-23 10:29:02', NULL),
(51, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-23 10:30:46', NULL),
(52, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-23 10:32:36', 6),
(53, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-23 10:35:16', 6),
(54, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-23 10:38:35', 6),
(55, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-23 10:57:14', NULL),
(56, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-23 10:57:28', 6),
(57, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-23 10:57:30', 6),
(58, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-23 10:57:30', 6),
(59, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-23 10:57:43', 6),
(60, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-23 10:57:44', 6),
(61, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-23 10:57:44', 6),
(62, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-23 10:57:56', 6),
(63, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-23 10:58:22', 6),
(64, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-23 11:00:15', 6),
(65, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-23 11:01:39', 6),
(66, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-23 11:04:27', 6),
(67, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-23 11:05:19', 6),
(68, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-23 11:08:54', 6),
(69, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-23 11:14:10', 6),
(70, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-23 11:14:50', 6),
(71, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-23 11:14:58', 6),
(72, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-23 11:16:59', 6),
(73, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-23 11:17:58', 6),
(74, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-23 11:18:12', 6),
(75, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-23 11:30:14', 6),
(76, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-23 11:33:02', 6),
(77, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-23 11:39:17', 6),
(78, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-23 11:43:08', 6),
(79, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-23 11:43:11', 6),
(80, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-23 11:46:02', 6),
(81, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-23 11:46:07', NULL),
(82, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-23 11:46:47', NULL),
(83, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-23 11:50:46', 6),
(84, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-23 11:50:49', 6),
(85, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-23 11:51:13', 6),
(86, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-23 11:51:15', 6),
(87, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-23 11:56:12', 6),
(88, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-23 11:56:18', 6),
(89, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-23 11:56:21', 6),
(90, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-23 11:56:58', NULL),
(91, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-23 11:57:15', 6),
(92, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-23 11:59:59', NULL),
(93, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-23 12:00:40', NULL),
(94, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-23 12:01:53', NULL),
(95, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-23 12:02:03', NULL),
(96, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-23 12:02:05', NULL),
(97, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-23 12:06:36', NULL),
(98, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-23 12:06:49', NULL),
(99, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-23 12:06:50', NULL),
(100, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-23 12:12:16', NULL),
(101, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-23 12:13:03', 6),
(102, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-23 12:13:36', NULL),
(103, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-23 12:13:45', NULL),
(104, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-23 12:13:55', NULL),
(105, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-23 12:14:48', NULL),
(106, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-23 12:14:51', NULL),
(107, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-25 10:40:59', 6),
(108, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-25 10:43:06', NULL),
(109, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-25 10:43:26', NULL),
(110, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-25 10:44:35', 6),
(111, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-25 10:46:29', 6),
(112, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-25 10:46:59', 6),
(113, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-25 10:51:49', 6),
(114, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-25 10:54:44', NULL),
(115, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-25 10:55:31', NULL),
(116, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-25 10:55:49', 6),
(117, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-25 10:55:59', 6),
(118, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-25 10:56:55', 6),
(119, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-25 10:57:19', 6),
(120, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-25 10:59:22', 6),
(121, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-25 11:00:20', 6),
(122, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-25 11:01:05', 6),
(123, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-25 11:01:30', NULL),
(124, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-25 11:03:57', 6),
(125, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-25 11:04:43', 6),
(126, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-25 11:05:28', 6),
(127, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-25 11:06:04', 6),
(128, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-25 11:06:18', 6),
(129, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-25 11:06:54', 6),
(130, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-25 11:07:48', 6),
(131, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-25 11:10:12', NULL),
(132, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-25 11:10:42', 6),
(133, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-25 11:11:52', 6),
(134, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-25 11:13:03', 6),
(135, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-25 11:13:34', 6),
(136, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-25 11:14:02', 6),
(137, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-25 11:14:07', 6),
(138, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-25 11:17:18', 6),
(139, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-25 11:19:36', 6),
(140, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-25 11:25:32', 6),
(141, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-25 11:25:34', 6),
(142, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-25 11:25:34', 6),
(143, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-25 11:25:45', 6),
(144, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-25 11:25:46', 6),
(145, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-25 11:25:47', 6),
(146, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-25 11:26:59', 6),
(147, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-25 11:30:04', 6),
(148, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-25 11:36:50', 6),
(149, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-25 11:37:11', 6),
(150, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-25 11:37:12', 6),
(151, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-25 11:37:13', 6),
(152, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-25 11:37:36', 6),
(153, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-25 11:38:14', 6),
(154, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-25 11:38:15', 6),
(155, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-25 11:38:15', 6),
(156, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-25 11:38:33', 6),
(157, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-25 11:38:34', 6),
(158, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-25 11:38:34', 6),
(159, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-25 11:39:52', 6),
(160, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-25 11:41:26', 6),
(161, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-25 11:41:34', 6),
(162, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-25 11:41:35', 6),
(163, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-25 11:41:36', 6),
(164, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-25 11:43:11', 6),
(165, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-25 11:44:39', 6),
(166, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-25 11:44:45', 6),
(167, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-25 11:44:46', 6),
(168, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-25 11:44:47', 6),
(169, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-25 14:38:38', 6),
(170, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-25 14:38:40', 6),
(171, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-25 14:38:40', 6),
(172, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-25 14:44:13', 6),
(173, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-25 14:47:22', NULL),
(174, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-25 14:49:10', NULL),
(175, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-25 14:50:12', NULL),
(176, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-25 14:51:04', NULL),
(177, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-25 14:52:52', 6),
(178, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-25 14:53:17', 6),
(179, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-25 15:01:05', 6),
(180, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-25 15:01:12', 6),
(181, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-25 15:06:29', NULL),
(182, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-25 15:08:37', NULL),
(183, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-25 15:09:58', NULL),
(184, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-25 15:10:11', NULL),
(185, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-25 15:10:23', NULL),
(186, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-25 15:11:08', NULL),
(187, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-25 15:11:58', NULL),
(188, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-25 15:12:00', NULL),
(189, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-25 15:15:50', NULL),
(190, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-25 15:15:57', NULL),
(191, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-25 15:22:47', NULL),
(192, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-25 19:03:07', NULL),
(193, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-25 19:05:06', NULL),
(194, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-25 19:05:49', NULL),
(195, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-25 19:05:56', NULL),
(196, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-25 19:06:42', NULL),
(197, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-25 19:08:31', NULL),
(198, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-25 19:08:50', NULL),
(199, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-25 19:09:26', NULL),
(200, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-25 19:09:28', NULL),
(201, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-25 19:10:38', NULL),
(202, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-25 19:11:43', NULL),
(203, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-25 19:11:46', NULL),
(204, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-25 19:12:22', NULL),
(205, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-25 19:12:22', NULL),
(206, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-25 19:12:57', 6),
(207, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-25 19:13:12', 6),
(208, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-25 19:13:15', 6),
(209, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-25 19:18:06', 6),
(210, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-25 19:18:07', 6),
(211, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-25 19:18:08', 6),
(212, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-25 19:18:34', 6),
(213, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-25 19:18:44', 6),
(214, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-25 19:18:45', 6),
(215, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-25 19:18:45', 6),
(216, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-25 19:21:58', 6),
(217, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-25 19:22:11', 6),
(218, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-25 19:22:12', 6),
(219, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-25 19:22:13', 6),
(220, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-25 19:23:09', 6),
(221, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-25 19:23:10', 6),
(222, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-25 19:23:11', 6),
(223, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-25 19:56:50', 6),
(224, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-25 19:57:03', 6),
(225, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-25 19:57:06', 6),
(226, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-25 19:57:35', 6),
(227, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-25 19:57:37', 6),
(228, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-25 19:57:49', 6),
(229, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-25 19:58:16', 6),
(230, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-25 19:58:38', 6),
(231, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-25 19:59:42', 6),
(232, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-25 19:59:43', 6),
(233, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-25 19:59:44', 6),
(234, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-25 20:00:15', 6),
(235, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-25 20:00:51', 6),
(236, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-25 20:01:30', NULL),
(237, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-25 20:02:01', NULL),
(238, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-25 20:02:43', NULL),
(239, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-25 20:02:59', NULL),
(240, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-25 20:03:36', NULL),
(241, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-25 20:04:34', NULL),
(242, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-25 20:04:42', NULL),
(243, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-25 20:04:44', NULL),
(244, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-25 20:06:00', NULL),
(245, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-25 20:06:03', NULL),
(246, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-25 20:06:56', NULL),
(247, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-25 20:08:22', NULL),
(248, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-25 20:08:34', 6),
(249, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-25 20:09:13', 6),
(250, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-25 20:09:44', 6),
(251, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-25 20:09:46', 6),
(252, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-25 20:09:46', 6),
(253, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-25 20:11:29', 6),
(254, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-25 20:11:30', 6),
(255, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-25 20:11:31', 6),
(256, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-25 20:11:39', 6),
(257, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-25 20:11:40', 6),
(258, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-25 20:11:40', 6),
(259, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-25 20:12:58', 6),
(260, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-25 20:13:15', 6),
(261, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-25 20:13:19', 6),
(262, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-25 20:13:47', 6),
(263, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-25 20:13:48', 6),
(264, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-25 20:13:49', 6),
(265, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-25 20:14:50', 6),
(266, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-25 20:14:51', 6),
(267, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-25 20:14:52', 6),
(268, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-26 11:13:15', 6),
(269, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-26 11:13:18', 6),
(270, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-26 11:13:19', 6),
(271, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-26 11:13:34', 6),
(272, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-26 11:13:35', 6),
(273, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-26 11:13:36', 6),
(274, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-26 11:13:45', 6),
(275, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-26 11:13:46', 6),
(276, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-26 11:13:46', 6),
(277, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-26 11:14:24', 6),
(278, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-26 11:14:24', 6),
(279, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-26 11:14:25', 6),
(280, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-26 11:14:26', 6),
(281, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-26 11:36:16', 6),
(282, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-26 11:36:17', 6),
(283, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-26 11:36:17', 6),
(284, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-26 11:42:59', 6),
(285, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-26 11:43:00', 6),
(286, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-26 11:43:00', 6),
(287, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-26 11:43:30', 6),
(288, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-26 11:43:31', 6),
(289, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-26 11:43:31', 6),
(290, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-26 11:45:26', 6),
(291, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-26 11:45:27', 6),
(292, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-26 11:45:28', 6),
(293, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-26 11:45:28', 6),
(294, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-26 11:45:48', 6),
(295, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-26 11:45:49', 6),
(296, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-26 11:45:49', 6),
(297, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-26 11:46:54', 6),
(298, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-26 11:46:55', 6),
(299, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-26 11:46:55', 6),
(300, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-26 11:47:01', 6),
(301, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-26 11:47:02', 6),
(302, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-26 11:47:02', 6),
(303, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-26 12:37:07', 6),
(304, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-26 12:37:10', 6),
(305, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-26 12:37:11', 6),
(306, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-26 12:37:17', 6),
(307, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-26 12:37:17', 6),
(308, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-26 12:37:18', 6),
(309, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-26 12:37:18', 6),
(310, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-26 12:38:11', 6),
(311, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-26 12:38:12', 6),
(312, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-26 12:38:12', 6),
(313, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-26 12:41:41', 6),
(314, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-26 12:41:42', 6),
(315, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-26 12:41:43', 6),
(316, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-26 12:45:38', NULL),
(317, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-26 12:47:18', NULL),
(318, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-26 12:47:35', NULL),
(319, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-26 12:48:00', NULL),
(320, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-26 12:48:52', NULL),
(321, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-26 12:49:15', NULL),
(322, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-26 12:49:44', NULL),
(323, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-26 12:49:53', NULL),
(324, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-26 12:50:18', NULL),
(325, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-26 12:50:32', NULL),
(326, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-26 12:51:41', 6),
(327, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-26 12:52:11', 6),
(328, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-26 12:52:29', 6),
(329, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-26 12:52:42', 6),
(330, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-26 12:52:43', 6),
(331, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-26 12:52:43', 6),
(332, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-26 12:53:48', 6),
(333, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-26 12:53:49', 6),
(334, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-26 12:53:50', 6),
(335, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-26 12:53:50', 6),
(336, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-26 13:02:11', 6),
(337, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-26 13:02:12', 6),
(338, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-26 13:02:12', 6),
(339, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-26 13:02:20', 6),
(340, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-26 13:02:21', 6);
INSERT INTO `user_agents` (`id`, `agent`, `timestamps`, `article_id`) VALUES
(341, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-26 13:02:22', 6),
(342, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-26 13:02:22', 6),
(343, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-26 13:04:32', 6),
(344, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-26 13:04:32', 6),
(345, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-26 13:04:33', 6),
(346, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-26 13:05:04', 6),
(347, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-26 13:05:05', 6),
(348, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-26 13:05:05', 6),
(349, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-26 13:05:06', 6),
(350, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-26 13:05:52', 6),
(351, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-26 13:05:53', 6),
(352, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-26 13:05:53', 6),
(353, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-26 13:12:39', 6),
(354, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-26 13:12:39', 6),
(355, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-26 13:12:40', 6),
(356, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-26 13:12:41', 6),
(357, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-26 13:30:26', 6),
(358, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-26 13:30:27', 6),
(359, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-26 13:30:28', 6),
(360, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-26 13:30:28', 6),
(361, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-26 13:31:56', 6),
(362, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-26 13:31:58', 6),
(363, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-26 13:31:58', 6),
(364, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-26 13:32:05', 6),
(365, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-26 13:32:06', 6),
(366, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-26 13:32:07', 6),
(367, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-26 13:32:49', 6),
(368, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-26 13:32:50', 6),
(369, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-26 13:32:51', 6),
(370, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-26 13:33:56', 6),
(371, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-26 13:36:40', 6),
(372, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-26 13:36:41', 6),
(373, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-26 13:36:42', 6),
(374, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-26 13:53:27', 6),
(375, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-26 13:53:28', 6),
(376, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-26 13:53:29', 6),
(377, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-26 14:03:05', 6),
(378, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-26 14:03:06', 6),
(379, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-26 14:03:06', 6),
(380, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-26 14:03:11', 4),
(381, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-26 14:03:12', 4),
(382, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-26 14:03:13', 4),
(383, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-26 14:09:20', 4),
(384, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-26 14:09:21', 4),
(385, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-26 14:09:22', 4),
(386, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-26 14:12:28', 4),
(387, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-26 14:12:29', 4),
(388, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-26 14:12:30', 4),
(389, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-26 14:15:13', 4),
(390, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-26 14:15:14', 4),
(391, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-26 14:15:15', 4),
(392, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-26 14:28:35', 6),
(393, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-26 14:28:37', 6),
(394, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-26 14:28:37', 6),
(395, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-26 14:28:49', 4),
(396, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-26 14:28:50', 4),
(397, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-26 14:28:51', 4),
(398, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-26 14:29:43', 4),
(399, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-26 14:29:44', 4),
(400, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-26 14:29:44', 4),
(401, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-26 14:30:04', 4),
(402, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-26 14:30:05', 4),
(403, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-26 14:30:06', 4),
(404, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-26 14:30:17', 6),
(405, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-26 14:30:18', 6),
(406, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-26 14:30:19', 6),
(407, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-26 14:30:19', 6),
(408, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-26 14:30:36', 6),
(409, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-26 14:30:36', 6),
(410, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-26 14:30:37', 6),
(411, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-26 14:50:14', 6),
(412, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-26 14:50:15', 6),
(413, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-26 14:51:10', 18),
(414, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-26 14:51:11', 18),
(415, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-26 14:51:11', 18),
(416, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-26 14:51:20', 18),
(417, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-27 11:44:56', 6),
(418, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-28 03:21:32', 6),
(419, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-28 03:21:37', 6),
(420, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-28 03:22:05', 6),
(421, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-28 03:36:00', 6),
(422, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-28 03:36:00', 6),
(423, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-28 03:36:01', 6),
(424, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-28 03:36:02', 6),
(425, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-28 03:36:22', 6),
(426, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-28 03:36:23', 6),
(427, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-28 03:36:23', 6),
(428, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-28 04:17:00', NULL),
(429, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-28 04:30:23', NULL),
(430, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-28 13:11:04', NULL),
(431, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-28 13:11:05', NULL),
(432, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-29 03:40:22', 6),
(433, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-29 12:27:04', 16),
(434, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-29 12:32:20', 16),
(435, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-29 12:36:58', NULL),
(436, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-29 12:47:29', 16),
(437, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-29 12:47:30', 16),
(438, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-29 12:47:31', 16),
(439, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-29 12:58:10', 6),
(440, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-29 13:54:42', 21),
(441, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-29 13:54:43', 21),
(442, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-29 13:54:43', 21),
(443, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-29 13:57:55', 16),
(444, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-29 13:59:55', 16),
(445, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-29 14:01:22', 16),
(446, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-29 14:04:49', 16),
(447, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-29 14:09:10', 16),
(448, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-29 14:09:37', 16),
(449, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-29 14:11:25', 16),
(450, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-29 14:12:43', NULL),
(451, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-30 08:51:08', 16),
(452, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-30 09:23:08', 34),
(453, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-30 09:23:09', 34),
(454, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-30 09:23:09', 34),
(455, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-30 09:25:35', 34),
(456, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-30 09:25:36', 34),
(457, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-30 09:25:36', 34),
(458, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-30 10:42:30', 6),
(459, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-30 10:42:32', 6),
(460, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-30 10:42:32', 6),
(461, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-30 10:50:36', NULL),
(462, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-30 10:56:47', NULL),
(463, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-30 10:58:30', NULL),
(464, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-30 10:58:48', NULL),
(465, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-30 11:02:40', NULL),
(466, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-30 11:03:09', NULL),
(467, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-30 11:03:11', NULL),
(468, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-30 11:04:36', NULL),
(469, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-30 11:04:58', NULL),
(470, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-30 11:06:01', NULL),
(471, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-30 11:06:34', NULL),
(472, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-30 11:06:47', NULL),
(473, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-30 11:07:17', NULL),
(474, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-30 11:18:20', NULL),
(475, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-30 11:22:59', NULL),
(476, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-30 11:23:37', NULL),
(477, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-30 11:23:58', NULL),
(478, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-30 11:24:06', NULL),
(479, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-30 11:24:40', NULL),
(480, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-30 11:25:31', NULL),
(481, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-30 11:25:42', NULL),
(482, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-30 11:25:44', NULL),
(483, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-30 11:26:16', NULL),
(484, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-30 11:26:27', NULL),
(485, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-30 11:26:32', NULL),
(486, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-30 11:26:37', NULL),
(487, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-30 11:26:49', NULL),
(488, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-30 11:26:52', NULL),
(489, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-30 11:39:52', NULL),
(490, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-30 11:42:03', NULL),
(491, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-30 11:42:45', NULL),
(492, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-30 11:43:12', NULL),
(493, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-30 11:43:26', NULL),
(494, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-30 11:43:52', NULL),
(495, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-30 11:47:55', NULL),
(496, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-30 11:48:06', NULL),
(497, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-30 11:48:30', NULL),
(498, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-30 11:48:43', NULL),
(499, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-30 11:49:54', NULL),
(500, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-30 11:50:01', NULL),
(501, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-30 11:50:36', NULL),
(502, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-30 11:55:35', NULL),
(503, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-30 11:56:18', NULL),
(504, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-30 11:56:39', NULL),
(505, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-30 11:57:09', NULL),
(506, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-30 11:57:22', NULL),
(507, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-30 11:57:53', NULL),
(508, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-30 11:59:48', NULL),
(509, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-30 12:00:02', NULL),
(510, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-30 12:00:04', NULL),
(511, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-30 12:00:52', NULL),
(512, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-30 12:01:17', 6),
(513, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-30 12:02:02', NULL),
(514, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-30 12:03:24', NULL),
(515, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-30 12:07:51', NULL),
(516, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-30 12:08:02', NULL),
(517, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-30 12:08:15', NULL),
(518, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-30 12:08:46', 6),
(519, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-30 12:09:08', 6),
(520, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-30 12:09:23', 6),
(521, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-30 12:09:58', NULL),
(522, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-30 12:16:26', NULL),
(523, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-30 12:17:19', NULL),
(524, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-30 12:17:32', NULL),
(525, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-30 12:19:16', NULL),
(526, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-30 12:22:41', 6),
(527, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-30 12:22:42', 6),
(528, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-30 12:22:43', 6),
(529, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-30 12:22:55', NULL),
(530, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-30 12:39:39', 6),
(531, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-30 12:39:40', 6),
(532, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-30 12:39:40', 6),
(533, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-30 12:41:07', 6),
(534, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-30 12:41:08', 6),
(535, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-30 12:41:09', 6),
(536, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-30 12:41:16', 6),
(537, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-30 12:41:16', 6),
(538, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-30 12:41:17', 6),
(539, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-30 12:48:23', 6),
(540, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-30 12:48:50', 6),
(541, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-30 12:48:51', 6),
(542, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-30 12:48:51', 6),
(543, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-30 12:49:05', 6),
(544, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-30 12:49:06', 6),
(545, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-30 12:49:06', 6),
(546, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-30 12:49:21', 6),
(547, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-30 12:49:22', 6),
(548, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-30 12:49:22', 6),
(549, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-30 12:54:44', 6),
(550, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-30 12:54:49', 6),
(551, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-30 12:57:23', 6),
(552, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-30 12:57:24', 6),
(553, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-30 12:57:24', 6),
(554, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-30 12:59:35', 6),
(555, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-30 12:59:36', 6),
(556, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-30 12:59:36', 6),
(557, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-30 13:00:01', 6),
(558, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-30 13:00:25', 6),
(559, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-30 13:00:25', 6),
(560, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-30 13:00:26', 6),
(561, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-30 13:00:46', 6),
(562, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-30 13:00:47', 6),
(563, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-30 13:00:47', 6),
(564, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-30 13:00:55', 6),
(565, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-30 13:00:56', 6),
(566, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-30 13:00:56', 6),
(567, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-30 13:01:13', 6),
(568, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-30 13:01:14', 6),
(569, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-30 13:01:14', 6),
(570, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-30 13:02:58', 6),
(571, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-30 13:02:58', 6),
(572, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-30 13:02:59', 6),
(573, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-30 13:07:36', NULL),
(574, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-30 13:07:57', 6),
(575, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-30 13:07:58', 6),
(576, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-30 13:07:59', 6),
(577, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-30 13:12:56', 6),
(578, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-30 13:12:56', 6),
(579, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-30 13:12:57', 6),
(580, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-30 13:18:27', 6),
(581, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-30 13:18:29', 6),
(582, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-30 13:18:29', 6),
(583, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-30 13:18:34', 6),
(584, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-30 13:18:35', 6),
(585, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-30 13:18:35', 6),
(586, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-30 13:20:30', 6),
(587, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-30 13:20:31', 6),
(588, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-30 13:20:32', 6),
(589, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-30 13:21:57', 6),
(590, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-30 13:22:18', 6),
(591, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-30 13:24:45', 6),
(592, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-30 13:31:15', 6),
(593, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-30 13:31:54', 6),
(594, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-30 13:33:11', 6),
(595, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-30 13:33:12', 6),
(596, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-30 13:33:13', 6),
(597, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-30 13:33:18', 6),
(598, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-30 13:33:19', 6),
(599, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-30 13:33:19', 6),
(600, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-30 13:33:54', 6),
(601, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-30 13:33:55', 6),
(602, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-30 13:33:55', 6),
(603, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-30 13:34:12', 6),
(604, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-30 13:34:13', 6),
(605, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-30 13:34:14', 6),
(606, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-30 13:34:42', 6),
(607, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-30 13:34:43', 6),
(608, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-30 13:34:43', 6),
(609, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-30 13:34:59', 6),
(610, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-30 13:35:00', 6),
(611, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-30 13:35:00', 6),
(612, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-30 13:46:34', 6),
(613, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-30 13:46:36', 6),
(614, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-30 13:46:36', 6),
(615, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-30 13:46:48', 6),
(616, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-30 13:46:48', 6),
(617, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-30 13:46:49', 6),
(618, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-30 13:48:49', 6),
(619, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-30 13:48:50', 6),
(620, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-30 13:48:51', 6),
(621, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-30 14:17:45', 6),
(622, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-30 14:17:48', 6),
(623, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-30 14:17:48', 6),
(624, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-04-01 08:44:38', 6),
(625, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-04-01 08:44:39', 6),
(626, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-04-01 08:44:40', 6),
(627, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-04-01 08:46:40', 6),
(628, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-04-01 08:46:41', 6),
(629, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-04-01 08:46:41', 6),
(630, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-04-01 09:53:31', 6),
(631, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-04-01 09:53:33', 6),
(632, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-04-01 13:37:52', 6),
(633, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-04-01 13:37:53', 6),
(634, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-04-01 13:37:53', 6),
(635, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-04-01 13:38:59', 4),
(636, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-04-01 13:39:00', 4),
(637, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-04-01 13:39:00', 4),
(638, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-04-01 13:39:27', 5),
(639, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-04-01 13:39:28', 5),
(640, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-04-01 13:39:28', 5),
(641, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-04-01 14:29:50', 6),
(642, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-04-01 14:29:51', 6),
(643, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-04-03 06:11:26', 6),
(644, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-04-03 09:23:17', 6),
(645, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-04-03 09:24:03', 6),
(646, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-04-03 09:24:19', 6),
(647, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-04-03 09:24:44', 6),
(648, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-04-03 09:25:07', NULL),
(649, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-04-03 09:25:15', NULL),
(650, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-04-03 09:25:17', NULL),
(651, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-04-03 09:25:57', NULL),
(652, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-04-03 09:26:41', 6),
(653, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-04-03 09:27:19', 6),
(654, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-04-03 09:27:20', 6),
(655, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-04-03 09:27:21', 6),
(656, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-04-03 09:27:38', 6),
(657, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-04-03 09:27:39', 6),
(658, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-04-03 09:27:40', 6),
(659, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-04-03 09:32:22', 6),
(660, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-04-03 09:32:23', 6),
(661, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-04-03 09:32:24', 6),
(662, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-04-03 09:54:02', 6),
(663, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-04-03 09:54:02', 6),
(664, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-04-03 09:54:03', 6),
(665, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-04-03 11:35:51', 6),
(666, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-04-03 11:35:52', 6),
(667, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-04-03 11:35:52', 6),
(668, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-04-03 11:35:59', 16),
(669, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-04-03 11:35:59', 16),
(670, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-04-03 11:36:00', 16),
(671, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-04-03 11:36:10', 15),
(672, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-04-03 11:36:11', 15),
(673, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-04-03 11:36:11', 15),
(674, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-04-03 11:39:08', 6),
(675, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-04-03 11:39:09', 6),
(676, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-04-03 11:39:10', 6),
(677, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-04-03 11:42:51', 6),
(678, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-04-03 12:29:15', 4),
(679, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-04-03 12:29:15', 4),
(680, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-04-03 12:29:16', 4);
INSERT INTO `user_agents` (`id`, `agent`, `timestamps`, `article_id`) VALUES
(681, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-04-03 12:33:43', 6),
(682, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-04-03 12:33:44', 6),
(683, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-04-03 12:33:44', 6),
(684, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-04-05 11:06:46', 6),
(685, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-04-05 11:06:47', 6),
(686, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-04-05 11:06:47', 6),
(687, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-09 10:49:46', 14),
(688, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-09 10:49:47', 14),
(689, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-09 10:49:48', 14),
(690, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-17 08:34:39', 41),
(691, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-17 08:34:40', 41),
(692, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-17 08:34:40', 41),
(693, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-17 08:35:14', 15),
(694, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-17 08:35:15', 15),
(695, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-17 08:35:15', 15),
(696, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-17 08:40:52', 41),
(697, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-17 08:40:52', 41),
(698, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-17 08:40:53', 41),
(699, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-17 08:41:13', 41),
(700, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-17 08:41:13', 41),
(701, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-17 08:41:14', 41),
(702, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-17 14:18:14', 42),
(703, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-17 14:18:15', 42),
(704, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-17 14:18:15', 42),
(705, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-17 15:20:57', 42),
(706, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-17 15:20:58', 42),
(707, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-17 15:20:58', 42),
(708, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-17 15:22:26', 42),
(709, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-17 15:22:27', 42),
(710, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-17 15:22:27', 42),
(711, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-17 15:22:37', 42),
(712, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-17 15:22:38', 42),
(713, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-17 15:22:38', 42),
(714, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-17 15:23:23', 42),
(715, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-17 15:23:23', 42),
(716, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-17 15:23:24', 42),
(717, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-17 15:32:02', 42),
(718, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-17 15:32:02', 42),
(719, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-17 15:32:03', 42),
(720, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-17 15:32:13', 42),
(721, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-17 15:32:13', 42),
(722, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-17 15:32:14', 42),
(723, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-17 15:32:42', 42),
(724, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-17 15:32:42', 42),
(725, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-17 15:32:43', 42),
(726, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-17 15:32:52', 42),
(727, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-17 15:32:53', 42),
(728, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-17 15:32:53', 42),
(729, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-17 15:35:25', 42),
(730, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-17 15:35:25', 42),
(731, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-17 15:35:26', 42),
(732, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-17 15:35:38', 6),
(733, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-17 15:35:39', 6),
(734, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-17 15:35:39', 6),
(735, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-17 15:35:54', 15),
(736, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-17 15:35:55', 15),
(737, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-17 15:35:55', 15),
(738, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-17 15:36:09', 6),
(739, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-17 15:36:09', 6),
(740, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-17 15:36:10', 6),
(741, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-17 15:36:14', 15),
(742, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-17 15:36:15', 15),
(743, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-17 15:36:15', 15),
(744, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-17 15:36:20', 42),
(745, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-17 15:36:20', 42),
(746, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-17 15:36:21', 42),
(747, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-17 18:41:36', 6),
(748, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-17 18:41:37', 6),
(749, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-17 18:41:38', 6),
(750, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-17 18:42:10', 6),
(751, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-17 18:42:11', 6),
(752, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-17 18:42:11', 6),
(753, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-17 18:42:20', 6),
(754, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-17 18:42:20', 6),
(755, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-17 18:42:21', 6),
(756, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-17 18:42:45', 42),
(757, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-17 18:42:46', 42),
(758, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-17 18:42:46', 42),
(759, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-17 18:44:45', 6),
(760, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-17 18:44:46', 6),
(761, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-17 18:44:46', 6),
(762, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-17 18:51:05', 42),
(763, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-17 18:51:06', 42),
(764, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-17 18:51:06', 42),
(765, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-17 18:52:21', 42),
(766, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-17 18:52:22', 42),
(767, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-17 18:52:22', 42),
(768, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-17 18:52:35', 42),
(769, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-17 18:52:36', 42),
(770, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-17 18:52:36', 42),
(771, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-17 18:54:30', 42),
(772, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-17 18:54:31', 42),
(773, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-17 18:54:31', 42),
(774, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-17 18:54:51', 42),
(775, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-17 18:54:51', 42),
(776, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-17 18:54:51', 42),
(777, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-17 18:55:11', 42),
(778, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-17 18:55:12', 42),
(779, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-17 18:55:12', 42),
(780, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-17 18:55:42', 42),
(781, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-17 18:55:42', 42),
(782, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-17 18:55:43', 42),
(783, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-18 07:46:47', 6),
(784, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-18 07:46:48', 6),
(785, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-18 07:46:48', 6),
(786, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-18 07:47:00', 6),
(787, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-18 07:47:01', 6),
(788, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-18 07:47:01', 6),
(789, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-18 07:47:03', 15),
(790, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-18 07:47:04', 15),
(791, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-18 07:47:04', 15),
(792, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-18 07:47:08', 22),
(793, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-18 07:47:09', 22),
(794, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-18 07:47:09', 22),
(795, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-18 07:48:38', 23),
(796, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-18 07:48:39', 23),
(797, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-18 07:48:39', 23),
(798, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-18 07:48:57', 42),
(799, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-18 07:48:57', 42),
(800, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-18 07:48:58', 42),
(801, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-18 07:49:06', 34),
(802, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-18 07:49:06', 34),
(803, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-18 07:49:07', 34),
(804, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-18 07:49:16', 23),
(805, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-18 07:49:17', 23),
(806, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-18 07:49:17', 23),
(807, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-18 07:49:21', 21),
(808, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-18 07:49:21', 21),
(809, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-18 07:49:22', 21),
(810, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-18 07:50:11', 42),
(811, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-18 07:50:11', 42),
(812, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-18 07:50:12', 42),
(813, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-18 07:50:18', 21),
(814, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-18 07:50:18', 21),
(815, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-18 07:50:19', 21),
(816, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-18 08:13:43', 34),
(817, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-18 08:13:44', 34),
(818, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-18 08:13:44', 34),
(819, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-18 08:13:50', 6),
(820, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-18 08:13:50', 6),
(821, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-18 08:13:51', 6),
(822, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-18 08:14:04', 34),
(823, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-18 08:14:05', 34),
(824, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-18 08:14:05', 34),
(825, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-18 08:48:18', 42),
(826, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-18 08:48:18', 42),
(827, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-18 08:48:19', 42),
(828, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-18 08:49:04', 42),
(829, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-18 08:49:05', 42),
(830, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-18 08:49:05', 42),
(831, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-18 08:49:30', 42),
(832, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-18 08:49:31', 42),
(833, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-18 08:49:31', 42),
(834, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-18 08:54:11', 42),
(835, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-18 08:54:12', 42),
(836, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-18 08:54:12', 42),
(837, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-19 09:11:03', 42),
(838, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-19 09:11:04', 42),
(839, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-19 09:11:05', 42),
(840, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-19 09:34:27', 42),
(841, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-19 09:34:28', 42),
(842, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-19 09:34:28', 42),
(843, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-25 14:16:19', 42),
(844, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-25 14:16:20', 42),
(845, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-25 14:16:21', 42);

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
-- Chỉ mục cho bảng `article_translations`
--
ALTER TABLE `article_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `article_translations_article_id_locale_unique` (`article_id`,`locale`);

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
-- Chỉ mục cho bảng `category_article_translations`
--
ALTER TABLE `category_article_translations`
  ADD PRIMARY KEY (`id`);

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
-- Chỉ mục cho bảng `menu_translations`
--
ALTER TABLE `menu_translations`
  ADD PRIMARY KEY (`id`);

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
-- Chỉ mục cho bảng `slider_translations`
--
ALTER TABLE `slider_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_slider_translations_slider` (`slider_id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT cho bảng `article_translations`
--
ALTER TABLE `article_translations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT cho bảng `category_article_translations`
--
ALTER TABLE `category_article_translations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

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
-- AUTO_INCREMENT cho bảng `menu_translations`
--
ALTER TABLE `menu_translations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=95;

--
-- AUTO_INCREMENT cho bảng `product_has_attribute`
--
ALTER TABLE `product_has_attribute`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=158;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13430;

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
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT cho bảng `slider_translations`
--
ALTER TABLE `slider_translations`
  MODIFY `id` int(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT cho bảng `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT cho bảng `user_agents`
--
ALTER TABLE `user_agents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=846;

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

--
-- Các ràng buộc cho bảng `slider_translations`
--
ALTER TABLE `slider_translations`
  ADD CONSTRAINT `fk_slider_translations_slider` FOREIGN KEY (`slider_id`) REFERENCES `slider` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
