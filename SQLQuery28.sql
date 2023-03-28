create database QLBanHang
go 
use QLBanHang
go 
create table Sanpham
(
masp nchar(10) primary key,
mahangsx nchar(10) not null,
tensp nvarchar(20) not null,
soluong int not null,
mausac nvarchar(20) not null,
giaban money not null,
donvitinh nchar(10) not null,
mota nvarchar(max) not null,
)

create table Hangsx
(
mahangsx nchar(10) primary key,
tenhang nvarchar(20) not null,
diachi nvarchar(30) not null,
sodt nvarchar(20) not null,
email nvarchar(30) not null
)

create table Nhanvien
(
manv nchar(10) primary key,
tennv nvarchar(20) not null,
gioitinh nchar(10) not null,
diachi nvarchar(30) not null,
sodt nvarchar(20) not null,
email nvarchar(30) not null,
Phong nvarchar(30) not null
)

create table Nhap
(
sohdn nchar(10) primary key,
masp nchar(10) not null,
manv nchar(10) not null,
ngaynhap date not null,
soluongN int not null,
dongiaN money not null
)

create table Xuat 
(
sohdx nchar(10) primary key,
masp nchar(10) not null,
manv nchar(10) not null,
ngayxuat date not null,
soluongX int not null,
)

alter table sanpham
add constraint sanpham_mahangsx_FK FOREIGN KEY (mahangsx) REFERENCES hangsx(mahangsx)

alter table nhap
add constraint nhap_masp_fk foreign key (masp) references sanpham(masp),
	constraint nhap_manv_fk foreign key(manv) references nhanvien(manv)

alter table xuat
add constraint xuat_masp_fk foreign key (masp) references sanpham(masp),
	constraint xuat_manv_fk foreign key (manv) references nhanvien(manv)

insert into Sanpham(masp,mahangsx,tensp,soluong,mausac,giaban,donvitinh,mota) 
values('SP01','H02',N'F1 Plus','100',N'Xám','7000000',N'Chiếc',N'Hàng cận cao cấp')
insert into Sanpham(masp,mahangsx,tensp,soluong,mausac,giaban,donvitinh,mota)
values('SP02','H01','Galaxy Node 11','50',N'Đỏ','19000000',N'Chiếc',N'Hàng cao cấp')
insert into Sanpham(masp,mahangsx,tensp,soluong,mausac,giaban,donvitinh,mota)
values('SP03','H02','F3 lite','200',N'Nâu','3000000',N'Chiếc',N'Hàng phổ thông')
insert into Sanpham(masp,mahangsx,tensp,soluong,mausac,giaban,donvitinh,mota)
values('SP04','H03','Vjoy3','200',N'Xám','1500000',N'Chiếc','Hàng phổ thông')
insert into Sanpham(masp,mahangsx,tensp,soluong,mausac,giaban,donvitinh,mota)
values('SP05','H01','Galaxy V21','500',N'Nâu','8000000',N'Chiếc','Hàng cận cao cấp')

insert into Hangsx(mahangsx,tenhang,diachi,sodt,email)
values('H01','Samsung','Korea','11-08271717','ss@gmail.com.kr')
insert into Hangsx(mahangsx,tenhang,diachi,sodt,email)
values('H02','OPPO','China','081-08626262','oppo@gmail.com.cn')
insert into Hangsx(mahangsx,tenhang,diachi,sodt,email)
values('H03','Vinfone',N'Việt Nam','084-098262626','vf@gmail.com.vn')

insert into	Nhanvien(manv,tennv,gioitinh,diachi,sodt,email,phong)
values('NV01',N'Nguyễn Thị Thu',N'Nữ',N'Hà Nội','0982626521','thu@gmail,com',N'Kế toán')
insert into	Nhanvien(manv,tennv,gioitinh,diachi,sodt,email,phong)
values('NV02',N'Lê Văn Nam',N'Nam',N'Bắc Ninh','0972525252','nam@gmail.com',N'Vật tư')
insert into	Nhanvien(manv,tennv,gioitinh,diachi,sodt,email,phong)
values('NV03',N'Trần Hòa Bình',N'Nữ','Hà Nội','0328388388','nb@gamil.com',N'Kế toán')

insert into Nhap(sohdn,masp,manv,ngaynhap,soluongN,dongiaN)
values('N01','SP02','NV01','2019-02-05','10','17000000')
insert into Nhap(sohdn,masp,manv,ngaynhap,soluongN,dongiaN)
values('NO2','SP01','NV02','2020-04-07','30','6000000')
insert into Nhap(sohdn,masp,manv,ngaynhap,soluongN,dongiaN)
values('N03','SP04','NV02','2020-05-17','20','1200000')
insert into Nhap(sohdn,masp,manv,ngaynhap,soluongN,dongiaN)
values('N04','SP01','NV03','2020-03-22','10','6200000')
insert into Nhap(sohdn,masp,manv,ngaynhap,soluongN,dongiaN)
values('N05','SP05','NV01','2020-07-07','20','7000000')

insert into Xuat(sohdx,masp,manv,ngayxuat,soluongX)
values('X01','SP03','NV02','2020-06-14','5')
insert into Xuat(sohdx,masp,manv,ngayxuat,soluongX)
values('X02','SP01','NV03','2019-03-05','3')
insert into Xuat(sohdx,masp,manv,ngayxuat,soluongX)
values('X03','SP02','NV01','2020-12-12','1')
insert into Xuat(sohdx,masp,manv,ngayxuat,soluongX)
values('X04','SP03','NV02','2020-02-06','2')
insert into Xuat(sohdx,masp,manv,ngayxuat,soluongX)
values('X05','SP05','NV01','2020-18-05','1')
