USE [master]
GO
/****** Object:  Database [TSQLFundamentals2008]    Script Date: 12/6/2016 2:09:34 PM ******/
CREATE DATABASE [TSQLFundamentals2008]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TSQLFundamentals2008', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\TSQLFundamentals2008.mdf' , SIZE = 4352KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'TSQLFundamentals2008_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\TSQLFundamentals2008_log.LDF' , SIZE = 768KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [TSQLFundamentals2008] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TSQLFundamentals2008].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TSQLFundamentals2008] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TSQLFundamentals2008] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TSQLFundamentals2008] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TSQLFundamentals2008] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TSQLFundamentals2008] SET ARITHABORT OFF 
GO
ALTER DATABASE [TSQLFundamentals2008] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [TSQLFundamentals2008] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TSQLFundamentals2008] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TSQLFundamentals2008] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TSQLFundamentals2008] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TSQLFundamentals2008] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TSQLFundamentals2008] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TSQLFundamentals2008] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TSQLFundamentals2008] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TSQLFundamentals2008] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TSQLFundamentals2008] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TSQLFundamentals2008] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TSQLFundamentals2008] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TSQLFundamentals2008] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TSQLFundamentals2008] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TSQLFundamentals2008] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TSQLFundamentals2008] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TSQLFundamentals2008] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [TSQLFundamentals2008] SET  MULTI_USER 
GO
ALTER DATABASE [TSQLFundamentals2008] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TSQLFundamentals2008] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TSQLFundamentals2008] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TSQLFundamentals2008] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [TSQLFundamentals2008] SET DELAYED_DURABILITY = DISABLED 
GO
USE [TSQLFundamentals2008]
GO
/****** Object:  Schema [HR]    Script Date: 12/6/2016 2:09:34 PM ******/
CREATE SCHEMA [HR]
GO
/****** Object:  Schema [Production]    Script Date: 12/6/2016 2:09:34 PM ******/
CREATE SCHEMA [Production]
GO
/****** Object:  Schema [Sales]    Script Date: 12/6/2016 2:09:34 PM ******/
CREATE SCHEMA [Sales]
GO
/****** Object:  Table [HR].[Employees]    Script Date: 12/6/2016 2:09:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HR].[Employees](
	[empid] [int] IDENTITY(1,1) NOT NULL,
	[lastname] [nvarchar](20) NOT NULL,
	[firstname] [nvarchar](10) NOT NULL,
	[title] [nvarchar](30) NOT NULL,
	[titleofcourtesy] [nvarchar](25) NOT NULL,
	[birthdate] [datetime] NOT NULL,
	[hiredate] [datetime] NOT NULL,
	[address] [nvarchar](60) NOT NULL,
	[city] [nvarchar](15) NOT NULL,
	[region] [nvarchar](15) NULL,
	[postalcode] [nvarchar](10) NULL,
	[country] [nvarchar](15) NOT NULL,
	[phone] [nvarchar](24) NOT NULL,
	[mgrid] [int] NULL,
 CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED 
(
	[empid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Production].[Categories]    Script Date: 12/6/2016 2:09:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Production].[Categories](
	[categoryid] [int] IDENTITY(1,1) NOT NULL,
	[categoryname] [nvarchar](15) NOT NULL,
	[description] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[categoryid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Production].[Products]    Script Date: 12/6/2016 2:09:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Production].[Products](
	[productid] [int] IDENTITY(1,1) NOT NULL,
	[productname] [nvarchar](40) NOT NULL,
	[supplierid] [int] NOT NULL,
	[categoryid] [int] NOT NULL,
	[unitprice] [money] NOT NULL CONSTRAINT [DFT_Products_unitprice]  DEFAULT ((0)),
	[discontinued] [bit] NOT NULL CONSTRAINT [DFT_Products_discontinued]  DEFAULT ((0)),
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[productid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Production].[Suppliers]    Script Date: 12/6/2016 2:09:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Production].[Suppliers](
	[supplierid] [int] IDENTITY(1,1) NOT NULL,
	[companyname] [nvarchar](40) NOT NULL,
	[contactname] [nvarchar](30) NOT NULL,
	[contacttitle] [nvarchar](30) NOT NULL,
	[address] [nvarchar](60) NOT NULL,
	[city] [nvarchar](15) NOT NULL,
	[region] [nvarchar](15) NULL,
	[postalcode] [nvarchar](10) NULL,
	[country] [nvarchar](15) NOT NULL,
	[phone] [nvarchar](24) NOT NULL,
	[fax] [nvarchar](24) NULL,
 CONSTRAINT [PK_Suppliers] PRIMARY KEY CLUSTERED 
(
	[supplierid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Sales].[Customers]    Script Date: 12/6/2016 2:09:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Sales].[Customers](
	[custid] [int] IDENTITY(1,1) NOT NULL,
	[companyname] [nvarchar](40) NOT NULL,
	[contactname] [nvarchar](30) NOT NULL,
	[contacttitle] [nvarchar](30) NOT NULL,
	[address] [nvarchar](60) NOT NULL,
	[city] [nvarchar](15) NOT NULL,
	[region] [nvarchar](15) NULL,
	[postalcode] [nvarchar](10) NULL,
	[country] [nvarchar](15) NOT NULL,
	[phone] [nvarchar](24) NOT NULL,
	[fax] [nvarchar](24) NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[custid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Sales].[OrderDetails]    Script Date: 12/6/2016 2:09:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Sales].[OrderDetails](
	[orderid] [int] NOT NULL,
	[productid] [int] NOT NULL,
	[unitprice] [money] NOT NULL CONSTRAINT [DFT_OrderDetails_unitprice]  DEFAULT ((0)),
	[qty] [smallint] NOT NULL CONSTRAINT [DFT_OrderDetails_qty]  DEFAULT ((1)),
	[discount] [numeric](4, 3) NOT NULL CONSTRAINT [DFT_OrderDetails_discount]  DEFAULT ((0)),
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[orderid] ASC,
	[productid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Sales].[Orders]    Script Date: 12/6/2016 2:09:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Sales].[Orders](
	[orderid] [int] IDENTITY(1,1) NOT NULL,
	[custid] [int] NULL,
	[empid] [int] NOT NULL,
	[orderdate] [datetime] NOT NULL,
	[requireddate] [datetime] NOT NULL,
	[shippeddate] [datetime] NULL,
	[shipperid] [int] NOT NULL,
	[freight] [money] NOT NULL CONSTRAINT [DFT_Orders_freight]  DEFAULT ((0)),
	[shipname] [nvarchar](40) NOT NULL,
	[shipaddress] [nvarchar](60) NOT NULL,
	[shipcity] [nvarchar](15) NOT NULL,
	[shipregion] [nvarchar](15) NULL,
	[shippostalcode] [nvarchar](10) NULL,
	[shipcountry] [nvarchar](15) NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[orderid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Sales].[Shippers]    Script Date: 12/6/2016 2:09:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Sales].[Shippers](
	[shipperid] [int] IDENTITY(1,1) NOT NULL,
	[companyname] [nvarchar](40) NOT NULL,
	[phone] [nvarchar](24) NOT NULL,
 CONSTRAINT [PK_Shippers] PRIMARY KEY CLUSTERED 
(
	[shipperid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [Sales].[CustOrders]    Script Date: 12/6/2016 2:09:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [Sales].[CustOrders]
  WITH SCHEMABINDING
AS

SELECT
  O.custid, 
  DATEADD(month, DATEDIFF(month, 0, O.orderdate), 0) AS ordermonth,
  SUM(OD.qty) AS qty
FROM Sales.Orders AS O
  JOIN Sales.OrderDetails AS OD
    ON OD.orderid = O.orderid
GROUP BY custid, DATEADD(month, DATEDIFF(month, 0, O.orderdate), 0);

GO
/****** Object:  View [Sales].[OrderTotalsByYear]    Script Date: 12/6/2016 2:09:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [Sales].[OrderTotalsByYear]
  WITH SCHEMABINDING
AS

SELECT
  YEAR(O.orderdate) AS orderyear,
  SUM(OD.qty) AS qty
FROM Sales.Orders AS O
  JOIN Sales.OrderDetails AS OD
    ON OD.orderid = O.orderid
GROUP BY YEAR(orderdate);

GO
/****** Object:  View [Sales].[OrderValues]    Script Date: 12/6/2016 2:09:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------
-- Create Views
---------------------------------------------------------------------

CREATE VIEW [Sales].[OrderValues]
  WITH SCHEMABINDING
AS

SELECT O.orderid, O.custid, O.empid, O.shipperid, O.orderdate,
  CAST(SUM(OD.qty * OD.unitprice * (1 - discount))
       AS NUMERIC(12, 2)) AS val
FROM Sales.Orders AS O
  JOIN Sales.OrderDetails AS OD
    ON O.orderid = OD.orderid
GROUP BY O.orderid, O.custid, O.empid, O.shipperid, O.orderdate;

GO
SET IDENTITY_INSERT [HR].[Employees] ON 

INSERT [HR].[Employees] ([empid], [lastname], [firstname], [title], [titleofcourtesy], [birthdate], [hiredate], [address], [city], [region], [postalcode], [country], [phone], [mgrid]) VALUES (1, N'Davise', N'Sara', N'CEO', N'Ms.', CAST(N'1958-12-08 00:00:00.000' AS DateTime), CAST(N'2002-05-01 00:00:00.000' AS DateTime), N'7890 - 20th Ave. E., Apt. 2A', N'Seattle', N'WA', N'10003', N'UK', N'206-25550', NULL)
INSERT [HR].[Employees] ([empid], [lastname], [firstname], [title], [titleofcourtesy], [birthdate], [hiredate], [address], [city], [region], [postalcode], [country], [phone], [mgrid]) VALUES (2, N'Funk', N'Donki', N'Vice President', N'Dr.', CAST(N'1962-02-19 00:00:00.000' AS DateTime), CAST(N'2002-08-14 00:00:00.000' AS DateTime), N'9012 W. Capital Way', N'Tacoma', N'WA', N'69696', N'Poland', N'206-75550', NULL)
INSERT [HR].[Employees] ([empid], [lastname], [firstname], [title], [titleofcourtesy], [birthdate], [hiredate], [address], [city], [region], [postalcode], [country], [phone], [mgrid]) VALUES (3, N'Lew', N'Judy', N'Sales Manager', N'Ms.', CAST(N'1973-08-30 00:00:00.000' AS DateTime), CAST(N'2002-04-01 00:00:00.000' AS DateTime), N'2345 Moss Bay Blvd.', N'Kirkland', N'WA', N'10007', N'USA', N'206-75550', 2)
INSERT [HR].[Employees] ([empid], [lastname], [firstname], [title], [titleofcourtesy], [birthdate], [hiredate], [address], [city], [region], [postalcode], [country], [phone], [mgrid]) VALUES (4, N'Peled', N'Yael', N'Sales Representative', N'Mrs.', CAST(N'1947-09-19 00:00:00.000' AS DateTime), CAST(N'2003-05-03 00:00:00.000' AS DateTime), N'5678 Old Redmond Rd.', N'Redmond', N'WA', N'10009', N'USA', N'206-75550', NULL)
INSERT [HR].[Employees] ([empid], [lastname], [firstname], [title], [titleofcourtesy], [birthdate], [hiredate], [address], [city], [region], [postalcode], [country], [phone], [mgrid]) VALUES (5, N'Buck', N'Sven', N'Sales Manager', N'Mr.', CAST(N'1965-03-04 00:00:00.000' AS DateTime), CAST(N'2003-10-17 00:00:00.000' AS DateTime), N'8901 Garrett Hill', N'San Francisco', NULL, N'10004', N'UK', N'717-23456', 2)
INSERT [HR].[Employees] ([empid], [lastname], [firstname], [title], [titleofcourtesy], [birthdate], [hiredate], [address], [city], [region], [postalcode], [country], [phone], [mgrid]) VALUES (6, N'Suurs', N'Paul', N'Sales Representative', N'Mr.', CAST(N'1974-07-02 00:00:00.000' AS DateTime), CAST(N'2003-10-17 00:00:00.000' AS DateTime), N'3456 Coventry House, Miner Rd.', N'London', N'', N'10005', N'UK', N'717-34567', NULL)
INSERT [HR].[Employees] ([empid], [lastname], [firstname], [title], [titleofcourtesy], [birthdate], [hiredate], [address], [city], [region], [postalcode], [country], [phone], [mgrid]) VALUES (7, N'King', N'Russell', N'Sales Representative', N'Mr.', CAST(N'1970-05-29 00:00:00.000' AS DateTime), CAST(N'2004-01-02 00:00:00.000' AS DateTime), N'6789 Edgeham Hollow, Winchester Way', N'London', N'', N'10002', N'UK', N'712-34554', 5)
INSERT [HR].[Employees] ([empid], [lastname], [firstname], [title], [titleofcourtesy], [birthdate], [hiredate], [address], [city], [region], [postalcode], [country], [phone], [mgrid]) VALUES (8, N'Cameron', N'Maria', N'Sales Representative', N'Ms.', CAST(N'1968-01-09 00:00:00.000' AS DateTime), CAST(N'2004-03-05 00:00:00.000' AS DateTime), N'4567 - 11th Ave. N.E.', N'Seattle', N'WA', N'10006', N'USA', N'206-77774', NULL)
INSERT [HR].[Employees] ([empid], [lastname], [firstname], [title], [titleofcourtesy], [birthdate], [hiredate], [address], [city], [region], [postalcode], [country], [phone], [mgrid]) VALUES (9, N'Dolgopyatova', N'Zoyaaa', N'Sales Representative', N'Ms.', CAST(N'1976-01-27 00:00:00.000' AS DateTime), CAST(N'2004-11-15 00:00:00.000' AS DateTime), N'1234 Houndstooth Rd.', N'London', NULL, N'10008', N'UK', N'714-45678', 1)
INSERT [HR].[Employees] ([empid], [lastname], [firstname], [title], [titleofcourtesy], [birthdate], [hiredate], [address], [city], [region], [postalcode], [country], [phone], [mgrid]) VALUES (18, N'aaa', N'bbbb', N'Vice President', N'Mr.', CAST(N'1990-10-10 00:00:00.000' AS DateTime), CAST(N'2016-12-01 00:00:00.000' AS DateTime), N'ac d r af huhuhu', N'London', N'', N'12345', N'UK', N'123-12345', NULL)
INSERT [HR].[Employees] ([empid], [lastname], [firstname], [title], [titleofcourtesy], [birthdate], [hiredate], [address], [city], [region], [postalcode], [country], [phone], [mgrid]) VALUES (45, N'Maria', N'Olala', N'Vice President', N'Mrs.', CAST(N'2000-12-19 00:00:00.000' AS DateTime), CAST(N'2018-11-11 00:00:00.000' AS DateTime), N'dfdfdfdf', N'Aachen', NULL, NULL, N'Argentina', N'123-12345', 46)
INSERT [HR].[Employees] ([empid], [lastname], [firstname], [title], [titleofcourtesy], [birthdate], [hiredate], [address], [city], [region], [postalcode], [country], [phone], [mgrid]) VALUES (46, N'aaa', N'dfdfdf', N'Vice President', N'Dr.', CAST(N'1990-12-05 00:00:00.000' AS DateTime), CAST(N'2016-12-05 00:00:00.000' AS DateTime), N'fdfdf', N'Albuquerque', N'Asturias', NULL, N'UK', N'212-12121', 1)
SET IDENTITY_INSERT [HR].[Employees] OFF
SET IDENTITY_INSERT [Production].[Categories] ON 

INSERT [Production].[Categories] ([categoryid], [categoryname], [description]) VALUES (1, N'Beverages', N'Soft drinks, coffees, teas, beers, and ales')
INSERT [Production].[Categories] ([categoryid], [categoryname], [description]) VALUES (2, N'Condiments', N'Sweet and savory sauces, relishes, spreads, and seasonings')
INSERT [Production].[Categories] ([categoryid], [categoryname], [description]) VALUES (3, N'Confections', N'Desserts, candies, and sweet breads')
INSERT [Production].[Categories] ([categoryid], [categoryname], [description]) VALUES (4, N'Dairy Products', N'Cheeses')
INSERT [Production].[Categories] ([categoryid], [categoryname], [description]) VALUES (5, N'Grains/Cereals', N'Breads, crackers, pasta, and cereal')
INSERT [Production].[Categories] ([categoryid], [categoryname], [description]) VALUES (6, N'Meat/Poultry', N'Prepared meats')
INSERT [Production].[Categories] ([categoryid], [categoryname], [description]) VALUES (7, N'Produce', N'Dried fruit and bean curd oh')
INSERT [Production].[Categories] ([categoryid], [categoryname], [description]) VALUES (8, N'Seafood', N'Seaweed and fish')
INSERT [Production].[Categories] ([categoryid], [categoryname], [description]) VALUES (11, N'tes', N'stete')
SET IDENTITY_INSERT [Production].[Categories] OFF
SET IDENTITY_INSERT [Production].[Products] ON 

INSERT [Production].[Products] ([productid], [productname], [supplierid], [categoryid], [unitprice], [discontinued]) VALUES (1, N'Product HHYDP', 1, 1, 18.0000, 0)
INSERT [Production].[Products] ([productid], [productname], [supplierid], [categoryid], [unitprice], [discontinued]) VALUES (2, N'Product RECZE', 1, 1, 19.0000, 0)
INSERT [Production].[Products] ([productid], [productname], [supplierid], [categoryid], [unitprice], [discontinued]) VALUES (3, N'Product IMEHJ', 1, 2, 10.0000, 0)
INSERT [Production].[Products] ([productid], [productname], [supplierid], [categoryid], [unitprice], [discontinued]) VALUES (4, N'Product KSBRM', 2, 2, 22.0000, 0)
INSERT [Production].[Products] ([productid], [productname], [supplierid], [categoryid], [unitprice], [discontinued]) VALUES (5, N'Product EPEIM', 2, 2, 21.3500, 1)
INSERT [Production].[Products] ([productid], [productname], [supplierid], [categoryid], [unitprice], [discontinued]) VALUES (6, N'Product VAIIV', 3, 2, 25.0000, 0)
INSERT [Production].[Products] ([productid], [productname], [supplierid], [categoryid], [unitprice], [discontinued]) VALUES (7, N'Product HMLNI', 3, 7, 30.0000, 0)
INSERT [Production].[Products] ([productid], [productname], [supplierid], [categoryid], [unitprice], [discontinued]) VALUES (8, N'Product WVJFP', 3, 2, 40.0000, 0)
INSERT [Production].[Products] ([productid], [productname], [supplierid], [categoryid], [unitprice], [discontinued]) VALUES (9, N'Product AOZBW', 4, 6, 97.0000, 1)
INSERT [Production].[Products] ([productid], [productname], [supplierid], [categoryid], [unitprice], [discontinued]) VALUES (10, N'Product YHXGE', 4, 8, 23.2323, 1)
INSERT [Production].[Products] ([productid], [productname], [supplierid], [categoryid], [unitprice], [discontinued]) VALUES (11, N'Product QMVUN', 5, 4, 21.0000, 0)
INSERT [Production].[Products] ([productid], [productname], [supplierid], [categoryid], [unitprice], [discontinued]) VALUES (12, N'Product OSFNS', 5, 4, 38.0000, 0)
INSERT [Production].[Products] ([productid], [productname], [supplierid], [categoryid], [unitprice], [discontinued]) VALUES (13, N'Product POXFU', 6, 8, 6.0000, 0)
INSERT [Production].[Products] ([productid], [productname], [supplierid], [categoryid], [unitprice], [discontinued]) VALUES (14, N'Product PWCJB', 6, 7, 23.2500, 0)
INSERT [Production].[Products] ([productid], [productname], [supplierid], [categoryid], [unitprice], [discontinued]) VALUES (15, N'Product KSZOI', 6, 2, 15.5000, 0)
INSERT [Production].[Products] ([productid], [productname], [supplierid], [categoryid], [unitprice], [discontinued]) VALUES (16, N'Product PAFRH', 7, 3, 17.4500, 0)
INSERT [Production].[Products] ([productid], [productname], [supplierid], [categoryid], [unitprice], [discontinued]) VALUES (17, N'Product BLCAX', 7, 6, 39.0000, 1)
INSERT [Production].[Products] ([productid], [productname], [supplierid], [categoryid], [unitprice], [discontinued]) VALUES (18, N'Product CKEDC', 7, 8, 62.5000, 0)
INSERT [Production].[Products] ([productid], [productname], [supplierid], [categoryid], [unitprice], [discontinued]) VALUES (19, N'Product XKXDO', 8, 3, 9.2000, 0)
INSERT [Production].[Products] ([productid], [productname], [supplierid], [categoryid], [unitprice], [discontinued]) VALUES (20, N'Product QHFFP', 8, 3, 81.0000, 0)
INSERT [Production].[Products] ([productid], [productname], [supplierid], [categoryid], [unitprice], [discontinued]) VALUES (21, N'Product VJZZH', 8, 3, 10.0000, 0)
INSERT [Production].[Products] ([productid], [productname], [supplierid], [categoryid], [unitprice], [discontinued]) VALUES (22, N'Product CPHFY', 9, 5, 21.0000, 0)
INSERT [Production].[Products] ([productid], [productname], [supplierid], [categoryid], [unitprice], [discontinued]) VALUES (23, N'Product JLUDZ', 9, 5, 9.0000, 0)
INSERT [Production].[Products] ([productid], [productname], [supplierid], [categoryid], [unitprice], [discontinued]) VALUES (24, N'Product QOGNU', 10, 1, 4.5000, 1)
INSERT [Production].[Products] ([productid], [productname], [supplierid], [categoryid], [unitprice], [discontinued]) VALUES (25, N'Product LYLNI', 11, 3, 14.0000, 0)
INSERT [Production].[Products] ([productid], [productname], [supplierid], [categoryid], [unitprice], [discontinued]) VALUES (26, N'Product HLGZA', 11, 3, 31.2300, 0)
INSERT [Production].[Products] ([productid], [productname], [supplierid], [categoryid], [unitprice], [discontinued]) VALUES (27, N'Product SMIOH', 11, 3, 43.9000, 0)
INSERT [Production].[Products] ([productid], [productname], [supplierid], [categoryid], [unitprice], [discontinued]) VALUES (28, N'Product OFBNT', 12, 7, 45.6000, 1)
INSERT [Production].[Products] ([productid], [productname], [supplierid], [categoryid], [unitprice], [discontinued]) VALUES (29, N'Product VJXYN', 12, 6, 123.7900, 1)
INSERT [Production].[Products] ([productid], [productname], [supplierid], [categoryid], [unitprice], [discontinued]) VALUES (30, N'Product LYERX', 13, 8, 25.8900, 0)
INSERT [Production].[Products] ([productid], [productname], [supplierid], [categoryid], [unitprice], [discontinued]) VALUES (31, N'Product XWOXC', 14, 4, 12.5000, 0)
INSERT [Production].[Products] ([productid], [productname], [supplierid], [categoryid], [unitprice], [discontinued]) VALUES (32, N'Product NUNAW', 14, 4, 32.0000, 0)
INSERT [Production].[Products] ([productid], [productname], [supplierid], [categoryid], [unitprice], [discontinued]) VALUES (33, N'Product ASTMN', 15, 4, 2.5000, 0)
INSERT [Production].[Products] ([productid], [productname], [supplierid], [categoryid], [unitprice], [discontinued]) VALUES (34, N'Product SWNJY', 16, 1, 14.0000, 0)
INSERT [Production].[Products] ([productid], [productname], [supplierid], [categoryid], [unitprice], [discontinued]) VALUES (35, N'Product NEVTJ', 16, 1, 18.0000, 0)
INSERT [Production].[Products] ([productid], [productname], [supplierid], [categoryid], [unitprice], [discontinued]) VALUES (36, N'Product GMKIJ', 17, 8, 19.0000, 0)
INSERT [Production].[Products] ([productid], [productname], [supplierid], [categoryid], [unitprice], [discontinued]) VALUES (37, N'Product EVFFA', 17, 8, 26.0000, 0)
INSERT [Production].[Products] ([productid], [productname], [supplierid], [categoryid], [unitprice], [discontinued]) VALUES (38, N'Product QDOMO', 18, 1, 263.5000, 0)
INSERT [Production].[Products] ([productid], [productname], [supplierid], [categoryid], [unitprice], [discontinued]) VALUES (39, N'Product LSOFL', 18, 1, 18.0000, 0)
INSERT [Production].[Products] ([productid], [productname], [supplierid], [categoryid], [unitprice], [discontinued]) VALUES (40, N'Product YZIXQ', 19, 8, 18.4000, 0)
INSERT [Production].[Products] ([productid], [productname], [supplierid], [categoryid], [unitprice], [discontinued]) VALUES (41, N'Product TTEEX', 19, 8, 9.6500, 0)
INSERT [Production].[Products] ([productid], [productname], [supplierid], [categoryid], [unitprice], [discontinued]) VALUES (42, N'Product RJVNM', 20, 5, 14.0000, 1)
INSERT [Production].[Products] ([productid], [productname], [supplierid], [categoryid], [unitprice], [discontinued]) VALUES (43, N'Product ZZZHR', 20, 1, 46.0000, 0)
INSERT [Production].[Products] ([productid], [productname], [supplierid], [categoryid], [unitprice], [discontinued]) VALUES (44, N'Product VJIEO', 20, 2, 19.4500, 0)
INSERT [Production].[Products] ([productid], [productname], [supplierid], [categoryid], [unitprice], [discontinued]) VALUES (45, N'Product AQOKR', 21, 8, 9.5000, 0)
INSERT [Production].[Products] ([productid], [productname], [supplierid], [categoryid], [unitprice], [discontinued]) VALUES (46, N'Product CBRRL', 21, 8, 12.0000, 0)
INSERT [Production].[Products] ([productid], [productname], [supplierid], [categoryid], [unitprice], [discontinued]) VALUES (47, N'Product EZZPR', 22, 3, 9.5000, 0)
INSERT [Production].[Products] ([productid], [productname], [supplierid], [categoryid], [unitprice], [discontinued]) VALUES (48, N'Product MYNXN', 22, 3, 12.7500, 0)
INSERT [Production].[Products] ([productid], [productname], [supplierid], [categoryid], [unitprice], [discontinued]) VALUES (49, N'Product FPYPN', 23, 3, 20.0000, 0)
INSERT [Production].[Products] ([productid], [productname], [supplierid], [categoryid], [unitprice], [discontinued]) VALUES (50, N'Product BIUDV', 23, 3, 16.2500, 0)
INSERT [Production].[Products] ([productid], [productname], [supplierid], [categoryid], [unitprice], [discontinued]) VALUES (51, N'Product APITJ', 24, 7, 53.0000, 0)
INSERT [Production].[Products] ([productid], [productname], [supplierid], [categoryid], [unitprice], [discontinued]) VALUES (52, N'Product QSRXF', 24, 5, 7.0000, 0)
INSERT [Production].[Products] ([productid], [productname], [supplierid], [categoryid], [unitprice], [discontinued]) VALUES (53, N'Product BKGEA', 24, 6, 32.8000, 1)
INSERT [Production].[Products] ([productid], [productname], [supplierid], [categoryid], [unitprice], [discontinued]) VALUES (54, N'Product QAQRL', 25, 6, 7.4500, 0)
INSERT [Production].[Products] ([productid], [productname], [supplierid], [categoryid], [unitprice], [discontinued]) VALUES (55, N'Product YYWRT', 25, 6, 24.0000, 0)
INSERT [Production].[Products] ([productid], [productname], [supplierid], [categoryid], [unitprice], [discontinued]) VALUES (56, N'Product VKCMF', 26, 5, 38.0000, 0)
INSERT [Production].[Products] ([productid], [productname], [supplierid], [categoryid], [unitprice], [discontinued]) VALUES (57, N'Product OVLQI', 26, 5, 19.5000, 0)
INSERT [Production].[Products] ([productid], [productname], [supplierid], [categoryid], [unitprice], [discontinued]) VALUES (58, N'Product ACRVI', 27, 8, 13.2500, 0)
INSERT [Production].[Products] ([productid], [productname], [supplierid], [categoryid], [unitprice], [discontinued]) VALUES (59, N'Product UKXRI', 28, 4, 55.0000, 0)
INSERT [Production].[Products] ([productid], [productname], [supplierid], [categoryid], [unitprice], [discontinued]) VALUES (60, N'Product WHBYK', 28, 4, 34.0000, 0)
INSERT [Production].[Products] ([productid], [productname], [supplierid], [categoryid], [unitprice], [discontinued]) VALUES (61, N'Product XYZPE', 29, 2, 28.5000, 0)
INSERT [Production].[Products] ([productid], [productname], [supplierid], [categoryid], [unitprice], [discontinued]) VALUES (62, N'Product WUXYK', 29, 3, 49.3000, 0)
INSERT [Production].[Products] ([productid], [productname], [supplierid], [categoryid], [unitprice], [discontinued]) VALUES (63, N'Product ICKNK', 7, 2, 43.9000, 0)
INSERT [Production].[Products] ([productid], [productname], [supplierid], [categoryid], [unitprice], [discontinued]) VALUES (64, N'Product HCQDE', 12, 5, 33.2500, 0)
INSERT [Production].[Products] ([productid], [productname], [supplierid], [categoryid], [unitprice], [discontinued]) VALUES (65, N'Product XYWBZ', 2, 2, 21.0500, 0)
INSERT [Production].[Products] ([productid], [productname], [supplierid], [categoryid], [unitprice], [discontinued]) VALUES (66, N'Product LQMGN', 2, 2, 17.0000, 0)
INSERT [Production].[Products] ([productid], [productname], [supplierid], [categoryid], [unitprice], [discontinued]) VALUES (67, N'Product XLXQF', 16, 1, 14.0000, 0)
INSERT [Production].[Products] ([productid], [productname], [supplierid], [categoryid], [unitprice], [discontinued]) VALUES (68, N'Product TBTBL', 8, 3, 12.5000, 0)
INSERT [Production].[Products] ([productid], [productname], [supplierid], [categoryid], [unitprice], [discontinued]) VALUES (69, N'Product COAXA', 15, 4, 36.0000, 0)
INSERT [Production].[Products] ([productid], [productname], [supplierid], [categoryid], [unitprice], [discontinued]) VALUES (70, N'Product TOONT', 7, 1, 15.0000, 0)
INSERT [Production].[Products] ([productid], [productname], [supplierid], [categoryid], [unitprice], [discontinued]) VALUES (71, N'Product MYMOI', 15, 4, 21.5000, 0)
INSERT [Production].[Products] ([productid], [productname], [supplierid], [categoryid], [unitprice], [discontinued]) VALUES (72, N'Product GEEOO', 14, 4, 34.8000, 0)
INSERT [Production].[Products] ([productid], [productname], [supplierid], [categoryid], [unitprice], [discontinued]) VALUES (73, N'Product WEUJZ', 17, 8, 15.0000, 0)
INSERT [Production].[Products] ([productid], [productname], [supplierid], [categoryid], [unitprice], [discontinued]) VALUES (74, N'Product BKAZJ', 4, 7, 10.0000, 0)
INSERT [Production].[Products] ([productid], [productname], [supplierid], [categoryid], [unitprice], [discontinued]) VALUES (75, N'Product BWRLG', 12, 1, 7.7500, 0)
INSERT [Production].[Products] ([productid], [productname], [supplierid], [categoryid], [unitprice], [discontinued]) VALUES (76, N'Product JYGFE', 23, 1, 18.0000, 0)
INSERT [Production].[Products] ([productid], [productname], [supplierid], [categoryid], [unitprice], [discontinued]) VALUES (77, N'Product LUNZZ', 12, 2, 13.0000, 0)
INSERT [Production].[Products] ([productid], [productname], [supplierid], [categoryid], [unitprice], [discontinued]) VALUES (79, N'abc', 12, 1, 0.0000, 0)
INSERT [Production].[Products] ([productid], [productname], [supplierid], [categoryid], [unitprice], [discontinued]) VALUES (80, N'ABC', 1, 1, 0.0000, 0)
INSERT [Production].[Products] ([productid], [productname], [supplierid], [categoryid], [unitprice], [discontinued]) VALUES (81, N'MI goi', 1, 1, 12.0000, 0)
INSERT [Production].[Products] ([productid], [productname], [supplierid], [categoryid], [unitprice], [discontinued]) VALUES (82, N'Product XYWBZ', 1, 1, 21.0500, 1)
INSERT [Production].[Products] ([productid], [productname], [supplierid], [categoryid], [unitprice], [discontinued]) VALUES (83, N'Ca hop', 1, 1, 89.0000, 0)
INSERT [Production].[Products] ([productid], [productname], [supplierid], [categoryid], [unitprice], [discontinued]) VALUES (86, N'test', 8, 1, 2.1560, 1)
SET IDENTITY_INSERT [Production].[Products] OFF
SET IDENTITY_INSERT [Production].[Suppliers] ON 

INSERT [Production].[Suppliers] ([supplierid], [companyname], [contactname], [contacttitle], [address], [city], [region], [postalcode], [country], [phone], [fax]) VALUES (1, N'Supplier SWRXU', N'Adolphi, Stephan', N'Purchasing Manager', N'2345 Gilbert St.', N'London', NULL, N'10023', N'UK', N'(171) 456-7890', NULL)
INSERT [Production].[Suppliers] ([supplierid], [companyname], [contactname], [contacttitle], [address], [city], [region], [postalcode], [country], [phone], [fax]) VALUES (2, N'Supplier VHQZD', N'Hance, Jim', N'Order Administrator', N'P.O. Box 5678', N'New Orleans', N'LA', N'10012', N'USA', N'100-45550', N'-')
INSERT [Production].[Suppliers] ([supplierid], [companyname], [contactname], [contacttitle], [address], [city], [region], [postalcode], [country], [phone], [fax]) VALUES (3, N'Supplier STUAZ', N'Parovszky, Alfons', N'Sales Representative', N'1234 Oxford Rd.', N'Ann Arbor', N'MI', N'10026', N'USA', N'(313) 555-0109', N'(313) 555-0112')
INSERT [Production].[Suppliers] ([supplierid], [companyname], [contactname], [contacttitle], [address], [city], [region], [postalcode], [country], [phone], [fax]) VALUES (4, N'Supplier QOVFD', N'Balázs, Erzsébet', N'Marketing Manager', N'7890 Sekimai Musashino-shi', N'Tokyo', NULL, N'10011', N'Japan', N'(03) 6789-0123', NULL)
INSERT [Production].[Suppliers] ([supplierid], [companyname], [contactname], [contacttitle], [address], [city], [region], [postalcode], [country], [phone], [fax]) VALUES (5, N'Supplier EQPNC', N'Holm, Michael', N'Export Administrator', N'Calle del Rosal 4567', N'Oviedo', N'Asturias', N'10029', N'Spain', N'(98) 123 45 67', NULL)
INSERT [Production].[Suppliers] ([supplierid], [companyname], [contactname], [contacttitle], [address], [city], [region], [postalcode], [country], [phone], [fax]) VALUES (6, N'Supplier QWUSF', N'Popkova, Darya', N'Marketing Representative', N'8901 Setsuko Chuo-ku', N'Osaka', NULL, N'10028', N'Japan', N'(06) 789-0123', NULL)
INSERT [Production].[Suppliers] ([supplierid], [companyname], [contactname], [contacttitle], [address], [city], [region], [postalcode], [country], [phone], [fax]) VALUES (7, N'Supplier GQRCV', N'Ræbild, Jesper', N'Marketing Manager', N'5678 Rose St. Moonie Ponds', N'Melbourne', N'Victoria', N'10018', N'Australia', N'(03) 123-4567', N'(03) 456-7890')
INSERT [Production].[Suppliers] ([supplierid], [companyname], [contactname], [contacttitle], [address], [city], [region], [postalcode], [country], [phone], [fax]) VALUES (8, N'Supplier BWGYE', N'Iallo, Lucio', N'Sales Representative', N'9012 King''s Way', N'Manchester', NULL, N'10021', N'UK', N'(161) 567-8901', NULL)
INSERT [Production].[Suppliers] ([supplierid], [companyname], [contactname], [contacttitle], [address], [city], [region], [postalcode], [country], [phone], [fax]) VALUES (9, N'Supplier QQYEU', N'Basalik, Evan', N'Sales Agent', N'Kaloadagatan 4567', N'Göteborg', NULL, N'10022', N'Sweden', N'031-345 67 89', N'031-678 90 12')
INSERT [Production].[Suppliers] ([supplierid], [companyname], [contactname], [contacttitle], [address], [city], [region], [postalcode], [country], [phone], [fax]) VALUES (10, N'Supplier UNAHG', N'Barnett, Dave', N'Marketing Manager', N'Av. das Americanas 2345', N'Sao Paulo', NULL, N'10034', N'Brazil', N'(11) 345 6789', NULL)
INSERT [Production].[Suppliers] ([supplierid], [companyname], [contactname], [contacttitle], [address], [city], [region], [postalcode], [country], [phone], [fax]) VALUES (11, N'Supplier ZPYVS', N'Jain, Mukesh', N'Sales Manager', N'Tiergartenstraße 3456', N'Berlin', NULL, N'10016', N'Germany', N'(010) 3456789', NULL)
INSERT [Production].[Suppliers] ([supplierid], [companyname], [contactname], [contacttitle], [address], [city], [region], [postalcode], [country], [phone], [fax]) VALUES (12, N'Supplier SVIYA', N'Regev, Barak', N'International Marketing Mgr.', N'Bogenallee 9012', N'Frankfurt', NULL, N'10024', N'Germany', N'(069) 234567', NULL)
INSERT [Production].[Suppliers] ([supplierid], [companyname], [contactname], [contacttitle], [address], [city], [region], [postalcode], [country], [phone], [fax]) VALUES (13, N'Supplier TEGSC', N'Brehm, Peter', N'Coordinator Foreign Markets', N'Frahmredder 3456', N'Cuxhaven', NULL, N'10019', N'Germany', N'(04721) 1234', N'(04721) 2345')
INSERT [Production].[Suppliers] ([supplierid], [companyname], [contactname], [contacttitle], [address], [city], [region], [postalcode], [country], [phone], [fax]) VALUES (14, N'Supplier KEREV', N'Keil, Kendall', N'Sales Representative', N'Viale Dante, 6789', N'Ravenna', NULL, N'10015', N'Italy', N'(0544) 56789', N'(0544) 34567')
INSERT [Production].[Suppliers] ([supplierid], [companyname], [contactname], [contacttitle], [address], [city], [region], [postalcode], [country], [phone], [fax]) VALUES (15, N'Supplier NZLIF', N'Sałas-Szlejter, Karolina', N'Marketing Manager', N'Hatlevegen 1234', N'Sandvika', NULL, N'10025', N'Norway', N'(0)9-012345', NULL)
INSERT [Production].[Suppliers] ([supplierid], [companyname], [contactname], [contacttitle], [address], [city], [region], [postalcode], [country], [phone], [fax]) VALUES (16, N'Supplier UHZRG', N'Scholl, Thorsten', N'Regional Account Rep.', N'8901 - 8th Avenue Suite 210', N'Bend', N'OR', N'10035', N'USA', N'(503) 555-0108', NULL)
INSERT [Production].[Suppliers] ([supplierid], [companyname], [contactname], [contacttitle], [address], [city], [region], [postalcode], [country], [phone], [fax]) VALUES (17, N'Supplier QZGUF', N'Kleinerman, Christian', N'Sales Representative', N'Brovallavägen 0123', N'Stockholm', NULL, N'10033', N'Sweden', N'08-234 56 78', NULL)
INSERT [Production].[Suppliers] ([supplierid], [companyname], [contactname], [contacttitle], [address], [city], [region], [postalcode], [country], [phone], [fax]) VALUES (18, N'Supplier LVJUA', N'Canel, Fabrice', N'Sales Manager', N'3456, Rue des Francs-Bourgeois', N'Paris', NULL, N'10031', N'France', N'(1) 90.12.34.56', N'(1) 01.23.45.67')
INSERT [Production].[Suppliers] ([supplierid], [companyname], [contactname], [contacttitle], [address], [city], [region], [postalcode], [country], [phone], [fax]) VALUES (19, N'Supplier JDNUG', N'Chapman, Greg', N'Wholesale Account Agent', N'Order Processing Dept. 7890 Paul Revere Blvd.', N'Boston', N'MA', N'10027', N'USA', N'(617) 555-0110', N'(617) 555-0113')
INSERT [Production].[Suppliers] ([supplierid], [companyname], [contactname], [contacttitle], [address], [city], [region], [postalcode], [country], [phone], [fax]) VALUES (20, N'Supplier CIYNM', N'Köszegi, Emília', N'Owner', N'6789 Serangoon Loop, Suite #402', N'Singapore', NULL, N'10037', N'Singapore', N'012-3456', NULL)
INSERT [Production].[Suppliers] ([supplierid], [companyname], [contactname], [contacttitle], [address], [city], [region], [postalcode], [country], [phone], [fax]) VALUES (21, N'Supplier XOXZA', N'Shakespear, Paul', N'Sales Manager', N'Lyngbysild Fiskebakken 9012', N'Lyngby', NULL, N'10012', N'Denmark', N'67890123', N'78901234')
INSERT [Production].[Suppliers] ([supplierid], [companyname], [contactname], [contacttitle], [address], [city], [region], [postalcode], [country], [phone], [fax]) VALUES (22, N'Supplier FNUXM', N'Skelly, Bonnie L.', N'Accounting Manager', N'Verkoop Rijnweg 8901', N'Zaandam', NULL, N'10014', N'Netherlands', N'(12345) 8901', N'(12345) 5678')
INSERT [Production].[Suppliers] ([supplierid], [companyname], [contactname], [contacttitle], [address], [city], [region], [postalcode], [country], [phone], [fax]) VALUES (23, N'Supplier ELCRN', N'LaMee, Brian', N'Product Manager', N'Valtakatu 1234', N'Lappeenranta', NULL, N'10032', N'Finland', N'(953) 78901', NULL)
INSERT [Production].[Suppliers] ([supplierid], [companyname], [contactname], [contacttitle], [address], [city], [region], [postalcode], [country], [phone], [fax]) VALUES (24, N'Supplier JNNES', N'Clark, Molly', N'Sales Representative', N'6789 Prince Edward Parade Hunter''s Hill', N'Sydney', N'NSW', N'10030', N'Australia', N'(02) 234-5678', N'(02) 567-8901')
INSERT [Production].[Suppliers] ([supplierid], [companyname], [contactname], [contacttitle], [address], [city], [region], [postalcode], [country], [phone], [fax]) VALUES (25, N'Supplier ERVYZ', N'Sprenger, Christof', N'Marketing Manager', N'7890 Rue St. Laurent', N'Montréal', N'Québec', N'10017', N'Canada', N'(514) 456-7890', NULL)
INSERT [Production].[Suppliers] ([supplierid], [companyname], [contactname], [contacttitle], [address], [city], [region], [postalcode], [country], [phone], [fax]) VALUES (26, N'Supplier ZWZDM', N'Cunha, Gonçalo', N'Order Administrator', N'Via dei Gelsomini, 5678', N'Salerno', NULL, N'10020', N'Italy', N'(089) 4567890', N'(089) 4567890')
INSERT [Production].[Suppliers] ([supplierid], [companyname], [contactname], [contacttitle], [address], [city], [region], [postalcode], [country], [phone], [fax]) VALUES (27, N'Supplier ZRYDZ', N'Leoni, Alessandro', N'Sales Manager', N'4567, rue H. Voiron', N'Montceau', NULL, N'10036', N'France', N'890-12345', NULL)
INSERT [Production].[Suppliers] ([supplierid], [companyname], [contactname], [contacttitle], [address], [city], [region], [postalcode], [country], [phone], [fax]) VALUES (28, N'Supplier OAVQT', N'Teper, Jeff', N'Sales Representative', N'Bat. B 2345, rue des Alpes', N'Annecy', NULL, N'10010', N'France', N'012-34567', N'890-12345')
INSERT [Production].[Suppliers] ([supplierid], [companyname], [contactname], [contacttitle], [address], [city], [region], [postalcode], [country], [phone], [fax]) VALUES (29, N'Supplier OGLRK', N'Walters, Rob', N'Accounting Manager', N'0123 rue Chasseur', N'Ste-Hyacinthe', N'Québec', N'1', N'Canada', N'514-75678', N'514-76789')
INSERT [Production].[Suppliers] ([supplierid], [companyname], [contactname], [contacttitle], [address], [city], [region], [postalcode], [country], [phone], [fax]) VALUES (34, N'test test', N'stst', N'adfda', N'fd df df', N'Albuquerque', NULL, NULL, N'Belgium', N'121-21212', NULL)
SET IDENTITY_INSERT [Production].[Suppliers] OFF
SET IDENTITY_INSERT [Sales].[Customers] ON 

INSERT [Sales].[Customers] ([custid], [companyname], [contactname], [contacttitle], [address], [city], [region], [postalcode], [country], [phone], [fax]) VALUES (1, N'Customer NRZBB', N'Allen, Michael', N'Sales Representative', N'Obere Str. 0123wewewe', N'-1', N'-1', N'10092', N'-1', N'030-3456789', N'030-0123456')
INSERT [Sales].[Customers] ([custid], [companyname], [contactname], [contacttitle], [address], [city], [region], [postalcode], [country], [phone], [fax]) VALUES (2, N'Customer MLTDN', N'Hassall, Mark', N'Owner', N'Avda. de la Constitución 5678', N'México D.F.', NULL, N'10077', N'Mexico', N'(5) 789-0123', N'(5) 456-7890')
INSERT [Sales].[Customers] ([custid], [companyname], [contactname], [contacttitle], [address], [city], [region], [postalcode], [country], [phone], [fax]) VALUES (3, N'Customer KBUDE', N'Peoples, John', N'Owner', N'Mataderos  7890', N'México D.F.', NULL, N'10097', N'Mexico', N'(5) 123-4567', NULL)
INSERT [Sales].[Customers] ([custid], [companyname], [contactname], [contacttitle], [address], [city], [region], [postalcode], [country], [phone], [fax]) VALUES (4, N'Customer HFBZG', N'Arndt, Torsten', N'Sales Representative', N'7890 Hanover Sq.', N'London', NULL, N'10046', N'UK', N'(171) 456-7890', N'(171) 456-7891')
INSERT [Sales].[Customers] ([custid], [companyname], [contactname], [contacttitle], [address], [city], [region], [postalcode], [country], [phone], [fax]) VALUES (5, N'Customer HGVLZ', N'Higginbotham, Tom', N'Order Administrator', N'Berguvsvägen  5678', N'Luleå', NULL, N'10112', N'Sweden', N'0921-67 89 01', N'0921-23 45 67')
INSERT [Sales].[Customers] ([custid], [companyname], [contactname], [contacttitle], [address], [city], [region], [postalcode], [country], [phone], [fax]) VALUES (6, N'Customer XHXJV', N'Poland, Carole', N'Sales Representative', N'Forsterstr. 7890', N'Mannheim', NULL, N'10117', N'Germany', N'0621-67890', N'0621-12345')
INSERT [Sales].[Customers] ([custid], [companyname], [contactname], [contacttitle], [address], [city], [region], [postalcode], [country], [phone], [fax]) VALUES (7, N'Customer QXVLA', N'Bansal, Dushyant', N'Marketing Manager', N'2345, place Kléber', N'Strasbourg', NULL, N'10089', N'France', N'67.89.01.23', N'67.89.01.24')
INSERT [Sales].[Customers] ([custid], [companyname], [contactname], [contacttitle], [address], [city], [region], [postalcode], [country], [phone], [fax]) VALUES (8, N'Customer QUHWH', N'Ilyina, Julia', N'Owner', N'C/ Araquil, 0123', N'Madrid', NULL, N'10104', N'Spain', N'(91) 345 67 89', N'(91) 012 34 56')
INSERT [Sales].[Customers] ([custid], [companyname], [contactname], [contacttitle], [address], [city], [region], [postalcode], [country], [phone], [fax]) VALUES (9, N'Customer RTXGC', N'Raghav, Amritansh', N'Owner', N'6789, rue des Bouchers hihi', N'Marseille', NULL, N'10105', N'France', N'234-56789', N'234-56780')
INSERT [Sales].[Customers] ([custid], [companyname], [contactname], [contacttitle], [address], [city], [region], [postalcode], [country], [phone], [fax]) VALUES (10, N'Customer EEALV', N'Bassols, Pilar Colome', N'Accounting Manager', N'8901 Tsawassen Blvd.', N'Tsawassen', N'BC', N'10111', N'Canada', N'(604) 901-2345', N'(604) 678-9012')
INSERT [Sales].[Customers] ([custid], [companyname], [contactname], [contacttitle], [address], [city], [region], [postalcode], [country], [phone], [fax]) VALUES (11, N'Customer UBHAU', N'Jaffe, David', N'Sales Representative', N'Fauntleroy Circus 4567', N'London', NULL, N'10064', N'UK', N'(171) 789-0123', NULL)
INSERT [Sales].[Customers] ([custid], [companyname], [contactname], [contacttitle], [address], [city], [region], [postalcode], [country], [phone], [fax]) VALUES (12, N'Customer PSNMQ', N'Ray, Mike', N'Sales Agent', N'Cerrito 3456', N'Buenos Aires', NULL, N'10057', N'Argentina', N'(1) 890-1234', N'(1) 567-8901')
INSERT [Sales].[Customers] ([custid], [companyname], [contactname], [contacttitle], [address], [city], [region], [postalcode], [country], [phone], [fax]) VALUES (13, N'Customer VMLOG', N'Benito, Almudena', N'Marketing Manager', N'Sierras de Granada 7890', N'México D.F.', NULL, N'10056', N'Mexico', N'(5) 456-7890', N'(5) 123-4567')
INSERT [Sales].[Customers] ([custid], [companyname], [contactname], [contacttitle], [address], [city], [region], [postalcode], [country], [phone], [fax]) VALUES (14, N'Customer WNMAF', N'Jelitto, Jacek', N'Owner', N'Hauptstr. 0123', N'Bern', NULL, N'10065', N'Switzerland', N'0452-678901', NULL)
INSERT [Sales].[Customers] ([custid], [companyname], [contactname], [contacttitle], [address], [city], [region], [postalcode], [country], [phone], [fax]) VALUES (15, N'Customer JUWXK', N'Richardson, Shawn', N'Sales Associate', N'Av. dos Lusíadas, 6789', N'Sao Paulo', N'SP', N'10087', N'Brazil', N'(11) 012-3456', NULL)
INSERT [Sales].[Customers] ([custid], [companyname], [contactname], [contacttitle], [address], [city], [region], [postalcode], [country], [phone], [fax]) VALUES (16, N'Customer GYBBY', N'Birkby, Dana', N'Sales Representative', N'Berkeley Gardens 0123 Brewery', N'London', NULL, N'10039', N'UK', N'(171) 234-5678', N'(171) 234-5679')
INSERT [Sales].[Customers] ([custid], [companyname], [contactname], [contacttitle], [address], [city], [region], [postalcode], [country], [phone], [fax]) VALUES (17, N'Customer FEVNN', N'Jones, TiAnna', N'Order Administrator', N'Walserweg 4567', N'Aachen', NULL, N'10067', N'Germany', N'0241-789012', N'0241-345678')
INSERT [Sales].[Customers] ([custid], [companyname], [contactname], [contacttitle], [address], [city], [region], [postalcode], [country], [phone], [fax]) VALUES (18, N'Customer BSVAR', N'Rizaldy, Arif', N'Owner', N'3456, rue des Cinquante Otages', N'Nantes', NULL, N'10041', N'France', N'89.01.23.45', N'89.01.23.46')
INSERT [Sales].[Customers] ([custid], [companyname], [contactname], [contacttitle], [address], [city], [region], [postalcode], [country], [phone], [fax]) VALUES (19, N'Customer RFNQC', N'Boseman, Randall', N'Sales Agent', N'5678 King George', N'London', NULL, N'10110', N'UK', N'(171) 345-6789', N'(171) 345-6780')
INSERT [Sales].[Customers] ([custid], [companyname], [contactname], [contacttitle], [address], [city], [region], [postalcode], [country], [phone], [fax]) VALUES (20, N'Customer THHDP', N'Kane, John', N'Sales Manager', N'Kirchgasse 9012', N'Graz', NULL, N'10059', N'Austria', N'1234-5678', N'9012-3456')
INSERT [Sales].[Customers] ([custid], [companyname], [contactname], [contacttitle], [address], [city], [region], [postalcode], [country], [phone], [fax]) VALUES (21, N'Customer KIDPX', N'Russo, Giuseppe', N'Marketing Assistant', N'Rua Orós, 3456', N'Sao Paulo', N'SP', N'10096', N'Brazil', N'(11) 456-7890', NULL)
INSERT [Sales].[Customers] ([custid], [companyname], [contactname], [contacttitle], [address], [city], [region], [postalcode], [country], [phone], [fax]) VALUES (22, N'Customer DTDMN', N'Bueno, Janaina Burdan, Neville', N'Accounting Manager', N'C/ Moralzarzal, 5678', N'Madrid', NULL, N'10080', N'Spain', N'(91) 890 12 34', N'(91) 567 89 01')
INSERT [Sales].[Customers] ([custid], [companyname], [contactname], [contacttitle], [address], [city], [region], [postalcode], [country], [phone], [fax]) VALUES (23, N'Customer WVFAF', N'Khanna, Karan', N'Assistant Sales Agent', N'4567, chaussée de Tournai', N'Lille', NULL, N'10048', N'France', N'45.67.89.01', N'45.67.89.02')
INSERT [Sales].[Customers] ([custid], [companyname], [contactname], [contacttitle], [address], [city], [region], [postalcode], [country], [phone], [fax]) VALUES (24, N'Customer CYZTN', N'San Juan, Patricia', N'Owner', N'Åkergatan 5678', N'Bräcke', NULL, N'10114', N'Sweden', N'0695-67 89 01', NULL)
INSERT [Sales].[Customers] ([custid], [companyname], [contactname], [contacttitle], [address], [city], [region], [postalcode], [country], [phone], [fax]) VALUES (25, N'Customer AZJED', N'Carlson, Jason', N'Marketing Manager', N'Berliner Platz 9012', N'München', NULL, N'10091', N'Germany', N'089-8901234', N'089-5678901')
INSERT [Sales].[Customers] ([custid], [companyname], [contactname], [contacttitle], [address], [city], [region], [postalcode], [country], [phone], [fax]) VALUES (26, N'Customer USDBG', N'Koch, Paul', N'Marketing Manager', N'9012, rue Royale', N'Nantes', NULL, N'10101', N'France', N'34.56.78.90', N'34.56.78.91')
INSERT [Sales].[Customers] ([custid], [companyname], [contactname], [contacttitle], [address], [city], [region], [postalcode], [country], [phone], [fax]) VALUES (27, N'Customer WMFEA', N'Schmöllerl, Martin', N'Sales Representative', N'Via Monte Bianco 4567', N'Torino', NULL, N'10099', N'Italy', N'011-2345678', N'011-9012345')
INSERT [Sales].[Customers] ([custid], [companyname], [contactname], [contacttitle], [address], [city], [region], [postalcode], [country], [phone], [fax]) VALUES (28, N'Customer XYUFB', N'Cavaglieri, Giorgio', N'Sales Manager', N'Jardim das rosas n. 8901', N'Lisboa', NULL, N'10054', N'Portugal', N'(1) 456-7890', N'(1) 123-4567')
INSERT [Sales].[Customers] ([custid], [companyname], [contactname], [contacttitle], [address], [city], [region], [postalcode], [country], [phone], [fax]) VALUES (29, N'Customer MDLWA', N'Kolesnikova, Katerina', N'Marketing Manager', N'Rambla de Cataluña, 8901', N'Barcelona', NULL, N'10081', N'Spain', N'(93) 789 0123', N'(93) 456 7890')
INSERT [Sales].[Customers] ([custid], [companyname], [contactname], [contacttitle], [address], [city], [region], [postalcode], [country], [phone], [fax]) VALUES (30, N'Customer KSLQF', N'Shabalin, Rostislav', N'Sales Manager', N'C/ Romero, 1234', N'Sevilla', NULL, N'10075', N'Spain', N'(95) 901 23 45', NULL)
INSERT [Sales].[Customers] ([custid], [companyname], [contactname], [contacttitle], [address], [city], [region], [postalcode], [country], [phone], [fax]) VALUES (31, N'Customer YJCBX', N'Cheng, Yao-Qiang', N'Sales Associate', N'Av. Brasil, 5678', N'Campinas', N'SP', N'10128', N'Brazil', N'(11) 567-8901', NULL)
INSERT [Sales].[Customers] ([custid], [companyname], [contactname], [contacttitle], [address], [city], [region], [postalcode], [country], [phone], [fax]) VALUES (32, N'Customer YSIQX', N'Krishnan, Venky', N'Marketing Manager', N'6789 Baker Blvd.', N'Eugene', N'OR', N'10070', N'USA', N'(503) 555-0122', NULL)
INSERT [Sales].[Customers] ([custid], [companyname], [contactname], [contacttitle], [address], [city], [region], [postalcode], [country], [phone], [fax]) VALUES (33, N'Customer FVXPQ', N'Sigurdarson, Hallur ', N'Owner', N'5ª Ave. Los Palos Grandes 3456', N'Caracas', N'DF', N'10043', N'Venezuela', N'(2) 789-0123', N'(2) 456-7890')
INSERT [Sales].[Customers] ([custid], [companyname], [contactname], [contacttitle], [address], [city], [region], [postalcode], [country], [phone], [fax]) VALUES (34, N'Customer IBVRG', N'Cohen, Shy', N'Accounting Manager', N'Rua do Paço, 7890', N'Rio de Janeiro', N'RJ', N'10076', N'Brazil', N'(21) 789-0123', N'(21) 789-0124')
INSERT [Sales].[Customers] ([custid], [companyname], [contactname], [contacttitle], [address], [city], [region], [postalcode], [country], [phone], [fax]) VALUES (35, N'Customer UMTLM', N'Langohr, Kris', N'Sales Representative', N'Carrera 1234 con Ave. Carlos Soublette #8-35', N'San Cristóbal', N'Táchira', N'10066', N'Venezuela', N'(5) 567-8901', N'(5) 234-5678')
INSERT [Sales].[Customers] ([custid], [companyname], [contactname], [contacttitle], [address], [city], [region], [postalcode], [country], [phone], [fax]) VALUES (36, N'Customer LVJSO', N'Smith, Denise', N'Sales Representative', N'City Center Plaza 2345 Main St.', N'Elgin', N'OR', N'10103', N'USA', N'(503) 555-0126', N'(503) 555-0135')
INSERT [Sales].[Customers] ([custid], [companyname], [contactname], [contacttitle], [address], [city], [region], [postalcode], [country], [phone], [fax]) VALUES (37, N'Customer FRXZL', N'Crăciun, Ovidiu V.', N'Sales Associate', N'9012 Johnstown Road', N'Cork', N'Co. Cork', N'10051', N'Ireland', N'8901 234', N'5678 9012')
INSERT [Sales].[Customers] ([custid], [companyname], [contactname], [contacttitle], [address], [city], [region], [postalcode], [country], [phone], [fax]) VALUES (38, N'Customer LJUCA', N'Lee, Frank', N'Marketing Manager', N'Garden House Crowther Way 3456', N'Cowes', N'Isle of Wight', N'10063', N'UK', N'(198) 567-8901', NULL)
INSERT [Sales].[Customers] ([custid], [companyname], [contactname], [contacttitle], [address], [city], [region], [postalcode], [country], [phone], [fax]) VALUES (39, N'Customer GLLAG', N'Song, Lolan', N'Sales Associate', N'Maubelstr. 8901', N'Brandenburg', NULL, N'10060', N'Germany', N'0555-34567', NULL)
INSERT [Sales].[Customers] ([custid], [companyname], [contactname], [contacttitle], [address], [city], [region], [postalcode], [country], [phone], [fax]) VALUES (40, N'Customer EFFTC', N'De Oliveira, Jose', N'Sales Representative', N'2345, avenue de l''Europe', N'Versailles', NULL, N'10108', N'France', N'12.34.56.78', N'12.34.56.79')
INSERT [Sales].[Customers] ([custid], [companyname], [contactname], [contacttitle], [address], [city], [region], [postalcode], [country], [phone], [fax]) VALUES (41, N'Customer XIIWM', N'Litton, Tim', N'Sales Manager', N'3456 rue Alsace-Lorraine', N'Toulouse', NULL, N'10053', N'France', N'90.12.34.56', N'90.12.34.57')
INSERT [Sales].[Customers] ([custid], [companyname], [contactname], [contacttitle], [address], [city], [region], [postalcode], [country], [phone], [fax]) VALUES (42, N'Customer IAIJK', N'Steiner, Dominik', N'Marketing Assistant', N'2345 Oak St.', N'Vancouver', N'BC', N'10098', N'Canada', N'(604) 567-8901', N'(604) 234-5678')
INSERT [Sales].[Customers] ([custid], [companyname], [contactname], [contacttitle], [address], [city], [region], [postalcode], [country], [phone], [fax]) VALUES (43, N'Customer UISOJ', N'Deshpande, Anu', N'Marketing Manager', N'8901 Orchestra Terrace', N'Walla Walla', N'WA', N'10069', N'USA', N'(509) 555-0119', N'(509) 555-0130')
INSERT [Sales].[Customers] ([custid], [companyname], [contactname], [contacttitle], [address], [city], [region], [postalcode], [country], [phone], [fax]) VALUES (44, N'Customer OXFRU', N'Louverdis, George', N'Sales Representative', N'Magazinweg 8901', N'Frankfurt a.M.', NULL, N'10095', N'Germany', N'069-7890123', N'069-4567890')
INSERT [Sales].[Customers] ([custid], [companyname], [contactname], [contacttitle], [address], [city], [region], [postalcode], [country], [phone], [fax]) VALUES (45, N'Customer QXPPT', N'Sunkammurali,  Krishna', N'Owner', N'1234 Polk St. Suite 5', N'San Francisco', N'CA', N'10062', N'USA', N'(415) 555-0118', NULL)
INSERT [Sales].[Customers] ([custid], [companyname], [contactname], [contacttitle], [address], [city], [region], [postalcode], [country], [phone], [fax]) VALUES (46, N'Customer XPNIK', N'Dressler, Marlies', N'Accounting Manager', N'Carrera 7890 con Ave. Bolívar #65-98 Llano Largo', N'Barquisimeto', N'Lara', N'10093', N'Venezuela', N'(9) 789-0123', N'(9) 456-7890')
INSERT [Sales].[Customers] ([custid], [companyname], [contactname], [contacttitle], [address], [city], [region], [postalcode], [country], [phone], [fax]) VALUES (47, N'Customer PSQUZ', N'Lupu, Cornel', N'Owner', N'Ave. 5 de Mayo Porlamar 5678', N'I. de Margarita', N'Nueva Esparta', N'10121', N'Venezuela', N'(8) 01-23-45', N'(8) 67-89-01')
INSERT [Sales].[Customers] ([custid], [companyname], [contactname], [contacttitle], [address], [city], [region], [postalcode], [country], [phone], [fax]) VALUES (48, N'Customer DVFMB', N'Szymczak, Radosław', N'Sales Manager', N'9012 Chiaroscuro Rd.', N'Portland', N'OR', N'10073', N'USA', N'(503) 555-0117', N'(503) 555-0129')
INSERT [Sales].[Customers] ([custid], [companyname], [contactname], [contacttitle], [address], [city], [region], [postalcode], [country], [phone], [fax]) VALUES (49, N'Customer CQRAA', N'Duerr, Bernard', N'Marketing Manager', N'Via Ludovico il Moro 6789', N'Bergamo', NULL, N'10106', N'Italy', N'035-345678', N'035-901234')
INSERT [Sales].[Customers] ([custid], [companyname], [contactname], [contacttitle], [address], [city], [region], [postalcode], [country], [phone], [fax]) VALUES (50, N'Customer JYPSC', N'Mace, Donald', N'Sales Agent', N'Rue Joseph-Bens 0123', N'Bruxelles', NULL, N'10074', N'Belgium', N'(02) 890 12 34', N'(02) 567 89 01')
INSERT [Sales].[Customers] ([custid], [companyname], [contactname], [contacttitle], [address], [city], [region], [postalcode], [country], [phone], [fax]) VALUES (51, N'Customer PVDZC', N'Taylor, Maurice', N'Marketing Assistant', N'8901 rue St. Laurent', N'Montréal', N'Québec', N'10040', N'Canada', N'(514) 345-6789', N'(514) 012-3456')
INSERT [Sales].[Customers] ([custid], [companyname], [contactname], [contacttitle], [address], [city], [region], [postalcode], [country], [phone], [fax]) VALUES (52, N'Customer PZNLA', N'Dupont-Roc, Patrice', N'Marketing Assistant', N'Heerstr. 4567', N'Leipzig', NULL, N'10125', N'Germany', N'0342-12345', NULL)
INSERT [Sales].[Customers] ([custid], [companyname], [contactname], [contacttitle], [address], [city], [region], [postalcode], [country], [phone], [fax]) VALUES (53, N'Customer GCJSG', N'Mallit, Ken', N'Sales Associate', N'South House 1234 Queensbridge', N'London', NULL, N'10061', N'UK', N'(171) 890-1234', N'(171) 890-1235')
INSERT [Sales].[Customers] ([custid], [companyname], [contactname], [contacttitle], [address], [city], [region], [postalcode], [country], [phone], [fax]) VALUES (54, N'Customer TDKEG', N'Tiano, Mike', N'Sales Agent', N'Ing. Gustavo Moncada 0123 Piso 20-A', N'Buenos Aires', NULL, N'10094', N'Argentina', N'(1) 123-4567', N'(1) 890-1234')
INSERT [Sales].[Customers] ([custid], [companyname], [contactname], [contacttitle], [address], [city], [region], [postalcode], [country], [phone], [fax]) VALUES (55, N'Customer KZQZT', N'Egelund-Muller, Anja', N'Sales Representative', N'7890 Bering St.', N'Anchorage', N'AK', N'10050', N'USA', N'(907) 555-0115', N'(907) 555-0128')
INSERT [Sales].[Customers] ([custid], [companyname], [contactname], [contacttitle], [address], [city], [region], [postalcode], [country], [phone], [fax]) VALUES (56, N'Customer QNIVZ', N'Marinova, Nadejda', N'Owner', N'Mehrheimerstr. 9012', N'Köln', NULL, N'10047', N'Germany', N'0221-0123456', N'0221-7890123')
INSERT [Sales].[Customers] ([custid], [companyname], [contactname], [contacttitle], [address], [city], [region], [postalcode], [country], [phone], [fax]) VALUES (57, N'Customer WVAXS', N'Tollevsen, Bjørn', N'Owner', N'5678, boulevard Charonne', N'Paris', NULL, N'10085', N'France', N'(1) 89.01.23.45', N'(1) 89.01.23.46')
INSERT [Sales].[Customers] ([custid], [companyname], [contactname], [contacttitle], [address], [city], [region], [postalcode], [country], [phone], [fax]) VALUES (58, N'Customer AHXHT', N'Fakhouri, Fadi', N'Sales Representative', N'Calle Dr. Jorge Cash 8901', N'México D.F.', NULL, N'10116', N'Mexico', N'(5) 890-1234', N'(5) 567-8901')
INSERT [Sales].[Customers] ([custid], [companyname], [contactname], [contacttitle], [address], [city], [region], [postalcode], [country], [phone], [fax]) VALUES (59, N'Customer LOLJO', N'Meston, Tosh', N'Sales Manager', N'Geislweg 2345', N'Salzburg', NULL, N'10127', N'Austria', N'4567-8901', N'2345-6789')
INSERT [Sales].[Customers] ([custid], [companyname], [contactname], [contacttitle], [address], [city], [region], [postalcode], [country], [phone], [fax]) VALUES (60, N'Customer QZURI', N'Uppal, Sunil', N'Sales Representative', N'Estrada da saúde n. 6789', N'Lisboa', NULL, N'10083', N'Portugal', N'(1) 789-0123', NULL)
INSERT [Sales].[Customers] ([custid], [companyname], [contactname], [contacttitle], [address], [city], [region], [postalcode], [country], [phone], [fax]) VALUES (61, N'Customer WULWD', N'Florczyk, Krzysztof', N'Accounting Manager', N'Rua da Panificadora, 1234', N'Rio de Janeiro', N'RJ', N'10115', N'Brazil', N'(21) 678-9012', N'(21) 678-9013')
INSERT [Sales].[Customers] ([custid], [companyname], [contactname], [contacttitle], [address], [city], [region], [postalcode], [country], [phone], [fax]) VALUES (62, N'Customer WFIZJ', N'Misiec, Anna', N'Marketing Assistant', N'Alameda dos Canàrios, 1234', N'Sao Paulo', N'SP', N'10102', N'Brazil', N'(11) 901-2345', NULL)
INSERT [Sales].[Customers] ([custid], [companyname], [contactname], [contacttitle], [address], [city], [region], [postalcode], [country], [phone], [fax]) VALUES (63, N'Customer IRRVL', N'Veronesi, Giorgio', N'Accounting Manager', N'Taucherstraße 1234', N'Cunewalde', NULL, N'10126', N'Germany', N'0372-12345', NULL)
INSERT [Sales].[Customers] ([custid], [companyname], [contactname], [contacttitle], [address], [city], [region], [postalcode], [country], [phone], [fax]) VALUES (64, N'Customer LWGMD', N'Gaffney, Lawrie', N'Sales Representative', N'Av. del Libertador 3456', N'Buenos Aires', NULL, N'10124', N'Argentina', N'(1) 234-5678', N'(1) 901-2345')
INSERT [Sales].[Customers] ([custid], [companyname], [contactname], [contacttitle], [address], [city], [region], [postalcode], [country], [phone], [fax]) VALUES (65, N'Customer NYUHS', N'Moore, Michael', N'Assistant Sales Representative', N'6789 Milton Dr.', N'Albuquerque', N'NM', N'10109', N'USA', N'(505) 555-0125', N'(505) 555-0134')
INSERT [Sales].[Customers] ([custid], [companyname], [contactname], [contacttitle], [address], [city], [region], [postalcode], [country], [phone], [fax]) VALUES (66, N'Customer LHANT', N'Voss, Florian', N'Sales Associate', N'Strada Provinciale 7890', N'Reggio Emilia', NULL, N'10038', N'Italy', N'0522-012345', N'0522-678901')
INSERT [Sales].[Customers] ([custid], [companyname], [contactname], [contacttitle], [address], [city], [region], [postalcode], [country], [phone], [fax]) VALUES (67, N'Customer QVEPD', N'Garden, Euan', N'Assistant Sales Agent', N'Av. Copacabana, 6789', N'Rio de Janeiro', N'RJ', N'10052', N'Brazil', N'(21) 345-6789', NULL)
INSERT [Sales].[Customers] ([custid], [companyname], [contactname], [contacttitle], [address], [city], [region], [postalcode], [country], [phone], [fax]) VALUES (68, N'Customer CCKOT', N'Myrcha, Jacek', N'Sales Manager', N'Grenzacherweg 0123', N'Genève', NULL, N'10122', N'Switzerland', N'0897-012345', NULL)
INSERT [Sales].[Customers] ([custid], [companyname], [contactname], [contacttitle], [address], [city], [region], [postalcode], [country], [phone], [fax]) VALUES (69, N'Customer SIUIH', N'Watters, Jason M.', N'Accounting Manager', N'Gran Vía, 4567', N'Madrid', NULL, N'10071', N'Spain', N'(91) 567 8901', N'(91) 234 5678')
INSERT [Sales].[Customers] ([custid], [companyname], [contactname], [contacttitle], [address], [city], [region], [postalcode], [country], [phone], [fax]) VALUES (70, N'Customer TMXGN', N'Ginters, Kaspars', N'Owner', N'Erling Skakkes gate 2345', N'Stavern', NULL, N'10123', N'Norway', N'07-89 01 23', N'07-45 67 89')
INSERT [Sales].[Customers] ([custid], [companyname], [contactname], [contacttitle], [address], [city], [region], [postalcode], [country], [phone], [fax]) VALUES (71, N'Customer LCOUJ', N'Navarro, Tomás', N'Sales Representative', N'9012 Suffolk Ln.', N'Boise', N'ID', N'10078', N'USA', N'(208) 555-0116', NULL)
INSERT [Sales].[Customers] ([custid], [companyname], [contactname], [contacttitle], [address], [city], [region], [postalcode], [country], [phone], [fax]) VALUES (72, N'Customer AHPOP', N'Welcker, Brian', N'Sales Manager', N'4567 Wadhurst Rd.', N'London', NULL, N'10088', N'UK', N'(171) 901-2345', N'(171) 901-2346')
INSERT [Sales].[Customers] ([custid], [companyname], [contactname], [contacttitle], [address], [city], [region], [postalcode], [country], [phone], [fax]) VALUES (73, N'Customer JMIKW', N'Gonzalez, Nuria', N'Owner', N'Vinbæltet 3456', N'Kobenhavn', NULL, N'10079', N'Denmark', N'12 34 56 78', N'90 12 34 56')
INSERT [Sales].[Customers] ([custid], [companyname], [contactname], [contacttitle], [address], [city], [region], [postalcode], [country], [phone], [fax]) VALUES (74, N'Customer YSHXL', N'O’Brien, Dave', N'Marketing Manager', N'9012, rue Lauriston', N'Paris', NULL, N'10058', N'France', N'(1) 23.45.67.89', N'(1) 23.45.67.80')
INSERT [Sales].[Customers] ([custid], [companyname], [contactname], [contacttitle], [address], [city], [region], [postalcode], [country], [phone], [fax]) VALUES (75, N'Customer XOJYP', N'Wojciechowska, Agnieszka', N'Sales Manager', N'P.O. Box 1234', N'Lander', N'WY', N'10113', N'USA', N'(307) 555-0114', N'(307) 555-0127')
INSERT [Sales].[Customers] ([custid], [companyname], [contactname], [contacttitle], [address], [city], [region], [postalcode], [country], [phone], [fax]) VALUES (76, N'Customer SFOGW', N'Gulbis, Katrin', N'Accounting Manager', N'Boulevard Tirou, 2345', N'Charleroi', NULL, N'10100', N'Belgium', N'(071) 56 78 90 12', N'(071) 34 56 78 90')
INSERT [Sales].[Customers] ([custid], [companyname], [contactname], [contacttitle], [address], [city], [region], [postalcode], [country], [phone], [fax]) VALUES (77, N'Customer LCYBZ', N'Osorio, Cristian', N'Marketing Manager', N'2345 Jefferson Way Suite 2', N'Portland', N'OR', N'10042', N'USA', N'(503) 555-0120', NULL)
INSERT [Sales].[Customers] ([custid], [companyname], [contactname], [contacttitle], [address], [city], [region], [postalcode], [country], [phone], [fax]) VALUES (78, N'Customer NLTYP', N'Young, Robin', N'Marketing Assistant', N'0123 Grizzly Peak Rd.', N'Butte', N'MT', N'10107', N'USA', N'(406) 555-0121', N'(406) 555-0131')
INSERT [Sales].[Customers] ([custid], [companyname], [contactname], [contacttitle], [address], [city], [region], [postalcode], [country], [phone], [fax]) VALUES (79, N'Customer FAPSM', N'Wickham, Jim', N'Marketing Manager', N'Luisenstr. 0123', N'Münster', NULL, N'10118', N'Germany', N'0251-456789', N'0251-012345')
INSERT [Sales].[Customers] ([custid], [companyname], [contactname], [contacttitle], [address], [city], [region], [postalcode], [country], [phone], [fax]) VALUES (80, N'Customer VONTK', N'Geschwandtner, Jens', N'Owner', N'Avda. Azteca 4567', N'México D.F.', NULL, N'10044', N'Mexico', N'(5) 678-9012', NULL)
INSERT [Sales].[Customers] ([custid], [companyname], [contactname], [contacttitle], [address], [city], [region], [postalcode], [country], [phone], [fax]) VALUES (81, N'Customer YQQWW', N'Nagel, Jean-Philippe', N'Sales Representative', N'Av. Inês de Castro, 1234', N'Sao Paulo', N'SP', N'10120', N'Brazil', N'(11) 123-4567', N'(11) 234-5678')
INSERT [Sales].[Customers] ([custid], [companyname], [contactname], [contacttitle], [address], [city], [region], [postalcode], [country], [phone], [fax]) VALUES (82, N'Customer EYHKM', N'Veninga, Tjeerd', N'Sales Associate', N'1234 DaVinci Blvd.', N'Kirkland', N'WA', N'10119', N'USA', N'(206) 555-0124', N'(206) 555-0133')
INSERT [Sales].[Customers] ([custid], [companyname], [contactname], [contacttitle], [address], [city], [region], [postalcode], [country], [phone], [fax]) VALUES (83, N'Customer ZRNDE', N'Fonteneau, Karl', N'Sales Manager', N'Smagsloget 3456', N'Århus', NULL, N'10090', N'Denmark', N'23 45 67 89', N'01 23 45 67')
INSERT [Sales].[Customers] ([custid], [companyname], [contactname], [contacttitle], [address], [city], [region], [postalcode], [country], [phone], [fax]) VALUES (84, N'Customer NRCSK', N'Tuntisangaroon, Sittichai', N'Sales Agent', N'6789, rue du Commerce', N'Lyon', NULL, N'10072', N'France', N'78.90.12.34', N'78.90.12.35')
INSERT [Sales].[Customers] ([custid], [companyname], [contactname], [contacttitle], [address], [city], [region], [postalcode], [country], [phone], [fax]) VALUES (85, N'Customer ENQZT', N'McLin, Nkenge', N'Accounting Manager', N'5678 rue de l''Abbaye', N'Reims', NULL, N'10082', N'France', N'56.78.90.12', N'56.78.90.13')
INSERT [Sales].[Customers] ([custid], [companyname], [contactname], [contacttitle], [address], [city], [region], [postalcode], [country], [phone], [fax]) VALUES (86, N'Customer SNXOJ', N'Syamala, Manoj', N'Sales Representative', N'Adenauerallee 7890', N'Stuttgart', NULL, N'10086', N'Germany', N'0711-345678', N'0711-901234')
INSERT [Sales].[Customers] ([custid], [companyname], [contactname], [contacttitle], [address], [city], [region], [postalcode], [country], [phone], [fax]) VALUES (87, N'Customer ZHYOS', N'Ludwig, Michael', N'Accounting Manager', N'Torikatu 9012', N'Oulu', NULL, N'10045', N'Finland', N'981-123456', N'981-789012')
INSERT [Sales].[Customers] ([custid], [companyname], [contactname], [contacttitle], [address], [city], [region], [postalcode], [country], [phone], [fax]) VALUES (88, N'Customer SRQVM', N'Li, Yan', N'Sales Manager', N'Rua do Mercado, 4567', N'Resende', N'SP', N'10084', N'Brazil', N'(14) 234-5678', NULL)
INSERT [Sales].[Customers] ([custid], [companyname], [contactname], [contacttitle], [address], [city], [region], [postalcode], [country], [phone], [fax]) VALUES (89, N'Customer YBQTI', N'Smith Jr., Ronaldo', N'Owner', N'8901 - 14th Ave. S. Suite 3B', N'Seattle', N'WA', N'10049', N'USA', N'(206) 555-0123', N'(206) 555-0132')
INSERT [Sales].[Customers] ([custid], [companyname], [contactname], [contacttitle], [address], [city], [region], [postalcode], [country], [phone], [fax]) VALUES (90, N'Customer XBBVR', N'Larsson, Katarina', N'Owner/Marketing Assistant', N'Keskuskatu 2345', N'Helsinki', NULL, N'10055', N'Finland', N'90-012 3456', N'90-789 0123')
INSERT [Sales].[Customers] ([custid], [companyname], [contactname], [contacttitle], [address], [city], [region], [postalcode], [country], [phone], [fax]) VALUES (91, N'Customer CCFIZ', N'Conn, Steve', N'Owner', N'ul. Filtrowa 6789', N'Warszawa', NULL, N'10068', N'Poland', N'(26) 234-5678', N'(26) 901-2345')
INSERT [Sales].[Customers] ([custid], [companyname], [contactname], [contacttitle], [address], [city], [region], [postalcode], [country], [phone], [fax]) VALUES (92, N'sdfsdf', N'wefwe', N'werfwe', N'sdfsd', N'Salzburg', NULL, NULL, N'UK', N'345-43232', N'345-42323')
INSERT [Sales].[Customers] ([custid], [companyname], [contactname], [contacttitle], [address], [city], [region], [postalcode], [country], [phone], [fax]) VALUES (93, N'AAAA', N'AAAA', N'AAsdfg', N'sdgsdf sdgf sd sdg sg', N'Aachen', NULL, NULL, N'USA', N'456-10101', NULL)
INSERT [Sales].[Customers] ([custid], [companyname], [contactname], [contacttitle], [address], [city], [region], [postalcode], [country], [phone], [fax]) VALUES (101, N'Customer NRZBB', N'Allen, Michael', N'Sales Representative', N'Obere Str. 0123wewewe', N'-1', N'-1', N'10092', N'-1', N'030-3456789', N'030-0123456')
SET IDENTITY_INSERT [Sales].[Customers] OFF
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10248, 11, 9.8000, 10, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10248, 42, 9.8000, 10, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10248, 58, 13.2500, 23, CAST(0.055 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10248, 72, 34.8000, 5, CAST(0.222 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10249, 14, 18.6000, 90, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10249, 51, 42.4000, 40, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10250, 41, 7.7000, 10, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10250, 51, 42.4000, 35, CAST(0.150 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10250, 65, 16.8000, 15, CAST(0.150 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10251, 22, 16.8000, 6, CAST(0.050 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10251, 57, 15.6000, 15, CAST(0.050 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10251, 65, 16.8000, 20, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10252, 20, 64.8000, 40, CAST(0.050 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10252, 33, 2.0000, 25, CAST(0.050 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10252, 60, 27.2000, 40, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10253, 31, 10.0000, 20, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10253, 39, 14.4000, 42, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10253, 49, 16.0000, 40, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10254, 24, 3.6000, 15, CAST(0.150 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10254, 55, 19.2000, 21, CAST(0.150 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10254, 74, 8.0000, 21, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10255, 2, 15.2000, 20, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10255, 16, 13.9000, 35, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10255, 36, 15.2000, 25, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10255, 59, 44.0000, 30, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10256, 53, 26.2000, 15, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10256, 77, 10.4000, 12, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10257, 27, 35.1000, 25, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10257, 39, 14.4000, 6, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10257, 77, 10.4000, 15, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10258, 2, 15.2000, 50, CAST(0.200 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10258, 5, 17.0000, 65, CAST(0.200 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10258, 32, 25.6000, 6, CAST(0.200 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10259, 21, 8.0000, 10, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10259, 37, 20.8000, 1, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10260, 41, 7.7000, 16, CAST(0.250 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10260, 57, 15.6000, 50, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10260, 62, 39.4000, 15, CAST(0.250 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10260, 70, 12.0000, 21, CAST(0.250 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10261, 21, 8.0000, 20, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10261, 35, 14.4000, 20, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10262, 5, 17.0000, 12, CAST(0.200 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10262, 7, 24.0000, 15, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10262, 56, 30.4000, 2, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10263, 16, 13.9000, 60, CAST(0.250 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10263, 24, 3.6000, 28, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10263, 30, 20.7000, 60, CAST(0.250 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10263, 74, 8.0000, 36, CAST(0.250 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10264, 2, 15.2000, 35, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10264, 41, 7.7000, 25, CAST(0.150 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10265, 17, 31.2000, 30, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10265, 70, 12.0000, 20, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10266, 12, 30.4000, 12, CAST(0.050 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10267, 40, 14.7000, 50, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10267, 59, 44.0000, 70, CAST(0.150 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10267, 76, 14.4000, 15, CAST(0.150 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10268, 29, 99.0000, 10, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10268, 72, 27.8000, 4, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10269, 33, 2.0000, 60, CAST(0.050 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10269, 72, 27.8000, 20, CAST(0.050 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10270, 36, 15.2000, 30, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10270, 43, 36.8000, 25, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10271, 33, 2.0000, 24, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10272, 20, 64.8000, 6, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10272, 31, 10.0000, 40, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10272, 72, 27.8000, 24, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10273, 10, 24.8000, 24, CAST(0.050 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10273, 31, 10.0000, 15, CAST(0.050 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10273, 33, 2.0000, 20, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10273, 40, 14.7000, 60, CAST(0.050 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10273, 76, 14.4000, 33, CAST(0.050 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10274, 71, 17.2000, 20, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10274, 72, 27.8000, 7, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10275, 24, 3.6000, 12, CAST(0.050 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10275, 59, 44.0000, 6, CAST(0.050 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10276, 10, 24.8000, 15, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10276, 13, 4.8000, 10, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10277, 28, 36.4000, 20, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10277, 62, 39.4000, 12, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10278, 44, 15.5000, 16, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10278, 59, 44.0000, 15, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10278, 63, 35.1000, 8, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10278, 73, 12.0000, 25, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10279, 17, 31.2000, 15, CAST(0.250 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10280, 24, 3.6000, 12, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10280, 55, 19.2000, 20, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10280, 75, 6.2000, 30, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10281, 19, 7.3000, 1, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10281, 24, 3.6000, 6, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10281, 35, 14.4000, 4, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10282, 30, 20.7000, 6, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10282, 57, 15.6000, 2, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10283, 15, 12.4000, 20, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10283, 19, 7.3000, 18, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10283, 60, 27.2000, 35, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10283, 72, 27.8000, 3, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10284, 27, 35.1000, 15, CAST(0.250 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10284, 44, 15.5000, 21, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10284, 60, 27.2000, 20, CAST(0.250 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10284, 67, 11.2000, 5, CAST(0.250 AS Numeric(4, 3)))
GO
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10285, 1, 14.4000, 45, CAST(0.200 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10285, 40, 14.7000, 40, CAST(0.200 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10285, 53, 26.2000, 36, CAST(0.200 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10286, 35, 14.4000, 100, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10286, 62, 39.4000, 40, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10287, 16, 13.9000, 40, CAST(0.150 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10287, 34, 11.2000, 20, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10287, 46, 9.6000, 15, CAST(0.150 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10288, 54, 5.9000, 10, CAST(0.100 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10288, 68, 10.0000, 3, CAST(0.100 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10289, 3, 8.0000, 30, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10289, 64, 26.6000, 9, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10290, 5, 17.0000, 20, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10290, 29, 99.0000, 15, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10290, 49, 16.0000, 15, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10290, 77, 10.4000, 10, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10291, 13, 4.8000, 20, CAST(0.100 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10291, 44, 15.5000, 24, CAST(0.100 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10291, 51, 42.4000, 2, CAST(0.100 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10292, 20, 64.8000, 20, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10293, 18, 50.0000, 12, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10293, 24, 3.6000, 10, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10293, 63, 35.1000, 5, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10293, 75, 6.2000, 6, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10294, 1, 14.4000, 18, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10294, 17, 31.2000, 15, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10294, 43, 36.8000, 15, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10294, 60, 27.2000, 21, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10294, 75, 6.2000, 6, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10295, 56, 30.4000, 4, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10296, 11, 16.8000, 12, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10296, 16, 13.9000, 30, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10296, 69, 28.8000, 15, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10297, 39, 14.4000, 60, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10297, 72, 27.8000, 20, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10298, 2, 15.2000, 40, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10298, 36, 15.2000, 40, CAST(0.250 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10298, 59, 44.0000, 30, CAST(0.250 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10298, 62, 39.4000, 15, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10299, 19, 7.3000, 15, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10299, 70, 12.0000, 20, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10300, 66, 13.6000, 30, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10300, 68, 10.0000, 20, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10301, 40, 14.7000, 10, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10301, 56, 30.4000, 20, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10302, 17, 31.2000, 40, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10302, 28, 36.4000, 28, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10302, 43, 36.8000, 12, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10303, 40, 14.7000, 40, CAST(0.100 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10303, 65, 16.8000, 30, CAST(0.100 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10303, 68, 10.0000, 15, CAST(0.100 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10304, 49, 16.0000, 30, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10304, 59, 44.0000, 10, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10304, 71, 17.2000, 2, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10305, 18, 50.0000, 25, CAST(0.100 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10305, 29, 99.0000, 25, CAST(0.100 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10305, 39, 14.4000, 30, CAST(0.100 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10306, 30, 20.7000, 10, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10306, 53, 26.2000, 10, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10306, 54, 5.9000, 5, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10307, 62, 39.4000, 10, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10307, 68, 10.0000, 3, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10308, 69, 28.8000, 1, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10308, 70, 12.0000, 5, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10309, 4, 17.6000, 20, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10309, 6, 20.0000, 30, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10309, 42, 11.2000, 2, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10309, 43, 36.8000, 20, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10309, 71, 17.2000, 3, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10310, 16, 13.9000, 10, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10310, 62, 39.4000, 5, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10311, 42, 11.2000, 6, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10311, 69, 28.8000, 7, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10312, 28, 36.4000, 4, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10312, 43, 36.8000, 24, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10312, 53, 26.2000, 20, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10312, 75, 6.2000, 10, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10313, 36, 15.2000, 12, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10314, 32, 25.6000, 40, CAST(0.100 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10314, 58, 10.6000, 30, CAST(0.100 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10314, 62, 39.4000, 25, CAST(0.100 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10315, 34, 11.2000, 14, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10315, 70, 12.0000, 30, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10316, 41, 7.7000, 10, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10316, 62, 39.4000, 70, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10317, 1, 14.4000, 20, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10318, 41, 7.7000, 20, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10318, 76, 14.4000, 6, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10319, 17, 31.2000, 8, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10319, 28, 36.4000, 14, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10319, 76, 14.4000, 30, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10320, 71, 17.2000, 30, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10321, 35, 14.4000, 10, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10322, 52, 5.6000, 20, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10323, 15, 12.4000, 5, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10323, 25, 11.2000, 4, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10323, 39, 14.4000, 4, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10324, 16, 13.9000, 21, CAST(0.150 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10324, 35, 14.4000, 70, CAST(0.150 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10324, 46, 9.6000, 30, CAST(0.000 AS Numeric(4, 3)))
GO
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10324, 59, 44.0000, 40, CAST(0.150 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10324, 63, 35.1000, 80, CAST(0.150 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10324, 83, 9.6000, 20, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10325, 6, 20.0000, 6, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10325, 13, 4.8000, 12, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10325, 14, 18.6000, 9, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10325, 31, 10.0000, 4, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10325, 72, 27.8000, 40, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10326, 4, 17.6000, 24, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10326, 57, 15.6000, 16, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10326, 75, 6.2000, 50, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10327, 2, 15.2000, 25, CAST(0.200 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10327, 11, 16.8000, 50, CAST(0.200 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10327, 30, 20.7000, 35, CAST(0.200 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10327, 58, 10.6000, 30, CAST(0.200 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10328, 59, 44.0000, 9, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10328, 65, 16.8000, 40, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10328, 68, 10.0000, 10, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10329, 19, 7.3000, 10, CAST(0.050 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10329, 30, 20.7000, 8, CAST(0.050 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10329, 38, 210.8000, 20, CAST(0.050 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10329, 56, 30.4000, 12, CAST(0.050 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10330, 26, 24.9000, 50, CAST(0.150 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10330, 72, 27.8000, 25, CAST(0.150 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10331, 54, 5.9000, 15, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10332, 18, 50.0000, 40, CAST(0.200 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10332, 42, 11.2000, 10, CAST(0.200 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10332, 47, 7.6000, 16, CAST(0.200 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10333, 14, 18.6000, 10, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10333, 21, 8.0000, 10, CAST(0.100 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10333, 71, 17.2000, 40, CAST(0.100 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10334, 52, 5.6000, 8, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10334, 68, 10.0000, 10, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10335, 2, 15.2000, 7, CAST(0.200 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10335, 31, 10.0000, 25, CAST(0.200 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10335, 32, 25.6000, 6, CAST(0.200 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10335, 51, 42.4000, 48, CAST(0.200 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10336, 4, 17.6000, 18, CAST(0.100 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10337, 23, 7.2000, 40, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10337, 26, 24.9000, 24, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10337, 36, 15.2000, 20, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10337, 37, 20.8000, 28, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10337, 72, 27.8000, 25, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10338, 17, 31.2000, 20, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10338, 30, 20.7000, 15, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10339, 4, 17.6000, 10, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10339, 17, 31.2000, 70, CAST(0.050 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10339, 62, 39.4000, 28, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10340, 18, 50.0000, 20, CAST(0.050 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10340, 41, 7.7000, 12, CAST(0.050 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10340, 43, 36.8000, 40, CAST(0.050 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10341, 33, 2.0000, 8, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10341, 59, 44.0000, 9, CAST(0.150 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10342, 2, 15.2000, 24, CAST(0.200 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10342, 31, 10.0000, 56, CAST(0.200 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10342, 36, 15.2000, 40, CAST(0.200 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10342, 55, 19.2000, 40, CAST(0.200 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10343, 64, 26.6000, 50, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10343, 68, 10.0000, 4, CAST(0.050 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10343, 76, 14.4000, 15, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10344, 4, 17.6000, 35, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10344, 8, 32.0000, 70, CAST(0.250 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10345, 8, 32.0000, 70, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10345, 19, 7.3000, 80, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10345, 42, 11.2000, 9, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10346, 17, 31.2000, 36, CAST(0.100 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10346, 56, 30.4000, 20, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10347, 25, 11.2000, 10, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10347, 39, 14.4000, 50, CAST(0.150 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10347, 40, 14.7000, 4, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10347, 75, 6.2000, 6, CAST(0.150 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10348, 1, 14.4000, 15, CAST(0.150 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10348, 23, 7.2000, 25, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10349, 54, 5.9000, 24, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10350, 50, 13.0000, 15, CAST(0.100 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10350, 69, 28.8000, 18, CAST(0.100 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10351, 38, 210.8000, 20, CAST(0.050 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10351, 41, 7.7000, 13, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10351, 44, 15.5000, 77, CAST(0.050 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10351, 65, 16.8000, 10, CAST(0.050 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10352, 24, 3.6000, 10, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10352, 54, 5.9000, 20, CAST(0.150 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10353, 11, 16.8000, 12, CAST(0.200 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10353, 38, 210.8000, 50, CAST(0.200 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10354, 1, 14.4000, 12, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10354, 29, 99.0000, 4, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10355, 24, 3.6000, 25, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10355, 57, 15.6000, 25, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10356, 31, 10.0000, 30, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10356, 55, 19.2000, 12, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10356, 69, 28.8000, 20, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10357, 10, 24.8000, 30, CAST(0.200 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10357, 26, 24.9000, 16, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10357, 60, 27.2000, 8, CAST(0.200 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10358, 24, 3.6000, 10, CAST(0.050 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10358, 34, 11.2000, 10, CAST(0.050 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10358, 36, 15.2000, 20, CAST(0.050 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10359, 16, 13.9000, 56, CAST(0.050 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10359, 31, 10.0000, 70, CAST(0.050 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10359, 60, 27.2000, 80, CAST(0.050 AS Numeric(4, 3)))
GO
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10360, 28, 36.4000, 30, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10360, 29, 99.0000, 35, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10360, 38, 210.8000, 10, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10360, 49, 16.0000, 35, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10360, 54, 5.9000, 28, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10361, 39, 14.4000, 54, CAST(0.100 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10361, 60, 27.2000, 55, CAST(0.100 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10362, 25, 11.2000, 50, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10362, 51, 42.4000, 20, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10362, 54, 5.9000, 24, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10363, 31, 10.0000, 20, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10363, 75, 6.2000, 12, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10363, 76, 14.4000, 12, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10364, 69, 28.8000, 30, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10364, 71, 17.2000, 5, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10365, 11, 16.8000, 24, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10366, 65, 16.8000, 5, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10366, 77, 10.4000, 5, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10367, 34, 11.2000, 36, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10367, 54, 5.9000, 18, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10367, 65, 16.8000, 15, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10367, 77, 10.4000, 7, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10368, 21, 8.0000, 5, CAST(0.100 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10368, 28, 36.4000, 13, CAST(0.100 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10368, 57, 15.6000, 25, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10368, 64, 26.6000, 35, CAST(0.100 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10369, 29, 99.0000, 20, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10369, 56, 30.4000, 18, CAST(0.250 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10370, 1, 14.4000, 15, CAST(0.150 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10370, 64, 26.6000, 30, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10370, 74, 8.0000, 20, CAST(0.150 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10371, 36, 15.2000, 6, CAST(0.200 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10372, 20, 64.8000, 12, CAST(0.250 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10372, 38, 210.8000, 40, CAST(0.250 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10372, 60, 27.2000, 70, CAST(0.250 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10372, 72, 27.8000, 42, CAST(0.250 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10373, 58, 10.6000, 80, CAST(0.200 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10373, 71, 17.2000, 50, CAST(0.200 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10374, 31, 10.0000, 30, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10374, 58, 10.6000, 15, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10375, 14, 18.6000, 15, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10375, 54, 5.9000, 10, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10376, 31, 10.0000, 42, CAST(0.050 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10377, 28, 36.4000, 20, CAST(0.150 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10377, 39, 14.4000, 20, CAST(0.150 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10378, 71, 17.2000, 6, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10379, 41, 7.7000, 8, CAST(0.100 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10379, 63, 35.1000, 16, CAST(0.100 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10379, 65, 16.8000, 20, CAST(0.100 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10380, 30, 20.7000, 18, CAST(0.100 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10380, 53, 26.2000, 20, CAST(0.100 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10380, 60, 27.2000, 6, CAST(0.100 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10380, 70, 12.0000, 30, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10381, 74, 8.0000, 14, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10382, 5, 17.0000, 32, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10382, 18, 50.0000, 9, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10382, 29, 99.0000, 14, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10382, 33, 2.0000, 60, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10382, 74, 8.0000, 50, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10383, 13, 4.8000, 20, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10383, 50, 13.0000, 15, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10383, 56, 30.4000, 20, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10384, 20, 64.8000, 28, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10384, 60, 27.2000, 15, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10385, 7, 24.0000, 10, CAST(0.200 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10385, 60, 27.2000, 20, CAST(0.200 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10385, 68, 10.0000, 8, CAST(0.200 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10386, 24, 3.6000, 15, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10386, 34, 11.2000, 10, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10387, 24, 3.6000, 15, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10387, 28, 36.4000, 6, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10387, 59, 44.0000, 12, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10387, 71, 17.2000, 15, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10388, 45, 7.6000, 15, CAST(0.200 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10388, 52, 5.6000, 20, CAST(0.200 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10388, 53, 26.2000, 40, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10389, 10, 24.8000, 16, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10389, 55, 19.2000, 15, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10389, 62, 39.4000, 20, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10389, 70, 12.0000, 30, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10390, 31, 10.0000, 60, CAST(0.100 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10390, 35, 14.4000, 40, CAST(0.100 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10390, 46, 9.6000, 45, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10390, 72, 27.8000, 24, CAST(0.100 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10391, 13, 4.8000, 18, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10392, 69, 28.8000, 50, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10393, 2, 15.2000, 25, CAST(0.250 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10393, 14, 18.6000, 42, CAST(0.250 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10393, 25, 11.2000, 7, CAST(0.250 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10393, 26, 24.9000, 70, CAST(0.250 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10393, 31, 10.0000, 32, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10394, 13, 4.8000, 10, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10394, 62, 39.4000, 10, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10395, 46, 9.6000, 28, CAST(0.100 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10395, 53, 26.2000, 70, CAST(0.100 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10395, 69, 28.8000, 8, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10396, 23, 7.2000, 40, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10396, 71, 17.2000, 60, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10396, 72, 27.8000, 21, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10397, 21, 8.0000, 10, CAST(0.150 AS Numeric(4, 3)))
GO
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10397, 51, 42.4000, 18, CAST(0.150 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10398, 35, 14.4000, 30, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10398, 55, 19.2000, 120, CAST(0.100 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10399, 68, 10.0000, 60, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10399, 71, 17.2000, 30, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10399, 76, 14.4000, 35, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10399, 77, 10.4000, 14, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10400, 29, 99.0000, 20, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10400, 35, 14.4000, 35, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10400, 49, 16.0000, 30, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10400, 58, 13.2500, 2, CAST(0.123 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10400, 80, 0.0000, 11, CAST(0.111 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10401, 30, 20.7000, 18, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10401, 56, 30.4000, 70, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10401, 65, 16.8000, 20, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10401, 71, 17.2000, 60, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10402, 23, 7.2000, 60, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10402, 63, 35.1000, 65, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10403, 16, 13.9000, 21, CAST(0.150 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10403, 48, 10.2000, 70, CAST(0.150 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10404, 26, 24.9000, 30, CAST(0.050 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10404, 42, 11.2000, 40, CAST(0.050 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10404, 49, 16.0000, 30, CAST(0.050 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10405, 3, 8.0000, 50, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10406, 1, 14.4000, 10, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10406, 21, 8.0000, 30, CAST(0.100 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10406, 28, 36.4000, 42, CAST(0.100 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10406, 36, 15.2000, 5, CAST(0.100 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10406, 40, 14.7000, 2, CAST(0.100 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10407, 11, 16.8000, 30, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10407, 69, 28.8000, 15, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10407, 71, 17.2000, 15, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10408, 37, 20.8000, 10, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10408, 54, 5.9000, 6, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10408, 62, 39.4000, 35, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10409, 14, 18.6000, 12, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10409, 21, 8.0000, 12, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10410, 33, 2.0000, 49, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10410, 59, 44.0000, 16, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10411, 41, 7.7000, 25, CAST(0.200 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10411, 44, 15.5000, 40, CAST(0.200 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10411, 59, 44.0000, 9, CAST(0.200 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10412, 14, 18.6000, 20, CAST(0.100 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10413, 1, 14.4000, 24, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10413, 62, 39.4000, 40, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10413, 76, 14.4000, 14, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10414, 19, 7.3000, 18, CAST(0.050 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10414, 33, 2.0000, 50, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10415, 17, 31.2000, 2, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10415, 33, 2.0000, 20, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10416, 19, 7.3000, 20, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10416, 53, 26.2000, 10, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10416, 57, 15.6000, 20, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10417, 38, 210.8000, 50, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10417, 46, 9.6000, 2, CAST(0.250 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10417, 68, 10.0000, 36, CAST(0.250 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10417, 77, 10.4000, 35, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10418, 2, 15.2000, 60, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10418, 47, 7.6000, 55, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10418, 61, 22.8000, 16, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10418, 74, 8.0000, 15, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10419, 60, 27.2000, 60, CAST(0.050 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10419, 69, 28.8000, 20, CAST(0.050 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10420, 9, 77.6000, 20, CAST(0.100 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10420, 13, 4.8000, 2, CAST(0.100 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10420, 70, 12.0000, 8, CAST(0.100 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10420, 73, 12.0000, 20, CAST(0.100 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10421, 19, 7.3000, 4, CAST(0.150 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10421, 26, 24.9000, 30, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10421, 53, 26.2000, 15, CAST(0.150 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10421, 77, 10.4000, 10, CAST(0.150 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10422, 26, 24.9000, 2, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10423, 31, 10.0000, 14, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10423, 59, 44.0000, 20, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10424, 35, 14.4000, 60, CAST(0.200 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10424, 38, 210.8000, 49, CAST(0.200 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10424, 68, 10.0000, 30, CAST(0.200 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10425, 55, 19.2000, 10, CAST(0.250 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10425, 76, 14.4000, 20, CAST(0.250 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10426, 56, 30.4000, 5, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10426, 64, 26.6000, 7, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10427, 14, 18.6000, 35, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10428, 46, 9.6000, 20, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10429, 50, 13.0000, 40, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10429, 63, 35.1000, 35, CAST(0.250 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10430, 17, 31.2000, 45, CAST(0.200 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10430, 21, 8.0000, 50, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10430, 56, 30.4000, 30, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10430, 59, 44.0000, 70, CAST(0.200 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10431, 17, 31.2000, 50, CAST(0.250 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10431, 40, 14.7000, 50, CAST(0.250 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10431, 47, 7.6000, 30, CAST(0.250 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10432, 26, 24.9000, 10, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10432, 54, 5.9000, 40, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10433, 56, 30.4000, 28, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10434, 11, 16.8000, 6, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10434, 76, 14.4000, 18, CAST(0.150 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10435, 2, 15.2000, 10, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10435, 22, 16.8000, 12, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10435, 72, 27.8000, 10, CAST(0.000 AS Numeric(4, 3)))
GO
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10436, 46, 9.6000, 5, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10436, 56, 30.4000, 40, CAST(0.100 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10436, 64, 26.6000, 30, CAST(0.100 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10436, 75, 6.2000, 24, CAST(0.100 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10437, 53, 26.2000, 15, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10438, 19, 7.3000, 15, CAST(0.200 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10438, 34, 11.2000, 20, CAST(0.200 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10438, 57, 15.6000, 15, CAST(0.200 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10439, 12, 30.4000, 15, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10439, 16, 13.9000, 16, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10439, 64, 26.6000, 6, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10439, 74, 8.0000, 30, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10440, 2, 15.2000, 45, CAST(0.150 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10440, 16, 13.9000, 49, CAST(0.150 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10440, 29, 99.0000, 24, CAST(0.150 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10440, 61, 22.8000, 90, CAST(0.150 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10441, 27, 35.1000, 50, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10442, 11, 16.8000, 30, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10442, 54, 5.9000, 80, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10442, 66, 13.6000, 60, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10443, 11, 16.8000, 6, CAST(0.200 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10443, 28, 36.4000, 12, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10444, 17, 31.2000, 10, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10444, 26, 24.9000, 15, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10444, 35, 14.4000, 8, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10444, 41, 7.7000, 30, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10445, 39, 14.4000, 6, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10445, 54, 5.9000, 15, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10446, 19, 7.3000, 12, CAST(0.100 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10446, 24, 3.6000, 20, CAST(0.100 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10446, 31, 10.0000, 3, CAST(0.100 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10446, 52, 5.6000, 15, CAST(0.100 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10447, 19, 7.3000, 40, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10447, 65, 16.8000, 35, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10447, 71, 17.2000, 2, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10448, 26, 24.9000, 6, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10448, 40, 14.7000, 20, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10449, 10, 24.8000, 14, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10449, 52, 5.6000, 20, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10449, 62, 39.4000, 35, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10450, 10, 24.8000, 20, CAST(0.200 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10450, 54, 5.9000, 6, CAST(0.200 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10451, 55, 19.2000, 120, CAST(0.100 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10451, 64, 26.6000, 35, CAST(0.100 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10451, 65, 16.8000, 28, CAST(0.100 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10451, 77, 10.4000, 55, CAST(0.100 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10452, 28, 36.4000, 15, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10452, 44, 15.5000, 100, CAST(0.050 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10453, 48, 10.2000, 15, CAST(0.100 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10453, 70, 12.0000, 25, CAST(0.100 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10454, 16, 13.9000, 20, CAST(0.200 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10454, 33, 2.0000, 20, CAST(0.200 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10454, 46, 9.6000, 10, CAST(0.200 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10455, 39, 14.4000, 20, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10455, 53, 26.2000, 50, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10455, 61, 22.8000, 25, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10455, 71, 17.2000, 30, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10456, 21, 8.0000, 40, CAST(0.150 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10456, 49, 16.0000, 21, CAST(0.150 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10457, 59, 44.0000, 36, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10458, 26, 24.9000, 30, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10458, 28, 36.4000, 30, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10458, 43, 36.8000, 20, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10458, 56, 30.4000, 15, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10458, 71, 17.2000, 50, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10459, 7, 24.0000, 16, CAST(0.050 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10459, 46, 9.6000, 20, CAST(0.050 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10459, 72, 27.8000, 40, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10460, 68, 10.0000, 21, CAST(0.250 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10460, 75, 6.2000, 4, CAST(0.250 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10461, 21, 8.0000, 40, CAST(0.250 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10461, 30, 20.7000, 28, CAST(0.250 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10461, 55, 19.2000, 60, CAST(0.250 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10462, 13, 4.8000, 1, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10462, 23, 7.2000, 21, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10463, 19, 7.3000, 21, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10463, 42, 11.2000, 50, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10464, 4, 17.6000, 16, CAST(0.200 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10464, 43, 36.8000, 3, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10464, 56, 30.4000, 30, CAST(0.200 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10464, 60, 27.2000, 20, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10465, 24, 3.6000, 25, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10465, 29, 99.0000, 18, CAST(0.100 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10465, 40, 14.7000, 20, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10465, 45, 7.6000, 30, CAST(0.100 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10465, 50, 13.0000, 25, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10466, 11, 16.8000, 10, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10466, 46, 9.6000, 5, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10467, 24, 3.6000, 28, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10467, 25, 11.2000, 12, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10468, 30, 20.7000, 8, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10468, 43, 36.8000, 15, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10469, 2, 15.2000, 40, CAST(0.150 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10469, 16, 13.9000, 35, CAST(0.150 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10469, 44, 15.5000, 2, CAST(0.150 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10470, 18, 50.0000, 30, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10470, 23, 7.2000, 15, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10470, 64, 26.6000, 8, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10471, 7, 24.0000, 30, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10471, 56, 30.4000, 20, CAST(0.000 AS Numeric(4, 3)))
GO
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10472, 24, 3.6000, 80, CAST(0.050 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10472, 51, 42.4000, 18, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10473, 33, 2.0000, 12, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10473, 71, 17.2000, 12, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10474, 14, 18.6000, 12, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10474, 28, 36.4000, 18, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10474, 40, 14.7000, 21, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10474, 75, 6.2000, 10, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10475, 31, 10.0000, 35, CAST(0.150 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10475, 66, 13.6000, 60, CAST(0.150 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10475, 76, 14.4000, 42, CAST(0.150 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10476, 55, 19.2000, 2, CAST(0.050 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10476, 70, 12.0000, 12, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10477, 1, 14.4000, 15, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10477, 21, 8.0000, 21, CAST(0.250 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10477, 39, 14.4000, 20, CAST(0.250 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10478, 10, 24.8000, 20, CAST(0.050 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10479, 38, 210.8000, 30, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10479, 53, 26.2000, 28, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10479, 59, 44.0000, 60, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10479, 64, 26.6000, 30, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10480, 47, 7.6000, 30, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10480, 59, 44.0000, 12, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10481, 49, 16.0000, 24, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10481, 60, 27.2000, 40, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10482, 40, 14.7000, 10, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10483, 34, 11.2000, 35, CAST(0.050 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10483, 77, 10.4000, 30, CAST(0.050 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10484, 21, 8.0000, 14, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10484, 40, 14.7000, 10, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10484, 51, 42.4000, 3, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10485, 2, 15.2000, 20, CAST(0.100 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10485, 3, 8.0000, 20, CAST(0.100 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10485, 55, 19.2000, 30, CAST(0.100 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10485, 70, 12.0000, 60, CAST(0.100 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10486, 11, 16.8000, 5, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10486, 51, 42.4000, 25, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10486, 74, 8.0000, 16, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10487, 19, 7.3000, 5, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10487, 26, 24.9000, 30, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10487, 54, 5.9000, 24, CAST(0.250 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10488, 59, 44.0000, 30, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10488, 73, 12.0000, 20, CAST(0.200 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10489, 11, 16.8000, 15, CAST(0.250 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10489, 16, 13.9000, 18, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10490, 59, 44.0000, 60, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10490, 68, 10.0000, 30, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10490, 75, 6.2000, 36, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10491, 44, 15.5000, 15, CAST(0.150 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10491, 77, 10.4000, 7, CAST(0.150 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10492, 25, 11.2000, 60, CAST(0.050 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10492, 42, 11.2000, 20, CAST(0.050 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10493, 65, 16.8000, 15, CAST(0.100 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10493, 66, 13.6000, 10, CAST(0.100 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10493, 69, 28.8000, 10, CAST(0.100 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10494, 56, 30.4000, 30, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10495, 23, 7.2000, 10, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10495, 41, 7.7000, 20, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10495, 77, 10.4000, 5, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10496, 31, 10.0000, 20, CAST(0.050 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10497, 56, 30.4000, 14, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10497, 72, 27.8000, 25, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10497, 77, 10.4000, 25, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10498, 24, 4.5000, 14, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10498, 40, 18.4000, 5, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10498, 42, 14.0000, 30, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10499, 28, 45.6000, 20, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10499, 49, 20.0000, 25, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10500, 15, 15.5000, 12, CAST(0.050 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10500, 28, 45.6000, 8, CAST(0.050 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10501, 54, 7.4500, 20, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10502, 45, 9.5000, 21, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10502, 53, 32.8000, 6, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10502, 67, 14.0000, 30, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10503, 14, 23.2500, 70, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10503, 65, 21.0500, 20, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10504, 2, 19.0000, 12, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10504, 21, 10.0000, 12, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10504, 53, 32.8000, 10, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10504, 61, 28.5000, 25, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10505, 62, 49.3000, 3, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10506, 25, 14.0000, 18, CAST(0.100 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10506, 70, 15.0000, 14, CAST(0.100 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10507, 43, 46.0000, 15, CAST(0.150 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10507, 48, 12.7500, 15, CAST(0.150 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10508, 13, 6.0000, 10, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10508, 39, 18.0000, 10, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10509, 28, 45.6000, 3, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10510, 29, 123.7900, 36, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10510, 75, 7.7500, 36, CAST(0.100 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10511, 4, 22.0000, 50, CAST(0.150 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10511, 7, 30.0000, 50, CAST(0.150 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10511, 8, 40.0000, 10, CAST(0.150 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10512, 24, 4.5000, 10, CAST(0.150 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10512, 46, 12.0000, 9, CAST(0.150 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10512, 47, 9.5000, 6, CAST(0.150 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10512, 60, 34.0000, 12, CAST(0.150 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10513, 21, 10.0000, 40, CAST(0.200 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10513, 32, 32.0000, 50, CAST(0.200 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10513, 61, 28.5000, 15, CAST(0.200 AS Numeric(4, 3)))
GO
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10514, 20, 81.0000, 39, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10514, 28, 45.6000, 35, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10514, 56, 38.0000, 70, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10514, 65, 21.0500, 39, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10514, 75, 7.7500, 50, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10515, 9, 97.0000, 16, CAST(0.150 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10515, 16, 17.4500, 50, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10515, 27, 43.9000, 120, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10515, 33, 2.5000, 16, CAST(0.150 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10515, 60, 34.0000, 84, CAST(0.150 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10516, 18, 62.5000, 25, CAST(0.100 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10516, 41, 9.6500, 80, CAST(0.100 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10516, 42, 14.0000, 20, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10517, 52, 7.0000, 6, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10517, 59, 55.0000, 4, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10517, 70, 15.0000, 6, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10518, 24, 4.5000, 5, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10518, 38, 263.5000, 15, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10518, 44, 19.4500, 9, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10519, 10, 31.0000, 16, CAST(0.050 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10519, 56, 38.0000, 40, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10519, 60, 34.0000, 10, CAST(0.050 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10520, 24, 4.5000, 8, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10520, 53, 32.8000, 5, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10521, 35, 18.0000, 3, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10521, 41, 9.6500, 10, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10521, 68, 12.5000, 6, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10522, 1, 18.0000, 40, CAST(0.200 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10522, 8, 40.0000, 24, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10522, 30, 25.8900, 20, CAST(0.200 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10522, 40, 18.4000, 25, CAST(0.200 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10523, 17, 39.0000, 25, CAST(0.100 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10523, 20, 81.0000, 15, CAST(0.100 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10523, 37, 26.0000, 18, CAST(0.100 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10523, 41, 9.6500, 6, CAST(0.100 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10524, 10, 31.0000, 2, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10524, 30, 25.8900, 10, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10524, 43, 46.0000, 60, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10524, 54, 7.4500, 15, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10525, 36, 19.0000, 30, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10525, 40, 18.4000, 15, CAST(0.100 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10526, 1, 18.0000, 8, CAST(0.150 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10526, 13, 6.0000, 10, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10526, 56, 38.0000, 30, CAST(0.150 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10527, 4, 22.0000, 50, CAST(0.100 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10527, 36, 19.0000, 30, CAST(0.100 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10528, 11, 21.0000, 3, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10528, 33, 2.5000, 8, CAST(0.200 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10528, 72, 34.8000, 9, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10529, 55, 24.0000, 14, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10529, 68, 12.5000, 20, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10529, 69, 36.0000, 10, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10530, 17, 39.0000, 40, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10530, 43, 46.0000, 25, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10530, 61, 28.5000, 20, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10530, 76, 18.0000, 50, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10531, 59, 55.0000, 2, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10532, 30, 25.8900, 15, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10532, 66, 17.0000, 24, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10533, 4, 22.0000, 50, CAST(0.050 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10533, 72, 34.8000, 24, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10533, 73, 15.0000, 24, CAST(0.050 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10534, 30, 25.8900, 10, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10534, 40, 18.4000, 10, CAST(0.200 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10534, 54, 7.4500, 10, CAST(0.200 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10535, 11, 21.0000, 50, CAST(0.100 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10535, 40, 18.4000, 10, CAST(0.100 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10535, 57, 19.5000, 5, CAST(0.100 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10535, 59, 55.0000, 15, CAST(0.100 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10536, 12, 38.0000, 15, CAST(0.250 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10536, 31, 12.5000, 20, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10536, 33, 2.5000, 30, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10536, 60, 34.0000, 35, CAST(0.250 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10537, 31, 12.5000, 30, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10537, 51, 53.0000, 6, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10537, 58, 13.2500, 20, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10537, 72, 34.8000, 21, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10537, 73, 15.0000, 9, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10538, 70, 15.0000, 7, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10538, 72, 34.8000, 1, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10539, 13, 6.0000, 8, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10539, 21, 10.0000, 15, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10539, 33, 2.5000, 15, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10539, 49, 20.0000, 6, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10540, 3, 10.0000, 60, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10540, 26, 31.2300, 40, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10540, 38, 263.5000, 30, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10540, 68, 12.5000, 35, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10541, 24, 4.5000, 35, CAST(0.100 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10541, 38, 263.5000, 4, CAST(0.100 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10541, 65, 21.0500, 36, CAST(0.100 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10541, 71, 21.5000, 9, CAST(0.100 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10542, 11, 21.0000, 15, CAST(0.050 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10542, 54, 7.4500, 24, CAST(0.050 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10543, 12, 38.0000, 30, CAST(0.150 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10543, 23, 9.0000, 70, CAST(0.150 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10544, 28, 45.6000, 7, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10544, 67, 14.0000, 7, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10545, 11, 21.0000, 10, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10546, 7, 30.0000, 10, CAST(0.000 AS Numeric(4, 3)))
GO
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10546, 35, 18.0000, 30, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10546, 62, 49.3000, 40, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10547, 32, 32.0000, 24, CAST(0.150 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10547, 36, 19.0000, 60, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10548, 34, 14.0000, 10, CAST(0.250 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10548, 41, 9.6500, 14, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10549, 31, 12.5000, 55, CAST(0.150 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10549, 45, 9.5000, 100, CAST(0.150 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10549, 51, 53.0000, 48, CAST(0.150 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10550, 17, 39.0000, 8, CAST(0.100 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10550, 19, 9.2000, 10, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10550, 21, 10.0000, 6, CAST(0.100 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10550, 61, 28.5000, 10, CAST(0.100 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10551, 16, 17.4500, 40, CAST(0.150 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10551, 35, 18.0000, 20, CAST(0.150 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10551, 44, 19.4500, 40, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10552, 69, 36.0000, 18, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10552, 75, 7.7500, 30, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10553, 11, 21.0000, 15, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10553, 16, 17.4500, 14, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10553, 22, 21.0000, 24, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10553, 31, 12.5000, 30, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10553, 35, 18.0000, 6, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10554, 16, 17.4500, 30, CAST(0.050 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10554, 23, 9.0000, 20, CAST(0.050 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10554, 62, 49.3000, 20, CAST(0.050 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10554, 77, 13.0000, 10, CAST(0.050 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10555, 14, 23.2500, 30, CAST(0.200 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10555, 19, 9.2000, 35, CAST(0.200 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10555, 24, 4.5000, 18, CAST(0.200 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10555, 51, 53.0000, 20, CAST(0.200 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10555, 56, 38.0000, 40, CAST(0.200 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10556, 72, 34.8000, 24, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10557, 64, 33.2500, 30, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10557, 75, 7.7500, 20, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10558, 47, 9.5000, 25, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10558, 51, 53.0000, 20, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10558, 52, 7.0000, 30, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10558, 53, 32.8000, 18, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10558, 73, 15.0000, 3, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10559, 41, 9.6500, 12, CAST(0.050 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10559, 55, 24.0000, 18, CAST(0.050 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10560, 30, 25.8900, 20, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10560, 62, 49.3000, 15, CAST(0.250 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10561, 44, 19.4500, 10, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10561, 51, 53.0000, 50, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10562, 33, 2.5000, 20, CAST(0.100 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10562, 62, 49.3000, 10, CAST(0.100 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10563, 36, 19.0000, 25, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10563, 52, 7.0000, 70, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10564, 17, 39.0000, 16, CAST(0.050 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10564, 31, 12.5000, 6, CAST(0.050 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10564, 55, 24.0000, 25, CAST(0.050 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10565, 24, 4.5000, 25, CAST(0.100 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10565, 64, 33.2500, 18, CAST(0.100 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10566, 11, 21.0000, 35, CAST(0.150 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10566, 18, 62.5000, 18, CAST(0.150 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10566, 76, 18.0000, 10, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10567, 31, 12.5000, 60, CAST(0.200 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10567, 51, 53.0000, 3, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10567, 59, 55.0000, 40, CAST(0.200 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10568, 10, 31.0000, 5, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10569, 31, 12.5000, 35, CAST(0.200 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10569, 76, 18.0000, 30, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10570, 11, 21.0000, 15, CAST(0.050 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10570, 56, 38.0000, 60, CAST(0.050 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10571, 14, 23.2500, 11, CAST(0.150 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10571, 42, 14.0000, 28, CAST(0.150 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10572, 16, 17.4500, 12, CAST(0.100 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10572, 32, 32.0000, 10, CAST(0.100 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10572, 40, 18.4000, 50, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10572, 75, 7.7500, 15, CAST(0.100 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10573, 17, 39.0000, 18, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10573, 34, 14.0000, 40, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10573, 53, 32.8000, 25, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10574, 33, 2.5000, 14, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10574, 40, 18.4000, 2, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10574, 62, 49.3000, 10, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10574, 64, 33.2500, 6, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10575, 59, 55.0000, 12, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10575, 63, 43.9000, 6, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10575, 72, 34.8000, 30, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10575, 76, 18.0000, 10, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10576, 1, 18.0000, 10, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10576, 31, 12.5000, 20, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10576, 44, 19.4500, 21, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10577, 39, 18.0000, 10, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10577, 75, 7.7500, 20, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10577, 77, 13.0000, 18, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10578, 35, 18.0000, 20, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10578, 57, 19.5000, 6, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10579, 15, 15.5000, 10, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10579, 75, 7.7500, 21, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10580, 14, 23.2500, 15, CAST(0.050 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10580, 41, 9.6500, 9, CAST(0.050 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10580, 65, 21.0500, 30, CAST(0.050 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10581, 75, 7.7500, 50, CAST(0.200 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10582, 57, 19.5000, 4, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10582, 76, 18.0000, 14, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10583, 29, 123.7900, 10, CAST(0.000 AS Numeric(4, 3)))
GO
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10583, 60, 34.0000, 24, CAST(0.150 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10583, 69, 36.0000, 10, CAST(0.150 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10584, 31, 12.5000, 50, CAST(0.050 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10585, 47, 9.5000, 15, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10586, 52, 7.0000, 4, CAST(0.150 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10587, 26, 31.2300, 6, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10587, 35, 18.0000, 20, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10587, 77, 13.0000, 20, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10588, 18, 62.5000, 40, CAST(0.200 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10588, 42, 14.0000, 100, CAST(0.200 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10589, 35, 18.0000, 4, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10590, 1, 18.0000, 20, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10590, 77, 13.0000, 60, CAST(0.050 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10591, 3, 10.0000, 14, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10591, 7, 30.0000, 10, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10591, 54, 7.4500, 50, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10592, 15, 15.5000, 25, CAST(0.050 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10592, 26, 31.2300, 5, CAST(0.050 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10593, 20, 81.0000, 21, CAST(0.200 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10593, 69, 36.0000, 20, CAST(0.200 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10593, 76, 18.0000, 4, CAST(0.200 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10594, 52, 7.0000, 24, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10594, 58, 13.2500, 30, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10595, 35, 18.0000, 30, CAST(0.250 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10595, 61, 28.5000, 120, CAST(0.250 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10595, 69, 36.0000, 65, CAST(0.250 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10596, 56, 38.0000, 5, CAST(0.200 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10596, 63, 43.9000, 24, CAST(0.200 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10596, 75, 7.7500, 30, CAST(0.200 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10597, 24, 4.5000, 35, CAST(0.200 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10597, 57, 19.5000, 20, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10597, 65, 21.0500, 12, CAST(0.200 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10598, 27, 43.9000, 50, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10598, 71, 21.5000, 9, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10599, 62, 49.3000, 10, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10600, 54, 7.4500, 4, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10600, 73, 15.0000, 30, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10601, 13, 6.0000, 60, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10601, 59, 55.0000, 35, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10602, 77, 13.0000, 5, CAST(0.250 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10603, 22, 21.0000, 48, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10603, 49, 20.0000, 25, CAST(0.050 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10604, 48, 12.7500, 6, CAST(0.100 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10604, 76, 18.0000, 10, CAST(0.100 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10605, 16, 17.4500, 30, CAST(0.050 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10605, 59, 55.0000, 20, CAST(0.050 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10605, 60, 34.0000, 70, CAST(0.050 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10605, 71, 21.5000, 15, CAST(0.050 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10606, 4, 22.0000, 20, CAST(0.200 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10606, 55, 24.0000, 20, CAST(0.200 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10606, 62, 49.3000, 10, CAST(0.200 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10607, 7, 30.0000, 45, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10607, 17, 39.0000, 100, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10607, 33, 2.5000, 14, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10607, 40, 18.4000, 42, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10607, 72, 34.8000, 12, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10608, 56, 38.0000, 28, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10609, 1, 18.0000, 3, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10609, 10, 31.0000, 10, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10609, 21, 10.0000, 6, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10610, 36, 19.0000, 21, CAST(0.250 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10611, 1, 18.0000, 6, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10611, 2, 19.0000, 10, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10611, 60, 34.0000, 15, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10612, 10, 31.0000, 70, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10612, 36, 19.0000, 55, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10612, 49, 20.0000, 18, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10612, 60, 34.0000, 40, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10612, 76, 18.0000, 80, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10613, 13, 6.0000, 8, CAST(0.100 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10613, 75, 7.7500, 40, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10614, 11, 21.0000, 14, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10614, 21, 10.0000, 8, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10614, 39, 18.0000, 5, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10615, 55, 24.0000, 5, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10616, 38, 263.5000, 15, CAST(0.050 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10616, 56, 38.0000, 14, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10616, 70, 15.0000, 15, CAST(0.050 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10616, 71, 21.5000, 15, CAST(0.050 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10617, 59, 55.0000, 30, CAST(0.150 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10618, 6, 25.0000, 70, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10618, 56, 38.0000, 20, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10618, 68, 12.5000, 15, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10619, 21, 10.0000, 42, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10619, 22, 21.0000, 40, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10620, 24, 4.5000, 5, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10620, 52, 7.0000, 5, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10621, 19, 9.2000, 5, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10621, 23, 9.0000, 10, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10621, 70, 15.0000, 20, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10621, 71, 21.5000, 15, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10622, 2, 19.0000, 20, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10622, 68, 12.5000, 18, CAST(0.200 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10623, 14, 23.2500, 21, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10623, 19, 9.2000, 15, CAST(0.100 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10623, 21, 10.0000, 25, CAST(0.100 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10623, 24, 4.5000, 3, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10623, 35, 18.0000, 30, CAST(0.100 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10624, 28, 45.6000, 10, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10624, 29, 123.7900, 6, CAST(0.000 AS Numeric(4, 3)))
GO
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10624, 44, 19.4500, 10, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10625, 14, 23.2500, 3, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10625, 42, 14.0000, 5, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10625, 60, 34.0000, 10, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10626, 53, 32.8000, 12, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10626, 60, 34.0000, 20, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10626, 71, 21.5000, 20, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10627, 62, 49.3000, 15, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10627, 73, 15.0000, 35, CAST(0.150 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10628, 1, 18.0000, 25, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10629, 29, 123.7900, 20, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10629, 64, 33.2500, 9, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10630, 55, 24.0000, 12, CAST(0.050 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10630, 76, 18.0000, 35, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10631, 75, 7.7500, 8, CAST(0.100 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10632, 2, 19.0000, 30, CAST(0.050 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10632, 33, 2.5000, 20, CAST(0.050 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10633, 12, 38.0000, 36, CAST(0.150 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10633, 13, 6.0000, 13, CAST(0.150 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10633, 26, 31.2300, 35, CAST(0.150 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10633, 62, 49.3000, 80, CAST(0.150 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10634, 7, 30.0000, 35, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10634, 18, 62.5000, 50, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10634, 51, 53.0000, 15, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10634, 75, 7.7500, 2, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10635, 4, 22.0000, 10, CAST(0.100 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10635, 5, 21.3500, 15, CAST(0.100 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10635, 22, 21.0000, 40, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10636, 4, 22.0000, 25, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10636, 58, 13.2500, 6, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10637, 11, 21.0000, 10, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10637, 50, 16.2500, 25, CAST(0.050 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10637, 56, 38.0000, 60, CAST(0.050 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10638, 45, 9.5000, 20, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10638, 65, 21.0500, 21, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10638, 72, 34.8000, 60, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10639, 18, 62.5000, 8, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10640, 69, 36.0000, 20, CAST(0.250 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10640, 70, 15.0000, 15, CAST(0.250 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10641, 2, 19.0000, 50, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10641, 40, 18.4000, 60, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10642, 21, 10.0000, 30, CAST(0.200 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10642, 61, 28.5000, 20, CAST(0.200 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10643, 28, 45.6000, 15, CAST(0.250 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10643, 39, 18.0000, 21, CAST(0.250 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10643, 46, 12.0000, 2, CAST(0.250 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10644, 18, 62.5000, 4, CAST(0.100 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10644, 43, 46.0000, 20, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10644, 46, 12.0000, 21, CAST(0.100 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10645, 18, 62.5000, 20, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10645, 36, 19.0000, 15, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10646, 1, 18.0000, 15, CAST(0.250 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10646, 10, 31.0000, 18, CAST(0.250 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10646, 71, 21.5000, 30, CAST(0.250 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10646, 77, 13.0000, 35, CAST(0.250 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10647, 19, 9.2000, 30, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10647, 39, 18.0000, 20, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10648, 22, 21.0000, 15, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10648, 24, 4.5000, 15, CAST(0.150 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10649, 28, 45.6000, 20, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10649, 72, 34.8000, 15, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10650, 30, 25.8900, 30, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10650, 53, 32.8000, 25, CAST(0.050 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10650, 54, 7.4500, 30, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10651, 19, 9.2000, 12, CAST(0.250 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10651, 22, 21.0000, 20, CAST(0.250 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10652, 30, 25.8900, 2, CAST(0.250 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10652, 42, 14.0000, 20, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10653, 16, 17.4500, 30, CAST(0.100 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10653, 60, 34.0000, 20, CAST(0.100 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10654, 4, 22.0000, 12, CAST(0.100 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10654, 39, 18.0000, 20, CAST(0.100 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10654, 54, 7.4500, 6, CAST(0.100 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10655, 41, 9.6500, 20, CAST(0.200 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10656, 14, 23.2500, 3, CAST(0.100 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10656, 44, 19.4500, 28, CAST(0.100 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10656, 47, 9.5000, 6, CAST(0.100 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10657, 15, 15.5000, 50, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10657, 41, 9.6500, 24, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10657, 46, 12.0000, 45, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10657, 47, 9.5000, 10, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10657, 56, 38.0000, 45, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10657, 60, 34.0000, 30, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10658, 21, 10.0000, 60, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10658, 40, 18.4000, 70, CAST(0.050 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10658, 60, 34.0000, 55, CAST(0.050 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10658, 77, 13.0000, 70, CAST(0.050 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10659, 31, 12.5000, 20, CAST(0.050 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10659, 40, 18.4000, 24, CAST(0.050 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10659, 70, 15.0000, 40, CAST(0.050 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10660, 20, 81.0000, 21, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10661, 39, 18.0000, 3, CAST(0.200 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10661, 58, 13.2500, 49, CAST(0.200 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10662, 68, 12.5000, 10, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10663, 40, 18.4000, 30, CAST(0.050 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10663, 42, 14.0000, 30, CAST(0.050 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10663, 51, 53.0000, 20, CAST(0.050 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10664, 10, 31.0000, 24, CAST(0.150 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10664, 56, 38.0000, 12, CAST(0.150 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10664, 65, 21.0500, 15, CAST(0.150 AS Numeric(4, 3)))
GO
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10665, 51, 53.0000, 20, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10665, 59, 55.0000, 1, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10665, 76, 18.0000, 10, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10666, 29, 123.7900, 36, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10666, 65, 21.0500, 10, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10667, 69, 36.0000, 45, CAST(0.200 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10667, 71, 21.5000, 14, CAST(0.200 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10668, 31, 12.5000, 8, CAST(0.100 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10668, 55, 24.0000, 4, CAST(0.100 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10668, 64, 33.2500, 15, CAST(0.100 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10669, 36, 19.0000, 30, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10670, 23, 9.0000, 32, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10670, 46, 12.0000, 60, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10670, 67, 14.0000, 25, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10670, 73, 15.0000, 50, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10670, 75, 7.7500, 25, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10671, 16, 17.4500, 10, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10671, 62, 49.3000, 10, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10671, 65, 21.0500, 12, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10672, 38, 263.5000, 15, CAST(0.100 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10672, 71, 21.5000, 12, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10673, 16, 17.4500, 3, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10673, 42, 14.0000, 6, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10673, 43, 46.0000, 6, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10674, 23, 9.0000, 5, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10675, 14, 23.2500, 30, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10675, 53, 32.8000, 10, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10675, 58, 13.2500, 30, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10676, 10, 31.0000, 2, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10676, 19, 9.2000, 7, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10676, 44, 19.4500, 21, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10677, 26, 31.2300, 30, CAST(0.150 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10677, 33, 2.5000, 8, CAST(0.150 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10678, 12, 38.0000, 100, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10678, 33, 2.5000, 30, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10678, 41, 9.6500, 120, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10678, 54, 7.4500, 30, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10679, 59, 55.0000, 12, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10680, 16, 17.4500, 50, CAST(0.250 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10680, 31, 12.5000, 20, CAST(0.250 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10680, 42, 14.0000, 40, CAST(0.250 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10681, 19, 9.2000, 30, CAST(0.100 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10681, 21, 10.0000, 12, CAST(0.100 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10681, 64, 33.2500, 28, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10682, 33, 2.5000, 30, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10682, 66, 17.0000, 4, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10682, 75, 7.7500, 30, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10683, 52, 7.0000, 9, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10684, 40, 18.4000, 20, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10684, 47, 9.5000, 40, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10684, 60, 34.0000, 30, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10685, 10, 31.0000, 20, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10685, 41, 9.6500, 4, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10685, 47, 9.5000, 15, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10686, 17, 39.0000, 30, CAST(0.200 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10686, 26, 31.2300, 15, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10687, 9, 97.0000, 50, CAST(0.250 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10687, 29, 123.7900, 10, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10687, 36, 19.0000, 6, CAST(0.250 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10688, 10, 31.0000, 18, CAST(0.100 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10688, 28, 45.6000, 60, CAST(0.100 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10688, 34, 14.0000, 14, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10689, 1, 18.0000, 35, CAST(0.250 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10690, 56, 38.0000, 20, CAST(0.250 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10690, 77, 13.0000, 30, CAST(0.250 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10691, 1, 18.0000, 30, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10691, 29, 123.7900, 40, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10691, 43, 46.0000, 40, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10691, 44, 19.4500, 24, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10691, 62, 49.3000, 48, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10692, 63, 43.9000, 20, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10693, 9, 97.0000, 6, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10693, 54, 7.4500, 60, CAST(0.150 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10693, 69, 36.0000, 30, CAST(0.150 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10693, 73, 15.0000, 15, CAST(0.150 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10694, 7, 30.0000, 90, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10694, 59, 55.0000, 25, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10694, 70, 15.0000, 50, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10695, 8, 40.0000, 10, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10695, 12, 38.0000, 4, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10695, 24, 4.5000, 20, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10696, 17, 39.0000, 20, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10696, 46, 12.0000, 18, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10697, 19, 9.2000, 7, CAST(0.250 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10697, 35, 18.0000, 9, CAST(0.250 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10697, 58, 13.2500, 30, CAST(0.250 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10697, 70, 15.0000, 30, CAST(0.250 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10698, 11, 21.0000, 15, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10698, 17, 39.0000, 8, CAST(0.050 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10698, 29, 123.7900, 12, CAST(0.050 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10698, 65, 21.0500, 65, CAST(0.050 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10698, 70, 15.0000, 8, CAST(0.050 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10699, 47, 9.5000, 12, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10700, 1, 18.0000, 5, CAST(0.200 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10700, 34, 14.0000, 12, CAST(0.200 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10700, 68, 12.5000, 40, CAST(0.200 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10700, 71, 21.5000, 60, CAST(0.200 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10701, 59, 55.0000, 42, CAST(0.150 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10701, 71, 21.5000, 20, CAST(0.150 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10701, 76, 18.0000, 35, CAST(0.150 AS Numeric(4, 3)))
GO
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10702, 3, 10.0000, 6, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10702, 76, 18.0000, 15, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10703, 2, 19.0000, 5, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10703, 59, 55.0000, 35, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10703, 73, 15.0000, 35, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10704, 4, 22.0000, 6, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10704, 24, 4.5000, 35, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10704, 48, 12.7500, 24, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10705, 31, 12.5000, 20, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10705, 32, 32.0000, 4, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10706, 16, 17.4500, 20, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10706, 43, 46.0000, 24, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10706, 59, 55.0000, 8, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10707, 55, 24.0000, 21, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10707, 57, 19.5000, 40, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10707, 70, 15.0000, 28, CAST(0.150 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10708, 5, 21.3500, 4, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10708, 36, 19.0000, 5, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10709, 8, 40.0000, 40, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10709, 51, 53.0000, 28, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10709, 60, 34.0000, 10, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10710, 19, 9.2000, 5, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10710, 47, 9.5000, 5, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10711, 19, 9.2000, 12, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10711, 41, 9.6500, 42, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10711, 53, 32.8000, 120, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10712, 53, 32.8000, 3, CAST(0.050 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10712, 56, 38.0000, 30, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10713, 10, 31.0000, 18, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10713, 26, 31.2300, 30, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10713, 45, 9.5000, 110, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10713, 46, 12.0000, 24, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10714, 2, 19.0000, 30, CAST(0.250 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10714, 17, 39.0000, 27, CAST(0.250 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10714, 47, 9.5000, 50, CAST(0.250 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10714, 56, 38.0000, 18, CAST(0.250 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10714, 58, 13.2500, 12, CAST(0.250 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10715, 10, 31.0000, 21, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10715, 71, 21.5000, 30, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10716, 21, 10.0000, 5, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10716, 51, 53.0000, 7, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10716, 61, 28.5000, 10, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10717, 21, 10.0000, 32, CAST(0.050 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10717, 54, 7.4500, 15, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10717, 69, 36.0000, 25, CAST(0.050 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10718, 12, 38.0000, 36, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10718, 16, 17.4500, 20, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10718, 36, 19.0000, 40, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10718, 62, 49.3000, 20, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10719, 18, 62.5000, 12, CAST(0.250 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10719, 30, 25.8900, 3, CAST(0.250 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10719, 54, 7.4500, 40, CAST(0.250 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10720, 35, 18.0000, 21, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10720, 71, 21.5000, 8, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10721, 44, 19.4500, 50, CAST(0.050 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10722, 2, 19.0000, 3, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10722, 31, 12.5000, 50, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10722, 68, 12.5000, 45, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10722, 75, 7.7500, 42, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10723, 26, 31.2300, 15, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10724, 10, 31.0000, 16, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10724, 61, 28.5000, 5, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10725, 41, 9.6500, 12, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10725, 52, 7.0000, 4, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10725, 55, 24.0000, 6, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10726, 4, 22.0000, 25, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10726, 11, 21.0000, 5, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10727, 17, 39.0000, 20, CAST(0.050 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10727, 56, 38.0000, 10, CAST(0.050 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10727, 59, 55.0000, 10, CAST(0.050 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10728, 30, 25.8900, 15, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10728, 40, 18.4000, 6, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10728, 55, 24.0000, 12, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10728, 60, 34.0000, 15, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10729, 1, 18.0000, 50, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10729, 21, 10.0000, 30, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10729, 50, 16.2500, 40, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10730, 16, 17.4500, 15, CAST(0.050 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10730, 31, 12.5000, 3, CAST(0.050 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10730, 65, 21.0500, 10, CAST(0.050 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10731, 21, 10.0000, 40, CAST(0.050 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10731, 51, 53.0000, 30, CAST(0.050 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10732, 76, 18.0000, 20, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10733, 14, 23.2500, 16, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10733, 28, 45.6000, 20, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10733, 52, 7.0000, 25, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10734, 6, 25.0000, 30, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10734, 30, 25.8900, 15, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10734, 76, 18.0000, 20, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10735, 61, 28.5000, 20, CAST(0.100 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10735, 77, 13.0000, 2, CAST(0.100 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10736, 65, 21.0500, 40, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10736, 75, 7.7500, 20, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10737, 13, 6.0000, 4, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10737, 41, 9.6500, 12, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10738, 16, 17.4500, 3, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10739, 36, 19.0000, 6, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10739, 52, 7.0000, 18, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10740, 28, 45.6000, 5, CAST(0.200 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10740, 35, 18.0000, 35, CAST(0.200 AS Numeric(4, 3)))
GO
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10740, 45, 9.5000, 40, CAST(0.200 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10740, 56, 38.0000, 14, CAST(0.200 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10741, 2, 19.0000, 15, CAST(0.200 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10742, 3, 10.0000, 20, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10742, 60, 34.0000, 50, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10742, 72, 34.8000, 35, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10743, 46, 12.0000, 28, CAST(0.050 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10744, 40, 18.4000, 50, CAST(0.200 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10745, 18, 62.5000, 24, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10745, 44, 19.4500, 16, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10745, 59, 55.0000, 45, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10745, 72, 34.8000, 7, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10746, 13, 6.0000, 6, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10746, 42, 14.0000, 28, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10746, 62, 49.3000, 9, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10746, 69, 36.0000, 40, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10747, 31, 12.5000, 8, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10747, 41, 9.6500, 35, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10747, 63, 43.9000, 9, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10747, 69, 36.0000, 30, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10748, 23, 9.0000, 44, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10748, 40, 18.4000, 40, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10748, 56, 38.0000, 28, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10749, 56, 38.0000, 15, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10749, 59, 55.0000, 6, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10749, 76, 18.0000, 10, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10750, 14, 23.2500, 5, CAST(0.150 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10750, 45, 9.5000, 40, CAST(0.150 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10750, 59, 55.0000, 25, CAST(0.150 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10751, 26, 31.2300, 12, CAST(0.100 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10751, 30, 25.8900, 30, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10751, 50, 16.2500, 20, CAST(0.100 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10751, 73, 15.0000, 15, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10752, 1, 18.0000, 8, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10752, 69, 36.0000, 3, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10753, 45, 9.5000, 4, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10753, 74, 10.0000, 5, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10754, 40, 18.4000, 3, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10755, 47, 9.5000, 30, CAST(0.250 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10755, 56, 38.0000, 30, CAST(0.250 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10755, 57, 19.5000, 14, CAST(0.250 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10755, 69, 36.0000, 25, CAST(0.250 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10756, 18, 62.5000, 21, CAST(0.200 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10756, 36, 19.0000, 20, CAST(0.200 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10756, 68, 12.5000, 6, CAST(0.200 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10756, 69, 36.0000, 20, CAST(0.200 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10757, 34, 14.0000, 30, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10757, 59, 55.0000, 7, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10757, 62, 49.3000, 30, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10757, 64, 33.2500, 24, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10758, 26, 31.2300, 20, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10758, 52, 7.0000, 60, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10758, 70, 15.0000, 40, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10759, 32, 32.0000, 10, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10760, 25, 14.0000, 12, CAST(0.250 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10760, 27, 43.9000, 40, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10760, 43, 46.0000, 30, CAST(0.250 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10761, 25, 14.0000, 35, CAST(0.250 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10761, 75, 7.7500, 18, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10762, 39, 18.0000, 16, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10762, 47, 9.5000, 30, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10762, 51, 53.0000, 28, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10762, 56, 38.0000, 60, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10763, 21, 10.0000, 40, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10763, 22, 21.0000, 6, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10763, 24, 4.5000, 20, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10764, 3, 10.0000, 20, CAST(0.100 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10764, 39, 18.0000, 130, CAST(0.100 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10765, 65, 21.0500, 80, CAST(0.100 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10766, 2, 19.0000, 40, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10766, 7, 30.0000, 35, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10766, 68, 12.5000, 40, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10767, 42, 14.0000, 2, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10768, 22, 21.0000, 4, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10768, 31, 12.5000, 50, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10768, 60, 34.0000, 15, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10768, 71, 21.5000, 12, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10769, 41, 9.6500, 30, CAST(0.050 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10769, 52, 7.0000, 15, CAST(0.050 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10769, 61, 28.5000, 20, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10769, 62, 49.3000, 15, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10770, 11, 21.0000, 15, CAST(0.250 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10771, 71, 21.5000, 16, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10772, 29, 123.7900, 18, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10772, 59, 55.0000, 25, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10773, 17, 39.0000, 33, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10773, 31, 12.5000, 70, CAST(0.200 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10773, 75, 7.7500, 7, CAST(0.200 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10774, 31, 12.5000, 2, CAST(0.250 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10774, 66, 17.0000, 50, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10775, 10, 31.0000, 6, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10775, 67, 14.0000, 3, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10776, 31, 12.5000, 16, CAST(0.050 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10776, 42, 14.0000, 12, CAST(0.050 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10776, 45, 9.5000, 27, CAST(0.050 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10776, 51, 53.0000, 120, CAST(0.050 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10777, 42, 14.0000, 20, CAST(0.200 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10778, 41, 9.6500, 10, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10779, 16, 17.4500, 20, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10779, 62, 49.3000, 20, CAST(0.000 AS Numeric(4, 3)))
GO
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10780, 70, 15.0000, 35, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10780, 77, 13.0000, 15, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10781, 54, 7.4500, 3, CAST(0.200 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10781, 56, 38.0000, 20, CAST(0.200 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10781, 74, 10.0000, 35, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10782, 31, 12.5000, 1, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10783, 31, 12.5000, 10, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10783, 38, 263.5000, 5, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10784, 36, 19.0000, 30, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10784, 39, 18.0000, 2, CAST(0.150 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10784, 72, 34.8000, 30, CAST(0.150 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10785, 10, 31.0000, 10, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10785, 75, 7.7500, 10, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10786, 8, 40.0000, 30, CAST(0.200 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10786, 30, 25.8900, 15, CAST(0.200 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10786, 75, 7.7500, 42, CAST(0.200 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10787, 2, 19.0000, 15, CAST(0.050 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10787, 29, 123.7900, 20, CAST(0.050 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10788, 19, 9.2000, 50, CAST(0.050 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10788, 75, 7.7500, 40, CAST(0.050 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10789, 18, 62.5000, 30, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10789, 35, 18.0000, 15, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10789, 63, 43.9000, 30, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10789, 68, 12.5000, 18, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10790, 7, 30.0000, 3, CAST(0.150 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10790, 56, 38.0000, 20, CAST(0.150 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10791, 29, 123.7900, 14, CAST(0.050 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10791, 41, 9.6500, 20, CAST(0.050 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10792, 2, 19.0000, 10, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10792, 54, 7.4500, 3, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10792, 68, 12.5000, 15, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10793, 41, 9.6500, 14, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10793, 52, 7.0000, 8, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10794, 14, 23.2500, 15, CAST(0.200 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10794, 54, 7.4500, 6, CAST(0.200 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10795, 16, 17.4500, 65, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10795, 17, 39.0000, 35, CAST(0.250 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10796, 26, 31.2300, 21, CAST(0.200 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10796, 44, 19.4500, 10, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10796, 64, 33.2500, 35, CAST(0.200 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10796, 69, 36.0000, 24, CAST(0.200 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10797, 11, 21.0000, 20, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10798, 62, 49.3000, 2, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10798, 72, 34.8000, 10, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10799, 13, 6.0000, 20, CAST(0.150 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10799, 24, 4.5000, 20, CAST(0.150 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10799, 59, 55.0000, 25, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10800, 11, 21.0000, 50, CAST(0.100 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10800, 51, 53.0000, 10, CAST(0.100 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10800, 54, 7.4500, 7, CAST(0.100 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10801, 17, 39.0000, 40, CAST(0.250 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10801, 29, 123.7900, 20, CAST(0.250 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10802, 30, 25.8900, 25, CAST(0.250 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10802, 51, 53.0000, 30, CAST(0.250 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10802, 55, 24.0000, 60, CAST(0.250 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10802, 62, 49.3000, 5, CAST(0.250 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10803, 19, 9.2000, 24, CAST(0.050 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10803, 25, 14.0000, 15, CAST(0.050 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10803, 59, 55.0000, 15, CAST(0.050 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10804, 10, 31.0000, 36, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10804, 28, 45.6000, 24, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10804, 49, 20.0000, 4, CAST(0.150 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10805, 34, 14.0000, 10, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10805, 38, 263.5000, 10, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10806, 2, 19.0000, 20, CAST(0.250 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10806, 65, 21.0500, 2, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10806, 74, 10.0000, 15, CAST(0.250 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10807, 40, 18.4000, 1, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10808, 56, 38.0000, 20, CAST(0.150 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10808, 76, 18.0000, 50, CAST(0.150 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10809, 52, 7.0000, 20, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10810, 13, 6.0000, 7, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10810, 25, 14.0000, 5, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10810, 70, 15.0000, 5, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10811, 19, 9.2000, 15, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10811, 23, 9.0000, 18, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10811, 40, 18.4000, 30, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10812, 31, 12.5000, 16, CAST(0.100 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10812, 72, 34.8000, 40, CAST(0.100 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10812, 77, 13.0000, 20, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10813, 2, 19.0000, 12, CAST(0.200 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10813, 46, 12.0000, 35, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10814, 41, 9.6500, 20, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10814, 43, 46.0000, 20, CAST(0.150 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10814, 48, 12.7500, 8, CAST(0.150 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10814, 61, 28.5000, 30, CAST(0.150 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10815, 33, 2.5000, 16, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10816, 38, 263.5000, 30, CAST(0.050 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10816, 62, 49.3000, 20, CAST(0.050 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10817, 26, 31.2300, 40, CAST(0.150 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10817, 38, 263.5000, 30, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10817, 40, 18.4000, 60, CAST(0.150 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10817, 62, 49.3000, 25, CAST(0.150 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10818, 32, 32.0000, 20, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10818, 41, 9.6500, 20, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10819, 43, 46.0000, 7, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10819, 75, 7.7500, 20, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10820, 56, 38.0000, 30, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10821, 35, 18.0000, 20, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10821, 51, 53.0000, 6, CAST(0.000 AS Numeric(4, 3)))
GO
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10822, 62, 49.3000, 3, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10822, 70, 15.0000, 6, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10823, 11, 21.0000, 20, CAST(0.100 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10823, 57, 19.5000, 15, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10823, 59, 55.0000, 40, CAST(0.100 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10823, 77, 13.0000, 15, CAST(0.100 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10824, 41, 9.6500, 12, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10824, 70, 15.0000, 9, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10825, 26, 31.2300, 12, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10825, 53, 32.8000, 20, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10826, 31, 12.5000, 35, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10826, 57, 19.5000, 15, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10827, 10, 31.0000, 15, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10827, 39, 18.0000, 21, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10828, 20, 81.0000, 5, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10828, 38, 263.5000, 2, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10829, 2, 19.0000, 10, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10829, 8, 40.0000, 20, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10829, 13, 6.0000, 10, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10829, 60, 34.0000, 21, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10830, 6, 25.0000, 6, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10830, 39, 18.0000, 28, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10830, 60, 34.0000, 30, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10830, 68, 12.5000, 24, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10831, 19, 9.2000, 2, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10831, 35, 18.0000, 8, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10831, 38, 263.5000, 8, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10831, 43, 46.0000, 9, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10832, 13, 6.0000, 3, CAST(0.200 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10832, 25, 14.0000, 10, CAST(0.200 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10832, 44, 19.4500, 16, CAST(0.200 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10832, 64, 33.2500, 3, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10833, 7, 30.0000, 20, CAST(0.100 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10833, 31, 12.5000, 9, CAST(0.100 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10833, 53, 32.8000, 9, CAST(0.100 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10834, 29, 123.7900, 8, CAST(0.050 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10834, 30, 25.8900, 20, CAST(0.050 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10835, 59, 55.0000, 15, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10835, 77, 13.0000, 2, CAST(0.200 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10836, 22, 21.0000, 52, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10836, 35, 18.0000, 6, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10836, 57, 19.5000, 24, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10836, 60, 34.0000, 60, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10836, 64, 33.2500, 30, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10837, 13, 6.0000, 6, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10837, 40, 18.4000, 25, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10837, 47, 9.5000, 40, CAST(0.250 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10837, 76, 18.0000, 21, CAST(0.250 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10838, 1, 18.0000, 4, CAST(0.250 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10838, 18, 62.5000, 25, CAST(0.250 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10838, 36, 19.0000, 50, CAST(0.250 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10839, 58, 13.2500, 30, CAST(0.100 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10839, 72, 34.8000, 15, CAST(0.100 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10840, 25, 14.0000, 6, CAST(0.200 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10840, 39, 18.0000, 10, CAST(0.200 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10841, 10, 31.0000, 16, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10841, 56, 38.0000, 30, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10841, 59, 55.0000, 50, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10841, 77, 13.0000, 15, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10842, 11, 21.0000, 15, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10842, 43, 46.0000, 5, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10842, 68, 12.5000, 20, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10842, 70, 15.0000, 12, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10843, 51, 53.0000, 4, CAST(0.250 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10844, 22, 21.0000, 35, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10845, 23, 9.0000, 70, CAST(0.100 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10845, 35, 18.0000, 25, CAST(0.100 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10845, 42, 14.0000, 42, CAST(0.100 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10845, 58, 13.2500, 60, CAST(0.100 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10845, 64, 33.2500, 48, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10846, 4, 22.0000, 21, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10846, 70, 15.0000, 30, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10846, 74, 10.0000, 20, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10847, 1, 18.0000, 80, CAST(0.200 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10847, 19, 9.2000, 12, CAST(0.200 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10847, 37, 26.0000, 60, CAST(0.200 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10847, 45, 9.5000, 36, CAST(0.200 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10847, 60, 34.0000, 45, CAST(0.200 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10847, 71, 21.5000, 55, CAST(0.200 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10848, 5, 21.3500, 30, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10848, 9, 97.0000, 3, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10849, 3, 10.0000, 49, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10849, 26, 31.2300, 18, CAST(0.150 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10850, 25, 14.0000, 20, CAST(0.150 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10850, 33, 2.5000, 4, CAST(0.150 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10850, 70, 15.0000, 30, CAST(0.150 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10851, 2, 19.0000, 5, CAST(0.050 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10851, 25, 14.0000, 10, CAST(0.050 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10851, 57, 19.5000, 10, CAST(0.050 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10851, 59, 55.0000, 42, CAST(0.050 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10852, 2, 19.0000, 15, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10852, 17, 39.0000, 6, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10852, 62, 49.3000, 50, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10853, 18, 62.5000, 10, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10854, 10, 31.0000, 100, CAST(0.150 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10854, 13, 6.0000, 65, CAST(0.150 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10855, 16, 17.4500, 50, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10855, 31, 12.5000, 14, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10855, 56, 38.0000, 24, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10855, 65, 21.0500, 15, CAST(0.150 AS Numeric(4, 3)))
GO
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10856, 2, 19.0000, 20, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10856, 42, 14.0000, 20, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10857, 3, 10.0000, 30, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10857, 26, 31.2300, 35, CAST(0.250 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10857, 29, 123.7900, 10, CAST(0.250 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10858, 7, 30.0000, 5, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10858, 27, 43.9000, 10, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10858, 70, 15.0000, 4, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10859, 24, 4.5000, 40, CAST(0.250 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10859, 54, 7.4500, 35, CAST(0.250 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10859, 64, 33.2500, 30, CAST(0.250 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10860, 51, 53.0000, 3, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10860, 76, 18.0000, 20, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10861, 17, 39.0000, 42, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10861, 18, 62.5000, 20, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10861, 21, 10.0000, 40, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10861, 33, 2.5000, 35, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10861, 62, 49.3000, 3, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10862, 11, 21.0000, 25, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10862, 52, 7.0000, 8, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10863, 1, 18.0000, 20, CAST(0.150 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10863, 58, 13.2500, 12, CAST(0.150 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10864, 35, 18.0000, 4, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10864, 67, 14.0000, 15, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10865, 38, 263.5000, 60, CAST(0.050 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10865, 39, 18.0000, 80, CAST(0.050 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10866, 2, 19.0000, 21, CAST(0.250 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10866, 24, 4.5000, 6, CAST(0.250 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10866, 30, 25.8900, 40, CAST(0.250 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10867, 53, 32.8000, 3, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10868, 26, 31.2300, 20, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10868, 35, 18.0000, 30, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10868, 49, 20.0000, 42, CAST(0.100 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10869, 1, 18.0000, 40, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10869, 11, 21.0000, 10, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10869, 23, 9.0000, 50, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10869, 68, 12.5000, 20, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10870, 35, 18.0000, 3, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10870, 51, 53.0000, 2, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10871, 6, 25.0000, 50, CAST(0.050 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10871, 16, 17.4500, 12, CAST(0.050 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10871, 17, 39.0000, 16, CAST(0.050 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10872, 55, 24.0000, 10, CAST(0.050 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10872, 62, 49.3000, 20, CAST(0.050 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10872, 64, 33.2500, 15, CAST(0.050 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10872, 65, 21.0500, 21, CAST(0.050 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10873, 21, 10.0000, 20, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10873, 28, 45.6000, 3, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10874, 10, 31.0000, 10, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10875, 19, 9.2000, 25, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10875, 47, 9.5000, 21, CAST(0.100 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10875, 49, 20.0000, 15, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10876, 46, 12.0000, 21, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10876, 64, 33.2500, 20, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10877, 16, 17.4500, 30, CAST(0.250 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10877, 18, 62.5000, 25, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10878, 20, 81.0000, 20, CAST(0.050 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10879, 40, 18.4000, 12, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10879, 65, 21.0500, 10, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10879, 76, 18.0000, 10, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10880, 23, 9.0000, 30, CAST(0.200 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10880, 61, 28.5000, 30, CAST(0.200 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10880, 70, 15.0000, 50, CAST(0.200 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10881, 73, 15.0000, 10, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10882, 42, 14.0000, 25, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10882, 49, 20.0000, 20, CAST(0.150 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10882, 54, 7.4500, 32, CAST(0.150 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10883, 24, 4.5000, 8, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10884, 21, 10.0000, 40, CAST(0.050 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10884, 56, 38.0000, 21, CAST(0.050 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10884, 65, 21.0500, 12, CAST(0.050 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10885, 2, 19.0000, 20, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10885, 24, 4.5000, 12, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10885, 70, 15.0000, 30, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10885, 77, 13.0000, 25, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10886, 10, 31.0000, 70, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10886, 31, 12.5000, 35, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10886, 77, 13.0000, 40, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10887, 25, 14.0000, 5, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10888, 2, 19.0000, 20, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10888, 68, 12.5000, 18, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10889, 11, 21.0000, 40, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10889, 38, 263.5000, 40, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10890, 17, 39.0000, 15, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10890, 34, 14.0000, 10, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10890, 41, 9.6500, 14, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10891, 30, 25.8900, 15, CAST(0.050 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10892, 59, 55.0000, 40, CAST(0.050 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10893, 8, 40.0000, 30, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10893, 24, 4.5000, 10, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10893, 29, 123.7900, 24, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10893, 30, 25.8900, 35, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10893, 36, 19.0000, 20, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10894, 13, 6.0000, 28, CAST(0.050 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10894, 69, 36.0000, 50, CAST(0.050 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10894, 75, 7.7500, 120, CAST(0.050 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10895, 24, 4.5000, 110, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10895, 39, 18.0000, 45, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10895, 40, 18.4000, 91, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10895, 60, 34.0000, 100, CAST(0.000 AS Numeric(4, 3)))
GO
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10896, 45, 9.5000, 15, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10896, 56, 38.0000, 16, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10897, 29, 123.7900, 80, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10897, 30, 25.8900, 36, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10898, 13, 6.0000, 5, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10899, 39, 18.0000, 8, CAST(0.150 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10900, 70, 15.0000, 3, CAST(0.250 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10901, 41, 9.6500, 30, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10901, 71, 21.5000, 30, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10902, 55, 24.0000, 30, CAST(0.150 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10902, 62, 49.3000, 6, CAST(0.150 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10903, 13, 6.0000, 40, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10903, 65, 21.0500, 21, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10903, 68, 12.5000, 20, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10904, 58, 13.2500, 15, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10904, 62, 49.3000, 35, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10905, 1, 18.0000, 20, CAST(0.050 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10906, 61, 28.5000, 15, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10907, 75, 7.7500, 14, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10908, 7, 30.0000, 20, CAST(0.050 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10908, 52, 7.0000, 14, CAST(0.050 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10909, 7, 30.0000, 12, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10909, 16, 17.4500, 15, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10909, 41, 9.6500, 5, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10910, 19, 9.2000, 12, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10910, 49, 20.0000, 10, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10910, 61, 28.5000, 5, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10911, 1, 18.0000, 10, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10911, 17, 39.0000, 12, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10911, 67, 14.0000, 15, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10912, 11, 21.0000, 40, CAST(0.250 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10912, 29, 123.7900, 60, CAST(0.250 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10913, 4, 22.0000, 30, CAST(0.250 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10913, 33, 2.5000, 40, CAST(0.250 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10913, 58, 13.2500, 15, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10914, 71, 21.5000, 25, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10915, 17, 39.0000, 10, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10915, 33, 2.5000, 30, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10915, 54, 7.4500, 10, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10916, 16, 17.4500, 6, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10916, 32, 32.0000, 6, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10916, 57, 19.5000, 20, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10917, 30, 25.8900, 1, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10917, 60, 34.0000, 10, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10918, 1, 18.0000, 60, CAST(0.250 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10918, 60, 34.0000, 25, CAST(0.250 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10919, 16, 17.4500, 24, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10919, 25, 14.0000, 24, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10919, 40, 18.4000, 20, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10920, 50, 16.2500, 24, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10921, 35, 18.0000, 10, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10921, 63, 43.9000, 40, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10922, 17, 39.0000, 15, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10922, 24, 4.5000, 35, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10923, 42, 14.0000, 10, CAST(0.200 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10923, 43, 46.0000, 10, CAST(0.200 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10923, 67, 14.0000, 24, CAST(0.200 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10924, 10, 31.0000, 20, CAST(0.100 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10924, 28, 45.6000, 30, CAST(0.100 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10924, 75, 7.7500, 6, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10925, 36, 19.0000, 25, CAST(0.150 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10925, 52, 7.0000, 12, CAST(0.150 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10926, 11, 21.0000, 2, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10926, 13, 6.0000, 10, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10926, 19, 9.2000, 7, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10926, 72, 34.8000, 10, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10927, 20, 81.0000, 5, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10927, 52, 7.0000, 5, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10927, 76, 18.0000, 20, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10928, 47, 9.5000, 5, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10928, 76, 18.0000, 5, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10929, 21, 10.0000, 60, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10929, 75, 7.7500, 49, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10929, 77, 13.0000, 15, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10930, 21, 10.0000, 36, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10930, 27, 43.9000, 25, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10930, 55, 24.0000, 25, CAST(0.200 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10930, 58, 13.2500, 30, CAST(0.200 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10931, 13, 6.0000, 42, CAST(0.150 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10931, 57, 19.5000, 30, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10932, 16, 17.4500, 30, CAST(0.100 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10932, 62, 49.3000, 14, CAST(0.100 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10932, 72, 34.8000, 16, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10932, 75, 7.7500, 20, CAST(0.100 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10933, 53, 32.8000, 2, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10933, 61, 28.5000, 30, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10934, 6, 25.0000, 20, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10935, 1, 18.0000, 21, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10935, 18, 62.5000, 4, CAST(0.250 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10935, 23, 9.0000, 8, CAST(0.250 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10936, 36, 19.0000, 30, CAST(0.200 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10938, 13, 6.0000, 20, CAST(0.250 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10938, 43, 46.0000, 24, CAST(0.250 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10938, 60, 34.0000, 49, CAST(0.250 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10938, 71, 21.5000, 35, CAST(0.250 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10939, 2, 19.0000, 10, CAST(0.150 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10939, 67, 14.0000, 40, CAST(0.150 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10940, 7, 30.0000, 8, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10940, 13, 6.0000, 20, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10941, 31, 12.5000, 44, CAST(0.250 AS Numeric(4, 3)))
GO
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10941, 62, 49.3000, 30, CAST(0.250 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10941, 68, 12.5000, 80, CAST(0.250 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10941, 72, 34.8000, 50, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10942, 49, 20.0000, 28, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10943, 13, 6.0000, 15, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10943, 22, 21.0000, 21, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10943, 46, 12.0000, 15, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10944, 11, 21.0000, 5, CAST(0.250 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10944, 44, 19.4500, 18, CAST(0.250 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10944, 56, 38.0000, 18, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10945, 13, 6.0000, 20, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10945, 31, 12.5000, 10, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10946, 10, 31.0000, 25, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10946, 24, 4.5000, 25, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10946, 77, 13.0000, 40, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10947, 59, 55.0000, 4, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10948, 50, 16.2500, 9, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10948, 51, 53.0000, 40, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10948, 55, 24.0000, 4, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10949, 6, 25.0000, 12, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10949, 10, 31.0000, 30, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10949, 17, 39.0000, 6, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10949, 62, 49.3000, 60, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10950, 4, 22.0000, 5, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10951, 33, 2.5000, 15, CAST(0.050 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10951, 41, 9.6500, 6, CAST(0.050 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10951, 75, 7.7500, 50, CAST(0.050 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10952, 6, 25.0000, 16, CAST(0.050 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10952, 28, 45.6000, 2, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10953, 20, 81.0000, 50, CAST(0.050 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10953, 31, 12.5000, 50, CAST(0.050 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10954, 16, 17.4500, 28, CAST(0.150 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10954, 31, 12.5000, 25, CAST(0.150 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10954, 45, 9.5000, 30, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10954, 60, 34.0000, 24, CAST(0.150 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10955, 75, 7.7500, 12, CAST(0.200 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10956, 21, 10.0000, 12, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10956, 47, 9.5000, 14, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10956, 51, 53.0000, 8, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10957, 30, 25.8900, 30, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10957, 35, 18.0000, 40, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10957, 64, 33.2500, 8, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10958, 5, 21.3500, 20, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10958, 7, 30.0000, 6, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10958, 72, 34.8000, 5, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10959, 75, 7.7500, 20, CAST(0.150 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10960, 24, 4.5000, 10, CAST(0.250 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10960, 41, 9.6500, 24, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10961, 52, 7.0000, 6, CAST(0.050 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10961, 76, 18.0000, 60, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10962, 7, 30.0000, 45, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10962, 13, 6.0000, 77, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10962, 53, 32.8000, 20, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10962, 69, 36.0000, 9, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10962, 76, 18.0000, 44, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10963, 60, 34.0000, 2, CAST(0.150 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10964, 18, 62.5000, 6, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10964, 38, 263.5000, 5, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10964, 69, 36.0000, 10, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10965, 51, 53.0000, 16, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10966, 37, 26.0000, 8, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10966, 56, 38.0000, 12, CAST(0.150 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10966, 62, 49.3000, 12, CAST(0.150 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10967, 19, 9.2000, 12, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10967, 49, 20.0000, 40, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10968, 12, 38.0000, 30, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10968, 24, 4.5000, 30, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10968, 64, 33.2500, 4, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10969, 46, 12.0000, 9, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10970, 52, 7.0000, 40, CAST(0.200 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10971, 29, 123.7900, 14, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10972, 17, 39.0000, 6, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10972, 33, 2.5000, 7, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10973, 26, 31.2300, 5, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10973, 41, 9.6500, 6, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10973, 75, 7.7500, 10, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10974, 63, 43.9000, 10, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10975, 8, 40.0000, 16, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10975, 75, 7.7500, 10, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10976, 28, 45.6000, 20, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10977, 39, 18.0000, 30, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10977, 47, 9.5000, 30, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10977, 51, 53.0000, 10, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10977, 63, 43.9000, 20, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10978, 8, 40.0000, 20, CAST(0.150 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10978, 21, 10.0000, 40, CAST(0.150 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10978, 40, 18.4000, 10, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10978, 44, 19.4500, 6, CAST(0.150 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10979, 7, 30.0000, 18, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10979, 12, 38.0000, 20, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10979, 24, 4.5000, 80, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10979, 27, 43.9000, 30, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10979, 31, 12.5000, 24, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10979, 63, 43.9000, 35, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10980, 75, 7.7500, 40, CAST(0.200 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10981, 38, 263.5000, 60, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10982, 7, 30.0000, 20, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10982, 43, 46.0000, 9, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10983, 13, 6.0000, 84, CAST(0.150 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10983, 57, 19.5000, 15, CAST(0.000 AS Numeric(4, 3)))
GO
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10984, 16, 17.4500, 55, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10984, 24, 4.5000, 20, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10984, 36, 19.0000, 40, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10985, 16, 17.4500, 36, CAST(0.100 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10985, 18, 62.5000, 8, CAST(0.100 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10985, 32, 32.0000, 35, CAST(0.100 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10986, 11, 21.0000, 30, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10986, 20, 81.0000, 15, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10986, 76, 18.0000, 10, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10986, 77, 13.0000, 15, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10987, 7, 30.0000, 60, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10987, 43, 46.0000, 6, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10987, 72, 34.8000, 20, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10988, 7, 30.0000, 60, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10988, 62, 49.3000, 40, CAST(0.100 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10989, 6, 25.0000, 40, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10989, 11, 21.0000, 15, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10989, 41, 9.6500, 4, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10990, 21, 10.0000, 65, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10990, 34, 14.0000, 60, CAST(0.150 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10990, 55, 24.0000, 65, CAST(0.150 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10990, 61, 28.5000, 66, CAST(0.150 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10991, 2, 19.0000, 50, CAST(0.200 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10991, 70, 15.0000, 20, CAST(0.200 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10991, 76, 18.0000, 90, CAST(0.200 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10992, 72, 34.8000, 2, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10993, 29, 123.7900, 50, CAST(0.250 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10993, 41, 9.6500, 35, CAST(0.250 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10994, 59, 55.0000, 18, CAST(0.050 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10995, 51, 53.0000, 20, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10995, 60, 34.0000, 4, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10996, 42, 14.0000, 40, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10997, 32, 32.0000, 50, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10997, 46, 12.0000, 20, CAST(0.250 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10997, 52, 7.0000, 20, CAST(0.250 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10998, 24, 4.5000, 12, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10998, 61, 28.5000, 7, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10998, 74, 10.0000, 20, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10998, 75, 7.7500, 30, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10999, 41, 9.6500, 20, CAST(0.050 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10999, 51, 53.0000, 15, CAST(0.050 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (10999, 77, 13.0000, 21, CAST(0.050 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11000, 4, 22.0000, 25, CAST(0.250 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11000, 24, 4.5000, 30, CAST(0.250 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11000, 77, 13.0000, 30, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11001, 7, 30.0000, 60, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11001, 22, 21.0000, 25, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11001, 46, 12.0000, 25, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11001, 55, 24.0000, 6, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11002, 13, 6.0000, 56, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11002, 35, 18.0000, 15, CAST(0.150 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11002, 42, 14.0000, 24, CAST(0.150 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11002, 55, 24.0000, 40, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11003, 1, 18.0000, 4, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11003, 40, 18.4000, 10, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11003, 52, 7.0000, 10, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11004, 26, 31.2300, 6, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11004, 76, 18.0000, 6, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11005, 1, 18.0000, 2, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11005, 59, 55.0000, 10, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11006, 1, 18.0000, 8, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11006, 29, 123.7900, 2, CAST(0.250 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11007, 8, 40.0000, 30, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11007, 29, 123.7900, 10, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11007, 42, 14.0000, 14, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11008, 28, 45.6000, 70, CAST(0.050 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11008, 34, 14.0000, 90, CAST(0.050 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11008, 71, 21.5000, 21, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11009, 24, 4.5000, 12, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11009, 36, 19.0000, 18, CAST(0.250 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11009, 60, 34.0000, 9, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11010, 7, 30.0000, 20, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11010, 24, 4.5000, 10, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11011, 58, 13.2500, 40, CAST(0.050 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11011, 71, 21.5000, 20, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11012, 19, 9.2000, 50, CAST(0.050 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11012, 60, 34.0000, 36, CAST(0.050 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11012, 71, 21.5000, 60, CAST(0.050 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11013, 23, 9.0000, 10, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11013, 42, 14.0000, 4, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11013, 45, 9.5000, 20, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11013, 68, 12.5000, 2, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11014, 41, 9.6500, 28, CAST(0.100 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11015, 30, 25.8900, 15, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11015, 77, 13.0000, 18, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11016, 31, 12.5000, 15, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11016, 36, 19.0000, 16, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11017, 3, 10.0000, 25, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11017, 59, 55.0000, 110, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11017, 70, 15.0000, 30, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11018, 12, 38.0000, 20, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11018, 18, 62.5000, 10, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11018, 56, 38.0000, 5, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11019, 46, 12.0000, 3, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11019, 49, 20.0000, 2, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11020, 10, 31.0000, 24, CAST(0.150 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11021, 2, 19.0000, 11, CAST(0.250 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11021, 20, 81.0000, 15, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11021, 26, 31.2300, 63, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11021, 51, 53.0000, 44, CAST(0.250 AS Numeric(4, 3)))
GO
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11021, 72, 34.8000, 35, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11022, 19, 9.2000, 35, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11022, 69, 36.0000, 30, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11023, 7, 30.0000, 4, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11023, 43, 46.0000, 30, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11024, 26, 31.2300, 12, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11024, 33, 2.5000, 30, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11024, 65, 21.0500, 21, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11024, 71, 21.5000, 50, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11025, 1, 18.0000, 10, CAST(0.100 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11025, 13, 6.0000, 20, CAST(0.100 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11026, 18, 62.5000, 8, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11026, 51, 53.0000, 10, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11027, 24, 4.5000, 30, CAST(0.250 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11027, 62, 49.3000, 21, CAST(0.250 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11028, 55, 24.0000, 35, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11028, 59, 55.0000, 24, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11029, 56, 38.0000, 20, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11029, 63, 43.9000, 12, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11030, 2, 19.0000, 100, CAST(0.250 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11030, 5, 21.3500, 70, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11030, 29, 123.7900, 60, CAST(0.250 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11030, 59, 55.0000, 100, CAST(0.250 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11031, 1, 18.0000, 45, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11031, 13, 6.0000, 80, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11031, 24, 4.5000, 21, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11031, 64, 33.2500, 20, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11031, 71, 21.5000, 16, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11032, 36, 19.0000, 35, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11032, 38, 263.5000, 25, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11032, 59, 55.0000, 30, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11033, 53, 32.8000, 70, CAST(0.100 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11033, 69, 36.0000, 36, CAST(0.100 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11034, 21, 10.0000, 15, CAST(0.100 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11034, 44, 19.4500, 12, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11034, 61, 28.5000, 6, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11035, 1, 18.0000, 10, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11035, 35, 18.0000, 60, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11035, 42, 14.0000, 30, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11035, 54, 7.4500, 10, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11036, 13, 6.0000, 7, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11036, 59, 55.0000, 30, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11037, 70, 15.0000, 4, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11038, 40, 18.4000, 5, CAST(0.200 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11038, 52, 7.0000, 2, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11038, 71, 21.5000, 30, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11039, 28, 45.6000, 20, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11039, 35, 18.0000, 24, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11039, 49, 20.0000, 60, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11039, 57, 19.5000, 28, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11040, 21, 10.0000, 20, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11041, 2, 19.0000, 30, CAST(0.200 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11041, 63, 43.9000, 30, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11042, 44, 19.4500, 15, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11042, 61, 28.5000, 4, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11043, 11, 21.0000, 10, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11044, 62, 49.3000, 12, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11045, 33, 2.5000, 15, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11045, 51, 53.0000, 24, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11046, 12, 38.0000, 20, CAST(0.050 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11046, 32, 32.0000, 15, CAST(0.050 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11046, 35, 18.0000, 18, CAST(0.050 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11047, 1, 18.0000, 25, CAST(0.250 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11047, 5, 21.3500, 30, CAST(0.250 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11048, 68, 12.5000, 42, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11049, 2, 19.0000, 10, CAST(0.200 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11049, 12, 38.0000, 4, CAST(0.200 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11050, 76, 18.0000, 50, CAST(0.100 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11051, 24, 4.5000, 10, CAST(0.200 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11052, 43, 46.0000, 30, CAST(0.200 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11052, 61, 28.5000, 10, CAST(0.200 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11053, 18, 62.5000, 35, CAST(0.200 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11053, 32, 32.0000, 20, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11053, 64, 33.2500, 25, CAST(0.200 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11055, 24, 4.5000, 15, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11055, 25, 14.0000, 15, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11055, 51, 53.0000, 20, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11055, 57, 19.5000, 20, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11056, 7, 30.0000, 40, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11056, 55, 24.0000, 35, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11056, 60, 34.0000, 50, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11057, 70, 15.0000, 3, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11058, 21, 10.0000, 3, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11058, 60, 34.0000, 21, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11058, 61, 28.5000, 4, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11059, 13, 6.0000, 30, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11059, 17, 39.0000, 12, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11059, 60, 34.0000, 35, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11060, 60, 34.0000, 4, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11060, 77, 13.0000, 10, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11061, 60, 34.0000, 15, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11062, 53, 32.8000, 10, CAST(0.200 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11062, 70, 15.0000, 12, CAST(0.200 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11063, 34, 14.0000, 30, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11063, 40, 18.4000, 40, CAST(0.100 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11063, 41, 9.6500, 30, CAST(0.100 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11064, 17, 39.0000, 77, CAST(0.100 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11064, 41, 9.6500, 12, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11064, 53, 32.8000, 25, CAST(0.100 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11064, 55, 24.0000, 4, CAST(0.100 AS Numeric(4, 3)))
GO
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11064, 68, 12.5000, 55, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11065, 30, 25.8900, 4, CAST(0.250 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11065, 54, 7.4500, 20, CAST(0.250 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11066, 16, 17.4500, 3, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11066, 19, 9.2000, 42, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11066, 34, 14.0000, 35, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11067, 41, 9.6500, 9, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11068, 28, 45.6000, 8, CAST(0.150 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11068, 43, 46.0000, 36, CAST(0.150 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11068, 77, 13.0000, 28, CAST(0.150 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11069, 39, 18.0000, 20, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11070, 1, 18.0000, 40, CAST(0.150 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11070, 2, 19.0000, 20, CAST(0.150 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11070, 16, 17.4500, 30, CAST(0.150 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11070, 31, 12.5000, 20, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11071, 7, 30.0000, 15, CAST(0.050 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11071, 13, 6.0000, 10, CAST(0.050 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11072, 2, 19.0000, 8, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11072, 41, 9.6500, 40, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11072, 50, 16.2500, 22, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11072, 64, 33.2500, 130, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11073, 11, 21.0000, 10, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11073, 24, 4.5000, 20, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11074, 16, 17.4500, 14, CAST(0.050 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11075, 2, 19.0000, 10, CAST(0.150 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11075, 46, 12.0000, 30, CAST(0.150 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11075, 76, 18.0000, 2, CAST(0.150 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11076, 6, 25.0000, 20, CAST(0.250 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11076, 14, 23.2500, 20, CAST(0.250 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11076, 19, 9.2000, 10, CAST(0.250 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11077, 2, 19.0000, 24, CAST(0.200 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11077, 3, 10.0000, 4, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11077, 4, 22.0000, 1, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11077, 6, 25.0000, 1, CAST(0.020 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11077, 7, 30.0000, 1, CAST(0.050 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11077, 8, 40.0000, 2, CAST(0.100 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11077, 10, 31.0000, 1, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11077, 12, 38.0000, 2, CAST(0.050 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11077, 13, 6.0000, 4, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11077, 14, 23.2500, 1, CAST(0.030 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11077, 16, 17.4500, 2, CAST(0.030 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11077, 20, 81.0000, 1, CAST(0.040 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11077, 23, 9.0000, 2, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11077, 32, 32.0000, 1, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11077, 39, 18.0000, 2, CAST(0.050 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11077, 41, 9.6500, 3, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11077, 46, 12.0000, 3, CAST(0.020 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11077, 52, 7.0000, 2, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11077, 55, 24.0000, 2, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11077, 60, 34.0000, 2, CAST(0.060 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11077, 64, 33.2500, 2, CAST(0.030 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11077, 66, 17.0000, 1, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11077, 73, 15.0000, 2, CAST(0.010 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11077, 75, 7.7500, 4, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11077, 77, 13.0000, 2, CAST(0.000 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11080, 51, 53.0000, 23, CAST(0.123 AS Numeric(4, 3)))
INSERT [Sales].[OrderDetails] ([orderid], [productid], [unitprice], [qty], [discount]) VALUES (11080, 83, 89.0000, 20, CAST(0.123 AS Numeric(4, 3)))
SET IDENTITY_INSERT [Sales].[Orders] ON 

INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10248, 85, 5, CAST(N'2006-07-04 00:00:00.000' AS DateTime), CAST(N'2006-08-01 00:00:00.000' AS DateTime), CAST(N'2006-07-16 00:00:00.000' AS DateTime), 3, 32.3800, N'Ship to 85-B', N'6789 rue de l''Abbaye', N'Reims', NULL, N'10345', N'France')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10249, 79, 6, CAST(N'2006-07-05 00:00:00.000' AS DateTime), CAST(N'2006-08-16 00:00:00.000' AS DateTime), CAST(N'2006-07-10 00:00:00.000' AS DateTime), 1, 11.6100, N'Ship to 79-C', N'Luisenstr. 9012', N'Münster', NULL, N'10328', N'Germany')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10250, 34, 4, CAST(N'2006-07-08 00:00:00.000' AS DateTime), CAST(N'2006-08-05 00:00:00.000' AS DateTime), CAST(N'2006-07-12 00:00:00.000' AS DateTime), 2, 65.8300, N'Destination SCQXA', N'Rua do Paço, 7890', N'Rio de Janeiro', N'RJ', N'10195', N'Brazil')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10251, 84, 3, CAST(N'2006-07-08 00:00:00.000' AS DateTime), CAST(N'2006-08-05 00:00:00.000' AS DateTime), CAST(N'2006-07-15 00:00:00.000' AS DateTime), 1, 41.3400, N'Ship to 84-A', N'3456, rue du Commerce', N'Lyon', NULL, N'10342', N'France')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10252, 76, 4, CAST(N'2006-07-09 00:00:00.000' AS DateTime), CAST(N'2006-08-06 00:00:00.000' AS DateTime), CAST(N'2006-07-11 00:00:00.000' AS DateTime), 2, 51.3000, N'Ship to 76-B', N'Boulevard Tirou, 9012', N'Charleroi', NULL, N'10318', N'Belgium')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10253, 34, 3, CAST(N'2006-07-10 00:00:00.000' AS DateTime), CAST(N'2006-07-24 00:00:00.000' AS DateTime), CAST(N'2006-07-16 00:00:00.000' AS DateTime), 2, 58.1700, N'Destination JPAIY', N'Rua do Paço, 8901', N'Rio de Janeiro', N'RJ', N'10196', N'Brazil')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10254, 14, 5, CAST(N'2006-07-11 00:00:00.000' AS DateTime), CAST(N'2006-08-08 00:00:00.000' AS DateTime), CAST(N'2006-07-23 00:00:00.000' AS DateTime), 2, 22.9800, N'Destination YUJRD', N'Hauptstr. 1234', N'Bern', NULL, N'10139', N'Switzerland')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10255, 68, 9, CAST(N'2006-07-12 00:00:00.000' AS DateTime), CAST(N'2006-08-09 00:00:00.000' AS DateTime), CAST(N'2006-07-15 00:00:00.000' AS DateTime), 3, 148.3300, N'Ship to 68-A', N'Starenweg 6789', N'Genève', NULL, N'10294', N'Switzerland')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10256, 88, 3, CAST(N'2006-07-15 00:00:00.000' AS DateTime), CAST(N'2006-08-12 00:00:00.000' AS DateTime), CAST(N'2006-07-17 00:00:00.000' AS DateTime), 2, 13.9700, N'Ship to 88-B', N'Rua do Mercado, 5678', N'Resende', N'SP', N'10354', N'Brazil')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10257, 35, 4, CAST(N'2006-07-16 00:00:00.000' AS DateTime), CAST(N'2006-08-13 00:00:00.000' AS DateTime), CAST(N'2006-07-22 00:00:00.000' AS DateTime), 3, 81.9100, N'Destination JYDLM', N'Carrera1234 con Ave. Carlos Soublette #8-35', N'San Cristóbal', N'Táchira', N'10199', N'Venezuela')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10258, 20, 1, CAST(N'2006-07-17 00:00:00.000' AS DateTime), CAST(N'2006-08-14 00:00:00.000' AS DateTime), CAST(N'2006-07-23 00:00:00.000' AS DateTime), 1, 140.5100, N'Destination RVDMF', N'Kirchgasse 9012', N'Graz', NULL, N'10157', N'Austria')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10259, 13, 4, CAST(N'2006-07-18 00:00:00.000' AS DateTime), CAST(N'2006-08-15 00:00:00.000' AS DateTime), CAST(N'2006-07-25 00:00:00.000' AS DateTime), 3, 3.2500, N'Destination LGGCH', N'Sierras de Granada 9012', N'México D.F.', NULL, N'10137', N'Mexico')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10260, 56, 4, CAST(N'2006-07-19 00:00:00.000' AS DateTime), CAST(N'2006-08-16 00:00:00.000' AS DateTime), CAST(N'2006-07-29 00:00:00.000' AS DateTime), 1, 55.0900, N'Ship to 56-A', N'Mehrheimerstr. 0123', N'Köln', NULL, N'10258', N'Germany')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10261, 61, 4, CAST(N'2006-07-19 00:00:00.000' AS DateTime), CAST(N'2006-08-16 00:00:00.000' AS DateTime), CAST(N'2006-07-30 00:00:00.000' AS DateTime), 2, 3.0500, N'Ship to 61-B', N'Rua da Panificadora, 6789', N'Rio de Janeiro', N'RJ', N'10274', N'Brazil')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10262, 65, 8, CAST(N'2006-07-22 00:00:00.000' AS DateTime), CAST(N'2006-08-19 00:00:00.000' AS DateTime), CAST(N'2006-07-25 00:00:00.000' AS DateTime), 3, 48.2900, N'Ship to 65-B', N'8901 Milton Dr.', N'Albuquerque', N'NM', N'10286', N'USA')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10263, 20, 9, CAST(N'2006-07-23 00:00:00.000' AS DateTime), CAST(N'2006-08-20 00:00:00.000' AS DateTime), CAST(N'2006-07-31 00:00:00.000' AS DateTime), 3, 146.0600, N'Destination FFXKT', N'Kirchgasse 0123', N'Graz', NULL, N'10158', N'Austria')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10264, 24, 6, CAST(N'2006-07-24 00:00:00.000' AS DateTime), CAST(N'2006-08-21 00:00:00.000' AS DateTime), CAST(N'2006-08-23 00:00:00.000' AS DateTime), 3, 3.6700, N'Destination KBSBN', N'Åkergatan 9012', N'Bräcke', NULL, N'10167', N'Sweden')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10265, 7, 2, CAST(N'2006-07-25 00:00:00.000' AS DateTime), CAST(N'2006-08-22 00:00:00.000' AS DateTime), CAST(N'2006-08-12 00:00:00.000' AS DateTime), 1, 55.2800, N'Ship to 7-A', N'0123, place Kléber', N'Strasbourg', NULL, N'10329', N'France')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10266, 87, 3, CAST(N'2006-07-26 00:00:00.000' AS DateTime), CAST(N'2006-09-06 00:00:00.000' AS DateTime), CAST(N'2006-07-31 00:00:00.000' AS DateTime), 3, 25.7300, N'Ship to 87-B', N'Torikatu 2345', N'Oulu', NULL, N'10351', N'Finland')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10267, 25, 4, CAST(N'2006-07-29 00:00:00.000' AS DateTime), CAST(N'2006-08-26 00:00:00.000' AS DateTime), CAST(N'2006-08-06 00:00:00.000' AS DateTime), 1, 208.5800, N'Destination VAPXU', N'Berliner Platz 0123', N'München', NULL, N'10168', N'Germany')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10268, 33, 8, CAST(N'2006-07-30 00:00:00.000' AS DateTime), CAST(N'2006-08-27 00:00:00.000' AS DateTime), CAST(N'2006-08-02 00:00:00.000' AS DateTime), 3, 66.2900, N'Destination QJVQH', N'5ª Ave. Los Palos Grandes 5678', N'Caracas', N'DF', N'10193', N'Venezuela')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10269, 89, 5, CAST(N'2006-07-31 00:00:00.000' AS DateTime), CAST(N'2006-08-14 00:00:00.000' AS DateTime), CAST(N'2006-08-09 00:00:00.000' AS DateTime), 1, 4.5600, N'Ship to 89-B', N'8901 - 12th Ave. S.', N'Seattle', N'WA', N'10357', N'USA')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10270, 87, 1, CAST(N'2006-08-01 00:00:00.000' AS DateTime), CAST(N'2006-08-29 00:00:00.000' AS DateTime), CAST(N'2006-08-02 00:00:00.000' AS DateTime), 1, 136.5400, N'Ship to 87-B', N'Torikatu 2345', N'Oulu', NULL, N'10351', N'Finland')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10271, 75, 6, CAST(N'2006-08-01 00:00:00.000' AS DateTime), CAST(N'2006-08-29 00:00:00.000' AS DateTime), CAST(N'2006-08-30 00:00:00.000' AS DateTime), 2, 4.5400, N'Ship to 75-C', N'P.O. Box 7890', N'Lander', N'WY', N'10316', N'USA')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10272, 65, 6, CAST(N'2006-08-02 00:00:00.000' AS DateTime), CAST(N'2006-08-30 00:00:00.000' AS DateTime), CAST(N'2006-08-06 00:00:00.000' AS DateTime), 2, 98.0300, N'Ship to 65-A', N'7890 Milton Dr.', N'Albuquerque', N'NM', N'10285', N'USA')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10273, 63, 3, CAST(N'2006-08-05 00:00:00.000' AS DateTime), CAST(N'2006-09-02 00:00:00.000' AS DateTime), CAST(N'2006-08-12 00:00:00.000' AS DateTime), 3, 76.0700, N'Ship to 63-A', N'Taucherstraße 1234', N'Cunewalde', NULL, N'10279', N'Germany')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10274, 85, 6, CAST(N'2006-08-06 00:00:00.000' AS DateTime), CAST(N'2006-09-03 00:00:00.000' AS DateTime), CAST(N'2006-08-16 00:00:00.000' AS DateTime), 1, 6.0100, N'Ship to 85-B', N'6789 rue de l''Abbaye', N'Reims', NULL, N'10345', N'France')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10275, 49, 1, CAST(N'2006-08-07 00:00:00.000' AS DateTime), CAST(N'2006-09-04 00:00:00.000' AS DateTime), CAST(N'2006-08-09 00:00:00.000' AS DateTime), 1, 26.9300, N'Ship to 49-A', N'Via Ludovico il Moro 8901', N'Bergamo', NULL, N'10235', N'Italy')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10276, 80, 8, CAST(N'2006-08-08 00:00:00.000' AS DateTime), CAST(N'2006-08-22 00:00:00.000' AS DateTime), CAST(N'2006-08-14 00:00:00.000' AS DateTime), 3, 13.8400, N'Ship to 80-C', N'Avda. Azteca 5678', N'México D.F.', NULL, N'10334', N'Mexico')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10277, 52, 2, CAST(N'2006-08-09 00:00:00.000' AS DateTime), CAST(N'2006-09-06 00:00:00.000' AS DateTime), CAST(N'2006-08-13 00:00:00.000' AS DateTime), 3, 125.7700, N'Ship to 52-A', N'Heerstr. 9012', N'Leipzig', NULL, N'10247', N'Germany')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10278, 5, 8, CAST(N'2006-08-12 00:00:00.000' AS DateTime), CAST(N'2006-09-09 00:00:00.000' AS DateTime), CAST(N'2006-08-16 00:00:00.000' AS DateTime), 2, 92.6900, N'Ship to 5-C', N'Berguvsvägen  1234', N'Luleå', NULL, N'10269', N'Sweden')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10279, 44, 8, CAST(N'2006-08-13 00:00:00.000' AS DateTime), CAST(N'2006-09-10 00:00:00.000' AS DateTime), CAST(N'2006-08-16 00:00:00.000' AS DateTime), 2, 25.8300, N'Ship to 44-A', N'Magazinweg 4567', N'Frankfurt a.M.', NULL, N'10222', N'Germany')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10280, 5, 2, CAST(N'2006-08-14 00:00:00.000' AS DateTime), CAST(N'2006-09-11 00:00:00.000' AS DateTime), CAST(N'2006-09-12 00:00:00.000' AS DateTime), 1, 8.9800, N'Ship to 5-B', N'Berguvsvägen  0123', N'Luleå', NULL, N'10268', N'Sweden')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10281, 69, 4, CAST(N'2006-08-14 00:00:00.000' AS DateTime), CAST(N'2006-08-28 00:00:00.000' AS DateTime), CAST(N'2006-08-21 00:00:00.000' AS DateTime), 1, 2.9400, N'Ship to 69-A', N'Gran Vía, 9012', N'Madrid', NULL, N'10297', N'Spain')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10282, 69, 4, CAST(N'2006-08-15 00:00:00.000' AS DateTime), CAST(N'2006-09-12 00:00:00.000' AS DateTime), CAST(N'2006-08-21 00:00:00.000' AS DateTime), 1, 12.6900, N'Ship to 69-B', N'Gran Vía, 0123', N'Madrid', NULL, N'10298', N'Spain')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10283, 46, 3, CAST(N'2006-08-16 00:00:00.000' AS DateTime), CAST(N'2006-09-13 00:00:00.000' AS DateTime), CAST(N'2006-08-23 00:00:00.000' AS DateTime), 3, 84.8100, N'Ship to 46-A', N'Carrera 0123 con Ave. Bolívar #65-98 Llano Largo', N'Barquisimeto', N'Lara', N'10227', N'Venezuela')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10284, 44, 4, CAST(N'2006-08-19 00:00:00.000' AS DateTime), CAST(N'2006-09-16 00:00:00.000' AS DateTime), CAST(N'2006-08-27 00:00:00.000' AS DateTime), 1, 76.5600, N'Ship to 44-A', N'Magazinweg 4567', N'Frankfurt a.M.', NULL, N'10222', N'Germany')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10285, 63, 1, CAST(N'2006-08-20 00:00:00.000' AS DateTime), CAST(N'2006-09-17 00:00:00.000' AS DateTime), CAST(N'2006-08-26 00:00:00.000' AS DateTime), 2, 76.8300, N'Ship to 63-B', N'Taucherstraße 2345', N'Cunewalde', NULL, N'10280', N'Germany')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10286, 63, 8, CAST(N'2006-08-21 00:00:00.000' AS DateTime), CAST(N'2006-09-18 00:00:00.000' AS DateTime), CAST(N'2006-08-30 00:00:00.000' AS DateTime), 3, 229.2400, N'Ship to 63-B', N'Taucherstraße 2345', N'Cunewalde', NULL, N'10280', N'Germany')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10287, 67, 8, CAST(N'2006-08-22 00:00:00.000' AS DateTime), CAST(N'2006-09-19 00:00:00.000' AS DateTime), CAST(N'2006-08-28 00:00:00.000' AS DateTime), 3, 12.7600, N'Ship to 67-A', N'Av. Copacabana, 3456', N'Rio de Janeiro', N'RJ', N'10291', N'Brazil')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10288, 66, 4, CAST(N'2006-08-23 00:00:00.000' AS DateTime), CAST(N'2006-09-20 00:00:00.000' AS DateTime), CAST(N'2006-09-03 00:00:00.000' AS DateTime), 1, 7.4500, N'Ship to 66-C', N'Strada Provinciale 2345', N'Reggio Emilia', NULL, N'10290', N'Italy')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10289, 11, 7, CAST(N'2006-08-26 00:00:00.000' AS DateTime), CAST(N'2006-09-23 00:00:00.000' AS DateTime), CAST(N'2006-08-28 00:00:00.000' AS DateTime), 3, 22.7700, N'Destination DLEUN', N'Fauntleroy Circus 4567', N'London', NULL, N'10132', N'UK')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10290, 15, 8, CAST(N'2006-08-27 00:00:00.000' AS DateTime), CAST(N'2006-09-24 00:00:00.000' AS DateTime), CAST(N'2006-09-03 00:00:00.000' AS DateTime), 1, 79.7000, N'Destination HQZHO', N'Av. dos Lusíadas, 4567', N'Sao Paulo', N'SP', N'10142', N'Brazil')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10291, 61, 6, CAST(N'2006-08-27 00:00:00.000' AS DateTime), CAST(N'2006-09-24 00:00:00.000' AS DateTime), CAST(N'2006-09-04 00:00:00.000' AS DateTime), 2, 6.4000, N'Ship to 61-A', N'Rua da Panificadora, 5678', N'Rio de Janeiro', N'RJ', N'10273', N'Brazil')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10292, 81, 1, CAST(N'2006-08-28 00:00:00.000' AS DateTime), CAST(N'2006-09-25 00:00:00.000' AS DateTime), CAST(N'2006-09-02 00:00:00.000' AS DateTime), 2, 1.3500, N'Ship to 81-A', N'Av. Inês de Castro, 6789', N'Sao Paulo', N'SP', N'10335', N'Brazil')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10293, 80, 1, CAST(N'2006-08-29 00:00:00.000' AS DateTime), CAST(N'2006-09-26 00:00:00.000' AS DateTime), CAST(N'2006-09-11 00:00:00.000' AS DateTime), 3, 21.1800, N'Ship to 80-B', N'Avda. Azteca 4567', N'México D.F.', NULL, N'10333', N'Mexico')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10294, 65, 4, CAST(N'2006-08-30 00:00:00.000' AS DateTime), CAST(N'2006-09-27 00:00:00.000' AS DateTime), CAST(N'2006-09-05 00:00:00.000' AS DateTime), 2, 147.2600, N'Ship to 65-A', N'7890 Milton Dr.', N'Albuquerque', N'NM', N'10285', N'USA')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10295, 85, 2, CAST(N'2006-09-02 00:00:00.000' AS DateTime), CAST(N'2006-09-30 00:00:00.000' AS DateTime), CAST(N'2006-09-10 00:00:00.000' AS DateTime), 2, 1.1500, N'Ship to 85-C', N'7890 rue de l''Abbaye', N'Reims', NULL, N'10346', N'France')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10296, 46, 6, CAST(N'2006-09-03 00:00:00.000' AS DateTime), CAST(N'2006-10-01 00:00:00.000' AS DateTime), CAST(N'2006-09-11 00:00:00.000' AS DateTime), 1, 0.1200, N'Ship to 46-C', N'Carrera 2345 con Ave. Bolívar #65-98 Llano Largo', N'Barquisimeto', N'Lara', N'10229', N'Venezuela')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10297, 7, 5, CAST(N'2006-09-04 00:00:00.000' AS DateTime), CAST(N'2006-10-16 00:00:00.000' AS DateTime), CAST(N'2006-09-10 00:00:00.000' AS DateTime), 2, 5.7400, N'Ship to 7-C', N'2345, place Kléber', N'Strasbourg', NULL, N'10331', N'France')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10298, 37, 6, CAST(N'2006-09-05 00:00:00.000' AS DateTime), CAST(N'2006-10-03 00:00:00.000' AS DateTime), CAST(N'2006-09-11 00:00:00.000' AS DateTime), 2, 168.2200, N'Destination ATSOA', N'4567 Johnstown Road', N'Cork', N'Co. Cork', N'10202', N'Ireland')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10299, 67, 4, CAST(N'2006-09-06 00:00:00.000' AS DateTime), CAST(N'2006-10-04 00:00:00.000' AS DateTime), CAST(N'2006-09-13 00:00:00.000' AS DateTime), 2, 29.7600, N'Ship to 67-A', N'Av. Copacabana, 3456', N'Rio de Janeiro', N'RJ', N'10291', N'Brazil')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10300, 49, 2, CAST(N'2006-09-09 00:00:00.000' AS DateTime), CAST(N'2006-10-07 00:00:00.000' AS DateTime), CAST(N'2006-09-18 00:00:00.000' AS DateTime), 2, 17.6800, N'Ship to 49-A', N'Via Ludovico il Moro 8901', N'Bergamo', NULL, N'10235', N'Italy')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10301, 86, 8, CAST(N'2006-09-09 00:00:00.000' AS DateTime), CAST(N'2006-10-07 00:00:00.000' AS DateTime), CAST(N'2006-09-17 00:00:00.000' AS DateTime), 2, 45.0800, N'Ship to 86-A', N'Adenauerallee 8901', N'Stuttgart', NULL, N'10347', N'Germany')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10302, 76, 4, CAST(N'2006-09-10 00:00:00.000' AS DateTime), CAST(N'2006-10-08 00:00:00.000' AS DateTime), CAST(N'2006-10-09 00:00:00.000' AS DateTime), 2, 6.2700, N'Ship to 76-B', N'Boulevard Tirou, 9012', N'Charleroi', NULL, N'10318', N'Belgium')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10303, 30, 7, CAST(N'2006-09-11 00:00:00.000' AS DateTime), CAST(N'2006-10-09 00:00:00.000' AS DateTime), CAST(N'2006-09-18 00:00:00.000' AS DateTime), 2, 107.8300, N'Destination IIYDD', N'C/ Romero, 5678', N'Sevilla', NULL, N'10183', N'Spain')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10304, 80, 1, CAST(N'2006-09-12 00:00:00.000' AS DateTime), CAST(N'2006-10-10 00:00:00.000' AS DateTime), CAST(N'2006-09-17 00:00:00.000' AS DateTime), 2, 63.7900, N'Ship to 80-C', N'Avda. Azteca 5678', N'México D.F.', NULL, N'10334', N'Mexico')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10305, 55, 8, CAST(N'2006-09-13 00:00:00.000' AS DateTime), CAST(N'2006-10-11 00:00:00.000' AS DateTime), CAST(N'2006-10-09 00:00:00.000' AS DateTime), 3, 257.6200, N'Ship to 55-B', N'8901 Bering St.', N'Anchorage', N'AK', N'10256', N'USA')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10306, 69, 1, CAST(N'2006-09-16 00:00:00.000' AS DateTime), CAST(N'2006-10-14 00:00:00.000' AS DateTime), CAST(N'2006-09-23 00:00:00.000' AS DateTime), 3, 7.5600, N'Ship to 69-B', N'Gran Vía, 0123', N'Madrid', NULL, N'10298', N'Spain')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10307, 48, 2, CAST(N'2006-09-17 00:00:00.000' AS DateTime), CAST(N'2006-10-15 00:00:00.000' AS DateTime), CAST(N'2006-09-25 00:00:00.000' AS DateTime), 2, 0.5600, N'Ship to 48-B', N'6789 Chiaroscuro Rd.', N'Portland', N'OR', N'10233', N'USA')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10308, 2, 7, CAST(N'2006-09-18 00:00:00.000' AS DateTime), CAST(N'2006-10-16 00:00:00.000' AS DateTime), CAST(N'2006-09-24 00:00:00.000' AS DateTime), 3, 1.6100, N'Destination QMVCI', N'Avda. de la Constitución 2345', N'México D.F.', NULL, N'10180', N'Mexico')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10309, 37, 3, CAST(N'2006-09-19 00:00:00.000' AS DateTime), CAST(N'2006-10-17 00:00:00.000' AS DateTime), CAST(N'2006-10-23 00:00:00.000' AS DateTime), 1, 47.3000, N'Destination ATSOA', N'4567 Johnstown Road', N'Cork', N'Co. Cork', N'10202', N'Ireland')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10310, 77, 8, CAST(N'2006-09-20 00:00:00.000' AS DateTime), CAST(N'2006-10-18 00:00:00.000' AS DateTime), CAST(N'2006-09-27 00:00:00.000' AS DateTime), 2, 17.5200, N'Ship to 77-B', N'2345 Jefferson Way Suite 2', N'Portland', N'OR', N'10321', N'USA')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10311, 18, 1, CAST(N'2006-09-20 00:00:00.000' AS DateTime), CAST(N'2006-10-04 00:00:00.000' AS DateTime), CAST(N'2006-09-26 00:00:00.000' AS DateTime), 3, 24.6900, N'Destination SNPXM', N'0123, rue des Cinquante Otages', N'Nantes', NULL, N'10148', N'France')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10312, 86, 2, CAST(N'2006-09-23 00:00:00.000' AS DateTime), CAST(N'2006-10-21 00:00:00.000' AS DateTime), CAST(N'2006-10-03 00:00:00.000' AS DateTime), 2, 40.2600, N'Ship to 86-B', N'Adenauerallee 9012', N'Stuttgart', NULL, N'10348', N'Germany')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10313, 63, 2, CAST(N'2006-09-24 00:00:00.000' AS DateTime), CAST(N'2006-10-22 00:00:00.000' AS DateTime), CAST(N'2006-10-04 00:00:00.000' AS DateTime), 2, 1.9600, N'Ship to 63-A', N'Taucherstraße 1234', N'Cunewalde', NULL, N'10279', N'Germany')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10314, 65, 1, CAST(N'2006-09-25 00:00:00.000' AS DateTime), CAST(N'2006-10-23 00:00:00.000' AS DateTime), CAST(N'2006-10-04 00:00:00.000' AS DateTime), 2, 74.1600, N'Ship to 65-A', N'7890 Milton Dr.', N'Albuquerque', N'NM', N'10285', N'USA')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10315, 38, 4, CAST(N'2006-09-26 00:00:00.000' AS DateTime), CAST(N'2006-10-24 00:00:00.000' AS DateTime), CAST(N'2006-10-03 00:00:00.000' AS DateTime), 2, 41.7600, N'Destination AXVHD', N'Garden House Crowther Way 9012', N'Cowes', N'Isle of Wight', N'10207', N'UK')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10316, 65, 1, CAST(N'2006-09-27 00:00:00.000' AS DateTime), CAST(N'2006-10-25 00:00:00.000' AS DateTime), CAST(N'2006-10-08 00:00:00.000' AS DateTime), 3, 150.1500, N'Ship to 65-B', N'8901 Milton Dr.', N'Albuquerque', N'NM', N'10286', N'USA')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10317, 48, 6, CAST(N'2006-09-30 00:00:00.000' AS DateTime), CAST(N'2006-10-28 00:00:00.000' AS DateTime), CAST(N'2006-10-10 00:00:00.000' AS DateTime), 1, 12.6900, N'Ship to 48-B', N'6789 Chiaroscuro Rd.', N'Portland', N'OR', N'10233', N'USA')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10318, 38, 8, CAST(N'2006-10-01 00:00:00.000' AS DateTime), CAST(N'2006-10-29 00:00:00.000' AS DateTime), CAST(N'2006-10-04 00:00:00.000' AS DateTime), 2, 4.7300, N'Destination AXVHD', N'Garden House Crowther Way 9012', N'Cowes', N'Isle of Wight', N'10207', N'UK')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10319, 80, 7, CAST(N'2006-10-02 00:00:00.000' AS DateTime), CAST(N'2006-10-30 00:00:00.000' AS DateTime), CAST(N'2006-10-11 00:00:00.000' AS DateTime), 3, 64.5000, N'Ship to 80-B', N'Avda. Azteca 4567', N'México D.F.', NULL, N'10333', N'Mexico')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10320, 87, 5, CAST(N'2006-10-03 00:00:00.000' AS DateTime), CAST(N'2006-10-17 00:00:00.000' AS DateTime), CAST(N'2006-10-18 00:00:00.000' AS DateTime), 3, 34.5700, N'Ship to 87-A', N'Torikatu 1234', N'Oulu', NULL, N'10350', N'Finland')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10321, 38, 3, CAST(N'2006-10-03 00:00:00.000' AS DateTime), CAST(N'2006-10-31 00:00:00.000' AS DateTime), CAST(N'2006-10-11 00:00:00.000' AS DateTime), 2, 3.4300, N'Destination LMVGS', N'Garden House Crowther Way 8901', N'Cowes', N'Isle of Wight', N'10206', N'UK')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10322, 58, 7, CAST(N'2006-10-04 00:00:00.000' AS DateTime), CAST(N'2006-11-01 00:00:00.000' AS DateTime), CAST(N'2006-10-23 00:00:00.000' AS DateTime), 3, 0.4000, N'Ship to 58-A', N'Calle Dr. Jorge Cash 3456', N'México D.F.', NULL, N'10261', N'Mexico')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10323, 39, 4, CAST(N'2006-10-07 00:00:00.000' AS DateTime), CAST(N'2006-11-04 00:00:00.000' AS DateTime), CAST(N'2006-10-14 00:00:00.000' AS DateTime), 1, 4.8800, N'Destination RMBHM', N'Maubelstr. 1234', N'Brandenburg', NULL, N'10209', N'Germany')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10324, 71, 9, CAST(N'2006-10-08 00:00:00.000' AS DateTime), CAST(N'2006-11-05 00:00:00.000' AS DateTime), CAST(N'2006-10-10 00:00:00.000' AS DateTime), 1, 214.2700, N'Ship to 71-C', N'9012 Suffolk Ln.', N'Boise', N'ID', N'10307', N'Canada')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10325, 39, 1, CAST(N'2006-10-09 00:00:00.000' AS DateTime), CAST(N'2006-10-23 00:00:00.000' AS DateTime), CAST(N'2006-10-14 00:00:00.000' AS DateTime), 3, 64.8600, N'Destination RMBHM', N'Maubelstr. 1234', N'Brandenburg', NULL, N'10209', N'Germany')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10326, 8, 4, CAST(N'2006-10-10 00:00:00.000' AS DateTime), CAST(N'2006-11-07 00:00:00.000' AS DateTime), CAST(N'2006-10-14 00:00:00.000' AS DateTime), 2, 77.9200, N'Ship to 8-A', N'C/ Araquil, 0123', N'Madrid', NULL, N'10359', N'Spain')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10327, 24, 2, CAST(N'2006-10-11 00:00:00.000' AS DateTime), CAST(N'2006-11-08 00:00:00.000' AS DateTime), CAST(N'2006-10-14 00:00:00.000' AS DateTime), 1, 63.3600, N'Destination NCKKO', N'Åkergatan 7890', N'Bräcke', NULL, N'10165', N'Sweden')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10328, 28, 4, CAST(N'2006-10-14 00:00:00.000' AS DateTime), CAST(N'2006-11-11 00:00:00.000' AS DateTime), CAST(N'2006-10-17 00:00:00.000' AS DateTime), 3, 87.0300, N'Destination CIRQO', N'Jardim das rosas n. 8901', N'Lisboa', NULL, N'10176', N'Portugal')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10329, 75, 4, CAST(N'2006-10-15 00:00:00.000' AS DateTime), CAST(N'2006-11-26 00:00:00.000' AS DateTime), CAST(N'2006-10-23 00:00:00.000' AS DateTime), 2, 191.6700, N'Ship to 75-C', N'P.O. Box 7890', N'Lander', N'WY', N'10316', N'USA')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10330, 46, 3, CAST(N'2006-10-16 00:00:00.000' AS DateTime), CAST(N'2006-11-13 00:00:00.000' AS DateTime), CAST(N'2006-10-28 00:00:00.000' AS DateTime), 1, 12.7500, N'Ship to 46-A', N'Carrera 0123 con Ave. Bolívar #65-98 Llano Largo', N'Barquisimeto', N'Lara', N'10227', N'Venezuela')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10331, 9, 9, CAST(N'2006-10-16 00:00:00.000' AS DateTime), CAST(N'2006-11-27 00:00:00.000' AS DateTime), CAST(N'2006-10-21 00:00:00.000' AS DateTime), 1, 10.1900, N'Ship to 9-C', N'0123, rue des Bouchers', N'Marseille', NULL, N'10369', N'France')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10332, 51, 3, CAST(N'2006-10-17 00:00:00.000' AS DateTime), CAST(N'2006-11-28 00:00:00.000' AS DateTime), CAST(N'2006-10-21 00:00:00.000' AS DateTime), 2, 52.8400, N'Ship to 51-B', N'7890 rue St. Laurent', N'Montréal', N'Québec', N'10245', N'Canada')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10333, 87, 5, CAST(N'2006-10-18 00:00:00.000' AS DateTime), CAST(N'2006-11-15 00:00:00.000' AS DateTime), CAST(N'2006-10-25 00:00:00.000' AS DateTime), 3, 0.5900, N'Ship to 87-C', N'Torikatu 3456', N'Oulu', NULL, N'10352', N'Finland')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10334, 84, 8, CAST(N'2006-10-21 00:00:00.000' AS DateTime), CAST(N'2006-11-18 00:00:00.000' AS DateTime), CAST(N'2006-10-28 00:00:00.000' AS DateTime), 2, 8.5600, N'Ship to 84-B', N'4567, rue du Commerce', N'Lyon', NULL, N'10343', N'France')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10335, 37, 7, CAST(N'2006-10-22 00:00:00.000' AS DateTime), CAST(N'2006-11-19 00:00:00.000' AS DateTime), CAST(N'2006-10-24 00:00:00.000' AS DateTime), 2, 42.1100, N'Destination ATSOA', N'4567 Johnstown Road', N'Cork', N'Co. Cork', N'10202', N'Ireland')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10336, 60, 7, CAST(N'2006-10-23 00:00:00.000' AS DateTime), CAST(N'2006-11-20 00:00:00.000' AS DateTime), CAST(N'2006-10-25 00:00:00.000' AS DateTime), 2, 15.5100, N'Ship to 60-B', N'Estrada da saúde n. 3456', N'Lisboa', NULL, N'10271', N'Portugal')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10337, 25, 4, CAST(N'2006-10-24 00:00:00.000' AS DateTime), CAST(N'2006-11-21 00:00:00.000' AS DateTime), CAST(N'2006-10-29 00:00:00.000' AS DateTime), 3, 108.2600, N'Destination QOCBL', N'Berliner Platz 1234', N'München', NULL, N'10169', N'Germany')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10338, 55, 4, CAST(N'2006-10-25 00:00:00.000' AS DateTime), CAST(N'2006-11-22 00:00:00.000' AS DateTime), CAST(N'2006-10-29 00:00:00.000' AS DateTime), 3, 84.2100, N'Ship to 55-C', N'9012 Bering St.', N'Anchorage', N'AK', N'10257', N'USA')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10339, 51, 2, CAST(N'2006-10-28 00:00:00.000' AS DateTime), CAST(N'2006-11-25 00:00:00.000' AS DateTime), CAST(N'2006-11-04 00:00:00.000' AS DateTime), 2, 15.6600, N'Ship to 51-C', N'8901 rue St. Laurent', N'Montréal', N'Québec', N'10246', N'Canada')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10340, 9, 1, CAST(N'2006-10-29 00:00:00.000' AS DateTime), CAST(N'2006-11-26 00:00:00.000' AS DateTime), CAST(N'2006-11-08 00:00:00.000' AS DateTime), 3, 166.3100, N'Ship to 9-A', N'8901, rue des Bouchers', N'Marseille', NULL, N'10367', N'France')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10341, 73, 7, CAST(N'2006-10-29 00:00:00.000' AS DateTime), CAST(N'2006-11-26 00:00:00.000' AS DateTime), CAST(N'2006-11-05 00:00:00.000' AS DateTime), 3, 26.7800, N'Ship to 73-A', N'Vinbæltet 1234', N'Kobenhavn', NULL, N'10310', N'Denmark')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10342, 25, 4, CAST(N'2006-10-30 00:00:00.000' AS DateTime), CAST(N'2006-11-13 00:00:00.000' AS DateTime), CAST(N'2006-11-04 00:00:00.000' AS DateTime), 2, 54.8300, N'Destination VAPXU', N'Berliner Platz 0123', N'München', NULL, N'10168', N'Germany')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10343, 44, 4, CAST(N'2006-10-31 00:00:00.000' AS DateTime), CAST(N'2006-11-28 00:00:00.000' AS DateTime), CAST(N'2006-11-06 00:00:00.000' AS DateTime), 1, 110.3700, N'Ship to 44-A', N'Magazinweg 4567', N'Frankfurt a.M.', NULL, N'10222', N'Germany')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10344, 89, 4, CAST(N'2006-11-01 00:00:00.000' AS DateTime), CAST(N'2006-11-29 00:00:00.000' AS DateTime), CAST(N'2006-11-05 00:00:00.000' AS DateTime), 2, 23.2900, N'Ship to 89-A', N'7890 - 12th Ave. S.', N'Seattle', N'WA', N'10356', N'USA')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10345, 63, 2, CAST(N'2006-11-04 00:00:00.000' AS DateTime), CAST(N'2006-12-02 00:00:00.000' AS DateTime), CAST(N'2006-11-11 00:00:00.000' AS DateTime), 2, 249.0600, N'Ship to 63-B', N'Taucherstraße 2345', N'Cunewalde', NULL, N'10280', N'Germany')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10346, 65, 3, CAST(N'2006-11-05 00:00:00.000' AS DateTime), CAST(N'2006-12-17 00:00:00.000' AS DateTime), CAST(N'2006-11-08 00:00:00.000' AS DateTime), 3, 142.0800, N'Ship to 65-A', N'7890 Milton Dr.', N'Albuquerque', N'NM', N'10285', N'USA')
GO
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10347, 21, 4, CAST(N'2006-11-06 00:00:00.000' AS DateTime), CAST(N'2006-12-04 00:00:00.000' AS DateTime), CAST(N'2006-11-08 00:00:00.000' AS DateTime), 3, 3.1000, N'Destination KKELL', N'Rua Orós, 4567', N'Sao Paulo', N'SP', N'10162', N'Brazil')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10348, 86, 4, CAST(N'2006-11-07 00:00:00.000' AS DateTime), CAST(N'2006-12-05 00:00:00.000' AS DateTime), CAST(N'2006-11-15 00:00:00.000' AS DateTime), 2, 0.7800, N'Ship to 86-B', N'Adenauerallee 9012', N'Stuttgart', NULL, N'10348', N'Germany')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10349, 75, 7, CAST(N'2006-11-08 00:00:00.000' AS DateTime), CAST(N'2006-12-06 00:00:00.000' AS DateTime), CAST(N'2006-11-15 00:00:00.000' AS DateTime), 1, 8.6300, N'Ship to 75-C', N'P.O. Box 7890', N'Lander', N'WY', N'10316', N'USA')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10350, 41, 6, CAST(N'2006-11-11 00:00:00.000' AS DateTime), CAST(N'2006-12-09 00:00:00.000' AS DateTime), CAST(N'2006-12-03 00:00:00.000' AS DateTime), 2, 64.1900, N'Destination DWJIO', N'9012 rue Alsace-Lorraine', N'Toulouse', NULL, N'10217', N'France')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10351, 20, 1, CAST(N'2006-11-11 00:00:00.000' AS DateTime), CAST(N'2006-12-09 00:00:00.000' AS DateTime), CAST(N'2006-11-20 00:00:00.000' AS DateTime), 1, 162.3300, N'Destination RVDMF', N'Kirchgasse 9012', N'Graz', NULL, N'10157', N'Austria')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10352, 28, 3, CAST(N'2006-11-12 00:00:00.000' AS DateTime), CAST(N'2006-11-26 00:00:00.000' AS DateTime), CAST(N'2006-11-18 00:00:00.000' AS DateTime), 3, 1.3000, N'Destination OTSWR', N'Jardim das rosas n. 9012', N'Lisboa', NULL, N'10177', N'Portugal')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10353, 59, 7, CAST(N'2006-11-13 00:00:00.000' AS DateTime), CAST(N'2006-12-11 00:00:00.000' AS DateTime), CAST(N'2006-11-25 00:00:00.000' AS DateTime), 3, 360.6300, N'Ship to 59-B', N'Geislweg 7890', N'Salzburg', NULL, N'10265', N'Austria')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10354, 58, 8, CAST(N'2006-11-14 00:00:00.000' AS DateTime), CAST(N'2006-12-12 00:00:00.000' AS DateTime), CAST(N'2006-11-20 00:00:00.000' AS DateTime), 3, 53.8000, N'Ship to 58-C', N'Calle Dr. Jorge Cash 5678', N'México D.F.', NULL, N'10263', N'Mexico')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10355, 4, 6, CAST(N'2006-11-15 00:00:00.000' AS DateTime), CAST(N'2006-12-13 00:00:00.000' AS DateTime), CAST(N'2006-11-20 00:00:00.000' AS DateTime), 1, 41.9500, N'Ship to 4-A', N'Brook Farm Stratford St. Mary 0123', N'Colchester', N'Essex', N'10238', N'UK')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10356, 86, 6, CAST(N'2006-11-18 00:00:00.000' AS DateTime), CAST(N'2006-12-16 00:00:00.000' AS DateTime), CAST(N'2006-11-27 00:00:00.000' AS DateTime), 2, 36.7100, N'Ship to 86-A', N'Adenauerallee 8901', N'Stuttgart', NULL, N'10347', N'Germany')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10357, 46, 1, CAST(N'2006-11-19 00:00:00.000' AS DateTime), CAST(N'2006-12-17 00:00:00.000' AS DateTime), CAST(N'2006-12-02 00:00:00.000' AS DateTime), 3, 34.8800, N'Ship to 46-B', N'Carrera 1234 con Ave. Bolívar #65-98 Llano Largo', N'Barquisimeto', N'Lara', N'10228', N'Venezuela')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10358, 41, 5, CAST(N'2006-11-20 00:00:00.000' AS DateTime), CAST(N'2006-12-18 00:00:00.000' AS DateTime), CAST(N'2006-11-27 00:00:00.000' AS DateTime), 1, 19.6400, N'Ship to 41-C', N'0123 rue Alsace-Lorraine', N'Toulouse', NULL, N'10218', N'France')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10359, 72, 5, CAST(N'2006-11-21 00:00:00.000' AS DateTime), CAST(N'2006-12-19 00:00:00.000' AS DateTime), CAST(N'2006-11-26 00:00:00.000' AS DateTime), 3, 288.4300, N'Ship to 72-C', N'1234 Wadhurst Rd.', N'London', NULL, N'10309', N'UK')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10360, 7, 4, CAST(N'2006-11-22 00:00:00.000' AS DateTime), CAST(N'2006-12-20 00:00:00.000' AS DateTime), CAST(N'2006-12-02 00:00:00.000' AS DateTime), 3, 131.7000, N'Ship to 7-C', N'2345, place Kléber', N'Strasbourg', NULL, N'10331', N'France')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10361, 63, 1, CAST(N'2006-11-22 00:00:00.000' AS DateTime), CAST(N'2006-12-20 00:00:00.000' AS DateTime), CAST(N'2006-12-03 00:00:00.000' AS DateTime), 2, 183.1700, N'Ship to 63-C', N'Taucherstraße 3456', N'Cunewalde', NULL, N'10281', N'Germany')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10362, 9, 3, CAST(N'2006-11-25 00:00:00.000' AS DateTime), CAST(N'2006-12-23 00:00:00.000' AS DateTime), CAST(N'2006-11-28 00:00:00.000' AS DateTime), 1, 96.0400, N'Ship to 9-B', N'9012, rue des Bouchers', N'Marseille', NULL, N'10368', N'France')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10363, 17, 4, CAST(N'2006-11-26 00:00:00.000' AS DateTime), CAST(N'2006-12-24 00:00:00.000' AS DateTime), CAST(N'2006-12-04 00:00:00.000' AS DateTime), 3, 30.5400, N'Destination BJCXA', N'Walserweg 7890', N'Aachen', NULL, N'10145', N'Germany')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10364, 19, 1, CAST(N'2006-11-26 00:00:00.000' AS DateTime), CAST(N'2007-01-07 00:00:00.000' AS DateTime), CAST(N'2006-12-04 00:00:00.000' AS DateTime), 1, 71.9700, N'Destination QTKCU', N'3456 King George', N'London', NULL, N'10151', N'UK')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10365, 3, 3, CAST(N'2006-11-27 00:00:00.000' AS DateTime), CAST(N'2006-12-25 00:00:00.000' AS DateTime), CAST(N'2006-12-02 00:00:00.000' AS DateTime), 2, 22.0000, N'Destination FQFLS', N'Mataderos  3456', N'México D.F.', NULL, N'10211', N'Mexico')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10366, 29, 8, CAST(N'2006-11-28 00:00:00.000' AS DateTime), CAST(N'2007-01-09 00:00:00.000' AS DateTime), CAST(N'2006-12-30 00:00:00.000' AS DateTime), 2, 10.1400, N'Destination VPNNG', N'Rambla de Cataluña, 0123', N'Barcelona', NULL, N'10178', N'Spain')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10367, 83, 7, CAST(N'2006-11-28 00:00:00.000' AS DateTime), CAST(N'2006-12-26 00:00:00.000' AS DateTime), CAST(N'2006-12-02 00:00:00.000' AS DateTime), 3, 13.5500, N'Ship to 83-B', N'Smagsloget 1234', N'Århus', NULL, N'10340', N'Denmark')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10368, 20, 2, CAST(N'2006-11-29 00:00:00.000' AS DateTime), CAST(N'2006-12-27 00:00:00.000' AS DateTime), CAST(N'2006-12-02 00:00:00.000' AS DateTime), 2, 101.9500, N'Destination RVDMF', N'Kirchgasse 9012', N'Graz', NULL, N'10157', N'Austria')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10369, 75, 8, CAST(N'2006-12-02 00:00:00.000' AS DateTime), CAST(N'2006-12-30 00:00:00.000' AS DateTime), CAST(N'2006-12-09 00:00:00.000' AS DateTime), 2, 195.6800, N'Ship to 75-C', N'P.O. Box 7890', N'Lander', N'WY', N'10316', N'USA')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10370, 14, 6, CAST(N'2006-12-03 00:00:00.000' AS DateTime), CAST(N'2006-12-31 00:00:00.000' AS DateTime), CAST(N'2006-12-27 00:00:00.000' AS DateTime), 2, 1.1700, N'Destination YUJRD', N'Hauptstr. 1234', N'Bern', NULL, N'10139', N'Switzerland')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10371, 41, 1, CAST(N'2006-12-03 00:00:00.000' AS DateTime), CAST(N'2006-12-31 00:00:00.000' AS DateTime), CAST(N'2006-12-24 00:00:00.000' AS DateTime), 1, 0.4500, N'Ship to 41-C', N'0123 rue Alsace-Lorraine', N'Toulouse', NULL, N'10218', N'France')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10372, 62, 5, CAST(N'2006-12-04 00:00:00.000' AS DateTime), CAST(N'2007-01-01 00:00:00.000' AS DateTime), CAST(N'2006-12-09 00:00:00.000' AS DateTime), 2, 890.7800, N'Ship to 62-A', N'Alameda dos Canàrios, 8901', N'Sao Paulo', N'SP', N'10276', N'Brazil')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10373, 37, 4, CAST(N'2006-12-05 00:00:00.000' AS DateTime), CAST(N'2007-01-02 00:00:00.000' AS DateTime), CAST(N'2006-12-11 00:00:00.000' AS DateTime), 3, 124.1200, N'Destination KPVYJ', N'5678 Johnstown Road', N'Cork', N'Co. Cork', N'10203', N'Ireland')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10374, 91, 1, CAST(N'2006-12-05 00:00:00.000' AS DateTime), CAST(N'2007-01-02 00:00:00.000' AS DateTime), CAST(N'2006-12-09 00:00:00.000' AS DateTime), 3, 3.9400, N'Ship to 91-A', N'ul. Filtrowa 5678', N'Warszawa', NULL, N'10364', N'Poland')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10375, 36, 3, CAST(N'2006-12-06 00:00:00.000' AS DateTime), CAST(N'2007-01-03 00:00:00.000' AS DateTime), CAST(N'2006-12-09 00:00:00.000' AS DateTime), 2, 20.1200, N'Destination HOHCR', N'City Center Plaza 3456 Main St.', N'Elgin', N'OR', N'10201', N'USA')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10376, 51, 1, CAST(N'2006-12-09 00:00:00.000' AS DateTime), CAST(N'2007-01-06 00:00:00.000' AS DateTime), CAST(N'2006-12-13 00:00:00.000' AS DateTime), 2, 20.3900, N'Ship to 51-B', N'7890 rue St. Laurent', N'Montréal', N'Québec', N'10245', N'Canada')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10377, 72, 1, CAST(N'2006-12-09 00:00:00.000' AS DateTime), CAST(N'2007-01-06 00:00:00.000' AS DateTime), CAST(N'2006-12-13 00:00:00.000' AS DateTime), 3, 22.2100, N'Ship to 72-C', N'1234 Wadhurst Rd.', N'London', NULL, N'10309', N'UK')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10378, 24, 5, CAST(N'2006-12-10 00:00:00.000' AS DateTime), CAST(N'2007-01-07 00:00:00.000' AS DateTime), CAST(N'2006-12-19 00:00:00.000' AS DateTime), 3, 5.4400, N'Destination KBSBN', N'Åkergatan 9012', N'Bräcke', NULL, N'10167', N'Sweden')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10379, 61, 2, CAST(N'2006-12-11 00:00:00.000' AS DateTime), CAST(N'2007-01-08 00:00:00.000' AS DateTime), CAST(N'2006-12-13 00:00:00.000' AS DateTime), 1, 45.0300, N'Ship to 61-B', N'Rua da Panificadora, 6789', N'Rio de Janeiro', N'RJ', N'10274', N'Brazil')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10380, 37, 8, CAST(N'2006-12-12 00:00:00.000' AS DateTime), CAST(N'2007-01-09 00:00:00.000' AS DateTime), CAST(N'2007-01-16 00:00:00.000' AS DateTime), 3, 35.0300, N'Destination KPVYJ', N'5678 Johnstown Road', N'Cork', N'Co. Cork', N'10203', N'Ireland')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10381, 46, 3, CAST(N'2006-12-12 00:00:00.000' AS DateTime), CAST(N'2007-01-09 00:00:00.000' AS DateTime), CAST(N'2006-12-13 00:00:00.000' AS DateTime), 3, 7.9900, N'Ship to 46-C', N'Carrera 2345 con Ave. Bolívar #65-98 Llano Largo', N'Barquisimeto', N'Lara', N'10229', N'Venezuela')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10382, 20, 4, CAST(N'2006-12-13 00:00:00.000' AS DateTime), CAST(N'2007-01-10 00:00:00.000' AS DateTime), CAST(N'2006-12-16 00:00:00.000' AS DateTime), 1, 94.7700, N'Destination FFXKT', N'Kirchgasse 0123', N'Graz', NULL, N'10158', N'Austria')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10383, 4, 8, CAST(N'2006-12-16 00:00:00.000' AS DateTime), CAST(N'2007-01-13 00:00:00.000' AS DateTime), CAST(N'2006-12-18 00:00:00.000' AS DateTime), 3, 34.2400, N'Ship to 4-B', N'Brook Farm Stratford St. Mary 1234', N'Colchester', N'Essex', N'10239', N'UK')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10384, 5, 3, CAST(N'2006-12-16 00:00:00.000' AS DateTime), CAST(N'2007-01-13 00:00:00.000' AS DateTime), CAST(N'2006-12-20 00:00:00.000' AS DateTime), 3, 168.6400, N'Ship to 5-C', N'Berguvsvägen  1234', N'Luleå', NULL, N'10269', N'Sweden')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10385, 75, 1, CAST(N'2006-12-17 00:00:00.000' AS DateTime), CAST(N'2007-01-14 00:00:00.000' AS DateTime), CAST(N'2006-12-23 00:00:00.000' AS DateTime), 2, 30.9600, N'Ship to 75-B', N'P.O. Box 6789', N'Lander', N'WY', N'10315', N'USA')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10386, 21, 9, CAST(N'2006-12-18 00:00:00.000' AS DateTime), CAST(N'2007-01-01 00:00:00.000' AS DateTime), CAST(N'2006-12-25 00:00:00.000' AS DateTime), 3, 13.9900, N'Destination RNSMS', N'Rua Orós, 2345', N'Sao Paulo', N'SP', N'10160', N'Brazil')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10387, 70, 1, CAST(N'2006-12-18 00:00:00.000' AS DateTime), CAST(N'2007-01-15 00:00:00.000' AS DateTime), CAST(N'2006-12-20 00:00:00.000' AS DateTime), 2, 93.6300, N'Ship to 70-B', N'Erling Skakkes gate 5678', N'Stavern', NULL, N'10303', N'Norway')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10388, 72, 2, CAST(N'2006-12-19 00:00:00.000' AS DateTime), CAST(N'2007-01-16 00:00:00.000' AS DateTime), CAST(N'2006-12-20 00:00:00.000' AS DateTime), 1, 34.8600, N'Ship to 72-C', N'1234 Wadhurst Rd.', N'London', NULL, N'10309', N'UK')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10389, 10, 4, CAST(N'2006-12-20 00:00:00.000' AS DateTime), CAST(N'2007-01-17 00:00:00.000' AS DateTime), CAST(N'2006-12-24 00:00:00.000' AS DateTime), 2, 47.4200, N'Destination OLSSJ', N'2345 Tsawassen Blvd.', N'Tsawassen', N'BC', N'10130', N'Canada')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10390, 20, 6, CAST(N'2006-12-23 00:00:00.000' AS DateTime), CAST(N'2007-01-20 00:00:00.000' AS DateTime), CAST(N'2006-12-26 00:00:00.000' AS DateTime), 1, 126.3800, N'Destination RVDMF', N'Kirchgasse 9012', N'Graz', NULL, N'10157', N'Austria')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10391, 17, 3, CAST(N'2006-12-23 00:00:00.000' AS DateTime), CAST(N'2007-01-20 00:00:00.000' AS DateTime), CAST(N'2006-12-31 00:00:00.000' AS DateTime), 3, 5.4500, N'Destination AJTHX', N'Walserweg 9012', N'Aachen', NULL, N'10147', N'Germany')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10392, 59, 2, CAST(N'2006-12-24 00:00:00.000' AS DateTime), CAST(N'2007-01-21 00:00:00.000' AS DateTime), CAST(N'2007-01-01 00:00:00.000' AS DateTime), 3, 122.4600, N'Ship to 59-A', N'Geislweg 6789', N'Salzburg', NULL, N'10264', N'Austria')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10393, 71, 1, CAST(N'2006-12-25 00:00:00.000' AS DateTime), CAST(N'2007-01-22 00:00:00.000' AS DateTime), CAST(N'2007-01-03 00:00:00.000' AS DateTime), 3, 126.5600, N'Ship to 71-B', N'8901 Suffolk Ln.', N'Boise', N'ID', N'10306', N'USA')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10394, 36, 1, CAST(N'2006-12-25 00:00:00.000' AS DateTime), CAST(N'2007-01-22 00:00:00.000' AS DateTime), CAST(N'2007-01-03 00:00:00.000' AS DateTime), 3, 30.3400, N'Destination AWPJG', N'City Center Plaza 2345 Main St.', N'Elgin', N'OR', N'10200', N'USA')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10395, 35, 6, CAST(N'2006-12-26 00:00:00.000' AS DateTime), CAST(N'2007-01-23 00:00:00.000' AS DateTime), CAST(N'2007-01-03 00:00:00.000' AS DateTime), 1, 184.4100, N'Destination JYDLM', N'Carrera1234 con Ave. Carlos Soublette #8-35', N'San Cristóbal', N'Táchira', N'10199', N'Venezuela')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10396, 25, 1, CAST(N'2006-12-27 00:00:00.000' AS DateTime), CAST(N'2007-01-10 00:00:00.000' AS DateTime), CAST(N'2007-01-06 00:00:00.000' AS DateTime), 3, 135.3500, N'Destination VAPXU', N'Berliner Platz 0123', N'München', NULL, N'10168', N'Germany')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10397, 60, 5, CAST(N'2006-12-27 00:00:00.000' AS DateTime), CAST(N'2007-01-24 00:00:00.000' AS DateTime), CAST(N'2007-01-02 00:00:00.000' AS DateTime), 1, 60.2600, N'Ship to 60-A', N'Estrada da saúde n. 2345', N'Lisboa', NULL, N'10270', N'Portugal')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10398, 71, 2, CAST(N'2006-12-30 00:00:00.000' AS DateTime), CAST(N'2007-01-27 00:00:00.000' AS DateTime), CAST(N'2007-01-09 00:00:00.000' AS DateTime), 3, 89.1600, N'Ship to 71-C', N'9012 Suffolk Ln.', N'Boise', N'ID', N'10307', N'USA')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10399, 83, 8, CAST(N'2006-12-31 00:00:00.000' AS DateTime), CAST(N'2007-01-14 00:00:00.000' AS DateTime), CAST(N'2007-01-08 00:00:00.000' AS DateTime), 3, 27.3600, N'Ship to 83-C', N'Smagsloget 2345', N'Århus', NULL, N'10341', N'Denmark')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10400, 19, 1, CAST(N'2007-01-01 00:00:00.000' AS DateTime), CAST(N'2007-01-29 00:00:00.000' AS DateTime), CAST(N'2007-01-16 00:00:00.000' AS DateTime), 3, 83.9300, N'Destination BBMRT', N'4567 King George', N'London', NULL, N'10152', N'UK')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10401, 65, 1, CAST(N'2007-01-01 00:00:00.000' AS DateTime), CAST(N'2007-01-29 00:00:00.000' AS DateTime), CAST(N'2007-01-10 00:00:00.000' AS DateTime), 1, 12.5100, N'Ship to 65-A', N'7890 Milton Dr.', N'Albuquerque', N'NM', N'10285', N'USA')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10402, 20, 8, CAST(N'2007-01-02 00:00:00.000' AS DateTime), CAST(N'2007-02-13 00:00:00.000' AS DateTime), CAST(N'2007-01-10 00:00:00.000' AS DateTime), 2, 67.8800, N'Destination FFXKT', N'Kirchgasse 0123', N'Graz', NULL, N'10158', N'Austria')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10403, 20, 4, CAST(N'2007-01-03 00:00:00.000' AS DateTime), CAST(N'2007-01-31 00:00:00.000' AS DateTime), CAST(N'2007-01-09 00:00:00.000' AS DateTime), 3, 73.7900, N'Destination RVDMF', N'Kirchgasse 9012', N'Graz', NULL, N'10157', N'Austria')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10404, 49, 2, CAST(N'2007-01-03 00:00:00.000' AS DateTime), CAST(N'2007-01-31 00:00:00.000' AS DateTime), CAST(N'2007-01-08 00:00:00.000' AS DateTime), 1, 155.9700, N'Ship to 49-B', N'Via Ludovico il Moro 9012', N'Bergamo', NULL, N'10236', N'Italy')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10405, 47, 1, CAST(N'2007-01-06 00:00:00.000' AS DateTime), CAST(N'2007-02-03 00:00:00.000' AS DateTime), CAST(N'2007-01-22 00:00:00.000' AS DateTime), 1, 34.8200, N'Ship to 47-B', N'Ave. 5 de Mayo Porlamar 4567', N'I. de Margarita', N'Nueva Esparta', N'10231', N'Venezuela')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10406, 62, 7, CAST(N'2007-01-07 00:00:00.000' AS DateTime), CAST(N'2007-02-18 00:00:00.000' AS DateTime), CAST(N'2007-01-13 00:00:00.000' AS DateTime), 1, 108.0400, N'Ship to 62-A', N'Alameda dos Canàrios, 8901', N'Sao Paulo', N'SP', N'10276', N'Brazil')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10407, 56, 2, CAST(N'2007-01-07 00:00:00.000' AS DateTime), CAST(N'2007-02-04 00:00:00.000' AS DateTime), CAST(N'2007-01-30 00:00:00.000' AS DateTime), 2, 91.4800, N'Ship to 56-B', N'Mehrheimerstr. 1234', N'Köln', NULL, N'10259', N'Germany')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10408, 23, 8, CAST(N'2007-01-08 00:00:00.000' AS DateTime), CAST(N'2007-02-05 00:00:00.000' AS DateTime), CAST(N'2007-01-14 00:00:00.000' AS DateTime), 1, 11.2600, N'Destination PXQRR', N'5678, chaussée de Tournai', N'Lille', NULL, N'10163', N'France')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10409, 54, 3, CAST(N'2007-01-09 00:00:00.000' AS DateTime), CAST(N'2007-02-06 00:00:00.000' AS DateTime), CAST(N'2007-01-14 00:00:00.000' AS DateTime), 1, 29.8300, N'Ship to 54-C', N'Ing. Gustavo Moncada 6789 Piso 20-A', N'Buenos Aires', NULL, N'10254', N'Argentina')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10410, 10, 3, CAST(N'2007-01-10 00:00:00.000' AS DateTime), CAST(N'2007-02-07 00:00:00.000' AS DateTime), CAST(N'2007-01-15 00:00:00.000' AS DateTime), 3, 2.4000, N'Destination OLSSJ', N'2345 Tsawassen Blvd.', N'Tsawassen', N'BC', N'10130', N'Canada')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10411, 10, 9, CAST(N'2007-01-10 00:00:00.000' AS DateTime), CAST(N'2007-02-07 00:00:00.000' AS DateTime), CAST(N'2007-01-21 00:00:00.000' AS DateTime), 3, 23.6500, N'Destination XJIBQ', N'1234 Tsawassen Blvd.', N'Tsawassen', N'BC', N'10129', N'Canada')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10412, 87, 8, CAST(N'2007-01-13 00:00:00.000' AS DateTime), CAST(N'2007-02-10 00:00:00.000' AS DateTime), CAST(N'2007-01-15 00:00:00.000' AS DateTime), 2, 3.7700, N'Ship to 87-C', N'Torikatu 3456', N'Oulu', NULL, N'10352', N'Finland')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10413, 41, 3, CAST(N'2007-01-14 00:00:00.000' AS DateTime), CAST(N'2007-02-11 00:00:00.000' AS DateTime), CAST(N'2007-01-16 00:00:00.000' AS DateTime), 2, 95.6600, N'Destination DWJIO', N'9012 rue Alsace-Lorraine', N'Toulouse', NULL, N'10217', N'France')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10414, 21, 2, CAST(N'2007-01-14 00:00:00.000' AS DateTime), CAST(N'2007-02-11 00:00:00.000' AS DateTime), CAST(N'2007-01-17 00:00:00.000' AS DateTime), 3, 21.4800, N'Destination SSYXZ', N'Rua Orós, 3456', N'Sao Paulo', N'SP', N'10161', N'Brazil')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10415, 36, 3, CAST(N'2007-01-15 00:00:00.000' AS DateTime), CAST(N'2007-02-12 00:00:00.000' AS DateTime), CAST(N'2007-01-24 00:00:00.000' AS DateTime), 1, 0.2000, N'Destination AWPJG', N'City Center Plaza 2345 Main St.', N'Elgin', N'OR', N'10200', N'USA')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10416, 87, 8, CAST(N'2007-01-16 00:00:00.000' AS DateTime), CAST(N'2007-02-13 00:00:00.000' AS DateTime), CAST(N'2007-01-27 00:00:00.000' AS DateTime), 3, 22.7200, N'Ship to 87-A', N'Torikatu 1234', N'Oulu', NULL, N'10350', N'Finland')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10417, 73, 4, CAST(N'2007-01-16 00:00:00.000' AS DateTime), CAST(N'2007-02-13 00:00:00.000' AS DateTime), CAST(N'2007-01-28 00:00:00.000' AS DateTime), 3, 70.2900, N'Ship to 73-C', N'Vinbæltet 2345', N'Kobenhavn', NULL, N'10311', N'Denmark')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10418, 63, 4, CAST(N'2007-01-17 00:00:00.000' AS DateTime), CAST(N'2007-02-14 00:00:00.000' AS DateTime), CAST(N'2007-01-24 00:00:00.000' AS DateTime), 1, 17.5500, N'Ship to 63-B', N'Taucherstraße 2345', N'Cunewalde', NULL, N'10280', N'Germany')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10419, 68, 4, CAST(N'2007-01-20 00:00:00.000' AS DateTime), CAST(N'2007-02-17 00:00:00.000' AS DateTime), CAST(N'2007-01-30 00:00:00.000' AS DateTime), 2, 137.3500, N'Ship to 68-A', N'Starenweg 6789', N'Genève', NULL, N'10294', N'Switzerland')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10420, 88, 3, CAST(N'2007-01-21 00:00:00.000' AS DateTime), CAST(N'2007-02-18 00:00:00.000' AS DateTime), CAST(N'2007-01-27 00:00:00.000' AS DateTime), 1, 44.1200, N'Ship to 88-C', N'Rua do Mercado, 6789', N'Resende', N'SP', N'10355', N'Brazil')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10421, 61, 8, CAST(N'2007-01-21 00:00:00.000' AS DateTime), CAST(N'2007-03-04 00:00:00.000' AS DateTime), CAST(N'2007-01-27 00:00:00.000' AS DateTime), 1, 99.2300, N'Ship to 61-C', N'Rua da Panificadora, 7890', N'Rio de Janeiro', N'RJ', N'10275', N'Brazil')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10422, 27, 2, CAST(N'2007-01-22 00:00:00.000' AS DateTime), CAST(N'2007-02-19 00:00:00.000' AS DateTime), CAST(N'2007-01-31 00:00:00.000' AS DateTime), 1, 3.0200, N'Destination FFLQT', N'Via Monte Bianco 6789', N'Torino', NULL, N'10174', N'Italy')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10423, 31, 6, CAST(N'2007-01-23 00:00:00.000' AS DateTime), CAST(N'2007-02-06 00:00:00.000' AS DateTime), CAST(N'2007-02-24 00:00:00.000' AS DateTime), 3, 24.5000, N'Destination VNIAG', N'Av. Brasil, 9012', N'Campinas', N'SP', N'10187', N'Brazil')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10424, 51, 7, CAST(N'2007-01-23 00:00:00.000' AS DateTime), CAST(N'2007-02-20 00:00:00.000' AS DateTime), CAST(N'2007-01-27 00:00:00.000' AS DateTime), 2, 370.6100, N'Ship to 51-C', N'8901 rue St. Laurent', N'Montréal', N'Québec', N'10246', N'Canada')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10425, 41, 6, CAST(N'2007-01-24 00:00:00.000' AS DateTime), CAST(N'2007-02-21 00:00:00.000' AS DateTime), CAST(N'2007-02-14 00:00:00.000' AS DateTime), 2, 7.9300, N'Destination DWJIO', N'9012 rue Alsace-Lorraine', N'Toulouse', NULL, N'10217', N'France')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10426, 29, 4, CAST(N'2007-01-27 00:00:00.000' AS DateTime), CAST(N'2007-02-24 00:00:00.000' AS DateTime), CAST(N'2007-02-06 00:00:00.000' AS DateTime), 1, 18.6900, N'Destination WOFLH', N'Rambla de Cataluña, 1234', N'Barcelona', NULL, N'10179', N'Spain')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10427, 59, 4, CAST(N'2007-01-27 00:00:00.000' AS DateTime), CAST(N'2007-02-24 00:00:00.000' AS DateTime), CAST(N'2007-03-03 00:00:00.000' AS DateTime), 2, 31.2900, N'Ship to 59-C', N'Geislweg 8901', N'Salzburg', NULL, N'10266', N'Austria')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10428, 66, 7, CAST(N'2007-01-28 00:00:00.000' AS DateTime), CAST(N'2007-02-25 00:00:00.000' AS DateTime), CAST(N'2007-02-04 00:00:00.000' AS DateTime), 1, 11.0900, N'Ship to 66-C', N'Strada Provinciale 2345', N'Reggio Emilia', NULL, N'10290', N'Italy')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10429, 37, 3, CAST(N'2007-01-29 00:00:00.000' AS DateTime), CAST(N'2007-03-12 00:00:00.000' AS DateTime), CAST(N'2007-02-07 00:00:00.000' AS DateTime), 2, 56.6300, N'Destination DGKOU', N'6789 Johnstown Road', N'Cork', N'Co. Cork', N'10204', N'Ireland')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10430, 20, 4, CAST(N'2007-01-30 00:00:00.000' AS DateTime), CAST(N'2007-02-13 00:00:00.000' AS DateTime), CAST(N'2007-02-03 00:00:00.000' AS DateTime), 1, 458.7800, N'Destination CUVPF', N'Kirchgasse 1234', N'Graz', NULL, N'10159', N'Austria')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10431, 10, 4, CAST(N'2007-01-30 00:00:00.000' AS DateTime), CAST(N'2007-02-13 00:00:00.000' AS DateTime), CAST(N'2007-02-07 00:00:00.000' AS DateTime), 2, 44.1700, N'Destination OLSSJ', N'2345 Tsawassen Blvd.', N'Tsawassen', N'BC', N'10130', N'Canada')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10432, 75, 3, CAST(N'2007-01-31 00:00:00.000' AS DateTime), CAST(N'2007-02-14 00:00:00.000' AS DateTime), CAST(N'2007-02-07 00:00:00.000' AS DateTime), 2, 4.3400, N'Ship to 75-A', N'P.O. Box 5678', N'Lander', N'WY', N'10314', N'USA')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10433, 60, 3, CAST(N'2007-02-03 00:00:00.000' AS DateTime), CAST(N'2007-03-03 00:00:00.000' AS DateTime), CAST(N'2007-03-04 00:00:00.000' AS DateTime), 3, 73.8300, N'Ship to 60-A', N'Estrada da saúde n. 2345', N'Lisboa', NULL, N'10270', N'Portugal')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10434, 24, 3, CAST(N'2007-02-03 00:00:00.000' AS DateTime), CAST(N'2007-03-03 00:00:00.000' AS DateTime), CAST(N'2007-02-13 00:00:00.000' AS DateTime), 2, 17.9200, N'Destination NCKKO', N'Åkergatan 7890', N'Bräcke', NULL, N'10165', N'Sweden')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10435, 16, 8, CAST(N'2007-02-04 00:00:00.000' AS DateTime), CAST(N'2007-03-18 00:00:00.000' AS DateTime), CAST(N'2007-02-07 00:00:00.000' AS DateTime), 2, 9.2100, N'Destination QKQNB', N'Berkeley Gardens 5678  Brewery', N'London', NULL, N'10143', N'UK')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10436, 7, 3, CAST(N'2007-02-05 00:00:00.000' AS DateTime), CAST(N'2007-03-05 00:00:00.000' AS DateTime), CAST(N'2007-02-11 00:00:00.000' AS DateTime), 2, 156.6600, N'Ship to 7-C', N'2345, place Kléber', N'Strasbourg', NULL, N'10331', N'France')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10437, 87, 8, CAST(N'2007-02-05 00:00:00.000' AS DateTime), CAST(N'2007-03-05 00:00:00.000' AS DateTime), CAST(N'2007-02-12 00:00:00.000' AS DateTime), 1, 19.9700, N'Ship to 87-A', N'Torikatu 1234', N'Oulu', NULL, N'10350', N'Finland')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10438, 79, 3, CAST(N'2007-02-06 00:00:00.000' AS DateTime), CAST(N'2007-03-06 00:00:00.000' AS DateTime), CAST(N'2007-02-14 00:00:00.000' AS DateTime), 2, 8.2400, N'Ship to 79-A', N'Luisenstr. 7890', N'Münster', NULL, N'10326', N'Germany')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10439, 51, 6, CAST(N'2007-02-07 00:00:00.000' AS DateTime), CAST(N'2007-03-07 00:00:00.000' AS DateTime), CAST(N'2007-02-10 00:00:00.000' AS DateTime), 3, 4.0700, N'Ship to 51-C', N'8901 rue St. Laurent', N'Montréal', N'Québec', N'10246', N'Canada')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10440, 71, 4, CAST(N'2007-02-10 00:00:00.000' AS DateTime), CAST(N'2007-03-10 00:00:00.000' AS DateTime), CAST(N'2007-02-28 00:00:00.000' AS DateTime), 2, 86.5300, N'Ship to 71-B', N'8901 Suffolk Ln.', N'Boise', N'ID', N'10306', N'USA')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10441, 55, 3, CAST(N'2007-02-10 00:00:00.000' AS DateTime), CAST(N'2007-03-24 00:00:00.000' AS DateTime), CAST(N'2007-03-14 00:00:00.000' AS DateTime), 2, 73.0200, N'Ship to 55-C', N'9012 Bering St.', N'Anchorage', N'AK', N'10257', N'USA')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10442, 20, 3, CAST(N'2007-02-11 00:00:00.000' AS DateTime), CAST(N'2007-03-11 00:00:00.000' AS DateTime), CAST(N'2007-02-18 00:00:00.000' AS DateTime), 2, 47.9400, N'Destination RVDMF', N'Kirchgasse 9012', N'Graz', NULL, N'10157', N'Austria')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10443, 66, 8, CAST(N'2007-02-12 00:00:00.000' AS DateTime), CAST(N'2007-03-12 00:00:00.000' AS DateTime), CAST(N'2007-02-14 00:00:00.000' AS DateTime), 1, 13.9500, N'Ship to 66-C', N'Strada Provinciale 2345', N'Reggio Emilia', NULL, N'10290', N'Italy')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10444, 5, 3, CAST(N'2007-02-12 00:00:00.000' AS DateTime), CAST(N'2007-03-12 00:00:00.000' AS DateTime), CAST(N'2007-02-21 00:00:00.000' AS DateTime), 3, 3.5000, N'Ship to 5-B', N'Berguvsvägen  0123', N'Luleå', NULL, N'10268', N'Sweden')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10445, 5, 3, CAST(N'2007-02-13 00:00:00.000' AS DateTime), CAST(N'2007-03-13 00:00:00.000' AS DateTime), CAST(N'2007-02-20 00:00:00.000' AS DateTime), 1, 9.3000, N'Ship to 5-A', N'Berguvsvägen  9012', N'Luleå', NULL, N'10267', N'Sweden')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10446, 79, 6, CAST(N'2007-02-14 00:00:00.000' AS DateTime), CAST(N'2007-03-14 00:00:00.000' AS DateTime), CAST(N'2007-02-19 00:00:00.000' AS DateTime), 1, 14.6800, N'Ship to 79-C', N'Luisenstr. 9012', N'Münster', NULL, N'10328', N'Germany')
GO
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10447, 67, 4, CAST(N'2007-02-14 00:00:00.000' AS DateTime), CAST(N'2007-03-14 00:00:00.000' AS DateTime), CAST(N'2007-03-07 00:00:00.000' AS DateTime), 2, 68.6600, N'Ship to 67-C', N'Av. Copacabana, 5678', N'Rio de Janeiro', N'RJ', N'10293', N'Brazil')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10448, 64, 4, CAST(N'2007-02-17 00:00:00.000' AS DateTime), CAST(N'2007-03-17 00:00:00.000' AS DateTime), CAST(N'2007-02-24 00:00:00.000' AS DateTime), 2, 38.8200, N'Ship to 64-A', N'Av. del Libertador 4567', N'Buenos Aires', NULL, N'10282', N'Argentina')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10449, 7, 3, CAST(N'2007-02-18 00:00:00.000' AS DateTime), CAST(N'2007-03-18 00:00:00.000' AS DateTime), CAST(N'2007-02-27 00:00:00.000' AS DateTime), 2, 53.3000, N'Ship to 7-C', N'2345, place Kléber', N'Strasbourg', NULL, N'10331', N'France')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10450, 84, 8, CAST(N'2007-02-19 00:00:00.000' AS DateTime), CAST(N'2007-03-19 00:00:00.000' AS DateTime), CAST(N'2007-03-11 00:00:00.000' AS DateTime), 2, 7.2300, N'Ship to 84-C', N'5678, rue du Commerce', N'Lyon', NULL, N'10344', N'France')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10451, 63, 4, CAST(N'2007-02-19 00:00:00.000' AS DateTime), CAST(N'2007-03-05 00:00:00.000' AS DateTime), CAST(N'2007-03-12 00:00:00.000' AS DateTime), 3, 189.0900, N'Ship to 63-C', N'Taucherstraße 3456', N'Cunewalde', NULL, N'10281', N'Germany')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10452, 71, 8, CAST(N'2007-02-20 00:00:00.000' AS DateTime), CAST(N'2007-03-20 00:00:00.000' AS DateTime), CAST(N'2007-02-26 00:00:00.000' AS DateTime), 1, 140.2600, N'Ship to 71-B', N'8901 Suffolk Ln.', N'Boise', N'ID', N'10306', N'USA')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10453, 4, 1, CAST(N'2007-02-21 00:00:00.000' AS DateTime), CAST(N'2007-03-21 00:00:00.000' AS DateTime), CAST(N'2007-02-26 00:00:00.000' AS DateTime), 2, 25.3600, N'Ship to 4-C', N'Brook Farm Stratford St. Mary 2345', N'Colchester', N'Essex', N'10240', N'UK')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10454, 41, 4, CAST(N'2007-02-21 00:00:00.000' AS DateTime), CAST(N'2007-03-21 00:00:00.000' AS DateTime), CAST(N'2007-02-25 00:00:00.000' AS DateTime), 3, 2.7400, N'Ship to 41-C', N'0123 rue Alsace-Lorraine', N'Toulouse', NULL, N'10218', N'France')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10455, 87, 8, CAST(N'2007-02-24 00:00:00.000' AS DateTime), CAST(N'2007-04-07 00:00:00.000' AS DateTime), CAST(N'2007-03-03 00:00:00.000' AS DateTime), 2, 180.4500, N'Ship to 87-B', N'Torikatu 2345', N'Oulu', NULL, N'10351', N'Finland')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10456, 39, 8, CAST(N'2007-02-25 00:00:00.000' AS DateTime), CAST(N'2007-04-08 00:00:00.000' AS DateTime), CAST(N'2007-02-28 00:00:00.000' AS DateTime), 2, 8.1200, N'Destination DKMQA', N'Maubelstr. 0123', N'Brandenburg', NULL, N'10208', N'Germany')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10457, 39, 2, CAST(N'2007-02-25 00:00:00.000' AS DateTime), CAST(N'2007-03-25 00:00:00.000' AS DateTime), CAST(N'2007-03-03 00:00:00.000' AS DateTime), 1, 11.5700, N'Destination RMBHM', N'Maubelstr. 1234', N'Brandenburg', NULL, N'10209', N'Germany')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10458, 76, 7, CAST(N'2007-02-26 00:00:00.000' AS DateTime), CAST(N'2007-03-26 00:00:00.000' AS DateTime), CAST(N'2007-03-04 00:00:00.000' AS DateTime), 3, 147.0600, N'Ship to 76-A', N'Boulevard Tirou, 8901', N'Charleroi', NULL, N'10317', N'Belgium')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10459, 84, 4, CAST(N'2007-02-27 00:00:00.000' AS DateTime), CAST(N'2007-03-27 00:00:00.000' AS DateTime), CAST(N'2007-02-28 00:00:00.000' AS DateTime), 2, 25.0900, N'Ship to 84-B', N'4567, rue du Commerce', N'Lyon', NULL, N'10343', N'France')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10460, 24, 8, CAST(N'2007-02-28 00:00:00.000' AS DateTime), CAST(N'2007-03-28 00:00:00.000' AS DateTime), CAST(N'2007-03-03 00:00:00.000' AS DateTime), 1, 16.2700, N'Destination YCMPK', N'Åkergatan 8901', N'Bräcke', NULL, N'10166', N'Sweden')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10461, 46, 1, CAST(N'2007-02-28 00:00:00.000' AS DateTime), CAST(N'2007-03-28 00:00:00.000' AS DateTime), CAST(N'2007-03-05 00:00:00.000' AS DateTime), 3, 148.6100, N'Ship to 46-A', N'Carrera 0123 con Ave. Bolívar #65-98 Llano Largo', N'Barquisimeto', N'Lara', N'10227', N'Venezuela')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10462, 16, 2, CAST(N'2007-03-03 00:00:00.000' AS DateTime), CAST(N'2007-03-31 00:00:00.000' AS DateTime), CAST(N'2007-03-18 00:00:00.000' AS DateTime), 1, 6.1700, N'Destination ARRMM', N'Berkeley Gardens 6789  Brewery', N'London', NULL, N'10144', N'UK')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10463, 76, 5, CAST(N'2007-03-04 00:00:00.000' AS DateTime), CAST(N'2007-04-01 00:00:00.000' AS DateTime), CAST(N'2007-03-06 00:00:00.000' AS DateTime), 3, 14.7800, N'Ship to 76-B', N'Boulevard Tirou, 9012', N'Charleroi', NULL, N'10318', N'Belgium')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10464, 28, 4, CAST(N'2007-03-04 00:00:00.000' AS DateTime), CAST(N'2007-04-01 00:00:00.000' AS DateTime), CAST(N'2007-03-14 00:00:00.000' AS DateTime), 2, 89.0000, N'Destination OTSWR', N'Jardim das rosas n. 9012', N'Lisboa', NULL, N'10177', N'Portugal')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10465, 83, 1, CAST(N'2007-03-05 00:00:00.000' AS DateTime), CAST(N'2007-04-02 00:00:00.000' AS DateTime), CAST(N'2007-03-14 00:00:00.000' AS DateTime), 3, 145.0400, N'Ship to 83-A', N'Smagsloget 0123', N'Århus', NULL, N'10339', N'Denmark')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10466, 15, 4, CAST(N'2007-03-06 00:00:00.000' AS DateTime), CAST(N'2007-04-03 00:00:00.000' AS DateTime), CAST(N'2007-03-13 00:00:00.000' AS DateTime), 1, 11.9300, N'Destination GGSQD', N'Av. dos Lusíadas, 2345', N'Sao Paulo', N'SP', N'10140', N'Brazil')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10467, 49, 8, CAST(N'2007-03-06 00:00:00.000' AS DateTime), CAST(N'2007-04-03 00:00:00.000' AS DateTime), CAST(N'2007-03-11 00:00:00.000' AS DateTime), 2, 4.9300, N'Ship to 49-C', N'Via Ludovico il Moro 0123', N'Bergamo', NULL, N'10237', N'Italy')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10468, 39, 3, CAST(N'2007-03-07 00:00:00.000' AS DateTime), CAST(N'2007-04-04 00:00:00.000' AS DateTime), CAST(N'2007-03-12 00:00:00.000' AS DateTime), 3, 44.1200, N'Destination RMBHM', N'Maubelstr. 1234', N'Brandenburg', NULL, N'10209', N'Germany')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10469, 89, 1, CAST(N'2007-03-10 00:00:00.000' AS DateTime), CAST(N'2007-04-07 00:00:00.000' AS DateTime), CAST(N'2007-03-14 00:00:00.000' AS DateTime), 1, 60.1800, N'Ship to 89-C', N'9012 - 12th Ave. S.', N'Seattle', N'WA', N'10358', N'USA')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10470, 9, 4, CAST(N'2007-03-11 00:00:00.000' AS DateTime), CAST(N'2007-04-08 00:00:00.000' AS DateTime), CAST(N'2007-03-14 00:00:00.000' AS DateTime), 2, 64.5600, N'Ship to 9-C', N'0123, rue des Bouchers', N'Marseille', NULL, N'10369', N'France')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10471, 11, 2, CAST(N'2007-03-11 00:00:00.000' AS DateTime), CAST(N'2007-04-08 00:00:00.000' AS DateTime), CAST(N'2007-03-18 00:00:00.000' AS DateTime), 3, 45.5900, N'Destination NZASL', N'Fauntleroy Circus 5678', N'London', NULL, N'10133', N'UK')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10472, 72, 8, CAST(N'2007-03-12 00:00:00.000' AS DateTime), CAST(N'2007-04-09 00:00:00.000' AS DateTime), CAST(N'2007-03-19 00:00:00.000' AS DateTime), 1, 4.2000, N'Ship to 72-A', N'0123 Wadhurst Rd.', N'London', NULL, N'10308', N'UK')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10473, 38, 1, CAST(N'2007-03-13 00:00:00.000' AS DateTime), CAST(N'2007-03-27 00:00:00.000' AS DateTime), CAST(N'2007-03-21 00:00:00.000' AS DateTime), 3, 16.3700, N'Destination AXVHD', N'Garden House Crowther Way 9012', N'Cowes', N'Isle of Wight', N'10207', N'UK')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10474, 58, 5, CAST(N'2007-03-13 00:00:00.000' AS DateTime), CAST(N'2007-04-10 00:00:00.000' AS DateTime), CAST(N'2007-03-21 00:00:00.000' AS DateTime), 2, 83.4900, N'Ship to 58-C', N'Calle Dr. Jorge Cash 5678', N'México D.F.', NULL, N'10263', N'Mexico')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10475, 76, 9, CAST(N'2007-03-14 00:00:00.000' AS DateTime), CAST(N'2007-04-11 00:00:00.000' AS DateTime), CAST(N'2007-04-04 00:00:00.000' AS DateTime), 1, 68.5200, N'Ship to 76-C', N'Boulevard Tirou, 0123', N'Charleroi', NULL, N'10319', N'Belgium')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10476, 35, 8, CAST(N'2007-03-17 00:00:00.000' AS DateTime), CAST(N'2007-04-14 00:00:00.000' AS DateTime), CAST(N'2007-03-24 00:00:00.000' AS DateTime), 3, 4.4100, N'Destination SXYQX', N'Carrera 0123 con Ave. Carlos Soublette #8-35', N'San Cristóbal', N'Táchira', N'10198', N'Venezuela')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10477, 60, 5, CAST(N'2007-03-17 00:00:00.000' AS DateTime), CAST(N'2007-04-14 00:00:00.000' AS DateTime), CAST(N'2007-03-25 00:00:00.000' AS DateTime), 2, 13.0200, N'Ship to 60-A', N'Estrada da saúde n. 2345', N'Lisboa', NULL, N'10270', N'Portugal')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10478, 84, 2, CAST(N'2007-03-18 00:00:00.000' AS DateTime), CAST(N'2007-04-01 00:00:00.000' AS DateTime), CAST(N'2007-03-26 00:00:00.000' AS DateTime), 3, 4.8100, N'Ship to 84-C', N'5678, rue du Commerce', N'Lyon', NULL, N'10344', N'France')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10479, 65, 3, CAST(N'2007-03-19 00:00:00.000' AS DateTime), CAST(N'2007-04-16 00:00:00.000' AS DateTime), CAST(N'2007-03-21 00:00:00.000' AS DateTime), 3, 708.9500, N'Ship to 65-C', N'9012 Milton Dr.', N'Albuquerque', N'NM', N'10287', N'USA')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10480, 23, 6, CAST(N'2007-03-20 00:00:00.000' AS DateTime), CAST(N'2007-04-17 00:00:00.000' AS DateTime), CAST(N'2007-03-24 00:00:00.000' AS DateTime), 2, 1.3500, N'Destination AGPCO', N'6789, chaussée de Tournai', N'Lille', NULL, N'10164', N'France')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10481, 67, 8, CAST(N'2007-03-20 00:00:00.000' AS DateTime), CAST(N'2007-04-17 00:00:00.000' AS DateTime), CAST(N'2007-03-25 00:00:00.000' AS DateTime), 2, 64.3300, N'Ship to 67-A', N'Av. Copacabana, 3456', N'Rio de Janeiro', N'RJ', N'10291', N'Brazil')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10482, 43, 1, CAST(N'2007-03-21 00:00:00.000' AS DateTime), CAST(N'2007-04-18 00:00:00.000' AS DateTime), CAST(N'2007-04-10 00:00:00.000' AS DateTime), 3, 7.4800, N'Ship to 43-B', N'3456 Orchestra Terrace', N'Walla Walla', N'WA', N'10221', N'USA')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10483, 89, 7, CAST(N'2007-03-24 00:00:00.000' AS DateTime), CAST(N'2007-04-21 00:00:00.000' AS DateTime), CAST(N'2007-04-25 00:00:00.000' AS DateTime), 2, 15.2800, N'Ship to 89-A', N'7890 - 12th Ave. S.', N'Seattle', N'WA', N'10356', N'USA')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10484, 11, 3, CAST(N'2007-03-24 00:00:00.000' AS DateTime), CAST(N'2007-04-21 00:00:00.000' AS DateTime), CAST(N'2007-04-01 00:00:00.000' AS DateTime), 3, 6.8800, N'Destination DLEUN', N'Fauntleroy Circus 4567', N'London', NULL, N'10132', N'UK')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10485, 47, 4, CAST(N'2007-03-25 00:00:00.000' AS DateTime), CAST(N'2007-04-08 00:00:00.000' AS DateTime), CAST(N'2007-03-31 00:00:00.000' AS DateTime), 2, 64.4500, N'Ship to 47-B', N'Ave. 5 de Mayo Porlamar 4567', N'I. de Margarita', N'Nueva Esparta', N'10231', N'Venezuela')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10486, 35, 1, CAST(N'2007-03-26 00:00:00.000' AS DateTime), CAST(N'2007-04-23 00:00:00.000' AS DateTime), CAST(N'2007-04-02 00:00:00.000' AS DateTime), 2, 30.5300, N'Destination UOUWK', N'Carrera 9012 con Ave. Carlos Soublette #8-35', N'San Cristóbal', N'Táchira', N'10197', N'Venezuela')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10487, 62, 2, CAST(N'2007-03-26 00:00:00.000' AS DateTime), CAST(N'2007-04-23 00:00:00.000' AS DateTime), CAST(N'2007-03-28 00:00:00.000' AS DateTime), 2, 71.0700, N'Ship to 62-B', N'Alameda dos Canàrios, 9012', N'Sao Paulo', N'SP', N'10277', N'Brazil')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10488, 25, 8, CAST(N'2007-03-27 00:00:00.000' AS DateTime), CAST(N'2007-04-24 00:00:00.000' AS DateTime), CAST(N'2007-04-02 00:00:00.000' AS DateTime), 2, 4.9300, N'Destination VAPXU', N'Berliner Platz 0123', N'München', NULL, N'10168', N'Germany')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10489, 59, 6, CAST(N'2007-03-28 00:00:00.000' AS DateTime), CAST(N'2007-04-25 00:00:00.000' AS DateTime), CAST(N'2007-04-09 00:00:00.000' AS DateTime), 2, 5.2900, N'Ship to 59-C', N'Geislweg 8901', N'Salzburg', NULL, N'10266', N'Austria')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10490, 35, 7, CAST(N'2007-03-31 00:00:00.000' AS DateTime), CAST(N'2007-04-28 00:00:00.000' AS DateTime), CAST(N'2007-04-03 00:00:00.000' AS DateTime), 2, 210.1900, N'Destination JYDLM', N'Carrera1234 con Ave. Carlos Soublette #8-35', N'San Cristóbal', N'Táchira', N'10199', N'Venezuela')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10491, 28, 8, CAST(N'2007-03-31 00:00:00.000' AS DateTime), CAST(N'2007-04-28 00:00:00.000' AS DateTime), CAST(N'2007-04-08 00:00:00.000' AS DateTime), 3, 16.9600, N'Destination OTSWR', N'Jardim das rosas n. 9012', N'Lisboa', NULL, N'10177', N'Portugal')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10492, 10, 3, CAST(N'2007-04-01 00:00:00.000' AS DateTime), CAST(N'2007-04-29 00:00:00.000' AS DateTime), CAST(N'2007-04-11 00:00:00.000' AS DateTime), 1, 62.8900, N'Destination XJIBQ', N'1234 Tsawassen Blvd.', N'Tsawassen', N'BC', N'10129', N'Canada')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10493, 41, 4, CAST(N'2007-04-02 00:00:00.000' AS DateTime), CAST(N'2007-04-30 00:00:00.000' AS DateTime), CAST(N'2007-04-10 00:00:00.000' AS DateTime), 3, 10.6400, N'Destination OLJND', N'8901 rue Alsace-Lorraine', N'Toulouse', NULL, N'10216', N'France')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10494, 15, 4, CAST(N'2007-04-02 00:00:00.000' AS DateTime), CAST(N'2007-04-30 00:00:00.000' AS DateTime), CAST(N'2007-04-09 00:00:00.000' AS DateTime), 2, 65.9900, N'Destination EVHYA', N'Av. dos Lusíadas, 3456', N'Sao Paulo', N'SP', N'10141', N'Brazil')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10495, 42, 3, CAST(N'2007-04-03 00:00:00.000' AS DateTime), CAST(N'2007-05-01 00:00:00.000' AS DateTime), CAST(N'2007-04-11 00:00:00.000' AS DateTime), 3, 4.6500, N'Ship to 42-C', N'2345 Elm St.', N'Vancouver', N'BC', N'10220', N'Canada')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10496, 81, 7, CAST(N'2007-04-04 00:00:00.000' AS DateTime), CAST(N'2007-05-02 00:00:00.000' AS DateTime), CAST(N'2007-04-07 00:00:00.000' AS DateTime), 2, 46.7700, N'Ship to 81-C', N'Av. Inês de Castro, 7890', N'Sao Paulo', N'SP', N'10336', N'Brazil')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10497, 44, 7, CAST(N'2007-04-04 00:00:00.000' AS DateTime), CAST(N'2007-05-02 00:00:00.000' AS DateTime), CAST(N'2007-04-07 00:00:00.000' AS DateTime), 1, 36.2100, N'Ship to 44-A', N'Magazinweg 4567', N'Frankfurt a.M.', NULL, N'10222', N'Germany')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10498, 35, 8, CAST(N'2007-04-07 00:00:00.000' AS DateTime), CAST(N'2007-05-05 00:00:00.000' AS DateTime), CAST(N'2007-04-11 00:00:00.000' AS DateTime), 2, 29.7500, N'Destination SXYQX', N'Carrera 0123 con Ave. Carlos Soublette #8-35', N'San Cristóbal', N'Táchira', N'10198', N'Venezuela')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10499, 46, 4, CAST(N'2007-04-08 00:00:00.000' AS DateTime), CAST(N'2007-05-06 00:00:00.000' AS DateTime), CAST(N'2007-04-16 00:00:00.000' AS DateTime), 2, 102.0200, N'Ship to 46-C', N'Carrera 2345 con Ave. Bolívar #65-98 Llano Largo', N'Barquisimeto', N'Lara', N'10229', N'Venezuela')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10500, 41, 6, CAST(N'2007-04-09 00:00:00.000' AS DateTime), CAST(N'2007-05-07 00:00:00.000' AS DateTime), CAST(N'2007-04-17 00:00:00.000' AS DateTime), 1, 42.6800, N'Destination OLJND', N'8901 rue Alsace-Lorraine', N'Toulouse', NULL, N'10216', N'France')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10501, 6, 9, CAST(N'2007-04-09 00:00:00.000' AS DateTime), CAST(N'2007-05-07 00:00:00.000' AS DateTime), CAST(N'2007-04-16 00:00:00.000' AS DateTime), 3, 8.8500, N'Ship to 6-C', N'Forsterstr. 4567', N'Mannheim', NULL, N'10302', N'Germany')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10502, 58, 2, CAST(N'2007-04-10 00:00:00.000' AS DateTime), CAST(N'2007-05-08 00:00:00.000' AS DateTime), CAST(N'2007-04-29 00:00:00.000' AS DateTime), 1, 69.3200, N'Ship to 58-B', N'Calle Dr. Jorge Cash 4567', N'México D.F.', NULL, N'10262', N'Mexico')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10503, 37, 6, CAST(N'2007-04-11 00:00:00.000' AS DateTime), CAST(N'2007-05-09 00:00:00.000' AS DateTime), CAST(N'2007-04-16 00:00:00.000' AS DateTime), 2, 16.7400, N'Destination ATSOA', N'4567 Johnstown Road', N'Cork', N'Co. Cork', N'10202', N'Ireland')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10504, 89, 4, CAST(N'2007-04-11 00:00:00.000' AS DateTime), CAST(N'2007-05-09 00:00:00.000' AS DateTime), CAST(N'2007-04-18 00:00:00.000' AS DateTime), 3, 59.1300, N'Ship to 89-B', N'8901 - 12th Ave. S.', N'Seattle', N'WA', N'10357', N'USA')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10505, 51, 3, CAST(N'2007-04-14 00:00:00.000' AS DateTime), CAST(N'2007-05-12 00:00:00.000' AS DateTime), CAST(N'2007-04-21 00:00:00.000' AS DateTime), 3, 7.1300, N'Ship to 51-B', N'7890 rue St. Laurent', N'Montréal', N'Québec', N'10245', N'Canada')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10506, 39, 9, CAST(N'2007-04-15 00:00:00.000' AS DateTime), CAST(N'2007-05-13 00:00:00.000' AS DateTime), CAST(N'2007-05-02 00:00:00.000' AS DateTime), 2, 21.1900, N'Destination DKMQA', N'Maubelstr. 0123', N'Brandenburg', NULL, N'10208', N'Germany')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10507, 3, 7, CAST(N'2007-04-15 00:00:00.000' AS DateTime), CAST(N'2007-05-13 00:00:00.000' AS DateTime), CAST(N'2007-04-22 00:00:00.000' AS DateTime), 1, 47.4500, N'Destination FQFLS', N'Mataderos  3456', N'México D.F.', NULL, N'10211', N'Mexico')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10508, 56, 1, CAST(N'2007-04-16 00:00:00.000' AS DateTime), CAST(N'2007-05-14 00:00:00.000' AS DateTime), CAST(N'2007-05-13 00:00:00.000' AS DateTime), 2, 4.9900, N'Ship to 56-C', N'Mehrheimerstr. 2345', N'Köln', NULL, N'10260', N'Germany')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10509, 6, 4, CAST(N'2007-04-17 00:00:00.000' AS DateTime), CAST(N'2007-05-15 00:00:00.000' AS DateTime), CAST(N'2007-04-29 00:00:00.000' AS DateTime), 1, 0.1500, N'Ship to 6-A', N'Forsterstr. 2345', N'Mannheim', NULL, N'10300', N'Germany')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10510, 71, 6, CAST(N'2007-04-18 00:00:00.000' AS DateTime), CAST(N'2007-05-16 00:00:00.000' AS DateTime), CAST(N'2007-04-28 00:00:00.000' AS DateTime), 3, 367.6300, N'Ship to 71-A', N'7890 Suffolk Ln.', N'Boise', N'ID', N'10305', N'USA')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10511, 9, 4, CAST(N'2007-04-18 00:00:00.000' AS DateTime), CAST(N'2007-05-16 00:00:00.000' AS DateTime), CAST(N'2007-04-21 00:00:00.000' AS DateTime), 3, 350.6400, N'Ship to 9-B', N'9012, rue des Bouchers', N'Marseille', NULL, N'10368', N'France')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10512, 21, 7, CAST(N'2007-04-21 00:00:00.000' AS DateTime), CAST(N'2007-05-19 00:00:00.000' AS DateTime), CAST(N'2007-04-24 00:00:00.000' AS DateTime), 2, 3.5300, N'Destination RNSMS', N'Rua Orós, 2345', N'Sao Paulo', N'SP', N'10160', N'Brazil')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10513, 86, 7, CAST(N'2007-04-22 00:00:00.000' AS DateTime), CAST(N'2007-06-03 00:00:00.000' AS DateTime), CAST(N'2007-04-28 00:00:00.000' AS DateTime), 1, 105.6500, N'Ship to 86-A', N'Adenauerallee 8901', N'Stuttgart', NULL, N'10347', N'Germany')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10514, 20, 3, CAST(N'2007-04-22 00:00:00.000' AS DateTime), CAST(N'2007-05-20 00:00:00.000' AS DateTime), CAST(N'2007-05-16 00:00:00.000' AS DateTime), 2, 789.9500, N'Destination CUVPF', N'Kirchgasse 1234', N'Graz', NULL, N'10159', N'Austria')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10515, 63, 2, CAST(N'2007-04-23 00:00:00.000' AS DateTime), CAST(N'2007-05-07 00:00:00.000' AS DateTime), CAST(N'2007-05-23 00:00:00.000' AS DateTime), 1, 204.4700, N'Ship to 63-B', N'Taucherstraße 2345', N'Cunewalde', NULL, N'10280', N'Germany')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10516, 37, 2, CAST(N'2007-04-24 00:00:00.000' AS DateTime), CAST(N'2007-05-22 00:00:00.000' AS DateTime), CAST(N'2007-05-01 00:00:00.000' AS DateTime), 3, 62.7800, N'Destination DGKOU', N'6789 Johnstown Road', N'Cork', N'Co. Cork', N'10204', N'Ireland')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10517, 53, 3, CAST(N'2007-04-24 00:00:00.000' AS DateTime), CAST(N'2007-05-22 00:00:00.000' AS DateTime), CAST(N'2007-04-29 00:00:00.000' AS DateTime), 3, 32.0700, N'Ship to 53-A', N'South House 2345 Queensbridge', N'London', NULL, N'10250', N'UK')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10518, 80, 4, CAST(N'2007-04-25 00:00:00.000' AS DateTime), CAST(N'2007-05-09 00:00:00.000' AS DateTime), CAST(N'2007-05-05 00:00:00.000' AS DateTime), 2, 218.1500, N'Ship to 80-B', N'Avda. Azteca 4567', N'México D.F.', NULL, N'10333', N'Mexico')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10519, 14, 6, CAST(N'2007-04-28 00:00:00.000' AS DateTime), CAST(N'2007-05-26 00:00:00.000' AS DateTime), CAST(N'2007-05-01 00:00:00.000' AS DateTime), 3, 91.7600, N'Destination NRTZZ', N'Hauptstr. 0123', N'Bern', NULL, N'10138', N'Switzerland')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10520, 70, 7, CAST(N'2007-04-29 00:00:00.000' AS DateTime), CAST(N'2007-05-27 00:00:00.000' AS DateTime), CAST(N'2007-05-01 00:00:00.000' AS DateTime), 1, 13.3700, N'Ship to 70-B', N'Erling Skakkes gate 5678', N'Stavern', NULL, N'10303', N'Norway')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10521, 12, 8, CAST(N'2007-04-29 00:00:00.000' AS DateTime), CAST(N'2007-05-27 00:00:00.000' AS DateTime), CAST(N'2007-05-02 00:00:00.000' AS DateTime), 2, 17.2200, N'Destination QTHBC', N'Cerrito 6789', N'Buenos Aires', NULL, N'10134', N'Argentina')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10522, 44, 4, CAST(N'2007-04-30 00:00:00.000' AS DateTime), CAST(N'2007-05-28 00:00:00.000' AS DateTime), CAST(N'2007-05-06 00:00:00.000' AS DateTime), 1, 45.3300, N'Ship to 44-A', N'Magazinweg 4567', N'Frankfurt a.M.', NULL, N'10222', N'Germany')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10523, 72, 7, CAST(N'2007-05-01 00:00:00.000' AS DateTime), CAST(N'2007-05-29 00:00:00.000' AS DateTime), CAST(N'2007-05-30 00:00:00.000' AS DateTime), 2, 77.6300, N'Ship to 72-C', N'1234 Wadhurst Rd.', N'London', NULL, N'10309', N'UK')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10524, 5, 1, CAST(N'2007-05-01 00:00:00.000' AS DateTime), CAST(N'2007-05-29 00:00:00.000' AS DateTime), CAST(N'2007-05-07 00:00:00.000' AS DateTime), 2, 244.7900, N'Ship to 5-A', N'Berguvsvägen  9012', N'Luleå', NULL, N'10267', N'Sweden')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10525, 9, 1, CAST(N'2007-05-02 00:00:00.000' AS DateTime), CAST(N'2007-05-30 00:00:00.000' AS DateTime), CAST(N'2007-05-23 00:00:00.000' AS DateTime), 2, 11.0600, N'Ship to 9-B', N'9012, rue des Bouchers', N'Marseille', NULL, N'10368', N'France')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10526, 87, 4, CAST(N'2007-05-05 00:00:00.000' AS DateTime), CAST(N'2007-06-02 00:00:00.000' AS DateTime), CAST(N'2007-05-15 00:00:00.000' AS DateTime), 2, 58.5900, N'Ship to 87-C', N'Torikatu 3456', N'Oulu', NULL, N'10352', N'Finland')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10527, 63, 7, CAST(N'2007-05-05 00:00:00.000' AS DateTime), CAST(N'2007-06-02 00:00:00.000' AS DateTime), CAST(N'2007-05-07 00:00:00.000' AS DateTime), 1, 41.9000, N'Ship to 63-B', N'Taucherstraße 2345', N'Cunewalde', NULL, N'10280', N'Germany')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10528, 32, 6, CAST(N'2007-05-06 00:00:00.000' AS DateTime), CAST(N'2007-05-20 00:00:00.000' AS DateTime), CAST(N'2007-05-09 00:00:00.000' AS DateTime), 2, 3.3500, N'Destination LLUXZ', N'1234 Baker Blvd.', N'Eugene', N'OR', N'10189', N'USA')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10529, 50, 5, CAST(N'2007-05-07 00:00:00.000' AS DateTime), CAST(N'2007-06-04 00:00:00.000' AS DateTime), CAST(N'2007-05-09 00:00:00.000' AS DateTime), 2, 66.6900, N'Ship to 50-B', N'Rue Joseph-Bens 4567', N'Bruxelles', NULL, N'10242', N'Belgium')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10530, 59, 3, CAST(N'2007-05-08 00:00:00.000' AS DateTime), CAST(N'2007-06-05 00:00:00.000' AS DateTime), CAST(N'2007-05-12 00:00:00.000' AS DateTime), 2, 339.2200, N'Ship to 59-C', N'Geislweg 8901', N'Salzburg', NULL, N'10266', N'Austria')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10531, 54, 7, CAST(N'2007-05-08 00:00:00.000' AS DateTime), CAST(N'2007-06-05 00:00:00.000' AS DateTime), CAST(N'2007-05-19 00:00:00.000' AS DateTime), 1, 8.1200, N'Ship to 54-A', N'Ing. Gustavo Moncada 4567 Piso 20-A', N'Buenos Aires', NULL, N'10252', N'Argentina')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10532, 19, 7, CAST(N'2007-05-09 00:00:00.000' AS DateTime), CAST(N'2007-06-06 00:00:00.000' AS DateTime), CAST(N'2007-05-12 00:00:00.000' AS DateTime), 3, 74.4600, N'Destination QTKCU', N'3456 King George', N'London', NULL, N'10151', N'UK')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10533, 24, 8, CAST(N'2007-05-12 00:00:00.000' AS DateTime), CAST(N'2007-06-09 00:00:00.000' AS DateTime), CAST(N'2007-05-22 00:00:00.000' AS DateTime), 1, 188.0400, N'Destination KBSBN', N'Åkergatan 9012', N'Bräcke', NULL, N'10167', N'Sweden')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10534, 44, 8, CAST(N'2007-05-12 00:00:00.000' AS DateTime), CAST(N'2007-06-09 00:00:00.000' AS DateTime), CAST(N'2007-05-14 00:00:00.000' AS DateTime), 2, 27.9400, N'Ship to 44-A', N'Magazinweg 4567', N'Frankfurt a.M.', NULL, N'10222', N'Germany')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10535, 3, 4, CAST(N'2007-05-13 00:00:00.000' AS DateTime), CAST(N'2007-06-10 00:00:00.000' AS DateTime), CAST(N'2007-05-21 00:00:00.000' AS DateTime), 1, 15.6400, N'Destination FQFLS', N'Mataderos  3456', N'México D.F.', NULL, N'10211', N'Mexico')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10536, 44, 3, CAST(N'2007-05-14 00:00:00.000' AS DateTime), CAST(N'2007-06-11 00:00:00.000' AS DateTime), CAST(N'2007-06-06 00:00:00.000' AS DateTime), 2, 58.8800, N'Ship to 44-B', N'Magazinweg 5678', N'Frankfurt a.M.', NULL, N'10223', N'Germany')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10537, 68, 1, CAST(N'2007-05-14 00:00:00.000' AS DateTime), CAST(N'2007-05-28 00:00:00.000' AS DateTime), CAST(N'2007-05-19 00:00:00.000' AS DateTime), 1, 78.8500, N'Ship to 68-B', N'Starenweg 7890', N'Genève', NULL, N'10295', N'Switzerland')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10538, 11, 9, CAST(N'2007-05-15 00:00:00.000' AS DateTime), CAST(N'2007-06-12 00:00:00.000' AS DateTime), CAST(N'2007-05-16 00:00:00.000' AS DateTime), 3, 4.8700, N'Destination DLEUN', N'Fauntleroy Circus 4567', N'London', NULL, N'10132', N'UK')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10539, 11, 6, CAST(N'2007-05-16 00:00:00.000' AS DateTime), CAST(N'2007-06-13 00:00:00.000' AS DateTime), CAST(N'2007-05-23 00:00:00.000' AS DateTime), 3, 12.3600, N'Destination DLEUN', N'Fauntleroy Circus 4567', N'London', NULL, N'10132', N'UK')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10540, 63, 3, CAST(N'2007-05-19 00:00:00.000' AS DateTime), CAST(N'2007-06-16 00:00:00.000' AS DateTime), CAST(N'2007-06-13 00:00:00.000' AS DateTime), 3, 1007.6400, N'Ship to 63-C', N'Taucherstraße 3456', N'Cunewalde', NULL, N'10281', N'Germany')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10541, 34, 2, CAST(N'2007-05-19 00:00:00.000' AS DateTime), CAST(N'2007-06-16 00:00:00.000' AS DateTime), CAST(N'2007-05-29 00:00:00.000' AS DateTime), 1, 68.6500, N'Destination SCQXA', N'Rua do Paço, 7890', N'Rio de Janeiro', N'RJ', N'10195', N'Brazil')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10542, 39, 1, CAST(N'2007-05-20 00:00:00.000' AS DateTime), CAST(N'2007-06-17 00:00:00.000' AS DateTime), CAST(N'2007-05-26 00:00:00.000' AS DateTime), 3, 10.9500, N'Destination DKMQA', N'Maubelstr. 0123', N'Brandenburg', NULL, N'10208', N'Germany')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10543, 46, 8, CAST(N'2007-05-21 00:00:00.000' AS DateTime), CAST(N'2007-06-18 00:00:00.000' AS DateTime), CAST(N'2007-05-23 00:00:00.000' AS DateTime), 2, 48.1700, N'Ship to 46-B', N'Carrera 1234 con Ave. Bolívar #65-98 Llano Largo', N'Barquisimeto', N'Lara', N'10228', N'Venezuela')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10544, 48, 4, CAST(N'2007-05-21 00:00:00.000' AS DateTime), CAST(N'2007-06-18 00:00:00.000' AS DateTime), CAST(N'2007-05-30 00:00:00.000' AS DateTime), 1, 24.9100, N'Ship to 48-C', N'7890 Chiaroscuro Rd.', N'Portland', N'OR', N'10234', N'USA')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10545, 43, 8, CAST(N'2007-05-22 00:00:00.000' AS DateTime), CAST(N'2007-06-19 00:00:00.000' AS DateTime), CAST(N'2007-06-26 00:00:00.000' AS DateTime), 2, 11.9200, N'Ship to 43-B', N'3456 Orchestra Terrace', N'Walla Walla', N'WA', N'10221', N'USA')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10546, 84, 1, CAST(N'2007-05-23 00:00:00.000' AS DateTime), CAST(N'2007-06-20 00:00:00.000' AS DateTime), CAST(N'2007-05-27 00:00:00.000' AS DateTime), 3, 194.7200, N'Ship to 84-C', N'5678, rue du Commerce', N'Lyon', NULL, N'10344', N'France')
GO
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10547, 72, 3, CAST(N'2007-05-23 00:00:00.000' AS DateTime), CAST(N'2007-06-20 00:00:00.000' AS DateTime), CAST(N'2007-06-02 00:00:00.000' AS DateTime), 2, 178.4300, N'Ship to 72-C', N'1234 Wadhurst Rd.', N'London', NULL, N'10309', N'UK')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10548, 79, 3, CAST(N'2007-05-26 00:00:00.000' AS DateTime), CAST(N'2007-06-23 00:00:00.000' AS DateTime), CAST(N'2007-06-02 00:00:00.000' AS DateTime), 2, 1.4300, N'Ship to 79-A', N'Luisenstr. 7890', N'Münster', NULL, N'10326', N'Germany')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10549, 63, 5, CAST(N'2007-05-27 00:00:00.000' AS DateTime), CAST(N'2007-06-10 00:00:00.000' AS DateTime), CAST(N'2007-05-30 00:00:00.000' AS DateTime), 1, 171.2400, N'Ship to 63-C', N'Taucherstraße 3456', N'Cunewalde', NULL, N'10281', N'Germany')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10550, 30, 7, CAST(N'2007-05-28 00:00:00.000' AS DateTime), CAST(N'2007-06-25 00:00:00.000' AS DateTime), CAST(N'2007-06-06 00:00:00.000' AS DateTime), 3, 4.3200, N'Destination GGQIR', N'C/ Romero, 6789', N'Sevilla', NULL, N'10184', N'Spain')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10551, 28, 4, CAST(N'2007-05-28 00:00:00.000' AS DateTime), CAST(N'2007-07-09 00:00:00.000' AS DateTime), CAST(N'2007-06-06 00:00:00.000' AS DateTime), 3, 72.9500, N'Destination OTSWR', N'Jardim das rosas n. 9012', N'Lisboa', NULL, N'10177', N'Portugal')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10552, 35, 2, CAST(N'2007-05-29 00:00:00.000' AS DateTime), CAST(N'2007-06-26 00:00:00.000' AS DateTime), CAST(N'2007-06-05 00:00:00.000' AS DateTime), 1, 83.2200, N'Destination UOUWK', N'Carrera 9012 con Ave. Carlos Soublette #8-35', N'San Cristóbal', N'Táchira', N'10197', N'Venezuela')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10553, 87, 2, CAST(N'2007-05-30 00:00:00.000' AS DateTime), CAST(N'2007-06-27 00:00:00.000' AS DateTime), CAST(N'2007-06-03 00:00:00.000' AS DateTime), 2, 149.4900, N'Ship to 87-B', N'Torikatu 2345', N'Oulu', NULL, N'10351', N'Finland')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10554, 56, 4, CAST(N'2007-05-30 00:00:00.000' AS DateTime), CAST(N'2007-06-27 00:00:00.000' AS DateTime), CAST(N'2007-06-05 00:00:00.000' AS DateTime), 3, 120.9700, N'Ship to 56-C', N'Mehrheimerstr. 2345', N'Köln', NULL, N'10260', N'Germany')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10555, 71, 6, CAST(N'2007-06-02 00:00:00.000' AS DateTime), CAST(N'2007-06-30 00:00:00.000' AS DateTime), CAST(N'2007-06-04 00:00:00.000' AS DateTime), 3, 252.4900, N'Ship to 71-B', N'8901 Suffolk Ln.', N'Boise', N'ID', N'10306', N'USA')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10556, 73, 2, CAST(N'2007-06-03 00:00:00.000' AS DateTime), CAST(N'2007-07-15 00:00:00.000' AS DateTime), CAST(N'2007-06-13 00:00:00.000' AS DateTime), 1, 9.8000, N'Ship to 73-A', N'Vinbæltet 1234', N'Kobenhavn', NULL, N'10310', N'Denmark')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10557, 44, 9, CAST(N'2007-06-03 00:00:00.000' AS DateTime), CAST(N'2007-06-17 00:00:00.000' AS DateTime), CAST(N'2007-06-06 00:00:00.000' AS DateTime), 2, 96.7200, N'Ship to 44-C', N'Magazinweg 6789', N'Frankfurt a.M.', NULL, N'10224', N'Germany')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10558, 4, 1, CAST(N'2007-06-04 00:00:00.000' AS DateTime), CAST(N'2007-07-02 00:00:00.000' AS DateTime), CAST(N'2007-06-10 00:00:00.000' AS DateTime), 2, 72.9700, N'Ship to 4-B', N'Brook Farm Stratford St. Mary 1234', N'Colchester', N'Essex', N'10239', N'UK')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10559, 7, 6, CAST(N'2007-06-05 00:00:00.000' AS DateTime), CAST(N'2007-07-03 00:00:00.000' AS DateTime), CAST(N'2007-06-13 00:00:00.000' AS DateTime), 1, 8.0500, N'Ship to 7-B', N'1234, place Kléber', N'Strasbourg', NULL, N'10330', N'France')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10560, 25, 8, CAST(N'2007-06-06 00:00:00.000' AS DateTime), CAST(N'2007-07-04 00:00:00.000' AS DateTime), CAST(N'2007-06-09 00:00:00.000' AS DateTime), 1, 36.6500, N'Destination QOCBL', N'Berliner Platz 1234', N'München', NULL, N'10169', N'Germany')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10561, 24, 2, CAST(N'2007-06-06 00:00:00.000' AS DateTime), CAST(N'2007-07-04 00:00:00.000' AS DateTime), CAST(N'2007-06-09 00:00:00.000' AS DateTime), 2, 242.2100, N'Destination YCMPK', N'Åkergatan 8901', N'Bräcke', NULL, N'10166', N'Sweden')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10562, 66, 1, CAST(N'2007-06-09 00:00:00.000' AS DateTime), CAST(N'2007-07-07 00:00:00.000' AS DateTime), CAST(N'2007-06-12 00:00:00.000' AS DateTime), 1, 22.9500, N'Ship to 66-B', N'Strada Provinciale 1234', N'Reggio Emilia', NULL, N'10289', N'Italy')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10563, 67, 2, CAST(N'2007-06-10 00:00:00.000' AS DateTime), CAST(N'2007-07-22 00:00:00.000' AS DateTime), CAST(N'2007-06-24 00:00:00.000' AS DateTime), 2, 60.4300, N'Ship to 67-B', N'Av. Copacabana, 4567', N'Rio de Janeiro', N'RJ', N'10292', N'Brazil')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10564, 65, 4, CAST(N'2007-06-10 00:00:00.000' AS DateTime), CAST(N'2007-07-08 00:00:00.000' AS DateTime), CAST(N'2007-06-16 00:00:00.000' AS DateTime), 3, 13.7500, N'Ship to 65-B', N'8901 Milton Dr.', N'Albuquerque', N'NM', N'10286', N'USA')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10565, 51, 8, CAST(N'2007-06-11 00:00:00.000' AS DateTime), CAST(N'2007-07-09 00:00:00.000' AS DateTime), CAST(N'2007-06-18 00:00:00.000' AS DateTime), 2, 7.1500, N'Ship to 51-C', N'8901 rue St. Laurent', N'Montréal', N'Québec', N'10246', N'Canada')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10566, 7, 9, CAST(N'2007-06-12 00:00:00.000' AS DateTime), CAST(N'2007-07-10 00:00:00.000' AS DateTime), CAST(N'2007-06-18 00:00:00.000' AS DateTime), 1, 88.4000, N'Ship to 7-C', N'2345, place Kléber', N'Strasbourg', NULL, N'10331', N'France')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10567, 37, 1, CAST(N'2007-06-12 00:00:00.000' AS DateTime), CAST(N'2007-07-10 00:00:00.000' AS DateTime), CAST(N'2007-06-17 00:00:00.000' AS DateTime), 1, 33.9700, N'Destination DGKOU', N'6789 Johnstown Road', N'Cork', N'Co. Cork', N'10204', N'Ireland')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10568, 29, 3, CAST(N'2007-06-13 00:00:00.000' AS DateTime), CAST(N'2007-07-11 00:00:00.000' AS DateTime), CAST(N'2007-07-09 00:00:00.000' AS DateTime), 3, 6.5400, N'Destination VPNNG', N'Rambla de Cataluña, 0123', N'Barcelona', NULL, N'10178', N'Spain')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10569, 65, 5, CAST(N'2007-06-16 00:00:00.000' AS DateTime), CAST(N'2007-07-14 00:00:00.000' AS DateTime), CAST(N'2007-07-11 00:00:00.000' AS DateTime), 1, 58.9800, N'Ship to 65-B', N'8901 Milton Dr.', N'Albuquerque', N'NM', N'10286', N'USA')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10570, 51, 3, CAST(N'2007-06-17 00:00:00.000' AS DateTime), CAST(N'2007-07-15 00:00:00.000' AS DateTime), CAST(N'2007-06-19 00:00:00.000' AS DateTime), 3, 188.9900, N'Ship to 51-C', N'8901 rue St. Laurent', N'Montréal', N'Québec', N'10246', N'Canada')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10571, 20, 8, CAST(N'2007-06-17 00:00:00.000' AS DateTime), CAST(N'2007-07-29 00:00:00.000' AS DateTime), CAST(N'2007-07-04 00:00:00.000' AS DateTime), 3, 26.0600, N'Destination RVDMF', N'Kirchgasse 9012', N'Graz', NULL, N'10157', N'Austria')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10572, 5, 3, CAST(N'2007-06-18 00:00:00.000' AS DateTime), CAST(N'2007-07-16 00:00:00.000' AS DateTime), CAST(N'2007-06-25 00:00:00.000' AS DateTime), 2, 116.4300, N'Ship to 5-B', N'Berguvsvägen  0123', N'Luleå', NULL, N'10268', N'Sweden')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10573, 3, 7, CAST(N'2007-06-19 00:00:00.000' AS DateTime), CAST(N'2007-07-17 00:00:00.000' AS DateTime), CAST(N'2007-06-20 00:00:00.000' AS DateTime), 3, 84.8400, N'Destination LANNN', N'Mataderos  4567', N'México D.F.', NULL, N'10212', N'Mexico')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10574, 82, 4, CAST(N'2007-06-19 00:00:00.000' AS DateTime), CAST(N'2007-07-17 00:00:00.000' AS DateTime), CAST(N'2007-06-30 00:00:00.000' AS DateTime), 2, 37.6000, N'Ship to 82-A', N'8901 DaVinci Blvd.', N'Kirkland', N'WA', N'10337', N'USA')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10575, 52, 5, CAST(N'2007-06-20 00:00:00.000' AS DateTime), CAST(N'2007-07-04 00:00:00.000' AS DateTime), CAST(N'2007-06-30 00:00:00.000' AS DateTime), 1, 127.3400, N'Ship to 52-C', N'Heerstr. 1234', N'Leipzig', NULL, N'10249', N'Germany')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10576, 80, 3, CAST(N'2007-06-23 00:00:00.000' AS DateTime), CAST(N'2007-07-07 00:00:00.000' AS DateTime), CAST(N'2007-06-30 00:00:00.000' AS DateTime), 3, 18.5600, N'Ship to 80-C', N'Avda. Azteca 5678', N'México D.F.', NULL, N'10334', N'Mexico')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10577, 82, 9, CAST(N'2007-06-23 00:00:00.000' AS DateTime), CAST(N'2007-08-04 00:00:00.000' AS DateTime), CAST(N'2007-06-30 00:00:00.000' AS DateTime), 2, 25.4100, N'Ship to 82-B', N'9012 DaVinci Blvd.', N'Kirkland', N'WA', N'10338', N'USA')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10578, 11, 4, CAST(N'2007-06-24 00:00:00.000' AS DateTime), CAST(N'2007-07-22 00:00:00.000' AS DateTime), CAST(N'2007-07-25 00:00:00.000' AS DateTime), 3, 29.6000, N'Destination NZASL', N'Fauntleroy Circus 5678', N'London', NULL, N'10133', N'UK')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10579, 45, 1, CAST(N'2007-06-25 00:00:00.000' AS DateTime), CAST(N'2007-07-23 00:00:00.000' AS DateTime), CAST(N'2007-07-04 00:00:00.000' AS DateTime), 2, 13.7300, N'Ship to 45-C', N'9012 Polk St. Suite 5', N'San Francisco', N'CA', N'10226', N'USA')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10580, 56, 4, CAST(N'2007-06-26 00:00:00.000' AS DateTime), CAST(N'2007-07-24 00:00:00.000' AS DateTime), CAST(N'2007-07-01 00:00:00.000' AS DateTime), 3, 75.8900, N'Ship to 56-C', N'Mehrheimerstr. 2345', N'Köln', NULL, N'10260', N'Germany')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10581, 21, 3, CAST(N'2007-06-26 00:00:00.000' AS DateTime), CAST(N'2007-07-24 00:00:00.000' AS DateTime), CAST(N'2007-07-02 00:00:00.000' AS DateTime), 1, 3.0100, N'Destination SSYXZ', N'Rua Orós, 3456', N'Sao Paulo', N'SP', N'10161', N'Brazil')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10582, 6, 3, CAST(N'2007-06-27 00:00:00.000' AS DateTime), CAST(N'2007-07-25 00:00:00.000' AS DateTime), CAST(N'2007-07-14 00:00:00.000' AS DateTime), 2, 27.7100, N'Ship to 6-A', N'Forsterstr. 2345', N'Mannheim', NULL, N'10300', N'Germany')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10583, 87, 2, CAST(N'2007-06-30 00:00:00.000' AS DateTime), CAST(N'2007-07-28 00:00:00.000' AS DateTime), CAST(N'2007-07-04 00:00:00.000' AS DateTime), 2, 7.2800, N'Ship to 87-C', N'Torikatu 3456', N'Oulu', NULL, N'10352', N'Finland')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10584, 7, 4, CAST(N'2007-06-30 00:00:00.000' AS DateTime), CAST(N'2007-07-28 00:00:00.000' AS DateTime), CAST(N'2007-07-04 00:00:00.000' AS DateTime), 1, 59.1400, N'Ship to 7-B', N'1234, place Kléber', N'Strasbourg', NULL, N'10330', N'France')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10585, 88, 7, CAST(N'2007-07-01 00:00:00.000' AS DateTime), CAST(N'2007-07-29 00:00:00.000' AS DateTime), CAST(N'2007-07-10 00:00:00.000' AS DateTime), 1, 13.4100, N'Ship to 88-A', N'Rua do Mercado, 4567', N'Resende', N'SP', N'10353', N'Brazil')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10586, 13, 9, CAST(N'2007-07-02 00:00:00.000' AS DateTime), CAST(N'2007-07-30 00:00:00.000' AS DateTime), NULL, 1, 0.4800, N'Ship to 66-B', N'Strada Provinciale 1234', N'Reggio Emilia', NULL, NULL, N'Italy')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10587, 61, 1, CAST(N'2007-07-02 00:00:00.000' AS DateTime), CAST(N'2007-07-30 00:00:00.000' AS DateTime), CAST(N'2007-07-09 00:00:00.000' AS DateTime), 1, 62.5200, N'Ship to 61-C', N'Rua da Panificadora, 7890', N'Rio de Janeiro', N'RJ', N'10275', N'Brazil')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10588, 63, 2, CAST(N'2007-07-03 00:00:00.000' AS DateTime), CAST(N'2007-07-31 00:00:00.000' AS DateTime), CAST(N'2007-07-10 00:00:00.000' AS DateTime), 3, 194.6700, N'Ship to 63-A', N'Taucherstraße 1234', N'Cunewalde', NULL, N'10279', N'Germany')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10589, 32, 8, CAST(N'2007-07-04 00:00:00.000' AS DateTime), CAST(N'2007-08-01 00:00:00.000' AS DateTime), CAST(N'2007-07-14 00:00:00.000' AS DateTime), 2, 4.4200, N'Destination AVQUS', N'2345 Baker Blvd.', N'Eugene', N'OR', N'10190', N'USA')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10590, 51, 4, CAST(N'2007-07-07 00:00:00.000' AS DateTime), CAST(N'2007-08-04 00:00:00.000' AS DateTime), CAST(N'2007-07-14 00:00:00.000' AS DateTime), 3, 44.7700, N'Ship to 51-B', N'7890 rue St. Laurent', N'Montréal', N'Québec', N'10245', N'Canada')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10591, 83, 1, CAST(N'2007-07-07 00:00:00.000' AS DateTime), CAST(N'2007-07-21 00:00:00.000' AS DateTime), CAST(N'2007-07-16 00:00:00.000' AS DateTime), 1, 55.9200, N'Ship to 83-A', N'Smagsloget 0123', N'Århus', NULL, N'10339', N'Denmark')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10592, 44, 3, CAST(N'2007-07-08 00:00:00.000' AS DateTime), CAST(N'2007-08-05 00:00:00.000' AS DateTime), CAST(N'2007-07-16 00:00:00.000' AS DateTime), 1, 32.1000, N'Ship to 44-B', N'Magazinweg 5678', N'Frankfurt a.M.', NULL, N'10223', N'Germany')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10593, 44, 7, CAST(N'2007-07-09 00:00:00.000' AS DateTime), CAST(N'2007-08-06 00:00:00.000' AS DateTime), CAST(N'2007-08-13 00:00:00.000' AS DateTime), 2, 174.2000, N'Ship to 44-C', N'Magazinweg 6789', N'Frankfurt a.M.', NULL, N'10224', N'Germany')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10594, 55, 3, CAST(N'2007-07-09 00:00:00.000' AS DateTime), CAST(N'2007-08-06 00:00:00.000' AS DateTime), CAST(N'2007-07-16 00:00:00.000' AS DateTime), 2, 5.2400, N'Ship to 55-B', N'8901 Bering St.', N'Anchorage', N'AK', N'10256', N'USA')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10595, 20, 2, CAST(N'2007-07-10 00:00:00.000' AS DateTime), CAST(N'2007-08-07 00:00:00.000' AS DateTime), CAST(N'2007-07-14 00:00:00.000' AS DateTime), 1, 96.7800, N'Destination CUVPF', N'Kirchgasse 1234', N'Graz', NULL, N'10159', N'Austria')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10596, 89, 8, CAST(N'2007-07-11 00:00:00.000' AS DateTime), CAST(N'2007-08-08 00:00:00.000' AS DateTime), CAST(N'2007-08-12 00:00:00.000' AS DateTime), 1, 16.3400, N'Ship to 89-C', N'9012 - 12th Ave. S.', N'Seattle', N'WA', N'10358', N'USA')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10597, 59, 7, CAST(N'2007-07-11 00:00:00.000' AS DateTime), CAST(N'2007-08-08 00:00:00.000' AS DateTime), CAST(N'2007-07-18 00:00:00.000' AS DateTime), 3, 35.1200, N'Ship to 59-B', N'Geislweg 7890', N'Salzburg', NULL, N'10265', N'Austria')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10598, 65, 1, CAST(N'2007-07-14 00:00:00.000' AS DateTime), CAST(N'2007-08-11 00:00:00.000' AS DateTime), CAST(N'2007-07-18 00:00:00.000' AS DateTime), 3, 44.4200, N'Ship to 65-C', N'9012 Milton Dr.', N'Albuquerque', N'NM', N'10287', N'USA')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10599, 11, 6, CAST(N'2007-07-15 00:00:00.000' AS DateTime), CAST(N'2007-08-26 00:00:00.000' AS DateTime), CAST(N'2007-07-21 00:00:00.000' AS DateTime), 3, 29.9800, N'Destination DLEUN', N'Fauntleroy Circus 4567', N'London', NULL, N'10132', N'UK')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10600, 36, 4, CAST(N'2007-07-16 00:00:00.000' AS DateTime), CAST(N'2007-08-13 00:00:00.000' AS DateTime), CAST(N'2007-07-21 00:00:00.000' AS DateTime), 1, 45.1300, N'Destination HOHCR', N'City Center Plaza 3456 Main St.', N'Elgin', N'OR', N'10201', N'USA')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10601, 35, 7, CAST(N'2007-07-16 00:00:00.000' AS DateTime), CAST(N'2007-08-27 00:00:00.000' AS DateTime), CAST(N'2007-07-22 00:00:00.000' AS DateTime), 1, 58.3000, N'Destination UOUWK', N'Carrera 9012 con Ave. Carlos Soublette #8-35', N'San Cristóbal', N'Táchira', N'10197', N'Venezuela')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10602, 83, 8, CAST(N'2007-07-17 00:00:00.000' AS DateTime), CAST(N'2007-08-14 00:00:00.000' AS DateTime), CAST(N'2007-07-22 00:00:00.000' AS DateTime), 2, 2.9200, N'Ship to 83-A', N'Smagsloget 0123', N'Århus', NULL, N'10339', N'Denmark')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10603, 71, 8, CAST(N'2007-07-18 00:00:00.000' AS DateTime), CAST(N'2007-08-15 00:00:00.000' AS DateTime), CAST(N'2007-08-08 00:00:00.000' AS DateTime), 2, 48.7700, N'Ship to 71-C', N'9012 Suffolk Ln.', N'Boise', N'ID', N'10307', N'USA')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10604, 28, 1, CAST(N'2007-07-18 00:00:00.000' AS DateTime), CAST(N'2007-08-15 00:00:00.000' AS DateTime), CAST(N'2007-07-29 00:00:00.000' AS DateTime), 1, 7.4600, N'Destination CIRQO', N'Jardim das rosas n. 8901', N'Lisboa', NULL, N'10176', N'Portugal')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10605, 51, 1, CAST(N'2007-07-21 00:00:00.000' AS DateTime), CAST(N'2007-08-18 00:00:00.000' AS DateTime), CAST(N'2007-07-29 00:00:00.000' AS DateTime), 2, 379.1300, N'Ship to 51-B', N'7890 rue St. Laurent', N'Montréal', N'Québec', N'10245', N'Canada')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10606, 81, 4, CAST(N'2007-07-22 00:00:00.000' AS DateTime), CAST(N'2007-08-19 00:00:00.000' AS DateTime), CAST(N'2007-07-31 00:00:00.000' AS DateTime), 3, 79.4000, N'Ship to 81-C', N'Av. Inês de Castro, 7890', N'Sao Paulo', N'SP', N'10336', N'Brazil')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10607, 71, 5, CAST(N'2007-07-22 00:00:00.000' AS DateTime), CAST(N'2007-08-19 00:00:00.000' AS DateTime), CAST(N'2007-07-25 00:00:00.000' AS DateTime), 1, 200.2400, N'Ship to 71-C', N'9012 Suffolk Ln.', N'Boise', N'ID', N'10307', N'USA')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10608, 79, 4, CAST(N'2007-07-23 00:00:00.000' AS DateTime), CAST(N'2007-08-20 00:00:00.000' AS DateTime), CAST(N'2007-08-01 00:00:00.000' AS DateTime), 2, 27.7900, N'Ship to 79-C', N'Luisenstr. 9012', N'Münster', NULL, N'10328', N'Germany')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10609, 18, 7, CAST(N'2007-07-24 00:00:00.000' AS DateTime), CAST(N'2007-08-21 00:00:00.000' AS DateTime), CAST(N'2007-07-30 00:00:00.000' AS DateTime), 2, 1.8500, N'Destination SNPXM', N'0123, rue des Cinquante Otages', N'Nantes', NULL, N'10148', N'France')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10610, 41, 8, CAST(N'2007-07-25 00:00:00.000' AS DateTime), CAST(N'2007-08-22 00:00:00.000' AS DateTime), CAST(N'2007-08-06 00:00:00.000' AS DateTime), 1, 26.7800, N'Ship to 41-C', N'0123 rue Alsace-Lorraine', N'Toulouse', NULL, N'10218', N'France')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10611, 91, 6, CAST(N'2007-07-25 00:00:00.000' AS DateTime), CAST(N'2007-08-22 00:00:00.000' AS DateTime), CAST(N'2007-08-01 00:00:00.000' AS DateTime), 2, 80.6500, N'Ship to 91-B', N'ul. Filtrowa 6789', N'Warszawa', NULL, N'10365', N'Poland')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10612, 71, 1, CAST(N'2007-07-28 00:00:00.000' AS DateTime), CAST(N'2007-08-25 00:00:00.000' AS DateTime), CAST(N'2007-08-01 00:00:00.000' AS DateTime), 2, 544.0800, N'Ship to 71-A', N'7890 Suffolk Ln.', N'Boise', N'ID', N'10305', N'USA')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10613, 35, 4, CAST(N'2007-07-29 00:00:00.000' AS DateTime), CAST(N'2007-08-26 00:00:00.000' AS DateTime), CAST(N'2007-08-01 00:00:00.000' AS DateTime), 2, 8.1100, N'Destination JYDLM', N'Carrera1234 con Ave. Carlos Soublette #8-35', N'San Cristóbal', N'Táchira', N'10199', N'Venezuela')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10614, 6, 8, CAST(N'2007-07-29 00:00:00.000' AS DateTime), CAST(N'2007-08-26 00:00:00.000' AS DateTime), CAST(N'2007-08-01 00:00:00.000' AS DateTime), 3, 1.9300, N'Ship to 6-A', N'Forsterstr. 2345', N'Mannheim', NULL, N'10300', N'Germany')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10615, 90, 2, CAST(N'2007-07-30 00:00:00.000' AS DateTime), CAST(N'2007-08-27 00:00:00.000' AS DateTime), CAST(N'2007-08-06 00:00:00.000' AS DateTime), 3, 0.7500, N'Ship to 90-B', N'Keskuskatu 3456', N'Helsinki', NULL, N'10362', N'Finland')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10616, 32, 1, CAST(N'2007-07-31 00:00:00.000' AS DateTime), CAST(N'2007-08-28 00:00:00.000' AS DateTime), CAST(N'2007-08-05 00:00:00.000' AS DateTime), 2, 116.5300, N'Destination LLUXZ', N'1234 Baker Blvd.', N'Eugene', N'OR', N'10189', N'USA')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10617, 32, 4, CAST(N'2007-07-31 00:00:00.000' AS DateTime), CAST(N'2007-08-28 00:00:00.000' AS DateTime), CAST(N'2007-08-04 00:00:00.000' AS DateTime), 2, 18.5300, N'Destination AVQUS', N'2345 Baker Blvd.', N'Eugene', N'OR', N'10190', N'USA')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10618, 51, 1, CAST(N'2007-08-01 00:00:00.000' AS DateTime), CAST(N'2007-09-12 00:00:00.000' AS DateTime), CAST(N'2007-08-08 00:00:00.000' AS DateTime), 1, 154.6800, N'Ship to 51-C', N'8901 rue St. Laurent', N'Montréal', N'Québec', N'10246', N'Canada')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10619, 51, 3, CAST(N'2007-08-04 00:00:00.000' AS DateTime), CAST(N'2007-09-01 00:00:00.000' AS DateTime), CAST(N'2007-08-07 00:00:00.000' AS DateTime), 3, 91.0500, N'Ship to 51-B', N'7890 rue St. Laurent', N'Montréal', N'Québec', N'10245', N'Canada')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10620, 42, 2, CAST(N'2007-08-05 00:00:00.000' AS DateTime), CAST(N'2007-09-02 00:00:00.000' AS DateTime), CAST(N'2007-08-14 00:00:00.000' AS DateTime), 3, 0.9400, N'Ship to 42-A', N'1234 Elm St.', N'Vancouver', N'BC', N'10219', N'Canada')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10621, 38, 4, CAST(N'2007-08-05 00:00:00.000' AS DateTime), CAST(N'2007-09-02 00:00:00.000' AS DateTime), CAST(N'2007-08-11 00:00:00.000' AS DateTime), 2, 23.7300, N'Destination LMVGS', N'Garden House Crowther Way 8901', N'Cowes', N'Isle of Wight', N'10206', N'UK')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10622, 67, 4, CAST(N'2007-08-06 00:00:00.000' AS DateTime), CAST(N'2007-09-03 00:00:00.000' AS DateTime), CAST(N'2007-08-11 00:00:00.000' AS DateTime), 3, 50.9700, N'Ship to 67-A', N'Av. Copacabana, 3456', N'Rio de Janeiro', N'RJ', N'10291', N'Brazil')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10623, 25, 8, CAST(N'2007-08-07 00:00:00.000' AS DateTime), CAST(N'2007-09-04 00:00:00.000' AS DateTime), CAST(N'2007-08-12 00:00:00.000' AS DateTime), 2, 97.1800, N'Destination VAPXU', N'Berliner Platz 0123', N'München', NULL, N'10168', N'Germany')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10624, 78, 4, CAST(N'2007-08-07 00:00:00.000' AS DateTime), CAST(N'2007-09-04 00:00:00.000' AS DateTime), CAST(N'2007-08-19 00:00:00.000' AS DateTime), 2, 94.8000, N'Ship to 78-C', N'6789 Grizzly Peak Rd.', N'Butte', N'MT', N'10325', N'USA')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10625, 2, 3, CAST(N'2007-08-08 00:00:00.000' AS DateTime), CAST(N'2007-09-05 00:00:00.000' AS DateTime), CAST(N'2007-08-14 00:00:00.000' AS DateTime), 1, 43.9000, N'Destination QOTQA', N'Avda. de la Constitución 3456', N'México D.F.', NULL, N'10181', N'Mexico')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10626, 5, 1, CAST(N'2007-08-11 00:00:00.000' AS DateTime), CAST(N'2007-09-08 00:00:00.000' AS DateTime), CAST(N'2007-08-20 00:00:00.000' AS DateTime), 2, 138.6900, N'Ship to 5-A', N'Berguvsvägen  9012', N'Luleå', NULL, N'10267', N'Sweden')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10627, 71, 8, CAST(N'2007-08-11 00:00:00.000' AS DateTime), CAST(N'2007-09-22 00:00:00.000' AS DateTime), CAST(N'2007-08-21 00:00:00.000' AS DateTime), 3, 107.4600, N'Ship to 71-B', N'8901 Suffolk Ln.', N'Boise', N'ID', N'10306', N'USA')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10628, 7, 4, CAST(N'2007-08-12 00:00:00.000' AS DateTime), CAST(N'2007-09-09 00:00:00.000' AS DateTime), CAST(N'2007-08-20 00:00:00.000' AS DateTime), 3, 30.3600, N'Ship to 7-B', N'1234, place Kléber', N'Strasbourg', NULL, N'10330', N'France')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10629, 30, 4, CAST(N'2007-08-12 00:00:00.000' AS DateTime), CAST(N'2007-09-09 00:00:00.000' AS DateTime), CAST(N'2007-08-20 00:00:00.000' AS DateTime), 3, 85.4600, N'Destination IIYDD', N'C/ Romero, 5678', N'Sevilla', NULL, N'10183', N'Spain')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10630, 39, 1, CAST(N'2007-08-13 00:00:00.000' AS DateTime), CAST(N'2007-09-10 00:00:00.000' AS DateTime), CAST(N'2007-08-19 00:00:00.000' AS DateTime), 2, 32.3500, N'Destination RMBHM', N'Maubelstr. 1234', N'Brandenburg', NULL, N'10209', N'Germany')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10631, 41, 8, CAST(N'2007-08-14 00:00:00.000' AS DateTime), CAST(N'2007-09-11 00:00:00.000' AS DateTime), CAST(N'2007-08-15 00:00:00.000' AS DateTime), 1, 0.8700, N'Destination OLJND', N'8901 rue Alsace-Lorraine', N'Toulouse', NULL, N'10216', N'France')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10632, 86, 8, CAST(N'2007-08-14 00:00:00.000' AS DateTime), CAST(N'2007-09-11 00:00:00.000' AS DateTime), CAST(N'2007-08-19 00:00:00.000' AS DateTime), 1, 41.3800, N'Ship to 86-C', N'Adenauerallee 0123', N'Stuttgart', NULL, N'10349', N'Germany')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10633, 20, 7, CAST(N'2007-08-15 00:00:00.000' AS DateTime), CAST(N'2007-09-12 00:00:00.000' AS DateTime), CAST(N'2007-08-18 00:00:00.000' AS DateTime), 3, 477.9000, N'Destination FFXKT', N'Kirchgasse 0123', N'Graz', NULL, N'10158', N'Austria')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10634, 23, 4, CAST(N'2007-08-15 00:00:00.000' AS DateTime), CAST(N'2007-09-12 00:00:00.000' AS DateTime), CAST(N'2007-08-21 00:00:00.000' AS DateTime), 3, 487.3800, N'Destination AGPCO', N'6789, chaussée de Tournai', N'Lille', NULL, N'10164', N'France')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10635, 49, 8, CAST(N'2007-08-18 00:00:00.000' AS DateTime), CAST(N'2007-09-15 00:00:00.000' AS DateTime), CAST(N'2007-08-21 00:00:00.000' AS DateTime), 3, 47.4600, N'Ship to 49-A', N'Via Ludovico il Moro 8901', N'Bergamo', NULL, N'10235', N'Italy')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10636, 87, 4, CAST(N'2007-08-19 00:00:00.000' AS DateTime), CAST(N'2007-09-16 00:00:00.000' AS DateTime), CAST(N'2007-08-26 00:00:00.000' AS DateTime), 1, 1.1500, N'Ship to 87-A', N'Torikatu 1234', N'Oulu', NULL, N'10350', N'Finland')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10637, 62, 6, CAST(N'2007-08-19 00:00:00.000' AS DateTime), CAST(N'2007-09-16 00:00:00.000' AS DateTime), CAST(N'2007-08-26 00:00:00.000' AS DateTime), 1, 201.2900, N'Ship to 62-C', N'Alameda dos Canàrios, 0123', N'Sao Paulo', N'SP', N'10278', N'Brazil')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10638, 47, 3, CAST(N'2007-08-20 00:00:00.000' AS DateTime), CAST(N'2007-09-17 00:00:00.000' AS DateTime), CAST(N'2007-09-01 00:00:00.000' AS DateTime), 1, 158.4400, N'Ship to 47-B', N'Ave. 5 de Mayo Porlamar 4567', N'I. de Margarita', N'Nueva Esparta', N'10231', N'Venezuela')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10639, 70, 7, CAST(N'2007-08-20 00:00:00.000' AS DateTime), CAST(N'2007-09-17 00:00:00.000' AS DateTime), CAST(N'2007-08-27 00:00:00.000' AS DateTime), 3, 38.6400, N'Ship to 70-B', N'Erling Skakkes gate 5678', N'Stavern', NULL, N'10303', N'Norway')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10640, 86, 4, CAST(N'2007-08-21 00:00:00.000' AS DateTime), CAST(N'2007-09-18 00:00:00.000' AS DateTime), CAST(N'2007-08-28 00:00:00.000' AS DateTime), 1, 23.5500, N'Ship to 86-A', N'Adenauerallee 8901', N'Stuttgart', NULL, N'10347', N'Germany')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10641, 35, 4, CAST(N'2007-08-22 00:00:00.000' AS DateTime), CAST(N'2007-09-19 00:00:00.000' AS DateTime), CAST(N'2007-08-26 00:00:00.000' AS DateTime), 2, 179.6100, N'Destination JYDLM', N'Carrera1234 con Ave. Carlos Soublette #8-35', N'San Cristóbal', N'Táchira', N'10199', N'Venezuela')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10642, 73, 7, CAST(N'2007-08-22 00:00:00.000' AS DateTime), CAST(N'2007-09-19 00:00:00.000' AS DateTime), CAST(N'2007-09-05 00:00:00.000' AS DateTime), 3, 41.8900, N'Ship to 73-C', N'Vinbæltet 2345', N'Kobenhavn', NULL, N'10311', N'Denmark')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10643, 1, 6, CAST(N'2007-08-25 00:00:00.000' AS DateTime), CAST(N'2007-09-22 00:00:00.000' AS DateTime), CAST(N'2007-09-02 00:00:00.000' AS DateTime), 1, 29.4600, N'Destination LOUIE', N'Obere Str. 6789', N'Berlin', NULL, N'10154', N'Germany')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10644, 88, 3, CAST(N'2007-08-25 00:00:00.000' AS DateTime), CAST(N'2007-09-22 00:00:00.000' AS DateTime), CAST(N'2007-09-01 00:00:00.000' AS DateTime), 2, 0.1400, N'Ship to 88-A', N'Rua do Mercado, 4567', N'Resende', N'SP', N'10353', N'Brazil')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10645, 34, 4, CAST(N'2007-08-26 00:00:00.000' AS DateTime), CAST(N'2007-09-23 00:00:00.000' AS DateTime), CAST(N'2007-09-02 00:00:00.000' AS DateTime), 1, 12.4100, N'Destination DPCVR', N'Rua do Paço, 6789', N'Rio de Janeiro', N'RJ', N'10194', N'Brazil')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10646, 37, 9, CAST(N'2007-08-27 00:00:00.000' AS DateTime), CAST(N'2007-10-08 00:00:00.000' AS DateTime), CAST(N'2007-09-03 00:00:00.000' AS DateTime), 3, 142.3300, N'Destination ATSOA', N'4567 Johnstown Road', N'Cork', N'Co. Cork', N'10202', N'Ireland')
GO
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10647, 61, 4, CAST(N'2007-08-27 00:00:00.000' AS DateTime), CAST(N'2007-09-10 00:00:00.000' AS DateTime), CAST(N'2007-09-03 00:00:00.000' AS DateTime), 2, 45.5400, N'Ship to 61-B', N'Rua da Panificadora, 6789', N'Rio de Janeiro', N'RJ', N'10274', N'Brazil')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10648, 67, 5, CAST(N'2007-08-28 00:00:00.000' AS DateTime), CAST(N'2007-10-09 00:00:00.000' AS DateTime), CAST(N'2007-09-09 00:00:00.000' AS DateTime), 2, 14.2500, N'Ship to 67-C', N'Av. Copacabana, 5678', N'Rio de Janeiro', N'RJ', N'10293', N'Brazil')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10649, 50, 5, CAST(N'2007-08-28 00:00:00.000' AS DateTime), CAST(N'2007-09-25 00:00:00.000' AS DateTime), CAST(N'2007-08-29 00:00:00.000' AS DateTime), 3, 6.2000, N'Ship to 50-B', N'Rue Joseph-Bens 4567', N'Bruxelles', NULL, N'10242', N'Belgium')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10650, 21, 5, CAST(N'2007-08-29 00:00:00.000' AS DateTime), CAST(N'2007-09-26 00:00:00.000' AS DateTime), CAST(N'2007-09-03 00:00:00.000' AS DateTime), 3, 176.8100, N'Destination SSYXZ', N'Rua Orós, 3456', N'Sao Paulo', N'SP', N'10161', N'Brazil')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10651, 86, 8, CAST(N'2007-09-01 00:00:00.000' AS DateTime), CAST(N'2007-09-29 00:00:00.000' AS DateTime), CAST(N'2007-09-11 00:00:00.000' AS DateTime), 2, 20.6000, N'Ship to 86-A', N'Adenauerallee 8901', N'Stuttgart', NULL, N'10347', N'Germany')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10652, 31, 4, CAST(N'2007-09-01 00:00:00.000' AS DateTime), CAST(N'2007-09-29 00:00:00.000' AS DateTime), CAST(N'2007-09-08 00:00:00.000' AS DateTime), 2, 7.1400, N'Destination VNIAG', N'Av. Brasil, 9012', N'Campinas', N'SP', N'10187', N'Brazil')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10653, 25, 1, CAST(N'2007-09-02 00:00:00.000' AS DateTime), CAST(N'2007-09-30 00:00:00.000' AS DateTime), CAST(N'2007-09-19 00:00:00.000' AS DateTime), 1, 93.2500, N'Destination QOCBL', N'Berliner Platz 1234', N'München', NULL, N'10169', N'Germany')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10654, 5, 5, CAST(N'2007-09-02 00:00:00.000' AS DateTime), CAST(N'2007-09-30 00:00:00.000' AS DateTime), CAST(N'2007-09-11 00:00:00.000' AS DateTime), 1, 55.2600, N'Ship to 5-C', N'Berguvsvägen  1234', N'Luleå', NULL, N'10269', N'Sweden')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10655, 66, 1, CAST(N'2007-09-03 00:00:00.000' AS DateTime), CAST(N'2007-10-01 00:00:00.000' AS DateTime), CAST(N'2007-09-11 00:00:00.000' AS DateTime), 2, 4.4100, N'Ship to 66-B', N'Strada Provinciale 1234', N'Reggio Emilia', NULL, N'10289', N'Italy')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10656, 32, 6, CAST(N'2007-09-04 00:00:00.000' AS DateTime), CAST(N'2007-10-02 00:00:00.000' AS DateTime), CAST(N'2007-09-10 00:00:00.000' AS DateTime), 1, 57.1500, N'Destination AVQUS', N'2345 Baker Blvd.', N'Eugene', N'OR', N'10190', N'USA')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10657, 71, 2, CAST(N'2007-09-04 00:00:00.000' AS DateTime), CAST(N'2007-10-02 00:00:00.000' AS DateTime), CAST(N'2007-09-15 00:00:00.000' AS DateTime), 2, 352.6900, N'Ship to 71-A', N'7890 Suffolk Ln.', N'Boise', N'ID', N'10305', N'USA')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10658, 63, 4, CAST(N'2007-09-05 00:00:00.000' AS DateTime), CAST(N'2007-10-03 00:00:00.000' AS DateTime), CAST(N'2007-09-08 00:00:00.000' AS DateTime), 1, 364.1500, N'Ship to 63-C', N'Taucherstraße 3456', N'Cunewalde', NULL, N'10281', N'Germany')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10659, 62, 7, CAST(N'2007-09-05 00:00:00.000' AS DateTime), CAST(N'2007-10-03 00:00:00.000' AS DateTime), CAST(N'2007-09-10 00:00:00.000' AS DateTime), 2, 105.8100, N'Ship to 62-B', N'Alameda dos Canàrios, 9012', N'Sao Paulo', N'SP', N'10277', N'Brazil')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10660, 36, 8, CAST(N'2007-09-08 00:00:00.000' AS DateTime), CAST(N'2007-10-06 00:00:00.000' AS DateTime), CAST(N'2007-10-15 00:00:00.000' AS DateTime), 1, 111.2900, N'Destination HOHCR', N'City Center Plaza 3456 Main St.', N'Elgin', N'OR', N'10201', N'USA')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10661, 37, 7, CAST(N'2007-09-09 00:00:00.000' AS DateTime), CAST(N'2007-10-07 00:00:00.000' AS DateTime), CAST(N'2007-09-15 00:00:00.000' AS DateTime), 3, 17.5500, N'Destination ATSOA', N'4567 Johnstown Road', N'Cork', N'Co. Cork', N'10202', N'Ireland')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10662, 48, 3, CAST(N'2007-09-09 00:00:00.000' AS DateTime), CAST(N'2007-10-07 00:00:00.000' AS DateTime), CAST(N'2007-09-18 00:00:00.000' AS DateTime), 2, 1.2800, N'Ship to 48-C', N'7890 Chiaroscuro Rd.', N'Portland', N'OR', N'10234', N'USA')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10663, 9, 2, CAST(N'2007-09-10 00:00:00.000' AS DateTime), CAST(N'2007-09-24 00:00:00.000' AS DateTime), CAST(N'2007-10-03 00:00:00.000' AS DateTime), 2, 113.1500, N'Ship to 9-B', N'9012, rue des Bouchers', N'Marseille', NULL, N'10368', N'France')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10664, 28, 1, CAST(N'2007-09-10 00:00:00.000' AS DateTime), CAST(N'2007-10-08 00:00:00.000' AS DateTime), CAST(N'2007-09-19 00:00:00.000' AS DateTime), 3, 1.2700, N'Destination OTSWR', N'Jardim das rosas n. 9012', N'Lisboa', NULL, N'10177', N'Portugal')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10665, 48, 1, CAST(N'2007-09-11 00:00:00.000' AS DateTime), CAST(N'2007-10-09 00:00:00.000' AS DateTime), CAST(N'2007-09-17 00:00:00.000' AS DateTime), 2, 26.3100, N'Ship to 48-B', N'6789 Chiaroscuro Rd.', N'Portland', N'OR', N'10233', N'USA')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10666, 68, 7, CAST(N'2007-09-12 00:00:00.000' AS DateTime), CAST(N'2007-10-10 00:00:00.000' AS DateTime), CAST(N'2007-09-22 00:00:00.000' AS DateTime), 2, 232.4200, N'Ship to 68-A', N'Starenweg 6789', N'Genève', NULL, N'10294', N'Switzerland')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10667, 20, 7, CAST(N'2007-09-12 00:00:00.000' AS DateTime), CAST(N'2007-10-10 00:00:00.000' AS DateTime), CAST(N'2007-09-19 00:00:00.000' AS DateTime), 1, 78.0900, N'Destination CUVPF', N'Kirchgasse 1234', N'Graz', NULL, N'10159', N'Austria')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10668, 86, 1, CAST(N'2007-09-15 00:00:00.000' AS DateTime), CAST(N'2007-10-13 00:00:00.000' AS DateTime), CAST(N'2007-09-23 00:00:00.000' AS DateTime), 2, 47.2200, N'Ship to 86-C', N'Adenauerallee 0123', N'Stuttgart', NULL, N'10349', N'Germany')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10669, 73, 2, CAST(N'2007-09-15 00:00:00.000' AS DateTime), CAST(N'2007-10-13 00:00:00.000' AS DateTime), CAST(N'2007-09-22 00:00:00.000' AS DateTime), 1, 24.3900, N'Ship to 73-A', N'Vinbæltet 1234', N'Kobenhavn', NULL, N'10310', N'Denmark')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10670, 25, 4, CAST(N'2007-09-16 00:00:00.000' AS DateTime), CAST(N'2007-10-14 00:00:00.000' AS DateTime), CAST(N'2007-09-18 00:00:00.000' AS DateTime), 1, 203.4800, N'Destination QOCBL', N'Berliner Platz 1234', N'München', NULL, N'10169', N'Germany')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10671, 26, 1, CAST(N'2007-09-17 00:00:00.000' AS DateTime), CAST(N'2007-10-15 00:00:00.000' AS DateTime), CAST(N'2007-09-24 00:00:00.000' AS DateTime), 1, 30.3400, N'Destination OPXJT', N'4567, rue Royale', N'Nantes', NULL, N'10172', N'France')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10672, 5, 9, CAST(N'2007-09-17 00:00:00.000' AS DateTime), CAST(N'2007-10-01 00:00:00.000' AS DateTime), CAST(N'2007-09-26 00:00:00.000' AS DateTime), 2, 95.7500, N'Ship to 5-C', N'Berguvsvägen  1234', N'Luleå', NULL, N'10269', N'Sweden')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10673, 90, 2, CAST(N'2007-09-18 00:00:00.000' AS DateTime), CAST(N'2007-10-16 00:00:00.000' AS DateTime), CAST(N'2007-09-19 00:00:00.000' AS DateTime), 1, 22.7600, N'Ship to 90-B', N'Keskuskatu 3456', N'Helsinki', NULL, N'10362', N'Finland')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10674, 38, 4, CAST(N'2007-09-18 00:00:00.000' AS DateTime), CAST(N'2007-10-16 00:00:00.000' AS DateTime), CAST(N'2007-09-30 00:00:00.000' AS DateTime), 2, 0.9000, N'Destination QVTLW', N'Garden House Crowther Way 7890', N'Cowes', N'Isle of Wight', N'10205', N'UK')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10675, 25, 5, CAST(N'2007-09-19 00:00:00.000' AS DateTime), CAST(N'2007-10-17 00:00:00.000' AS DateTime), CAST(N'2007-09-23 00:00:00.000' AS DateTime), 2, 31.8500, N'Destination WEGWI', N'Berliner Platz 2345', N'München', NULL, N'10170', N'Germany')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10676, 80, 2, CAST(N'2007-09-22 00:00:00.000' AS DateTime), CAST(N'2007-10-20 00:00:00.000' AS DateTime), CAST(N'2007-09-29 00:00:00.000' AS DateTime), 2, 2.0100, N'Ship to 80-C', N'Avda. Azteca 5678', N'México D.F.', NULL, N'10334', N'Mexico')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10677, 3, 1, CAST(N'2007-09-22 00:00:00.000' AS DateTime), CAST(N'2007-10-20 00:00:00.000' AS DateTime), CAST(N'2007-09-26 00:00:00.000' AS DateTime), 3, 4.0300, N'Destination LANNN', N'Mataderos  4567', N'México D.F.', NULL, N'10212', N'Mexico')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10678, 71, 7, CAST(N'2007-09-23 00:00:00.000' AS DateTime), CAST(N'2007-10-21 00:00:00.000' AS DateTime), CAST(N'2007-10-16 00:00:00.000' AS DateTime), 3, 388.9800, N'Ship to 71-A', N'7890 Suffolk Ln.', N'Boise', N'ID', N'10305', N'USA')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10679, 7, 8, CAST(N'2007-09-23 00:00:00.000' AS DateTime), CAST(N'2007-10-21 00:00:00.000' AS DateTime), CAST(N'2007-09-30 00:00:00.000' AS DateTime), 3, 27.9400, N'Ship to 7-A', N'0123, place Kléber', N'Strasbourg', NULL, N'10329', N'France')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10680, 55, 1, CAST(N'2007-09-24 00:00:00.000' AS DateTime), CAST(N'2007-10-22 00:00:00.000' AS DateTime), CAST(N'2007-09-26 00:00:00.000' AS DateTime), 1, 26.6100, N'Ship to 55-B', N'8901 Bering St.', N'Anchorage', N'AK', N'10256', N'USA')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10681, 32, 3, CAST(N'2007-09-25 00:00:00.000' AS DateTime), CAST(N'2007-10-23 00:00:00.000' AS DateTime), CAST(N'2007-09-30 00:00:00.000' AS DateTime), 3, 76.1300, N'Destination AVQUS', N'2345 Baker Blvd.', N'Eugene', N'OR', N'10190', N'USA')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10682, 3, 3, CAST(N'2007-09-25 00:00:00.000' AS DateTime), CAST(N'2007-10-23 00:00:00.000' AS DateTime), CAST(N'2007-10-01 00:00:00.000' AS DateTime), 2, 36.1300, N'Destination RTGIS', N'Mataderos  2345', N'México D.F.', NULL, N'10210', N'Mexico')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10683, 18, 2, CAST(N'2007-09-26 00:00:00.000' AS DateTime), CAST(N'2007-10-24 00:00:00.000' AS DateTime), CAST(N'2007-10-01 00:00:00.000' AS DateTime), 1, 4.4000, N'Destination FVRGC', N'2345, rue des Cinquante Otages', N'Nantes', NULL, N'10150', N'France')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10684, 56, 3, CAST(N'2007-09-26 00:00:00.000' AS DateTime), CAST(N'2007-10-24 00:00:00.000' AS DateTime), CAST(N'2007-09-30 00:00:00.000' AS DateTime), 1, 145.6300, N'Ship to 56-B', N'Mehrheimerstr. 1234', N'Köln', NULL, N'10259', N'Germany')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10685, 31, 4, CAST(N'2007-09-29 00:00:00.000' AS DateTime), CAST(N'2007-10-13 00:00:00.000' AS DateTime), CAST(N'2007-10-03 00:00:00.000' AS DateTime), 2, 33.7500, N'Destination VNIAG', N'Av. Brasil, 9012', N'Campinas', N'SP', N'10187', N'Brazil')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10686, 59, 2, CAST(N'2007-09-30 00:00:00.000' AS DateTime), CAST(N'2007-10-28 00:00:00.000' AS DateTime), CAST(N'2007-10-08 00:00:00.000' AS DateTime), 1, 96.5000, N'Ship to 59-B', N'Geislweg 7890', N'Salzburg', NULL, N'10265', N'Austria')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10687, 37, 9, CAST(N'2007-09-30 00:00:00.000' AS DateTime), CAST(N'2007-10-28 00:00:00.000' AS DateTime), CAST(N'2007-10-30 00:00:00.000' AS DateTime), 2, 296.4300, N'Destination KPVYJ', N'5678 Johnstown Road', N'Cork', N'Co. Cork', N'10203', N'Ireland')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10688, 83, 4, CAST(N'2007-10-01 00:00:00.000' AS DateTime), CAST(N'2007-10-15 00:00:00.000' AS DateTime), CAST(N'2007-10-07 00:00:00.000' AS DateTime), 2, 299.0900, N'Ship to 83-A', N'Smagsloget 0123', N'Århus', NULL, N'10339', N'Denmark')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10689, 5, 1, CAST(N'2007-10-01 00:00:00.000' AS DateTime), CAST(N'2007-10-29 00:00:00.000' AS DateTime), CAST(N'2007-10-07 00:00:00.000' AS DateTime), 2, 13.4200, N'Ship to 5-B', N'Berguvsvägen  0123', N'Luleå', NULL, N'10268', N'Sweden')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10690, 34, 1, CAST(N'2007-10-02 00:00:00.000' AS DateTime), CAST(N'2007-10-30 00:00:00.000' AS DateTime), CAST(N'2007-10-03 00:00:00.000' AS DateTime), 1, 15.8000, N'Destination JPAIY', N'Rua do Paço, 8901', N'Rio de Janeiro', N'RJ', N'10196', N'Brazil')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10691, 63, 2, CAST(N'2007-10-03 00:00:00.000' AS DateTime), CAST(N'2007-11-14 00:00:00.000' AS DateTime), CAST(N'2007-10-22 00:00:00.000' AS DateTime), 2, 810.0500, N'Ship to 63-B', N'Taucherstraße 2345', N'Cunewalde', NULL, N'10280', N'Germany')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10692, 1, 4, CAST(N'2007-10-03 00:00:00.000' AS DateTime), CAST(N'2007-10-31 00:00:00.000' AS DateTime), CAST(N'2007-10-13 00:00:00.000' AS DateTime), 2, 61.0200, N'Destination RSVRP', N'Obere Str. 8901', N'Berlin', NULL, N'10156', N'Germany')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10693, 89, 3, CAST(N'2007-10-06 00:00:00.000' AS DateTime), CAST(N'2007-10-20 00:00:00.000' AS DateTime), CAST(N'2007-10-10 00:00:00.000' AS DateTime), 3, 139.3400, N'Ship to 89-C', N'9012 - 12th Ave. S.', N'Seattle', N'WA', N'10358', N'USA')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10694, 63, 8, CAST(N'2007-10-06 00:00:00.000' AS DateTime), CAST(N'2007-11-03 00:00:00.000' AS DateTime), CAST(N'2007-10-09 00:00:00.000' AS DateTime), 3, 398.3600, N'Ship to 63-A', N'Taucherstraße 1234', N'Cunewalde', NULL, N'10279', N'Germany')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10695, 90, 7, CAST(N'2007-10-07 00:00:00.000' AS DateTime), CAST(N'2007-11-18 00:00:00.000' AS DateTime), CAST(N'2007-10-14 00:00:00.000' AS DateTime), 1, 16.7200, N'Ship to 90-C', N'Keskuskatu 4567', N'Helsinki', NULL, N'10363', N'Finland')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10696, 89, 8, CAST(N'2007-10-08 00:00:00.000' AS DateTime), CAST(N'2007-11-19 00:00:00.000' AS DateTime), CAST(N'2007-10-14 00:00:00.000' AS DateTime), 3, 102.5500, N'Ship to 89-A', N'7890 - 12th Ave. S.', N'Seattle', N'WA', N'10356', N'USA')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10697, 47, 3, CAST(N'2007-10-08 00:00:00.000' AS DateTime), CAST(N'2007-11-05 00:00:00.000' AS DateTime), CAST(N'2007-10-14 00:00:00.000' AS DateTime), 1, 45.5200, N'Ship to 47-B', N'Ave. 5 de Mayo Porlamar 4567', N'I. de Margarita', N'Nueva Esparta', N'10231', N'Venezuela')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10698, 20, 4, CAST(N'2007-10-09 00:00:00.000' AS DateTime), CAST(N'2007-11-06 00:00:00.000' AS DateTime), CAST(N'2007-10-17 00:00:00.000' AS DateTime), 1, 272.4700, N'Destination RVDMF', N'Kirchgasse 9012', N'Graz', NULL, N'10157', N'Austria')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10699, 52, 3, CAST(N'2007-10-09 00:00:00.000' AS DateTime), CAST(N'2007-11-06 00:00:00.000' AS DateTime), CAST(N'2007-10-13 00:00:00.000' AS DateTime), 3, 0.5800, N'Ship to 52-B', N'Heerstr. 0123', N'Leipzig', NULL, N'10248', N'Germany')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10700, 71, 3, CAST(N'2007-10-10 00:00:00.000' AS DateTime), CAST(N'2007-11-07 00:00:00.000' AS DateTime), CAST(N'2007-10-16 00:00:00.000' AS DateTime), 1, 65.1000, N'Ship to 71-C', N'9012 Suffolk Ln.', N'Boise', N'ID', N'10307', N'USA')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10701, 37, 6, CAST(N'2007-10-13 00:00:00.000' AS DateTime), CAST(N'2007-10-27 00:00:00.000' AS DateTime), CAST(N'2007-10-15 00:00:00.000' AS DateTime), 3, 220.3100, N'Destination KPVYJ', N'5678 Johnstown Road', N'Cork', N'Co. Cork', N'10203', N'Ireland')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10702, 1, 4, CAST(N'2007-10-13 00:00:00.000' AS DateTime), CAST(N'2007-11-24 00:00:00.000' AS DateTime), CAST(N'2007-10-21 00:00:00.000' AS DateTime), 1, 23.9400, N'Destination ZELZJ', N'Obere Str. 7890', N'Berlin', NULL, N'10155', N'Germany')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10703, 24, 6, CAST(N'2007-10-14 00:00:00.000' AS DateTime), CAST(N'2007-11-11 00:00:00.000' AS DateTime), CAST(N'2007-10-20 00:00:00.000' AS DateTime), 2, 152.3000, N'Destination KBSBN', N'Åkergatan 9012', N'Bräcke', NULL, N'10167', N'Sweden')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10704, 62, 6, CAST(N'2007-10-14 00:00:00.000' AS DateTime), CAST(N'2007-11-11 00:00:00.000' AS DateTime), CAST(N'2007-11-07 00:00:00.000' AS DateTime), 1, 4.7800, N'Ship to 62-C', N'Alameda dos Canàrios, 0123', N'Sao Paulo', N'SP', N'10278', N'Brazil')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10705, 35, 9, CAST(N'2007-10-15 00:00:00.000' AS DateTime), CAST(N'2007-11-12 00:00:00.000' AS DateTime), CAST(N'2007-11-18 00:00:00.000' AS DateTime), 2, 3.5200, N'Destination JYDLM', N'Carrera1234 con Ave. Carlos Soublette #8-35', N'San Cristóbal', N'Táchira', N'10199', N'Venezuela')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10706, 55, 8, CAST(N'2007-10-16 00:00:00.000' AS DateTime), CAST(N'2007-11-13 00:00:00.000' AS DateTime), CAST(N'2007-10-21 00:00:00.000' AS DateTime), 3, 135.6300, N'Ship to 55-C', N'9012 Bering St.', N'Anchorage', N'AK', N'10257', N'USA')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10707, 4, 4, CAST(N'2007-10-16 00:00:00.000' AS DateTime), CAST(N'2007-10-30 00:00:00.000' AS DateTime), CAST(N'2007-10-23 00:00:00.000' AS DateTime), 3, 21.7400, N'Ship to 4-A', N'Brook Farm Stratford St. Mary 0123', N'Colchester', N'Essex', N'10238', N'UK')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10708, 77, 6, CAST(N'2007-10-17 00:00:00.000' AS DateTime), CAST(N'2007-11-28 00:00:00.000' AS DateTime), CAST(N'2007-11-05 00:00:00.000' AS DateTime), 2, 2.9600, N'Ship to 77-C', N'3456 Jefferson Way Suite 2', N'Portland', N'OR', N'10322', N'USA')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10709, 31, 1, CAST(N'2007-10-17 00:00:00.000' AS DateTime), CAST(N'2007-11-14 00:00:00.000' AS DateTime), CAST(N'2007-11-20 00:00:00.000' AS DateTime), 3, 210.8000, N'Destination GWPFK', N'Av. Brasil, 0123', N'Campinas', N'SP', N'10188', N'Brazil')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10710, 27, 1, CAST(N'2007-10-20 00:00:00.000' AS DateTime), CAST(N'2007-11-17 00:00:00.000' AS DateTime), CAST(N'2007-10-23 00:00:00.000' AS DateTime), 1, 4.9800, N'Destination FFLQT', N'Via Monte Bianco 6789', N'Torino', NULL, N'10174', N'Italy')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10711, 71, 5, CAST(N'2007-10-21 00:00:00.000' AS DateTime), CAST(N'2007-12-02 00:00:00.000' AS DateTime), CAST(N'2007-10-29 00:00:00.000' AS DateTime), 2, 52.4100, N'Ship to 71-A', N'7890 Suffolk Ln.', N'Boise', N'ID', N'10305', N'USA')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10712, 37, 3, CAST(N'2007-10-21 00:00:00.000' AS DateTime), CAST(N'2007-11-18 00:00:00.000' AS DateTime), CAST(N'2007-10-31 00:00:00.000' AS DateTime), 1, 89.9300, N'Destination KPVYJ', N'5678 Johnstown Road', N'Cork', N'Co. Cork', N'10203', N'Ireland')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10713, 71, 1, CAST(N'2007-10-22 00:00:00.000' AS DateTime), CAST(N'2007-11-19 00:00:00.000' AS DateTime), CAST(N'2007-10-24 00:00:00.000' AS DateTime), 1, 167.0500, N'Ship to 71-C', N'9012 Suffolk Ln.', N'Boise', N'ID', N'10307', N'USA')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10714, 71, 5, CAST(N'2007-10-22 00:00:00.000' AS DateTime), CAST(N'2007-11-19 00:00:00.000' AS DateTime), CAST(N'2007-10-27 00:00:00.000' AS DateTime), 3, 24.4900, N'Ship to 71-A', N'7890 Suffolk Ln.', N'Boise', N'ID', N'10305', N'USA')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10715, 9, 3, CAST(N'2007-10-23 00:00:00.000' AS DateTime), CAST(N'2007-11-06 00:00:00.000' AS DateTime), CAST(N'2007-10-29 00:00:00.000' AS DateTime), 1, 63.2000, N'Ship to 9-B', N'9012, rue des Bouchers', N'Marseille', NULL, N'10368', N'France')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10716, 64, 4, CAST(N'2007-10-24 00:00:00.000' AS DateTime), CAST(N'2007-11-21 00:00:00.000' AS DateTime), CAST(N'2007-10-27 00:00:00.000' AS DateTime), 2, 22.5700, N'Ship to 64-B', N'Av. del Libertador 5678', N'Buenos Aires', NULL, N'10283', N'Argentina')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10717, 25, 1, CAST(N'2007-10-24 00:00:00.000' AS DateTime), CAST(N'2007-11-21 00:00:00.000' AS DateTime), CAST(N'2007-10-29 00:00:00.000' AS DateTime), 2, 59.2500, N'Destination QOCBL', N'Berliner Platz 1234', N'München', NULL, N'10169', N'Germany')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10718, 39, 1, CAST(N'2007-10-27 00:00:00.000' AS DateTime), CAST(N'2007-11-24 00:00:00.000' AS DateTime), CAST(N'2007-10-29 00:00:00.000' AS DateTime), 3, 170.8800, N'Destination DKMQA', N'Maubelstr. 0123', N'Brandenburg', NULL, N'10208', N'Germany')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10719, 45, 8, CAST(N'2007-10-27 00:00:00.000' AS DateTime), CAST(N'2007-11-24 00:00:00.000' AS DateTime), CAST(N'2007-11-05 00:00:00.000' AS DateTime), 2, 51.4400, N'Ship to 45-A', N'8901 Polk St. Suite 5', N'San Francisco', N'CA', N'10225', N'USA')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10720, 61, 8, CAST(N'2007-10-28 00:00:00.000' AS DateTime), CAST(N'2007-11-11 00:00:00.000' AS DateTime), CAST(N'2007-11-05 00:00:00.000' AS DateTime), 2, 9.5300, N'Ship to 61-C', N'Rua da Panificadora, 7890', N'Rio de Janeiro', N'RJ', N'10275', N'Brazil')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10721, 63, 5, CAST(N'2007-10-29 00:00:00.000' AS DateTime), CAST(N'2007-11-26 00:00:00.000' AS DateTime), CAST(N'2007-10-31 00:00:00.000' AS DateTime), 3, 48.9200, N'Ship to 63-A', N'Taucherstraße 1234', N'Cunewalde', NULL, N'10279', N'Germany')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10722, 71, 8, CAST(N'2007-10-29 00:00:00.000' AS DateTime), CAST(N'2007-12-10 00:00:00.000' AS DateTime), CAST(N'2007-11-04 00:00:00.000' AS DateTime), 1, 74.5800, N'Ship to 71-A', N'7890 Suffolk Ln.', N'Boise', N'ID', N'10305', N'USA')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10723, 89, 3, CAST(N'2007-10-30 00:00:00.000' AS DateTime), CAST(N'2007-11-27 00:00:00.000' AS DateTime), CAST(N'2007-11-25 00:00:00.000' AS DateTime), 1, 21.7200, N'Ship to 89-C', N'9012 - 12th Ave. S.', N'Seattle', N'WA', N'10358', N'USA')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10724, 51, 8, CAST(N'2007-10-30 00:00:00.000' AS DateTime), CAST(N'2007-12-11 00:00:00.000' AS DateTime), CAST(N'2007-11-05 00:00:00.000' AS DateTime), 2, 57.7500, N'Ship to 51-A', N'6789 rue St. Laurent', N'Montréal', N'Québec', N'10244', N'Canada')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10725, 21, 4, CAST(N'2007-10-31 00:00:00.000' AS DateTime), CAST(N'2007-11-28 00:00:00.000' AS DateTime), CAST(N'2007-11-05 00:00:00.000' AS DateTime), 3, 10.8300, N'Destination KKELL', N'Rua Orós, 4567', N'Sao Paulo', N'SP', N'10162', N'Brazil')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10726, 19, 4, CAST(N'2007-11-03 00:00:00.000' AS DateTime), CAST(N'2007-11-17 00:00:00.000' AS DateTime), CAST(N'2007-12-05 00:00:00.000' AS DateTime), 1, 16.5600, N'Destination FRCGJ', N'5678 King George', N'London', NULL, N'10153', N'UK')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10727, 66, 2, CAST(N'2007-11-03 00:00:00.000' AS DateTime), CAST(N'2007-12-01 00:00:00.000' AS DateTime), CAST(N'2007-12-05 00:00:00.000' AS DateTime), 1, 89.9000, N'Ship to 66-A', N'Strada Provinciale 0123', N'Reggio Emilia', NULL, N'10288', N'Italy')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10728, 62, 4, CAST(N'2007-11-04 00:00:00.000' AS DateTime), CAST(N'2007-12-02 00:00:00.000' AS DateTime), CAST(N'2007-11-11 00:00:00.000' AS DateTime), 2, 58.3300, N'Ship to 62-A', N'Alameda dos Canàrios, 8901', N'Sao Paulo', N'SP', N'10276', N'Brazil')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10729, 47, 8, CAST(N'2007-11-04 00:00:00.000' AS DateTime), CAST(N'2007-12-16 00:00:00.000' AS DateTime), CAST(N'2007-11-14 00:00:00.000' AS DateTime), 3, 141.0600, N'Ship to 47-A', N'Ave. 5 de Mayo Porlamar 3456', N'I. de Margarita', N'Nueva Esparta', N'10230', N'Venezuela')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10730, 9, 5, CAST(N'2007-11-05 00:00:00.000' AS DateTime), CAST(N'2007-12-03 00:00:00.000' AS DateTime), CAST(N'2007-11-14 00:00:00.000' AS DateTime), 1, 20.1200, N'Ship to 9-A', N'8901, rue des Bouchers', N'Marseille', NULL, N'10367', N'France')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10731, 14, 7, CAST(N'2007-11-06 00:00:00.000' AS DateTime), CAST(N'2007-12-04 00:00:00.000' AS DateTime), CAST(N'2007-11-14 00:00:00.000' AS DateTime), 1, 96.6500, N'Destination YUJRD', N'Hauptstr. 1234', N'Bern', NULL, N'10139', N'Switzerland')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10732, 9, 3, CAST(N'2007-11-06 00:00:00.000' AS DateTime), CAST(N'2007-12-04 00:00:00.000' AS DateTime), CAST(N'2007-11-07 00:00:00.000' AS DateTime), 1, 16.9700, N'Ship to 9-A', N'8901, rue des Bouchers', N'Marseille', NULL, N'10367', N'France')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10733, 5, 1, CAST(N'2007-11-07 00:00:00.000' AS DateTime), CAST(N'2007-12-05 00:00:00.000' AS DateTime), CAST(N'2007-11-10 00:00:00.000' AS DateTime), 3, 110.1100, N'Ship to 5-A', N'Berguvsvägen  9012', N'Luleå', NULL, N'10267', N'Sweden')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10734, 31, 2, CAST(N'2007-11-07 00:00:00.000' AS DateTime), CAST(N'2007-12-05 00:00:00.000' AS DateTime), CAST(N'2007-11-12 00:00:00.000' AS DateTime), 3, 1.6300, N'Destination VNIAG', N'Av. Brasil, 9012', N'Campinas', N'SP', N'10187', N'Brazil')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10735, 45, 6, CAST(N'2007-11-10 00:00:00.000' AS DateTime), CAST(N'2007-12-08 00:00:00.000' AS DateTime), CAST(N'2007-11-21 00:00:00.000' AS DateTime), 2, 45.9700, N'Ship to 45-A', N'8901 Polk St. Suite 5', N'San Francisco', N'CA', N'10225', N'USA')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10736, 37, 9, CAST(N'2007-11-11 00:00:00.000' AS DateTime), CAST(N'2007-12-09 00:00:00.000' AS DateTime), CAST(N'2007-11-21 00:00:00.000' AS DateTime), 2, 44.1000, N'Destination DGKOU', N'6789 Johnstown Road', N'Cork', N'Co. Cork', N'10204', N'Ireland')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10737, 85, 2, CAST(N'2007-11-11 00:00:00.000' AS DateTime), CAST(N'2007-12-09 00:00:00.000' AS DateTime), CAST(N'2007-11-18 00:00:00.000' AS DateTime), 2, 7.7900, N'Ship to 85-C', N'7890 rue de l''Abbaye', N'Reims', NULL, N'10346', N'France')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10738, 74, 2, CAST(N'2007-11-12 00:00:00.000' AS DateTime), CAST(N'2007-12-10 00:00:00.000' AS DateTime), CAST(N'2007-11-18 00:00:00.000' AS DateTime), 1, 2.9100, N'Ship to 74-A', N'3456, rue Lauriston', N'Paris', NULL, N'10312', N'France')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10739, 85, 3, CAST(N'2007-11-12 00:00:00.000' AS DateTime), CAST(N'2007-12-10 00:00:00.000' AS DateTime), CAST(N'2007-11-17 00:00:00.000' AS DateTime), 3, 11.0800, N'Ship to 85-C', N'7890 rue de l''Abbaye', N'Reims', NULL, N'10346', N'France')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10740, 89, 4, CAST(N'2007-11-13 00:00:00.000' AS DateTime), CAST(N'2007-12-11 00:00:00.000' AS DateTime), CAST(N'2007-11-25 00:00:00.000' AS DateTime), 2, 81.8800, N'Ship to 89-B', N'8901 - 12th Ave. S.', N'Seattle', N'WA', N'10357', N'USA')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10741, 4, 4, CAST(N'2007-11-14 00:00:00.000' AS DateTime), CAST(N'2007-11-28 00:00:00.000' AS DateTime), CAST(N'2007-11-18 00:00:00.000' AS DateTime), 3, 10.9600, N'Ship to 4-C', N'Brook Farm Stratford St. Mary 2345', N'Colchester', N'Essex', N'10240', N'UK')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10742, 10, 3, CAST(N'2007-11-14 00:00:00.000' AS DateTime), CAST(N'2007-12-12 00:00:00.000' AS DateTime), CAST(N'2007-11-18 00:00:00.000' AS DateTime), 3, 243.7300, N'Destination LPHSI', N'3456 Tsawassen Blvd.', N'Tsawassen', N'BC', N'10131', N'Canada')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10743, 4, 1, CAST(N'2007-11-17 00:00:00.000' AS DateTime), CAST(N'2007-12-15 00:00:00.000' AS DateTime), CAST(N'2007-11-21 00:00:00.000' AS DateTime), 2, 23.7200, N'Ship to 4-C', N'Brook Farm Stratford St. Mary 2345', N'Colchester', N'Essex', N'10240', N'UK')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10744, 83, 6, CAST(N'2007-11-17 00:00:00.000' AS DateTime), CAST(N'2007-12-15 00:00:00.000' AS DateTime), CAST(N'2007-11-24 00:00:00.000' AS DateTime), 1, 69.1900, N'Ship to 83-A', N'Smagsloget 0123', N'Århus', NULL, N'10339', N'Denmark')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10745, 63, 9, CAST(N'2007-11-18 00:00:00.000' AS DateTime), CAST(N'2007-12-16 00:00:00.000' AS DateTime), CAST(N'2007-11-27 00:00:00.000' AS DateTime), 1, 3.5200, N'Ship to 63-C', N'Taucherstraße 3456', N'Cunewalde', NULL, N'10281', N'Germany')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10746, 14, 1, CAST(N'2007-11-19 00:00:00.000' AS DateTime), CAST(N'2007-12-17 00:00:00.000' AS DateTime), CAST(N'2007-11-21 00:00:00.000' AS DateTime), 3, 31.4300, N'Destination NRTZZ', N'Hauptstr. 0123', N'Bern', NULL, N'10138', N'Switzerland')
GO
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10747, 59, 6, CAST(N'2007-11-19 00:00:00.000' AS DateTime), CAST(N'2007-12-17 00:00:00.000' AS DateTime), CAST(N'2007-11-26 00:00:00.000' AS DateTime), 1, 117.3300, N'Ship to 59-B', N'Geislweg 7890', N'Salzburg', NULL, N'10265', N'Austria')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10748, 71, 3, CAST(N'2007-11-20 00:00:00.000' AS DateTime), CAST(N'2007-12-18 00:00:00.000' AS DateTime), CAST(N'2007-11-28 00:00:00.000' AS DateTime), 1, 232.5500, N'Ship to 71-B', N'8901 Suffolk Ln.', N'Boise', N'ID', N'10306', N'USA')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10749, 38, 4, CAST(N'2007-11-20 00:00:00.000' AS DateTime), CAST(N'2007-12-18 00:00:00.000' AS DateTime), CAST(N'2007-12-19 00:00:00.000' AS DateTime), 2, 61.5300, N'Destination QVTLW', N'Garden House Crowther Way 7890', N'Cowes', N'Isle of Wight', N'10205', N'UK')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10750, 87, 9, CAST(N'2007-11-21 00:00:00.000' AS DateTime), CAST(N'2007-12-19 00:00:00.000' AS DateTime), CAST(N'2007-11-24 00:00:00.000' AS DateTime), 1, 79.3000, N'Ship to 87-C', N'Torikatu 3456', N'Oulu', NULL, N'10352', N'Finland')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10751, 68, 3, CAST(N'2007-11-24 00:00:00.000' AS DateTime), CAST(N'2007-12-22 00:00:00.000' AS DateTime), CAST(N'2007-12-03 00:00:00.000' AS DateTime), 3, 130.7900, N'Ship to 68-A', N'Starenweg 6789', N'Genève', NULL, N'10294', N'Switzerland')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10752, 53, 2, CAST(N'2007-11-24 00:00:00.000' AS DateTime), CAST(N'2007-12-22 00:00:00.000' AS DateTime), CAST(N'2007-11-28 00:00:00.000' AS DateTime), 3, 1.3900, N'Ship to 53-C', N'South House 3456 Queensbridge', N'London', NULL, N'10251', N'UK')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10753, 27, 3, CAST(N'2007-11-25 00:00:00.000' AS DateTime), CAST(N'2007-12-23 00:00:00.000' AS DateTime), CAST(N'2007-11-27 00:00:00.000' AS DateTime), 1, 7.7000, N'Destination DICGM', N'Via Monte Bianco 7890', N'Torino', NULL, N'10175', N'Italy')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10754, 49, 6, CAST(N'2007-11-25 00:00:00.000' AS DateTime), CAST(N'2007-12-23 00:00:00.000' AS DateTime), CAST(N'2007-11-27 00:00:00.000' AS DateTime), 3, 2.3800, N'Ship to 49-B', N'Via Ludovico il Moro 9012', N'Bergamo', NULL, N'10236', N'Italy')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10755, 9, 4, CAST(N'2007-11-26 00:00:00.000' AS DateTime), CAST(N'2007-12-24 00:00:00.000' AS DateTime), CAST(N'2007-11-28 00:00:00.000' AS DateTime), 2, 16.7100, N'Ship to 9-C', N'0123, rue des Bouchers', N'Marseille', NULL, N'10369', N'France')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10756, 75, 8, CAST(N'2007-11-27 00:00:00.000' AS DateTime), CAST(N'2007-12-25 00:00:00.000' AS DateTime), CAST(N'2007-12-02 00:00:00.000' AS DateTime), 2, 73.2100, N'Ship to 75-C', N'P.O. Box 7890', N'Lander', N'WY', N'10316', N'USA')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10757, 71, 6, CAST(N'2007-11-27 00:00:00.000' AS DateTime), CAST(N'2007-12-25 00:00:00.000' AS DateTime), CAST(N'2007-12-15 00:00:00.000' AS DateTime), 1, 8.1900, N'Ship to 71-B', N'8901 Suffolk Ln.', N'Boise', N'ID', N'10306', N'USA')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10758, 68, 3, CAST(N'2007-11-28 00:00:00.000' AS DateTime), CAST(N'2007-12-26 00:00:00.000' AS DateTime), CAST(N'2007-12-04 00:00:00.000' AS DateTime), 3, 138.1700, N'Ship to 68-C', N'Starenweg 8901', N'Genève', NULL, N'10296', N'Switzerland')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10759, 2, 3, CAST(N'2007-11-28 00:00:00.000' AS DateTime), CAST(N'2007-12-26 00:00:00.000' AS DateTime), CAST(N'2007-12-12 00:00:00.000' AS DateTime), 3, 11.9900, N'Destination QOTQA', N'Avda. de la Constitución 3456', N'México D.F.', NULL, N'10181', N'Mexico')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10760, 50, 4, CAST(N'2007-12-01 00:00:00.000' AS DateTime), CAST(N'2007-12-29 00:00:00.000' AS DateTime), CAST(N'2007-12-10 00:00:00.000' AS DateTime), 1, 155.6400, N'Ship to 50-B', N'Rue Joseph-Bens 4567', N'Bruxelles', NULL, N'10242', N'Belgium')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10761, 65, 5, CAST(N'2007-12-02 00:00:00.000' AS DateTime), CAST(N'2007-12-30 00:00:00.000' AS DateTime), CAST(N'2007-12-08 00:00:00.000' AS DateTime), 2, 18.6600, N'Ship to 65-B', N'8901 Milton Dr.', N'Albuquerque', N'NM', N'10286', N'USA')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10762, 24, 3, CAST(N'2007-12-02 00:00:00.000' AS DateTime), CAST(N'2007-12-30 00:00:00.000' AS DateTime), CAST(N'2007-12-09 00:00:00.000' AS DateTime), 1, 328.7400, N'Destination YCMPK', N'Åkergatan 8901', N'Bräcke', NULL, N'10166', N'Sweden')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10763, 23, 3, CAST(N'2007-12-03 00:00:00.000' AS DateTime), CAST(N'2007-12-31 00:00:00.000' AS DateTime), CAST(N'2007-12-08 00:00:00.000' AS DateTime), 3, 37.3500, N'Destination PXQRR', N'5678, chaussée de Tournai', N'Lille', NULL, N'10163', N'France')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10764, 20, 6, CAST(N'2007-12-03 00:00:00.000' AS DateTime), CAST(N'2007-12-31 00:00:00.000' AS DateTime), CAST(N'2007-12-08 00:00:00.000' AS DateTime), 3, 145.4500, N'Destination CUVPF', N'Kirchgasse 1234', N'Graz', NULL, N'10159', N'Austria')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10765, 63, 3, CAST(N'2007-12-04 00:00:00.000' AS DateTime), CAST(N'2008-01-01 00:00:00.000' AS DateTime), CAST(N'2007-12-09 00:00:00.000' AS DateTime), 3, 42.7400, N'Ship to 63-A', N'Taucherstraße 1234', N'Cunewalde', NULL, N'10279', N'Germany')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10766, 56, 4, CAST(N'2007-12-05 00:00:00.000' AS DateTime), CAST(N'2008-01-02 00:00:00.000' AS DateTime), CAST(N'2007-12-09 00:00:00.000' AS DateTime), 1, 157.5500, N'Ship to 56-C', N'Mehrheimerstr. 2345', N'Köln', NULL, N'10260', N'Germany')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10767, 76, 4, CAST(N'2007-12-05 00:00:00.000' AS DateTime), CAST(N'2008-01-02 00:00:00.000' AS DateTime), CAST(N'2007-12-15 00:00:00.000' AS DateTime), 3, 1.5900, N'Ship to 76-B', N'Boulevard Tirou, 9012', N'Charleroi', NULL, N'10318', N'Belgium')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10768, 4, 3, CAST(N'2007-12-08 00:00:00.000' AS DateTime), CAST(N'2008-01-05 00:00:00.000' AS DateTime), CAST(N'2007-12-15 00:00:00.000' AS DateTime), 2, 146.3200, N'Ship to 4-B', N'Brook Farm Stratford St. Mary 1234', N'Colchester', N'Essex', N'10239', N'UK')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10769, 83, 3, CAST(N'2007-12-08 00:00:00.000' AS DateTime), CAST(N'2008-01-05 00:00:00.000' AS DateTime), CAST(N'2007-12-12 00:00:00.000' AS DateTime), 1, 65.0600, N'Ship to 83-C', N'Smagsloget 2345', N'Århus', NULL, N'10341', N'Denmark')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10770, 34, 8, CAST(N'2007-12-09 00:00:00.000' AS DateTime), CAST(N'2008-01-06 00:00:00.000' AS DateTime), CAST(N'2007-12-17 00:00:00.000' AS DateTime), 3, 5.3200, N'Destination JPAIY', N'Rua do Paço, 8901', N'Rio de Janeiro', N'RJ', N'10196', N'Brazil')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10771, 20, 9, CAST(N'2007-12-10 00:00:00.000' AS DateTime), CAST(N'2008-01-07 00:00:00.000' AS DateTime), CAST(N'2008-01-02 00:00:00.000' AS DateTime), 2, 11.1900, N'Destination CUVPF', N'Kirchgasse 1234', N'Graz', NULL, N'10159', N'Austria')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10772, 44, 3, CAST(N'2007-12-10 00:00:00.000' AS DateTime), CAST(N'2008-01-07 00:00:00.000' AS DateTime), CAST(N'2007-12-19 00:00:00.000' AS DateTime), 2, 91.2800, N'Ship to 44-B', N'Magazinweg 5678', N'Frankfurt a.M.', NULL, N'10223', N'Germany')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10773, 20, 1, CAST(N'2007-12-11 00:00:00.000' AS DateTime), CAST(N'2008-01-08 00:00:00.000' AS DateTime), CAST(N'2007-12-16 00:00:00.000' AS DateTime), 3, 96.4300, N'Destination FFXKT', N'Kirchgasse 0123', N'Graz', NULL, N'10158', N'Austria')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10774, 24, 4, CAST(N'2007-12-11 00:00:00.000' AS DateTime), CAST(N'2007-12-25 00:00:00.000' AS DateTime), CAST(N'2007-12-12 00:00:00.000' AS DateTime), 1, 48.2000, N'Destination KBSBN', N'Åkergatan 9012', N'Bräcke', NULL, N'10167', N'Sweden')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10775, 78, 7, CAST(N'2007-12-12 00:00:00.000' AS DateTime), CAST(N'2008-01-09 00:00:00.000' AS DateTime), CAST(N'2007-12-26 00:00:00.000' AS DateTime), 1, 20.2500, N'Ship to 78-A', N'4567 Grizzly Peak Rd.', N'Butte', N'MT', N'10323', N'USA')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10776, 20, 1, CAST(N'2007-12-15 00:00:00.000' AS DateTime), CAST(N'2008-01-12 00:00:00.000' AS DateTime), CAST(N'2007-12-18 00:00:00.000' AS DateTime), 3, 351.5300, N'Destination RVDMF', N'Kirchgasse 9012', N'Graz', NULL, N'10157', N'Austria')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10777, 31, 7, CAST(N'2007-12-15 00:00:00.000' AS DateTime), CAST(N'2007-12-29 00:00:00.000' AS DateTime), CAST(N'2008-01-21 00:00:00.000' AS DateTime), 2, 3.0100, N'Destination GWPFK', N'Av. Brasil, 0123', N'Campinas', N'SP', N'10188', N'Brazil')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10778, 5, 3, CAST(N'2007-12-16 00:00:00.000' AS DateTime), CAST(N'2008-01-13 00:00:00.000' AS DateTime), CAST(N'2007-12-24 00:00:00.000' AS DateTime), 1, 6.7900, N'Ship to 5-A', N'Berguvsvägen  9012', N'Luleå', NULL, N'10267', N'Sweden')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10779, 52, 3, CAST(N'2007-12-16 00:00:00.000' AS DateTime), CAST(N'2008-01-13 00:00:00.000' AS DateTime), CAST(N'2008-01-14 00:00:00.000' AS DateTime), 2, 58.1300, N'Ship to 52-A', N'Heerstr. 9012', N'Leipzig', NULL, N'10247', N'Germany')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10780, 46, 2, CAST(N'2007-12-16 00:00:00.000' AS DateTime), CAST(N'2007-12-30 00:00:00.000' AS DateTime), CAST(N'2007-12-25 00:00:00.000' AS DateTime), 1, 42.1300, N'Ship to 46-C', N'Carrera 2345 con Ave. Bolívar #65-98 Llano Largo', N'Barquisimeto', N'Lara', N'10229', N'Venezuela')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10781, 87, 2, CAST(N'2007-12-17 00:00:00.000' AS DateTime), CAST(N'2008-01-14 00:00:00.000' AS DateTime), CAST(N'2007-12-19 00:00:00.000' AS DateTime), 3, 73.1600, N'Ship to 87-A', N'Torikatu 1234', N'Oulu', NULL, N'10350', N'Finland')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10782, 12, 9, CAST(N'2007-12-17 00:00:00.000' AS DateTime), CAST(N'2008-01-14 00:00:00.000' AS DateTime), CAST(N'2007-12-22 00:00:00.000' AS DateTime), 3, 1.1000, N'Destination CJDJB', N'Cerrito 8901', N'Buenos Aires', NULL, N'10136', N'Argentina')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10783, 34, 4, CAST(N'2007-12-18 00:00:00.000' AS DateTime), CAST(N'2008-01-15 00:00:00.000' AS DateTime), CAST(N'2007-12-19 00:00:00.000' AS DateTime), 2, 124.9800, N'Destination DPCVR', N'Rua do Paço, 6789', N'Rio de Janeiro', N'RJ', N'10194', N'Brazil')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10784, 49, 4, CAST(N'2007-12-18 00:00:00.000' AS DateTime), CAST(N'2008-01-15 00:00:00.000' AS DateTime), CAST(N'2007-12-22 00:00:00.000' AS DateTime), 3, 70.0900, N'Ship to 49-A', N'Via Ludovico il Moro 8901', N'Bergamo', NULL, N'10235', N'Italy')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10785, 33, 1, CAST(N'2007-12-18 00:00:00.000' AS DateTime), CAST(N'2008-01-15 00:00:00.000' AS DateTime), CAST(N'2007-12-24 00:00:00.000' AS DateTime), 3, 1.5100, N'Destination FQJFJ', N'5ª Ave. Los Palos Grandes 4567', N'Caracas', N'DF', N'10192', N'Venezuela')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10786, 62, 8, CAST(N'2007-12-19 00:00:00.000' AS DateTime), CAST(N'2008-01-16 00:00:00.000' AS DateTime), CAST(N'2007-12-23 00:00:00.000' AS DateTime), 1, 110.8700, N'Ship to 62-B', N'Alameda dos Canàrios, 9012', N'Sao Paulo', N'SP', N'10277', N'Brazil')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10787, 41, 2, CAST(N'2007-12-19 00:00:00.000' AS DateTime), CAST(N'2008-01-02 00:00:00.000' AS DateTime), CAST(N'2007-12-26 00:00:00.000' AS DateTime), 1, 249.9300, N'Destination DWJIO', N'9012 rue Alsace-Lorraine', N'Toulouse', NULL, N'10217', N'France')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10788, 63, 1, CAST(N'2007-12-22 00:00:00.000' AS DateTime), CAST(N'2008-01-19 00:00:00.000' AS DateTime), CAST(N'2008-01-19 00:00:00.000' AS DateTime), 2, 42.7000, N'Ship to 63-C', N'Taucherstraße 3456', N'Cunewalde', NULL, N'10281', N'Germany')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10789, 23, 1, CAST(N'2007-12-22 00:00:00.000' AS DateTime), CAST(N'2008-01-19 00:00:00.000' AS DateTime), CAST(N'2007-12-31 00:00:00.000' AS DateTime), 2, 100.6000, N'Destination PXQRR', N'5678, chaussée de Tournai', N'Lille', NULL, N'10163', N'France')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10790, 31, 6, CAST(N'2007-12-22 00:00:00.000' AS DateTime), CAST(N'2008-01-19 00:00:00.000' AS DateTime), CAST(N'2007-12-26 00:00:00.000' AS DateTime), 1, 28.2300, N'Destination XOIGC', N'Av. Brasil, 8901', N'Campinas', N'SP', N'10186', N'Brazil')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10791, 25, 6, CAST(N'2007-12-23 00:00:00.000' AS DateTime), CAST(N'2008-01-20 00:00:00.000' AS DateTime), CAST(N'2008-01-01 00:00:00.000' AS DateTime), 2, 16.8500, N'Destination QOCBL', N'Berliner Platz 1234', N'München', NULL, N'10169', N'Germany')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10792, 91, 1, CAST(N'2007-12-23 00:00:00.000' AS DateTime), CAST(N'2008-01-20 00:00:00.000' AS DateTime), CAST(N'2007-12-31 00:00:00.000' AS DateTime), 3, 23.7900, N'Ship to 91-C', N'ul. Filtrowa 7890', N'Warszawa', NULL, N'10366', N'Poland')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10793, 4, 3, CAST(N'2007-12-24 00:00:00.000' AS DateTime), CAST(N'2008-01-21 00:00:00.000' AS DateTime), CAST(N'2008-01-08 00:00:00.000' AS DateTime), 3, 4.5200, N'Ship to 4-B', N'Brook Farm Stratford St. Mary 1234', N'Colchester', N'Essex', N'10239', N'UK')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10794, 61, 6, CAST(N'2007-12-24 00:00:00.000' AS DateTime), CAST(N'2008-01-21 00:00:00.000' AS DateTime), CAST(N'2008-01-02 00:00:00.000' AS DateTime), 1, 21.4900, N'Ship to 61-C', N'Rua da Panificadora, 7890', N'Rio de Janeiro', N'RJ', N'10275', N'Brazil')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10795, 20, 8, CAST(N'2007-12-24 00:00:00.000' AS DateTime), CAST(N'2008-01-21 00:00:00.000' AS DateTime), CAST(N'2008-01-20 00:00:00.000' AS DateTime), 2, 126.6600, N'Destination FFXKT', N'Kirchgasse 0123', N'Graz', NULL, N'10158', N'Austria')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10796, 35, 3, CAST(N'2007-12-25 00:00:00.000' AS DateTime), CAST(N'2008-01-22 00:00:00.000' AS DateTime), CAST(N'2008-01-14 00:00:00.000' AS DateTime), 1, 26.5200, N'Destination UOUWK', N'Carrera 9012 con Ave. Carlos Soublette #8-35', N'San Cristóbal', N'Táchira', N'10197', N'Venezuela')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10797, 17, 7, CAST(N'2007-12-25 00:00:00.000' AS DateTime), CAST(N'2008-01-22 00:00:00.000' AS DateTime), CAST(N'2008-01-05 00:00:00.000' AS DateTime), 2, 33.3500, N'Destination AJTHX', N'Walserweg 9012', N'Aachen', NULL, N'10147', N'Germany')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10798, 38, 2, CAST(N'2007-12-26 00:00:00.000' AS DateTime), CAST(N'2008-01-23 00:00:00.000' AS DateTime), CAST(N'2008-01-05 00:00:00.000' AS DateTime), 1, 2.3300, N'Destination AXVHD', N'Garden House Crowther Way 9012', N'Cowes', N'Isle of Wight', N'10207', N'UK')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10799, 39, 9, CAST(N'2007-12-26 00:00:00.000' AS DateTime), CAST(N'2008-02-06 00:00:00.000' AS DateTime), CAST(N'2008-01-05 00:00:00.000' AS DateTime), 3, 30.7600, N'Destination DKMQA', N'Maubelstr. 0123', N'Brandenburg', NULL, N'10208', N'Germany')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10800, 72, 1, CAST(N'2007-12-26 00:00:00.000' AS DateTime), CAST(N'2008-01-23 00:00:00.000' AS DateTime), CAST(N'2008-01-05 00:00:00.000' AS DateTime), 3, 137.4400, N'Ship to 72-C', N'1234 Wadhurst Rd.', N'London', NULL, N'10309', N'UK')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10801, 8, 4, CAST(N'2007-12-29 00:00:00.000' AS DateTime), CAST(N'2008-01-26 00:00:00.000' AS DateTime), CAST(N'2007-12-31 00:00:00.000' AS DateTime), 2, 97.0900, N'Ship to 8-C', N'C/ Araquil, 1234', N'Madrid', NULL, N'10360', N'Spain')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10802, 73, 4, CAST(N'2007-12-29 00:00:00.000' AS DateTime), CAST(N'2008-01-26 00:00:00.000' AS DateTime), CAST(N'2008-01-02 00:00:00.000' AS DateTime), 2, 257.2600, N'Ship to 73-A', N'Vinbæltet 1234', N'Kobenhavn', NULL, N'10310', N'Denmark')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10803, 88, 4, CAST(N'2007-12-30 00:00:00.000' AS DateTime), CAST(N'2008-01-27 00:00:00.000' AS DateTime), CAST(N'2008-01-06 00:00:00.000' AS DateTime), 1, 55.2300, N'Ship to 88-B', N'Rua do Mercado, 5678', N'Resende', N'SP', N'10354', N'Brazil')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10804, 72, 6, CAST(N'2007-12-30 00:00:00.000' AS DateTime), CAST(N'2008-01-27 00:00:00.000' AS DateTime), CAST(N'2008-01-07 00:00:00.000' AS DateTime), 2, 27.3300, N'Ship to 72-C', N'1234 Wadhurst Rd.', N'London', NULL, N'10309', N'UK')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10805, 77, 2, CAST(N'2007-12-30 00:00:00.000' AS DateTime), CAST(N'2008-01-27 00:00:00.000' AS DateTime), CAST(N'2008-01-09 00:00:00.000' AS DateTime), 3, 237.3400, N'Ship to 77-A', N'1234 Jefferson Way Suite 2', N'Portland', N'OR', N'10320', N'USA')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10806, 84, 3, CAST(N'2007-12-31 00:00:00.000' AS DateTime), CAST(N'2008-01-28 00:00:00.000' AS DateTime), CAST(N'2008-01-05 00:00:00.000' AS DateTime), 2, 22.1100, N'Ship to 84-C', N'5678, rue du Commerce', N'Lyon', NULL, N'10344', N'France')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10807, 27, 4, CAST(N'2007-12-31 00:00:00.000' AS DateTime), CAST(N'2008-01-28 00:00:00.000' AS DateTime), CAST(N'2008-01-30 00:00:00.000' AS DateTime), 1, 1.3600, N'Destination XNLFB', N'Via Monte Bianco 5678', N'Torino', NULL, N'10173', N'Italy')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10808, 55, 2, CAST(N'2008-01-01 00:00:00.000' AS DateTime), CAST(N'2008-01-29 00:00:00.000' AS DateTime), CAST(N'2008-01-09 00:00:00.000' AS DateTime), 3, 45.5300, N'Ship to 55-B', N'8901 Bering St.', N'Anchorage', N'AK', N'10256', N'USA')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10809, 88, 7, CAST(N'2008-01-01 00:00:00.000' AS DateTime), CAST(N'2008-01-29 00:00:00.000' AS DateTime), CAST(N'2008-01-07 00:00:00.000' AS DateTime), 1, 4.8700, N'Ship to 88-C', N'Rua do Mercado, 6789', N'Resende', N'SP', N'10355', N'Brazil')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10810, 42, 2, CAST(N'2008-01-01 00:00:00.000' AS DateTime), CAST(N'2008-01-29 00:00:00.000' AS DateTime), CAST(N'2008-01-07 00:00:00.000' AS DateTime), 3, 4.3300, N'Ship to 42-A', N'1234 Elm St.', N'Vancouver', N'BC', N'10219', N'Canada')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10811, 47, 8, CAST(N'2008-01-02 00:00:00.000' AS DateTime), CAST(N'2008-01-30 00:00:00.000' AS DateTime), CAST(N'2008-01-08 00:00:00.000' AS DateTime), 1, 31.2200, N'Ship to 47-B', N'Ave. 5 de Mayo Porlamar 4567', N'I. de Margarita', N'Nueva Esparta', N'10231', N'Venezuela')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10812, 66, 5, CAST(N'2008-01-02 00:00:00.000' AS DateTime), CAST(N'2008-01-30 00:00:00.000' AS DateTime), CAST(N'2008-01-12 00:00:00.000' AS DateTime), 1, 59.7800, N'Ship to 66-B', N'Strada Provinciale 1234', N'Reggio Emilia', NULL, N'10289', N'Italy')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10813, 67, 1, CAST(N'2008-01-05 00:00:00.000' AS DateTime), CAST(N'2008-02-02 00:00:00.000' AS DateTime), CAST(N'2008-01-09 00:00:00.000' AS DateTime), 1, 47.3800, N'Ship to 67-C', N'Av. Copacabana, 5678', N'Rio de Janeiro', N'RJ', N'10293', N'Brazil')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10814, 84, 3, CAST(N'2008-01-05 00:00:00.000' AS DateTime), CAST(N'2008-02-02 00:00:00.000' AS DateTime), CAST(N'2008-01-14 00:00:00.000' AS DateTime), 3, 130.9400, N'Ship to 84-B', N'4567, rue du Commerce', N'Lyon', NULL, N'10343', N'France')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10815, 71, 2, CAST(N'2008-01-05 00:00:00.000' AS DateTime), CAST(N'2008-02-02 00:00:00.000' AS DateTime), CAST(N'2008-01-14 00:00:00.000' AS DateTime), 3, 14.6200, N'Ship to 71-A', N'7890 Suffolk Ln.', N'Boise', N'ID', N'10305', N'USA')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10816, 32, 4, CAST(N'2008-01-06 00:00:00.000' AS DateTime), CAST(N'2008-02-03 00:00:00.000' AS DateTime), CAST(N'2008-02-04 00:00:00.000' AS DateTime), 2, 719.7800, N'Destination AVQUS', N'2345 Baker Blvd.', N'Eugene', N'OR', N'10190', N'USA')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10817, 39, 3, CAST(N'2008-01-06 00:00:00.000' AS DateTime), CAST(N'2008-01-20 00:00:00.000' AS DateTime), CAST(N'2008-01-13 00:00:00.000' AS DateTime), 2, 306.0700, N'Destination RMBHM', N'Maubelstr. 1234', N'Brandenburg', NULL, N'10209', N'Germany')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10818, 49, 7, CAST(N'2008-01-07 00:00:00.000' AS DateTime), CAST(N'2008-02-04 00:00:00.000' AS DateTime), CAST(N'2008-01-12 00:00:00.000' AS DateTime), 3, 65.4800, N'Ship to 49-B', N'Via Ludovico il Moro 9012', N'Bergamo', NULL, N'10236', N'Italy')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10819, 12, 2, CAST(N'2008-01-07 00:00:00.000' AS DateTime), CAST(N'2008-02-04 00:00:00.000' AS DateTime), CAST(N'2008-01-16 00:00:00.000' AS DateTime), 3, 19.7600, N'Destination QTHBC', N'Cerrito 6789', N'Buenos Aires', NULL, N'10134', N'Argentina')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10820, 65, 3, CAST(N'2008-01-07 00:00:00.000' AS DateTime), CAST(N'2008-02-04 00:00:00.000' AS DateTime), CAST(N'2008-01-13 00:00:00.000' AS DateTime), 2, 37.5200, N'Ship to 65-B', N'8901 Milton Dr.', N'Albuquerque', N'NM', N'10286', N'USA')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10821, 75, 1, CAST(N'2008-01-08 00:00:00.000' AS DateTime), CAST(N'2008-02-05 00:00:00.000' AS DateTime), CAST(N'2008-01-15 00:00:00.000' AS DateTime), 1, 36.6800, N'Ship to 75-A', N'P.O. Box 5678', N'Lander', N'WY', N'10314', N'USA')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10822, 82, 6, CAST(N'2008-01-08 00:00:00.000' AS DateTime), CAST(N'2008-02-05 00:00:00.000' AS DateTime), CAST(N'2008-01-16 00:00:00.000' AS DateTime), 3, 7.0000, N'Ship to 82-B', N'9012 DaVinci Blvd.', N'Kirkland', N'WA', N'10338', N'USA')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10823, 46, 5, CAST(N'2008-01-09 00:00:00.000' AS DateTime), CAST(N'2008-02-06 00:00:00.000' AS DateTime), CAST(N'2008-01-13 00:00:00.000' AS DateTime), 2, 163.9700, N'Ship to 46-A', N'Carrera 0123 con Ave. Bolívar #65-98 Llano Largo', N'Barquisimeto', N'Lara', N'10227', N'Venezuela')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10824, 24, 8, CAST(N'2008-01-09 00:00:00.000' AS DateTime), CAST(N'2008-02-06 00:00:00.000' AS DateTime), CAST(N'2008-01-30 00:00:00.000' AS DateTime), 1, 1.2300, N'Destination NCKKO', N'Åkergatan 7890', N'Bräcke', NULL, N'10165', N'Sweden')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10825, 17, 1, CAST(N'2008-01-09 00:00:00.000' AS DateTime), CAST(N'2008-02-06 00:00:00.000' AS DateTime), CAST(N'2008-01-14 00:00:00.000' AS DateTime), 1, 79.2500, N'Destination BJCXA', N'Walserweg 7890', N'Aachen', NULL, N'10145', N'Germany')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10826, 7, 6, CAST(N'2008-01-12 00:00:00.000' AS DateTime), CAST(N'2008-02-09 00:00:00.000' AS DateTime), CAST(N'2008-02-06 00:00:00.000' AS DateTime), 1, 7.0900, N'Ship to 7-C', N'2345, place Kléber', N'Strasbourg', NULL, N'10331', N'France')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10827, 9, 1, CAST(N'2008-01-12 00:00:00.000' AS DateTime), CAST(N'2008-01-26 00:00:00.000' AS DateTime), CAST(N'2008-02-06 00:00:00.000' AS DateTime), 2, 63.5400, N'Ship to 9-B', N'9012, rue des Bouchers', N'Marseille', NULL, N'10368', N'France')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10828, 64, 9, CAST(N'2008-01-13 00:00:00.000' AS DateTime), CAST(N'2008-01-27 00:00:00.000' AS DateTime), CAST(N'2008-02-04 00:00:00.000' AS DateTime), 1, 90.8500, N'Ship to 64-B', N'Av. del Libertador 5678', N'Buenos Aires', NULL, N'10283', N'Argentina')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10829, 38, 9, CAST(N'2008-01-13 00:00:00.000' AS DateTime), CAST(N'2008-02-10 00:00:00.000' AS DateTime), CAST(N'2008-01-23 00:00:00.000' AS DateTime), 1, 154.7200, N'Destination QVTLW', N'Garden House Crowther Way 7890', N'Cowes', N'Isle of Wight', N'10205', N'UK')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10830, 81, 4, CAST(N'2008-01-13 00:00:00.000' AS DateTime), CAST(N'2008-02-24 00:00:00.000' AS DateTime), CAST(N'2008-01-21 00:00:00.000' AS DateTime), 2, 81.8300, N'Ship to 81-C', N'Av. Inês de Castro, 7890', N'Sao Paulo', N'SP', N'10336', N'Brazil')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10831, 70, 3, CAST(N'2008-01-14 00:00:00.000' AS DateTime), CAST(N'2008-02-11 00:00:00.000' AS DateTime), CAST(N'2008-01-23 00:00:00.000' AS DateTime), 2, 72.1900, N'Ship to 70-B', N'Erling Skakkes gate 5678', N'Stavern', NULL, N'10303', N'Norway')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10832, 41, 2, CAST(N'2008-01-14 00:00:00.000' AS DateTime), CAST(N'2008-02-11 00:00:00.000' AS DateTime), CAST(N'2008-01-19 00:00:00.000' AS DateTime), 2, 43.2600, N'Ship to 41-C', N'0123 rue Alsace-Lorraine', N'Toulouse', NULL, N'10218', N'France')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10833, 56, 6, CAST(N'2008-01-15 00:00:00.000' AS DateTime), CAST(N'2008-02-12 00:00:00.000' AS DateTime), CAST(N'2008-01-23 00:00:00.000' AS DateTime), 2, 71.4900, N'Ship to 56-B', N'Mehrheimerstr. 1234', N'Köln', NULL, N'10259', N'Germany')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10834, 81, 1, CAST(N'2008-01-15 00:00:00.000' AS DateTime), CAST(N'2008-02-12 00:00:00.000' AS DateTime), CAST(N'2008-01-19 00:00:00.000' AS DateTime), 3, 29.7800, N'Ship to 81-A', N'Av. Inês de Castro, 6789', N'Sao Paulo', N'SP', N'10335', N'Brazil')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10835, 1, 1, CAST(N'2008-01-15 00:00:00.000' AS DateTime), CAST(N'2008-02-12 00:00:00.000' AS DateTime), CAST(N'2008-01-21 00:00:00.000' AS DateTime), 3, 69.5300, N'Destination LOUIE', N'Obere Str. 6789', N'Berlin', NULL, N'10154', N'Germany')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10836, 20, 7, CAST(N'2008-01-16 00:00:00.000' AS DateTime), CAST(N'2008-02-13 00:00:00.000' AS DateTime), CAST(N'2008-01-21 00:00:00.000' AS DateTime), 1, 411.8800, N'Destination CUVPF', N'Kirchgasse 1234', N'Graz', NULL, N'10159', N'Austria')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10837, 5, 9, CAST(N'2008-01-16 00:00:00.000' AS DateTime), CAST(N'2008-02-13 00:00:00.000' AS DateTime), CAST(N'2008-01-23 00:00:00.000' AS DateTime), 3, 13.3200, N'Ship to 5-A', N'Berguvsvägen  9012', N'Luleå', NULL, N'10267', N'Sweden')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10838, 47, 3, CAST(N'2008-01-19 00:00:00.000' AS DateTime), CAST(N'2008-02-16 00:00:00.000' AS DateTime), CAST(N'2008-01-23 00:00:00.000' AS DateTime), 3, 59.2800, N'Ship to 47-A', N'Ave. 5 de Mayo Porlamar 3456', N'I. de Margarita', N'Nueva Esparta', N'10230', N'Venezuela')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10839, 81, 3, CAST(N'2008-01-19 00:00:00.000' AS DateTime), CAST(N'2008-02-16 00:00:00.000' AS DateTime), CAST(N'2008-01-22 00:00:00.000' AS DateTime), 3, 35.4300, N'Ship to 81-C', N'Av. Inês de Castro, 7890', N'Sao Paulo', N'SP', N'10336', N'Brazil')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10840, 47, 4, CAST(N'2008-01-19 00:00:00.000' AS DateTime), CAST(N'2008-03-02 00:00:00.000' AS DateTime), CAST(N'2008-02-16 00:00:00.000' AS DateTime), 2, 2.7100, N'Ship to 47-A', N'Ave. 5 de Mayo Porlamar 3456', N'I. de Margarita', N'Nueva Esparta', N'10230', N'Venezuela')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10841, 76, 5, CAST(N'2008-01-20 00:00:00.000' AS DateTime), CAST(N'2008-02-17 00:00:00.000' AS DateTime), CAST(N'2008-01-29 00:00:00.000' AS DateTime), 2, 424.3000, N'Ship to 76-B', N'Boulevard Tirou, 9012', N'Charleroi', NULL, N'10318', N'Belgium')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10842, 80, 1, CAST(N'2008-01-20 00:00:00.000' AS DateTime), CAST(N'2008-02-17 00:00:00.000' AS DateTime), CAST(N'2008-01-29 00:00:00.000' AS DateTime), 3, 54.4200, N'Ship to 80-A', N'Avda. Azteca 3456', N'México D.F.', NULL, N'10332', N'Mexico')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10843, 84, 4, CAST(N'2008-01-21 00:00:00.000' AS DateTime), CAST(N'2008-02-18 00:00:00.000' AS DateTime), CAST(N'2008-01-26 00:00:00.000' AS DateTime), 2, 9.2600, N'Ship to 84-C', N'5678, rue du Commerce', N'Lyon', NULL, N'10344', N'France')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10844, 59, 8, CAST(N'2008-01-21 00:00:00.000' AS DateTime), CAST(N'2008-02-18 00:00:00.000' AS DateTime), CAST(N'2008-01-26 00:00:00.000' AS DateTime), 2, 25.2200, N'Ship to 59-A', N'Geislweg 6789', N'Salzburg', NULL, N'10264', N'Austria')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10845, 63, 8, CAST(N'2008-01-21 00:00:00.000' AS DateTime), CAST(N'2008-02-04 00:00:00.000' AS DateTime), CAST(N'2008-01-30 00:00:00.000' AS DateTime), 1, 212.9800, N'Ship to 63-A', N'Taucherstraße 1234', N'Cunewalde', NULL, N'10279', N'Germany')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10846, 76, 2, CAST(N'2008-01-22 00:00:00.000' AS DateTime), CAST(N'2008-03-05 00:00:00.000' AS DateTime), CAST(N'2008-01-23 00:00:00.000' AS DateTime), 3, 56.4600, N'Ship to 76-C', N'Boulevard Tirou, 0123', N'Charleroi', NULL, N'10319', N'Belgium')
GO
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10847, 71, 4, CAST(N'2008-01-22 00:00:00.000' AS DateTime), CAST(N'2008-02-05 00:00:00.000' AS DateTime), CAST(N'2008-02-10 00:00:00.000' AS DateTime), 3, 487.5700, N'Ship to 71-A', N'7890 Suffolk Ln.', N'Boise', N'ID', N'10305', N'USA')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10848, 16, 7, CAST(N'2008-01-23 00:00:00.000' AS DateTime), CAST(N'2008-02-20 00:00:00.000' AS DateTime), CAST(N'2008-01-29 00:00:00.000' AS DateTime), 2, 38.2400, N'Destination QKQNB', N'Berkeley Gardens 5678  Brewery', N'London', NULL, N'10143', N'UK')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10849, 39, 9, CAST(N'2008-01-23 00:00:00.000' AS DateTime), CAST(N'2008-02-20 00:00:00.000' AS DateTime), CAST(N'2008-01-30 00:00:00.000' AS DateTime), 2, 0.5600, N'Destination DKMQA', N'Maubelstr. 0123', N'Brandenburg', NULL, N'10208', N'Germany')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10850, 84, 1, CAST(N'2008-01-23 00:00:00.000' AS DateTime), CAST(N'2008-03-06 00:00:00.000' AS DateTime), CAST(N'2008-01-30 00:00:00.000' AS DateTime), 1, 49.1900, N'Ship to 84-C', N'5678, rue du Commerce', N'Lyon', NULL, N'10344', N'France')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10851, 67, 5, CAST(N'2008-01-26 00:00:00.000' AS DateTime), CAST(N'2008-02-23 00:00:00.000' AS DateTime), CAST(N'2008-02-02 00:00:00.000' AS DateTime), 1, 160.5500, N'Ship to 67-C', N'Av. Copacabana, 5678', N'Rio de Janeiro', N'RJ', N'10293', N'Brazil')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10852, 65, 8, CAST(N'2008-01-26 00:00:00.000' AS DateTime), CAST(N'2008-02-09 00:00:00.000' AS DateTime), CAST(N'2008-01-30 00:00:00.000' AS DateTime), 1, 174.0500, N'Ship to 65-A', N'7890 Milton Dr.', N'Albuquerque', N'NM', N'10285', N'USA')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10853, 6, 9, CAST(N'2008-01-27 00:00:00.000' AS DateTime), CAST(N'2008-02-24 00:00:00.000' AS DateTime), CAST(N'2008-02-03 00:00:00.000' AS DateTime), 2, 53.8300, N'Ship to 6-B', N'Forsterstr. 3456', N'Mannheim', NULL, N'10301', N'Germany')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10854, 20, 3, CAST(N'2008-01-27 00:00:00.000' AS DateTime), CAST(N'2008-02-24 00:00:00.000' AS DateTime), CAST(N'2008-02-05 00:00:00.000' AS DateTime), 2, 100.2200, N'Destination CUVPF', N'Kirchgasse 1234', N'Graz', NULL, N'10159', N'Austria')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10855, 55, 3, CAST(N'2008-01-27 00:00:00.000' AS DateTime), CAST(N'2008-02-24 00:00:00.000' AS DateTime), CAST(N'2008-02-04 00:00:00.000' AS DateTime), 1, 170.9700, N'Ship to 55-A', N'7890 Bering St.', N'Anchorage', N'AK', N'10255', N'USA')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10856, 3, 3, CAST(N'2008-01-28 00:00:00.000' AS DateTime), CAST(N'2008-02-25 00:00:00.000' AS DateTime), CAST(N'2008-02-10 00:00:00.000' AS DateTime), 2, 58.4300, N'Destination FQFLS', N'Mataderos  3456', N'México D.F.', NULL, N'10211', N'Mexico')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10857, 5, 8, CAST(N'2008-01-28 00:00:00.000' AS DateTime), CAST(N'2008-02-25 00:00:00.000' AS DateTime), CAST(N'2008-02-06 00:00:00.000' AS DateTime), 2, 188.8500, N'Ship to 5-B', N'Berguvsvägen  0123', N'Luleå', NULL, N'10268', N'Sweden')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10858, 40, 2, CAST(N'2008-01-29 00:00:00.000' AS DateTime), CAST(N'2008-02-26 00:00:00.000' AS DateTime), CAST(N'2008-02-03 00:00:00.000' AS DateTime), 1, 52.5100, N'Destination POAEW', N'7890, avenue de l''Europe', N'Versailles', NULL, N'10215', N'France')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10859, 25, 1, CAST(N'2008-01-29 00:00:00.000' AS DateTime), CAST(N'2008-02-26 00:00:00.000' AS DateTime), CAST(N'2008-02-02 00:00:00.000' AS DateTime), 2, 76.1000, N'Destination QOCBL', N'Berliner Platz 1234', N'München', NULL, N'10169', N'Germany')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10860, 26, 3, CAST(N'2008-01-29 00:00:00.000' AS DateTime), CAST(N'2008-02-26 00:00:00.000' AS DateTime), CAST(N'2008-02-04 00:00:00.000' AS DateTime), 3, 19.2600, N'Destination XBVKN', N'3456, rue Royale', N'Nantes', NULL, N'10171', N'France')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10861, 89, 4, CAST(N'2008-01-30 00:00:00.000' AS DateTime), CAST(N'2008-02-27 00:00:00.000' AS DateTime), CAST(N'2008-02-17 00:00:00.000' AS DateTime), 2, 14.9300, N'Ship to 89-C', N'9012 - 12th Ave. S.', N'Seattle', N'WA', N'10358', N'USA')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10862, 44, 8, CAST(N'2008-01-30 00:00:00.000' AS DateTime), CAST(N'2008-03-13 00:00:00.000' AS DateTime), CAST(N'2008-02-02 00:00:00.000' AS DateTime), 2, 53.2300, N'Ship to 44-C', N'Magazinweg 6789', N'Frankfurt a.M.', NULL, N'10224', N'Germany')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10863, 35, 4, CAST(N'2008-02-02 00:00:00.000' AS DateTime), CAST(N'2008-03-02 00:00:00.000' AS DateTime), CAST(N'2008-02-17 00:00:00.000' AS DateTime), 2, 30.2600, N'Destination UOUWK', N'Carrera 9012 con Ave. Carlos Soublette #8-35', N'San Cristóbal', N'Táchira', N'10197', N'Venezuela')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10864, 4, 4, CAST(N'2008-02-02 00:00:00.000' AS DateTime), CAST(N'2008-03-02 00:00:00.000' AS DateTime), CAST(N'2008-02-09 00:00:00.000' AS DateTime), 2, 3.0400, N'Ship to 4-C', N'Brook Farm Stratford St. Mary 2345', N'Colchester', N'Essex', N'10240', N'UK')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10865, 63, 2, CAST(N'2008-02-02 00:00:00.000' AS DateTime), CAST(N'2008-02-16 00:00:00.000' AS DateTime), CAST(N'2008-02-12 00:00:00.000' AS DateTime), 1, 348.1400, N'Ship to 63-A', N'Taucherstraße 1234', N'Cunewalde', NULL, N'10279', N'Germany')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10866, 5, 5, CAST(N'2008-02-03 00:00:00.000' AS DateTime), CAST(N'2008-03-03 00:00:00.000' AS DateTime), CAST(N'2008-02-12 00:00:00.000' AS DateTime), 1, 109.1100, N'Ship to 5-B', N'Berguvsvägen  0123', N'Luleå', NULL, N'10268', N'Sweden')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10867, 48, 6, CAST(N'2008-02-03 00:00:00.000' AS DateTime), CAST(N'2008-03-17 00:00:00.000' AS DateTime), CAST(N'2008-02-11 00:00:00.000' AS DateTime), 1, 1.9300, N'Ship to 48-B', N'6789 Chiaroscuro Rd.', N'Portland', N'OR', N'10233', N'USA')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10868, 62, 7, CAST(N'2008-02-04 00:00:00.000' AS DateTime), CAST(N'2008-03-04 00:00:00.000' AS DateTime), CAST(N'2008-02-23 00:00:00.000' AS DateTime), 2, 191.2700, N'Ship to 62-C', N'Alameda dos Canàrios, 0123', N'Sao Paulo', N'SP', N'10278', N'Brazil')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10869, 72, 5, CAST(N'2008-02-04 00:00:00.000' AS DateTime), CAST(N'2008-03-04 00:00:00.000' AS DateTime), CAST(N'2008-02-09 00:00:00.000' AS DateTime), 1, 143.2800, N'Ship to 72-A', N'0123 Wadhurst Rd.', N'London', NULL, N'10308', N'UK')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10870, 91, 5, CAST(N'2008-02-04 00:00:00.000' AS DateTime), CAST(N'2008-03-04 00:00:00.000' AS DateTime), CAST(N'2008-02-13 00:00:00.000' AS DateTime), 3, 12.0400, N'Ship to 91-A', N'ul. Filtrowa 5678', N'Warszawa', NULL, N'10364', N'Poland')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10871, 9, 9, CAST(N'2008-02-05 00:00:00.000' AS DateTime), CAST(N'2008-03-05 00:00:00.000' AS DateTime), CAST(N'2008-02-10 00:00:00.000' AS DateTime), 2, 112.2700, N'Ship to 9-B', N'9012, rue des Bouchers', N'Marseille', NULL, N'10368', N'France')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10872, 30, 5, CAST(N'2008-02-05 00:00:00.000' AS DateTime), CAST(N'2008-03-05 00:00:00.000' AS DateTime), CAST(N'2008-02-09 00:00:00.000' AS DateTime), 2, 175.3200, N'Destination GGQIR', N'C/ Romero, 6789', N'Sevilla', NULL, N'10184', N'Spain')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10873, 90, 4, CAST(N'2008-02-06 00:00:00.000' AS DateTime), CAST(N'2008-03-06 00:00:00.000' AS DateTime), CAST(N'2008-02-09 00:00:00.000' AS DateTime), 1, 0.8200, N'Ship to 90-B', N'Keskuskatu 3456', N'Helsinki', NULL, N'10362', N'Finland')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10874, 30, 5, CAST(N'2008-02-06 00:00:00.000' AS DateTime), CAST(N'2008-03-06 00:00:00.000' AS DateTime), CAST(N'2008-02-11 00:00:00.000' AS DateTime), 2, 19.5800, N'Destination IIYDD', N'C/ Romero, 5678', N'Sevilla', NULL, N'10183', N'Spain')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10875, 5, 4, CAST(N'2008-02-06 00:00:00.000' AS DateTime), CAST(N'2008-03-06 00:00:00.000' AS DateTime), CAST(N'2008-03-03 00:00:00.000' AS DateTime), 2, 32.3700, N'Ship to 5-A', N'Berguvsvägen  9012', N'Luleå', NULL, N'10267', N'Sweden')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10876, 9, 7, CAST(N'2008-02-09 00:00:00.000' AS DateTime), CAST(N'2008-03-09 00:00:00.000' AS DateTime), CAST(N'2008-02-12 00:00:00.000' AS DateTime), 3, 60.4200, N'Ship to 9-A', N'8901, rue des Bouchers', N'Marseille', NULL, N'10367', N'France')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10877, 67, 1, CAST(N'2008-02-09 00:00:00.000' AS DateTime), CAST(N'2008-03-09 00:00:00.000' AS DateTime), CAST(N'2008-02-19 00:00:00.000' AS DateTime), 1, 38.0600, N'Ship to 67-B', N'Av. Copacabana, 4567', N'Rio de Janeiro', N'RJ', N'10292', N'Brazil')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10878, 63, 4, CAST(N'2008-02-10 00:00:00.000' AS DateTime), CAST(N'2008-03-10 00:00:00.000' AS DateTime), CAST(N'2008-02-12 00:00:00.000' AS DateTime), 1, 46.6900, N'Ship to 63-B', N'Taucherstraße 2345', N'Cunewalde', NULL, N'10280', N'Germany')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10879, 90, 3, CAST(N'2008-02-10 00:00:00.000' AS DateTime), CAST(N'2008-03-10 00:00:00.000' AS DateTime), CAST(N'2008-02-12 00:00:00.000' AS DateTime), 3, 8.5000, N'Ship to 90-A', N'Keskuskatu 2345', N'Helsinki', NULL, N'10361', N'Finland')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10880, 24, 7, CAST(N'2008-02-10 00:00:00.000' AS DateTime), CAST(N'2008-03-24 00:00:00.000' AS DateTime), CAST(N'2008-02-18 00:00:00.000' AS DateTime), 1, 88.0100, N'Destination KBSBN', N'Åkergatan 9012', N'Bräcke', NULL, N'10167', N'Sweden')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10881, 12, 4, CAST(N'2008-02-11 00:00:00.000' AS DateTime), CAST(N'2008-03-11 00:00:00.000' AS DateTime), CAST(N'2008-02-18 00:00:00.000' AS DateTime), 1, 2.8400, N'Destination IGLOB', N'Cerrito 7890', N'Buenos Aires', NULL, N'10135', N'Argentina')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10882, 71, 4, CAST(N'2008-02-11 00:00:00.000' AS DateTime), CAST(N'2008-03-11 00:00:00.000' AS DateTime), CAST(N'2008-02-20 00:00:00.000' AS DateTime), 3, 23.1000, N'Ship to 71-B', N'8901 Suffolk Ln.', N'Boise', N'ID', N'10306', N'USA')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10883, 48, 8, CAST(N'2008-02-12 00:00:00.000' AS DateTime), CAST(N'2008-03-12 00:00:00.000' AS DateTime), CAST(N'2008-02-20 00:00:00.000' AS DateTime), 3, 0.5300, N'Ship to 48-C', N'7890 Chiaroscuro Rd.', N'Portland', N'OR', N'10234', N'USA')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10884, 45, 4, CAST(N'2008-02-12 00:00:00.000' AS DateTime), CAST(N'2008-03-12 00:00:00.000' AS DateTime), CAST(N'2008-02-13 00:00:00.000' AS DateTime), 2, 90.9700, N'Ship to 45-C', N'9012 Polk St. Suite 5', N'San Francisco', N'CA', N'10226', N'USA')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10885, 76, 6, CAST(N'2008-02-12 00:00:00.000' AS DateTime), CAST(N'2008-03-12 00:00:00.000' AS DateTime), CAST(N'2008-02-18 00:00:00.000' AS DateTime), 3, 5.6400, N'Ship to 76-B', N'Boulevard Tirou, 9012', N'Charleroi', NULL, N'10318', N'Belgium')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10886, 34, 1, CAST(N'2008-02-13 00:00:00.000' AS DateTime), CAST(N'2008-03-13 00:00:00.000' AS DateTime), CAST(N'2008-03-02 00:00:00.000' AS DateTime), 1, 4.9900, N'Destination SCQXA', N'Rua do Paço, 7890', N'Rio de Janeiro', N'RJ', N'10195', N'Brazil')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10887, 29, 8, CAST(N'2008-02-13 00:00:00.000' AS DateTime), CAST(N'2008-03-13 00:00:00.000' AS DateTime), CAST(N'2008-02-16 00:00:00.000' AS DateTime), 3, 1.2500, N'Destination VPNNG', N'Rambla de Cataluña, 0123', N'Barcelona', NULL, N'10178', N'Spain')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10888, 30, 1, CAST(N'2008-02-16 00:00:00.000' AS DateTime), CAST(N'2008-03-16 00:00:00.000' AS DateTime), CAST(N'2008-02-23 00:00:00.000' AS DateTime), 2, 51.8700, N'Destination IIYDD', N'C/ Romero, 5678', N'Sevilla', NULL, N'10183', N'Spain')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10889, 65, 9, CAST(N'2008-02-16 00:00:00.000' AS DateTime), CAST(N'2008-03-16 00:00:00.000' AS DateTime), CAST(N'2008-02-23 00:00:00.000' AS DateTime), 3, 280.6100, N'Ship to 65-C', N'9012 Milton Dr.', N'Albuquerque', N'NM', N'10287', N'USA')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10890, 18, 7, CAST(N'2008-02-16 00:00:00.000' AS DateTime), CAST(N'2008-03-16 00:00:00.000' AS DateTime), CAST(N'2008-02-18 00:00:00.000' AS DateTime), 1, 32.7600, N'Destination JNSYI', N'1234, rue des Cinquante Otages', N'Nantes', NULL, N'10149', N'France')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10891, 44, 7, CAST(N'2008-02-17 00:00:00.000' AS DateTime), CAST(N'2008-03-17 00:00:00.000' AS DateTime), CAST(N'2008-02-19 00:00:00.000' AS DateTime), 2, 20.3700, N'Ship to 44-A', N'Magazinweg 4567', N'Frankfurt a.M.', NULL, N'10222', N'Germany')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10892, 50, 4, CAST(N'2008-02-17 00:00:00.000' AS DateTime), CAST(N'2008-03-17 00:00:00.000' AS DateTime), CAST(N'2008-02-19 00:00:00.000' AS DateTime), 2, 120.2700, N'Ship to 50-A', N'Rue Joseph-Bens 3456', N'Bruxelles', NULL, N'10241', N'Belgium')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10893, 39, 9, CAST(N'2008-02-18 00:00:00.000' AS DateTime), CAST(N'2008-03-18 00:00:00.000' AS DateTime), CAST(N'2008-02-20 00:00:00.000' AS DateTime), 2, 77.7800, N'Destination RMBHM', N'Maubelstr. 1234', N'Brandenburg', NULL, N'10209', N'Germany')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10894, 71, 1, CAST(N'2008-02-18 00:00:00.000' AS DateTime), CAST(N'2008-03-18 00:00:00.000' AS DateTime), CAST(N'2008-02-20 00:00:00.000' AS DateTime), 1, 116.1300, N'Ship to 71-A', N'7890 Suffolk Ln.', N'Boise', N'ID', N'10305', N'USA')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10895, 20, 3, CAST(N'2008-02-18 00:00:00.000' AS DateTime), CAST(N'2008-03-18 00:00:00.000' AS DateTime), CAST(N'2008-02-23 00:00:00.000' AS DateTime), 1, 162.7500, N'Destination CUVPF', N'Kirchgasse 1234', N'Graz', NULL, N'10159', N'Austria')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10896, 50, 7, CAST(N'2008-02-19 00:00:00.000' AS DateTime), CAST(N'2008-03-19 00:00:00.000' AS DateTime), CAST(N'2008-02-27 00:00:00.000' AS DateTime), 3, 32.4500, N'Ship to 50-A', N'Rue Joseph-Bens 3456', N'Bruxelles', NULL, N'10241', N'Belgium')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10897, 37, 3, CAST(N'2008-02-19 00:00:00.000' AS DateTime), CAST(N'2008-03-19 00:00:00.000' AS DateTime), CAST(N'2008-02-25 00:00:00.000' AS DateTime), 2, 603.5400, N'Destination DGKOU', N'6789 Johnstown Road', N'Cork', N'Co. Cork', N'10204', N'Ireland')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10898, 54, 4, CAST(N'2008-02-20 00:00:00.000' AS DateTime), CAST(N'2008-03-20 00:00:00.000' AS DateTime), CAST(N'2008-03-06 00:00:00.000' AS DateTime), 2, 1.2700, N'Ship to 54-B', N'Ing. Gustavo Moncada 5678 Piso 20-A', N'Buenos Aires', NULL, N'10253', N'Argentina')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10899, 46, 5, CAST(N'2008-02-20 00:00:00.000' AS DateTime), CAST(N'2008-03-20 00:00:00.000' AS DateTime), CAST(N'2008-02-26 00:00:00.000' AS DateTime), 3, 1.2100, N'Ship to 46-C', N'Carrera 2345 con Ave. Bolívar #65-98 Llano Largo', N'Barquisimeto', N'Lara', N'10229', N'Venezuela')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10900, 88, 1, CAST(N'2008-02-20 00:00:00.000' AS DateTime), CAST(N'2008-03-20 00:00:00.000' AS DateTime), CAST(N'2008-03-04 00:00:00.000' AS DateTime), 2, 1.6600, N'Ship to 88-A', N'Rua do Mercado, 4567', N'Resende', N'SP', N'10353', N'Brazil')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10901, 35, 4, CAST(N'2008-02-23 00:00:00.000' AS DateTime), CAST(N'2008-03-23 00:00:00.000' AS DateTime), CAST(N'2008-02-26 00:00:00.000' AS DateTime), 1, 62.0900, N'Destination UOUWK', N'Carrera 9012 con Ave. Carlos Soublette #8-35', N'San Cristóbal', N'Táchira', N'10197', N'Venezuela')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10902, 24, 1, CAST(N'2008-02-23 00:00:00.000' AS DateTime), CAST(N'2008-03-23 00:00:00.000' AS DateTime), CAST(N'2008-03-03 00:00:00.000' AS DateTime), 1, 44.1500, N'Destination NCKKO', N'Åkergatan 7890', N'Bräcke', NULL, N'10165', N'Sweden')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10903, 34, 3, CAST(N'2008-02-24 00:00:00.000' AS DateTime), CAST(N'2008-03-24 00:00:00.000' AS DateTime), CAST(N'2008-03-04 00:00:00.000' AS DateTime), 3, 36.7100, N'Destination DPCVR', N'Rua do Paço, 6789', N'Rio de Janeiro', N'RJ', N'10194', N'Brazil')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10904, 89, 3, CAST(N'2008-02-24 00:00:00.000' AS DateTime), CAST(N'2008-03-24 00:00:00.000' AS DateTime), CAST(N'2008-02-27 00:00:00.000' AS DateTime), 3, 162.9500, N'Ship to 89-A', N'7890 - 12th Ave. S.', N'Seattle', N'WA', N'10356', N'USA')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10905, 88, 9, CAST(N'2008-02-24 00:00:00.000' AS DateTime), CAST(N'2008-03-24 00:00:00.000' AS DateTime), CAST(N'2008-03-06 00:00:00.000' AS DateTime), 2, 13.7200, N'Ship to 88-A', N'Rua do Mercado, 4567', N'Resende', N'SP', N'10353', N'Brazil')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10906, 91, 4, CAST(N'2008-02-25 00:00:00.000' AS DateTime), CAST(N'2008-03-11 00:00:00.000' AS DateTime), CAST(N'2008-03-03 00:00:00.000' AS DateTime), 3, 26.2900, N'Ship to 91-B', N'ul. Filtrowa 6789', N'Warszawa', NULL, N'10365', N'Poland')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10907, 74, 6, CAST(N'2008-02-25 00:00:00.000' AS DateTime), CAST(N'2008-03-25 00:00:00.000' AS DateTime), CAST(N'2008-02-27 00:00:00.000' AS DateTime), 3, 9.1900, N'Ship to 74-B', N'4567, rue Lauriston', N'Paris', NULL, N'10313', N'France')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10908, 66, 4, CAST(N'2008-02-26 00:00:00.000' AS DateTime), CAST(N'2008-03-26 00:00:00.000' AS DateTime), CAST(N'2008-03-06 00:00:00.000' AS DateTime), 2, 32.9600, N'Ship to 66-B', N'Strada Provinciale 1234', N'Reggio Emilia', NULL, N'10289', N'Italy')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10909, 70, 1, CAST(N'2008-02-26 00:00:00.000' AS DateTime), CAST(N'2008-03-26 00:00:00.000' AS DateTime), CAST(N'2008-03-10 00:00:00.000' AS DateTime), 2, 53.0500, N'Ship to 70-C', N'Erling Skakkes gate 6789', N'Stavern', NULL, N'10304', N'Norway')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10910, 90, 1, CAST(N'2008-02-26 00:00:00.000' AS DateTime), CAST(N'2008-03-26 00:00:00.000' AS DateTime), CAST(N'2008-03-04 00:00:00.000' AS DateTime), 3, 38.1100, N'Ship to 90-A', N'Keskuskatu 2345', N'Helsinki', NULL, N'10361', N'Finland')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10911, 30, 3, CAST(N'2008-02-26 00:00:00.000' AS DateTime), CAST(N'2008-03-26 00:00:00.000' AS DateTime), CAST(N'2008-03-05 00:00:00.000' AS DateTime), 1, 38.1900, N'Destination IIYDD', N'C/ Romero, 5678', N'Sevilla', NULL, N'10183', N'Spain')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10912, 37, 2, CAST(N'2008-02-26 00:00:00.000' AS DateTime), CAST(N'2008-03-26 00:00:00.000' AS DateTime), CAST(N'2008-03-18 00:00:00.000' AS DateTime), 2, 580.9100, N'Destination DGKOU', N'6789 Johnstown Road', N'Cork', N'Co. Cork', N'10204', N'Ireland')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10913, 62, 4, CAST(N'2008-02-26 00:00:00.000' AS DateTime), CAST(N'2008-03-26 00:00:00.000' AS DateTime), CAST(N'2008-03-04 00:00:00.000' AS DateTime), 1, 33.0500, N'Ship to 62-A', N'Alameda dos Canàrios, 8901', N'Sao Paulo', N'SP', N'10276', N'Brazil')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10914, 62, 6, CAST(N'2008-02-27 00:00:00.000' AS DateTime), CAST(N'2008-03-27 00:00:00.000' AS DateTime), CAST(N'2008-03-02 00:00:00.000' AS DateTime), 1, 21.1900, N'Ship to 62-B', N'Alameda dos Canàrios, 9012', N'Sao Paulo', N'SP', N'10277', N'Brazil')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10915, 80, 2, CAST(N'2008-02-27 00:00:00.000' AS DateTime), CAST(N'2008-03-27 00:00:00.000' AS DateTime), CAST(N'2008-03-02 00:00:00.000' AS DateTime), 2, 3.5100, N'Ship to 80-C', N'Avda. Azteca 5678', N'México D.F.', NULL, N'10334', N'Mexico')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10916, 64, 1, CAST(N'2008-02-27 00:00:00.000' AS DateTime), CAST(N'2008-03-27 00:00:00.000' AS DateTime), CAST(N'2008-03-09 00:00:00.000' AS DateTime), 2, 63.7700, N'Ship to 64-C', N'Av. del Libertador 6789', N'Buenos Aires', NULL, N'10284', N'Argentina')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10917, 69, 4, CAST(N'2008-03-02 00:00:00.000' AS DateTime), CAST(N'2008-03-30 00:00:00.000' AS DateTime), CAST(N'2008-03-11 00:00:00.000' AS DateTime), 2, 8.2900, N'Ship to 69-C', N'Gran Vía, 1234', N'Madrid', NULL, N'10299', N'Spain')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10918, 10, 3, CAST(N'2008-03-02 00:00:00.000' AS DateTime), CAST(N'2008-03-30 00:00:00.000' AS DateTime), CAST(N'2008-03-11 00:00:00.000' AS DateTime), 3, 48.8300, N'Destination OLSSJ', N'2345 Tsawassen Blvd.', N'Tsawassen', N'BC', N'10130', N'Canada')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10919, 47, 2, CAST(N'2008-03-02 00:00:00.000' AS DateTime), CAST(N'2008-03-30 00:00:00.000' AS DateTime), CAST(N'2008-03-04 00:00:00.000' AS DateTime), 2, 19.8000, N'Ship to 47-B', N'Ave. 5 de Mayo Porlamar 4567', N'I. de Margarita', N'Nueva Esparta', N'10231', N'Venezuela')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10920, 4, 4, CAST(N'2008-03-03 00:00:00.000' AS DateTime), CAST(N'2008-03-31 00:00:00.000' AS DateTime), CAST(N'2008-03-09 00:00:00.000' AS DateTime), 2, 29.6100, N'Ship to 4-A', N'Brook Farm Stratford St. Mary 0123', N'Colchester', N'Essex', N'10238', N'UK')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10921, 83, 1, CAST(N'2008-03-03 00:00:00.000' AS DateTime), CAST(N'2008-04-14 00:00:00.000' AS DateTime), CAST(N'2008-03-09 00:00:00.000' AS DateTime), 1, 176.4800, N'Ship to 83-A', N'Smagsloget 0123', N'Århus', NULL, N'10339', N'Denmark')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10922, 34, 5, CAST(N'2008-03-03 00:00:00.000' AS DateTime), CAST(N'2008-03-31 00:00:00.000' AS DateTime), CAST(N'2008-03-05 00:00:00.000' AS DateTime), 3, 62.7400, N'Destination DPCVR', N'Rua do Paço, 6789', N'Rio de Janeiro', N'RJ', N'10194', N'Brazil')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10923, 41, 7, CAST(N'2008-03-03 00:00:00.000' AS DateTime), CAST(N'2008-04-14 00:00:00.000' AS DateTime), CAST(N'2008-03-13 00:00:00.000' AS DateTime), 3, 68.2600, N'Destination OLJND', N'8901 rue Alsace-Lorraine', N'Toulouse', NULL, N'10216', N'France')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10924, 5, 3, CAST(N'2008-03-04 00:00:00.000' AS DateTime), CAST(N'2008-04-01 00:00:00.000' AS DateTime), CAST(N'2008-04-08 00:00:00.000' AS DateTime), 2, 151.5200, N'Ship to 5-A', N'Berguvsvägen  9012', N'Luleå', NULL, N'10267', N'Sweden')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10925, 34, 3, CAST(N'2008-03-04 00:00:00.000' AS DateTime), CAST(N'2008-04-01 00:00:00.000' AS DateTime), CAST(N'2008-03-13 00:00:00.000' AS DateTime), 1, 2.2700, N'Destination JPAIY', N'Rua do Paço, 8901', N'Rio de Janeiro', N'RJ', N'10196', N'Brazil')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10926, 2, 4, CAST(N'2008-03-04 00:00:00.000' AS DateTime), CAST(N'2008-04-01 00:00:00.000' AS DateTime), CAST(N'2008-03-11 00:00:00.000' AS DateTime), 3, 39.9200, N'Destination RAIGI', N'Avda. de la Constitución 4567', N'México D.F.', NULL, N'10182', N'Mexico')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10927, 40, 4, CAST(N'2008-03-05 00:00:00.000' AS DateTime), CAST(N'2008-04-02 00:00:00.000' AS DateTime), CAST(N'2008-04-08 00:00:00.000' AS DateTime), 1, 19.7900, N'Destination WWJLO', N'6789, avenue de l''Europe', N'Versailles', NULL, N'10214', N'France')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10928, 29, 1, CAST(N'2008-03-05 00:00:00.000' AS DateTime), CAST(N'2008-04-02 00:00:00.000' AS DateTime), CAST(N'2008-03-18 00:00:00.000' AS DateTime), 1, 1.3600, N'Destination WOFLH', N'Rambla de Cataluña, 1234', N'Barcelona', NULL, N'10179', N'Spain')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10929, 25, 6, CAST(N'2008-03-05 00:00:00.000' AS DateTime), CAST(N'2008-04-02 00:00:00.000' AS DateTime), CAST(N'2008-03-12 00:00:00.000' AS DateTime), 1, 33.9300, N'Destination QOCBL', N'Berliner Platz 1234', N'München', NULL, N'10169', N'Germany')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10930, 76, 4, CAST(N'2008-03-06 00:00:00.000' AS DateTime), CAST(N'2008-04-17 00:00:00.000' AS DateTime), CAST(N'2008-03-18 00:00:00.000' AS DateTime), 3, 15.5500, N'Ship to 76-A', N'Boulevard Tirou, 8901', N'Charleroi', NULL, N'10317', N'Belgium')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10931, 68, 4, CAST(N'2008-03-06 00:00:00.000' AS DateTime), CAST(N'2008-03-20 00:00:00.000' AS DateTime), CAST(N'2008-03-19 00:00:00.000' AS DateTime), 2, 13.6000, N'Ship to 68-B', N'Starenweg 7890', N'Genève', NULL, N'10295', N'Switzerland')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10932, 9, 8, CAST(N'2008-03-06 00:00:00.000' AS DateTime), CAST(N'2008-04-03 00:00:00.000' AS DateTime), CAST(N'2008-03-24 00:00:00.000' AS DateTime), 1, 134.6400, N'Ship to 9-B', N'9012, rue des Bouchers', N'Marseille', NULL, N'10368', N'France')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10933, 38, 6, CAST(N'2008-03-06 00:00:00.000' AS DateTime), CAST(N'2008-04-03 00:00:00.000' AS DateTime), CAST(N'2008-03-16 00:00:00.000' AS DateTime), 3, 54.1500, N'Destination QVTLW', N'Garden House Crowther Way 7890', N'Cowes', N'Isle of Wight', N'10205', N'UK')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10934, 44, 3, CAST(N'2008-03-09 00:00:00.000' AS DateTime), CAST(N'2008-04-06 00:00:00.000' AS DateTime), CAST(N'2008-03-12 00:00:00.000' AS DateTime), 3, 32.0100, N'Ship to 44-C', N'Magazinweg 6789', N'Frankfurt a.M.', NULL, N'10224', N'Germany')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10935, 88, 4, CAST(N'2008-03-09 00:00:00.000' AS DateTime), CAST(N'2008-04-06 00:00:00.000' AS DateTime), CAST(N'2008-03-18 00:00:00.000' AS DateTime), 3, 47.5900, N'Ship to 88-A', N'Rua do Mercado, 4567', N'Resende', N'SP', N'10353', N'Brazil')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10936, 32, 3, CAST(N'2008-03-09 00:00:00.000' AS DateTime), CAST(N'2008-04-06 00:00:00.000' AS DateTime), CAST(N'2008-03-18 00:00:00.000' AS DateTime), 2, 33.6800, N'Destination AVQUS', N'2345 Baker Blvd.', N'Eugene', N'OR', N'10190', N'USA')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10938, 63, 3, CAST(N'2008-03-10 00:00:00.000' AS DateTime), CAST(N'2008-04-07 00:00:00.000' AS DateTime), CAST(N'2008-03-16 00:00:00.000' AS DateTime), 2, 31.8900, N'Ship to 63-C', N'Taucherstraße 3456', N'Cunewalde', NULL, N'10281', N'Germany')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10939, 49, 2, CAST(N'2008-03-10 00:00:00.000' AS DateTime), CAST(N'2008-04-07 00:00:00.000' AS DateTime), CAST(N'2008-03-13 00:00:00.000' AS DateTime), 2, 76.3300, N'Ship to 49-A', N'Via Ludovico il Moro 8901', N'Bergamo', NULL, N'10235', N'Italy')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10940, 9, 8, CAST(N'2008-03-11 00:00:00.000' AS DateTime), CAST(N'2008-04-08 00:00:00.000' AS DateTime), CAST(N'2008-03-23 00:00:00.000' AS DateTime), 3, 19.7700, N'Ship to 9-C', N'0123, rue des Bouchers', N'Marseille', NULL, N'10369', N'France')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10941, 71, 7, CAST(N'2008-03-11 00:00:00.000' AS DateTime), CAST(N'2008-04-08 00:00:00.000' AS DateTime), CAST(N'2008-03-20 00:00:00.000' AS DateTime), 2, 400.8100, N'Ship to 71-A', N'7890 Suffolk Ln.', N'Boise', N'ID', N'10305', N'USA')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10942, 66, 9, CAST(N'2008-03-11 00:00:00.000' AS DateTime), CAST(N'2008-04-08 00:00:00.000' AS DateTime), CAST(N'2008-03-18 00:00:00.000' AS DateTime), 3, 17.9500, N'Ship to 66-C', N'Strada Provinciale 2345', N'Reggio Emilia', NULL, N'10290', N'Italy')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10943, 11, 4, CAST(N'2008-03-11 00:00:00.000' AS DateTime), CAST(N'2008-04-08 00:00:00.000' AS DateTime), CAST(N'2008-03-19 00:00:00.000' AS DateTime), 2, 2.1700, N'Destination NZASL', N'Fauntleroy Circus 5678', N'London', NULL, N'10133', N'UK')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10944, 10, 6, CAST(N'2008-03-12 00:00:00.000' AS DateTime), CAST(N'2008-03-26 00:00:00.000' AS DateTime), CAST(N'2008-03-13 00:00:00.000' AS DateTime), 3, 52.9200, N'Destination XJIBQ', N'1234 Tsawassen Blvd.', N'Tsawassen', N'BC', N'10129', N'Canada')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10945, 52, 4, CAST(N'2008-03-12 00:00:00.000' AS DateTime), CAST(N'2008-04-09 00:00:00.000' AS DateTime), CAST(N'2008-03-18 00:00:00.000' AS DateTime), 1, 10.2200, N'Ship to 52-B', N'Heerstr. 0123', N'Leipzig', NULL, N'10248', N'Germany')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10946, 83, 1, CAST(N'2008-03-12 00:00:00.000' AS DateTime), CAST(N'2008-04-09 00:00:00.000' AS DateTime), CAST(N'2008-03-19 00:00:00.000' AS DateTime), 2, 27.2000, N'Ship to 83-B', N'Smagsloget 1234', N'Århus', NULL, N'10340', N'Denmark')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10947, 11, 3, CAST(N'2008-03-13 00:00:00.000' AS DateTime), CAST(N'2008-04-10 00:00:00.000' AS DateTime), CAST(N'2008-03-16 00:00:00.000' AS DateTime), 2, 3.2600, N'Destination NZASL', N'Fauntleroy Circus 5678', N'London', NULL, N'10133', N'UK')
GO
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10948, 30, 3, CAST(N'2008-03-13 00:00:00.000' AS DateTime), CAST(N'2008-04-10 00:00:00.000' AS DateTime), CAST(N'2008-03-19 00:00:00.000' AS DateTime), 3, 23.3900, N'Destination GGQIR', N'C/ Romero, 6789', N'Sevilla', NULL, N'10184', N'Spain')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10949, 10, 2, CAST(N'2008-03-13 00:00:00.000' AS DateTime), CAST(N'2008-04-10 00:00:00.000' AS DateTime), CAST(N'2008-03-17 00:00:00.000' AS DateTime), 3, 74.4400, N'Destination OLSSJ', N'2345 Tsawassen Blvd.', N'Tsawassen', N'BC', N'10130', N'Canada')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10950, 49, 1, CAST(N'2008-03-16 00:00:00.000' AS DateTime), CAST(N'2008-04-13 00:00:00.000' AS DateTime), CAST(N'2008-03-23 00:00:00.000' AS DateTime), 2, 2.5000, N'Ship to 49-B', N'Via Ludovico il Moro 9012', N'Bergamo', NULL, N'10236', N'Italy')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10951, 68, 9, CAST(N'2008-03-16 00:00:00.000' AS DateTime), CAST(N'2008-04-27 00:00:00.000' AS DateTime), CAST(N'2008-04-07 00:00:00.000' AS DateTime), 2, 30.8500, N'Ship to 68-A', N'Starenweg 6789', N'Genève', NULL, N'10294', N'Switzerland')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10952, 1, 1, CAST(N'2008-03-16 00:00:00.000' AS DateTime), CAST(N'2008-04-27 00:00:00.000' AS DateTime), CAST(N'2008-03-24 00:00:00.000' AS DateTime), 1, 40.4200, N'Destination LOUIE', N'Obere Str. 6789', N'Berlin', NULL, N'10154', N'Germany')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10953, 4, 9, CAST(N'2008-03-16 00:00:00.000' AS DateTime), CAST(N'2008-03-30 00:00:00.000' AS DateTime), CAST(N'2008-03-25 00:00:00.000' AS DateTime), 2, 23.7200, N'Ship to 4-B', N'Brook Farm Stratford St. Mary 1234', N'Colchester', N'Essex', N'10239', N'UK')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10954, 47, 5, CAST(N'2008-03-17 00:00:00.000' AS DateTime), CAST(N'2008-04-28 00:00:00.000' AS DateTime), CAST(N'2008-03-20 00:00:00.000' AS DateTime), 1, 27.9100, N'Ship to 47-B', N'Ave. 5 de Mayo Porlamar 4567', N'I. de Margarita', N'Nueva Esparta', N'10231', N'Venezuela')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10955, 24, 8, CAST(N'2008-03-17 00:00:00.000' AS DateTime), CAST(N'2008-04-14 00:00:00.000' AS DateTime), CAST(N'2008-03-20 00:00:00.000' AS DateTime), 2, 3.2600, N'Destination YCMPK', N'Åkergatan 8901', N'Bräcke', NULL, N'10166', N'Sweden')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10956, 6, 6, CAST(N'2008-03-17 00:00:00.000' AS DateTime), CAST(N'2008-04-28 00:00:00.000' AS DateTime), CAST(N'2008-03-20 00:00:00.000' AS DateTime), 2, 44.6500, N'Ship to 6-B', N'Forsterstr. 3456', N'Mannheim', NULL, N'10301', N'Germany')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10957, 35, 8, CAST(N'2008-03-18 00:00:00.000' AS DateTime), CAST(N'2008-04-15 00:00:00.000' AS DateTime), CAST(N'2008-03-27 00:00:00.000' AS DateTime), 3, 105.3600, N'Destination UOUWK', N'Carrera 9012 con Ave. Carlos Soublette #8-35', N'San Cristóbal', N'Táchira', N'10197', N'Venezuela')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10958, 54, 7, CAST(N'2008-03-18 00:00:00.000' AS DateTime), CAST(N'2008-04-15 00:00:00.000' AS DateTime), CAST(N'2008-03-27 00:00:00.000' AS DateTime), 2, 49.5600, N'Ship to 54-C', N'Ing. Gustavo Moncada 6789 Piso 20-A', N'Buenos Aires', NULL, N'10254', N'Argentina')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10959, 31, 6, CAST(N'2008-03-18 00:00:00.000' AS DateTime), CAST(N'2008-04-29 00:00:00.000' AS DateTime), CAST(N'2008-03-23 00:00:00.000' AS DateTime), 2, 4.9800, N'Destination GWPFK', N'Av. Brasil, 0123', N'Campinas', N'SP', N'10188', N'Brazil')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10960, 35, 3, CAST(N'2008-03-19 00:00:00.000' AS DateTime), CAST(N'2008-04-02 00:00:00.000' AS DateTime), CAST(N'2008-04-08 00:00:00.000' AS DateTime), 1, 2.0800, N'Destination SXYQX', N'Carrera 0123 con Ave. Carlos Soublette #8-35', N'San Cristóbal', N'Táchira', N'10198', N'Venezuela')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10961, 62, 8, CAST(N'2008-03-19 00:00:00.000' AS DateTime), CAST(N'2008-04-16 00:00:00.000' AS DateTime), CAST(N'2008-03-30 00:00:00.000' AS DateTime), 1, 104.4700, N'Ship to 62-A', N'Alameda dos Canàrios, 8901', N'Sao Paulo', N'SP', N'10276', N'Brazil')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10962, 63, 8, CAST(N'2008-03-19 00:00:00.000' AS DateTime), CAST(N'2008-04-16 00:00:00.000' AS DateTime), CAST(N'2008-03-23 00:00:00.000' AS DateTime), 2, 275.7900, N'Ship to 63-B', N'Taucherstraße 2345', N'Cunewalde', NULL, N'10280', N'Germany')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10963, 28, 9, CAST(N'2008-03-19 00:00:00.000' AS DateTime), CAST(N'2008-04-16 00:00:00.000' AS DateTime), CAST(N'2008-03-26 00:00:00.000' AS DateTime), 3, 2.7000, N'Destination CIRQO', N'Jardim das rosas n. 8901', N'Lisboa', NULL, N'10176', N'Portugal')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10964, 74, 3, CAST(N'2008-03-20 00:00:00.000' AS DateTime), CAST(N'2008-04-17 00:00:00.000' AS DateTime), CAST(N'2008-03-24 00:00:00.000' AS DateTime), 2, 87.3800, N'Ship to 74-B', N'4567, rue Lauriston', N'Paris', NULL, N'10313', N'France')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10965, 55, 6, CAST(N'2008-03-20 00:00:00.000' AS DateTime), CAST(N'2008-04-17 00:00:00.000' AS DateTime), CAST(N'2008-03-30 00:00:00.000' AS DateTime), 3, 144.3800, N'Ship to 55-B', N'8901 Bering St.', N'Anchorage', N'AK', N'10256', N'USA')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10966, 14, 4, CAST(N'2008-03-20 00:00:00.000' AS DateTime), CAST(N'2008-04-17 00:00:00.000' AS DateTime), CAST(N'2008-04-08 00:00:00.000' AS DateTime), 1, 27.1900, N'Destination NRTZZ', N'Hauptstr. 0123', N'Bern', NULL, N'10138', N'Switzerland')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10967, 79, 2, CAST(N'2008-03-23 00:00:00.000' AS DateTime), CAST(N'2008-04-20 00:00:00.000' AS DateTime), CAST(N'2008-04-02 00:00:00.000' AS DateTime), 2, 62.2200, N'Ship to 79-B', N'Luisenstr. 8901', N'Münster', NULL, N'10327', N'Germany')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10968, 20, 1, CAST(N'2008-03-23 00:00:00.000' AS DateTime), CAST(N'2008-04-20 00:00:00.000' AS DateTime), CAST(N'2008-04-01 00:00:00.000' AS DateTime), 3, 74.6000, N'Destination CUVPF', N'Kirchgasse 1234', N'Graz', NULL, N'10159', N'Austria')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10969, 15, 1, CAST(N'2008-03-23 00:00:00.000' AS DateTime), CAST(N'2008-04-20 00:00:00.000' AS DateTime), CAST(N'2008-03-30 00:00:00.000' AS DateTime), 2, 0.2100, N'Destination EVHYA', N'Av. dos Lusíadas, 3456', N'Sao Paulo', N'SP', N'10141', N'Brazil')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10970, 8, 9, CAST(N'2008-03-24 00:00:00.000' AS DateTime), CAST(N'2008-04-07 00:00:00.000' AS DateTime), CAST(N'2008-04-24 00:00:00.000' AS DateTime), 1, 16.1600, N'Ship to 8-C', N'C/ Araquil, 1234', N'Madrid', NULL, N'10360', N'Spain')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10971, 26, 2, CAST(N'2008-03-24 00:00:00.000' AS DateTime), CAST(N'2008-04-21 00:00:00.000' AS DateTime), CAST(N'2008-04-02 00:00:00.000' AS DateTime), 2, 121.8200, N'Destination XBVKN', N'3456, rue Royale', N'Nantes', NULL, N'10171', N'France')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10972, 40, 4, CAST(N'2008-03-24 00:00:00.000' AS DateTime), CAST(N'2008-04-21 00:00:00.000' AS DateTime), CAST(N'2008-03-26 00:00:00.000' AS DateTime), 2, 0.0200, N'Destination MVTWX', N'5678, avenue de l''Europe', N'Versailles', NULL, N'10213', N'France')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10973, 40, 6, CAST(N'2008-03-24 00:00:00.000' AS DateTime), CAST(N'2008-04-21 00:00:00.000' AS DateTime), CAST(N'2008-03-27 00:00:00.000' AS DateTime), 2, 15.1700, N'Destination WWJLO', N'6789, avenue de l''Europe', N'Versailles', NULL, N'10214', N'France')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10974, 75, 3, CAST(N'2008-03-25 00:00:00.000' AS DateTime), CAST(N'2008-04-08 00:00:00.000' AS DateTime), CAST(N'2008-04-03 00:00:00.000' AS DateTime), 3, 12.9600, N'Ship to 75-B', N'P.O. Box 6789', N'Lander', N'WY', N'10315', N'USA')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10975, 10, 1, CAST(N'2008-03-25 00:00:00.000' AS DateTime), CAST(N'2008-04-22 00:00:00.000' AS DateTime), CAST(N'2008-03-27 00:00:00.000' AS DateTime), 3, 32.2700, N'Destination OLSSJ', N'2345 Tsawassen Blvd.', N'Tsawassen', N'BC', N'10130', N'Canada')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10976, 35, 1, CAST(N'2008-03-25 00:00:00.000' AS DateTime), CAST(N'2008-05-06 00:00:00.000' AS DateTime), CAST(N'2008-04-03 00:00:00.000' AS DateTime), 1, 37.9700, N'Destination SXYQX', N'Carrera 0123 con Ave. Carlos Soublette #8-35', N'San Cristóbal', N'Táchira', N'10198', N'Venezuela')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10977, 24, 8, CAST(N'2008-03-26 00:00:00.000' AS DateTime), CAST(N'2008-04-23 00:00:00.000' AS DateTime), CAST(N'2008-04-10 00:00:00.000' AS DateTime), 3, 208.5000, N'Destination NCKKO', N'Åkergatan 7890', N'Bräcke', NULL, N'10165', N'Sweden')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10978, 50, 9, CAST(N'2008-03-26 00:00:00.000' AS DateTime), CAST(N'2008-04-23 00:00:00.000' AS DateTime), CAST(N'2008-04-23 00:00:00.000' AS DateTime), 2, 32.8200, N'Ship to 50-A', N'Rue Joseph-Bens 3456', N'Bruxelles', NULL, N'10241', N'Belgium')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10979, 20, 8, CAST(N'2008-03-26 00:00:00.000' AS DateTime), CAST(N'2008-04-23 00:00:00.000' AS DateTime), CAST(N'2008-03-31 00:00:00.000' AS DateTime), 2, 353.0700, N'Destination CUVPF', N'Kirchgasse 1234', N'Graz', NULL, N'10159', N'Austria')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10980, 24, 4, CAST(N'2008-03-27 00:00:00.000' AS DateTime), CAST(N'2008-05-08 00:00:00.000' AS DateTime), CAST(N'2008-04-17 00:00:00.000' AS DateTime), 1, 1.2600, N'Destination YCMPK', N'Åkergatan 8901', N'Bräcke', NULL, N'10166', N'Sweden')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10981, 34, 1, CAST(N'2008-03-27 00:00:00.000' AS DateTime), CAST(N'2008-04-24 00:00:00.000' AS DateTime), CAST(N'2008-04-02 00:00:00.000' AS DateTime), 2, 193.3700, N'Destination JPAIY', N'Rua do Paço, 8901', N'Rio de Janeiro', N'RJ', N'10196', N'Brazil')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10982, 10, 2, CAST(N'2008-03-27 00:00:00.000' AS DateTime), CAST(N'2008-04-24 00:00:00.000' AS DateTime), CAST(N'2008-04-08 00:00:00.000' AS DateTime), 1, 14.0100, N'Destination XJIBQ', N'1234 Tsawassen Blvd.', N'Tsawassen', N'BC', N'10129', N'Canada')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10983, 71, 2, CAST(N'2008-03-27 00:00:00.000' AS DateTime), CAST(N'2008-04-24 00:00:00.000' AS DateTime), CAST(N'2008-04-06 00:00:00.000' AS DateTime), 2, 657.5400, N'Ship to 71-B', N'8901 Suffolk Ln.', N'Boise', N'ID', N'10306', N'USA')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10984, 71, 1, CAST(N'2008-03-30 00:00:00.000' AS DateTime), CAST(N'2008-04-27 00:00:00.000' AS DateTime), CAST(N'2008-04-03 00:00:00.000' AS DateTime), 3, 211.2200, N'Ship to 71-B', N'8901 Suffolk Ln.', N'Boise', N'ID', N'10306', N'USA')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10985, 37, 2, CAST(N'2008-03-30 00:00:00.000' AS DateTime), CAST(N'2008-04-27 00:00:00.000' AS DateTime), CAST(N'2008-04-02 00:00:00.000' AS DateTime), 1, 91.5100, N'Destination ATSOA', N'4567 Johnstown Road', N'Cork', N'Co. Cork', N'10202', N'Ireland')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10986, 54, 8, CAST(N'2008-03-30 00:00:00.000' AS DateTime), CAST(N'2008-04-27 00:00:00.000' AS DateTime), CAST(N'2008-04-21 00:00:00.000' AS DateTime), 2, 217.8600, N'Ship to 54-A', N'Ing. Gustavo Moncada 4567 Piso 20-A', N'Buenos Aires', NULL, N'10252', N'Argentina')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10987, 19, 8, CAST(N'2008-03-31 00:00:00.000' AS DateTime), CAST(N'2008-04-28 00:00:00.000' AS DateTime), CAST(N'2008-04-06 00:00:00.000' AS DateTime), 1, 185.4800, N'Destination FRCGJ', N'5678 King George', N'London', NULL, N'10153', N'UK')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10988, 65, 3, CAST(N'2008-03-31 00:00:00.000' AS DateTime), CAST(N'2008-04-28 00:00:00.000' AS DateTime), CAST(N'2008-04-10 00:00:00.000' AS DateTime), 2, 61.1400, N'Ship to 65-A', N'7890 Milton Dr.', N'Albuquerque', N'NM', N'10285', N'USA')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10989, 61, 2, CAST(N'2008-03-31 00:00:00.000' AS DateTime), CAST(N'2008-04-28 00:00:00.000' AS DateTime), CAST(N'2008-04-02 00:00:00.000' AS DateTime), 1, 34.7600, N'Ship to 61-A', N'Rua da Panificadora, 5678', N'Rio de Janeiro', N'RJ', N'10273', N'Brazil')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10990, 20, 2, CAST(N'2008-04-01 00:00:00.000' AS DateTime), CAST(N'2008-05-13 00:00:00.000' AS DateTime), CAST(N'2008-04-07 00:00:00.000' AS DateTime), 3, 117.6100, N'Destination RVDMF', N'Kirchgasse 9012', N'Graz', NULL, N'10157', N'Austria')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10991, 63, 1, CAST(N'2008-04-01 00:00:00.000' AS DateTime), CAST(N'2008-04-29 00:00:00.000' AS DateTime), CAST(N'2008-04-07 00:00:00.000' AS DateTime), 1, 38.5100, N'Ship to 63-A', N'Taucherstraße 1234', N'Cunewalde', NULL, N'10279', N'Germany')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10992, 77, 1, CAST(N'2008-04-01 00:00:00.000' AS DateTime), CAST(N'2008-04-29 00:00:00.000' AS DateTime), CAST(N'2008-04-03 00:00:00.000' AS DateTime), 3, 4.2700, N'Ship to 77-C', N'3456 Jefferson Way Suite 2', N'Portland', N'OR', N'10322', N'USA')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10993, 24, 7, CAST(N'2008-04-01 00:00:00.000' AS DateTime), CAST(N'2008-04-29 00:00:00.000' AS DateTime), CAST(N'2008-04-10 00:00:00.000' AS DateTime), 3, 8.8100, N'Destination NCKKO', N'Åkergatan 7890', N'Bräcke', NULL, N'10165', N'Sweden')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10994, 83, 2, CAST(N'2008-04-02 00:00:00.000' AS DateTime), CAST(N'2008-04-16 00:00:00.000' AS DateTime), CAST(N'2008-04-09 00:00:00.000' AS DateTime), 3, 65.5300, N'Ship to 83-C', N'Smagsloget 2345', N'Århus', NULL, N'10341', N'Denmark')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10995, 58, 1, CAST(N'2008-04-02 00:00:00.000' AS DateTime), CAST(N'2008-04-30 00:00:00.000' AS DateTime), CAST(N'2008-04-06 00:00:00.000' AS DateTime), 3, 46.0000, N'Ship to 58-B', N'Calle Dr. Jorge Cash 4567', N'México D.F.', NULL, N'10262', N'Mexico')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10996, 63, 4, CAST(N'2008-04-02 00:00:00.000' AS DateTime), CAST(N'2008-04-30 00:00:00.000' AS DateTime), CAST(N'2008-04-10 00:00:00.000' AS DateTime), 2, 1.1200, N'Ship to 63-C', N'Taucherstraße 3456', N'Cunewalde', NULL, N'10281', N'Germany')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10997, 46, 8, CAST(N'2008-04-03 00:00:00.000' AS DateTime), CAST(N'2008-05-15 00:00:00.000' AS DateTime), CAST(N'2008-04-13 00:00:00.000' AS DateTime), 2, 73.9100, N'Ship to 46-A', N'Carrera 0123 con Ave. Bolívar #65-98 Llano Largo', N'Barquisimeto', N'Lara', N'10227', N'Venezuela')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10998, 91, 8, CAST(N'2008-04-03 00:00:00.000' AS DateTime), CAST(N'2008-04-17 00:00:00.000' AS DateTime), CAST(N'2008-04-17 00:00:00.000' AS DateTime), 2, 20.3100, N'Ship to 91-A', N'ul. Filtrowa 5678', N'Warszawa', NULL, N'10364', N'Poland')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (10999, 56, 6, CAST(N'2008-04-03 00:00:00.000' AS DateTime), CAST(N'2008-05-01 00:00:00.000' AS DateTime), CAST(N'2008-04-10 00:00:00.000' AS DateTime), 2, 96.3500, N'Ship to 56-B', N'Mehrheimerstr. 1234', N'Köln', NULL, N'10259', N'Germany')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (11000, 65, 2, CAST(N'2008-04-06 00:00:00.000' AS DateTime), CAST(N'2008-05-04 00:00:00.000' AS DateTime), CAST(N'2008-04-14 00:00:00.000' AS DateTime), 3, 55.1200, N'Ship to 65-A', N'7890 Milton Dr.', N'Albuquerque', N'NM', N'10285', N'USA')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (11001, 24, 2, CAST(N'2008-04-06 00:00:00.000' AS DateTime), CAST(N'2008-05-04 00:00:00.000' AS DateTime), CAST(N'2008-04-14 00:00:00.000' AS DateTime), 2, 197.3000, N'Destination YCMPK', N'Åkergatan 8901', N'Bräcke', NULL, N'10166', N'Sweden')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (11002, 71, 4, CAST(N'2008-04-06 00:00:00.000' AS DateTime), CAST(N'2008-05-04 00:00:00.000' AS DateTime), CAST(N'2008-04-16 00:00:00.000' AS DateTime), 1, 141.1600, N'Ship to 71-A', N'7890 Suffolk Ln.', N'Boise', N'ID', N'10305', N'USA')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (11003, 78, 3, CAST(N'2008-04-06 00:00:00.000' AS DateTime), CAST(N'2008-05-04 00:00:00.000' AS DateTime), CAST(N'2008-04-08 00:00:00.000' AS DateTime), 3, 14.9100, N'Ship to 78-B', N'5678 Grizzly Peak Rd.', N'Butte', N'MT', N'10324', N'USA')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (11004, 50, 3, CAST(N'2008-04-07 00:00:00.000' AS DateTime), CAST(N'2008-05-05 00:00:00.000' AS DateTime), CAST(N'2008-04-20 00:00:00.000' AS DateTime), 1, 44.8400, N'Ship to 50-C', N'Rue Joseph-Bens 5678', N'Bruxelles', NULL, N'10243', N'Belgium')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (11005, 90, 2, CAST(N'2008-04-07 00:00:00.000' AS DateTime), CAST(N'2008-05-05 00:00:00.000' AS DateTime), CAST(N'2008-04-10 00:00:00.000' AS DateTime), 1, 0.7500, N'Ship to 90-A', N'Keskuskatu 2345', N'Helsinki', NULL, N'10361', N'Finland')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (11006, 32, 3, CAST(N'2008-04-07 00:00:00.000' AS DateTime), CAST(N'2008-05-05 00:00:00.000' AS DateTime), CAST(N'2008-04-15 00:00:00.000' AS DateTime), 2, 25.1900, N'Destination LLUXZ', N'1234 Baker Blvd.', N'Eugene', N'OR', N'10189', N'USA')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (11007, 60, 8, CAST(N'2008-04-08 00:00:00.000' AS DateTime), CAST(N'2008-05-06 00:00:00.000' AS DateTime), CAST(N'2008-04-13 00:00:00.000' AS DateTime), 2, 202.2400, N'Ship to 60-C', N'Estrada da saúde n. 4567', N'Lisboa', NULL, N'10272', N'Portugal')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (11008, 20, 7, CAST(N'2008-04-08 00:00:00.000' AS DateTime), CAST(N'2008-05-06 00:00:00.000' AS DateTime), NULL, 3, 79.4600, N'Destination CUVPF', N'Kirchgasse 1234', N'Graz', NULL, N'10159', N'Austria')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (11009, 30, 2, CAST(N'2008-04-08 00:00:00.000' AS DateTime), CAST(N'2008-05-06 00:00:00.000' AS DateTime), CAST(N'2008-04-10 00:00:00.000' AS DateTime), 1, 59.1100, N'Destination WVLDH', N'C/ Romero, 7890', N'Sevilla', NULL, N'10185', N'Spain')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (11010, 66, 2, CAST(N'2008-04-09 00:00:00.000' AS DateTime), CAST(N'2008-05-07 00:00:00.000' AS DateTime), CAST(N'2008-04-21 00:00:00.000' AS DateTime), 2, 28.7100, N'Ship to 66-A', N'Strada Provinciale 0123', N'Reggio Emilia', NULL, N'10288', N'Italy')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (11011, 1, 3, CAST(N'2008-04-09 00:00:00.000' AS DateTime), CAST(N'2008-05-07 00:00:00.000' AS DateTime), CAST(N'2008-04-13 00:00:00.000' AS DateTime), 1, 1.2100, N'Destination LOUIE', N'Obere Str. 6789', N'Berlin', NULL, N'10154', N'Germany')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (11012, 25, 1, CAST(N'2008-04-09 00:00:00.000' AS DateTime), CAST(N'2008-04-23 00:00:00.000' AS DateTime), CAST(N'2008-04-17 00:00:00.000' AS DateTime), 3, 242.9500, N'Destination WEGWI', N'Berliner Platz 2345', N'München', NULL, N'10170', N'Germany')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (11013, 69, 2, CAST(N'2008-04-09 00:00:00.000' AS DateTime), CAST(N'2008-05-07 00:00:00.000' AS DateTime), CAST(N'2008-04-10 00:00:00.000' AS DateTime), 1, 32.9900, N'Ship to 69-A', N'Gran Vía, 9012', N'Madrid', NULL, N'10297', N'Spain')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (11014, 47, 2, CAST(N'2008-04-10 00:00:00.000' AS DateTime), CAST(N'2008-05-08 00:00:00.000' AS DateTime), CAST(N'2008-04-15 00:00:00.000' AS DateTime), 3, 23.6000, N'Ship to 47-A', N'Ave. 5 de Mayo Porlamar 3456', N'I. de Margarita', N'Nueva Esparta', N'10230', N'Venezuela')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (11015, 70, 2, CAST(N'2008-04-10 00:00:00.000' AS DateTime), CAST(N'2008-04-24 00:00:00.000' AS DateTime), CAST(N'2008-04-20 00:00:00.000' AS DateTime), 2, 4.6200, N'Ship to 70-C', N'Erling Skakkes gate 6789', N'Stavern', NULL, N'10304', N'Norway')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (11016, 4, 9, CAST(N'2008-04-10 00:00:00.000' AS DateTime), CAST(N'2008-05-08 00:00:00.000' AS DateTime), CAST(N'2008-04-13 00:00:00.000' AS DateTime), 2, 33.8000, N'Ship to 4-A', N'Brook Farm Stratford St. Mary 0123', N'Colchester', N'Essex', N'10238', N'UK')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (11017, 20, 9, CAST(N'2008-04-13 00:00:00.000' AS DateTime), CAST(N'2008-05-11 00:00:00.000' AS DateTime), CAST(N'2008-04-20 00:00:00.000' AS DateTime), 2, 754.2600, N'Destination CUVPF', N'Kirchgasse 1234', N'Graz', NULL, N'10159', N'Austria')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (11018, 48, 4, CAST(N'2008-04-13 00:00:00.000' AS DateTime), CAST(N'2008-05-11 00:00:00.000' AS DateTime), CAST(N'2008-04-16 00:00:00.000' AS DateTime), 2, 11.6500, N'Ship to 48-B', N'6789 Chiaroscuro Rd.', N'Portland', N'OR', N'10233', N'USA')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (11019, 64, 6, CAST(N'2008-04-13 00:00:00.000' AS DateTime), CAST(N'2008-05-11 00:00:00.000' AS DateTime), NULL, 3, 3.1700, N'Ship to 64-B', N'Av. del Libertador 5678', N'Buenos Aires', NULL, N'10283', N'Argentina')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (11020, 56, 2, CAST(N'2008-04-14 00:00:00.000' AS DateTime), CAST(N'2008-05-12 00:00:00.000' AS DateTime), CAST(N'2008-04-16 00:00:00.000' AS DateTime), 2, 43.3000, N'Ship to 56-B', N'Mehrheimerstr. 1234', N'Köln', NULL, N'10259', N'Germany')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (11021, 63, 3, CAST(N'2008-04-14 00:00:00.000' AS DateTime), CAST(N'2008-05-12 00:00:00.000' AS DateTime), CAST(N'2008-04-21 00:00:00.000' AS DateTime), 1, 297.1800, N'Ship to 63-B', N'Taucherstraße 2345', N'Cunewalde', NULL, N'10280', N'Germany')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (11022, 34, 9, CAST(N'2008-04-14 00:00:00.000' AS DateTime), CAST(N'2008-05-12 00:00:00.000' AS DateTime), CAST(N'2008-05-04 00:00:00.000' AS DateTime), 2, 6.2700, N'Destination SCQXA', N'Rua do Paço, 7890', N'Rio de Janeiro', N'RJ', N'10195', N'Brazil')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (11023, 11, 1, CAST(N'2008-04-14 00:00:00.000' AS DateTime), CAST(N'2008-04-28 00:00:00.000' AS DateTime), CAST(N'2008-04-24 00:00:00.000' AS DateTime), 2, 123.8300, N'Destination NZASL', N'Fauntleroy Circus 5678', N'London', NULL, N'10133', N'UK')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (11024, 19, 4, CAST(N'2008-04-15 00:00:00.000' AS DateTime), CAST(N'2008-05-13 00:00:00.000' AS DateTime), CAST(N'2008-04-20 00:00:00.000' AS DateTime), 1, 74.3600, N'Destination BBMRT', N'4567 King George', N'London', NULL, N'10152', N'UK')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (11025, 87, 6, CAST(N'2008-04-15 00:00:00.000' AS DateTime), CAST(N'2008-05-13 00:00:00.000' AS DateTime), CAST(N'2008-04-24 00:00:00.000' AS DateTime), 3, 29.1700, N'Ship to 87-C', N'Torikatu 3456', N'Oulu', NULL, N'10352', N'Finland')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (11026, 27, 4, CAST(N'2008-04-15 00:00:00.000' AS DateTime), CAST(N'2008-05-13 00:00:00.000' AS DateTime), CAST(N'2008-04-28 00:00:00.000' AS DateTime), 1, 47.0900, N'Destination DICGM', N'Via Monte Bianco 7890', N'Torino', NULL, N'10175', N'Italy')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (11027, 10, 1, CAST(N'2008-04-16 00:00:00.000' AS DateTime), CAST(N'2008-05-14 00:00:00.000' AS DateTime), CAST(N'2008-04-20 00:00:00.000' AS DateTime), 1, 52.5200, N'Destination XJIBQ', N'1234 Tsawassen Blvd.', N'Tsawassen', N'BC', N'10129', N'Canada')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (11028, 39, 2, CAST(N'2008-04-16 00:00:00.000' AS DateTime), CAST(N'2008-05-14 00:00:00.000' AS DateTime), CAST(N'2008-04-22 00:00:00.000' AS DateTime), 1, 29.5900, N'Destination DKMQA', N'Maubelstr. 0123', N'Brandenburg', NULL, N'10208', N'Germany')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (11029, 14, 4, CAST(N'2008-04-16 00:00:00.000' AS DateTime), CAST(N'2008-05-14 00:00:00.000' AS DateTime), CAST(N'2008-04-27 00:00:00.000' AS DateTime), 1, 47.8400, N'Destination YUJRD', N'Hauptstr. 1234', N'Bern', NULL, N'10139', N'Switzerland')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (11030, 71, 7, CAST(N'2008-04-17 00:00:00.000' AS DateTime), CAST(N'2008-05-15 00:00:00.000' AS DateTime), CAST(N'2008-04-27 00:00:00.000' AS DateTime), 2, 830.7500, N'Ship to 71-C', N'9012 Suffolk Ln.', N'Boise', N'ID', N'10307', N'USA')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (11031, 71, 6, CAST(N'2008-04-17 00:00:00.000' AS DateTime), CAST(N'2008-05-15 00:00:00.000' AS DateTime), CAST(N'2008-04-24 00:00:00.000' AS DateTime), 2, 227.2200, N'Ship to 71-C', N'9012 Suffolk Ln.', N'Boise', N'ID', N'10307', N'USA')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (11032, 89, 2, CAST(N'2008-04-17 00:00:00.000' AS DateTime), CAST(N'2008-05-15 00:00:00.000' AS DateTime), CAST(N'2008-04-23 00:00:00.000' AS DateTime), 3, 606.1900, N'Ship to 89-B', N'8901 - 12th Ave. S.', N'Seattle', N'WA', N'10357', N'USA')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (11033, 68, 7, CAST(N'2008-04-17 00:00:00.000' AS DateTime), CAST(N'2008-05-15 00:00:00.000' AS DateTime), CAST(N'2008-04-23 00:00:00.000' AS DateTime), 3, 84.7400, N'Ship to 68-A', N'Starenweg 6789', N'Genève', NULL, N'10294', N'Switzerland')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (11034, 55, 8, CAST(N'2008-04-20 00:00:00.000' AS DateTime), CAST(N'2008-06-01 00:00:00.000' AS DateTime), CAST(N'2008-04-27 00:00:00.000' AS DateTime), 1, 40.3200, N'Ship to 55-B', N'8901 Bering St.', N'Anchorage', N'AK', N'10256', N'USA')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (11035, 76, 2, CAST(N'2008-04-20 00:00:00.000' AS DateTime), CAST(N'2008-05-18 00:00:00.000' AS DateTime), CAST(N'2008-04-24 00:00:00.000' AS DateTime), 2, 0.1700, N'Ship to 76-B', N'Boulevard Tirou, 9012', N'Charleroi', NULL, N'10318', N'Belgium')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (11036, 17, 8, CAST(N'2008-04-20 00:00:00.000' AS DateTime), CAST(N'2008-05-18 00:00:00.000' AS DateTime), CAST(N'2008-04-22 00:00:00.000' AS DateTime), 3, 149.4700, N'Destination YPUYI', N'Walserweg 8901', N'Aachen', NULL, N'10146', N'Germany')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (11037, 30, 7, CAST(N'2008-04-21 00:00:00.000' AS DateTime), CAST(N'2008-05-19 00:00:00.000' AS DateTime), CAST(N'2008-04-27 00:00:00.000' AS DateTime), 1, 3.2000, N'Destination GGQIR', N'C/ Romero, 6789', N'Sevilla', NULL, N'10184', N'Spain')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (11038, 76, 1, CAST(N'2008-04-21 00:00:00.000' AS DateTime), CAST(N'2008-05-19 00:00:00.000' AS DateTime), CAST(N'2008-04-30 00:00:00.000' AS DateTime), 2, 29.5900, N'Ship to 76-A', N'Boulevard Tirou, 8901', N'Charleroi', NULL, N'10317', N'Belgium')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (11039, 47, 1, CAST(N'2008-04-21 00:00:00.000' AS DateTime), CAST(N'2008-05-19 00:00:00.000' AS DateTime), NULL, 2, 65.0000, N'Ship to 47-C', N'Ave. 5 de Mayo Porlamar 5678', N'I. de Margarita', N'Nueva Esparta', N'10232', N'Venezuela')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (11040, 32, 4, CAST(N'2008-04-22 00:00:00.000' AS DateTime), CAST(N'2008-05-20 00:00:00.000' AS DateTime), NULL, 3, 18.8400, N'Destination VYOBK', N'3456 Baker Blvd.', N'Eugene', N'OR', N'10191', N'USA')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (11041, 14, 3, CAST(N'2008-04-22 00:00:00.000' AS DateTime), CAST(N'2008-05-20 00:00:00.000' AS DateTime), CAST(N'2008-04-28 00:00:00.000' AS DateTime), 2, 48.2200, N'Destination YUJRD', N'Hauptstr. 1234', N'Bern', NULL, N'10139', N'Switzerland')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (11042, 15, 2, CAST(N'2008-04-22 00:00:00.000' AS DateTime), CAST(N'2008-05-06 00:00:00.000' AS DateTime), CAST(N'2008-05-01 00:00:00.000' AS DateTime), 1, 29.9900, N'Destination EVHYA', N'Av. dos Lusíadas, 3456', N'Sao Paulo', N'SP', N'10141', N'Brazil')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (11043, 74, 5, CAST(N'2008-04-22 00:00:00.000' AS DateTime), CAST(N'2008-05-20 00:00:00.000' AS DateTime), CAST(N'2008-04-29 00:00:00.000' AS DateTime), 2, 8.8000, N'Ship to 74-B', N'4567, rue Lauriston', N'Paris', NULL, N'10313', N'France')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (11044, 91, 4, CAST(N'2008-04-23 00:00:00.000' AS DateTime), CAST(N'2008-05-21 00:00:00.000' AS DateTime), CAST(N'2008-05-01 00:00:00.000' AS DateTime), 1, 8.7200, N'Ship to 91-B', N'ul. Filtrowa 6789', N'Warszawa', NULL, N'10365', N'Poland')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (11045, 10, 6, CAST(N'2008-04-23 00:00:00.000' AS DateTime), CAST(N'2008-05-21 00:00:00.000' AS DateTime), NULL, 2, 70.5800, N'Destination LPHSI', N'3456 Tsawassen Blvd.', N'Tsawassen', N'BC', N'10131', N'Canada')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (11046, 86, 8, CAST(N'2008-04-23 00:00:00.000' AS DateTime), CAST(N'2008-05-21 00:00:00.000' AS DateTime), CAST(N'2008-04-24 00:00:00.000' AS DateTime), 2, 71.6400, N'Ship to 86-C', N'Adenauerallee 0123', N'Stuttgart', NULL, N'10349', N'Germany')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (11047, 19, 7, CAST(N'2008-04-24 00:00:00.000' AS DateTime), CAST(N'2008-05-22 00:00:00.000' AS DateTime), CAST(N'2008-05-01 00:00:00.000' AS DateTime), 3, 46.6200, N'Destination FRCGJ', N'5678 King George', N'London', NULL, N'10153', N'UK')
GO
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (11048, 10, 7, CAST(N'2008-04-24 00:00:00.000' AS DateTime), CAST(N'2008-05-22 00:00:00.000' AS DateTime), CAST(N'2008-04-30 00:00:00.000' AS DateTime), 3, 24.1200, N'Destination XJIBQ', N'1234 Tsawassen Blvd.', N'Tsawassen', N'BC', N'10129', N'Canada')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (11049, 31, 3, CAST(N'2008-04-24 00:00:00.000' AS DateTime), CAST(N'2008-05-22 00:00:00.000' AS DateTime), CAST(N'2008-05-04 00:00:00.000' AS DateTime), 1, 8.3400, N'Destination XOIGC', N'Av. Brasil, 8901', N'Campinas', N'SP', N'10186', N'Brazil')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (11050, 24, 8, CAST(N'2008-04-27 00:00:00.000' AS DateTime), CAST(N'2008-05-25 00:00:00.000' AS DateTime), CAST(N'2008-05-05 00:00:00.000' AS DateTime), 2, 59.4100, N'Destination YCMPK', N'Åkergatan 8901', N'Bräcke', NULL, N'10166', N'Sweden')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (11051, 41, 7, CAST(N'2008-04-27 00:00:00.000' AS DateTime), CAST(N'2008-05-25 00:00:00.000' AS DateTime), NULL, 3, 2.7900, N'Destination OLJND', N'8901 rue Alsace-Lorraine', N'Toulouse', NULL, N'10216', N'France')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (11052, 34, 3, CAST(N'2008-04-27 00:00:00.000' AS DateTime), CAST(N'2008-05-25 00:00:00.000' AS DateTime), CAST(N'2008-05-01 00:00:00.000' AS DateTime), 1, 67.2600, N'Destination DPCVR', N'Rua do Paço, 6789', N'Rio de Janeiro', N'RJ', N'10194', N'Brazil')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (11053, 59, 2, CAST(N'2008-04-27 00:00:00.000' AS DateTime), CAST(N'2008-05-25 00:00:00.000' AS DateTime), CAST(N'2008-04-29 00:00:00.000' AS DateTime), 2, 53.0500, N'Ship to 59-A', N'Geislweg 6789', N'Salzburg', NULL, N'10264', N'Austria')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (11055, 35, 7, CAST(N'2008-04-28 00:00:00.000' AS DateTime), CAST(N'2008-05-26 00:00:00.000' AS DateTime), CAST(N'2008-05-05 00:00:00.000' AS DateTime), 2, 120.9200, N'Destination JYDLM', N'Carrera1234 con Ave. Carlos Soublette #8-35', N'San Cristóbal', N'Táchira', N'10199', N'Venezuela')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (11056, 19, 8, CAST(N'2008-04-28 00:00:00.000' AS DateTime), CAST(N'2008-05-12 00:00:00.000' AS DateTime), CAST(N'2008-05-01 00:00:00.000' AS DateTime), 2, 278.9600, N'Destination QTKCU', N'3456 King George', N'London', NULL, N'10151', N'UK')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (11057, 53, 3, CAST(N'2008-04-29 00:00:00.000' AS DateTime), CAST(N'2008-05-27 00:00:00.000' AS DateTime), CAST(N'2008-05-01 00:00:00.000' AS DateTime), 3, 4.1300, N'Ship to 53-C', N'South House 3456 Queensbridge', N'London', NULL, N'10251', N'UK')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (11058, 6, 9, CAST(N'2008-04-29 00:00:00.000' AS DateTime), CAST(N'2008-05-27 00:00:00.000' AS DateTime), NULL, 3, 31.1400, N'Ship to 6-A', N'Forsterstr. 2345', N'Mannheim', NULL, N'10300', N'Germany')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (11059, 67, 2, CAST(N'2008-04-29 00:00:00.000' AS DateTime), CAST(N'2008-06-10 00:00:00.000' AS DateTime), NULL, 2, 85.8000, N'Ship to 67-A', N'Av. Copacabana, 3456', N'Rio de Janeiro', N'RJ', N'10291', N'Brazil')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (11060, 27, 2, CAST(N'2008-04-30 00:00:00.000' AS DateTime), CAST(N'2008-05-28 00:00:00.000' AS DateTime), CAST(N'2008-05-04 00:00:00.000' AS DateTime), 2, 10.9800, N'Destination DICGM', N'Via Monte Bianco 7890', N'Torino', NULL, N'10175', N'Italy')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (11061, 32, 4, CAST(N'2008-04-30 00:00:00.000' AS DateTime), CAST(N'2008-06-11 00:00:00.000' AS DateTime), NULL, 3, 14.0100, N'Destination VYOBK', N'3456 Baker Blvd.', N'Eugene', N'OR', N'10191', N'USA')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (11062, 66, 4, CAST(N'2008-04-30 00:00:00.000' AS DateTime), CAST(N'2008-05-28 00:00:00.000' AS DateTime), NULL, 2, 29.9300, N'Ship to 66-B', N'Strada Provinciale 1234', N'Reggio Emilia', NULL, N'10289', N'Italy')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (11063, 37, 3, CAST(N'2008-04-30 00:00:00.000' AS DateTime), CAST(N'2008-05-28 00:00:00.000' AS DateTime), CAST(N'2008-05-06 00:00:00.000' AS DateTime), 2, 81.7300, N'Destination KPVYJ', N'5678 Johnstown Road', N'Cork', N'Co. Cork', N'10203', N'Ireland')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (11064, 71, 1, CAST(N'2008-05-01 00:00:00.000' AS DateTime), CAST(N'2008-05-29 00:00:00.000' AS DateTime), CAST(N'2008-05-04 00:00:00.000' AS DateTime), 1, 30.0900, N'Ship to 71-C', N'9012 Suffolk Ln.', N'Boise', N'ID', N'10307', N'USA')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (11065, 46, 8, CAST(N'2008-05-01 00:00:00.000' AS DateTime), CAST(N'2008-05-29 00:00:00.000' AS DateTime), NULL, 1, 12.9100, N'Ship to 46-C', N'Carrera 2345 con Ave. Bolívar #65-98 Llano Largo', N'Barquisimeto', N'Lara', N'10229', N'Venezuela')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (11066, 89, 7, CAST(N'2008-05-01 00:00:00.000' AS DateTime), CAST(N'2008-05-29 00:00:00.000' AS DateTime), CAST(N'2008-05-04 00:00:00.000' AS DateTime), 2, 44.7200, N'Ship to 89-A', N'7890 - 12th Ave. S.', N'Seattle', N'WA', N'10356', N'USA')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (11067, 17, 1, CAST(N'2008-05-04 00:00:00.000' AS DateTime), CAST(N'2008-05-18 00:00:00.000' AS DateTime), CAST(N'2008-05-06 00:00:00.000' AS DateTime), 2, 7.9800, N'Destination BJCXA', N'Walserweg 7890', N'Aachen', NULL, N'10145', N'Germany')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (11068, 62, 8, CAST(N'2008-05-04 00:00:00.000' AS DateTime), CAST(N'2008-06-01 00:00:00.000' AS DateTime), NULL, 2, 81.7500, N'Ship to 62-A', N'Alameda dos Canàrios, 8901', N'Sao Paulo', N'SP', N'10276', N'Brazil')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (11069, 80, 1, CAST(N'2008-05-04 00:00:00.000' AS DateTime), CAST(N'2008-06-01 00:00:00.000' AS DateTime), CAST(N'2008-05-06 00:00:00.000' AS DateTime), 2, 15.6700, N'Ship to 80-B', N'Avda. Azteca 4567', N'México D.F.', NULL, N'10333', N'Mexico')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (11070, 44, 2, CAST(N'2008-05-05 00:00:00.000' AS DateTime), CAST(N'2008-06-02 00:00:00.000' AS DateTime), NULL, 1, 136.0000, N'Ship to 44-A', N'Magazinweg 4567', N'Frankfurt a.M.', NULL, N'10222', N'Germany')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (11071, 46, 1, CAST(N'2008-05-05 00:00:00.000' AS DateTime), CAST(N'2008-06-02 00:00:00.000' AS DateTime), NULL, 1, 0.9300, N'Ship to 46-B', N'Carrera 1234 con Ave. Bolívar #65-98 Llano Largo', N'Barquisimeto', N'Lara', N'10228', N'Venezuela')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (11072, 20, 4, CAST(N'2008-05-05 00:00:00.000' AS DateTime), CAST(N'2008-06-02 00:00:00.000' AS DateTime), NULL, 2, 258.6400, N'Destination RVDMF', N'Kirchgasse 9012', N'Graz', NULL, N'10157', N'Austria')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (11073, 58, 2, CAST(N'2008-05-05 00:00:00.000' AS DateTime), CAST(N'2008-06-02 00:00:00.000' AS DateTime), NULL, 2, 24.9500, N'Ship to 58-B', N'Calle Dr. Jorge Cash 4567', N'México D.F.', NULL, N'10262', N'Mexico')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (11074, 73, 7, CAST(N'2008-05-06 00:00:00.000' AS DateTime), CAST(N'2008-06-03 00:00:00.000' AS DateTime), NULL, 2, 18.4400, N'Ship to 73-A', N'Vinbæltet 1234', N'Kobenhavn', NULL, N'10310', N'Denmark')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (11075, 68, 8, CAST(N'2008-05-06 00:00:00.000' AS DateTime), CAST(N'2008-06-03 00:00:00.000' AS DateTime), NULL, 2, 6.1900, N'Ship to 68-A', N'Starenweg 6789', N'Genève', NULL, N'10294', N'Switzerland')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (11076, 9, 4, CAST(N'2008-05-06 00:00:00.000' AS DateTime), CAST(N'2008-06-03 00:00:00.000' AS DateTime), NULL, 2, 38.2800, N'Ship to 9-A', N'8901, rue des Bouchers', N'Marseille', NULL, N'10367', N'France')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (11077, 65, 1, CAST(N'2008-05-06 00:00:00.000' AS DateTime), CAST(N'2008-06-03 00:00:00.000' AS DateTime), NULL, 2, 8.5300, N'Ship to 65-A', N'7890 Milton Dr.', N'Albuquerque', N'NM', N'10285', N'USA')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (11080, 93, 1, CAST(N'2016-11-27 00:00:00.000' AS DateTime), CAST(N'2016-11-27 00:00:00.000' AS DateTime), NULL, 1, 4.0000, N'34', N'34', N'Eugene', N'WA', NULL, N'USA')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (11081, 1, 18, CAST(N'2016-11-27 00:00:00.000' AS DateTime), CAST(N'2016-11-28 00:00:00.000' AS DateTime), CAST(N'2016-11-28 00:00:00.000' AS DateTime), 1, 15.0000, N'adf', N'df', N'Eugene', N'Victoria', NULL, N'Switzerland')
INSERT [Sales].[Orders] ([orderid], [custid], [empid], [orderdate], [requireddate], [shippeddate], [shipperid], [freight], [shipname], [shipaddress], [shipcity], [shipregion], [shippostalcode], [shipcountry]) VALUES (11083, 22, 1, CAST(N'2016-12-05 00:00:00.000' AS DateTime), CAST(N'2016-12-05 00:00:00.000' AS DateTime), CAST(N'2016-12-05 00:00:00.000' AS DateTime), 1, 1.2000, N'uiuiu', N'gygugu', N'Frankfurt', N'Victoria', NULL, N'UK')
SET IDENTITY_INSERT [Sales].[Orders] OFF
SET IDENTITY_INSERT [Sales].[Shippers] ON 

INSERT [Sales].[Shippers] ([shipperid], [companyname], [phone]) VALUES (1, N'Shipper GVSUA', N'(503)-555-5013')
INSERT [Sales].[Shippers] ([shipperid], [companyname], [phone]) VALUES (2, N'Shipper ETYNR', N'(425)-555-0135')
INSERT [Sales].[Shippers] ([shipperid], [companyname], [phone]) VALUES (3, N'Shipper ZHISN', N'(415)-555-0139')
INSERT [Sales].[Shippers] ([shipperid], [companyname], [phone]) VALUES (7, N'testtt', N'(112)-121-2121')
SET IDENTITY_INSERT [Sales].[Shippers] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [idx_nc_lastname]    Script Date: 12/6/2016 2:09:34 PM ******/
CREATE NONCLUSTERED INDEX [idx_nc_lastname] ON [HR].[Employees]
(
	[lastname] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [idx_nc_postalcode]    Script Date: 12/6/2016 2:09:34 PM ******/
CREATE NONCLUSTERED INDEX [idx_nc_postalcode] ON [HR].[Employees]
(
	[postalcode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [categoryname]    Script Date: 12/6/2016 2:09:34 PM ******/
CREATE NONCLUSTERED INDEX [categoryname] ON [Production].[Categories]
(
	[categoryname] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_nc_categoryid]    Script Date: 12/6/2016 2:09:34 PM ******/
CREATE NONCLUSTERED INDEX [idx_nc_categoryid] ON [Production].[Products]
(
	[categoryid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [idx_nc_productname]    Script Date: 12/6/2016 2:09:34 PM ******/
CREATE NONCLUSTERED INDEX [idx_nc_productname] ON [Production].[Products]
(
	[productname] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_nc_supplierid]    Script Date: 12/6/2016 2:09:34 PM ******/
CREATE NONCLUSTERED INDEX [idx_nc_supplierid] ON [Production].[Products]
(
	[supplierid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [idx_nc_companyname]    Script Date: 12/6/2016 2:09:34 PM ******/
CREATE NONCLUSTERED INDEX [idx_nc_companyname] ON [Production].[Suppliers]
(
	[companyname] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [idx_nc_postalcode]    Script Date: 12/6/2016 2:09:34 PM ******/
CREATE NONCLUSTERED INDEX [idx_nc_postalcode] ON [Production].[Suppliers]
(
	[postalcode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [idx_nc_city]    Script Date: 12/6/2016 2:09:34 PM ******/
CREATE NONCLUSTERED INDEX [idx_nc_city] ON [Sales].[Customers]
(
	[city] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [idx_nc_companyname]    Script Date: 12/6/2016 2:09:34 PM ******/
CREATE NONCLUSTERED INDEX [idx_nc_companyname] ON [Sales].[Customers]
(
	[companyname] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [idx_nc_postalcode]    Script Date: 12/6/2016 2:09:34 PM ******/
CREATE NONCLUSTERED INDEX [idx_nc_postalcode] ON [Sales].[Customers]
(
	[postalcode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [idx_nc_region]    Script Date: 12/6/2016 2:09:34 PM ******/
CREATE NONCLUSTERED INDEX [idx_nc_region] ON [Sales].[Customers]
(
	[region] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_nc_orderid]    Script Date: 12/6/2016 2:09:34 PM ******/
CREATE NONCLUSTERED INDEX [idx_nc_orderid] ON [Sales].[OrderDetails]
(
	[orderid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_nc_productid]    Script Date: 12/6/2016 2:09:34 PM ******/
CREATE NONCLUSTERED INDEX [idx_nc_productid] ON [Sales].[OrderDetails]
(
	[productid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_nc_custid]    Script Date: 12/6/2016 2:09:34 PM ******/
CREATE NONCLUSTERED INDEX [idx_nc_custid] ON [Sales].[Orders]
(
	[custid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_nc_empid]    Script Date: 12/6/2016 2:09:34 PM ******/
CREATE NONCLUSTERED INDEX [idx_nc_empid] ON [Sales].[Orders]
(
	[empid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_nc_orderdate]    Script Date: 12/6/2016 2:09:34 PM ******/
CREATE NONCLUSTERED INDEX [idx_nc_orderdate] ON [Sales].[Orders]
(
	[orderdate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_nc_shippeddate]    Script Date: 12/6/2016 2:09:34 PM ******/
CREATE NONCLUSTERED INDEX [idx_nc_shippeddate] ON [Sales].[Orders]
(
	[shippeddate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_nc_shipperid]    Script Date: 12/6/2016 2:09:34 PM ******/
CREATE NONCLUSTERED INDEX [idx_nc_shipperid] ON [Sales].[Orders]
(
	[shipperid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [idx_nc_shippostalcode]    Script Date: 12/6/2016 2:09:34 PM ******/
CREATE NONCLUSTERED INDEX [idx_nc_shippostalcode] ON [Sales].[Orders]
(
	[shippostalcode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [HR].[Employees]  WITH CHECK ADD  CONSTRAINT [FK_Employees_Employees] FOREIGN KEY([mgrid])
REFERENCES [HR].[Employees] ([empid])
GO
ALTER TABLE [HR].[Employees] CHECK CONSTRAINT [FK_Employees_Employees]
GO
ALTER TABLE [Production].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Categories] FOREIGN KEY([categoryid])
REFERENCES [Production].[Categories] ([categoryid])
GO
ALTER TABLE [Production].[Products] CHECK CONSTRAINT [FK_Products_Categories]
GO
ALTER TABLE [Production].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Suppliers] FOREIGN KEY([supplierid])
REFERENCES [Production].[Suppliers] ([supplierid])
GO
ALTER TABLE [Production].[Products] CHECK CONSTRAINT [FK_Products_Suppliers]
GO
ALTER TABLE [Sales].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Orders] FOREIGN KEY([orderid])
REFERENCES [Sales].[Orders] ([orderid])
GO
ALTER TABLE [Sales].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Orders]
GO
ALTER TABLE [Sales].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Products] FOREIGN KEY([productid])
REFERENCES [Production].[Products] ([productid])
GO
ALTER TABLE [Sales].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Products]
GO
ALTER TABLE [Sales].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Customers] FOREIGN KEY([custid])
REFERENCES [Sales].[Customers] ([custid])
GO
ALTER TABLE [Sales].[Orders] CHECK CONSTRAINT [FK_Orders_Customers]
GO
ALTER TABLE [Sales].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Employees] FOREIGN KEY([empid])
REFERENCES [HR].[Employees] ([empid])
GO
ALTER TABLE [Sales].[Orders] CHECK CONSTRAINT [FK_Orders_Employees]
GO
ALTER TABLE [Sales].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Shippers] FOREIGN KEY([shipperid])
REFERENCES [Sales].[Shippers] ([shipperid])
GO
ALTER TABLE [Sales].[Orders] CHECK CONSTRAINT [FK_Orders_Shippers]
GO
ALTER TABLE [HR].[Employees]  WITH CHECK ADD  CONSTRAINT [CHK_birthdate] CHECK  (([birthdate]<=getdate()))
GO
ALTER TABLE [HR].[Employees] CHECK CONSTRAINT [CHK_birthdate]
GO
ALTER TABLE [Sales].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [CHK_discount] CHECK  (([discount]>=(0) AND [discount]<=(1)))
GO
ALTER TABLE [Sales].[OrderDetails] CHECK CONSTRAINT [CHK_discount]
GO
ALTER TABLE [Sales].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [CHK_qty] CHECK  (([qty]>(0)))
GO
ALTER TABLE [Sales].[OrderDetails] CHECK CONSTRAINT [CHK_qty]
GO
ALTER TABLE [Sales].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [CHK_unitprice] CHECK  (([unitprice]>=(0)))
GO
ALTER TABLE [Sales].[OrderDetails] CHECK CONSTRAINT [CHK_unitprice]
GO
/****** Object:  StoredProcedure [dbo].[CheckContinueProduct]    Script Date: 12/6/2016 2:09:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE  PROCEDURE [dbo].[CheckContinueProduct]
	@proid int
	
AS
BEGIN
	SELECT	productid
	FROM Production.Products
	WHERE productid = @proid AND discontinued = 0;
END

GO
/****** Object:  StoredProcedure [dbo].[CheckExistOrderDetails]    Script Date: 12/6/2016 2:09:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE  PROCEDURE [dbo].[CheckExistOrderDetails]
	@ordid int,
	@proid int
	
AS
BEGIN
	SELECT	orderid
	FROM Sales.OrderDetails
	WHERE orderid = @ordid AND productid = @proid;
END


GO
/****** Object:  StoredProcedure [dbo].[CheckFKCategoriesProducts]    Script Date: 12/6/2016 2:09:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE  PROCEDURE [dbo].[CheckFKCategoriesProducts]
		@categoryid int
AS
BEGIN
	SELECT productid 
	FROM Production.Products 
	WHERE categoryid = @categoryid;
END


GO
/****** Object:  StoredProcedure [dbo].[CheckFKCustomerOrder]    Script Date: 12/6/2016 2:09:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE  PROCEDURE [dbo].[CheckFKCustomerOrder]
	@cusid  int
	
AS
BEGIN
	SELECT	orderid
	FROM Sales.Orders
	WHERE custid = @cusid;
END


GO
/****** Object:  StoredProcedure [dbo].[CheckFKEmployees]    Script Date: 12/6/2016 2:09:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE  PROCEDURE [dbo].[CheckFKEmployees]
	@empid int
AS
BEGIN
	SELECT	e.empid 
	FROM TSQLFundamentals2008.HR.Employees e
	WHERE e.mgrid = @empid
END

GO
/****** Object:  StoredProcedure [dbo].[CheckFKEmployeesOrders]    Script Date: 12/6/2016 2:09:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE  PROCEDURE [dbo].[CheckFKEmployeesOrders]
	@empid int
AS
BEGIN
	SELECT	o.orderid
	FROM TSQLFundamentals2008.Sales.Orders o
	WHERE o.empid = @empid
END

GO
/****** Object:  StoredProcedure [dbo].[CheckFKOrdersOrderDetails]    Script Date: 12/6/2016 2:09:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE  PROCEDURE [dbo].[CheckFKOrdersOrderDetails]
		@orderid int
AS
BEGIN
	SELECT orderid 
	FROM Sales.OrderDetails 
	WHERE orderid = @orderid;
END


GO
/****** Object:  StoredProcedure [dbo].[CheckFKProductOrderDetails]    Script Date: 12/6/2016 2:09:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE  PROCEDURE [dbo].[CheckFKProductOrderDetails]
	@proid  int
	
AS
BEGIN
	SELECT	productid
	FROM Sales.OrderDetails
	WHERE productid = @proid;
END


GO
/****** Object:  StoredProcedure [dbo].[CheckFKShipperOrder]    Script Date: 12/6/2016 2:09:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE  PROCEDURE [dbo].[CheckFKShipperOrder]
	@shipperid  int
	
AS
BEGIN
	SELECT	orderid
	FROM Sales.Orders
	WHERE shipperid = @shipperid;
END


GO
/****** Object:  StoredProcedure [dbo].[CheckFKSupplierProducts]    Script Date: 12/6/2016 2:09:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE  PROCEDURE [dbo].[CheckFKSupplierProducts]
		@supplierid int
AS
BEGIN
	SELECT productid 
	FROM Production.Products 
	WHERE supplierid = @supplierid;
END


GO
/****** Object:  StoredProcedure [dbo].[CheckShippedOrder]    Script Date: 12/6/2016 2:09:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE  PROCEDURE [dbo].[CheckShippedOrder]
	@orderid int
AS
BEGIN
	SELECT * 
	FROM Sales.Orders o
	WHERE o.orderid = @orderid AND o.shippeddate IS NOT NULL
END

GO
/****** Object:  StoredProcedure [dbo].[DeleteCategories]    Script Date: 12/6/2016 2:09:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE  PROCEDURE [dbo].[DeleteCategories]
	@categoryid int

AS
BEGIN
	DELETE FROM Production.Categories WHERE categoryid=@categoryid
END

GO
/****** Object:  StoredProcedure [dbo].[DeleteCustomers]    Script Date: 12/6/2016 2:09:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE  PROCEDURE [dbo].[DeleteCustomers]
	@cusid int

AS
BEGIN
	DELETE FROM Sales.Customers WHERE custid=@cusid
END

GO
/****** Object:  StoredProcedure [dbo].[DeleteEmployees]    Script Date: 12/6/2016 2:09:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE  PROCEDURE [dbo].[DeleteEmployees]
	@empid int

AS
BEGIN
	DELETE FROM HR.Employees WHERE empid=@empid
END

GO
/****** Object:  StoredProcedure [dbo].[DeleteOrder]    Script Date: 12/6/2016 2:09:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE  PROCEDURE [dbo].[DeleteOrder]
	@orderid int
AS
BEGIN
	DELETE FROM Sales.Orders WHERE orderid=@orderid
END

GO
/****** Object:  StoredProcedure [dbo].[DeleteOrderDetails]    Script Date: 12/6/2016 2:09:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE  PROCEDURE [dbo].[DeleteOrderDetails]
	@ordid int,
	@proid int
AS
BEGIN
	DELETE 
	FROM Sales.OrderDetails
	WHERE orderid = @ordid AND productid = @proid
END

GO
/****** Object:  StoredProcedure [dbo].[DeleteProduct]    Script Date: 12/6/2016 2:09:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE  PROCEDURE [dbo].[DeleteProduct]
	@productid int

AS
BEGIN
	DELETE FROM Production.Products WHERE productid=@productid
END

GO
/****** Object:  StoredProcedure [dbo].[DeleteShippers]    Script Date: 12/6/2016 2:09:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE  PROCEDURE [dbo].[DeleteShippers]
	@shipperid int
AS
BEGIN
	DELETE FROM Sales.Shippers WHERE shipperid=@shipperid
END

GO
/****** Object:  StoredProcedure [dbo].[DeleteSuppliers]    Script Date: 12/6/2016 2:09:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE  PROCEDURE [dbo].[DeleteSuppliers]
	@supplierid int

AS
BEGIN
	DELETE FROM Production.Suppliers WHERE supplierid=@supplierid
END

GO
/****** Object:  StoredProcedure [dbo].[FilterOrderByCustomerName]    Script Date: 12/6/2016 2:09:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE  PROCEDURE [dbo].[FilterOrderByCustomerName]
	@CusID  int
	
AS
BEGIN
	SELECT	o.orderid AS 'ID',
			o.custid AS 'Customer ID',
			(SELECT c.contactname
			FROM Sales.Customers c
			WHERE c.custid = o.custid) AS 'Customer Name',
			o.empid AS 'Employee ID',
			(SELECT e.firstname + ' ' + e.lastname
			FROM HR.Employees e
			WHERE e.empid = o.empid) AS 'Employee Name',
			o.orderdate AS 'Order Date',
			o.requireddate AS 'Required Date',
			o.shippeddate AS 'Shipped Date',
			o.shipperid AS 'Shipper ID',
			(SELECT s.companyname
			FROM Sales.Shippers s
			WHERE s.shipperid = o.orderid) AS 'Shipper company',
			o.freight AS 'Freight',
			o.shipname AS 'Ship Name',
			o.shipaddress AS 'Ship Address',
			o.shipcity AS 'Ship City',
			o.shipregion AS 'Ship Region',
			o.shippostalcode AS 'Ship Postal Code',
			o.shipcountry AS 'Ship Country'
	FROM Sales.Orders o 
	WHERE  custid = @CusID;
END



GO
/****** Object:  StoredProcedure [dbo].[getAllEmployees]    Script Date: 12/6/2016 2:09:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE  PROCEDURE [dbo].[getAllEmployees]
AS
BEGIN
	SELECT	e.empid AS 'ID',
			e.lastname AS 'Last Name',
			e.firstname AS 'First Name',
			e.title AS 'Title',
			e.titleofcourtesy AS 'Title Of Courtesy',
			FORMAT(e.birthdate, 'dd/MM/yyyy') AS 'Birth Date',
			FORMAT(e.hiredate, 'dd/MM/yyyy') AS 'Hire Date',
			e.[address] AS 'Address',
			e.city AS 'City',
			e.region AS 'Region',
			e.postalcode AS 'Postal Code',
			e.country AS 'Country',
			e.phone AS 'Phone',
			e.mgrid AS 'Manager ID',
			(SELECT tmp.firstname + ' ' + tmp.lastname
			FROM TSQLFundamentals2008.HR.Employees tmp
			WHERE tmp.empid = e.mgrid) AS 'Manager Name'
	FROM TSQLFundamentals2008.HR.Employees e;
END

GO
/****** Object:  StoredProcedure [dbo].[getAllPro.Categories]    Script Date: 12/6/2016 2:09:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE  PROCEDURE [dbo].[getAllPro.Categories]
AS
BEGIN
	SELECT	cate.categoryid AS 'ID',
			cate.categoryname AS 'Category Name', 
			cate.[description] AS 'Description'
	FROM TSQLFundamentals2008.Production.Categories cate;
END

GO
/****** Object:  StoredProcedure [dbo].[getAllPro.Product]    Script Date: 12/6/2016 2:09:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE  PROCEDURE [dbo].[getAllPro.Product]
AS
BEGIN
	SELECT	p.productid AS 'ID',
			p.productname AS 'Product Name', 
			p.supplierid AS 'Supplier ID',
			(SELECT sup.companyname
			FROM TSQLFundamentals2008.Production.Suppliers sup
			WHERE sup.supplierid = p.supplierid) AS 'Supplier Name',
			p.categoryid AS 'Category ID',
			(SELECT ca.categoryname
			FROM TSQLFundamentals2008.Production.Categories ca
			WHERE ca.categoryid = p.categoryid) AS 'Category Name',
			p.unitprice AS 'Unit price',
			p.discontinued AS 'Discontinue'
	FROM TSQLFundamentals2008.Production.Products p;
END

GO
/****** Object:  StoredProcedure [dbo].[getAllPro.Suppliers]    Script Date: 12/6/2016 2:09:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE  PROCEDURE [dbo].[getAllPro.Suppliers]
AS
BEGIN
	SELECT	s.supplierid AS 'ID', 
			s.companyname AS 'Company Name', 
			s.contactname AS 'Contact Name', 
			s.contacttitle AS 'Contact Title', 
			s.[address] AS 'Address', 
			s.city AS 'City',  
			s.region AS 'Region', 
			s.postalcode AS 'Postal Code', 
			s.country AS 'Country', 
			s.phone AS 'Phone', 
			s.fax AS 'Fax' 
	FROM TSQLFundamentals2008.Production.Suppliers s;
END

GO
/****** Object:  StoredProcedure [dbo].[getAllSales.Customer]    Script Date: 12/6/2016 2:09:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE  PROCEDURE [dbo].[getAllSales.Customer]
AS
BEGIN
	SELECT	c.custid AS 'ID', 
			c.companyname AS 'Company Name', 
			c.contactname AS 'Contact Name', 
			c.contacttitle AS 'Contact Title', 
			c.[address] AS 'Address', 
			c.city AS 'City',  
			c.region AS 'Region', 
			c.postalcode AS 'Postal Code', 
			c.country AS 'Country', 
			c.phone AS 'Phone', 
			c.fax AS 'Fax' 
	FROM Sales.Customers c;
END

GO
/****** Object:  StoredProcedure [dbo].[getAllSales.orderDetail]    Script Date: 12/6/2016 2:09:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE  PROCEDURE [dbo].[getAllSales.orderDetail]
	@orderid int
AS
BEGIN
	SELECT	ord.orderid AS 'Order ID',
			ord.productid AS 'Product ID',
			(SELECT p.productname
			FROM Production.Products p
			WHERE p.productid = ord.productid) AS 'Product Name',
			ord.unitprice AS 'Unit Price',
			ord.qty AS 'Quantity',
			ord.discount AS 'Discount'
	FROM Sales.OrderDetails ord
	WHERE ord.orderid = @orderid
END

GO
/****** Object:  StoredProcedure [dbo].[getAllSales.Orders]    Script Date: 12/6/2016 2:09:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE  PROCEDURE [dbo].[getAllSales.Orders]
AS
BEGIN
	SELECT	o.orderid AS 'ID',
			o.custid AS 'Customer ID',
			(SELECT c.contactname
			FROM Sales.Customers c
			WHERE c.custid = o.custid) AS 'Customer Name',
			o.empid AS 'Employee ID',
			(SELECT e.firstname + ' ' + e.lastname
			FROM HR.Employees e
			WHERE e.empid = o.empid) AS 'Employee Name',
			o.orderdate AS 'Order Date',
			o.requireddate AS 'Required Date',
			o.shippeddate AS 'Shipped Date',
			o.shipperid AS 'Shipper ID',
			(SELECT s.companyname
			FROM Sales.Shippers s
			WHERE s.shipperid = o.shipperid) AS 'Shipper Company',
			o.freight AS 'Freight',
			o.shipname AS 'Ship Name',
			o.shipaddress AS 'Ship Address',
			o.shipcity AS 'Ship City',
			o.shipregion AS 'Ship Region',
			o.shippostalcode AS 'Ship Postal Code',
			o.shipcountry AS 'Ship Country'
	FROM Sales.Orders o;
END

GO
/****** Object:  StoredProcedure [dbo].[getAllSales.Shippers]    Script Date: 12/6/2016 2:09:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE  PROCEDURE [dbo].[getAllSales.Shippers]
AS
BEGIN
	SELECT	s.shipperid AS 'ID',
			s.companyname AS 'Company Name',
			s.phone AS 'Phone' 
	FROM Sales.Shippers s;
END

GO
/****** Object:  StoredProcedure [dbo].[GetManagerEmployees]    Script Date: 12/6/2016 2:09:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE  PROCEDURE [dbo].[GetManagerEmployees]
	@empid int
AS
BEGIN
/****** Minh ko lam chu minh, va neu minh lam chu nguoi ta thi nguoi ta ko dc lam chu minh ******/
	SELECT	e.empid AS 'ID',
			e.firstname + ' ' +  e.lastname AS 'Name'
	FROM TSQLFundamentals2008.HR.Employees e
	WHERE (@empid < 0) OR (e.empid <> @empid 
								AND e.empid NOT IN (SELECT tmp.empid 
													FROM TSQLFundamentals2008.HR.Employees tmp
													WHERE tmp.mgrid = @empid) )
END

GO
/****** Object:  StoredProcedure [dbo].[InsertCategories]    Script Date: 12/6/2016 2:09:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE  PROCEDURE [dbo].[InsertCategories]	
	@categoryname nvarchar(15),
	@description nvarchar(200)
	

AS
BEGIN
	INSERT INTO Production.Categories(categoryname,[description])
	VALUES (@categoryname,@description)
END

GO
/****** Object:  StoredProcedure [dbo].[InsertCustomers]    Script Date: 12/6/2016 2:09:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE  PROCEDURE [dbo].[InsertCustomers]
	@companyname nvarchar(40),
	@contactname nvarchar(30),
	@contacttitle nvarchar(30),
	@address nvarchar(60),
	@city nvarchar(15),
	@region nvarchar(15),
	@postalcode nvarchar(10),
	@country nvarchar(15),
	@phone nvarchar(24),
	@fax nvarchar(24)

AS
BEGIN
	INSERT INTO Sales.Customers(companyname, contactname,contacttitle,[address],city,region,postalcode,country,phone,fax)
	VALUES (@companyname,@contactname,@contacttitle,@address,@city,@region,@postalcode,@country,@phone,@fax)
END

GO
/****** Object:  StoredProcedure [dbo].[InsertEmployees]    Script Date: 12/6/2016 2:09:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE  PROCEDURE [dbo].[InsertEmployees]
	@lastname nvarchar(20),
	@firstname nvarchar(10),
	@title nvarchar(30),
	@titleofcourtesy nvarchar(25),
	@birthdate datetime,
	@hiredate datetime,
	@address nvarchar(60),
	@city nvarchar(15),
	@region nvarchar(15),
	@postalcode nvarchar(10),
	@country nvarchar(15),
	@phone nvarchar(24),
	@mgrid int

AS
BEGIN
	INSERT INTO HR.Employees(lastname,firstname,title,titleofcourtesy,birthdate,hiredate,[address],city,region,postalcode,country,phone,mgrid)
	VALUES (@lastname,@firstname,@title,@titleofcourtesy,@birthdate,@hiredate,@address,@city,@region,@postalcode,@country,@phone,@mgrid)
END

GO
/****** Object:  StoredProcedure [dbo].[InsertOrder]    Script Date: 12/6/2016 2:09:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE  PROCEDURE [dbo].[InsertOrder]
	@custid int,
	@empid int,
	@orderdate datetime,
	@requireddate datetime,
	@shippeddate datetime,

	@shipperid int,
	@freight money,
	@shipname nvarchar(40),
	@shipaddress nvarchar(60),
	@shipcity nvarchar(15),
	@shipregion nvarchar(15),
	@shippostalcode nvarchar(10),
	@shipcountry nvarchar(15)

AS
BEGIN
	INSERT INTO Sales.Orders(custid, empid,orderdate,requireddate,shippeddate,shipperid,freight,shipname,shipaddress,shipcity,shipregion,shippostalcode,shipcountry)
	VALUES (@custid,@empid,@orderdate,@requireddate,@shippeddate,@shipperid,@freight,@shipname,@shipaddress,@shipcity,@shipregion,@shippostalcode,@shipcountry)
END

GO
/****** Object:  StoredProcedure [dbo].[InsertOrderdetail]    Script Date: 12/6/2016 2:09:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE  PROCEDURE [dbo].[InsertOrderdetail]
	@orderid int,
	@productid int,
	@unitprice money,
	@qty smallint,
	@discount numeric(4, 3)
	

AS
BEGIN
	INSERT INTO Sales.OrderDetails(orderid, productid,unitprice,qty,discount)
	VALUES (@orderid,@productid,@unitprice,@qty,@discount)
END

GO
/****** Object:  StoredProcedure [dbo].[InsertProduct]    Script Date: 12/6/2016 2:09:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE  PROCEDURE [dbo].[InsertProduct]
	@productname nvarchar(40),
	@supplierid int,
	@categoryid int,
	@unitprice money,
	@discontinued bit
	

AS
BEGIN
	INSERT INTO Production.Products(productname, supplierid,categoryid,unitprice,discontinued)
	VALUES (@productname,@supplierid,@categoryid,@unitprice,@discontinued)
END

GO
/****** Object:  StoredProcedure [dbo].[InsertShippers]    Script Date: 12/6/2016 2:09:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE  PROCEDURE [dbo].[InsertShippers]	
	@companyname nvarchar(40),
	@phone nvarchar(24)
	

AS
BEGIN
	INSERT INTO Sales.Shippers(companyname,phone)
	VALUES (@companyname,@phone)
END

GO
/****** Object:  StoredProcedure [dbo].[InsertSuppliers]    Script Date: 12/6/2016 2:09:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE  PROCEDURE [dbo].[InsertSuppliers]
	@companyname nvarchar(40),
	@contactname nvarchar(30),
	@contacttitle nvarchar(30),
	@address nvarchar(60),
	@city nvarchar(15),
	@region nvarchar(15),
	@postalcode nvarchar(10),
	@country nvarchar(15),
	@phone nvarchar(24),
	@fax nvarchar(24)

AS
BEGIN
	INSERT INTO Production.Suppliers(companyname, contactname,contacttitle,[address],city,region,postalcode,country,phone,fax)
	VALUES (@companyname,@contactname,@contacttitle,@address,@city,@region,@postalcode,@country,@phone,@fax)
END

GO
/****** Object:  StoredProcedure [dbo].[LoadCategoryForProduct]    Script Date: 12/6/2016 2:09:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE  PROCEDURE [dbo].[LoadCategoryForProduct]
		
AS
BEGIN
	SELECT categoryid AS 'ID', categoryname AS 'Name' 
	FROM Production.Categories;
END

GO
/****** Object:  StoredProcedure [dbo].[LoadCustomerForOrder]    Script Date: 12/6/2016 2:09:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE  PROCEDURE [dbo].[LoadCustomerForOrder]
		
AS
BEGIN
	SELECT c.custid,c.contactname AS 'display' 
	FROM Sales.Customers c
	ORDER BY c.contactname ASC;
END


GO
/****** Object:  StoredProcedure [dbo].[LoadEmployeeForOrder]    Script Date: 12/6/2016 2:09:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE  PROCEDURE [dbo].[LoadEmployeeForOrder]
		
AS
BEGIN
	SELECT empid,firstname +' ' + lastname AS display 
	FROM HR.Employees;
END


GO
/****** Object:  StoredProcedure [dbo].[LoadProductForOrderDetails]    Script Date: 12/6/2016 2:09:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE  PROCEDURE [dbo].[LoadProductForOrderDetails]

AS
BEGIN
	SELECT	p.productid AS 'ID', 
			p.productname AS 'Name', 
			p.unitprice AS 'Unitprice'
	FROM Production.Products p
	ORDER BY p.productname ASC
END

GO
/****** Object:  StoredProcedure [dbo].[LoadProductForOrders]    Script Date: 12/6/2016 2:09:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE  PROCEDURE [dbo].[LoadProductForOrders]
		
AS
BEGIN
	SELECT productid AS 'ID', 
	productname AS 'Name'
	FROM Production.Products
	ORDER BY productname ASC
END

GO
/****** Object:  StoredProcedure [dbo].[LoadShipperForOrder]    Script Date: 12/6/2016 2:09:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE  PROCEDURE [dbo].[LoadShipperForOrder]
		
AS
BEGIN
	SELECT shipperid,companyname 
	FROM Sales.Shippers;
END


GO
/****** Object:  StoredProcedure [dbo].[LoadSupplierForProduct]    Script Date: 12/6/2016 2:09:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE  PROCEDURE [dbo].[LoadSupplierForProduct]
		
AS
BEGIN
	SELECT supplierid AS 'ID', companyname AS 'ComName' 
	FROM Production.Suppliers;
END

GO
/****** Object:  StoredProcedure [dbo].[ProductForOrderDetailCont]    Script Date: 12/6/2016 2:09:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE  PROCEDURE [dbo].[ProductForOrderDetailCont]
	@ordid int
AS
BEGIN
	SELECT	p.productid AS 'ID', 
			p.productname AS 'Name', 
			p.unitprice AS 'Unitprice'
	FROM Production.Products p
	WHERE p.discontinued = 0 
			AND p.productid NOT IN (SELECT o.productid
									FROM Sales.OrderDetails o
									WHERE o.orderid = @ordid)
	ORDER BY p.productname ASC
END

GO
/****** Object:  StoredProcedure [dbo].[SearchByCategoryName]    Script Date: 12/6/2016 2:09:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE  PROCEDURE [dbo].[SearchByCategoryName]
	@categoryname  nvarchar(15)
	
AS
BEGIN
	SELECT	cate.categoryid AS 'ID',
			cate.categoryname AS 'Category Name', 
			cate.[description] AS 'Description'
	FROM Production.Categories cate
	WHERE cate.categoryname Like '%'+@categoryname+'%';
END

GO
/****** Object:  StoredProcedure [dbo].[SearchByCateProduct]    Script Date: 12/6/2016 2:09:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE  PROCEDURE [dbo].[SearchByCateProduct]
	@cateid int	
AS
BEGIN
	SELECT	p.productid AS 'ID',
			p.productname AS 'Product Name', 
			p.supplierid AS 'Supplier ID',
			(SELECT sup.companyname
			FROM TSQLFundamentals2008.Production.Suppliers sup
			WHERE sup.supplierid = p.supplierid) AS 'Supplier Name',
			p.categoryid AS 'Category ID',
			(SELECT ca.categoryname
			FROM TSQLFundamentals2008.Production.Categories ca
			WHERE ca.categoryid = p.categoryid) AS 'Category Name',
			p.unitprice AS 'Unit price',
			p.discontinued AS 'Discontinue' 
	FROM Production.Products p
	WHERE p.categoryid = @cateid;
END


GO
/****** Object:  StoredProcedure [dbo].[SearchByCompanynameCustomer]    Script Date: 12/6/2016 2:09:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE  PROCEDURE [dbo].[SearchByCompanynameCustomer]
	@companyname  nvarchar(40)
	
AS
BEGIN
	SELECT	c.custid AS 'ID', 
			c.companyname AS 'Company Name', 
			c.contactname AS 'Contact Name', 
			c.contacttitle AS 'Contact Title', 
			c.[address] AS 'Address', 
			c.city AS 'City',  
			c.region AS 'Region', 
			c.postalcode AS 'Postal Code', 
			c.country AS 'Country', 
			c.phone AS 'Phone', 
			c.fax AS 'Fax' 
	FROM Sales.Customers c
	WHERE c.companyname LIKE '%' + @companyname + '%';
END

GO
/****** Object:  StoredProcedure [dbo].[SearchByCompanyNameSuppliers]    Script Date: 12/6/2016 2:09:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE  PROCEDURE [dbo].[SearchByCompanyNameSuppliers]
	@companyname  nvarchar(40)
	
AS
BEGIN
	SELECT	s.supplierid AS 'ID', 
			s.companyname AS 'Company Name', 
			s.contactname AS 'Contact Name', 
			s.contacttitle AS 'Contact Title', 
			s.[address] AS 'Address', 
			s.city AS 'City',  
			s.region AS 'Region', 
			s.postalcode AS 'Postal Code', 
			s.country AS 'Country', 
			s.phone AS 'Phone', 
			s.fax AS 'Fax'  
	FROM Production.Suppliers s
	WHERE s.companyname LIKE '%' + @companyname + '%';
END


GO
/****** Object:  StoredProcedure [dbo].[SearchByContactNameCustomers]    Script Date: 12/6/2016 2:09:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE  PROCEDURE [dbo].[SearchByContactNameCustomers]
	@contactname  nvarchar(15)
	
AS
BEGIN
	SELECT	c.custid AS 'ID', 
			c.companyname AS 'Company Name', 
			c.contactname AS 'Contact Name', 
			c.contacttitle AS 'Contact Title', 
			c.[address] AS 'Address', 
			c.city AS 'City',  
			c.region AS 'Region', 
			c.postalcode AS 'Postal Code', 
			c.country AS 'Country', 
			c.phone AS 'Phone', 
			c.fax AS 'Fax' 
	FROM Sales.Customers c
	WHERE c.contactname LIKE '%' + @contactname + '%';
END

GO
/****** Object:  StoredProcedure [dbo].[SearchByContactNameSuppliers]    Script Date: 12/6/2016 2:09:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE  PROCEDURE [dbo].[SearchByContactNameSuppliers]
	@contactname  nvarchar(15)
	
AS
BEGIN
	SELECT	s.supplierid AS 'ID', 
			s.companyname AS 'Company Name', 
			s.contactname AS 'Contact Name', 
			s.contacttitle AS 'Contact Title', 
			s.[address] AS 'Address', 
			s.city AS 'City',  
			s.region AS 'Region', 
			s.postalcode AS 'Postal Code', 
			s.country AS 'Country', 
			s.phone AS 'Phone', 
			s.fax AS 'Fax'  
	FROM Production.Suppliers s
	WHERE contactname LIKE '%' + @contactname + '%';
END

GO
/****** Object:  StoredProcedure [dbo].[SearchByCountryCustomers]    Script Date: 12/6/2016 2:09:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE  PROCEDURE [dbo].[SearchByCountryCustomers]
	@country  nvarchar(15)
	
AS
BEGIN
	SELECT	c.custid AS 'ID', 
			c.companyname AS 'Company Name', 
			c.contactname AS 'Contact Name', 
			c.contacttitle AS 'Contact Title', 
			c.[address] AS 'Address', 
			c.city AS 'City',  
			c.region AS 'Region', 
			c.postalcode AS 'Postal Code', 
			c.country AS 'Country', 
			c.phone AS 'Phone', 
			c.fax AS 'Fax' 
	FROM Sales.Customers c
	WHERE c.country = @country;
END

GO
/****** Object:  StoredProcedure [dbo].[SearchByCountrySuppliers]    Script Date: 12/6/2016 2:09:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE  PROCEDURE [dbo].[SearchByCountrySuppliers]
	@country  nvarchar(15)
	
AS
BEGIN
	SELECT	s.supplierid AS 'ID', 
			s.companyname AS 'Company Name', 
			s.contactname AS 'Contact Name', 
			s.contacttitle AS 'Contact Title', 
			s.[address] AS 'Address', 
			s.city AS 'City',  
			s.region AS 'Region', 
			s.postalcode AS 'Postal Code', 
			s.country AS 'Country', 
			s.phone AS 'Phone', 
			s.fax AS 'Fax' 
	FROM Production.Suppliers s
	WHERE country = @country;
END

GO
/****** Object:  StoredProcedure [dbo].[SearchByIDOrderDetail]    Script Date: 12/6/2016 2:09:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE  PROCEDURE [dbo].[SearchByIDOrderDetail]
	@orderid  int,
	@productid int
AS
BEGIN
	SELECT	ord.orderid AS 'Order ID',
			ord.productid AS 'Product ID',
			(SELECT p.productname
			FROM Production.Products p
			WHERE p.productid = ord.productid) AS 'Product Name',
			ord.unitprice AS 'Unit Price',
			ord.qty AS 'Quantity',
			ord.discount AS 'Discount'
	FROM Sales.OrderDetails ord
	WHERE ord.orderid=@orderid AND ord.productid=@productid;
END

GO
/****** Object:  StoredProcedure [dbo].[SearchbyNameEmployees]    Script Date: 12/6/2016 2:09:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE  PROCEDURE [dbo].[SearchbyNameEmployees]
	@name  nvarchar(20)
	
AS
BEGIN
	SELECT	e.empid AS 'ID',
			e.lastname AS 'Last name',
			e.firstname AS 'First name',
			e.title AS 'Title',
			e.titleofcourtesy AS 'Title Of Courtesy',
			FORMAT(e.birthdate, 'dd/MM/yyyy') AS 'Birth date',
			FORMAT(e.hiredate, 'dd/MM/yyyy') AS 'Hire date',
			e.[address] AS 'Address',
			e.city AS 'City',
			e.region AS 'Region',
			e.postalcode AS 'Postal Code',
			e.country AS 'Country',
			e.phone AS 'Phone',
			e.mgrid AS 'Manager ID',
			(SELECT tmp.firstname + ' ' + tmp.lastname
			FROM TSQLFundamentals2008.HR.Employees tmp
			WHERE tmp.empid = e.mgrid) AS 'Manager Name' 
	FROM HR.Employees e
	WHERE ((e.firstname + ' ' + e.lastname) LIKE '%' + @name + '%');
END

GO
/****** Object:  StoredProcedure [dbo].[SearchByNameProduct]    Script Date: 12/6/2016 2:09:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE  PROCEDURE [dbo].[SearchByNameProduct]
	@productname nvarchar(40)	
AS
BEGIN
	SELECT	p.productid AS 'ID',
			p.productname AS 'Product Name', 
			p.supplierid AS 'Supplier ID',
			(SELECT sup.companyname
			FROM TSQLFundamentals2008.Production.Suppliers sup
			WHERE sup.supplierid = p.supplierid) AS 'Supplier Name',
			p.categoryid AS 'Category ID',
			(SELECT ca.categoryname
			FROM TSQLFundamentals2008.Production.Categories ca
			WHERE ca.categoryid = p.categoryid) AS 'Category Name',
			p.unitprice AS 'Unit price',
			p.discontinued AS 'Discontinue' 
	FROM Production.Products p
	WHERE p.productname LIKE '%' + @productname + '%';
END


GO
/****** Object:  StoredProcedure [dbo].[SearchByPhoneShipper]    Script Date: 12/6/2016 2:09:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE  PROCEDURE [dbo].[SearchByPhoneShipper]
	@phone  nvarchar(24)
	
AS
BEGIN
	SELECT	s.shipperid AS 'ID',
			s.companyname AS 'Company Name',
			s.phone AS 'Phone'
	FROM Sales.Shippers s
	WHERE s.phone LIKE '%' + @phone + '%';
END

GO
/****** Object:  StoredProcedure [dbo].[SearchByPriceProduct]    Script Date: 12/6/2016 2:09:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE  PROCEDURE [dbo].[SearchByPriceProduct]
	@fromPrice money,
	@toPrice money
AS
BEGIN
	SELECT	p.productid AS 'ID',
			p.productname AS 'Product Name', 
			p.supplierid AS 'Supplier ID',
			(SELECT sup.companyname
			FROM TSQLFundamentals2008.Production.Suppliers sup
			WHERE sup.supplierid = p.supplierid) AS 'Supplier Name',
			p.categoryid AS 'Category ID',
			(SELECT ca.categoryname
			FROM TSQLFundamentals2008.Production.Categories ca
			WHERE ca.categoryid = p.categoryid) AS 'Category Name',
			p.unitprice AS 'Unit price',
			p.discontinued AS 'Discontinue' 
	FROM Production.Products p
	WHERE p.unitprice BETWEEN @fromPrice AND @toPrice;
END


GO
/****** Object:  StoredProcedure [dbo].[SearchByProductForOrders]    Script Date: 12/6/2016 2:09:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE  PROCEDURE [dbo].[SearchByProductForOrders]
	@proid  int
	
AS
BEGIN
	SELECT	o.orderid AS 'ID',
			o.custid AS 'Customer ID',
			(SELECT c.contactname
			FROM Sales.Customers c
			WHERE c.custid = o.custid) AS 'Customer Name',
			o.empid AS 'Employee ID',
			(SELECT e.firstname + ' ' + e.lastname
			FROM HR.Employees e
			WHERE e.empid = o.empid) AS 'Employee Name',
			o.orderdate AS 'Order Date',
			o.requireddate AS 'Required Date',
			o.shippeddate AS 'Shipped Date',
			o.shipperid AS 'Shipper ID',
			(SELECT s.companyname
			FROM Sales.Shippers s
			WHERE s.shipperid = o.shipperid) AS 'Shipper company',
			o.freight AS 'Freight',
			o.shipname AS 'Ship Name',
			o.shipaddress AS 'Ship Address',
			o.shipcity AS 'Ship City',
			o.shipregion AS 'Ship Region',
			o.shippostalcode AS 'Ship Postal Code',
			o.shipcountry AS 'Ship Country'
	FROM Sales.Orders o
	WHERE o.orderid IN (SELECT od.orderid
						FROM Sales.OrderDetails od
						WHERE od.productid = @proid);
END


GO
/****** Object:  StoredProcedure [dbo].[SearchBySupplierProduct]    Script Date: 12/6/2016 2:09:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE  PROCEDURE [dbo].[SearchBySupplierProduct]
	@supid int	
AS
BEGIN
	SELECT	p.productid AS 'ID',
			p.productname AS 'Product Name', 
			p.supplierid AS 'Supplier ID',
			(SELECT sup.companyname
			FROM TSQLFundamentals2008.Production.Suppliers sup
			WHERE sup.supplierid = p.supplierid) AS 'Supplier Name',
			p.categoryid AS 'Category ID',
			(SELECT ca.categoryname
			FROM TSQLFundamentals2008.Production.Categories ca
			WHERE ca.categoryid = p.categoryid) AS 'Category Name',
			p.unitprice AS 'Unit price',
			p.discontinued AS 'Discontinue' 
	FROM Production.Products p
	WHERE p.supplierid = @supid;
END


GO
/****** Object:  StoredProcedure [dbo].[SearchCompanyNameForShippers]    Script Date: 12/6/2016 2:09:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE  PROCEDURE [dbo].[SearchCompanyNameForShippers]
	@companyname nvarchar(40)
	
AS
BEGIN
	SELECT	s.shipperid AS 'ID',
			s.companyname AS 'Company Name',
			s.phone AS 'Phone' 
	FROM Sales.Shippers s
	WHERE s.companyname like '%'+@companyname+'%';
END



GO
/****** Object:  StoredProcedure [dbo].[SearchEmployeesByDate]    Script Date: 12/6/2016 2:09:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE  PROCEDURE [dbo].[SearchEmployeesByDate]
	@fromdate datetime,
	@todate datetime
AS
BEGIN
	SELECT	e.empid AS 'ID',
			e.lastname AS 'Last name',
			e.firstname AS 'First name',
			e.title AS 'Title',
			e.titleofcourtesy AS 'Title Of Courtesy',
			FORMAT(e.birthdate, 'dd/MM/yyyy') AS 'Birth date',
			FORMAT(e.hiredate, 'dd/MM/yyyy') AS 'Hire date',
			e.[address] AS 'Address',
			e.city AS 'City',
			e.region AS 'Region',
			e.postalcode AS 'Postal Code',
			e.country AS 'Country',
			e.phone AS 'Phone',
			e.mgrid AS 'Manager ID',
			(SELECT tmp.firstname + ' ' + tmp.lastname
			FROM TSQLFundamentals2008.HR.Employees tmp
			WHERE tmp.empid = e.mgrid) AS 'Manager Name' 
	FROM HR.Employees e
	WHERE e.birthdate BETWEEN @fromdate AND @todate;
END

GO
/****** Object:  StoredProcedure [dbo].[SearchOrderByOrderDate]    Script Date: 12/6/2016 2:09:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE  PROCEDURE [dbo].[SearchOrderByOrderDate]	
	@From Datetime,
	@To Datetime
	

AS
BEGIN
	SELECT	o.orderid AS 'ID',
			o.custid AS 'Customer ID',
			(SELECT c.contactname
			FROM Sales.Customers c
			WHERE c.custid = o.custid) AS 'Customer Name',
			o.empid AS 'Employee ID',
			(SELECT e.firstname + ' ' + e.lastname
			FROM HR.Employees e
			WHERE e.empid = o.empid) AS 'Employee Name',
			o.orderdate AS 'Order Date',
			o.requireddate AS 'Required Date',
			o.shippeddate AS 'Shipped Date',
			o.shipperid AS 'Shipper ID',
			(SELECT s.companyname
			FROM Sales.Shippers s
			WHERE s.shipperid = o.shipperid) AS 'Shipper company',
			o.freight AS 'Freight',
			o.shipname AS 'Ship Name',
			o.shipaddress AS 'Ship Address',
			o.shipcity AS 'Ship City',
			o.shipregion AS 'Ship Region',
			o.shippostalcode AS 'Ship Postal Code',
			o.shipcountry AS 'Ship Country'
	FROM Sales.Orders o WHERE orderdate between @From and @To;
END


GO
/****** Object:  StoredProcedure [dbo].[SearchOrderByPrice]    Script Date: 12/6/2016 2:09:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SearchOrderByPrice]
	@From Money,
	@To Money
AS
BEGIN

SELECT		o.orderid AS 'ID',
			o.custid AS 'Customer ID',
			(SELECT c.contactname
			FROM Sales.Customers c
			WHERE c.custid = o.custid) AS 'Customer Name',
			o.empid AS 'Employee ID',
			(SELECT e.firstname + ' ' + e.lastname
			FROM HR.Employees e
			WHERE e.empid = o.empid) AS 'Employee Name',
			o.orderdate AS 'Order Date',
			o.requireddate AS 'Required Date',
			o.shippeddate AS 'Shipped Date',
			o.shipperid AS 'Shipper ID',
			(SELECT s.companyname
			FROM Sales.Shippers s
			WHERE s.shipperid = o.shipperid) AS 'Shipper company',
			o.freight AS 'Freight',
			o.shipname AS 'Ship Name',
			o.shipaddress AS 'Ship Address',
			o.shipcity AS 'Ship City',
			o.shipregion AS 'Ship Region',
			o.shippostalcode AS 'Ship Postal Code',
			o.shipcountry AS 'Ship Country' 
FROM Sales.Orders o,		
				(Select * from (Select o.orderid AS 'id',
				CASE WHEN sum(de.qty * de.unitprice*(1-de.discount)) IS NULL THEN 0
						ELSE sum(de.qty * de.unitprice*(1-de.discount)) END AS 'Total'
				From Sales.Orders o
				Left join Sales.OrderDetails de ON o.orderid = de.orderid
				GROUP BY o.orderid) hieu
				where hieu.Total between @From and @To) tmp 
WHERE o.orderid = tmp.id
END

GO
/****** Object:  StoredProcedure [dbo].[SearchOrderByReqiredDate]    Script Date: 12/6/2016 2:09:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE  PROCEDURE [dbo].[SearchOrderByReqiredDate]	
	@From Datetime,
	@To Datetime
	

AS
BEGIN
	SELECT	o.orderid AS 'ID',
			o.custid AS 'Customer ID',
			(SELECT c.contactname
			FROM Sales.Customers c
			WHERE c.custid = o.custid) AS 'Customer Name',
			o.empid AS 'Employee ID',
			(SELECT e.firstname + ' ' + e.lastname
			FROM HR.Employees e
			WHERE e.empid = o.empid) AS 'Employee Name',
			o.orderdate AS 'Order Date',
			o.requireddate AS 'Required Date',
			o.shippeddate AS 'Shipped Date',
			o.shipperid AS 'Shipper ID',
			(SELECT s.companyname
			FROM Sales.Shippers s
			WHERE s.shipperid = o.shipperid) AS 'Shipper company',
			o.freight AS 'Freight',
			o.shipname AS 'Ship Name',
			o.shipaddress AS 'Ship Address',
			o.shipcity AS 'Ship City',
			o.shipregion AS 'Ship Region',
			o.shippostalcode AS 'Ship Postal Code',
			o.shipcountry AS 'Ship Country'
	FROM Sales.Orders o WHERE requireddate between @From and @To;
END


GO
/****** Object:  StoredProcedure [dbo].[SearchOrderByShippedDate]    Script Date: 12/6/2016 2:09:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE  PROCEDURE [dbo].[SearchOrderByShippedDate]	
	@From Datetime,
	@To Datetime
	

AS
BEGIN
	SELECT	o.orderid AS 'ID',
			o.custid AS 'Customer ID',
			(SELECT c.contactname
			FROM Sales.Customers c
			WHERE c.custid = o.custid) AS 'Customer Name',
			o.empid AS 'Employee ID',
			(SELECT e.firstname + ' ' + e.lastname
			FROM HR.Employees e
			WHERE e.empid = o.empid) AS 'Employee Name',
			o.orderdate AS 'Order Date',
			o.requireddate AS 'Required Date',
			o.shippeddate AS 'Shipped Date',
			o.shipperid AS 'Shipper ID',
			(SELECT s.companyname
			FROM Sales.Shippers s
			WHERE s.shipperid = o.shipperid) AS 'Shipper company',
			o.freight AS 'Freight',
			o.shipname AS 'Ship Name',
			o.shipaddress AS 'Ship Address',
			o.shipcity AS 'Ship City',
			o.shipregion AS 'Ship Region',
			o.shippostalcode AS 'Ship Postal Code',
			o.shipcountry AS 'Ship Country'
	FROM Sales.Orders o WHERE shippeddate between @From and @To;
END


GO
/****** Object:  StoredProcedure [dbo].[UpdateCategories]    Script Date: 12/6/2016 2:09:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE  PROCEDURE [dbo].[UpdateCategories]
	@categoryid int,
	@categoryname nvarchar(15),
	@description nvarchar(200)

AS
BEGIN
	UPDATE Production.Categories SET 
	categoryname = @categoryname,
	[description] = @description WHERE categoryid=@categoryid
END

GO
/****** Object:  StoredProcedure [dbo].[UpdateCustomers]    Script Date: 12/6/2016 2:09:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE  PROCEDURE [dbo].[UpdateCustomers]
	@cusid int,
	@companyname nvarchar(40),
	@contactname nvarchar(30),
	@contacttitle nvarchar(30),
	@address nvarchar(60),
	@city nvarchar(15),
	@region nvarchar(15),
	@postalcode nvarchar(10),
	@country nvarchar(15),
	@phone nvarchar(24),
	@fax nvarchar(24)

AS
BEGIN
	UPDATE Sales.Customers SET 
	companyname =@companyname,
	contactname =@contactname,
	contacttitle =@contacttitle,
	[address] =@address,
	city =@city,
	region =@region,
	postalcode = @postalcode,
	country =@country,
	phone =@phone,
	fax =@fax
	WHERE custid=@cusid
END

GO
/****** Object:  StoredProcedure [dbo].[UpdateEmployees]    Script Date: 12/6/2016 2:09:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE  PROCEDURE [dbo].[UpdateEmployees]
	@empid int,
	@lastname nvarchar(20),
	@firstname nvarchar(10),
	@title nvarchar(30),
	@titleofcourtesy nvarchar(25),
	@birthdate datetime,
	@hiredate datetime,
	@address nvarchar(60),
	@city nvarchar(15),
	@region nvarchar(15),
	@postalcode nvarchar(10),
	@country nvarchar(15),
	@phone nvarchar(24),
	@mgrid int

AS
BEGIN
	UPDATE HR.Employees SET lastname=@lastname,firstname=@firstname,title=@title,titleofcourtesy=@titleofcourtesy,
						 birthdate=@birthdate,hiredate=@hiredate,[address]=@address,
						 city=@city,region=@region,postalcode=@postalcode,country=@country,phone=@phone,mgrid=@mgrid WHERE empid=@empid
END

GO
/****** Object:  StoredProcedure [dbo].[UpdateEmployeesSetNullManager]    Script Date: 12/6/2016 2:09:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE  PROCEDURE [dbo].[UpdateEmployeesSetNullManager]
	@empid int

AS
BEGIN
	UPDATE HR.Employees 
	SET mgrid = NULL 
	WHERE mgrid=@empid
END

GO
/****** Object:  StoredProcedure [dbo].[UpdateOrder]    Script Date: 12/6/2016 2:09:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE  PROCEDURE [dbo].[UpdateOrder]
	@orderid int,
	@custid int,
	@empid int,
	@orderdate datetime,
	@requireddate datetime,
	@shippeddate datetime,

	@shipperid int,
	@freight money,
	@shipname nvarchar(40),
	@shipaddress nvarchar(60),
	@shipcity nvarchar(15),
	@shipregion nvarchar(15),
	@shippostalcode nvarchar(10),
	@shipcountry nvarchar(15)

AS
BEGIN
	UPDATE Sales.Orders SET 	
	custid = @custid,
	empid =@empid,
	orderdate =@orderdate,
	requireddate =@requireddate,
	shippeddate =@shippeddate,
	shipperid =@shipperid,
	freight =@freight,
	shipname =@shipname,
	shipaddress =@shipaddress,
	shipcity =@shipcity,
	shipregion =@shipregion,
	shippostalcode =@shippostalcode,
	shipcountry=@shipcountry
		WHERE orderid=@orderid 
END

GO
/****** Object:  StoredProcedure [dbo].[UpdateOrderDetail]    Script Date: 12/6/2016 2:09:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE  PROCEDURE [dbo].[UpdateOrderDetail]
	@orderid int,
	@productid int,
	@unitprice money,
	@qty smallint,
	@discount numeric(4, 3)

AS
BEGIN
	UPDATE Sales.OrderDetails SET 	
	unitprice =@unitprice,
	qty =@qty,
	discount =@discount
		WHERE orderid=@orderid AND productid=@productid
END

GO
/****** Object:  StoredProcedure [dbo].[UpdateProduct]    Script Date: 12/6/2016 2:09:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE  PROCEDURE [dbo].[UpdateProduct]
	@productid int,
	@productname nvarchar(40),
	@supplierid int,
	@categoryid int,
	@unitprice money,
	@discontinued bit

AS
BEGIN
	UPDATE Production.Products SET 
	productname =@productname,
	supplierid =@supplierid,
	categoryid =@categoryid,
	unitprice =@unitprice,
	discontinued =@discontinued
	WHERE productid=@productid
END

GO
/****** Object:  StoredProcedure [dbo].[UpdateShippers]    Script Date: 12/6/2016 2:09:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE  PROCEDURE [dbo].[UpdateShippers]
	@shipperid int,
	@companyname nvarchar(40),
	@phone nvarchar(24)
	

AS
BEGIN
	UPDATE Sales.Shippers SET 	
	companyname =@companyname,
	phone =@phone	
		WHERE shipperid=@shipperid 
END

GO
/****** Object:  StoredProcedure [dbo].[UpdateSuppliers]    Script Date: 12/6/2016 2:09:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE  PROCEDURE [dbo].[UpdateSuppliers]
	@supplierid int,
	@companyname nvarchar(40),
	@contactname nvarchar(30),
	@contacttitle nvarchar(30),
	@address nvarchar(60),
	@city nvarchar(15),
	@region nvarchar(15),
	@postalcode nvarchar(10),
	@country nvarchar(15),
	@phone nvarchar(24),
	@fax nvarchar(24)

AS
BEGIN
	UPDATE Production.Suppliers SET 
	companyname =@companyname,
	contactname =@contactname,
	contacttitle =@contacttitle,
	[address] =@address,
	city =@city,
	region =@region,
	postalcode = @postalcode,
	country =@country,
	phone =@phone,
	fax =@fax
	WHERE supplierid=@supplierid
END

GO
USE [master]
GO
ALTER DATABASE [TSQLFundamentals2008] SET  READ_WRITE 
GO
