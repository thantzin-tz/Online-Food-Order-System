USE [master]
GO
/****** Object:  Database [Foodie]    Script Date: 7/10/2022 10:40:33 AM ******/
CREATE DATABASE [Foodie]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Foodie', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Foodie.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Foodie_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Foodie_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Foodie] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Foodie].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Foodie] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Foodie] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Foodie] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Foodie] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Foodie] SET ARITHABORT OFF 
GO
ALTER DATABASE [Foodie] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Foodie] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Foodie] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Foodie] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Foodie] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Foodie] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Foodie] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Foodie] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Foodie] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Foodie] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Foodie] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Foodie] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Foodie] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Foodie] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Foodie] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Foodie] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Foodie] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Foodie] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Foodie] SET  MULTI_USER 
GO
ALTER DATABASE [Foodie] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Foodie] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Foodie] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Foodie] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Foodie] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Foodie] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Foodie] SET QUERY_STORE = OFF
GO
USE [Foodie]
GO
/****** Object:  UserDefinedTableType [dbo].[OrderDetails]    Script Date: 7/10/2022 10:40:33 AM ******/
CREATE TYPE [dbo].[OrderDetails] AS TABLE(
	[OrderNo] [varchar](max) NULL,
	[ProductId] [int] NULL,
	[Quantity] [int] NULL,
	[UserId] [int] NULL,
	[Status] [varchar](50) NULL,
	[PaymentId] [int] NULL,
	[OrderDate] [datetime] NULL
)
GO
/****** Object:  Table [dbo].[admin]    Script Date: 7/10/2022 10:40:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[admin](
	[name] [varchar](50) NULL,
	[email] [varchar](50) NULL,
	[password] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Carts]    Script Date: 7/10/2022 10:40:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Carts](
	[CartId] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NULL,
	[Quantity] [int] NULL,
	[UserId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[CartId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 7/10/2022 10:40:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[ImageUrl] [varchar](max) NULL,
	[IsActive] [bit] NULL,
	[CreatedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contact]    Script Date: 7/10/2022 10:40:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contact](
	[ContactId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[Subject] [varchar](200) NULL,
	[Message] [varchar](max) NULL,
	[CreatedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ContactId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 7/10/2022 10:40:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[OrderNo] [varchar](max) NULL,
	[ProductId] [int] NULL,
	[Quantity] [int] NULL,
	[UserId] [int] NULL,
	[Status] [varchar](50) NULL,
	[PaymentId] [int] NULL,
	[OrderDate] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 7/10/2022 10:40:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderDetailsId] [int] IDENTITY(1,1) NOT NULL,
	[OrderNo] [varchar](max) NULL,
	[ProductId] [int] NULL,
	[Quantity] [int] NULL,
	[UserId] [int] NULL,
	[Status] [varchar](50) NULL,
	[PaymentId] [int] NULL,
	[OrderDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderDetailsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payment]    Script Date: 7/10/2022 10:40:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payment](
	[PaymentId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[CardNo] [varchar](50) NULL,
	[ExpiryDate] [varchar](50) NULL,
	[CvvNo] [int] NULL,
	[Address] [varchar](max) NULL,
	[PaymentMode] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[PaymentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 7/10/2022 10:40:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[Description] [varchar](max) NULL,
	[Price] [decimal](18, 2) NULL,
	[Quantity] [int] NULL,
	[ImageUrl] [varchar](max) NULL,
	[CategoryId] [int] NULL,
	[IsActive] [bit] NULL,
	[CreatedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 7/10/2022 10:40:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[Username] [varchar](50) NULL,
	[Mobile] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[Address] [varchar](max) NULL,
	[PostCode] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
	[ImageUrl] [varchar](max) NULL,
	[CreatedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Carts] ON 

INSERT [dbo].[Carts] ([CartId], [ProductId], [Quantity], [UserId]) VALUES (26, 2, 1, 2)
INSERT [dbo].[Carts] ([CartId], [ProductId], [Quantity], [UserId]) VALUES (29, 6, 1, 14)
SET IDENTITY_INSERT [dbo].[Carts] OFF
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([CategoryId], [Name], [ImageUrl], [IsActive], [CreatedDate]) VALUES (1, N'Korean Food', N'Images/Category/d74d996b-1a17-4270-93a7-1993ab28f3be.jpg', 1, CAST(N'2022-10-05T12:17:38.373' AS DateTime))
INSERT [dbo].[Categories] ([CategoryId], [Name], [ImageUrl], [IsActive], [CreatedDate]) VALUES (2, N'Japanese Food', N'Images/Category/af34455b-3048-4c38-8028-0e624267c2a4.jpg', 1, CAST(N'2022-10-05T12:17:54.923' AS DateTime))
INSERT [dbo].[Categories] ([CategoryId], [Name], [ImageUrl], [IsActive], [CreatedDate]) VALUES (3, N'Chinese Food', N'Images/Category/c13e15c4-7e94-4ac7-91b3-4de8e94aa8e8.jpg', 1, CAST(N'2022-10-05T18:27:10.093' AS DateTime))
INSERT [dbo].[Categories] ([CategoryId], [Name], [ImageUrl], [IsActive], [CreatedDate]) VALUES (4, N'Thai Food', N'Images/Category/629131de-0657-4e29-8c34-679c4aa0d8a4.jpg', 1, CAST(N'2022-10-05T18:27:55.657' AS DateTime))
INSERT [dbo].[Categories] ([CategoryId], [Name], [ImageUrl], [IsActive], [CreatedDate]) VALUES (5, N'Myanmar Food', N'Images/Category/6bd425dd-aac3-4365-829e-60e83663578a.jpg', 1, CAST(N'2022-10-05T18:29:56.653' AS DateTime))
INSERT [dbo].[Categories] ([CategoryId], [Name], [ImageUrl], [IsActive], [CreatedDate]) VALUES (6, N'Italian food', N'Images/Category/2af2cbf8-6754-492e-95bc-e2839bc32217.jpg', 0, CAST(N'2022-10-05T18:35:19.047' AS DateTime))
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Contact] ON 

INSERT [dbo].[Contact] ([ContactId], [Name], [Email], [Subject], [Message], [CreatedDate]) VALUES (2, N'Thant Zin Lin', N'thantzin@gmail.com', N'Best Recommand', N'One of the reasons that people enjoy coming to a great restaurant is that when an extraordinary meal is placed in front of them, they feel honored, respected, and even a little bit loved.', CAST(N'2022-10-05T21:01:52.720' AS DateTime))
SET IDENTITY_INSERT [dbo].[Contact] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([OrderDetailsId], [OrderNo], [ProductId], [Quantity], [UserId], [Status], [PaymentId], [OrderDate]) VALUES (1, N'cdb5c88c-ca18-4e1d-b77e-69d52307762c', 2, 1, 1, N'Delivered', 1, CAST(N'2022-10-05T12:23:52.403' AS DateTime))
INSERT [dbo].[Orders] ([OrderDetailsId], [OrderNo], [ProductId], [Quantity], [UserId], [Status], [PaymentId], [OrderDate]) VALUES (2, N'7b74681f-41aa-4967-a7fc-51b5d0ef19c0', 2, 3, 1, N'Credit Card Err', 2, CAST(N'2022-10-05T14:46:06.317' AS DateTime))
INSERT [dbo].[Orders] ([OrderDetailsId], [OrderNo], [ProductId], [Quantity], [UserId], [Status], [PaymentId], [OrderDate]) VALUES (3, N'c4067823-e561-4e7d-8c3c-8057bffc472b', 5, 1, 2, N'Pending', 3, CAST(N'2022-10-05T20:30:23.160' AS DateTime))
INSERT [dbo].[Orders] ([OrderDetailsId], [OrderNo], [ProductId], [Quantity], [UserId], [Status], [PaymentId], [OrderDate]) VALUES (4, N'e25697ac-37e9-42b2-8c52-243c5fc7fcda', 7, 2, 2, N'Pending', 3, CAST(N'2022-10-05T20:30:23.163' AS DateTime))
INSERT [dbo].[Orders] ([OrderDetailsId], [OrderNo], [ProductId], [Quantity], [UserId], [Status], [PaymentId], [OrderDate]) VALUES (5, N'8e7a5946-6fc5-4d30-83c9-9cb9c4b561b6', 6, 1, 5, N'Credit Card Err', 4, CAST(N'2022-10-05T23:40:13.860' AS DateTime))
INSERT [dbo].[Orders] ([OrderDetailsId], [OrderNo], [ProductId], [Quantity], [UserId], [Status], [PaymentId], [OrderDate]) VALUES (7, N'd5a8ee31-ce4a-4934-b6e6-36d37611a52e', 6, 1, 5, N'Pending', 7, CAST(N'2022-10-05T23:48:04.167' AS DateTime))
INSERT [dbo].[Orders] ([OrderDetailsId], [OrderNo], [ProductId], [Quantity], [UserId], [Status], [PaymentId], [OrderDate]) VALUES (8, N'64296c52-43a8-4ed9-b907-0ba7b7484181', 3, 2, 3, N'Delivered', 8, CAST(N'2022-10-05T23:54:29.440' AS DateTime))
INSERT [dbo].[Orders] ([OrderDetailsId], [OrderNo], [ProductId], [Quantity], [UserId], [Status], [PaymentId], [OrderDate]) VALUES (9, N'a5c7f9e7-bdd6-4a06-84c9-4b6e4c3c58a0', 6, 1, 3, N'Delivered', 8, CAST(N'2022-10-05T23:54:29.440' AS DateTime))
INSERT [dbo].[Orders] ([OrderDetailsId], [OrderNo], [ProductId], [Quantity], [UserId], [Status], [PaymentId], [OrderDate]) VALUES (10, N'59f8607a-1594-493f-8c6c-f44da38a44f4', 2, 2, 1, N'Pending', 9, CAST(N'2022-10-06T08:31:17.487' AS DateTime))
INSERT [dbo].[Orders] ([OrderDetailsId], [OrderNo], [ProductId], [Quantity], [UserId], [Status], [PaymentId], [OrderDate]) VALUES (11, N'81307d84-c979-4201-9bbf-e9052ee860e2', 6, 1, 5, N'Delivered', 10, CAST(N'2022-10-06T09:32:58.463' AS DateTime))
INSERT [dbo].[Orders] ([OrderDetailsId], [OrderNo], [ProductId], [Quantity], [UserId], [Status], [PaymentId], [OrderDate]) VALUES (12, N'2c3a5d03-731a-47f0-9aed-24a650c55389', 5, 1, 1, N'Pending', 11, CAST(N'2022-10-06T10:13:26.170' AS DateTime))
INSERT [dbo].[Orders] ([OrderDetailsId], [OrderNo], [ProductId], [Quantity], [UserId], [Status], [PaymentId], [OrderDate]) VALUES (13, N'c45d7736-4945-4a68-8ff8-f089cec0e2ae', 3, 1, 1, N'Pending', 12, CAST(N'2022-10-06T10:14:56.020' AS DateTime))
INSERT [dbo].[Orders] ([OrderDetailsId], [OrderNo], [ProductId], [Quantity], [UserId], [Status], [PaymentId], [OrderDate]) VALUES (14, N'297000f4-d173-4704-bd48-b18c40786943', 2, 1, 5, N'Pending', 13, CAST(N'2022-10-06T10:19:05.883' AS DateTime))
INSERT [dbo].[Orders] ([OrderDetailsId], [OrderNo], [ProductId], [Quantity], [UserId], [Status], [PaymentId], [OrderDate]) VALUES (15, N'f1133c80-ccc8-4762-9f65-137e14923ba1', 4, 1, 3, N'Pending', 14, CAST(N'2022-10-06T10:29:39.990' AS DateTime))
INSERT [dbo].[Orders] ([OrderDetailsId], [OrderNo], [ProductId], [Quantity], [UserId], [Status], [PaymentId], [OrderDate]) VALUES (16, N'290485d6-f6a6-4e32-add0-bb70b9125928', 1, 1, 5, N'Delivered', 15, CAST(N'2022-10-06T11:02:39.457' AS DateTime))
INSERT [dbo].[Orders] ([OrderDetailsId], [OrderNo], [ProductId], [Quantity], [UserId], [Status], [PaymentId], [OrderDate]) VALUES (17, N'30eee296-5988-4b96-8dde-d5a60f5df72d', 3, 1, 5, N'Pending', 15, CAST(N'2022-10-06T11:02:39.457' AS DateTime))
INSERT [dbo].[Orders] ([OrderDetailsId], [OrderNo], [ProductId], [Quantity], [UserId], [Status], [PaymentId], [OrderDate]) VALUES (18, N'5f8b5d7a-91e9-4afb-b644-3e1c21d75e5a', 3, 1, 1, N'Pending', 16, CAST(N'2022-10-06T12:43:09.813' AS DateTime))
INSERT [dbo].[Orders] ([OrderDetailsId], [OrderNo], [ProductId], [Quantity], [UserId], [Status], [PaymentId], [OrderDate]) VALUES (19, N'74478a08-50f2-4f2b-b17f-27d4ccefd703', 5, 5, 3, N'Pending', 17, CAST(N'2022-10-06T14:10:42.637' AS DateTime))
INSERT [dbo].[Orders] ([OrderDetailsId], [OrderNo], [ProductId], [Quantity], [UserId], [Status], [PaymentId], [OrderDate]) VALUES (20, N'a9390214-95cf-4e31-9629-3751da5c8f8f', 2, 2, 14, N'Delivered', 18, CAST(N'2022-10-07T09:43:02.233' AS DateTime))
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Payment] ON 

INSERT [dbo].[Payment] ([PaymentId], [Name], [CardNo], [ExpiryDate], [CvvNo], [Address], [PaymentMode]) VALUES (1, N'Thant Zin Lin', N'************1111', N'09/2022', 123, N'Hlaing Tsp', N'card')
INSERT [dbo].[Payment] ([PaymentId], [Name], [CardNo], [ExpiryDate], [CvvNo], [Address], [PaymentMode]) VALUES (2, N'Thant Zin Lin', N'************1235', N'09/2022', 222, N'Yangon, Hlaing', N'card')
INSERT [dbo].[Payment] ([PaymentId], [Name], [CardNo], [ExpiryDate], [CvvNo], [Address], [PaymentMode]) VALUES (3, N'', N'', N'', 0, N'Yangon, Kamayut Township', N'cod')
INSERT [dbo].[Payment] ([PaymentId], [Name], [CardNo], [ExpiryDate], [CvvNo], [Address], [PaymentMode]) VALUES (4, N'', N'', N'', 0, N'Magway', N'cod')
INSERT [dbo].[Payment] ([PaymentId], [Name], [CardNo], [ExpiryDate], [CvvNo], [Address], [PaymentMode]) VALUES (5, N'', N'', N'', 0, N'Taungdwingyi', N'cod')
INSERT [dbo].[Payment] ([PaymentId], [Name], [CardNo], [ExpiryDate], [CvvNo], [Address], [PaymentMode]) VALUES (6, N'', N'', N'', 0, N'Taungdwingyi', N'cod')
INSERT [dbo].[Payment] ([PaymentId], [Name], [CardNo], [ExpiryDate], [CvvNo], [Address], [PaymentMode]) VALUES (7, N'', N'', N'', 0, N'Mgy', N'cod')
INSERT [dbo].[Payment] ([PaymentId], [Name], [CardNo], [ExpiryDate], [CvvNo], [Address], [PaymentMode]) VALUES (8, N'Mg Mg', N'************3456', N'12/2022', 123, N'Yanogn, Yangon, Yangon, Yanogn, Yangon, Yangon, Yanogn, Yangon, Yangon, Yanogn, Yangon, Yangon,', N'card')
INSERT [dbo].[Payment] ([PaymentId], [Name], [CardNo], [ExpiryDate], [CvvNo], [Address], [PaymentMode]) VALUES (9, N'Thant Zin Lin', N'0987654321123456', N'12/2023', 123, N'Yangon', N'card')
INSERT [dbo].[Payment] ([PaymentId], [Name], [CardNo], [ExpiryDate], [CvvNo], [Address], [PaymentMode]) VALUES (10, N'', N'', N'', 0, N'Hlaing', N'cod')
INSERT [dbo].[Payment] ([PaymentId], [Name], [CardNo], [ExpiryDate], [CvvNo], [Address], [PaymentMode]) VALUES (11, N'', N'', N'', 0, N'Yangon', N'cod')
INSERT [dbo].[Payment] ([PaymentId], [Name], [CardNo], [ExpiryDate], [CvvNo], [Address], [PaymentMode]) VALUES (12, N'Thant Zin Lin', N'************3456', N'09/2023', 123, N'Yangon', N'card')
INSERT [dbo].[Payment] ([PaymentId], [Name], [CardNo], [ExpiryDate], [CvvNo], [Address], [PaymentMode]) VALUES (13, N'Thiri', N'************3456', N'12/2022', 123, N'Mgy', N'card')
INSERT [dbo].[Payment] ([PaymentId], [Name], [CardNo], [ExpiryDate], [CvvNo], [Address], [PaymentMode]) VALUES (14, N'', N'', N'', 0, N'Mandalay', N'cod')
INSERT [dbo].[Payment] ([PaymentId], [Name], [CardNo], [ExpiryDate], [CvvNo], [Address], [PaymentMode]) VALUES (15, N'', N'', N'', 0, N'Ygon', N'cod')
INSERT [dbo].[Payment] ([PaymentId], [Name], [CardNo], [ExpiryDate], [CvvNo], [Address], [PaymentMode]) VALUES (16, N'', N'', N'', 0, N'dfsdfsdf', N'cod')
INSERT [dbo].[Payment] ([PaymentId], [Name], [CardNo], [ExpiryDate], [CvvNo], [Address], [PaymentMode]) VALUES (17, N'Mg Mg', N'************3456', N'09/2022', 123, N'Ygn', N'card')
INSERT [dbo].[Payment] ([PaymentId], [Name], [CardNo], [ExpiryDate], [CvvNo], [Address], [PaymentMode]) VALUES (18, N'Aung Aung', N'************3456', N'01/2023', 123, N'Hlaing, Yangon', N'card')
SET IDENTITY_INSERT [dbo].[Payment] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([ProductId], [Name], [Description], [Price], [Quantity], [ImageUrl], [CategoryId], [IsActive], [CreatedDate]) VALUES (1, N'Sushi', N'The Japanese Food', CAST(7500.00 AS Decimal(18, 2)), 3, N'Images/Product/84aa7e85-3bdd-4aea-ac99-2cf8ab615fe1.jpg', 2, 1, CAST(N'2022-10-05T12:18:39.093' AS DateTime))
INSERT [dbo].[Products] ([ProductId], [Name], [Description], [Price], [Quantity], [ImageUrl], [CategoryId], [IsActive], [CreatedDate]) VALUES (2, N'Soft Tofu Stew', N'The Korean Food', CAST(4550.00 AS Decimal(18, 2)), 4, N'Images/Product/7fed63d4-2362-424a-905a-498ca2e356c2.jpg', 1, 1, CAST(N'2022-10-05T12:19:22.827' AS DateTime))
INSERT [dbo].[Products] ([ProductId], [Name], [Description], [Price], [Quantity], [ImageUrl], [CategoryId], [IsActive], [CreatedDate]) VALUES (3, N'Mont Hin Gar', N'The Myanmar Food', CAST(1500.00 AS Decimal(18, 2)), 5, N'Images/Product/9dc47199-e97b-427e-8ba2-89f5abce6a10.jpg', 5, 1, CAST(N'2022-10-05T18:30:49.287' AS DateTime))
INSERT [dbo].[Products] ([ProductId], [Name], [Description], [Price], [Quantity], [ImageUrl], [CategoryId], [IsActive], [CreatedDate]) VALUES (4, N'Kway Teow (noodle soup)', N'Thaijdfslskjfljsd
fdsfjklsfjlkdsjf
dsfjdkslfjlksjf', CAST(2000.00 AS Decimal(18, 2)), 14, N'Images/Product/66e15c68-0ebc-4c47-87f5-a305bd109085.jpg', 4, 1, CAST(N'2022-10-05T18:37:32.197' AS DateTime))
INSERT [dbo].[Products] ([ProductId], [Name], [Description], [Price], [Quantity], [ImageUrl], [CategoryId], [IsActive], [CreatedDate]) VALUES (5, N'Ramen', N'The Japanese Food.', CAST(5500.00 AS Decimal(18, 2)), 5, N'Images/Product/cc48c207-1e3b-41f3-a8ea-1bf8528ad6ac.jpg', 2, 1, CAST(N'2022-10-05T18:38:30.620' AS DateTime))
INSERT [dbo].[Products] ([ProductId], [Name], [Description], [Price], [Quantity], [ImageUrl], [CategoryId], [IsActive], [CreatedDate]) VALUES (6, N'korean-rice-cakes', N'The Korean Food', CAST(4550.00 AS Decimal(18, 2)), 0, N'Images/Product/d2a5e7dd-b3a1-4168-ac18-168c9fe1f513.jpg', 1, 1, CAST(N'2022-10-05T18:40:32.333' AS DateTime))
INSERT [dbo].[Products] ([ProductId], [Name], [Description], [Price], [Quantity], [ImageUrl], [CategoryId], [IsActive], [CreatedDate]) VALUES (7, N'Szechwan Chilli Chicken', N'The Korean Food. The Korean Food. The Korean Food. The Korean Food.', CAST(7800.00 AS Decimal(18, 2)), 8, N'Images/Product/b518fad6-960c-4607-9ade-b2d47ab4e2dc.jpg', 3, 1, CAST(N'2022-10-05T18:42:56.143' AS DateTime))
INSERT [dbo].[Products] ([ProductId], [Name], [Description], [Price], [Quantity], [ImageUrl], [CategoryId], [IsActive], [CreatedDate]) VALUES (8, N'Tonkatsu', N'The Japanese Food', CAST(7500.00 AS Decimal(18, 2)), 12, N'Images/Product/fd94d114-ff39-4fff-9be7-b218bc4832b9.jpg', 2, 1, CAST(N'2022-10-06T19:57:54.397' AS DateTime))
INSERT [dbo].[Products] ([ProductId], [Name], [Description], [Price], [Quantity], [ImageUrl], [CategoryId], [IsActive], [CreatedDate]) VALUES (9, N'Udon', N'The Japanese food.', CAST(6700.00 AS Decimal(18, 2)), 7, N'Images/Product/1c07bf4f-b844-4f39-83ec-b5664b8052e2.jpg', 2, 1, CAST(N'2022-10-06T20:00:33.213' AS DateTime))
INSERT [dbo].[Products] ([ProductId], [Name], [Description], [Price], [Quantity], [ImageUrl], [CategoryId], [IsActive], [CreatedDate]) VALUES (10, N'Bibimbap', N'The japanese food.', CAST(7800.00 AS Decimal(18, 2)), 10, N'Images/Product/6c4ff2ee-5cc0-44de-8ac5-947617861c53.jpg', 1, 1, CAST(N'2022-10-06T20:14:22.007' AS DateTime))
INSERT [dbo].[Products] ([ProductId], [Name], [Description], [Price], [Quantity], [ImageUrl], [CategoryId], [IsActive], [CreatedDate]) VALUES (11, N'Spring Rolls', N'Chinese Food', CAST(10500.00 AS Decimal(18, 2)), 8, N'Images/Product/5d801330-6d2e-44c6-aba1-03a3a72baa30.jpg', 3, 1, CAST(N'2022-10-06T20:18:24.673' AS DateTime))
INSERT [dbo].[Products] ([ProductId], [Name], [Description], [Price], [Quantity], [ImageUrl], [CategoryId], [IsActive], [CreatedDate]) VALUES (12, N'Nangyi Thoke', N'Myanmar food', CAST(1700.00 AS Decimal(18, 2)), 15, N'Images/Product/50c561c7-5fca-4864-a9d0-24e72bbb8e04.jpg', 5, 1, CAST(N'2022-10-06T20:22:01.780' AS DateTime))
INSERT [dbo].[Products] ([ProductId], [Name], [Description], [Price], [Quantity], [ImageUrl], [CategoryId], [IsActive], [CreatedDate]) VALUES (13, N'Burmese Tempura (Akyaw Sone)', N'Myanmar Food', CAST(7900.00 AS Decimal(18, 2)), 20, N'Images/Product/04425dc5-70e3-49ac-be10-a84ff0c94b46.jpg', 5, 1, CAST(N'2022-10-06T20:24:06.100' AS DateTime))
INSERT [dbo].[Products] ([ProductId], [Name], [Description], [Price], [Quantity], [ImageUrl], [CategoryId], [IsActive], [CreatedDate]) VALUES (14, N'Massaman Curry', N'Thai Food', CAST(1500.00 AS Decimal(18, 2)), 5, N'Images/Product/701588e5-8d5f-4218-a876-0a434b2527f3.jpg', 4, 1, CAST(N'2022-10-06T20:29:35.613' AS DateTime))
INSERT [dbo].[Products] ([ProductId], [Name], [Description], [Price], [Quantity], [ImageUrl], [CategoryId], [IsActive], [CreatedDate]) VALUES (15, N'Tempura', N'The Japanese food', CAST(8800.00 AS Decimal(18, 2)), 10, N'Images/Product/667f3044-3416-431f-9f9f-1beab5dd32fe.jpg', 2, 1, CAST(N'2022-10-07T09:36:15.110' AS DateTime))
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserId], [Name], [Username], [Mobile], [Email], [Address], [PostCode], [Password], [ImageUrl], [CreatedDate]) VALUES (1, N'Thant Zin Lin', N'thantzin777', N'0977764564', N'thantzin@gmail.com', N'Yangon, Hlaing Township', N'123434', N'123', N'Images/User/f6a667e4-e9e9-4bd9-8a5d-2b336df3b49f.jpg', CAST(N'2022-10-05T12:20:50.417' AS DateTime))
INSERT [dbo].[Users] ([UserId], [Name], [Username], [Mobile], [Email], [Address], [PostCode], [Password], [ImageUrl], [CreatedDate]) VALUES (2, N'Myat Noe Aye', N'myatnoeaye', N'0983847472', N'myatnoeaye@gmail.com', N'Yangon, Yangon', N'897678', N'123', N'Images/User/28be050e-7737-4b52-8252-a4ba93b4c16b.jpg', CAST(N'2022-10-05T16:46:40.937' AS DateTime))
INSERT [dbo].[Users] ([UserId], [Name], [Username], [Mobile], [Email], [Address], [PostCode], [Password], [ImageUrl], [CreatedDate]) VALUES (3, N'Mg Mg', N'mgmg', N'09888877777', N'mg@gm', N'Magway', N'123456', N'123456', NULL, CAST(N'2022-10-05T17:01:11.617' AS DateTime))
INSERT [dbo].[Users] ([UserId], [Name], [Username], [Mobile], [Email], [Address], [PostCode], [Password], [ImageUrl], [CreatedDate]) VALUES (5, N'Thiri', N'thiri', N'093849348939', N'thiri@gmail.com', N'Yangon', N'123455', N'123', NULL, CAST(N'2022-10-05T17:44:28.257' AS DateTime))
INSERT [dbo].[Users] ([UserId], [Name], [Username], [Mobile], [Email], [Address], [PostCode], [Password], [ImageUrl], [CreatedDate]) VALUES (13, N'Myo Myo', N'myomyo', N'097773748374', N'myo@gmail.com', N'Myanmar', N'123455', N'123', NULL, CAST(N'2022-10-05T22:44:54.260' AS DateTime))
INSERT [dbo].[Users] ([UserId], [Name], [Username], [Mobile], [Email], [Address], [PostCode], [Password], [ImageUrl], [CreatedDate]) VALUES (14, N'Aung Aung', N'aungaung', N'09887777777', N'aung@gmail.com', N'Yangon, Myanmar', N'123456', N'123', NULL, CAST(N'2022-10-07T09:40:45.920' AS DateTime))
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Username]    Script Date: 7/10/2022 10:40:33 AM ******/
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [Username] UNIQUE NONCLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Carts]  WITH CHECK ADD FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([ProductId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Carts]  WITH CHECK ADD  CONSTRAINT [FK__Carts__UserId__403A8C7D] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Carts] CHECK CONSTRAINT [FK__Carts__UserId__403A8C7D]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([PaymentId])
REFERENCES [dbo].[Payment] ([PaymentId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([ProductId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK__Orders__UserId__45F365D3] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK__Orders__UserId__45F365D3]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([CategoryId])
ON DELETE CASCADE
GO
/****** Object:  StoredProcedure [dbo].[Cart_Crud]    Script Date: 7/10/2022 10:40:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Cart_Crud]
	-- Add the parameters for the stored procedure here
	@Action VARCHAR(10),
	@ProductId INT = NULL,
	@Quantity INT = NULL,
	@UserId INT = NULL
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    --SELECT
    IF @Action = 'SELECT'
      BEGIN
			SELECT c.ProductId,p.Name,p.ImageUrl,p.Price,c.Quantity,c.Quantity as Qty,p.Quantity as PrdQty FROM dbo.Carts c
			INNER JOIN dbo.Products p ON p.ProductId = c.ProductId
			WHERE c.UserId = @UserId
      END
 
    --INSERT
    IF @Action = 'INSERT'
      BEGIN
            INSERT INTO dbo.Carts(ProductId, Quantity, UserId)
            VALUES (@ProductId, @Quantity, @UserId)
      END
 
    --UPDATE
    IF @Action = 'UPDATE'
      BEGIN		
			UPDATE dbo.Carts
			SET Quantity = @Quantity
			WHERE ProductId = @ProductId and UserId = @UserId		
      END
 
    --DELETE
    IF @Action = 'DELETE'
      BEGIN
            DELETE FROM dbo.Carts WHERE ProductId = @ProductId and UserId = @UserId
      END

	--GETBYID
    IF @Action = 'GETBYID'
      BEGIN
			SELECT * FROM dbo.Carts WHERE ProductId = @ProductId and UserId = @UserId
      END

END
GO
/****** Object:  StoredProcedure [dbo].[Category_Crud]    Script Date: 7/10/2022 10:40:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Category_Crud]
	-- Add the parameters for the stored procedure here
	@Action VARCHAR(10),
	@CategoryId INT = NULL,
	@Name VARCHAR(100) = NULL,
	@IsActive BIT = false,
	@ImageUrl VARCHAR(MAX) = NULL
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    --SELECT
    IF @Action = 'SELECT'
      BEGIN
            SELECT * FROM dbo.Categories ORDER BY CreatedDate DESC
      END
 
    --INSERT
    IF @Action = 'INSERT'
      BEGIN
            INSERT INTO dbo.Categories(Name, ImageUrl, IsActive, CreatedDate)
            VALUES (@Name, @ImageUrl, @IsActive, GETDATE())
      END
 
    --UPDATE
    IF @Action = 'UPDATE'
      BEGIN
		DECLARE @UPDATE_IMAGE VARCHAR(20)
		SELECT @UPDATE_IMAGE = (CASE WHEN @ImageUrl IS NULL THEN 'NO' ELSE 'YES' END)
		IF @UPDATE_IMAGE = 'NO'
			BEGIN
				UPDATE dbo.Categories
				SET Name = @Name, IsActive = @IsActive
				WHERE CategoryId = @CategoryId
			END
		ELSE
			BEGIN
				UPDATE dbo.Categories
				SET Name = @Name, ImageUrl = @ImageUrl, IsActive = @IsActive
				WHERE CategoryId = @CategoryId
			END
      END
 
    --DELETE
    IF @Action = 'DELETE'
      BEGIN
            DELETE FROM dbo.Categories WHERE CategoryId = @CategoryId
      END

	--GETBYID
    IF @Action = 'GETBYID'
      BEGIN
            SELECT * FROM dbo.Categories WHERE CategoryId = @CategoryId
      END

END
GO
/****** Object:  StoredProcedure [dbo].[ContactSp]    Script Date: 7/10/2022 10:40:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ContactSp]
	-- Add the parameters for the stored procedure here
	@Action VARCHAR(10),
	@ContactId INT = NULL,
	@Name VARCHAR(50) = NULL,
	@Email VARCHAR(50) = NULL,
	@Subject VARCHAR(200) = NULL,
	@Message VARCHAR(MAX) = NULL
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    --INSERT
	IF @Action = 'INSERT'
      BEGIN
            INSERT INTO dbo.Contact(Name, Email, Subject, Message, CreatedDate)
            VALUES (@Name, @Email, @Subject, @Message, GETDATE())
      END

	--SELECT
    IF @Action = 'SELECT'
      BEGIN
            SELECT ROW_NUMBER() OVER(ORDER BY (SELECT 1)) AS [SrNo],* FROM dbo.Contact
      END

	--DELETE BY ADMIN
    IF @Action = 'DELETE'
      BEGIN
            DELETE FROM dbo.Contact WHERE ContactId = @ContactId
      END

END
GO
/****** Object:  StoredProcedure [dbo].[Dashboard]    Script Date: 7/10/2022 10:40:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Dashboard]
	-- Add the parameters for the stored procedure here
	@Action VARCHAR(20) = NULL
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    --1.Categories
	IF @Action = 'CATEGORY'
	BEGIN
		SELECT COUNT(*) FROM dbo.Categories
	END

	--2.Products
	IF @Action = 'PRODUCT'
	BEGIN
		SELECT COUNT(*) FROM dbo.Products
	END

	--3.Orders
	IF @Action = 'ORDER'
	BEGIN
		SELECT COUNT(*) FROM dbo.Orders
	END

	--4.Orders Delivered
	IF @Action = 'DELIVERED'
	BEGIN
		SELECT COUNT(*) FROM dbo.Orders 
		WHERE Status = 'Delivered'
	END

	--5.Orders Pending
	IF @Action = 'PENDING'
	BEGIN
		SELECT COUNT(*) FROM dbo.Orders 
		WHERE Status IN ('Pending','Dispatched')
	END

	--6.Users
	IF @Action = 'USER'
	BEGIN
		SELECT COUNT(*) FROM dbo.Users
	END

	--Sold Item Cost
	IF @Action = 'SOLDAMOUNT'
	BEGIN
		SELECT SUM(o.Quantity * p.Price) FROM Orders o
		INNER JOIN Products p ON p.ProductId = o.ProductId
	END

	--Contact
	IF @Action = 'CONTACT'
	BEGIN
		SELECT COUNT(*) FROM dbo.Contact
	END

END
GO
/****** Object:  StoredProcedure [dbo].[Invoice]    Script Date: 7/10/2022 10:40:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Invoice]
	@Action VARCHAR(10),
	@PaymentId INT = NULL,
	@UserId INT = NULL,
	@OrderDetailsId INT = NULL,
	@Status VARCHAR(50) = NULL
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	--GET INVOICE BY ID
    IF @Action = 'INVOICBYID'
      BEGIN
			SELECT ROW_NUMBER() OVER(ORDER BY (SELECT 1)) AS [SrNo], o.OrderNo, p.Name, p.Price, o.Quantity,
			(p.Price * o.Quantity) as TotalPrice, o.OrderDate,o.Status FROM Orders o
			INNER JOIN Products p ON p.ProductId = o.ProductId
			WHERE o.PaymentId = @PaymentId AND o.UserId = @UserId
	  END

	--SELECT ORDER HISTORY
    IF @Action = 'ODRHISTORY'
      BEGIN
			SELECT DISTINCT o.PaymentId,p.PaymentMode,p.CardNo FROM Orders o
            INNER JOIN Payment p on p.PaymentId = o.PaymentId
            WHERE o.UserId = @UserId
	  END

	--GET ORDER STATUS
	IF @Action = 'GETSTATUS'
      BEGIN
			SELECT o.OrderDetailsId, o.OrderNo, (pr.Price * o.Quantity) as TotalPrice, o.Status,
			o.OrderDate, p.PaymentMode, pr.Name FROM Orders o
			INNER JOIN Payment p ON p.PaymentId = o.PaymentId
			INNER JOIN Products pr ON pr.ProductId = o.ProductId
	  END

	--GET ORDER STATUS BY ID
	IF @Action = 'STATUSBYID'
      BEGIN
			SELECT OrderDetailsId, Status FROM Orders
            WHERE OrderDetailsId = @OrderDetailsId
	  END

	--UPDATE ORDER STATUS
    IF @Action = 'UPDTSTATUS'
      BEGIN
			UPDATE dbo.Orders
			SET Status = @Status WHERE OrderDetailsId = @OrderDetailsId
	  END
END
GO
/****** Object:  StoredProcedure [dbo].[Product_Crud]    Script Date: 7/10/2022 10:40:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Product_Crud]
	-- Add the parameters for the stored procedure here
	@Action VARCHAR(10),
	@ProductId INT = NULL,
	@Name VARCHAR(100) = NULL,
	@Description VARCHAR(MAX) = NULL,
	@Price DECIMAL(18,2) = 0,
	@Quantity INT = NULL,
	@ImageUrl VARCHAR(MAX) = NULL,
	@CategoryId INT = NULL,
	@IsActive BIT = false
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    --SELECT
    IF @Action = 'SELECT'
      BEGIN
            SELECT p.*,c.Name AS CategoryName FROM dbo.Products p
			INNER JOIN dbo.Categories c ON c.CategoryId = p.CategoryId ORDER BY p.CreatedDate DESC
      END
	
    --INSERT
    IF @Action = 'INSERT'
      BEGIN
            INSERT INTO dbo.Products(Name, Description, Price, Quantity, ImageUrl, CategoryId, IsActive, CreatedDate)
            VALUES (@Name, @Description, @Price, @Quantity, @ImageUrl, @CategoryId, @IsActive, GETDATE())
      END
 
    --UPDATE
    IF @Action = 'UPDATE'
      BEGIN
		DECLARE @UPDATE_IMAGE VARCHAR(20)
		SELECT @UPDATE_IMAGE = (CASE WHEN @ImageUrl IS NULL THEN 'NO' ELSE 'YES' END)
		IF @UPDATE_IMAGE = 'NO'
			BEGIN
				UPDATE dbo.Products
				SET Name = @Name, Description = @Description, Price = @Price, Quantity = @Quantity,
				CategoryId = @CategoryId, IsActive = @IsActive
				WHERE ProductId = @ProductId
			END
		ELSE
			BEGIN
				UPDATE dbo.Products
				SET Name = @Name, Description = @Description, Price = @Price, Quantity = @Quantity,
				ImageUrl = @ImageUrl, CategoryId = @CategoryId, IsActive = @IsActive
				WHERE ProductId = @ProductId
			END
      END

	--UPDATE QUANTITY
    IF @Action = 'QTYUPDATE'
	BEGIN
		UPDATE dbo.Products SET Quantity = @Quantity
		WHERE ProductId = @ProductId
	END
 
    --DELETE
    IF @Action = 'DELETE'
      BEGIN
            DELETE FROM dbo.Products WHERE ProductId = @ProductId
      END
	  
	--GETBYID
    IF @Action = 'GETBYID'
      BEGIN
            SELECT * FROM dbo.Products WHERE ProductId = @ProductId
      END

END
GO
/****** Object:  StoredProcedure [dbo].[Save_Orders]    Script Date: 7/10/2022 10:40:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Save_Orders] @tblOrders OrderDetails READONLY
AS
BEGIN
      SET NOCOUNT ON;
     
      INSERT INTO Orders(OrderNo, ProductId, Quantity, UserId, Status, PaymentId, OrderDate)
      SELECT OrderNo, ProductId, Quantity, UserId, Status, PaymentId, OrderDate FROM @tblOrders
END
GO
/****** Object:  StoredProcedure [dbo].[Save_Payment]    Script Date: 7/10/2022 10:40:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Save_Payment] 
	@Name VARCHAR(100) = NULL,
	@CardNo VARCHAR(50) = NULL,
	@ExpiryDate VARCHAR(50) = NULL,
	@Cvv INT = NULL,
	@Address VARCHAR(MAX) = NULL,
	@PaymentMode VARCHAR(10) = 'card',
	@InsertedId int OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	--INSERT
      BEGIN
            INSERT INTO dbo.Payment(Name, CardNo, ExpiryDate, CvvNo, Address, PaymentMode)
            VALUES (@Name, @CardNo, @ExpiryDate, @Cvv, @Address, @PaymentMode)

			SELECT @InsertedId = SCOPE_IDENTITY();
      END
END
GO
/****** Object:  StoredProcedure [dbo].[SellingReport]    Script Date: 7/10/2022 10:40:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SellingReport]
	-- Add the parameters for the stored procedure here
	@FromDate DATE = NULL,
	@ToDate DATE = NULL
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Print @FromDate
	Print @ToDate

	SELECT ROW_NUMBER() OVER(ORDER BY (SELECT 1)) AS [SrNo],u.Name,u.Email,
		SUM(o.Quantity) AS TotalOrders, SUM(o.Quantity * p.Price) AS TotalPrice 
		FROM Orders o
		INNER JOIN Products p ON p.ProductId = o.ProductId
		INNER JOIN Users u ON u.UserId = o.UserId
		WHERE CAST(o.OrderDate AS DATE) BETWEEN @FromDate AND @ToDate
		GROUP BY u.Name, u.Email;	
END
GO
/****** Object:  StoredProcedure [dbo].[User_Crud]    Script Date: 7/10/2022 10:40:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[User_Crud] 
	-- Add the parameters for the stored procedure here
	@Action VARCHAR(20),
	@UserId INT = NULL,
	@Name varchar(50) = null,
	@Username varchar(50) = null,
	@Mobile varchar(50) = null,
	@Email varchar(50) = null,
	@Address varchar(max) = null,
	@PostCode varchar(50) = null,
	@Password varchar(50) = null,
	@ImageUrl varchar(max) = null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	--SELECT FOR LOGIN
    IF @Action = 'SELECT4LOGIN'
      BEGIN
            SELECT * FROM dbo.Users WHERE Username = @Username and Password = @Password
      END

	--SELECT FOR USER PROFILE
    IF @Action = 'SELECT4PROFILE'
      BEGIN
            SELECT * FROM dbo.Users WHERE UserId = @UserId
      END

    -- Insert (REGISTRATION)
	IF @Action = 'INSERT'
		BEGIN
			Insert into dbo.Users(Name,Username,Mobile,Email,Address,PostCode,Password,ImageUrl,CreatedDate) 
			values (@Name,@Username,@Mobile,@Email,@Address,@PostCode,@Password,@ImageUrl,GETDATE())
		END

	--UPDATE USER PROFILE
    IF @Action = 'UPDATE'
      BEGIN
		DECLARE @UPDATE_IMAGE VARCHAR(20)
		SELECT @UPDATE_IMAGE = (CASE WHEN @ImageUrl IS NULL THEN 'NO' ELSE 'YES' END)
		IF @UPDATE_IMAGE = 'NO'
			BEGIN
				UPDATE dbo.Users
				SET Name = @Name, Username = @Username, Mobile = @Mobile, Email = @Email, Address = @Address,
				PostCode = @PostCode
				WHERE UserId = @UserId
			END
		ELSE
			BEGIN
				UPDATE dbo.Users
				SET Name = @Name, Username = @Username, Mobile = @Mobile, Email = @Email, Address = @Address,
				PostCode = @PostCode, ImageUrl = @ImageUrl
				WHERE UserId = @UserId
			END
      END

	--SELECT FOR ADMIN
	IF @Action = 'SELECT4ADMIN'
		BEGIN
			SELECT ROW_NUMBER() OVER(ORDER BY (SELECT 1)) AS [SrNo],UserId, Name, 
			Username, Email, CreatedDate
			FROM Users
		END
	--DELETE BY ADMIN
    IF @Action = 'DELETE'
      BEGIN
            DELETE FROM dbo.Users WHERE UserId = @UserId
      END
END
GO
USE [master]
GO
ALTER DATABASE [Foodie] SET  READ_WRITE 
GO
