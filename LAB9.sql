use [QLBanHang]
--cau1--
create trigger trg_Nhap
on Nhap
for insert
as
begin
	declare @masp nvarchar(10),@manv nvarchar(10)
	declare @sln int, @dgn float
	select @masp=masp,@manv=manv,@sln=soluongN,@dgn=dongiaN
	from inserted
	if(not exists(select * from sanpham where masp=@masp))
		begin
			raiserror(N'Không tồn tại sản phẩm trong danh mục sản phẩm',16,1)
			rollback transaction
		end
	else 
		if(not exists(select * from nhanvien where manv=@manv))
			begin
				raiserror (N'không tồn tại nhân viên có mã này',16,1)
				rollback transaction
			end
		else
		if(@sln<=0 or @dgn<=0)
			begin
				raiserror (N'Nhập sai số lượng hoặc đơn gia',16,1)
				rollback transaction 
			end
		else
			update Sanpham set soluong =soluong+@sln
			from sanpham where masp=@masp
end

select * from Sanpham 
select * from Nhanvien
select * from Nhap

--Báo lỗi
insert into nhap values('nh01','sp01','nv01','3/7/2018',0,1500000)
--Nhập đúng
insert into nhap values('nh01','sp01','nv01','3/7/2018',300,1500000)

--cau2--
create trigger trg_Xuat
on Xuat
for insert 
as
begin 
	declare @masp nchar(10), @manv nchar(10) 
	declare @slx int,@sl int
	select @masp = masp, @manv = manv, @slx = soluongX
	from inserted 
	if(not exists(select * from sanpham where masp=@masp))
		begin
			raiserror(N'Không tồn tại sản phẩm trong danh mục sản phẩm',16,1)
			rollback transaction
		end
	else 
		if(not exists(select * from nhanvien where manv=@manv))
			begin
				raiserror (N'không tồn tại nhân viên có mã này',16,1)
				rollback transaction
			end
		else
		if(@slx < @sl)
			begin
				raiserror (N'Nhập sai số lượng hoặc đơn gia',16,1)
				rollback transaction 
			end
		else
			update Sanpham set soluong =soluong-@slx
			from sanpham where masp=@masp
end

--cau3--
insert into Xuat 
values('X07','SP02','NV01','2023-04-15','5')

CREATE TRIGGER XoaPhieuXuat ON Xuat
FOR DELETE AS
BEGIN
	UPDATE Sanpham SET soluong=soluong+(SELECT soluongX FROM deleted WHERE masp=Sanpham.masp)
	FROM Sanpham 
	JOIN deleted ON Sanpham.masp=deleted.Masp
END

--cau4--
CREATE TRIGGER [dbo].[XuatHang123] ON [dbo].[Xuat]
FOR UPDATE AS
BEGIN 
	DECLARE @masp nvarchar(10), @slx int
	SELECT @masp = masp, @slx = soluongX FROM inserted
	UPDATE Sanpham SET soluong = soluong - @slx WHERE masp = @masp
	IF @slx > (SELECT TOP 1 Soluong FROM Sanpham)
	BEGIN
		RAISERROR (N'So luong xuat cao hon ton kho',16,1)
		ROLLBACK TRAN
	END
END

--cau5--
CREATE TRIGGER [dbo].[Capnhatdulieu] ON [dbo].[Nhap]
FOR UPDATE AS
BEGIN 
	DECLARE @masp nvarchar(10), @sln int, @dgn money
	SELECT @masp = masp, @sln = soluongN, @dgn = dongiaN FROM inserted
	UPDATE Sanpham SET soluong = soluong + @sln WHERE masp = @masp
	IF @sln <=0 OR @dgn <= 0
		BEGIN
			RAISERROR (N'So luong nhap va don gia nhap sai',16,1)
			ROLLBACK TRAN
		END
END

--cau6--
CREATE TRIGGER XoaPhieuNhap ON Nhap
FOR DELETE AS
BEGIN
	UPDATE Sanpham SET soluong=soluong-(SELECT soluongN FROM deleted WHERE masp=Sanpham.masp)
	FROM Sanpham 
	JOIN deleted ON Sanpham.masp=deleted.Masp
END
