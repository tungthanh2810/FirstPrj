Create database qlbh

--Cau 1. Tao bang
use qlbh
create table NhomHang
(
	Manhom int primary key not null,
	Tennhom nvarchar(20) not null
)

insert into NhomHang values(1, N'Điện Tử');
insert into NhomHang values(2, N'Gia Dụng');
insert into NhomHang values(3, N'Dụng Cụ Gia Đình');
insert into NhomHang values(4, N'Các Mặt Hàng Khác');

Select * FROM NhomHang

use qlbh 
create table NhaCungCap
(
	Mancc int Primary key not null,
	TenNcc nvarchar(50),
	Diachi nvarchar(100),
	Phone nchar(10),
	SoFax int,
	DCMail nvarchar(100)
)

insert into NhaCungCap values(1,N'Công ty TNHH Nam Phương', N'1 Le Lợi Phường 4 Quận Gò Vấp',
'083843456',32343434,'NamPhuong@yahoo.com');
insert into NhaCungCap values(2,N'Công Ty Lan Ngọc','12 Cao Bá Quát Quận 1 Tp Hồ Chí Minh',
'086234567',83434355,'LanNgoc@gmail.com');

Select * from NhaCungCap

use qlbh 
create table SanPham
(
	Masp int PRIMARY KEY NOT NULL,
	Tensp nvarchar(50),
	DonViTinh nvarchar(10),
	GiaGoc Money,
	SlTon int,
	Manhom int,
	MaNCC int,
	MoTa nvarchar(100)
)
insert into SanPham values(1,N'Máy Tinh', N'Cái',7000.0000,100,1,1,N'Máy Sony Ram 2GB');
insert into SanPham values(2,'Ban phim',N'Cái', 1000.0000,50,1,1,N'Bàn phím 101 phim');
insert into SanPham values(3,N'Chuột',N'Cái',800.0000,150,1,1,N'Chuột không dây');
insert into SanPham values(4,'CPU',N'Cái',3000.0000,200,1,1,'CPU');
insert into SanPham values(5,'USB',N'Cái',500.0000,100,1,1,'8GB');
insert into SanPham values(6,N'Lò Vi Sóng',N'Cái',1000000.0000,20,3,2,NULL);
insert into SanPham values(0,N'Sản Phẩm lỗi',N'Cái',100,10,4,2,N'Cần vứt');

Select * From SanPham

use qlbh 
create table KhachHang 
(
	Makh nchar(10) PRIMARY KEY NOT NULL,
	Tenkh nvarchar(50),
	Diachi nvarchar(50),
	Dienthoai nchar(10),
	LoaiKH nchar(5),
	SoFax nchar(20),
	DCMail nvarchar(30),
	DiemTL int
)
insert into KhachHang values('KH1',N'Nguyễn Thu Hằng',N'12 Nguyễn Du',NULL,'VL',NULL,NULL,NULL);
insert into KhachHang values('KH2',N'Lê Minh',N'34 Điện Biên Phủ','TV','VL',NULL,'LeMinh@yahoo.com',NULL);
insert into KhachHang values('KH3',N'Nguyễn Minh Trung',N'3 Lê Lợi Gò Vấp','VIP','VL',NULL,'Trung@gmail.com',NULL);
Select * from KhachHang

use qlbh 
create table HoaDon
(
	Mahd int PRIMARY KEY NOT NULL,
	NgayLap Datetime,
	Makh nchar(10),
	NgayGiao Datetime,
	NoiChuyen nvarchar(50)
)

insert into HoaDon values(1,2015/09/30,'KH1',2015/10/05,N'Cửa hàng ABC 3 Lý Chính Thắng Quận 3');
insert into HoaDon values(2,2015/07/29,'KH2',2015/8/10,N'23 Lê Lợi Quận Gò Vấp');
insert into HoaDon values(3,2015/10/01,'KH3',2015/10/01,N'2 Nguyễn Du Quận Gò Vấp');
Select * from HoaDon

use qlbh 
create table CT_HoaDon
(
	Mahd int,
	Masp int,
	Dongia Money,
	Soluong int,
	PRIMARY KEY(Mahd, Masp)
)
insert into CT_HoaDon values(1,1,8000.000,5);
insert into CT_HoaDon values(1,2,1200.000,4);
insert into CT_HoaDon values(1,3,1000.000,15);
insert into CT_HoaDon values(2,2,1200.000,9);
insert into CT_HoaDon values(2,4,800.000,5);
insert into CT_HoaDon values(3,2,3500.000,20);
insert into CT_HoaDon values(3,3,1000.000,15);
select * from CT_HoaDon
drop table CT_HoaDon

--Cau 2: update
--a: Tang gia ban len 2% neu san pham co ma = 2
Update CT_HoaDon
SET Dongia = Dongia*1.05  
WHERE Mahd = 2;
select * from CT_HoaDon

--b: Tang sluong ton len 100 nhom mat hang bang 3 cua nha cung cap co ma = 2
Update SanPham
SET SlTon = 100
WHERE Manhom = 3 AND MaNCC = 2; 
select * from SanPham

--c: Cập nhật cột mô tả tùy ý cho Lò Vi Sóng
UPDATE SanPham
SET MoTa = N'Thiết kế thông minh hiện đại'
WHERE Tensp = N'Lò Vi Sóng';
select * from SanPham

/*
Trên bảng KhachHang, cập nhật mã khách hàng ‘KH3’ thành ‘VI003’
HD : Đọc và hiểu thông báo lỗi khi thực hiện câu lệnh update trên
MaKH trên bảng Khachhang. Để cập nhật thành công, hãy tạm thời
gỡ bỏ tham chiếu bằng cách sửa MaKH là NULL tại dòng có giá trị
‘KH3’ trên bảng Hoadon.
*/

update HoaDon
SET Makh = NULL
Where Makh = 'KH3';

update KhachHang
SET Makh = 'VI003'
Where Makh = 'KH3';

update HoaDon
SET Makh = 'VI003'
Where Makh is NULL;
SELECT * FROM KhachHang;
SELECT * FROM HoaDon;


alter table HoaDon
drop constraint fk_HoaDon_KhachHang;

UPDATE KhachHang
SET MaKH = 'VL001'
WHERE MaKH = 'KH1';

UPDATE KhachHang
SET MaKH = 'T0002'
WHERE MaKH = 'KH2';


update HoaDon
SET Makh = 'VL001'
Where Makh = 'KH1';


update HoaDon
SET Makh = 'T0002'
Where Makh = 'KH2';

Alter table HoaDon
add constraint fk_HoaDon_KhachHang
Foreign Key (MaKH)
References KhachHang (MaKH)
On update cascade;


--Cau 3 delete
--a: Xoa dong co trong NhomHang4
DELETE from SanPham WHERE Manhom = 4;
select * from SanPham

--b: Xóa dòng trong CT_Hoadon có MaHD là 1 và MaSP là 3
Delete from CT_HoaDon WHERE Mahd = 1 AND Masp = 3;
select * from CT_HoaDon

/*
c: Xóa dòng trong bảng HoaDon có mã là 1
HD : Đọc và hiểu thông báo lỗi khi thực hiện xóa dòng có mã là 1
trong bảng HoaDon. Để xóa thành công, hãy xóa các dòng trong
CT_Hoadon có tham chiếu tới (có MaHD = 1) , sau đó thực hiện xóa
dòng trong bảng HoaDon
*/

update CT_HoaDon
Set Mahd = NULL
WHere Mahd = 1;
delete from HoaDon where Mahd = 1;
update CT_HoaDon
Set Mahd = 1
WHere Mahd is NULL;
select * from HoaDon

/*
d: Tương tự , xóa dòng trong bảng HoaDon có mã là 2
HD : Thiết lập lại ràng buộc khóa ngoại trên bảng CT_HoaDon để
cho phép khi xóa dòng trên bảng HoaDon thì tự động xóa các dòng
trong CT_HoaDon mà có tham chiếu đến dòng đang xóa trong
HoaDon.
*/

DELETE FROM HoaDon
WHERE MaHD = 2;

ALTER TABLE CT_HoaDon
DROP CONSTRAINT FK_CT_HoaDon_HoaDon;
sp_helpconstraint HoaDon

ALTER TABLE CT_HoaDon
ADD CONSTRAINT FK_CT_HoaDon_HoaDon
FOREIGN KEY (MaHD) REFERENCES HoaDon(MaHD)
ON DELETE CASCADE;