use master
go

if exists(select* from sysdatabases where name = 'DB_TourDL')
	drop database DB_TourDL
go

create database DB_TourDL
go

use DB_TourDL
go

CREATE TABLE KHACHHANG (
    ID_KH INT PRIMARY KEY,
    HoTen_KH NVARCHAR(MAX),
    GioiTinh_KH NVARCHAR(5),
    NgaySinh_KH DATE,
    MatKhau NVARCHAR(MAX),
    CCCD NVARCHAR(12),
    SDT_KH NVARCHAR(10),
    Mail_KH NVARCHAR(MAX),
    Diem INT
);

CREATE TABLE NHANVIEN (
    ID_NV INT PRIMARY KEY,
    HoTen_NV NVARCHAR(MAX),
    GioiTinh_NV NVARCHAR(5),
    NgaySinh_NV DATE,
    MatKhau NVARCHAR(MAX),
    Mail_NV NVARCHAR(MAX),
    ChucVu NVARCHAR(MAX),
    SDT_NV NVARCHAR(10)
);

CREATE TABLE TOUR (
    ID_TOUR NVARCHAR(5) PRIMARY KEY,
    TenTour NVARCHAR(MAX),
    GiaTour INT,
    MoTa NVARCHAR(MAX),
    HinhTour NVARCHAR(MAX),
    TinhThanh NVARCHAR(MAX),
    LoaiTour NVARCHAR(MAX)
);


CREATE TABLE SPTOUR (
    ID_SPTour NVARCHAR(5) PRIMARY KEY,
    TenSPTour NVARCHAR(MAX),
    GiaNguoiLon INT,
    NgayKhoiHanh DATE,
    NgayKetThuc DATE,
    MoTa NVARCHAR(MAX),
    DiemTapTrung NVARCHAR(MAX),
    DiemDen NVARCHAR(MAX),
    SoNguoi INT,
    HinhAnh NVARCHAR(MAX),
    GiaTreEm INT,
    ID_NV INT,
    ID_TOUR NVARCHAR(5),
    FOREIGN KEY (ID_NV) REFERENCES NHANVIEN(ID_NV),
    FOREIGN KEY (ID_TOUR) REFERENCES TOUR(ID_TOUR)
);

CREATE TABLE HOADON (
    ID_HoaDon INT PRIMARY KEY,
    SLTreEm INT,
    TongTienTour INT,
    NgayDat DATETIME,
    TinhTrang NVARCHAR(20),
    SLNguoiLon INT,
    TienKhuyenMai INT,
    TienPhaiTra INT,
    ID_SPTour NVARCHAR(5),
    ID_KH INT,
    FOREIGN KEY (ID_SPTour) REFERENCES SPTOUR(ID_SPTour),
    FOREIGN KEY (ID_KH) REFERENCES KHACHHANG(ID_KH)
);




select * from NHANVIEN
insert into NHANVIEN values (111, 'Phuoc', 'Nam', '20030402', '123123', '111@gmail.com', null, '1231231231')