USE [master]
GO
/****** Object:  Database [DUAN1]    Script Date: 12/12/2022 9:06:28 PM ******/
CREATE DATABASE [DUAN1]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DUAN1_Data', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\DUAN1.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'DUAN1_Log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\DUAN1.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [DUAN1] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DUAN1].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DUAN1] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DUAN1] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DUAN1] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DUAN1] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DUAN1] SET ARITHABORT OFF 
GO
ALTER DATABASE [DUAN1] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DUAN1] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DUAN1] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DUAN1] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DUAN1] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DUAN1] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DUAN1] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DUAN1] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DUAN1] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DUAN1] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DUAN1] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DUAN1] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DUAN1] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DUAN1] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DUAN1] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DUAN1] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DUAN1] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DUAN1] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DUAN1] SET  MULTI_USER 
GO
ALTER DATABASE [DUAN1] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DUAN1] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DUAN1] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DUAN1] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DUAN1] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DUAN1] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [DUAN1] SET QUERY_STORE = OFF
GO
USE [DUAN1]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 12/12/2022 9:06:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[id] [numeric](19, 0) IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CHITIETSP]    Script Date: 12/12/2022 9:06:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CHITIETSP](
	[id] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[idSP] [uniqueidentifier] NULL,
	[HangSP] [nvarchar](50) NULL,
	[KieuDang] [nvarchar](50) NULL,
	[MauSac] [nvarchar](50) NULL,
	[NhienLieu] [nvarchar](50) NULL,
	[DongXe] [nvarchar](50) NULL,
	[HopSo] [nvarchar](50) NULL,
	[DongCo] [nvarchar](50) NULL,
	[ChoNgoi] [nvarchar](50) NULL,
	[PhanKhuc] [nvarchar](50) NULL,
	[XuatXu] [nvarchar](50) NULL,
	[NamSX] [int] NULL,
	[SoLuongTon] [int] NULL,
	[GiaBan] [decimal](18, 0) NULL,
	[MoTa] [nvarchar](50) NULL,
	[trangThai] [int] NULL,
 CONSTRAINT [PK_CHITIETSP] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DICHVU]    Script Date: 12/12/2022 9:06:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DICHVU](
	[id] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[idNhanVien] [uniqueidentifier] NULL,
	[idKhachHang] [uniqueidentifier] NULL,
	[idHoaDon] [uniqueidentifier] NULL,
	[baoHiem] [int] NULL,
	[lamBien] [int] NULL,
 CONSTRAINT [PK_DICHVU] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HINHTHUCTT]    Script Date: 12/12/2022 9:06:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HINHTHUCTT](
	[id] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[ma] [nvarchar](10) NULL,
	[ten] [nvarchar](50) NULL,
	[trangThai] [int] NULL,
 CONSTRAINT [PK_HINHTHUCTT] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HOADON]    Script Date: 12/12/2022 9:06:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HOADON](
	[id] [uniqueidentifier] NOT NULL,
	[idNhanVien] [uniqueidentifier] ROWGUIDCOL  NULL,
	[idHTTT] [uniqueidentifier] NULL,
	[idKhachHang] [uniqueidentifier] NULL,
	[maNV] [nvarchar](50) NULL,
	[tenNV] [nvarchar](50) NULL,
	[maHD] [nvarchar](20) NULL,
	[maSp] [nvarchar](50) NULL,
	[tenXe] [nvarchar](50) NULL,
	[soLuong] [int] NULL,
	[donGia] [decimal](25, 0) NULL,
	[tenKH] [nvarchar](50) NULL,
	[soTienGiam] [decimal](20, 0) NULL,
	[tongTien] [decimal](25, 0) NULL,
	[khachTra] [float] NULL,
	[ngayTao] [date] NULL,
	[ngayThanhToan] [date] NULL,
	[mauSac] [nvarchar](50) NULL,
	[xuatXu] [nvarchar](50) NULL,
	[SĐTNguoiNhan] [nvarchar](20) NULL,
	[diaChi] [nvarchar](50) NULL,
	[trangThai] [int] NULL,
	[note] [nvarchar](100) NULL,
 CONSTRAINT [PK_HOPDONGCT] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HOADONCT]    Script Date: 12/12/2022 9:06:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HOADONCT](
	[id] [uniqueidentifier] NOT NULL,
	[idCTSanPham] [uniqueidentifier] NULL,
	[idHoaDon] [uniqueidentifier] NULL,
	[maSp] [nvarchar](50) NULL,
	[tenSp] [nvarchar](50) NULL,
	[donGia] [decimal](18, 0) NULL,
	[soLuong] [int] NULL,
	[tienThua] [decimal](18, 0) NULL,
	[trangThai] [int] NULL,
 CONSTRAINT [PK_HOADONCT] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KHACHHANG]    Script Date: 12/12/2022 9:06:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KHACHHANG](
	[id] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[maKH] [nvarchar](10) NULL,
	[hoTenKH] [nvarchar](50) NULL,
	[ngaySinh] [date] NULL,
	[gioiTinh] [bit] NULL,
	[SĐT] [nvarchar](11) NULL,
	[diaChi] [nvarchar](50) NULL,
	[quocGia] [nvarchar](15) NULL,
	[trangThai] [int] NULL,
 CONSTRAINT [PK_KHACHHANG] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KHUYENMAI]    Script Date: 12/12/2022 9:06:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KHUYENMAI](
	[id] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[ma] [nvarchar](5) NULL,
	[ten] [nvarchar](10) NULL,
	[giamGia] [int] NULL,
	[ngayBD] [date] NULL,
	[ngayKT] [date] NULL,
	[trangThai] [bit] NULL,
 CONSTRAINT [PK_VOUCHER] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NHANVIEN]    Script Date: 12/12/2022 9:06:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NHANVIEN](
	[id] [uniqueidentifier] NOT NULL,
	[maNV] [nvarchar](10) NULL,
	[hoTenNv] [nvarchar](50) NULL,
	[vaiTro] [int] NULL,
	[ngaySinh] [date] NULL,
	[gioiTinh] [bit] NULL,
	[SĐT] [nvarchar](10) NULL,
	[email] [nvarchar](50) NULL,
	[diaChi] [nvarchar](50) NULL,
	[anh] [nvarchar](50) NULL,
	[luong] [nvarchar](50) NULL,
	[trangThai] [int] NULL,
 CONSTRAINT [PK_NhanVien] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 12/12/2022 9:06:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[id] [numeric](19, 0) IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NULL,
	[price] [numeric](19, 2) NULL,
	[category_id] [numeric](19, 0) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SANPHAM]    Script Date: 12/12/2022 9:06:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SANPHAM](
	[id] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[ma] [nvarchar](5) NULL,
	[ten] [nvarchar](50) NULL,
	[anh] [nvarchar](50) NULL,
 CONSTRAINT [PK_XECHOTHUE] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SPKHUYENMAI]    Script Date: 12/12/2022 9:06:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SPKHUYENMAI](
	[id] [uniqueidentifier] NOT NULL,
	[idSanPham] [uniqueidentifier] NOT NULL,
	[idVoucher] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[donGia] [decimal](20, 0) NULL,
	[soTienConLai] [decimal](20, 0) NULL,
	[trangThai] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[USERNAME]    Script Date: 12/12/2022 9:06:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[USERNAME](
	[id] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[userName] [nvarchar](50) NULL,
	[password] [nvarchar](50) NULL,
	[email] [nvarchar](50) NULL,
	[comfirmPassword] [nvarchar](50) NULL,
	[vaiTro] [int] NULL,
 CONSTRAINT [PK_TaiKhoan] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([id], [name]) VALUES (CAST(1 AS Numeric(19, 0)), N'Tiêu dùng')
INSERT [dbo].[Category] ([id], [name]) VALUES (CAST(2 AS Numeric(19, 0)), N'Thực phẩm')
INSERT [dbo].[Category] ([id], [name]) VALUES (CAST(3 AS Numeric(19, 0)), N'Khác')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
INSERT [dbo].[CHITIETSP] ([id], [idSP], [HangSP], [KieuDang], [MauSac], [NhienLieu], [DongXe], [HopSo], [DongCo], [ChoNgoi], [PhanKhuc], [XuatXu], [NamSX], [SoLuongTon], [GiaBan], [MoTa], [trangThai]) VALUES (N'ed42ff32-a2f7-4a09-a537-04a9bd559590', N'f4bd9b54-eb6e-4048-bf2d-aec784008872', N'Camry', N'', N'Hồng', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[CHITIETSP] ([id], [idSP], [HangSP], [KieuDang], [MauSac], [NhienLieu], [DongXe], [HopSo], [DongCo], [ChoNgoi], [PhanKhuc], [XuatXu], [NamSX], [SoLuongTon], [GiaBan], [MoTa], [trangThai]) VALUES (N'a82a3f56-8cd0-4e6c-bfb9-14a9b7f389b3', N'0b9e8a3e-8920-409e-875f-10e2e494551a', N'Camry', N'Xe đa dụng', N'Xanh', N'Điện', N'Sedan
', N'Hộp số tự động', N'Động cơ điện', N'5 chỗ', N'Hạng M', N'Nhật Bản', 2019, 2, CAST(1185000000 AS Decimal(18, 0)), N'New 100%', 0)
INSERT [dbo].[CHITIETSP] ([id], [idSP], [HangSP], [KieuDang], [MauSac], [NhienLieu], [DongXe], [HopSo], [DongCo], [ChoNgoi], [PhanKhuc], [XuatXu], [NamSX], [SoLuongTon], [GiaBan], [MoTa], [trangThai]) VALUES (N'e2db8dd9-4cf1-4274-8675-1a845ea630a1', N'e89d3bd3-0aa9-4b02-93c3-b9c5685f8ca9', N'HonDa  ', N'Xe đa dụng', N'Đỏ', N'Điện', N'SUV', N'Hộp số tự động', N'Động cơ điện', N'7 chỗ', N'Hạng M', N'Mĩ', 2021, 4, CAST(592000000 AS Decimal(18, 0)), N'New 100%', 0)
INSERT [dbo].[CHITIETSP] ([id], [idSP], [HangSP], [KieuDang], [MauSac], [NhienLieu], [DongXe], [HopSo], [DongCo], [ChoNgoi], [PhanKhuc], [XuatXu], [NamSX], [SoLuongTon], [GiaBan], [MoTa], [trangThai]) VALUES (N'02ec5df7-02b0-4652-a975-1b4f319e62eb', N'76ff9ebc-f1a2-4f00-a1aa-fe4197c6ee8b', N'Toyota', N'Xe đa dụng', N'Vàng', N'Điện', N'Sedan', N'Hộp số tự động', N'Động cơ xăng', N'5 chỗ', N'Hạng M', N'Nhật Bản', 2021, 1, CAST(545000000 AS Decimal(18, 0)), N'New 100%', 0)
INSERT [dbo].[CHITIETSP] ([id], [idSP], [HangSP], [KieuDang], [MauSac], [NhienLieu], [DongXe], [HopSo], [DongCo], [ChoNgoi], [PhanKhuc], [XuatXu], [NamSX], [SoLuongTon], [GiaBan], [MoTa], [trangThai]) VALUES (N'30da15fe-ecd7-4e15-af1c-2a68195b9ea8', N'1ea6fbf9-2bc0-42e3-ba7b-0e0804174807', N'Hyundai', N'Xe đa dụng', N'Tím', N'Xăng', N'SUV', N'Hộp số sàn', N'Động cơ xăng', N'5 chỗ', N'Hạng M', N'Hàn Quốc', 2021, 7, CAST(600000000 AS Decimal(18, 0)), N'New 100%', 0)
INSERT [dbo].[CHITIETSP] ([id], [idSP], [HangSP], [KieuDang], [MauSac], [NhienLieu], [DongXe], [HopSo], [DongCo], [ChoNgoi], [PhanKhuc], [XuatXu], [NamSX], [SoLuongTon], [GiaBan], [MoTa], [trangThai]) VALUES (N'9924444e-c2f4-4a26-b239-2e61869edc44', N'83953511-acc3-432e-91d8-bd70c686d2f9', N'Madza', N'Xe đa dụng', N'Đỏ', N'Xăng', N'Hatchback', N'Hộp số tự động', N'Động cơ xăng', N'5 chỗ', N'Hạng A', N'Nhật Bản', 2020, 3, CAST(669000000 AS Decimal(18, 0)), N'New 100%', 0)
INSERT [dbo].[CHITIETSP] ([id], [idSP], [HangSP], [KieuDang], [MauSac], [NhienLieu], [DongXe], [HopSo], [DongCo], [ChoNgoi], [PhanKhuc], [XuatXu], [NamSX], [SoLuongTon], [GiaBan], [MoTa], [trangThai]) VALUES (N'90f5c13a-8ad4-4688-bdd0-41b8c434907f', N'322439ef-2a7f-4d0c-accf-69cb8fffa3e3', N'Toyota', N'Xe đa dụng', N'Trắng', N'Điện', N'SUV', N'Hộp số tự động', N'Động cơ xăng', N'5 chỗ', N'Hạng M', N'Hàn Quốc', 2021, 3, CAST(400000000 AS Decimal(18, 0)), N'New 100%', 1)
INSERT [dbo].[CHITIETSP] ([id], [idSP], [HangSP], [KieuDang], [MauSac], [NhienLieu], [DongXe], [HopSo], [DongCo], [ChoNgoi], [PhanKhuc], [XuatXu], [NamSX], [SoLuongTon], [GiaBan], [MoTa], [trangThai]) VALUES (N'a71810e0-f5f9-4452-b396-41c59e5209fa', N'e79dfcc2-f163-4e46-af89-86ac744edf76', N'Lexus', N'Xe hạng sang', N' Đen', N'Xăng', N'Sedan', N'Hộp số tự động', N'Động cơ xăng', N'5 chỗ', N'Hạng A', N'Nhật Bản', 2022, 2, CAST(3000000000 AS Decimal(18, 0)), N'New 100%', 0)
INSERT [dbo].[CHITIETSP] ([id], [idSP], [HangSP], [KieuDang], [MauSac], [NhienLieu], [DongXe], [HopSo], [DongCo], [ChoNgoi], [PhanKhuc], [XuatXu], [NamSX], [SoLuongTon], [GiaBan], [MoTa], [trangThai]) VALUES (N'6a2ae420-5391-4875-8a85-66e46de29a28', N'322439ef-2a7f-4d0c-accf-69cb8fffa3e3', N'Rolls Royce', N'Xe hạng sang', N'Trắng', N'Xăng', N'Sedan', N'Hộp số tự động', N'Động cơ xăng', N'4 chỗ', N'Hạng A', N'Anh Quốc', 2021, 2, CAST(31000000000 AS Decimal(18, 0)), N'New 100%', 1)
INSERT [dbo].[CHITIETSP] ([id], [idSP], [HangSP], [KieuDang], [MauSac], [NhienLieu], [DongXe], [HopSo], [DongCo], [ChoNgoi], [PhanKhuc], [XuatXu], [NamSX], [SoLuongTon], [GiaBan], [MoTa], [trangThai]) VALUES (N'a19b78bd-2519-493e-a0d8-8835456e13a9', N'e103c027-7ee4-46f8-a357-5852116c5501', N'Bugatti', N'Xe thể thao', N'Xanh', N'Xăng', N'Coupe ', N'Hộp số tự động', N'Động cơ xăng', N'2 chỗ', N'Hạng A', N'Pháp', 2021, 2, CAST(2000000000 AS Decimal(18, 0)), N'New 100%', 1)
INSERT [dbo].[CHITIETSP] ([id], [idSP], [HangSP], [KieuDang], [MauSac], [NhienLieu], [DongXe], [HopSo], [DongCo], [ChoNgoi], [PhanKhuc], [XuatXu], [NamSX], [SoLuongTon], [GiaBan], [MoTa], [trangThai]) VALUES (N'de362b2e-d80c-450c-aa50-8e03e3ff4af1', N'93300f1d-08e8-4ca7-9fa9-a611527aedf3', N'Porsche', N'Xe thể thao', N'Trắng', N'Xăng', N'Coupe ', N'Hộp số tự động', N'Động cơ xăng', N'5 chỗ', N'Hạng A', N'Đức', 2021, 3, CAST(4650000000 AS Decimal(18, 0)), N'New 100%', 0)
INSERT [dbo].[CHITIETSP] ([id], [idSP], [HangSP], [KieuDang], [MauSac], [NhienLieu], [DongXe], [HopSo], [DongCo], [ChoNgoi], [PhanKhuc], [XuatXu], [NamSX], [SoLuongTon], [GiaBan], [MoTa], [trangThai]) VALUES (N'9bbaf029-ee51-473e-b280-b1cf5bdd3f2e', N'6511c24d-061b-4d99-bfa2-c3b0c9ef8a3e', N'Lamborghini', N'Xe mui trần', N'Xanh', N'Xăng ', N'Roadster', N'Hộp số tự động', N'Động cơ xăng', N'2 chỗ', N'Hạng A', N'Italy', 2023, 2, CAST(16500000000 AS Decimal(18, 0)), N'New 100%', 1)
INSERT [dbo].[CHITIETSP] ([id], [idSP], [HangSP], [KieuDang], [MauSac], [NhienLieu], [DongXe], [HopSo], [DongCo], [ChoNgoi], [PhanKhuc], [XuatXu], [NamSX], [SoLuongTon], [GiaBan], [MoTa], [trangThai]) VALUES (N'9ec07b72-3104-4dd8-98b3-b5179afefbca', N'99ec6793-d597-4742-88a8-e756b0962891', N'Ford', N'Xe đa dụng', N'Đen', N'Xăng', N'SUV', N'Hộp số tự động', N'Động cơ xăng', N'5 chỗ', N'Hạng M', N'Mĩ', 2022, 2, CAST(700000000 AS Decimal(18, 0)), N'New 100%', 0)
INSERT [dbo].[CHITIETSP] ([id], [idSP], [HangSP], [KieuDang], [MauSac], [NhienLieu], [DongXe], [HopSo], [DongCo], [ChoNgoi], [PhanKhuc], [XuatXu], [NamSX], [SoLuongTon], [GiaBan], [MoTa], [trangThai]) VALUES (N'72312056-538c-4b83-b1d5-bee33d6b5353', N'c25d6986-e493-48ac-938e-7cb2de5be164', N'Vinfast', N'Xe đa dụng', N'Trắng', N'Điện', N'Sedan', N'Hộp số tự động', N'Động cơ điện', N'5 chỗ', N'Hạng A', N'Việt Nam', 2022, 4, CAST(1000000000 AS Decimal(18, 0)), N'New 100%', 1)
INSERT [dbo].[CHITIETSP] ([id], [idSP], [HangSP], [KieuDang], [MauSac], [NhienLieu], [DongXe], [HopSo], [DongCo], [ChoNgoi], [PhanKhuc], [XuatXu], [NamSX], [SoLuongTon], [GiaBan], [MoTa], [trangThai]) VALUES (N'fa129196-e168-4e7c-a6ff-d43d827045af', N'322439ef-2a7f-4d0c-accf-69cb8fffa3e3', N'Morning', N'Xe đa dụng', N'Đỏ', N'Điện', N'SUV', N'Hộp số tự động', N'Động cơ xăng', N'5 chỗ', N'Hạng M', N'Hàn Quốc', 2021, 3, CAST(400000000 AS Decimal(18, 0)), N'New 100%', 0)
INSERT [dbo].[CHITIETSP] ([id], [idSP], [HangSP], [KieuDang], [MauSac], [NhienLieu], [DongXe], [HopSo], [DongCo], [ChoNgoi], [PhanKhuc], [XuatXu], [NamSX], [SoLuongTon], [GiaBan], [MoTa], [trangThai]) VALUES (N'4cc84b2f-dd1e-4a42-a959-f7004136f337', N'322439ef-2a7f-4d0c-accf-69cb8fffa3e3', N'Toyota', N'Xe đa dụng', N'Đỏ', N'Điện', N'SUV', N'Hộp số tự động', N'Động cơ xăng', N'5 chỗ', N'Hạng M', N'Hàn Quốc', 2021, 3, CAST(400000000 AS Decimal(18, 0)), N'New 100%', 1)
GO
INSERT [dbo].[DICHVU] ([id], [idNhanVien], [idKhachHang], [idHoaDon], [baoHiem], [lamBien]) VALUES (N'2504ab07-a194-4084-8cb4-2a09f77cf541', N'7d9d8c6c-95c5-40bb-b1d9-3be682ed8a36', N'3d6754a0-eb10-497e-9e2a-5447e8782646', N'04b0c953-0588-4ec2-8877-c4c2011924f7', 0, 0)
INSERT [dbo].[DICHVU] ([id], [idNhanVien], [idKhachHang], [idHoaDon], [baoHiem], [lamBien]) VALUES (N'4ee7376b-50e8-45f8-85fb-335a0b8e4c3f', N'e1499d87-1fd9-4de2-b789-3f84cf206c95', N'b379287e-a625-47ba-8370-5d4ca14f32a5', N'6d9b89b3-10c3-45e4-9dee-df93c3369ed5', 0, 0)
INSERT [dbo].[DICHVU] ([id], [idNhanVien], [idKhachHang], [idHoaDon], [baoHiem], [lamBien]) VALUES (N'93fed10b-6f25-493f-adbe-396031917c54', N'af24dc07-d392-4514-8ec1-0127593b1374', N'93a82d13-0271-43fc-a9da-1cd216727599', N'31cb4329-187c-4209-a6bf-11c6a37b63da', 0, 0)
INSERT [dbo].[DICHVU] ([id], [idNhanVien], [idKhachHang], [idHoaDon], [baoHiem], [lamBien]) VALUES (N'71ce1e09-2b1c-4a46-8b75-86ff2a34a750', N'37a92c43-6ccf-4757-9474-37da1b465a8b', N'3b0a214f-e4b4-477d-aade-4b3a66ed89b4', N'18c7e1fa-67f0-41cf-9eef-b4fcfd28c9a9', 0, 0)
INSERT [dbo].[DICHVU] ([id], [idNhanVien], [idKhachHang], [idHoaDon], [baoHiem], [lamBien]) VALUES (N'0a7bf9e3-83fa-4c92-86a2-899b0b74cf7a', N'0647f1a9-c4d0-4fb1-a0bb-090a96673e69', N'1ab1900f-bb7d-44b6-898f-1dcad47e6ac9', N'ae650546-cb4e-426a-a71c-1f86955d3e3c', 0, 0)
INSERT [dbo].[DICHVU] ([id], [idNhanVien], [idKhachHang], [idHoaDon], [baoHiem], [lamBien]) VALUES (N'ebceba76-84e5-45ff-be21-8dd5c5089c68', N'fd6e04fe-5814-4b3b-aa41-00ce816f202f', N'fd6e04fe-5814-4b3b-aa41-00ce816f202f', N'480deb07-e951-40d6-9752-095905a292e4', 0, 0)
INSERT [dbo].[DICHVU] ([id], [idNhanVien], [idKhachHang], [idHoaDon], [baoHiem], [lamBien]) VALUES (N'beebb590-5bac-4d6d-a684-a08fcea84eae', N'37a92c43-6ccf-4757-9474-37da1b465a8b', N'000966a8-ae31-4568-b2db-32934155b2ad', N'3a9795e9-293f-4975-8c01-ac6ee94e1a93', 0, 0)
INSERT [dbo].[DICHVU] ([id], [idNhanVien], [idKhachHang], [idHoaDon], [baoHiem], [lamBien]) VALUES (N'e0eb4fca-b585-4751-bab5-ab74d82c3f96', N'fd4d696e-c3e6-4b95-a256-0d0361e16ce9', N'd971b12f-3c90-4581-900d-2052d3f51a67', N'4fd0292b-1538-4b06-aa74-26477463b909', 0, 0)
INSERT [dbo].[DICHVU] ([id], [idNhanVien], [idKhachHang], [idHoaDon], [baoHiem], [lamBien]) VALUES (N'65591eff-3b58-4d4a-a27d-ad92c7a0fb90', N'0d3c9509-9906-4100-94cf-2d2b254239f9', N'bf84a499-b15d-46eb-8fc6-2dbaef4a2d83', N'f38cf19f-233e-4830-8c77-7cd2ff6d3603', 0, 0)
INSERT [dbo].[DICHVU] ([id], [idNhanVien], [idKhachHang], [idHoaDon], [baoHiem], [lamBien]) VALUES (N'22a64c99-42fc-4b43-9c63-ea034add7aad', N'40fbae3a-22ec-4b9e-b7a4-0dfc02695ae8', N'83f54c1a-aa6d-4ced-b0ec-25ee402c6558', N'7ed79bd8-9d48-4afa-8ac5-408ced8a2ce6', 0, 0)
GO
INSERT [dbo].[HINHTHUCTT] ([id], [ma], [ten], [trangThai]) VALUES (N'bd41a4d3-d9e3-465c-8539-1113b00f6f00', N'ma1', N'Online', 0)
INSERT [dbo].[HINHTHUCTT] ([id], [ma], [ten], [trangThai]) VALUES (N'a02cf4c6-a2be-42c7-b0ef-1a94c25ec39f', N'ma2', N'Offline', 0)
GO
INSERT [dbo].[HOADON] ([id], [idNhanVien], [idHTTT], [idKhachHang], [maNV], [tenNV], [maHD], [maSp], [tenXe], [soLuong], [donGia], [tenKH], [soTienGiam], [tongTien], [khachTra], [ngayTao], [ngayThanhToan], [mauSac], [xuatXu], [SĐTNguoiNhan], [diaChi], [trangThai], [note]) VALUES (N'480deb07-e951-40d6-9752-095905a292e4', N'fd4d696e-c3e6-4b95-a256-0d0361e16ce9', N'a02cf4c6-a2be-42c7-b0ef-1a94c25ec39f', N'd971b12f-3c90-4581-900d-2052d3f51a67', N'maNV19', N'Nguyễn Thị Thúy Hằng', N'HD4', N'ma4', N'Morning', 1, CAST(400000000 AS Decimal(25, 0)), N'Trần Thị Sao Băng', CAST(5000000 AS Decimal(20, 0)), CAST(400000000 AS Decimal(25, 0)), 399000000, CAST(N'2022-11-28' AS Date), CAST(N'2022-12-12' AS Date), N'Đỏ', N'Hàn Quốc', N'0934732462', N'Thái Bình', 0, N'Bao Hiem + Lam Bien')
INSERT [dbo].[HOADON] ([id], [idNhanVien], [idHTTT], [idKhachHang], [maNV], [tenNV], [maHD], [maSp], [tenXe], [soLuong], [donGia], [tenKH], [soTienGiam], [tongTien], [khachTra], [ngayTao], [ngayThanhToan], [mauSac], [xuatXu], [SĐTNguoiNhan], [diaChi], [trangThai], [note]) VALUES (N'31cb4329-187c-4209-a6bf-11c6a37b63da', N'52de004d-54e4-49d2-9154-5348da560ad8', N'a02cf4c6-a2be-42c7-b0ef-1a94c25ec39f', N'23e1c29d-1e6f-4ac5-b737-927f6974f16a', N'maNV5', N'Minh Văn Hà', N'HD10', N'ma10', N'Huyndai', 1, CAST(600000000 AS Decimal(25, 0)), N'Nguyễn Thùy Trang', CAST(3000000 AS Decimal(20, 0)), NULL, 100000000, CAST(N'2022-11-28' AS Date), CAST(N'2022-12-12' AS Date), N'Tím', N'Hàn Quốc', N'0984652487', N'Hải Phòng', 0, N'Lam Bien')
INSERT [dbo].[HOADON] ([id], [idNhanVien], [idHTTT], [idKhachHang], [maNV], [tenNV], [maHD], [maSp], [tenXe], [soLuong], [donGia], [tenKH], [soTienGiam], [tongTien], [khachTra], [ngayTao], [ngayThanhToan], [mauSac], [xuatXu], [SĐTNguoiNhan], [diaChi], [trangThai], [note]) VALUES (N'64cc692d-75db-4d0a-9499-12691cbff2f1', NULL, NULL, NULL, N'maNV1', N'Chống Thiện Mỹ', N'HD19', N'ma11', N'Madza', 1, CAST(669000000 AS Decimal(25, 0)), N'sdafsdafsadf', CAST(0 AS Decimal(20, 0)), NULL, 0, CAST(N'2022-12-12' AS Date), CAST(N'2022-12-12' AS Date), N'Đỏ', N'Nhật Bản', NULL, NULL, 0, N'')
INSERT [dbo].[HOADON] ([id], [idNhanVien], [idHTTT], [idKhachHang], [maNV], [tenNV], [maHD], [maSp], [tenXe], [soLuong], [donGia], [tenKH], [soTienGiam], [tongTien], [khachTra], [ngayTao], [ngayThanhToan], [mauSac], [xuatXu], [SĐTNguoiNhan], [diaChi], [trangThai], [note]) VALUES (N'b5f96696-b187-4a38-9b5b-181cdec140c1', NULL, NULL, NULL, N'maNV1', N'Chống Thiện Mỹ', N'HD18', N'ma12', N'Porsche', 1, CAST(4650000000 AS Decimal(25, 0)), N'check', CAST(5000000 AS Decimal(20, 0)), NULL, 4650000000, CAST(N'2022-12-12' AS Date), CAST(N'2022-12-12' AS Date), N'Trắng', N'Đức', NULL, NULL, 0, N'')
INSERT [dbo].[HOADON] ([id], [idNhanVien], [idHTTT], [idKhachHang], [maNV], [tenNV], [maHD], [maSp], [tenXe], [soLuong], [donGia], [tenKH], [soTienGiam], [tongTien], [khachTra], [ngayTao], [ngayThanhToan], [mauSac], [xuatXu], [SĐTNguoiNhan], [diaChi], [trangThai], [note]) VALUES (N'ae650546-cb4e-426a-a71c-1f86955d3e3c', N'0647f1a9-c4d0-4fb1-a0bb-090a96673e69', N'a02cf4c6-a2be-42c7-b0ef-1a94c25ec39f', N'1ab1900f-bb7d-44b6-898f-1dcad47e6ac9', N'maNV3', N'Phạm Quỳnh Diễm', N'HD3', N'ma3', N'Bugatti', 1, CAST(2000000000 AS Decimal(25, 0)), N'Hà Ngọc Bảo Lam', CAST(4000000 AS Decimal(20, 0)), NULL, 1996000000, CAST(N'2022-12-01' AS Date), CAST(N'2022-12-12' AS Date), N'Xanh', N'Pháp', N'0926745642', N'Cao Bằng', 0, N'')
INSERT [dbo].[HOADON] ([id], [idNhanVien], [idHTTT], [idKhachHang], [maNV], [tenNV], [maHD], [maSp], [tenXe], [soLuong], [donGia], [tenKH], [soTienGiam], [tongTien], [khachTra], [ngayTao], [ngayThanhToan], [mauSac], [xuatXu], [SĐTNguoiNhan], [diaChi], [trangThai], [note]) VALUES (N'4fd0292b-1538-4b06-aa74-26477463b909', N'fd6e04fe-5814-4b3b-aa41-00ce816f202f', N'a02cf4c6-a2be-42c7-b0ef-1a94c25ec39f', N'fd6e04fe-5814-4b3b-aa41-00ce816f202f', N'maNV1', N'Chống Thiện Mỹ', N'HD1', N'ma1', N'Camry', 1, CAST(1185000000 AS Decimal(25, 0)), N'Nguyễn Phương Quỳnh Chi', CAST(4000000 AS Decimal(20, 0)), CAST(1185000000 AS Decimal(25, 0)), 1180999936, CAST(N'2022-12-01' AS Date), CAST(N'2022-12-12' AS Date), N'Xanh', N'Nhật Bản', N'0982541258', N'Hà Nội', 0, N'')
INSERT [dbo].[HOADON] ([id], [idNhanVien], [idHTTT], [idKhachHang], [maNV], [tenNV], [maHD], [maSp], [tenXe], [soLuong], [donGia], [tenKH], [soTienGiam], [tongTien], [khachTra], [ngayTao], [ngayThanhToan], [mauSac], [xuatXu], [SĐTNguoiNhan], [diaChi], [trangThai], [note]) VALUES (N'7d8f0f1d-667c-4712-a380-365217b1f29b', NULL, NULL, NULL, N'maNV7', N'Lê Nga Hằng', N'HD15', N'ma5', N'Lexus', 1, CAST(3000000000 AS Decimal(25, 0)), N'Bù', CAST(0 AS Decimal(20, 0)), NULL, NULL, CAST(N'2022-12-12' AS Date), NULL, N' Đen', N'Nhật Bản', NULL, NULL, 0, NULL)
INSERT [dbo].[HOADON] ([id], [idNhanVien], [idHTTT], [idKhachHang], [maNV], [tenNV], [maHD], [maSp], [tenXe], [soLuong], [donGia], [tenKH], [soTienGiam], [tongTien], [khachTra], [ngayTao], [ngayThanhToan], [mauSac], [xuatXu], [SĐTNguoiNhan], [diaChi], [trangThai], [note]) VALUES (N'5ccd733b-99fc-4efa-82a1-3f6453b346d0', NULL, NULL, NULL, N'maNV1', N'Chống Thiện Mỹ', N'HD17', N'ma5', N'Lexus', 1, CAST(3000000000 AS Decimal(25, 0)), N'jhgfjhgf', CAST(0 AS Decimal(20, 0)), NULL, NULL, CAST(N'2022-12-12' AS Date), NULL, N' Đen', N'Nhật Bản', NULL, NULL, 0, NULL)
INSERT [dbo].[HOADON] ([id], [idNhanVien], [idHTTT], [idKhachHang], [maNV], [tenNV], [maHD], [maSp], [tenXe], [soLuong], [donGia], [tenKH], [soTienGiam], [tongTien], [khachTra], [ngayTao], [ngayThanhToan], [mauSac], [xuatXu], [SĐTNguoiNhan], [diaChi], [trangThai], [note]) VALUES (N'7ed79bd8-9d48-4afa-8ac5-408ced8a2ce6', N'37a92c43-6ccf-4757-9474-37da1b465a8b', N'a02cf4c6-a2be-42c7-b0ef-1a94c25ec39f', N'000966a8-ae31-4568-b2db-32934155b2ad', N'maNV7', N'Lê Nga Hằng', N'HD7', N'ma7', N'Lamborghini', 1, CAST(16500000000 AS Decimal(25, 0)), N'Bùi Đăng Dũng', CAST(3000000 AS Decimal(20, 0)), CAST(16500000000 AS Decimal(25, 0)), 0, CAST(N'2022-12-04' AS Date), CAST(N'2022-12-12' AS Date), N'Xanh', N'Italy', N'0961745487', N'Hà Nội', 1, N'')
INSERT [dbo].[HOADON] ([id], [idNhanVien], [idHTTT], [idKhachHang], [maNV], [tenNV], [maHD], [maSp], [tenXe], [soLuong], [donGia], [tenKH], [soTienGiam], [tongTien], [khachTra], [ngayTao], [ngayThanhToan], [mauSac], [xuatXu], [SĐTNguoiNhan], [diaChi], [trangThai], [note]) VALUES (N'a3303190-691c-4766-a7ee-5f1bc16bbbee', NULL, NULL, NULL, N'maNV1', N'Chống Thiện Mỹ', N'HD16', N'ma12', N'Porsche', 1, CAST(4650000000 AS Decimal(25, 0)), N'địt mẹ mày', CAST(0 AS Decimal(20, 0)), NULL, NULL, CAST(N'2022-12-12' AS Date), NULL, N'Trắng', N'Đức', NULL, NULL, 0, NULL)
INSERT [dbo].[HOADON] ([id], [idNhanVien], [idHTTT], [idKhachHang], [maNV], [tenNV], [maHD], [maSp], [tenXe], [soLuong], [donGia], [tenKH], [soTienGiam], [tongTien], [khachTra], [ngayTao], [ngayThanhToan], [mauSac], [xuatXu], [SĐTNguoiNhan], [diaChi], [trangThai], [note]) VALUES (N'929e24a0-d323-49aa-b1b9-7a9b21c256ba', NULL, NULL, NULL, N'maNV1', N'Chống Thiện Mỹ', N'HD13', N'ma9', N'Toyota ', 1, CAST(545000000 AS Decimal(25, 0)), N'adasdasdasda', CAST(0 AS Decimal(20, 0)), NULL, NULL, CAST(N'2022-12-12' AS Date), NULL, N'Vàng', N'Nhật Bản', NULL, NULL, 0, NULL)
INSERT [dbo].[HOADON] ([id], [idNhanVien], [idHTTT], [idKhachHang], [maNV], [tenNV], [maHD], [maSp], [tenXe], [soLuong], [donGia], [tenKH], [soTienGiam], [tongTien], [khachTra], [ngayTao], [ngayThanhToan], [mauSac], [xuatXu], [SĐTNguoiNhan], [diaChi], [trangThai], [note]) VALUES (N'f38cf19f-233e-4830-8c77-7cd2ff6d3603', N'e1499d87-1fd9-4de2-b789-3f84cf206c95', N'a02cf4c6-a2be-42c7-b0ef-1a94c25ec39f', N'3d6754a0-eb10-497e-9e2a-5447e8782646', N'maNV9', N'Nguyễn Văn Minh', N'HD09', N'ma9', N'Toyota', 1, CAST(545000000 AS Decimal(25, 0)), N'Vương Hoàng Dương', CAST(2500000 AS Decimal(20, 0)), CAST(0 AS Decimal(25, 0)), 542500000, CAST(N'2022-09-12' AS Date), CAST(N'2022-12-12' AS Date), N'Đỏ', N'Nhật Bản', N'0967254524', N'Phú Thọ', 0, N'')
INSERT [dbo].[HOADON] ([id], [idNhanVien], [idHTTT], [idKhachHang], [maNV], [tenNV], [maHD], [maSp], [tenXe], [soLuong], [donGia], [tenKH], [soTienGiam], [tongTien], [khachTra], [ngayTao], [ngayThanhToan], [mauSac], [xuatXu], [SĐTNguoiNhan], [diaChi], [trangThai], [note]) VALUES (N'4b492e5c-a1a4-468d-8fa5-8e152d1e5756', NULL, NULL, NULL, N'maNV9', N'Nguyễn Văn Minh', N'HD11', N'ma10', N'Huyndai', 1, CAST(600000000 AS Decimal(25, 0)), N'Vương Hoàng Dương', CAST(0 AS Decimal(20, 0)), NULL, 0, CAST(N'2022-12-12' AS Date), CAST(N'2022-12-12' AS Date), N'Tím', N'Hàn Quốc', NULL, NULL, 0, N'')
INSERT [dbo].[HOADON] ([id], [idNhanVien], [idHTTT], [idKhachHang], [maNV], [tenNV], [maHD], [maSp], [tenXe], [soLuong], [donGia], [tenKH], [soTienGiam], [tongTien], [khachTra], [ngayTao], [ngayThanhToan], [mauSac], [xuatXu], [SĐTNguoiNhan], [diaChi], [trangThai], [note]) VALUES (N'd3cb35fd-8fb0-4527-9818-9981cc8bf23a', NULL, NULL, NULL, N'maNV1', N'Chống Thiện Mỹ', N'HD14', N'ma2', N'HonDa City', 1, CAST(592000000 AS Decimal(25, 0)), N'hehehehe', CAST(0 AS Decimal(20, 0)), NULL, NULL, CAST(N'2022-12-12' AS Date), NULL, N'Đỏ', N'Mĩ', NULL, NULL, 0, NULL)
INSERT [dbo].[HOADON] ([id], [idNhanVien], [idHTTT], [idKhachHang], [maNV], [tenNV], [maHD], [maSp], [tenXe], [soLuong], [donGia], [tenKH], [soTienGiam], [tongTien], [khachTra], [ngayTao], [ngayThanhToan], [mauSac], [xuatXu], [SĐTNguoiNhan], [diaChi], [trangThai], [note]) VALUES (N'3a9795e9-293f-4975-8c01-ac6ee94e1a93', N'40fbae3a-22ec-4b9e-b7a4-0dfc02695ae8', N'a02cf4c6-a2be-42c7-b0ef-1a94c25ec39f', N'83f54c1a-aa6d-4ced-b0ec-25ee402c6558', N'maNV5', N'Minh Văn Hà', N'HD05', N'ma5', N'Lexus', 1, CAST(3000000000 AS Decimal(25, 0)), N'Phí Minh Châu', CAST(3000000 AS Decimal(20, 0)), CAST(3002000000 AS Decimal(25, 0)), 2997000000, CAST(N'2022-11-30' AS Date), CAST(N'2022-12-12' AS Date), N'Đen', N'Nhật Bản', N'0478562874', N'Phú Thọ', 0, N'Bao Hiem + Lam Bien')
INSERT [dbo].[HOADON] ([id], [idNhanVien], [idHTTT], [idKhachHang], [maNV], [tenNV], [maHD], [maSp], [tenXe], [soLuong], [donGia], [tenKH], [soTienGiam], [tongTien], [khachTra], [ngayTao], [ngayThanhToan], [mauSac], [xuatXu], [SĐTNguoiNhan], [diaChi], [trangThai], [note]) VALUES (N'18c7e1fa-67f0-41cf-9eef-b4fcfd28c9a9', N'af24dc07-d392-4514-8ec1-0127593b1374', N'a02cf4c6-a2be-42c7-b0ef-1a94c25ec39f', N'93a82d13-0271-43fc-a9da-1cd216727599', N'maNV2', N'Phạm Khương Duy', N'HD02', N'ma2', N'HonDa City', 1, CAST(592000000 AS Decimal(25, 0)), N'Quản Thu Hà', CAST(4000000 AS Decimal(20, 0)), NULL, 58800000000, CAST(N'2022-12-01' AS Date), CAST(N'2022-12-12' AS Date), N'Đỏ', N'Mĩ', N'0342572452', N'Thái Bình', 0, N'Bao Hiem + Lam Bien 2')
INSERT [dbo].[HOADON] ([id], [idNhanVien], [idHTTT], [idKhachHang], [maNV], [tenNV], [maHD], [maSp], [tenXe], [soLuong], [donGia], [tenKH], [soTienGiam], [tongTien], [khachTra], [ngayTao], [ngayThanhToan], [mauSac], [xuatXu], [SĐTNguoiNhan], [diaChi], [trangThai], [note]) VALUES (N'04b0c953-0588-4ec2-8877-c4c2011924f7', N'7d9d8c6c-95c5-40bb-b1d9-3be682ed8a36', N'a02cf4c6-a2be-42c7-b0ef-1a94c25ec39f', N'3b0a214f-e4b4-477d-aade-4b3a66ed89b4', N'maNV20', N'Trần Thúy Linh', N'HD08', N'ma8', N'Ford', 1, CAST(700000000 AS Decimal(25, 0)), N'Trần Thị Xuân', CAST(5000000 AS Decimal(20, 0)), CAST(705000000 AS Decimal(25, 0)), 1, CAST(N'2022-10-14' AS Date), CAST(N'2022-12-12' AS Date), N'Xanh', N'Mĩ', N'0493473742', N'Bến Tre', 0, N'Bao Hiem + Lam Bien 1')
INSERT [dbo].[HOADON] ([id], [idNhanVien], [idHTTT], [idKhachHang], [maNV], [tenNV], [maHD], [maSp], [tenXe], [soLuong], [donGia], [tenKH], [soTienGiam], [tongTien], [khachTra], [ngayTao], [ngayThanhToan], [mauSac], [xuatXu], [SĐTNguoiNhan], [diaChi], [trangThai], [note]) VALUES (N'6d9b89b3-10c3-45e4-9dee-df93c3369ed5', N'0d3c9509-9906-4100-94cf-2d2b254239f9', N'a02cf4c6-a2be-42c7-b0ef-1a94c25ec39f', N'bf84a499-b15d-46eb-8fc6-2dbaef4a2d83', N'maNV5', N'Minh Văn Hà', N'HD06', N'ma6', N'Rolls Royce', 1, CAST(31000000000 AS Decimal(25, 0)), N'Hà Thị Hạnh', CAST(2500000 AS Decimal(20, 0)), CAST(31005000000 AS Decimal(25, 0)), 31000000000, CAST(N'2022-12-03' AS Date), CAST(N'2022-12-12' AS Date), N'Đen', N'Đức', N'0648362634', N'Thái Bình', 0, N'Bao Hiem + Lam Bien')
INSERT [dbo].[HOADON] ([id], [idNhanVien], [idHTTT], [idKhachHang], [maNV], [tenNV], [maHD], [maSp], [tenXe], [soLuong], [donGia], [tenKH], [soTienGiam], [tongTien], [khachTra], [ngayTao], [ngayThanhToan], [mauSac], [xuatXu], [SĐTNguoiNhan], [diaChi], [trangThai], [note]) VALUES (N'025b8a97-a59c-45f6-a710-e6a4278104fb', NULL, NULL, NULL, N'maNV7', N'Lê Nga Hằng', N'HD12', N'ma11', N'Madza', 1, CAST(669000000 AS Decimal(25, 0)), N'Bùi Đăng Dũng', CAST(2500000 AS Decimal(20, 0)), CAST(679000000 AS Decimal(25, 0)), 0, CAST(N'2022-12-12' AS Date), CAST(N'2022-12-12' AS Date), N'Đỏ', N'Nhật Bản', NULL, NULL, 0, N'Bao Hiem + Lam Bien 1')
GO
INSERT [dbo].[HOADONCT] ([id], [idCTSanPham], [idHoaDon], [maSp], [tenSp], [donGia], [soLuong], [tienThua], [trangThai]) VALUES (N'5b883ad4-4214-43e9-9e65-3b3f8ee4bad1', N'a71810e0-f5f9-4452-b396-41c59e5209fa', N'3a9795e9-293f-4975-8c01-ac6ee94e1a93', N'ma5', N'Lexus', CAST(3000000000 AS Decimal(18, 0)), 1, CAST(0 AS Decimal(18, 0)), 0)
INSERT [dbo].[HOADONCT] ([id], [idCTSanPham], [idHoaDon], [maSp], [tenSp], [donGia], [soLuong], [tienThua], [trangThai]) VALUES (N'1d41b346-b0df-4ad0-866f-445b1eecc473', N'9bbaf029-ee51-473e-b280-b1cf5bdd3f2e', N'7ed79bd8-9d48-4afa-8ac5-408ced8a2ce6', N'ma7', N'Lamborghini', CAST(16500000000 AS Decimal(18, 0)), 1, CAST(0 AS Decimal(18, 0)), 0)
INSERT [dbo].[HOADONCT] ([id], [idCTSanPham], [idHoaDon], [maSp], [tenSp], [donGia], [soLuong], [tienThua], [trangThai]) VALUES (N'1cff257c-e046-4306-9cfc-57dcc29b41df', N'a19b78bd-2519-493e-a0d8-8835456e13a9', N'ae650546-cb4e-426a-a71c-1f86955d3e3c', N'ma3', N'Bugatti', CAST(2000000000 AS Decimal(18, 0)), 1, CAST(0 AS Decimal(18, 0)), 0)
INSERT [dbo].[HOADONCT] ([id], [idCTSanPham], [idHoaDon], [maSp], [tenSp], [donGia], [soLuong], [tienThua], [trangThai]) VALUES (N'65a7d297-bb99-4a87-a1fe-581b46c163ad', N'02ec5df7-02b0-4652-a975-1b4f319e62eb', N'f38cf19f-233e-4830-8c77-7cd2ff6d3603', N'ma9', N'Toyota', CAST(545000000 AS Decimal(18, 0)), 1, CAST(0 AS Decimal(18, 0)), 0)
INSERT [dbo].[HOADONCT] ([id], [idCTSanPham], [idHoaDon], [maSp], [tenSp], [donGia], [soLuong], [tienThua], [trangThai]) VALUES (N'78818512-51a4-49eb-abb0-59ca1712f9e0', N'a82a3f56-8cd0-4e6c-bfb9-14a9b7f389b3', N'4fd0292b-1538-4b06-aa74-26477463b909', N'ma1', N'Camry', CAST(1185000000 AS Decimal(18, 0)), 1, CAST(0 AS Decimal(18, 0)), 0)
INSERT [dbo].[HOADONCT] ([id], [idCTSanPham], [idHoaDon], [maSp], [tenSp], [donGia], [soLuong], [tienThua], [trangThai]) VALUES (N'a97e6ee6-74f6-48ca-b7b2-817bc026dc02', N'6a2ae420-5391-4875-8a85-66e46de29a28', N'6d9b89b3-10c3-45e4-9dee-df93c3369ed5', N'ma6', N'Rolls Royce', CAST(31000000000 AS Decimal(18, 0)), 1, CAST(0 AS Decimal(18, 0)), 0)
INSERT [dbo].[HOADONCT] ([id], [idCTSanPham], [idHoaDon], [maSp], [tenSp], [donGia], [soLuong], [tienThua], [trangThai]) VALUES (N'3e37dd5b-77be-464d-bbaf-c553d0c1c8a7', N'30da15fe-ecd7-4e15-af1c-2a68195b9ea8', N'31cb4329-187c-4209-a6bf-11c6a37b63da', N'ma10', N'Huyndai', CAST(600000000 AS Decimal(18, 0)), 1, CAST(0 AS Decimal(18, 0)), 0)
INSERT [dbo].[HOADONCT] ([id], [idCTSanPham], [idHoaDon], [maSp], [tenSp], [donGia], [soLuong], [tienThua], [trangThai]) VALUES (N'91d63acc-a608-443f-b1e9-c75e44c5c5e5', N'9ec07b72-3104-4dd8-98b3-b5179afefbca', N'04b0c953-0588-4ec2-8877-c4c2011924f7', N'ma8', N'Ford', CAST(700000000 AS Decimal(18, 0)), 1, CAST(0 AS Decimal(18, 0)), 0)
INSERT [dbo].[HOADONCT] ([id], [idCTSanPham], [idHoaDon], [maSp], [tenSp], [donGia], [soLuong], [tienThua], [trangThai]) VALUES (N'ec36cc23-c6f0-4621-b4a9-e71a89f6d5fe', N'fa129196-e168-4e7c-a6ff-d43d827045af', N'480deb07-e951-40d6-9752-095905a292e4', N'ma4', N'Morning', CAST(400000000 AS Decimal(18, 0)), 1, CAST(0 AS Decimal(18, 0)), 0)
INSERT [dbo].[HOADONCT] ([id], [idCTSanPham], [idHoaDon], [maSp], [tenSp], [donGia], [soLuong], [tienThua], [trangThai]) VALUES (N'98cc397b-708c-4ee7-abcf-f52a8ccc8f6c', N'e2db8dd9-4cf1-4274-8675-1a845ea630a1', N'18c7e1fa-67f0-41cf-9eef-b4fcfd28c9a9', N'ma2', N'HonDa City', CAST(592000000 AS Decimal(18, 0)), 1, CAST(0 AS Decimal(18, 0)), 0)
GO
INSERT [dbo].[KHACHHANG] ([id], [maKH], [hoTenKH], [ngaySinh], [gioiTinh], [SĐT], [diaChi], [quocGia], [trangThai]) VALUES (N'fd6e04fe-5814-4b3b-aa41-00ce816f202f', N'maKH16', N'Nguyễn Phương Quỳnh Chi', CAST(N'1990-10-17' AS Date), 0, N'0982541258', N'Hà Nội', N'Việt Nam', 0)
INSERT [dbo].[KHACHHANG] ([id], [maKH], [hoTenKH], [ngaySinh], [gioiTinh], [SĐT], [diaChi], [quocGia], [trangThai]) VALUES (N'93a82d13-0271-43fc-a9da-1cd216727599', N'maKH13', N'Quản Thu Hà', CAST(N'1980-06-04' AS Date), 0, N'0342572452', N'Thái Bình', N'Việt Nam', 1)
INSERT [dbo].[KHACHHANG] ([id], [maKH], [hoTenKH], [ngaySinh], [gioiTinh], [SĐT], [diaChi], [quocGia], [trangThai]) VALUES (N'1ab1900f-bb7d-44b6-898f-1dcad47e6ac9', N'maKH14', N'Hà Ngọc Bảo Lam', CAST(N'1999-08-12' AS Date), 0, N'0926745642', N'Cao Bằng', N'Việt Nam', 1)
INSERT [dbo].[KHACHHANG] ([id], [maKH], [hoTenKH], [ngaySinh], [gioiTinh], [SĐT], [diaChi], [quocGia], [trangThai]) VALUES (N'd971b12f-3c90-4581-900d-2052d3f51a67', N'maKH11', N'Trần Thị Sao Băng', CAST(N'1994-10-12' AS Date), 0, N'0934732462', N'Thái Bình', N'Việt Nam', 0)
INSERT [dbo].[KHACHHANG] ([id], [maKH], [hoTenKH], [ngaySinh], [gioiTinh], [SĐT], [diaChi], [quocGia], [trangThai]) VALUES (N'83f54c1a-aa6d-4ced-b0ec-25ee402c6558', N'maKH18', N'Phí Minh Châu', CAST(N'1990-08-02' AS Date), 0, N'0478562874', N'Phú Thọ', N'Việt Nam', 0)
INSERT [dbo].[KHACHHANG] ([id], [maKH], [hoTenKH], [ngaySinh], [gioiTinh], [SĐT], [diaChi], [quocGia], [trangThai]) VALUES (N'bf84a499-b15d-46eb-8fc6-2dbaef4a2d83', N'maKH3', N'Hà Thị Hạnh', CAST(N'1999-10-25' AS Date), 0, N'0648362634', N'Thái Bình', N'Việt Nam', 1)
INSERT [dbo].[KHACHHANG] ([id], [maKH], [hoTenKH], [ngaySinh], [gioiTinh], [SĐT], [diaChi], [quocGia], [trangThai]) VALUES (N'000966a8-ae31-4568-b2db-32934155b2ad', N'maKH1', N'Bùi Đăng Dũng', CAST(N'1999-09-11' AS Date), 1, N'0961745487', N'Hà Nội', N'Việt Nam', 1)
INSERT [dbo].[KHACHHANG] ([id], [maKH], [hoTenKH], [ngaySinh], [gioiTinh], [SĐT], [diaChi], [quocGia], [trangThai]) VALUES (N'3b0a214f-e4b4-477d-aade-4b3a66ed89b4', N'maKH7', N'Trần Thị Xuân', CAST(N'1974-10-10' AS Date), 0, N'0493473742', N'Bến Tre', N'Việt Nam', 0)
INSERT [dbo].[KHACHHANG] ([id], [maKH], [hoTenKH], [ngaySinh], [gioiTinh], [SĐT], [diaChi], [quocGia], [trangThai]) VALUES (N'3d6754a0-eb10-497e-9e2a-5447e8782646', N'maKH4', N'Nguyễn Thị Kim anh', CAST(N'1972-01-22' AS Date), 0, N'0987654218', N'Phú Thọ', N'Việt Nam', 0)
INSERT [dbo].[KHACHHANG] ([id], [maKH], [hoTenKH], [ngaySinh], [gioiTinh], [SĐT], [diaChi], [quocGia], [trangThai]) VALUES (N'b379287e-a625-47ba-8370-5d4ca14f32a5', N'maKH15', N'Chống Thiện Mỹ', CAST(N'1983-12-12' AS Date), 0, N'0613471373', N'Bắc Giang', N'Việt Nam', 1)
INSERT [dbo].[KHACHHANG] ([id], [maKH], [hoTenKH], [ngaySinh], [gioiTinh], [SĐT], [diaChi], [quocGia], [trangThai]) VALUES (N'e399ad5d-b7d9-4a00-ab76-6c825d21fba0', N'maKH12', N'Vương Hoàng Dương', CAST(N'1984-09-12' AS Date), 0, N'0967254524', N'Phú Thọ', N'Việt Nam', 1)
INSERT [dbo].[KHACHHANG] ([id], [maKH], [hoTenKH], [ngaySinh], [gioiTinh], [SĐT], [diaChi], [quocGia], [trangThai]) VALUES (N'23e1c29d-1e6f-4ac5-b737-927f6974f16a', N'maKH8', N'Nguyễn Thùy Trang', CAST(N'1982-04-12' AS Date), 0, N'0984652487', N'Hải Phòng', N'Việt Nam', 0)
INSERT [dbo].[KHACHHANG] ([id], [maKH], [hoTenKH], [ngaySinh], [gioiTinh], [SĐT], [diaChi], [quocGia], [trangThai]) VALUES (N'8edc5acd-dd0f-4e7e-8502-a0e80c08f0bd', N'maKH2', N'Bùi Hồng Bich', CAST(N'1998-01-15' AS Date), 0, N'0373645238', N'TP.Hồ Chí Minh', N'Việt Nam', 0)
INSERT [dbo].[KHACHHANG] ([id], [maKH], [hoTenKH], [ngaySinh], [gioiTinh], [SĐT], [diaChi], [quocGia], [trangThai]) VALUES (N'0e1170ad-7e8d-4dcb-af40-a45d943c1c1c', N'maKH17', N'Trần Thị Tú Đào', CAST(N'2001-06-02' AS Date), 0, N'0934542534', N'Quảng Ninh', N'Việt Nam', 0)
INSERT [dbo].[KHACHHANG] ([id], [maKH], [hoTenKH], [ngaySinh], [gioiTinh], [SĐT], [diaChi], [quocGia], [trangThai]) VALUES (N'307e0076-a14c-48e9-80eb-a7b7baa80e3d', N'maKH9', N'Nguyễn Phương Yến', CAST(N'2000-04-26' AS Date), 0, N'0348324743', N'TP.Hồ Chí Minh', N'Việt Nam', 1)
INSERT [dbo].[KHACHHANG] ([id], [maKH], [hoTenKH], [ngaySinh], [gioiTinh], [SĐT], [diaChi], [quocGia], [trangThai]) VALUES (N'e4122e2d-3a01-4800-8514-c8cb5a6e9151', N'maKH20', N'Quang Thị Hà Trang', CAST(N'1990-03-17' AS Date), 0, N'0976274824', N'Nghệ An', N'Việt Nam', 1)
INSERT [dbo].[KHACHHANG] ([id], [maKH], [hoTenKH], [ngaySinh], [gioiTinh], [SĐT], [diaChi], [quocGia], [trangThai]) VALUES (N'0b46e32f-fb9a-4e35-827b-ced1889cb0b1', N'maKH19', N'Phạm Khánh Linh', CAST(N'1997-12-02' AS Date), 0, N'0943784237', N'Thái Bình', N'Việt Nam', 1)
INSERT [dbo].[KHACHHANG] ([id], [maKH], [hoTenKH], [ngaySinh], [gioiTinh], [SĐT], [diaChi], [quocGia], [trangThai]) VALUES (N'66a23ff1-112e-4fe8-8094-e7d542a545de', N'maKH10 ', N'Phạm Ngọc Hà', CAST(N'1987-12-06' AS Date), 0, N'0952654122', N'Phú Thọ', N'Việt Nam', 1)
INSERT [dbo].[KHACHHANG] ([id], [maKH], [hoTenKH], [ngaySinh], [gioiTinh], [SĐT], [diaChi], [quocGia], [trangThai]) VALUES (N'6ecc9fc0-b840-4e0b-816a-f0277ce50651', N'maKH5', N'Nguyễn Phương Thanh', CAST(N'1971-09-02' AS Date), 0, N'0965267518', N'Hải Phòng', N'Việt Nam', 1)
INSERT [dbo].[KHACHHANG] ([id], [maKH], [hoTenKH], [ngaySinh], [gioiTinh], [SĐT], [diaChi], [quocGia], [trangThai]) VALUES (N'df39f893-e994-47e2-929a-f9c2d20e3523', N'maKH6', N'Nguyễn Quang Huy', CAST(N'1970-09-19' AS Date), 1, N'0982124581', N'Quảng Nam', N'Việt Nam', 0)
GO
INSERT [dbo].[KHUYENMAI] ([id], [ma], [ten], [giamGia], [ngayBD], [ngayKT], [trangThai]) VALUES (N'98ca7d6a-fc51-401a-8005-15e1d0ab5f60', N'KM11', N'KM Thang4', 2500000, CAST(N'2022-04-01' AS Date), CAST(N'2022-04-30' AS Date), 0)
INSERT [dbo].[KHUYENMAI] ([id], [ma], [ten], [giamGia], [ngayBD], [ngayKT], [trangThai]) VALUES (N'954fa502-b5a4-468b-9faa-18db32f6acee', N'KM1', N'KM TET', 5000000, CAST(N'2022-12-01' AS Date), CAST(N'2023-01-22' AS Date), 1)
INSERT [dbo].[KHUYENMAI] ([id], [ma], [ten], [giamGia], [ngayBD], [ngayKT], [trangThai]) VALUES (N'c850e5ae-e624-41ff-9088-32343be6b4a5', N'KM2', N'KM Thang11', 3000000, CAST(N'2022-11-01' AS Date), CAST(N'2022-11-30' AS Date), 0)
INSERT [dbo].[KHUYENMAI] ([id], [ma], [ten], [giamGia], [ngayBD], [ngayKT], [trangThai]) VALUES (N'e33f957c-1ed0-423c-83e3-7067824b398f', N'KM3', N'KM Thang10', 3500000, CAST(N'2022-10-01' AS Date), CAST(N'2022-10-31' AS Date), 0)
INSERT [dbo].[KHUYENMAI] ([id], [ma], [ten], [giamGia], [ngayBD], [ngayKT], [trangThai]) VALUES (N'3b28858b-5a62-4dfc-8cc7-886f1dc310a9', N'KM4', N'KM Thang12', 4000000, CAST(N'2022-12-01' AS Date), CAST(N'2022-12-30' AS Date), 1)
INSERT [dbo].[KHUYENMAI] ([id], [ma], [ten], [giamGia], [ngayBD], [ngayKT], [trangThai]) VALUES (N'0800b114-3df3-45b6-b40a-8f5462562edc', N'KM5', N'KM Thang9', 2500000, CAST(N'2022-09-01' AS Date), CAST(N'2022-09-30' AS Date), 0)
INSERT [dbo].[KHUYENMAI] ([id], [ma], [ten], [giamGia], [ngayBD], [ngayKT], [trangThai]) VALUES (N'6e99691e-972b-400b-8da3-91cdf876f611', N'KM6', N'KM Bl fday', 4500000, CAST(N'2022-11-25' AS Date), CAST(N'2022-11-26' AS Date), 0)
INSERT [dbo].[KHUYENMAI] ([id], [ma], [ten], [giamGia], [ngayBD], [ngayKT], [trangThai]) VALUES (N'5225fb17-155d-46f5-8ba7-938b428d5e20', N'KM12', N'KM Thang3', 3000000, CAST(N'2022-03-01' AS Date), CAST(N'2022-03-31' AS Date), 0)
INSERT [dbo].[KHUYENMAI] ([id], [ma], [ten], [giamGia], [ngayBD], [ngayKT], [trangThai]) VALUES (N'ea601333-44d9-4260-98b6-99637f2af251', N'KM7', N'KM Thang8', 2500000, CAST(N'2022-08-01' AS Date), CAST(N'2022-08-31' AS Date), 0)
INSERT [dbo].[KHUYENMAI] ([id], [ma], [ten], [giamGia], [ngayBD], [ngayKT], [trangThai]) VALUES (N'021286f0-c8eb-4202-9384-d06e98f1dbdf', N'KM8', N'KM Thang7', 3000000, CAST(N'2022-07-01' AS Date), CAST(N'2022-07-31' AS Date), 0)
INSERT [dbo].[KHUYENMAI] ([id], [ma], [ten], [giamGia], [ngayBD], [ngayKT], [trangThai]) VALUES (N'a3430302-b6fc-446c-a39a-e00cc6217cac', N'KM9', N'KM Thang6', 1500000, CAST(N'2022-06-01' AS Date), CAST(N'2022-06-30' AS Date), 0)
INSERT [dbo].[KHUYENMAI] ([id], [ma], [ten], [giamGia], [ngayBD], [ngayKT], [trangThai]) VALUES (N'f879c60d-3c38-45cf-83c3-e38d83b92dcf', N'KM10', N'KM Thang5', 2000000, CAST(N'2022-05-01' AS Date), CAST(N'2022-05-31' AS Date), 0)
GO
INSERT [dbo].[NHANVIEN] ([id], [maNV], [hoTenNv], [vaiTro], [ngaySinh], [gioiTinh], [SĐT], [email], [diaChi], [anh], [luong], [trangThai]) VALUES (N'fd6e04fe-5814-4b3b-aa41-00ce816f202f', N'maNV1', N'Chống Thiện Mỹ', 0, CAST(N'2003-12-12' AS Date), 1, N'0938372422', N'myctph2222@fpt.edu.vn', N'Thái Bình', N'2.jpg', N'7600000', 0)
INSERT [dbo].[NHANVIEN] ([id], [maNV], [hoTenNv], [vaiTro], [ngaySinh], [gioiTinh], [SĐT], [email], [diaChi], [anh], [luong], [trangThai]) VALUES (N'af24dc07-d392-4514-8ec1-0127593b1374', N'maNV2', N'Phạm Khương Duy', 0, CAST(N'2003-07-22' AS Date), 0, N'0961745487', N'duypkph22349@fpt.edu.vn', N'Hà Nội', N'7.jpg', N'7200000', 0)
INSERT [dbo].[NHANVIEN] ([id], [maNV], [hoTenNv], [vaiTro], [ngaySinh], [gioiTinh], [SĐT], [email], [diaChi], [anh], [luong], [trangThai]) VALUES (N'0647f1a9-c4d0-4fb1-a0bb-090a96673e69', N'maNV3', N'Phạm Quỳnh Diễm', 1, CAST(N'2011-03-22' AS Date), 0, N'0429342743', N'diempd2323@fpt.edu.vn', N'Thái Bình', N'1.jpg', N'6000000', 1)
INSERT [dbo].[NHANVIEN] ([id], [maNV], [hoTenNv], [vaiTro], [ngaySinh], [gioiTinh], [SĐT], [email], [diaChi], [anh], [luong], [trangThai]) VALUES (N'fd4d696e-c3e6-4b95-a256-0d0361e16ce9', N'maNV4', N'Bùi Thị Hạnh', 0, CAST(N'2003-09-12' AS Date), 1, N'0743734843', N'hanhpt@fpt.edu.vn', N'Bắc Giang', N'3.jpg', N'6000000', 1)
INSERT [dbo].[NHANVIEN] ([id], [maNV], [hoTenNv], [vaiTro], [ngaySinh], [gioiTinh], [SĐT], [email], [diaChi], [anh], [luong], [trangThai]) VALUES (N'40fbae3a-22ec-4b9e-b7a4-0dfc02695ae8', N'maNV5', N'Minh Văn Hà', 1, CAST(N'2001-12-22' AS Date), 1, N'0348342743', N'havan@fpt.edu.vn', N'Hà Nội', N'4.jpg', N'6400000', 1)
INSERT [dbo].[NHANVIEN] ([id], [maNV], [hoTenNv], [vaiTro], [ngaySinh], [gioiTinh], [SĐT], [email], [diaChi], [anh], [luong], [trangThai]) VALUES (N'0d3c9509-9906-4100-94cf-2d2b254239f9', N'maNV6', N'Vũ Minh Hà', 1, CAST(N'2002-03-23' AS Date), 1, N'0483463463', N'minhpv@fpt.edu.vn', N'Nam Định', N'5.jpg', N'8000000', 0)
INSERT [dbo].[NHANVIEN] ([id], [maNV], [hoTenNv], [vaiTro], [ngaySinh], [gioiTinh], [SĐT], [email], [diaChi], [anh], [luong], [trangThai]) VALUES (N'37a92c43-6ccf-4757-9474-37da1b465a8b', N'maNV7', N'Lê Nga Hằng', 1, CAST(N'2001-01-01' AS Date), 1, N'0324834234', N'quanph22123@fpt.edu.vn', N'Thái Bình', N'6.jpg', N'7200000', 1)
INSERT [dbo].[NHANVIEN] ([id], [maNV], [hoTenNv], [vaiTro], [ngaySinh], [gioiTinh], [SĐT], [email], [diaChi], [anh], [luong], [trangThai]) VALUES (N'7d9d8c6c-95c5-40bb-b1d9-3be682ed8a36', N'maNV8', N'Duy Phạm', 0, CAST(N'2022-01-01' AS Date), 1, N'0938372422', N'duy@fpt.edu.vn', N'Thái Bình', N'10.jpg', N'6400000', 0)
INSERT [dbo].[NHANVIEN] ([id], [maNV], [hoTenNv], [vaiTro], [ngaySinh], [gioiTinh], [SĐT], [email], [diaChi], [anh], [luong], [trangThai]) VALUES (N'e1499d87-1fd9-4de2-b789-3f84cf206c95', N'maNV9', N'Nguyễn Văn Minh', 1, CAST(N'2000-10-11' AS Date), 0, N'0671264648', N'dungpd22@fpt.edu.vn', N'Thái Nguyên', N'4.jpg', N'7200000', 1)
INSERT [dbo].[NHANVIEN] ([id], [maNV], [hoTenNv], [vaiTro], [ngaySinh], [gioiTinh], [SĐT], [email], [diaChi], [anh], [luong], [trangThai]) VALUES (N'52de004d-54e4-49d2-9154-5348da560ad8', N'maNV10', N'Trần Minh Hà', 1, CAST(N'2003-11-20' AS Date), 0, N'0342342343', N'haminhtran@gmail.com', N'Hà Nội', N'6.jpg', N'7200000', 1)
INSERT [dbo].[NHANVIEN] ([id], [maNV], [hoTenNv], [vaiTro], [ngaySinh], [gioiTinh], [SĐT], [email], [diaChi], [anh], [luong], [trangThai]) VALUES (N'9138935e-a3a8-4dc9-8562-700d9f284c08', N'maNV11 ', N'Nguyễn Ngọc Lan', 0, CAST(N'2004-09-09' AS Date), 0, N'0746674255', N'ngoclan@gmail.com', N'Cao Bằng', N'10.jpg', N'7400000', 0)
INSERT [dbo].[NHANVIEN] ([id], [maNV], [hoTenNv], [vaiTro], [ngaySinh], [gioiTinh], [SĐT], [email], [diaChi], [anh], [luong], [trangThai]) VALUES (N'c5f34fd0-e440-4b67-a9c1-879e23ab3480', N'maNV12', N'Phạm Đặng Quỳnh Trang', 1, CAST(N'2005-03-06' AS Date), 0, N'0964756242', N'quyTrang@gmail.com', N'Vinh', N'7.jpg', N'7600000', 0)
INSERT [dbo].[NHANVIEN] ([id], [maNV], [hoTenNv], [vaiTro], [ngaySinh], [gioiTinh], [SĐT], [email], [diaChi], [anh], [luong], [trangThai]) VALUES (N'f4bdd85b-eb43-4aee-ae73-932d8610be19', N'maNV13', N'Nguyễn Khánh Ly', 0, CAST(N'2005-08-01' AS Date), 0, N'0467256484', N'khly@gmail.com', N'Phú Thọ', N'5.jpg', N'7200000', 1)
INSERT [dbo].[NHANVIEN] ([id], [maNV], [hoTenNv], [vaiTro], [ngaySinh], [gioiTinh], [SĐT], [email], [diaChi], [anh], [luong], [trangThai]) VALUES (N'7a31470b-41ab-4ebf-a4c3-990e185dbab8', N'maNV14', N'Nguyễn Minh Anh', 1, CAST(N'2003-03-20' AS Date), 0, N'0349342427', N'anhmn@fpt.edu.vn', N'Hà Nội', N'2.jpg', N'6000000', 1)
INSERT [dbo].[NHANVIEN] ([id], [maNV], [hoTenNv], [vaiTro], [ngaySinh], [gioiTinh], [SĐT], [email], [diaChi], [anh], [luong], [trangThai]) VALUES (N'24b9c5e6-bb50-4626-afd9-c42ab679bcf4', N'maNV15', N'Nguyễn Văn Minh', 1, CAST(N'2003-09-02' AS Date), 1, N'0438437424', N'minhVan22@fpt.edu.vn', N'Hà Nội', N'10.jpg', N'6000000', 1)
INSERT [dbo].[NHANVIEN] ([id], [maNV], [hoTenNv], [vaiTro], [ngaySinh], [gioiTinh], [SĐT], [email], [diaChi], [anh], [luong], [trangThai]) VALUES (N'547ccf52-e570-4e6e-a8dd-d96435a9d6fc', N'maNV16', N'Phạm Văn Đức', 1, CAST(N'2004-12-05' AS Date), 1, N'0734636434', N'ducvp2323@fpt.edu.vn', N'Hà Nội', N'1.jpg', N'6000000', 1)
INSERT [dbo].[NHANVIEN] ([id], [maNV], [hoTenNv], [vaiTro], [ngaySinh], [gioiTinh], [SĐT], [email], [diaChi], [anh], [luong], [trangThai]) VALUES (N'a58a4c00-72b9-4d46-bb08-df153d10d416', N'maNV17', N'Nguyễn Thị Nguyệt Hà', 1, CAST(N'2003-11-12' AS Date), 0, N'0267456453', N'nguyHa@gmail.com', N'Hà Nội', N'6.jpg', N'6800000', 0)
INSERT [dbo].[NHANVIEN] ([id], [maNV], [hoTenNv], [vaiTro], [ngaySinh], [gioiTinh], [SĐT], [email], [diaChi], [anh], [luong], [trangThai]) VALUES (N'0eff7975-9be1-445f-9ddc-f82c74e3443b', N'maNV18', N'Lưu Thị Huế', 0, CAST(N'2003-11-03' AS Date), 1, N'0549574544', N'dsaffjfh@fpt.edu.vn', N'Hà Nội', N'10.jpg', N'6000000', 1)
INSERT [dbo].[NHANVIEN] ([id], [maNV], [hoTenNv], [vaiTro], [ngaySinh], [gioiTinh], [SĐT], [email], [diaChi], [anh], [luong], [trangThai]) VALUES (N'a5619c4f-25e5-49e3-96f7-fcf90f18ddbc', N'maNV19', N'Nguyễn Thị Thúy Hằng', 1, CAST(N'2004-05-03' AS Date), 0, N'0874656733', N'nguyHang@gmail.com', N'Phú Thọ', N'5.jpg', N'9000000', 1)
INSERT [dbo].[NHANVIEN] ([id], [maNV], [hoTenNv], [vaiTro], [ngaySinh], [gioiTinh], [SĐT], [email], [diaChi], [anh], [luong], [trangThai]) VALUES (N'02bd60c3-1ab2-4eac-acdc-fdbf9b79bf9b', N'maNV20', N'Trần Thúy Linh', 0, CAST(N'2000-03-22' AS Date), 1, N'0348423744', N'linhthuytran@fpt.edu.vn', N'Hà Nội', N'1.jpg', N'7400000', 1)
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([id], [name], [price], [category_id]) VALUES (CAST(1 AS Numeric(19, 0)), N'Bàn chải', CAST(10000.00 AS Numeric(19, 2)), CAST(1 AS Numeric(19, 0)))
INSERT [dbo].[Product] ([id], [name], [price], [category_id]) VALUES (CAST(8 AS Numeric(19, 0)), N'Dungna', CAST(1.00 AS Numeric(19, 2)), CAST(1 AS Numeric(19, 0)))
INSERT [dbo].[Product] ([id], [name], [price], [category_id]) VALUES (CAST(9 AS Numeric(19, 0)), N'2', CAST(2.00 AS Numeric(19, 2)), CAST(2 AS Numeric(19, 0)))
INSERT [dbo].[Product] ([id], [name], [price], [category_id]) VALUES (CAST(10 AS Numeric(19, 0)), N'2', CAST(2.00 AS Numeric(19, 2)), CAST(1 AS Numeric(19, 0)))
INSERT [dbo].[Product] ([id], [name], [price], [category_id]) VALUES (CAST(11 AS Numeric(19, 0)), N'23', CAST(33.00 AS Numeric(19, 2)), CAST(2 AS Numeric(19, 0)))
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
INSERT [dbo].[SANPHAM] ([id], [ma], [ten], [anh]) VALUES (N'1ea6fbf9-2bc0-42e3-ba7b-0e0804174807', N'ma10', N'Huyndai', NULL)
INSERT [dbo].[SANPHAM] ([id], [ma], [ten], [anh]) VALUES (N'0b9e8a3e-8920-409e-875f-10e2e494551a', N'ma1', N'Camry', N'Aston.jpg')
INSERT [dbo].[SANPHAM] ([id], [ma], [ten], [anh]) VALUES (N'709f0874-26ec-451d-b041-5178bf650933', N'ma4', N'Morning', N'Oto2.jpg')
INSERT [dbo].[SANPHAM] ([id], [ma], [ten], [anh]) VALUES (N'e103c027-7ee4-46f8-a357-5852116c5501', N'ma3', N'Bugatti', N'Bugatti.jpg')
INSERT [dbo].[SANPHAM] ([id], [ma], [ten], [anh]) VALUES (N'322439ef-2a7f-4d0c-accf-69cb8fffa3e3', N'ma6', N'Rolls Royce', N'Rolls.jpg')
INSERT [dbo].[SANPHAM] ([id], [ma], [ten], [anh]) VALUES (N'c25d6986-e493-48ac-938e-7cb2de5be164', N'ma13', N'Vinfast', NULL)
INSERT [dbo].[SANPHAM] ([id], [ma], [ten], [anh]) VALUES (N'e79dfcc2-f163-4e46-af89-86ac744edf76', N'ma5', N'Lexus', N'lamborghini.jpg')
INSERT [dbo].[SANPHAM] ([id], [ma], [ten], [anh]) VALUES (N'93300f1d-08e8-4ca7-9fa9-a611527aedf3', N'ma12', N'Porsche', NULL)
INSERT [dbo].[SANPHAM] ([id], [ma], [ten], [anh]) VALUES (N'f4bd9b54-eb6e-4048-bf2d-aec784008872', N'ma14', N'Camry', NULL)
INSERT [dbo].[SANPHAM] ([id], [ma], [ten], [anh]) VALUES (N'e89d3bd3-0aa9-4b02-93c3-b9c5685f8ca9', N'ma2', N'HonDa City', N'Rolls.jpg')
INSERT [dbo].[SANPHAM] ([id], [ma], [ten], [anh]) VALUES (N'83953511-acc3-432e-91d8-bd70c686d2f9', N'ma11', N'Madza', NULL)
INSERT [dbo].[SANPHAM] ([id], [ma], [ten], [anh]) VALUES (N'6511c24d-061b-4d99-bfa2-c3b0c9ef8a3e', N'ma7', N'Lamborghini', N'Oto2.jpg')
INSERT [dbo].[SANPHAM] ([id], [ma], [ten], [anh]) VALUES (N'99ec6793-d597-4742-88a8-e756b0962891', N'ma8', N'Ford ', N'Aston.jpg')
INSERT [dbo].[SANPHAM] ([id], [ma], [ten], [anh]) VALUES (N'76ff9ebc-f1a2-4f00-a1aa-fe4197c6ee8b', N'ma9', N'Toyota ', N'Ferrari.jpg')
GO
INSERT [dbo].[USERNAME] ([id], [userName], [password], [email], [comfirmPassword], [vaiTro]) VALUES (N'79b41b65-1639-4edf-a342-22dbdd8c586e', N'duypkph22349', N'12345', N'duypkph22349@fpt.edu.vn', N'1', 1)
INSERT [dbo].[USERNAME] ([id], [userName], [password], [email], [comfirmPassword], [vaiTro]) VALUES (N'9e7ccc4f-9d0e-4e68-b0ae-2c099f754158', N'thinhndph22456', N'12345', N'thinhndph22453@fpt.edu.vn', N'2', 0)
INSERT [dbo].[USERNAME] ([id], [userName], [password], [email], [comfirmPassword], [vaiTro]) VALUES (N'c1a549e2-1843-456f-a150-2d8ed1c661b2', N'thinhnxph22307', N'12345', N'duypkph22349@fpt.edu.vn', N'7', 0)
INSERT [dbo].[USERNAME] ([id], [userName], [password], [email], [comfirmPassword], [vaiTro]) VALUES (N'85173d65-e6a1-40eb-9e66-3ff0dc88f974', N'heheheph123', N'12345', N'duypkph22349@fpt.edu.vn', N'1', 1)
GO
ALTER TABLE [dbo].[CHITIETSP] ADD  CONSTRAINT [DF_CHITIETSP_id]  DEFAULT (newid()) FOR [id]
GO
ALTER TABLE [dbo].[DICHVU] ADD  CONSTRAINT [DF_DICHVU_id]  DEFAULT (newid()) FOR [id]
GO
ALTER TABLE [dbo].[HINHTHUCTT] ADD  CONSTRAINT [DF_HINHTHUCTT_id]  DEFAULT (newid()) FOR [id]
GO
ALTER TABLE [dbo].[HOADON] ADD  CONSTRAINT [DF_HOPDONGCT_id]  DEFAULT (newid()) FOR [id]
GO
ALTER TABLE [dbo].[HOADONCT] ADD  CONSTRAINT [DF_HOADONCT_id]  DEFAULT (newid()) FOR [id]
GO
ALTER TABLE [dbo].[KHACHHANG] ADD  CONSTRAINT [DF_KHACHHANG_id]  DEFAULT (newid()) FOR [id]
GO
ALTER TABLE [dbo].[KHUYENMAI] ADD  CONSTRAINT [DF_VOUCHER_id]  DEFAULT (newid()) FOR [id]
GO
ALTER TABLE [dbo].[NHANVIEN] ADD  CONSTRAINT [DF_NhanVien_id]  DEFAULT (newid()) FOR [id]
GO
ALTER TABLE [dbo].[SANPHAM] ADD  CONSTRAINT [DF_XECHOTHUE_id]  DEFAULT (newid()) FOR [id]
GO
ALTER TABLE [dbo].[SPKHUYENMAI] ADD  CONSTRAINT [DF_SPKHUYENMAI_id]  DEFAULT (newid()) FOR [id]
GO
ALTER TABLE [dbo].[SPKHUYENMAI] ADD  CONSTRAINT [DF_SanPhamVoucher_idVoucher]  DEFAULT (newid()) FOR [idVoucher]
GO
ALTER TABLE [dbo].[USERNAME] ADD  CONSTRAINT [DF_TAIKHOAN_id]  DEFAULT (newid()) FOR [id]
GO
ALTER TABLE [dbo].[CHITIETSP]  WITH CHECK ADD  CONSTRAINT [FK_CHITIETSP_SANPHAM] FOREIGN KEY([idSP])
REFERENCES [dbo].[SANPHAM] ([id])
GO
ALTER TABLE [dbo].[CHITIETSP] CHECK CONSTRAINT [FK_CHITIETSP_SANPHAM]
GO
ALTER TABLE [dbo].[DICHVU]  WITH CHECK ADD  CONSTRAINT [FK_DICHVU_HOADON] FOREIGN KEY([idHoaDon])
REFERENCES [dbo].[HOADON] ([id])
GO
ALTER TABLE [dbo].[DICHVU] CHECK CONSTRAINT [FK_DICHVU_HOADON]
GO
ALTER TABLE [dbo].[DICHVU]  WITH CHECK ADD  CONSTRAINT [FK_DICHVU_KHACHHANG] FOREIGN KEY([idKhachHang])
REFERENCES [dbo].[KHACHHANG] ([id])
GO
ALTER TABLE [dbo].[DICHVU] CHECK CONSTRAINT [FK_DICHVU_KHACHHANG]
GO
ALTER TABLE [dbo].[DICHVU]  WITH CHECK ADD  CONSTRAINT [FK_DICHVU_NHANVIEN] FOREIGN KEY([idNhanVien])
REFERENCES [dbo].[NHANVIEN] ([id])
GO
ALTER TABLE [dbo].[DICHVU] CHECK CONSTRAINT [FK_DICHVU_NHANVIEN]
GO
ALTER TABLE [dbo].[HOADON]  WITH CHECK ADD  CONSTRAINT [FK_HOADON_HINHTHUCTT] FOREIGN KEY([idHTTT])
REFERENCES [dbo].[HINHTHUCTT] ([id])
GO
ALTER TABLE [dbo].[HOADON] CHECK CONSTRAINT [FK_HOADON_HINHTHUCTT]
GO
ALTER TABLE [dbo].[HOADON]  WITH CHECK ADD  CONSTRAINT [FK_HOADON_NHANVIEN] FOREIGN KEY([idNhanVien])
REFERENCES [dbo].[NHANVIEN] ([id])
GO
ALTER TABLE [dbo].[HOADON] CHECK CONSTRAINT [FK_HOADON_NHANVIEN]
GO
ALTER TABLE [dbo].[HOADON]  WITH CHECK ADD  CONSTRAINT [FK_HOPDONG_KHACHHANG] FOREIGN KEY([idKhachHang])
REFERENCES [dbo].[KHACHHANG] ([id])
GO
ALTER TABLE [dbo].[HOADON] CHECK CONSTRAINT [FK_HOPDONG_KHACHHANG]
GO
ALTER TABLE [dbo].[HOADONCT]  WITH CHECK ADD  CONSTRAINT [FK_HOADONCT_CHITIETSP] FOREIGN KEY([idCTSanPham])
REFERENCES [dbo].[CHITIETSP] ([id])
GO
ALTER TABLE [dbo].[HOADONCT] CHECK CONSTRAINT [FK_HOADONCT_CHITIETSP]
GO
ALTER TABLE [dbo].[HOADONCT]  WITH CHECK ADD  CONSTRAINT [FK_HOADONCT_HOADON] FOREIGN KEY([idHoaDon])
REFERENCES [dbo].[HOADON] ([id])
GO
ALTER TABLE [dbo].[HOADONCT] CHECK CONSTRAINT [FK_HOADONCT_HOADON]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FKexqqeaksnmmku5py194ywp140] FOREIGN KEY([category_id])
REFERENCES [dbo].[Category] ([id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FKexqqeaksnmmku5py194ywp140]
GO
ALTER TABLE [dbo].[SPKHUYENMAI]  WITH CHECK ADD  CONSTRAINT [FK_SPKHUYENMAI_KHUYENMAI] FOREIGN KEY([idVoucher])
REFERENCES [dbo].[KHUYENMAI] ([id])
GO
ALTER TABLE [dbo].[SPKHUYENMAI] CHECK CONSTRAINT [FK_SPKHUYENMAI_KHUYENMAI]
GO
ALTER TABLE [dbo].[SPKHUYENMAI]  WITH CHECK ADD  CONSTRAINT [FK_SPKHUYENMAI_SANPHAM] FOREIGN KEY([idSanPham])
REFERENCES [dbo].[SANPHAM] ([id])
GO
ALTER TABLE [dbo].[SPKHUYENMAI] CHECK CONSTRAINT [FK_SPKHUYENMAI_SANPHAM]
GO
USE [master]
GO
ALTER DATABASE [DUAN1] SET  READ_WRITE 
GO
