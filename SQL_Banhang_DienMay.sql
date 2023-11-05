create database BanHang_DienMay
go
use BanHang_DienMay
go
-- Tạo bảng Tài khoản
CREATE TABLE TaiKhoan (
    id INT PRIMARY KEY,
    ten_dang_nhap VARCHAR(50) NOT NULL,
    mat_khau VARCHAR(50) NOT NULL,
    loai_tk VARCHAR(20)
);

-- Tạo bảng Khách hàng
CREATE TABLE KhachHang (
    id INT PRIMARY KEY,
    ten VARCHAR(100) NOT NULL,
    dia_chi VARCHAR(255),
    so_dien_thoai VARCHAR(20),
    email VARCHAR(100),
    tai_khoan_id INT
);

-- Tạo bảng Sản phẩm
CREATE TABLE SanPham (
    id INT PRIMARY KEY,
    ten_san_pham VARCHAR(100) NOT NULL,
    mo_ta TEXT,
    gia DECIMAL(10, 2) NOT NULL,
    loai_san_pham_id INT
);

-- Tạo bảng Loại sản phẩm
CREATE TABLE LoaiSanPham (
    id INT PRIMARY KEY,
    ten_loai_san_pham VARCHAR(50) NOT NULL
);

-- Tạo bảng Nhân viên
CREATE TABLE NhanVien (
    id INT PRIMARY KEY,
    ten VARCHAR(100) NOT NULL,
    chuc_vu VARCHAR(50),
    luong DECIMAL(10, 2),
    tai_khoan_id INT
);

-- Tạo bảng Hóa đơn
CREATE TABLE HoaDon (
    id INT PRIMARY KEY,
    ngay_tao DATE,
    khach_hang_id INT
);

-- Tạo bảng Chi tiết hóa đơn
CREATE TABLE ChiTietHoaDon (
    id INT PRIMARY KEY,
    hoa_don_id INT,
    san_pham_id INT,
    so_luong INT,
    gia_ban DECIMAL(10, 2)
);

-- Tạo bảng Doanh thu
--CREATE TABLE DoanhThu (
--	id INT PRIMARY KEY,
--	ngay DATE,
--	doanh_thu DECIMAL(10, 2) NOT NULL
--);
alter table KhachHang
add constraint fk_idTaikhoan FOREIGN KEY (tai_khoan_id) REFERENCES TaiKhoan(id)
alter table SanPham
add constraint fk_idLoaisp FOREIGN KEY (loai_san_pham_id) REFERENCES LoaiSanPham(id)
alter table NhanVien
add constraint fk_id_tkNhanvien FOREIGN KEY (tai_khoan_id) REFERENCES TaiKhoan(id)
alter table HoaDon
add constraint fk_id_Khachhang FOREIGN KEY (khach_hang_id) REFERENCES KhachHang(id)
alter table ChiTietHoaDon
add constraint fk_idHoadon FOREIGN KEY (hoa_don_id) REFERENCES HoaDon(id)
alter table ChiTietHoaDon
add constraint fk_idSanpham FOREIGN KEY (san_pham_id) REFERENCES SanPham(id)