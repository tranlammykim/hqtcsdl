--LAB 3--
go
create view View1 as
select tenhang, COUNT(*) as N'tổng sản phẩm'
from Hangsx, Sanpham
group by tenhang
GO
select*from view1;
go

go
create view view2 as
select Masp, sum(soluongN*dongiaN) AS 'Tổng tiền Nhập' from Nhap
where year(Ngaynhap)=2018
group by Masp
go
select*from view2;
go 

go 
create view view3 as
select Xuat.Masp, Sanpham.mahangsx, soluongX, tensp, Ngayxuat
from Xuat
JOIN Sanpham ON Xuat.Masp = Sanpham.masp
JOIN Hangsx ON Sanpham.mahangsx = Hangsx.Mahangsx
where YEAR(Ngayxuat) = 2018 AND soluongX>1000 AND Tenhang = 'Samsung'
go 
select*from view3;
go

go 
create view view4 as
select Phong, COUNT(*) as N'Tổng nhân viên nam'
from Nhanvien
where gioitinh=N'Nam'
group by Phong
go
select*from view4;
go 

go 
create view view5 as
select Tenhang, tensp, soluongN
from Nhap
JOIN Sanpham ON Nhap.Masp = Sanpham.masp
JOIN Hangsx ON Sanpham.mahangsx = Hangsx.Mahangsx
where YEAR(Ngaynhap) = 2018
group by Tenhang, tensp, soluongN
go 
select*from view5;
go

go 
create view view6 as
select Sohdx, Nhanvien.Manv, soluongX
from Xuat
JOIN Nhanvien ON Xuat.Manv = Nhanvien.Manv
where YEAR(Ngayxuat) = 2018
group by Sohdx, Nhanvien.Manv, soluongX
go 
select*from view6;
go

go 
create view view7 as
select Sohdn, Nhanvien.Manv, soluongN, dongiaN, Ngaynhap, tiennhap=soluongN*dongiaN
from Nhap INNER JOIN Nhanvien ON Nhap.Manv = Nhanvien.Manv
where YEAR(Ngaynhap) = 2018 AND MONTH(Ngaynhap) = 8 AND dongiaN>100000
group by Sohdn, Nhanvien.Manv, soluongN, dongiaN, Ngaynhap
go 
select*from view7;
go

go 
create view view8 as
select *from Nhap where Nhap.Masp NOT IN(select Xuat.Masp from Xuat)
go 
select*from view8;
go

go 
create view view9 as
select Nhap.Masp, Ngaynhap, Ngayxuat, dongiaN
from Nhap INNER JOIN Xuat ON Nhap.Masp = Xuat.Masp
where YEAR(Ngaynhap) = 2018 AND YEAR(Ngayxuat) = 2018
go 
select*from view9;
go

go 
create view view10 as
select Manv, Tennv from Nhanvien
where EXISTS(select *from Nhap INNER JOIN Xuat ON Nhap.Manv = Xuat.Manv AND Nhap.Manv = Nhanvien.Manv)
go 
select*from view10;
go 

go 
create view view11 as
select Manv, Tennv from Nhanvien
where NOT EXISTS(select *from Nhap INNER JOIN Xuat ON Nhap.Manv = Xuat.Manv AND Nhap.Manv = Nhanvien.Manv)
go
select*from view11;
go


go
drop view View1 
select tenhang, COUNT(*) as N'tổng sản phẩm'
from Hangsx, Sanpham
group by tenhang
GO


go
drop view view2 
select Masp, sum(soluongN*dongiaN) AS 'Tổng tiền Nhập' from Nhap
where year(Ngaynhap)=2018
group by Masp
go

go 
drop view view3 
select Xuat.Masp, Sanpham.mahangsx, soluongX, tensp, Ngayxuat
from Xuat
JOIN Sanpham ON Xuat.Masp = Sanpham.masp
JOIN Hangsx ON Sanpham.mahangsx = Hangsx.Mahangsx
where YEAR(Ngayxuat) = 2018 AND soluongX>1000 AND Tenhang = 'Samsung'
go

go 
drop view view4
select Phong, COUNT(*) as N'Tổng nhân viên nam'
from Nhanvien
where gioitinh=N'Nam'
group by Phong
go

go 
drop view view5
select Tenhang, tensp, soluongN
from Nhap
JOIN Sanpham ON Nhap.Masp = Sanpham.masp
JOIN Hangsx ON Sanpham.mahangsx = Hangsx.Mahangsx
where YEAR(Ngaynhap) = 2018
group by Tenhang, tensp, soluongN
go 


go 
drop view view6
select Sohdx, Nhanvien.Manv, soluongX
from Xuat
JOIN Nhanvien ON Xuat.Manv = Nhanvien.Manv
where YEAR(Ngayxuat) = 2018
group by Sohdx, Nhanvien.Manv, soluongX
go 


go 
drop view view7 
select Sohdn, Nhanvien.Manv, soluongN, dongiaN, Ngaynhap, tiennhap=soluongN*dongiaN
from Nhap INNER JOIN Nhanvien ON Nhap.Manv = Nhanvien.Manv
where YEAR(Ngaynhap) = 2018 AND MONTH(Ngaynhap) = 8 AND dongiaN>100000
group by Sohdn, Nhanvien.Manv, soluongN, dongiaN, Ngaynhap
go 

go
drop view view8
select *from Nhap where Nhap.Masp NOT IN(select Xuat.Masp from Xuat)
go 


go 
drop view view9 
select Nhap.Masp, Ngaynhap, Ngayxuat, dongiaN
from Nhap INNER JOIN Xuat ON Nhap.Masp = Xuat.Masp
where YEAR(Ngaynhap) = 2018 AND YEAR(Ngayxuat) = 2018
go 


go 
drop view view10
select Manv, Tennv from Nhanvien
where EXISTS(select *from Nhap INNER JOIN Xuat ON Nhap.Manv = Xuat.Manv AND Nhap.Manv = Nhanvien.Manv)
go 


go 
drop view view11 
select Manv, Tennv from Nhanvien
where NOT EXISTS(select *from Nhap INNER JOIN Xuat ON Nhap.Manv = Xuat.Manv AND Nhap.Manv = Nhanvien.Manv)
go
