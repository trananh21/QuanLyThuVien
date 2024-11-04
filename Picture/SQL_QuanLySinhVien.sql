CREATE DATABASE QLTV
GO

USE QLTV
GO
 
-- Bảng Sách
CREATE TABLE Sach (
    MaSach INT PRIMARY KEY,
    TenSach NVARCHAR(255),
    LoaiSach NVARCHAR(100),
    MaTacGia INT,
    MaNXB INT,
    NgayXuatBan DATE,
    SoLuong INT,
    FOREIGN KEY (MaTacGia) REFERENCES TacGia(MaTacGia),
    FOREIGN KEY (MaNXB) REFERENCES NhaXuatBan(MaNXB)
);
GO

-- Bảng Nhà Xuất Bản
CREATE TABLE NhaXuatBan (
    MaNXB INT PRIMARY KEY,
    TenNXB NVARCHAR(255)
);

-- Bảng Tác Giả
CREATE TABLE TacGia (
    MaTacGia INT PRIMARY KEY,
    TenTacGia NVARCHAR(255)
);

-- Bảng Độc Giả
CREATE TABLE DocGia (
    MaDocGia INT PRIMARY KEY,
    TenDocGia NVARCHAR(255),
    NgaySinh DATE,
    GioiTinh NVARCHAR(10),
    DiaChi NVARCHAR(255),
    LopHoc NVARCHAR(50),
    NgayTaoThe DATE,
    MaNhanVien INT,
    TenDangNhap NVARCHAR(50),
    FOREIGN KEY (MaNhanVien) REFERENCES NhanVien(MaNhanVien),
    FOREIGN KEY (TenDangNhap) REFERENCES NguoiDung(TenDangNhap)
);

-- Bảng Nhân Viên
CREATE TABLE NhanVien (
    MaNhanVien INT PRIMARY KEY,
    TenNhanVien NVARCHAR(255),
    NgaySinh DATE,
    GioiTinh NVARCHAR(10),
    SoDienThoai NVARCHAR(15),
    TenDangNhap NVARCHAR(50),
    FOREIGN KEY (TenDangNhap) REFERENCES NguoiDung(TenDangNhap)
);

-- Bảng Phiếu Mượn
CREATE TABLE PhieuMuon (
    MaPhieuMuon INT PRIMARY KEY,
    MaNhanVien INT,
    NgayLapPhieu DATE,
    MaDocGia INT,
    FOREIGN KEY (MaNhanVien) REFERENCES NhanVien(MaNhanVien),
    FOREIGN KEY (MaDocGia) REFERENCES DocGia(MaDocGia)
);

-- Bảng Chi Tiết Phiếu Mượn
CREATE TABLE ChiTietPhieuMuon (
    MaPhieuMuon INT,
    MaSach INT,
    TinhTrang BIT,
    NgayTraSach DATE,
    TienPhat DECIMAL(10, 2),
    MaNhanVien INT,
    PRIMARY KEY (MaPhieuMuon, MaSach),
    FOREIGN KEY (MaPhieuMuon) REFERENCES PhieuMuon(MaPhieuMuon),
    FOREIGN KEY (MaSach) REFERENCES Sach(MaSach),
    FOREIGN KEY (MaNhanVien) REFERENCES NhanVien(MaNhanVien)
);

-- Bảng Người Dùng
CREATE TABLE NguoiDung (
    TenDangNhap NVARCHAR(50) PRIMARY KEY,
    MatKhau NVARCHAR(255),
    LoaiNguoiDung NVARCHAR(50)
);
