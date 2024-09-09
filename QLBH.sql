Create database qlbh

use qlbh
create table NhomHang
(
	Manhom int primary key not null,
	Tennhom nvarchar(20) not null
)

insert into NhomHang values(1, 'Dien Tu');
insert into NhomHang values(2, 'Gia Dung');
insert into NhomHang values(3, 'Dung Cu Gia Dinh');
insert into NhomHang values(4, 'Cac Mat Hang Khac');

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

insert into NhaCungCap values(1,'Cong ty TNHH Nam Phuong','1 Le Loi Phuong 4 Quan Go Vap',
'083843456',32343434,'NamPhuong@yahoo.com');
insert into NhaCungCap values(2,'Cong Ty Lan Ngoc','12 Cao Ba Quat Quan 1 Tp Ho Chi Minh',
'086234567',83434355,'LanNgoc@gmail.com');

Select * from NhaCungCap

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
insert into SanPham values(1,'May Tinh', 'Cai',7000.0000,100,1,1,'May Sony Ram 2GB');
insert into SanPham values(2,'Ban phim','Cai', 1000.0000,50,1,1,'Ban phim 101 phim');
insert into SanPham values(3,'Chuot','Cai',800.0000,150,1,1,'Chuot khong day');
insert into SanPham values(4,'CPU','Cai',3000.0000,200,1,1,'CPU');
insert into SanPham values(5,'USB','Cai',500.0000,100,1,1,'8GB');
insert into SanPham values(6,'Lo Vi Song','Cai',1000000.0000,20,3,2);

Select * From SanPham