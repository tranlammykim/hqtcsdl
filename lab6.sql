use QLBanHang
--cau1--
go
create function sp1(@sanpham nvarchar(10))
returns table
as 
return 
(
select*from Sanpham
)
go
select *from sp1(01)

--cau2--
CREATE FUNCTION DSSP (@x int, @y int)
RETURNS TABLE RETURN
SELECT Tenhang, tensp, soluongX
FROM Xuat INNER JOIN Sanpham ON Xuat.Masp = Sanpham.masp INNER JOIN Hangsx ON Sanpham.mahangsx = Hangsx.Mahangsx
WHERE YEAR(Ngayxuat) BETWEEN @x AND @y
GO
SELECT * FROM DSSP(2019, 2020)

--cau3--
CREATE FUNCTION LuaChon(@luachon int)
RETURNS @bang TABLE (tensp nvarchar(20), masp nvarchar(10),tenhang nvarchar(20), Soluong int)
AS
BEGIN
	IF @luachon = 0
	BEGIN
		INSERT INTO @bang 
			SELECT tensp, Sanpham.masp, tenhang, Soluong FROM Sanpham INNER JOIN Hangsx ON Sanpham.mahangsx = Hangsx.mahangsx
			WHERE soluong < 0
	END
	IF @luachon = 1
	BEGIN
		INSERT INTO @bang
			SELECT tensp, Sanpham.masp, tenhang, Soluong FROM Sanpham INNER JOIN Hangsx ON Sanpham.mahangsx = Hangsx.mahangsx
			WHERE soluong > 0
	END
	RETURN
END

--cau4--
CREATE FUNCTION ThongTinNV (@Phong nvarchar(30))
RETURNS TABLE RETURN
SELECT Tennv FROM Nhanvien
WHERE Nhanvien.Phong = @Phong
GO
SELECT *FROM ThongTinNV ('Vat tu')

--cau6--
CREATE FUNCTION DSXuat (@x int, @y int)
RETURNS TABLE RETURN
SELECT Tenhang, tensp, soluongX
FROM Xuat INNER JOIN Sanpham ON Xuat.Masp = Sanpham.masp INNER JOIN Hangsx ON Sanpham.mahangsx = Hangsx.Mahangsx
WHERE YEAR(Ngayxuat) BETWEEN @x AND @y
GO
SELECT * FROM DSXuat(2019, 2020)

--cau7--
go
CREATE FUNCTION dsluachon(@luachon int, @tenhang nvarchar(50))
RETURNS @bang TABLE (tensp nvarchar(20))
AS
BEGIN
	IF @luachon = 0
	BEGIN
		INSERT INTO @bang 
		SELECT tensp FROM sanpham 
		inner join nhap on sanpham.masp=nhap.masp	
		inner join hangsx on sanpham.mahangsx=hangsx.mahangsx
		where tenhang=@tenhang
	END
	IF @luachon = 1
	BEGIN
		INSERT INTO @bang  
			SELECT tensp FROM sanpham 
			inner join xuat on sanpham.masp=xuat.masp
			inner join hangsx on sanpham.mahangsx=hangsx.mahangsx
			where tenhang=@tenhang
	END
	RETURN
END
go
select* from dsluachon(1,'Samsung')

--cau8--
CREATE FUNCTION NVNhap (@x int)
RETURNS TABLE RETURN
SELECT Nhanvien.Manv, Tennv, Phong
FROM Nhanvien INNER JOIN Nhap ON Nhanvien.Manv = Nhap.Manv
WHERE DAY(Ngaynhap) = @x
GO
SELECT * FROM NVNhap (22) 



