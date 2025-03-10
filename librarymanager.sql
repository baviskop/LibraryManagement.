-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 10, 2025 at 06:01 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `librarymanager`
--

-- --------------------------------------------------------

--
-- Table structure for table `bandoc`
--

CREATE TABLE `bandoc` (
  `ID` int(11) NOT NULL,
  `HoTen` varchar(100) NOT NULL,
  `LoaiDocGia` enum('Sinh viên','Giảng viên','Khác') NOT NULL,
  `SoDienThoai` varchar(15) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `DiaChi` text DEFAULT NULL,
  `NgayDangKy` date DEFAULT curdate()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bandoc`
--

INSERT INTO `bandoc` (`ID`, `HoTen`, `LoaiDocGia`, `SoDienThoai`, `Email`, `DiaChi`, `NgayDangKy`) VALUES
(1, 'Nguyen Van A', 'Sinh viên', '0912345001', 'a1@gmail.com', 'Hà Nội', '2025-03-10'),
(2, 'Tran Thi B', 'Giảng viên', '0912345002', 'b1@gmail.com', 'TP HCM', '2025-03-10'),
(3, 'Le Van C', 'Khác', '0912345003', 'c1@gmail.com', 'Đà Nẵng', '2025-03-10'),
(4, 'Pham Thi D', 'Sinh viên', '0912345004', 'd1@gmail.com', 'Cần Thơ', '2025-03-10'),
(5, 'Hoang Van E', 'Giảng viên', '0912345005', 'e1@gmail.com', 'Huế', '2025-03-10');

-- --------------------------------------------------------

--
-- Table structure for table `dangkyphongdoc`
--

CREATE TABLE `dangkyphongdoc` (
  `ID` int(11) NOT NULL,
  `BanDocID` int(11) NOT NULL,
  `PhongDocID` int(11) NOT NULL,
  `ThoiGianBatDau` datetime NOT NULL,
  `ThoiGianKetThuc` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dangkyphongdoc`
--

INSERT INTO `dangkyphongdoc` (`ID`, `BanDocID`, `PhongDocID`, `ThoiGianBatDau`, `ThoiGianKetThuc`) VALUES
(1, 1, 1, '2024-03-10 08:00:00', '2024-03-10 12:00:00'),
(2, 2, 2, '2024-03-11 09:00:00', '2024-03-11 11:00:00'),
(3, 3, 3, '2024-03-12 10:00:00', '2024-03-12 14:00:00'),
(4, 4, 4, '2024-03-13 08:30:00', '2024-03-13 12:30:00'),
(5, 5, 5, '2024-03-14 09:15:00', '2024-03-14 13:15:00');

-- --------------------------------------------------------

--
-- Table structure for table `danhmucsach`
--

CREATE TABLE `danhmucsach` (
  `ID` int(11) NOT NULL,
  `TenDanhMuc` varchar(100) NOT NULL,
  `MoTa` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `danhmucsach`
--

INSERT INTO `danhmucsach` (`ID`, `TenDanhMuc`, `MoTa`) VALUES
(1, 'Lập trình', 'Sách về lập trình và công nghệ thông tin'),
(2, 'Văn học', 'Sách văn học, tiểu thuyết, thơ'),
(3, 'Kinh tế', 'Sách về kinh tế, tài chính, kinh doanh'),
(4, 'Khoa học', 'Sách khoa học tự nhiên và ứng dụng'),
(5, 'Lịch sử', 'Sách lịch sử Việt Nam và thế giới');

-- --------------------------------------------------------

--
-- Table structure for table `muontrasach`
--

CREATE TABLE `muontrasach` (
  `ID` int(11) NOT NULL,
  `BanDocID` int(11) NOT NULL,
  `SachID` int(11) NOT NULL,
  `NgayMuon` date DEFAULT curdate(),
  `HanTra` date NOT NULL,
  `NgayTra` date DEFAULT NULL,
  `TrangThai` enum('Đang mượn','Đã trả','Quá hạn') DEFAULT 'Đang mượn'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `muontrasach`
--

INSERT INTO `muontrasach` (`ID`, `BanDocID`, `SachID`, `NgayMuon`, `HanTra`, `NgayTra`, `TrangThai`) VALUES
(1, 1, 1, '2025-03-10', '2024-04-10', NULL, 'Đang mượn'),
(2, 2, 2, '2025-03-10', '2024-04-15', NULL, 'Đang mượn'),
(3, 3, 3, '2025-03-10', '2024-04-20', NULL, 'Đang mượn'),
(4, 4, 4, '2025-03-10', '2024-04-25', NULL, 'Đang mượn'),
(5, 5, 5, '2025-03-10', '2024-05-01', NULL, 'Đang mượn');

-- --------------------------------------------------------

--
-- Table structure for table `nguoidung`
--

CREATE TABLE `nguoidung` (
  `ID` int(11) NOT NULL,
  `TenDangNhap` varchar(50) NOT NULL,
  `MatKhau` varchar(255) NOT NULL,
  `VaiTro` enum('Admin','Nhân viên','Quản lý') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `nguoidung`
--

INSERT INTO `nguoidung` (`ID`, `TenDangNhap`, `MatKhau`, `VaiTro`) VALUES
(1, 'admin', 'hashedpassword1', 'Admin'),
(2, 'staff01', 'hashedpassword2', 'Nhân viên'),
(3, 'staff02', 'hashedpassword3', 'Nhân viên'),
(4, 'manager01', 'hashedpassword4', 'Quản lý'),
(5, 'manager02', 'hashedpassword5', 'Quản lý');

-- --------------------------------------------------------

--
-- Table structure for table `phongdoc`
--

CREATE TABLE `phongdoc` (
  `ID` int(11) NOT NULL,
  `TenPhong` varchar(100) NOT NULL,
  `LoaiPhong` enum('Phòng đọc','Phòng Internet','Phòng ngoại ngữ') NOT NULL,
  `SucChua` int(11) NOT NULL CHECK (`SucChua` > 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `phongdoc`
--

INSERT INTO `phongdoc` (`ID`, `TenPhong`, `LoaiPhong`, `SucChua`) VALUES
(1, 'Phòng đọc A1', 'Phòng đọc', 50),
(2, 'Phòng Internet B1', 'Phòng Internet', 20),
(3, 'Phòng ngoại ngữ C1', 'Phòng ngoại ngữ', 30),
(4, 'Phòng đọc A2', 'Phòng đọc', 40),
(5, 'Phòng Internet B2', 'Phòng Internet', 25);

-- --------------------------------------------------------

--
-- Table structure for table `sach`
--

CREATE TABLE `sach` (
  `ID` int(11) NOT NULL,
  `TenSach` varchar(255) NOT NULL,
  `TacGia` varchar(100) NOT NULL,
  `TheLoai` varchar(50) NOT NULL,
  `NgonNgu` varchar(50) NOT NULL,
  `NhaXuatBan` varchar(100) DEFAULT NULL,
  `NamXuatBan` year(4) DEFAULT NULL,
  `SoLuong` int(11) DEFAULT 1 CHECK (`SoLuong` >= 0),
  `TrangThai` enum('Còn','Hết','Đặt trước') DEFAULT 'Còn'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sach`
--

INSERT INTO `sach` (`ID`, `TenSach`, `TacGia`, `TheLoai`, `NgonNgu`, `NhaXuatBan`, `NamXuatBan`, `SoLuong`, `TrangThai`) VALUES
(1, 'Lập trình C++', 'Bjarne Stroustrup', 'Lập trình', 'Tiếng Anh', 'NXB Khoa Học', '2020', 10, 'Còn'),
(2, 'Java từ cơ bản đến nâng cao', 'James Gosling', 'Công nghệ', 'Tiếng Việt', 'NXB Giáo Dục', '2021', 7, 'Còn'),
(3, 'Học Python trong 7 ngày', 'Guido van Rossum', 'Lập trình', 'Tiếng Anh', 'NXB Tin Học', '2019', 15, 'Còn'),
(4, 'Thiết kế CSDL', 'Codd E. F.', 'Công nghệ', 'Tiếng Việt', 'NXB Đại Học', '2018', 5, 'Còn'),
(5, 'Thuật toán và lập trình', 'Donald Knuth', 'Lập trình', 'Tiếng Anh', 'NXB Khoa Học', '2022', 12, 'Còn');

-- --------------------------------------------------------

--
-- Table structure for table `sach_danhmuc`
--

CREATE TABLE `sach_danhmuc` (
  `SachID` int(11) NOT NULL,
  `DanhMucID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sach_danhmuc`
--

INSERT INTO `sach_danhmuc` (`SachID`, `DanhMucID`) VALUES
(1, 1),
(1, 4),
(2, 1),
(2, 2),
(3, 1),
(3, 3),
(4, 4),
(4, 5),
(5, 1),
(5, 5);

-- --------------------------------------------------------

--
-- Table structure for table `thethuvien`
--

CREATE TABLE `thethuvien` (
  `ID` int(11) NOT NULL,
  `BanDocID` int(11) NOT NULL,
  `MaVach` varchar(50) NOT NULL,
  `NgayCap` date DEFAULT curdate(),
  `NgayHetHan` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `thethuvien`
--

INSERT INTO `thethuvien` (`ID`, `BanDocID`, `MaVach`, `NgayCap`, `NgayHetHan`) VALUES
(1, 1, 'TV001', '2025-03-10', '2027-12-31'),
(2, 2, 'TV002', '2025-03-10', '2027-11-30'),
(3, 3, 'TV003', '2025-03-10', '2026-10-15'),
(4, 4, 'TV004', '2025-03-10', '2026-09-20'),
(5, 5, 'TV005', '2025-03-10', '2027-01-05');

-- --------------------------------------------------------

--
-- Table structure for table `thongke`
--

CREATE TABLE `thongke` (
  `ID` int(11) NOT NULL,
  `LoaiThongKe` varchar(100) NOT NULL,
  `GiaTri` int(11) NOT NULL,
  `NgayTao` date DEFAULT curdate()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `thongke`
--

INSERT INTO `thongke` (`ID`, `LoaiThongKe`, `GiaTri`, `NgayTao`) VALUES
(1, 'Số sách đang mượn', 50, '2025-03-10'),
(2, 'Số sách còn lại', 500, '2025-03-10'),
(3, 'Số bạn đọc đang hoạt động', 120, '2025-03-10'),
(4, 'Số lượt mượn trong tháng', 300, '2025-03-10'),
(5, 'Số sách quá hạn', 20, '2025-03-10');

-- --------------------------------------------------------

--
-- Table structure for table `tracuuthuvien`
--

CREATE TABLE `tracuuthuvien` (
  `ID` int(11) NOT NULL,
  `BanDocID` int(11) NOT NULL,
  `TuKhoa` varchar(255) NOT NULL,
  `LoaiTraCuu` enum('Nội bộ','Ngoài thư viện') NOT NULL,
  `ThoiGianTraCuu` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tracuuthuvien`
--

INSERT INTO `tracuuthuvien` (`ID`, `BanDocID`, `TuKhoa`, `LoaiTraCuu`, `ThoiGianTraCuu`) VALUES
(1, 1, 'Lập trình C++', 'Nội bộ', '2025-03-10 23:49:01'),
(2, 2, 'Kinh tế vĩ mô', 'Ngoài thư viện', '2025-03-10 23:49:01'),
(3, 3, 'Tiểu thuyết trinh thám', 'Nội bộ', '2025-03-10 23:49:01'),
(4, 4, 'Toán học ứng dụng', 'Ngoài thư viện', '2025-03-10 23:49:01'),
(5, 5, 'Vật lý lượng tử', 'Nội bộ', '2025-03-10 23:49:01');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bandoc`
--
ALTER TABLE `bandoc`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `SoDienThoai` (`SoDienThoai`),
  ADD UNIQUE KEY `Email` (`Email`);

--
-- Indexes for table `dangkyphongdoc`
--
ALTER TABLE `dangkyphongdoc`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_DangKyPhongDoc_BanDoc` (`BanDocID`),
  ADD KEY `FK_DangKyPhongDoc_PhongDoc` (`PhongDocID`);

--
-- Indexes for table `danhmucsach`
--
ALTER TABLE `danhmucsach`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `TenDanhMuc` (`TenDanhMuc`);

--
-- Indexes for table `muontrasach`
--
ALTER TABLE `muontrasach`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_MuonTraSach_BanDoc` (`BanDocID`),
  ADD KEY `FK_MuonTraSach_Sach` (`SachID`);

--
-- Indexes for table `nguoidung`
--
ALTER TABLE `nguoidung`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `TenDangNhap` (`TenDangNhap`);

--
-- Indexes for table `phongdoc`
--
ALTER TABLE `phongdoc`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `TenPhong` (`TenPhong`);

--
-- Indexes for table `sach`
--
ALTER TABLE `sach`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sach_danhmuc`
--
ALTER TABLE `sach_danhmuc`
  ADD PRIMARY KEY (`SachID`,`DanhMucID`),
  ADD KEY `FK_Sach_DanhMuc_DanhMucSach` (`DanhMucID`);

--
-- Indexes for table `thethuvien`
--
ALTER TABLE `thethuvien`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `MaVach` (`MaVach`),
  ADD KEY `FK_TheThuVien_BanDoc` (`BanDocID`);

--
-- Indexes for table `thongke`
--
ALTER TABLE `thongke`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tracuuthuvien`
--
ALTER TABLE `tracuuthuvien`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_TraCuuThuVien_BanDoc` (`BanDocID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bandoc`
--
ALTER TABLE `bandoc`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `dangkyphongdoc`
--
ALTER TABLE `dangkyphongdoc`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `danhmucsach`
--
ALTER TABLE `danhmucsach`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `muontrasach`
--
ALTER TABLE `muontrasach`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `nguoidung`
--
ALTER TABLE `nguoidung`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `phongdoc`
--
ALTER TABLE `phongdoc`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `sach`
--
ALTER TABLE `sach`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `thethuvien`
--
ALTER TABLE `thethuvien`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `thongke`
--
ALTER TABLE `thongke`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tracuuthuvien`
--
ALTER TABLE `tracuuthuvien`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `dangkyphongdoc`
--
ALTER TABLE `dangkyphongdoc`
  ADD CONSTRAINT `FK_DangKyPhongDoc_BanDoc` FOREIGN KEY (`BanDocID`) REFERENCES `bandoc` (`ID`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_DangKyPhongDoc_PhongDoc` FOREIGN KEY (`PhongDocID`) REFERENCES `phongdoc` (`ID`) ON DELETE CASCADE,
  ADD CONSTRAINT `dangkyphongdoc_ibfk_1` FOREIGN KEY (`BanDocID`) REFERENCES `bandoc` (`ID`) ON DELETE CASCADE,
  ADD CONSTRAINT `dangkyphongdoc_ibfk_2` FOREIGN KEY (`PhongDocID`) REFERENCES `phongdoc` (`ID`) ON DELETE CASCADE;

--
-- Constraints for table `muontrasach`
--
ALTER TABLE `muontrasach`
  ADD CONSTRAINT `FK_MuonTraSach_BanDoc` FOREIGN KEY (`BanDocID`) REFERENCES `bandoc` (`ID`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_MuonTraSach_Sach` FOREIGN KEY (`SachID`) REFERENCES `sach` (`ID`) ON DELETE CASCADE,
  ADD CONSTRAINT `muontrasach_ibfk_1` FOREIGN KEY (`BanDocID`) REFERENCES `bandoc` (`ID`) ON DELETE CASCADE,
  ADD CONSTRAINT `muontrasach_ibfk_2` FOREIGN KEY (`SachID`) REFERENCES `sach` (`ID`) ON DELETE CASCADE;

--
-- Constraints for table `sach_danhmuc`
--
ALTER TABLE `sach_danhmuc`
  ADD CONSTRAINT `FK_Sach_DanhMuc_DanhMucSach` FOREIGN KEY (`DanhMucID`) REFERENCES `danhmucsach` (`ID`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_Sach_DanhMuc_Sach` FOREIGN KEY (`SachID`) REFERENCES `sach` (`ID`) ON DELETE CASCADE,
  ADD CONSTRAINT `sach_danhmuc_ibfk_1` FOREIGN KEY (`SachID`) REFERENCES `sach` (`ID`) ON DELETE CASCADE,
  ADD CONSTRAINT `sach_danhmuc_ibfk_2` FOREIGN KEY (`DanhMucID`) REFERENCES `danhmucsach` (`ID`) ON DELETE CASCADE;

--
-- Constraints for table `thethuvien`
--
ALTER TABLE `thethuvien`
  ADD CONSTRAINT `FK_TheThuVien_BanDoc` FOREIGN KEY (`BanDocID`) REFERENCES `bandoc` (`ID`) ON DELETE CASCADE,
  ADD CONSTRAINT `thethuvien_ibfk_1` FOREIGN KEY (`BanDocID`) REFERENCES `bandoc` (`ID`) ON DELETE CASCADE;

--
-- Constraints for table `tracuuthuvien`
--
ALTER TABLE `tracuuthuvien`
  ADD CONSTRAINT `FK_TraCuuThuVien_BanDoc` FOREIGN KEY (`BanDocID`) REFERENCES `bandoc` (`ID`) ON DELETE CASCADE,
  ADD CONSTRAINT `tracuuthuvien_ibfk_1` FOREIGN KEY (`BanDocID`) REFERENCES `bandoc` (`ID`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
