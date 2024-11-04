Create database QLTV
GO

use QLTV
GO
--select
select * from TacGia
select * from Sach
select * from DocGia
select * from NhanVien
select * from PhieuMuon
select * from ChiTietPhieuMuon
select * from NguoiDung

CREATE TABLE NhaXuatBan (
    MaNhaXuatBan INT PRIMARY KEY,
    TenNhaXuatBan NVARCHAR(100)
);

CREATE TABLE TacGia (
    MaTacGia INT PRIMARY KEY,
    TenTacGia NVARCHAR(100)
);

CREATE TABLE Sach (
    MaSach INT PRIMARY KEY,
    TenSach NVARCHAR(100),
    LoaiSach NVARCHAR(50),
    MaTacGia INT FOREIGN KEY REFERENCES TacGia(MaTacGia),
    MaNhaXuatBan INT FOREIGN KEY REFERENCES NhaXuatBan(MaNhaXuatBan),
    NgayXuatBan DATE,
    SoLuong INT
);

CREATE TABLE DocGia (
    MaDocGia INT PRIMARY KEY,
    TenDocGia NVARCHAR(100),
    NgaySinh DATE,
    GioiTinh NVARCHAR(10),
    DiaChi NVARCHAR(200),
    LopHoc NVARCHAR(50),
    NgayTaoThe DATE,
    MaNhanVienTaoThe INT,
    TenDangNhap NVARCHAR(50) FOREIGN KEY REFERENCES NguoiDung(TenDangNhap)
);

CREATE TABLE NhanVien (
    MaNhanVien INT PRIMARY KEY,
    TenNhanVien NVARCHAR(100),
    NgaySinh DATE,
    GioiTinh NVARCHAR(10),
    SoDienThoai NVARCHAR(20),
    TenDangNhap NVARCHAR(50) FOREIGN KEY REFERENCES NguoiDung(TenDangNhap)
);

CREATE TABLE PhieuMuon (
    MaPhieuMuon INT PRIMARY KEY,
    MaNhanVien INT FOREIGN KEY REFERENCES NhanVien(MaNhanVien),
    NgayLapPhieu DATE,
    MaDocGia INT FOREIGN KEY REFERENCES DocGia(MaDocGia)
);

CREATE TABLE ChiTietPhieuMuon (
    MaPhieuMuon INT,
    MaSach INT,
    TinhTrang BIT,
    NgayTraSach DATE,
    TienPhat DECIMAL(10, 2),
    MaNhanVienNhanSachTra INT,
    PRIMARY KEY (MaPhieuMuon, MaSach),
    FOREIGN KEY (MaPhieuMuon) REFERENCES PhieuMuon(MaPhieuMuon),
    FOREIGN KEY (MaSach) REFERENCES Sach(MaSach),
    FOREIGN KEY (MaNhanVienNhanSachTra) REFERENCES NhanVien(MaNhanVien)
);

CREATE TABLE NguoiDung (
    TenDangNhap NVARCHAR(50) PRIMARY KEY,
    MatKhau NVARCHAR(50),
    LoaiNguoiDung NVARCHAR(20)
);
INSERT INTO TacGia (MaTacGia, TenTacGia) VALUES
(1, N'Nguyễn Nhật Ánh'),
(2, N'Tô Hoài'),
(3, N'Nam Cao'),
(4, N'Ngô Tất Tố'),
(5, N'Ma Văn Kháng'),
(6, N'Vũ Trọng Phụng'),
(7, N'Nguyễn Du'),
(8, N'Hồ Chí Minh'),
(9, N'Xuân Quỳnh'),
(10, N'Thanh Tịnh');

INSERT INTO NhaXuatBan (MaNhaXuatBan, TenNhaXuatBan) VALUES
(1, N'NXB Kim Đồng'),
(2, N'NXB Giáo dục Việt Nam'),
(3, N'NXB Trẻ'),
(4, N'NXB Văn học'),
(5, N'NXB Thanh niên');

INSERT INTO Sach (MaSach, TenSach, LoaiSach, MaTacGia, MaNhaXuatBan, NgayXuatBan, SoLuong) VALUES
(1, N'Kính Vạn Hoa', N'Thiếu nhi', 1, 1, '2000-05-10', 50),
(2, N'Vợ Chồng A Phủ', N'Văn học', 2, 4, '2003-08-15', 30),
(3, N'Chí Phèo', N'Văn học', 3, 4, '2002-07-20', 40),
(4, N'Tắt Đèn', N'Văn học', 4, 4, '2001-03-12', 35),
(5, N'Mùa Lạc', N'Văn học', 5, 4, '2005-11-10', 25);

INSERT INTO DocGia (MaDocGia, TenDocGia, NgaySinh, GioiTinh, DiaChi, LopHoc, NgayTaoThe, MaNhanVienTaoThe, TenDangNhap) VALUES
(1, N'Hoàng Diễm Quỳnh', '1998-09-10', N'Nam', N'Hà Nội', N'10A1', '2020-01-15', 1, N'hoangquynh'),
(2, N'Nguyễn Thị Hoa', '1999-12-20', N'Nữ', N'Đà Nẵng', N'10B2', '2020-03-05', 2, N'nguyenthihoa'),
(3, N'Lê Quang Huy', '2000-06-25', N'Nam', N'Hồ Chí Minh', N'11C3', '2020-05-17', 1, N'lequanghuy');

INSERT INTO NhanVien (MaNhanVien, TenNhanVien, NgaySinh, GioiTinh, SoDienThoai, TenDangNhap) VALUES
(1, N'Hoàng Anh Tuấn', '1985-07-30', N'Nam', N'0901123456', N'hoanganhtuan');


INSERT INTO PhieuMuon (MaPhieuMuon, MaNhanVien, NgayLapPhieu, MaDocGia) VALUES
(1, 1, '2021-10-05', 1);

INSERT INTO NguoiDung(TenDangNhap, MatKhau, LoaiNguoiDung) VALUES
(N'phamtrananh', N'trienngungo16', N'Manager'),
(N'hoanganhtuan', N'tuanhoang', N'Staff'),
(N'hoangquynh', N'hoangquynh', N'Reader'),
(N'nguyenthihoa', N'hoanguyen', N'Reader'),
(N'lequanghuy',N'huyle',N'Reader');


INSERT INTO ChiTietPhieuMuon (MaPhieuMuon, MaSach, TinhTrang, NgayTraSach, TienPhat, MaNhanVienNhanSachTra) VALUES
(1, 1, 1, '2021-10-10', 0.00, 1),
(1, 2, 0, NULL, 1000.00, NULL);

Delete from NhaXuatBan
Delete from NguoiDung 
Delete from Sach 
Delete from DocGia 
Delete from NhanVien 
Delete from PhieuMuon 
Delete from ChiTietPhieuMuon
Delete from TacGia

