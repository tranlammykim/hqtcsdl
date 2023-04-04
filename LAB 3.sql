use QLBanHang
go
--1--
select tenhang, COUNT(*) as N'tổng sản phẩm'
from Hangsx, Sanpham
group by tenhang

--2--
select Masp, sum(soluongN*dongiaN) AS 'Tổng tiền Nhập' from Nhap
where year(Ngaynhap)=2018
group by Masp

--3--
select Xuat.Masp, Sanpham.mahangsx, soluongX, tensp, Ngayxuat
from Xuat
JOIN Sanpham ON Xuat.Masp = Sanpham.masp
JOIN Hangsx ON Sanpham.mahangsx = Hangsx.Mahangsx
where YEAR(Ngayxuat) = 2018 AND soluongX>1000 AND Tenhang = 'Samsung'

--4--
select Phong, COUNT(*) as N'Tổng nhân viên nam'
from Nhanvien
where gioitinh=N'Nam'
group by Phong

--5--
select Tenhang, tensp, soluongN
from Nhap
JOIN Sanpham ON Nhap.Masp = Sanpham.masp
JOIN Hangsx ON Sanpham.mahangsx = Hangsx.Mahangsx
where YEAR(Ngaynhap) = 2018
group by Tenhang, tensp, soluongN

--6--
select Sohdx, Nhanvien.Manv, soluongX
from Xuat
JOIN Nhanvien ON Xuat.Manv = Nhanvien.Manv
where YEAR(Ngayxuat) = 2018
group by Sohdx, Nhanvien.Manv, soluongX

--7--
select Sohdn, Nhanvien.Manv, soluongN, dongiaN, Ngaynhap, tiennhap=soluongN*dongiaN
from Nhap INNER JOIN Nhanvien ON Nhap.Manv = Nhanvien.Manv
where YEAR(Ngaynhap) = 2018 AND MONTH(Ngaynhap) = 8 AND dongiaN>100000
group by Sohdn, Nhanvien.Manv, soluongN, dongiaN, Ngaynhap

--8--
select *from Nhap where Nhap.Masp NOT IN(select Xuat.Masp from Xuat)

--9--
select Nhap.Masp, Ngaynhap, Ngayxuat, dongiaN
from Nhap INNER JOIN Xuat ON Nhap.Masp = Xuat.Masp
where YEAR(Ngaynhap) = 2018 AND YEAR(Ngayxuat) = 2018

--10--
select Manv, Tennv from Nhanvien
where EXISTS(select *from Nhap INNER JOIN Xuat ON Nhap.Manv = Xuat.Manv AND Nhap.Manv = Nhanvien.Manv)

--11--
select Manv, Tennv from Nhanvien
where NOT EXISTS(select *from Nhap INNER JOIN Xuat ON Nhap.Manv = Xuat.Manv AND Nhap.Manv = Nhanvien.Manv)