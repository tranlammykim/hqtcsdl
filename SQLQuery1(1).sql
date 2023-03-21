create database quanlydean
on primary 
(
  size = 20MB
  ,filegrowth = 1MB
  ,maxsize = 1000MB
  ,filename = 'C:\TranLamMyKim\quanlydean_data.mdf'
  ,name = quanlydean_data
)
log on 
(
  size = 6MB
  ,filegrowth = 5%
  ,maxsize = 20mb
  ,filename = 'C:\TranLamMyKim\quanlydean_data.mdf'
  ,name = quanlydean_log
)
use quanlydean
go
create table PHANCONG
( 
MaNV varchar(9) NOT NULL,
MaDA varchar(2) NOT NULL,
ThoiGian numeric(18,0) NULL,
PRIMARY KEY (MaNV,MaDA),
)
GO
create table DEAN
(
MaDA varchar(2) PRIMARY KEY,
TenDA nvarchar(50) NULL,
DDiemDA varchar (20) NULL,
)
GO
create table PHONGBAN
(
MaPhg varchar(20) PRIMARY KEY,
TenPhog nvarchar(30) NULL,
)
GO
create table THANNHAN
(
MaNV varchar(9) NOT NULL,
TenTN varchar(20) NOT NULL,
NgaySinh smalldatetime NULL,
Phai Nvarchar(3) NOT NULL,
QuanHe Nvarchar(15) NOT NULL,
PRIMARY KEY (MaNV,TenTN),
)
GO
create table NHANVIEN 
(
MaNV varchar(9) PRIMARY KEY,
HoNV nvarchar(15) NOT NULL,
TenLot nvarchar(30) NOT NULL,
TenNV nvarchar(30) NOT NULL,
NgSinh smalldatetime NOT NULL,
DiaChi nvarchar(150) NOT NULL,
Phai nvarchar(3) NOT NULL,
Luong numeric (18,0) NOT NULL,
Phong varchar(2) NOT NULL,
)
GO
alter table PHANCONG
add constraint PHANCONG_MaNV_FK FOREIGN KEY (MANV) REFERENCES NHANVIEN(MaNV),
constraint PHANCONG_MaDA_FK FOREIGN KEY (MaDA) REFERENCES DEAN(MaDA)

alter table NHANVIEN
add constraint NHANVIEN_Phong_FK FOREIGN KEY (Phong) REFERENCES PHONGBAN(MaPhg)

alter table THANNHAN
add constraint THANNHAN_MaNV_FK FOREIGN KEY (MaNV) REFERENCES NHANVIEN(MaNV)


alter table PHONGBAN
alter column TenPhg nvarchar(30)

alter table DEAN
alter column DDiemDa nvarchar(20)

alter table THANNHAN
alter column TenTN nvarchar(20)

alter table NHANVIEN
alter column Phai nvarchar(3)

alter table THANNHAN
alter column QuanHe nvarchar(15)


insert into NHANVIEN
values ('123','Đinh','Bá','Tiến','1982-02-27','Mộ Đức','Nam',null,'4')
insert into NHANVIEN
values('234','Nguyễn','Thanh','Tùng','1956-08-12','Sơn Tịnh','Nam',null,'5')
insert into NHANVIEN
values('345','Bùi','Thúy','Vũ',null,'Tư Nghĩa','Nữ',null,'4')
insert into NHANVIEN
values('456','Lê','Thị','Nhàn','1962-07-12','Mộ Đức','Nữ',null,'4')
insert into NHANVIEN
values('567','Nguyễn','Mạnh','Hùng','1985-03-25','Sơn Tịnh','Nam',null,'5')
insert into nhanvien
values('678','Trần','Hồng','Quan',null,'Bình Sơn','Nam',null,'5')
insert into NHANVIEN
values('789','Trần','Thanh','Tâm','1972-06-17','TP Quảng Ngãi','Nam',null,'5')
insert into NHANVIEN
values('890','Cao','Thanh','Huyền',null,'Tư Nghã','Nữ',null,'1')
insert into NHANVIEN
values('901','Vương','Ngọc','Quyền','1987-12-12','Mộ Đức','Nam',null,'1')

insert into PHONGBAN
values('1','Quản lý')
insert into PHONGBAN
values('4','Điều hành')
insert into PHONGBAN
values('5','Nghiên cứu')

insert DEAN(MaDA,TenDA,DDiemDA)
values('1',N'Nâng cao chất lượng muối',N'Sa Huỳnh')
insert DEAN(MaDA,TenDA,DDiemDA)
values('10',N'Xây dựng nhà máy chế biến thủy sản',N'Dung Quất')
insert DEAN(MaDA,TenDA,DDiemDA)
values('2',N'Phát triển hạ tầng mạng',N'TP Quảng Ngãi')
insert DEAN(MaDA,TenDA,DDiemDA)
values('20',N'Truyền tải cáp quang',N'TP Quảng Ngãi')
insert DEAN(MaDA,TenDA,DDiemDA)
values('3',N'Tin học hóa trường học',N'Ba tơ')
insert DEAN(MaDA,TenDA,DDiemDA)
values('30',N'Đào tạo nhân lực',N'Tịnh Phong')

insert PHANCONG
values('123','1','33')
insert PHANCONG
values('123','2','8')
insert PHANCONG
values('345','10','10')
insert PHANCONG
values('345','20','10')
insert PHANCONG
values('345','3','10')
insert PHANCONG
values('456','1','20')
insert PHANCONG
values('456','2','20')
insert PHANCONG
values('678','3','40')
insert PHANCONG
values('789','10','35')
insert PHANCONG
values('789','20','30')
insert PHANCONG
values('789','30','5')

insert THANNHAN
values('123','Châu','30/10/2005','Nữ','Con gái')
insert THANNHAN
values('123','Duy','25/10/2001','Nam','Con trai')
insert THANNHAN
values('123','Phương','30/10/1985','Nữ','Vợ chồng')
insert THANNHAN
values('234','Thanh','05/04/1980','Nữ','Con gái')
insert THANNHAN
values('345','Dương','30/10/1956','Nam','Vợ chồng')
insert THANNHAN
values('345','Khang','25/10/1982','Nam','Con trai')
insert THANNHAN
values('456','Hùng','01/01/1987','Nam','Con trai')
insert THANNHAN
values('901','Thương','05/04/1989','Nữ','Vợ chồng')