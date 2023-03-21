create database qlda2
on primary 
(
  size = 20MB
  ,filegrowth = 1MB
  ,maxsize = 500MB
  ,filename = 'C:\new\qlda2_data.mdf'
  ,name = qlda2_data
)
log on 
(
  size = 2MB
  ,filegrowth = 10%
  ,maxsize = 48mb
  ,filename = 'C:\new\qlda2_log.ldf'
  ,name = qlda2_log
)
use qlda2
go
create table nhanvien
(
manv varchar(9) primary key,
honv nvarchar(15) not null,
tenlot nvarchar(30) not null,
tennv nvarchar(30) not null,
ngsinh smalldatetime not null,
diachi nvarchar(150) not null,
phai nvarchar(3) not null,
luong numeric(18,0)  null,
phong varchar(2) not null
)

create table phancong
(
manv varchar(9),
mada varchar(2),
thoigian numeric(18,0) not null
primary key (manv,mada)
)
create table dean
(
mada varchar(2) primary key,
tenda nvarchar(50) not null,
ddiemda varchar(20) not null
)
create table phongban
(
maphg varchar(2) primary key,
tenphg nvarchar(20) not null
)
create table thannhan
(
manv varchar(9),
tentn varchar(20),
ngaysinh smalldatetime not null,
phai varchar(3)not null,
quanhe varchar(15) not null,
primary key (manv,tentn)
)


alter table phancong
add constraint phancong_manv_FK FOREIGN KEY (manv) REFERENCES nhanvien(manv),
constraint phancong_mada_FK FOREIGN KEY (mada) REFERENCES dean(mada)

alter table nhanvien
add constraint nhanvien_phong_FK FOREIGN KEY (phong) REFERENCES phongban(maphg)

alter table thannhan
add constraint thannhan_manv_FK FOREIGN KEY (manv) REFERENCES nhanvien(manv)


alter table phongban
alter column tenphg nvarchar(30)

alter table dean
alter column ddiemda nvarchar(20)

alter table thannhan
alter column tentn nvarchar(20)

alter table nhannhan
alter column phai nvarchar(3)

alter table thannhan
alter column quanhe nvarchar(15)

alter table nhanvien
alter column sodienthoai varchar(15)

alter table nhanvien
drop column nhanvien 


insert into nhanvien(manv,honv,tenlot,tennv,ngsinh,diachi,phai,luong,phong)
values ('123',N'Đinh',N'Bá',N'Tiến','1982-02-27',N'Mộ Đức',N'Nam',null,'4')
insert into nhanvien(manv,honv,tenlot,tennv,ngsinh,diachi,phai,luong,phong)
values('234',N'Nguyễn',N'Thanh',N'Tùng','1956-08-12',N'Sơn Tịnh',N'Nam',null,'5')
insert into nhanvien(manv,honv,tenlot,tennv,ngsinh,diachi,phai,luong,phong)
values('345',N'Bùi',N'Thúy',N'Vũ',null,N'Tư Nghĩa',N'Nữ',null,'4')
insert into nhanvien(manv,honv,tenlot,tennv,ngsinh,diachi,phai,luong,phong)
values('456',N'Lê',N'Thị',N'Nhàn','1962-07-12',N'Mộ Đức',N'Nữ',null,'4')
insert into nhanvien(manv,honv,tenlot,tennv,ngsinh,diachi,phai,luong,phong)
values('567',N'Nguyễn',N'Mạnh',N'Hùng','1985-03-25',N'Sơn Tịnh',N'Nam',null,'5')
insert into nhanvien(manv,honv,tenlot,tennv,ngsinh,diachi,phai,luong,phong)
values('678',N'Trần',N'Hồng',N'Quan',null,N'Bình Sơn',N'Nam',null,'5')
insert into nhanvien(manv,honv,tenlot,tennv,ngsinh,diachi,phai,luong,phong)
values('789',N'Trần',N'Thanh',N'Tâm','1972-06-17',N'TP Quảng Ngãi',N'Nam',null,'5')
insert into nhanvien(manv,honv,tenlot,tennv,ngsinh,diachi,phai,luong,phong)
values('890',N'Cao',N'Thanh',N'Huyền',null,N'Tư Nghã',N'Nữ',null,'1')
insert into nhanvien(manv,honv,tenlot,tennv,ngsinh,diachi,phai,luong,phong)
values('901',N'Vương',N'Ngọc',N'Quyền','1987-12-12',N'Mộ Đức',N'Nam',null,'1')

insert into phongban (maphg,tenphg)
values('1',N'Quản lý')
insert into phongban (maphg,tenphg)
values('4',N'Điều hành')
insert into phongban (maphg,tenphg)
values('5',N'Nghiên cứu')

insert dean (mada,tenda,ddiemda)
values('1',N'Nâng cao chất lượng muối',N'Sa Huỳnh')
insert dean (mada,tenda,ddiemda)
values('10',N'Xây dựng nhà máy chế biến thủy sản',N'Dung Quất')
insert dean (mada,tenda,ddiemda)
values('2',N'Phát triển hạ tầng mạng',N'TP Quảng Ngãi')
insert dean (mada,tenda,ddiemda)
values('20',N'Truyền tải cáp quang',N'TP Quảng Ngãi')
insert dean (mada,tenda,ddiemda)
values('3',N'Tin học hóa trường học',N'Ba tơ')
insert dean (mada,tenda,ddiemda)
values('30',N'Đào tạo nhân lực',N'Tịnh Phong')

insert phancong(manv,mada,thoigian)
values('123','1','33')
insert phancong(manv,mada,thoigian)
values('123','2','8')
insert phancong(manv,mada,thoigian)
values('345','10','10')
insert phancong(manv,mada,thoigian)
values('345','20','10')
insert phancong(manv,mada,thoigian)
values('345','3','10')
insert phancong(manv,mada,thoigian)
values('456','1','20')
insert phancong(manv,mada,thoigian)
values('456','2','20')
insert phancong(manv,mada,thoigian)
values('678','3','40')
insert phancong(manv,mada,thoigian)
values('789','10','35')
insert phancong(manv,mada,thoigian)
values('789','20','30')
insert phancong(manv,mada,thoigian)
values('789','30','5')

insert thannhan(manv,tentn,ngaysinh,phai,quanhe)
values('123',N'Châu','2005-10-30',N'Nữ',N'Con gái')
insert thannhan(manv,tentn,ngaysinh,phai,quanhe)
values('123',N'Duy','2001-10-25',N'Nam',N'Con trai')
insert thannhan(manv,tentn,ngaysinh,phai,quanhe)
values('123',N'Phương','1985-10-30',N'Nữ',N'Vợ chồng')
insert thannhan(manv,tentn,ngaysinh,phai,quanhe)
values('234',N'Thanh','1980-04-05',N'Nữ',N'Con gái')
insert thannhan(manv,tentn,ngaysinh,phai,quanhe)
values('345',N'Dương','1956-10-30',N'Nam',N'Vợ chồng')
insert thannhan(manv,tentn,ngaysinh,phai,quanhe)
values('345',N'Khang','25/10/1982',N'Nam',N'Con trai')
insert thannhan(manv,tentn,ngaysinh,phai,quanhe)
values('456',N'Hùng','1987-01-01',N'Nam',N'Con trai')
insert thannhan(manv,tentn,ngaysinh,phai,quanhe)
values('901',N'Thương','1989-04-05',N'Nữ',N'Vợ chồng')