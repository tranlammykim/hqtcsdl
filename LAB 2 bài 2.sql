--1--
use database QLBanHang
go
select * from Sanpham
select * from Hangsx
select * from Nhanvien
select * from Nhap
select * from Xuat

--2--
SELECT masp, tensp, tenhang, soluong, mausac, giaban, donvitinh, mota
FROM Sanpham inner join Hangsx ON Sanpham.mahangsx = Hangsx.Mahangsx
ORDER BY giaban DESC

--3--
SELECT masp, Tenhang, tensp, soluong, mausac, giaban
FROM Sanpham inner join Hangsx ON Sanpham.mahangsx = Hangsx.Mahangsx
WHERE Hangsx.Tenhang='Samsung'

--4--
SELECT *FROM Nhanvien 
WHERE Nhanvien.gioitinh=N'Nữ'and Phong=N'Kế toán'

--5--
select sohdn, sanpham.masp, tensp, tenhang, soluongN, dongiaN, soluongN*dongiaN as tiennhap, mausac, donvitinh, ngaynhap, tennv,phong 
from nhap
join sanpham on nhap.masp = sanpham.masp
join hangsx on sanpham.mahangsx =hangsx.mahangsx
join nhanvien on nhap.manv = nhanvien.manv
order by nhap.sohdn ASC

--6--
select sohdx, sanpham.masp, tensp, tenhang, soluongx, giaban, tienxuat=soluongx*giaban, mausac, donvitinh, ngayxuat,tennv, phong
from xuat
inner join sanpham on xuat.masp = sanpham.masp
inner join hangsx on sanpham.mahangsx = hangsx.mahangsx
inner join nhanvien on xuat.manv = nhanvien.manv
where month(xuat.ngayxuat)= 10 and year(xuat.ngayxuat)= 2018
order by xuat.sohdx desc

--7--
select sohdn, Sanpham.masp, tensp, soluongN, dongiaN, ngaynhap, tennv, phong,tenhang
from nhap, sanpham, nhanvien, Hangsx
where year(ngaynhap)= 2017 and Hangsx.tenhang='Samsung'

--8--
select top 10 *
from Xuat
order by soluongX DESC

--9--
select top 10 * 
from Sanpham
order by giaban DESC

--10--
select *
from sanpham
where giaban between '100000' and '500000'

--11--
select sanpham.tensp, count(soluongN*dongiaN) as tongdoanhthu
from nhap, sanpham
where tensp= 'Samsung'
group by tensp

--12--
select COUNT(*) as N'tong tien'
from xuat 
where year(ngayxuat)=2018 AND day(ngayxuat)=3

--13--
select top 1 dongiaN,sohdn,ngaynhap 
from Nhap 
where Year(ngaynhap)=2018

--14--
select top 10 soluongN,manv,tensp
from Nhap,Sanpham 
order by soluongN DESC

--15-- 
select masp,tensp,manv,tenhang
from Sanpham,Nhanvien,Hangsx
where tenhang=N'SAMSUNG' AND manv='NV01'

--16--
select sohdn,masp,soluongN,ngaynhap,manv
from Nhap
where masp='SP02' AND manv='NV02'

--17--
select tennv,N.manv 
from Nhanvien N join Xuat X on N.manv=X.manv
where year(ngayxuat)=2020 AND month(ngayxuat)=3 AND masp='SP02'