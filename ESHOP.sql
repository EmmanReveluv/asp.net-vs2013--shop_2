USE [master]
GO
/****** Object:  Database [dbStore]    Script Date: 3/19/2017 5:02:59 PM ******/
CREATE DATABASE [dbStore]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'dbStore', FILENAME = N'C:\storeDatabase\dbStore.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'dbStore_log', FILENAME = N'C:\storeDatabase\dbStore_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [dbStore] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [dbStore].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [dbStore] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [dbStore] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [dbStore] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [dbStore] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [dbStore] SET ARITHABORT OFF 
GO
ALTER DATABASE [dbStore] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [dbStore] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [dbStore] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [dbStore] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [dbStore] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [dbStore] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [dbStore] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [dbStore] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [dbStore] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [dbStore] SET  DISABLE_BROKER 
GO
ALTER DATABASE [dbStore] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [dbStore] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [dbStore] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [dbStore] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [dbStore] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [dbStore] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [dbStore] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [dbStore] SET RECOVERY FULL 
GO
ALTER DATABASE [dbStore] SET  MULTI_USER 
GO
ALTER DATABASE [dbStore] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [dbStore] SET DB_CHAINING OFF 
GO
ALTER DATABASE [dbStore] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [dbStore] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [dbStore] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'dbStore', N'ON'
GO
ALTER DATABASE [dbStore] SET QUERY_STORE = OFF
GO
USE [dbStore]
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [dbStore]
GO
/****** Object:  Table [dbo].[cart]    Script Date: 3/19/2017 5:03:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cart](
	[email] [varchar](50) NULL,
	[cid] [int] NULL,
	[cartnum] [int] IDENTITY(100,1) NOT NULL,
 CONSTRAINT [PK_cart] PRIMARY KEY CLUSTERED 
(
	[cartnum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[delivery]    Script Date: 3/19/2017 5:03:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[delivery](
	[did] [int] IDENTITY(100,1) NOT NULL,
	[email] [varchar](50) NULL,
	[method] [varchar](50) NULL,
	[address] [text] NULL,
	[status] [varchar](50) NULL,
	[product] [text] NULL,
 CONSTRAINT [PK_delivery] PRIMARY KEY CLUSTERED 
(
	[did] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[discount]    Script Date: 3/19/2017 5:03:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[discount](
	[code] [varchar](50) NULL,
	[discount] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[inbox]    Script Date: 3/19/2017 5:03:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[inbox](
	[email] [varchar](50) NULL,
	[message] [text] NULL,
	[date] [datetime] NULL,
	[mid] [int] IDENTITY(100,1) NOT NULL,
 CONSTRAINT [PK_inbox] PRIMARY KEY CLUSTERED 
(
	[mid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[products]    Script Date: 3/19/2017 5:03:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[products](
	[name] [text] NULL,
	[category] [varchar](50) NULL,
	[subcategory] [varchar](50) NULL,
	[id] [int] IDENTITY(100000,1) NOT NULL,
	[price] [decimal](18, 2) NULL,
	[description] [text] NULL,
	[reseller1location] [text] NULL,
	[reseller1phone] [int] NULL,
	[reseller1email] [varchar](50) NULL,
	[reseller1contactperson] [varchar](50) NULL,
	[reseller2location] [text] NULL,
	[reseller2phone] [int] NULL,
	[reseller2email] [varchar](50) NULL,
	[reseller2contactperson] [varchar](50) NULL,
	[pic1src] [text] NULL,
	[pic2src] [text] NULL,
	[isfeatured] [int] NULL,
 CONSTRAINT [PK_products] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[user]    Script Date: 3/19/2017 5:03:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user](
	[name] [varchar](50) NULL,
	[email] [varchar](50) NOT NULL,
	[password] [varchar](50) NOT NULL,
	[phone] [varchar](50) NOT NULL,
	[orderstatus] [varchar](50) NULL,
	[id] [int] IDENTITY(200000,1) NOT NULL,
	[usertype] [int] NULL,
	[cartsize] [int] NULL,
	[compareitem1] [int] NULL,
	[compareitem2] [int] NULL,
 CONSTRAINT [PK_user] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[cart] ON 

INSERT [dbo].[cart] ([email], [cid], [cartnum]) VALUES (N'emailtest@gmail.com', 100003, 146)
INSERT [dbo].[cart] ([email], [cid], [cartnum]) VALUES (N'emailtest@gmail.com', 100001, 147)
SET IDENTITY_INSERT [dbo].[cart] OFF
SET IDENTITY_INSERT [dbo].[delivery] ON 

INSERT [dbo].[delivery] ([did], [email], [method], [address], [status], [product]) VALUES (101, N'emailtest@gmail.com', N'1', N'1', N'nasiraan ng gulong', N'G.SKILL TridentZ Series 16GB (2 x 8GB) 288-Pin DDR4 3200 (PC4 25600) Z170 Platform Desktop Memory F4-3200C16D-16GTZKW
')
INSERT [dbo].[delivery] ([did], [email], [method], [address], [status], [product]) VALUES (102, N'emailtest@gmail.com', N'1', N'1', N'andyan na ser', N'EVGA GeForce GTX 1080 Founders Edition, 8GB GDDR5X, LED, DX12 OSD Support (PXOC) Graphics Card 08G-P4-6180-KR
')
INSERT [dbo].[delivery] ([did], [email], [method], [address], [status], [product]) VALUES (103, N'emailtest@gmail.com', N'1', N'1', N'In Queue', N'CRYORIG H7 Tower Cooler For AMD/Intel CPU''s')
INSERT [dbo].[delivery] ([did], [email], [method], [address], [status], [product]) VALUES (104, N'emailtest@gmail.com', N'1', N'1', N'In Queue', N'Intel 7th Gen Intel Core Desktop Processor i7-7700K (BX80677I77700K)')
INSERT [dbo].[delivery] ([did], [email], [method], [address], [status], [product]) VALUES (105, N'emailtest@gmail.com', N'1', N'1', N'In Queue', N'EVGA GeForce GTX 1080 Founders Edition, 8GB GDDR5X, LED, DX12 OSD Support (PXOC) Graphics Card 08G-P4-6180-KR')
INSERT [dbo].[delivery] ([did], [email], [method], [address], [status], [product]) VALUES (106, N'emailtest@gmail.com', N'LBC', N'321-B Barangka Drive', N'In Queue', N'Corsair Graphite Series 760T Full Tower Windowed Case - White
')
INSERT [dbo].[delivery] ([did], [email], [method], [address], [status], [product]) VALUES (107, N'emailtest@gmail.com', N'Air 21', N'Bikini Bottom', N'In Queue', N'EVGA GeForce GTX 1080 Founders Edition, 8GB GDDR5X, LED, DX12 OSD Support (PXOC) Graphics Card 08G-P4-6180-KR')
INSERT [dbo].[delivery] ([did], [email], [method], [address], [status], [product]) VALUES (108, N'emailtest@gmail.com', N'1', N'1', N'In Queue', N'Corsair Graphite Series 760T Full Tower Windowed Case - White
')
INSERT [dbo].[delivery] ([did], [email], [method], [address], [status], [product]) VALUES (109, N'emailtest@gmail.com', N'1', N'1', N'In Queue', N'Seagate 10TB BarraCuda Pro 7200RPM SATA 6GB/s 256MB Cache 3.5-Inch Internal Hard Drive (ST10000DM0004)')
INSERT [dbo].[delivery] ([did], [email], [method], [address], [status], [product]) VALUES (110, N'emailtest@gmail.com', N'1', N'1', N'In Queue', N'EVGA GeForce GTX 1080 Founders Edition, 8GB GDDR5X, LED, DX12 OSD Support (PXOC) Graphics Card 08G-P4-6180-KR')
INSERT [dbo].[delivery] ([did], [email], [method], [address], [status], [product]) VALUES (111, N'emailtest@gmail.com', N'Air 21', N'321-B Barangka Drive', N'In Queue', N'CRYORIG H7 Tower Cooler For AMD/Intel CPU''s')
INSERT [dbo].[delivery] ([did], [email], [method], [address], [status], [product]) VALUES (112, N'emailtest@gmail.com', N'Air 21', N'321-B Barangka Drive', N'In Queue', N'Corsair AXi Series, AX860i, 860 Watt (860W), Fully Modular Digital Power Supply, 80+ Platinum Certified')
INSERT [dbo].[delivery] ([did], [email], [method], [address], [status], [product]) VALUES (113, N'emailtest@gmail.com', N'1', N'1', N'In Queue', N'EVGA GeForce GTX 1080 Founders Edition, 8GB GDDR5X, LED, DX12 OSD Support (PXOC) Graphics Card 08G-P4-6180-KR')
INSERT [dbo].[delivery] ([did], [email], [method], [address], [status], [product]) VALUES (114, N'emailtest@gmail.com', N'1', N'1', N'In Queue', N'G.SKILL TridentZ Series 16GB (2 x 8GB) 288-Pin DDR4 3200 (PC4 25600) Z170 Platform Desktop Memory F4-3200C16D-16GTZKW')
INSERT [dbo].[delivery] ([did], [email], [method], [address], [status], [product]) VALUES (115, N'emailtest@gmail.com', N'1', N'1', N'In Queue', N'ASUS ROG MAXIMUS VIII HERO LGA1151 DDR4 M.2 SATA 6Gb/s USB 3.1 Type A Type C Intel Z170 ATX Motherboard')
INSERT [dbo].[delivery] ([did], [email], [method], [address], [status], [product]) VALUES (116, N'emailtest@gmail.com', N'1', N'1', N'In Queue', N'Intel 7th Gen Intel Core Desktop Processor i7-7700K (BX80677I77700K)')
INSERT [dbo].[delivery] ([did], [email], [method], [address], [status], [product]) VALUES (117, N'emailtest@gmail.com', N'1', N'1', N'In Queue', N'Corsair Graphite Series 760T Full Tower Windowed Case - White
')
INSERT [dbo].[delivery] ([did], [email], [method], [address], [status], [product]) VALUES (118, N'emailtest@gmail.com', N'1', N'1', N'In Queue', N'G.SKILL TridentZ Series 16GB (2 x 8GB) 288-Pin DDR4 3200 (PC4 25600) Z170 Platform Desktop Memory F4-3200C16D-16GTZKW')
INSERT [dbo].[delivery] ([did], [email], [method], [address], [status], [product]) VALUES (119, N'emailtest@gmail.com', N'1', N'1', N'In Queue', N'ASUS ROG MAXIMUS VIII HERO LGA1151 DDR4 M.2 SATA 6Gb/s USB 3.1 Type A Type C Intel Z170 ATX Motherboard')
INSERT [dbo].[delivery] ([did], [email], [method], [address], [status], [product]) VALUES (120, N'emailtest@gmail.com', N'1', N'11', N'In Queue', N'EVGA GeForce GTX 1080 Founders Edition, 8GB GDDR5X, LED, DX12 OSD Support (PXOC) Graphics Card 08G-P4-6180-KR')
INSERT [dbo].[delivery] ([did], [email], [method], [address], [status], [product]) VALUES (121, N'emailtest@gmail.com', N'1', N'11', N'In Queue', N'Seagate 10TB BarraCuda Pro 7200RPM SATA 6GB/s 256MB Cache 3.5-Inch Internal Hard Drive (ST10000DM0004)')
INSERT [dbo].[delivery] ([did], [email], [method], [address], [status], [product]) VALUES (122, N'emailtest@gmail.com', N'1', N'1', N'In Queue', N'G.SKILL TridentZ Series 16GB (2 x 8GB) 288-Pin DDR4 3200 (PC4 25600) Z170 Platform Desktop Memory F4-3200C16D-16GTZKW')
SET IDENTITY_INSERT [dbo].[delivery] OFF
INSERT [dbo].[discount] ([code], [discount]) VALUES (N'wasakangedsa', 10)
SET IDENTITY_INSERT [dbo].[inbox] ON 

INSERT [dbo].[inbox] ([email], [message], [date], [mid]) VALUES (N'wasak@gmail', N'wasak ang edsa', CAST(N'2017-02-21T23:37:43.930' AS DateTime), 101)
INSERT [dbo].[inbox] ([email], [message], [date], [mid]) VALUES (N'emmanuel.logatoc@gmail.com', N'this is my message', CAST(N'2017-03-14T23:54:33.320' AS DateTime), 103)
INSERT [dbo].[inbox] ([email], [message], [date], [mid]) VALUES (N'emmanuel.logatoc@gmail.com', N'hello darkness my old friend', CAST(N'2017-03-14T23:55:18.037' AS DateTime), 104)
INSERT [dbo].[inbox] ([email], [message], [date], [mid]) VALUES (N'emmanuel.logatoc@gmail.com', N'asd123', CAST(N'2017-03-16T09:43:21.867' AS DateTime), 105)
SET IDENTITY_INSERT [dbo].[inbox] OFF
SET IDENTITY_INSERT [dbo].[products] ON 

INSERT [dbo].[products] ([name], [category], [subcategory], [id], [price], [description], [reseller1location], [reseller1phone], [reseller1email], [reseller1contactperson], [reseller2location], [reseller2phone], [reseller2email], [reseller2contactperson], [pic1src], [pic2src], [isfeatured]) VALUES (N'Corsair Graphite Series 760T Full Tower Windowed Case - White
', N'desktop', N'chassis', 100000, CAST(8450.00 AS Decimal(18, 2)), N'Gorgeous full panel window for maximum visibility of your internal components<br />
Hinged side panels with quick release latches for easy access<br />
Generous expansion room for building high-performance systems<br />
Tool-free SSD, Hard Drive, and Optical Drive installation<br />
Includes three AF140L fans, (front fans with LEDs) with room for up to seven fans<br />
Fan speed toggle switch allows you to set your fans to &quot;silent&quot; or &quot;performance&quot; modes<br />
Modular drive cage system for highly customizable layouts<br />
Designed for fast and straightforward builds<br />
', N'https://tipidpc.com/viewitem.php?iid=40596499', 4128482, N'none', N'none', N'https://dynaquestpc.com/', 0, N'none', N'none', N'product/case1.jpg', N'product/case2.jpg', 0)
INSERT [dbo].[products] ([name], [category], [subcategory], [id], [price], [description], [reseller1location], [reseller1phone], [reseller1email], [reseller1contactperson], [reseller2location], [reseller2phone], [reseller2email], [reseller2contactperson], [pic1src], [pic2src], [isfeatured]) VALUES (N'CRYORIG H7 Tower Cooler For AMD/Intel CPU''s', N'desktop', N'other', 100001, CAST(8450.00 AS Decimal(18, 2)), N'Proprietary Hive Fin System for airflow optimization, air turbulence reduction, added heat dissipation area, Jet Fin Acceleration SystemTM, and structural support.<br />3 Pure Copper Heatpipes<br />Heatpipe Convex-AlignTM and Displacement Optimization TM high efficient heatpipe layout and design<br />Includes one QF120 120mm PWM fan with our proprietary HPLNTM bearing for optimum airflow and noise ratio, and Quad Air Inlet TM for increased air intake<br />', N'none', 0, N'none', N'none', N'none', 0, N'none', N'none', N'product/cryorig1.jpg', N'product/cryorig2.jpg', 1)
INSERT [dbo].[products] ([name], [category], [subcategory], [id], [price], [description], [reseller1location], [reseller1phone], [reseller1email], [reseller1contactperson], [reseller2location], [reseller2phone], [reseller2email], [reseller2contactperson], [pic1src], [pic2src], [isfeatured]) VALUES (N'EVGA GeForce GTX 1080 Founders Edition, 8GB GDDR5X, LED, DX12 OSD Support (PXOC) Graphics Card 08G-P4-6180-KR', N'desktop', N'gpu', 100002, CAST(34455.00 AS Decimal(18, 2)), N'Real Base Clock: 1607 MHz / Real Boost Clock: 1733 MHz; Memory Detail: 8192MB GDDR5X<br />Discover unprecedented performance w/ the EVGA GTX 1080 Founders Edition.<br />What you see is what you get! – No additional software required to achieve listed clock speeds<br />DX12 OSD Support with EVGA Precision XOC<br />3 Year Warranty & EVGA''s 24/7 Technical Support', N'https://tipidpc.com/viewitem.php?iid=40596499', 4128482, N'none', N'none', N'https://dynaquestpc.com/', 0, N'none', N'none', N'product/gtx1080.jpg', N'product/gtx1080_2.jpg', 1)
INSERT [dbo].[products] ([name], [category], [subcategory], [id], [price], [description], [reseller1location], [reseller1phone], [reseller1email], [reseller1contactperson], [reseller2location], [reseller2phone], [reseller2email], [reseller2contactperson], [pic1src], [pic2src], [isfeatured]) VALUES (N'ASUS ROG MAXIMUS VIII HERO LGA1151 DDR4 M.2 SATA 6Gb/s USB 3.1 Type A Type C Intel Z170 ATX Motherboard', N'desktop', N'motherboard', 100003, CAST(10365.00 AS Decimal(18, 2)), N'LGA 1151 Socket for 6th Generation Intel core Desktop Processor<br />SupremeFX 2015<br />USB 3.1 Type A & C Onboard<br />Sonic Sense Amp, Lighting Control<br />Please refer the User Manual before use & for booting the device.', N'https://tipidpc.com/viewitem.php?iid=40596499', 4128482, N'none', N'none', N'https://dynaquestpc.com/', 0, N'none', N'none', N'product/asus1_.jpg', N'product/asus2_.jpg', 1)
INSERT [dbo].[products] ([name], [category], [subcategory], [id], [price], [description], [reseller1location], [reseller1phone], [reseller1email], [reseller1contactperson], [reseller2location], [reseller2phone], [reseller2email], [reseller2contactperson], [pic1src], [pic2src], [isfeatured]) VALUES (N'Seagate 10TB BarraCuda Pro 7200RPM SATA 6GB/s 256MB Cache 3.5-Inch Internal Hard Drive (ST10000DM0004)', N'desktop', N'hdd', 100004, CAST(23085.00 AS Decimal(18, 2)), N'Upgrade your storage and performance<br />Store all your games, music, movies and more with up to 10TB of storage<br />Access your data faster thanks to 7200 RPM speed and SATA 6Gb/s interface<br />Get the best 5-year limited warranty in its class<br />Enjoy peace of mind with Seagate’s Rescue Data Recovery Plan, standard on BarraCuda Pro', N'https://tipidpc.com/viewitem.php?iid=40596499', 4128482, N'none', N'none', N'https://dynaquestpc.com/', 0, N'none', N'none', N'product/hdd1.jpg', N'product/hdd2.jpg', 0)
INSERT [dbo].[products] ([name], [category], [subcategory], [id], [price], [description], [reseller1location], [reseller1phone], [reseller1email], [reseller1contactperson], [reseller2location], [reseller2phone], [reseller2email], [reseller2contactperson], [pic1src], [pic2src], [isfeatured]) VALUES (N'Intel 7th Gen Intel Core Desktop Processor i7-7700K (BX80677I77700K)', N'desktop', N'processor', 100005, CAST(17015.00 AS Decimal(18, 2)), N'Socket LGA 1151<br />Intel 200/1001 Series Chipset Compatibility (1. Excludes Intel Optane Technology support)<br />Intel HD Graphics 630<br />Intel Turbo Boost 2.0 Technology<br />Intel Hyper-Threading Technology1', N'none', 0, N'none', N'none', N'none', 0, N'none', N'none', N'product/i71.jpg', N'product/i71.jpg', 1)
INSERT [dbo].[products] ([name], [category], [subcategory], [id], [price], [description], [reseller1location], [reseller1phone], [reseller1email], [reseller1contactperson], [reseller2location], [reseller2phone], [reseller2email], [reseller2contactperson], [pic1src], [pic2src], [isfeatured]) VALUES (N'G.SKILL TridentZ Series 16GB (2 x 8GB) 288-Pin DDR4 3200 (PC4 25600) Z170 Platform Desktop Memory F4-3200C16D-16GTZKW', N'desktop', N'memory', 100006, CAST(7025.00 AS Decimal(18, 2)), N'Capacity: 16GB (2 x 8GB), Type: 288-Pin DDR4 SDRAM<br />Speed: DDR4 3200 PC4-25600, Chipset: Intel Z170 Platform<br />Cas Latency: 16, Timing: 16-18-18-38, Voltage: 1.35V<br />ECC: No, Buffered/Registered: Unbuffered<br />Multi-channel Kit: Dual Channel Kit', N'none', 0, N'none', N'none', N'none', 0, N'none', N'none', N'product/mem1.jpg', N'product/mem2.jpg', 0)
INSERT [dbo].[products] ([name], [category], [subcategory], [id], [price], [description], [reseller1location], [reseller1phone], [reseller1email], [reseller1contactperson], [reseller2location], [reseller2phone], [reseller2email], [reseller2contactperson], [pic1src], [pic2src], [isfeatured]) VALUES (N'Corsair AXi Series, AX860i, 860 Watt (860W), Fully Modular Digital Power Supply, 80+ Platinum Certified', N'desktop', N'psu', 100007, CAST(10050.00 AS Decimal(18, 2)), N'The latest ATX12V v2.31 and EPS 2.92 standards and it is backward compatible with ATX12V 2.2 and ATX12V 2.01 systems<br />Silent at low to moderate load due to high efficiency and zero RPM fanless mode. Ultra quiet at high loads with 120mm dual-ball bearing fan<br />80 PLUS Platinum certified, delivering over 92% energy efficiency at real world load conditions. Active Power Factor Correction (PFC) with PF value of 0.99. Universal AC input from 90~264V<br />Ten year warranty: Your guarantee of reliable operation that will last across several system builds<br />NOTE: Kindly review the videos under the image section and user manual under product details for set up and user guidance.', N'none', 0, N'none', N'none', N'none', 0, N'none', N'none', N'product/psu1.jpg', N'product/psu2.jpg', 0)
SET IDENTITY_INSERT [dbo].[products] OFF
SET IDENTITY_INSERT [dbo].[user] ON 

INSERT [dbo].[user] ([name], [email], [password], [phone], [orderstatus], [id], [usertype], [cartsize], [compareitem1], [compareitem2]) VALUES (N'User', N'wasak@ang.edsa', N'asd123', N'92381423', NULL, 200000, 0, 0, NULL, NULL)
INSERT [dbo].[user] ([name], [email], [password], [phone], [orderstatus], [id], [usertype], [cartsize], [compareitem1], [compareitem2]) VALUES (N'Test', N'emailtest@gmail.com', N'asd123', N'29418902', NULL, 200001, 0, 0, 100001, 100001)
INSERT [dbo].[user] ([name], [email], [password], [phone], [orderstatus], [id], [usertype], [cartsize], [compareitem1], [compareitem2]) VALUES (N'test', N'aasd@asjdk.com', N'asd123', N'230914', NULL, 200002, 0, 0, NULL, NULL)
INSERT [dbo].[user] ([name], [email], [password], [phone], [orderstatus], [id], [usertype], [cartsize], [compareitem1], [compareitem2]) VALUES (N'ADMIN', N'admin@pogi.com', N'asd123', N'29325', NULL, 200003, 1, 0, NULL, NULL)
INSERT [dbo].[user] ([name], [email], [password], [phone], [orderstatus], [id], [usertype], [cartsize], [compareitem1], [compareitem2]) VALUES (N'emmanuel logatoc', N'emmanuel.logatoc@gmail.com', N'asd123', N'9231423', NULL, 200004, 0, 0, NULL, 100003)
INSERT [dbo].[user] ([name], [email], [password], [phone], [orderstatus], [id], [usertype], [cartsize], [compareitem1], [compareitem2]) VALUES (N'asd', N'asdd@gmail.com', N'asd123', N'123254', NULL, 200005, 0, 0, NULL, NULL)
INSERT [dbo].[user] ([name], [email], [password], [phone], [orderstatus], [id], [usertype], [cartsize], [compareitem1], [compareitem2]) VALUES (N'triple h', N'google@googl.com', N'asd123', N'10928300918490', NULL, 200006, 0, 0, NULL, NULL)
INSERT [dbo].[user] ([name], [email], [password], [phone], [orderstatus], [id], [usertype], [cartsize], [compareitem1], [compareitem2]) VALUES (N'john', N'john@johnjohn', N'asd123', N'09149028342', NULL, 200007, 0, 0, NULL, NULL)
INSERT [dbo].[user] ([name], [email], [password], [phone], [orderstatus], [id], [usertype], [cartsize], [compareitem1], [compareitem2]) VALUES (N'emmanuel logatoc', N'jeglogatoc@mymail.mapua.edu.ph', N'asd123', N'9158832893', NULL, 200008, 0, 0, NULL, NULL)
SET IDENTITY_INSERT [dbo].[user] OFF
ALTER TABLE [dbo].[delivery] ADD  CONSTRAINT [DF_delivery_status]  DEFAULT ('In Queue') FOR [status]
GO
ALTER TABLE [dbo].[inbox] ADD  CONSTRAINT [DF_inbox_date]  DEFAULT (getdate()) FOR [date]
GO
ALTER TABLE [dbo].[products] ADD  CONSTRAINT [DF_products_name]  DEFAULT ('0') FOR [name]
GO
ALTER TABLE [dbo].[products] ADD  CONSTRAINT [DF_products_reseller1phone]  DEFAULT ((0)) FOR [reseller1phone]
GO
ALTER TABLE [dbo].[products] ADD  CONSTRAINT [DF_products_reseller2phone]  DEFAULT ((0)) FOR [reseller2phone]
GO
ALTER TABLE [dbo].[products] ADD  CONSTRAINT [DF_products_isfeatured]  DEFAULT ((0)) FOR [isfeatured]
GO
ALTER TABLE [dbo].[user] ADD  CONSTRAINT [DF_user_usertype]  DEFAULT ((0)) FOR [usertype]
GO
ALTER TABLE [dbo].[user] ADD  CONSTRAINT [DF_user_cartsize]  DEFAULT ((0)) FOR [cartsize]
GO
/****** Object:  StoredProcedure [dbo].[basicUpdateProduct]    Script Date: 3/19/2017 5:03:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[basicUpdateProduct]
(@price decimal,
@subcategory varchar(50),
@category varchar(50),
@name text,
@description text,
@reseller1location text,
@reseller1phone varchar(50),
@reseller1email varchar(50),
@reseller1contactperson varchar(50),
@reseller2location text,
@reseller2phone varchar(50),
@reseller2email varchar(50),
@reseller2contactperson varchar(50),
@pic1src text,
@pic2src text,
@isfeatured int,
@id int)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	UPDATE products
	 SET 
	price = @price,
	subcategory = @subcategory,
	category = @category,
	name = @name,
	description = @description,
	reseller1location = @reseller1location,
	reseller1phone = @reseller1phone,
	reseller1email = @reseller1email,
	reseller1contactperson = @reseller1contactperson,
	reseller2location = @reseller2location,
	reseller2phone = @reseller2phone,
	reseller2email = @reseller2email,
	reseller2contactperson = @reseller2contactperson,
	pic1src = @pic1src,
	pic2src = @pic2src,
	isfeatured = @isfeatured
	where
	id = @id;
END

GO
/****** Object:  StoredProcedure [dbo].[cartAdd]    Script Date: 3/19/2017 5:03:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[cartAdd]
(@email varchar(50),@cid int, @ret int output)

AS
BEGIN
if(@@ROWCOUNT = 0)
	begin

		INSERT INTO cart (email,cid)
		VALUES (@email,@cid)
			set @ret=1;
	end
	else
		set @ret=0;
	
END

GO
/****** Object:  StoredProcedure [dbo].[cartItemDelete]    Script Date: 3/19/2017 5:03:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[cartItemDelete]
(@cartnum int)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	delete from cart where cartnum=@cartnum
END

GO
/****** Object:  StoredProcedure [dbo].[cartSelect]    Script Date: 3/19/2017 5:03:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[cartSelect]
(@email varchar(50))
AS
BEGIN
	select * from cart where email = @email
END

GO
/****** Object:  StoredProcedure [dbo].[compare1Insert]    Script Date: 3/19/2017 5:03:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[compare1Insert]
(@email varchar(50),
@compareitem1 int)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	update [user]	set compareitem1 = @compareitem1	where email = @email

END

GO
/****** Object:  StoredProcedure [dbo].[compare2Insert]    Script Date: 3/19/2017 5:03:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[compare2Insert]
(@email varchar(50),
@compareitem2 int)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	update [user]	set compareitem2 = @compareitem2	where email = @email

END

GO
/****** Object:  StoredProcedure [dbo].[compareSelect]    Script Date: 3/19/2017 5:03:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[compareSelect]
(@email varchar(50))
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
		select * from [user] where email=@email;
END

GO
/****** Object:  StoredProcedure [dbo].[deliveryAdd]    Script Date: 3/19/2017 5:03:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[deliveryAdd]
(@email varchar(50),
@method varchar(50),
@address text,
@cartnum int,
@product text)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	insert into delivery (email,address, method, product) values (@email, @address, @method,@product);


	delete from cart where cartnum = @cartnum;

END

GO
/****** Object:  StoredProcedure [dbo].[deliveryadminSelect]    Script Date: 3/19/2017 5:03:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[deliveryadminSelect]
(@did int)
AS
BEGIN
	select * from delivery where did=@did

END

GO
/****** Object:  StoredProcedure [dbo].[deliveryallSelect]    Script Date: 3/19/2017 5:03:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[deliveryallSelect]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	select * from delivery
END

GO
/****** Object:  StoredProcedure [dbo].[deliverySelect]    Script Date: 3/19/2017 5:03:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[deliverySelect]
(@email varchar(50))
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	select * from delivery where email = @email
END

GO
/****** Object:  StoredProcedure [dbo].[deliveryUpdate]    Script Date: 3/19/2017 5:03:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[deliveryUpdate]
(@did int,
@status varchar(50))

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	UPDATE delivery
	 SET 
	 status=@status
	 where
	did = @did;
END

GO
/****** Object:  StoredProcedure [dbo].[discountSelect]    Script Date: 3/19/2017 5:03:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[discountSelect] (@code varchar(50))
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	select * from discount where code=@code
END

GO
/****** Object:  StoredProcedure [dbo].[featuredSelect]    Script Date: 3/19/2017 5:03:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[featuredSelect]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	select * from products where isfeatured = 1
END

GO
/****** Object:  StoredProcedure [dbo].[filteredSelect]    Script Date: 3/19/2017 5:03:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[filteredSelect]
(
@category varchar(50),
@subcategory varchar(50)
)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	if @subcategory = 'none' and @category = 'none'
	begin
	SELECT [name], [category], [subcategory], [price], [pic1src] , [id] FROM [products]
	end
	else if @subcategory = 'none'	
	begin
	SELECT [name], [category], [subcategory], [price], [pic1src] , [id] FROM [products] WHERE ([category] = @category)
	end
	else
	SELECT [name], [category], [subcategory], [price], [pic1src] , [id] FROM [products] WHERE (([category] = @category) AND ([subcategory] = @subcategory))
END

GO
/****** Object:  StoredProcedure [dbo].[inboxSelect]    Script Date: 3/19/2017 5:03:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[inboxSelect]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SELECT * FROM [inbox] ORDER BY [date] DESC
END

GO
/****** Object:  StoredProcedure [dbo].[loginSelect]    Script Date: 3/19/2017 5:03:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[loginSelect]
(
@email varchar(50),
@password varchar(50),
@login int output
)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	if ((select password from [user] where email=@email) = @password)
	begin
		set @login = 1;
		select * from [user] where email=@email;
	end
else
		set @login=0;

END

GO
/****** Object:  StoredProcedure [dbo].[messageAdd]    Script Date: 3/19/2017 5:03:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[messageAdd]
(@email varchar(50),
@message text)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;


		INSERT INTO inbox (email,message)
		VALUES (@email,@message)
			
	
	
END

GO
/****** Object:  StoredProcedure [dbo].[messageDelete]    Script Date: 3/19/2017 5:03:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[messageDelete]
(@mid int)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	delete from inbox where mid=@mid
END

GO
/****** Object:  StoredProcedure [dbo].[productAdd]    Script Date: 3/19/2017 5:03:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[productAdd]
(@price decimal,
@subcategory varchar(50),
@category varchar(50),
@name text,
@description text,
@reseller1location text,
@reseller1phone varchar(50),
@reseller1email varchar(50),
@reseller1contactperson varchar(50),
@reseller2location text,
@reseller2phone varchar(50),
@reseller2email varchar(50),
@reseller2contactperson varchar(50),
@pic1src text,
@pic2src text,
@isfeatured int)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	insert into products (price, subcategory, category,name,description,
							reseller1location,reseller1phone,reseller1email,
							reseller1contactperson,reseller2location,reseller2phone,
							reseller2email,reseller2contactperson,pic1src,pic2src,
							isfeatured)
	values
	(@price,@subcategory,@category,@name,@description,@reseller1location,@reseller1phone,
		@reseller1email,@reseller1contactperson,@reseller2location,@reseller2phone,
		@reseller2email,@reseller2contactperson,@pic1src,@pic2src,@isfeatured)
END

GO
/****** Object:  StoredProcedure [dbo].[productallSelect]    Script Date: 3/19/2017 5:03:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[productallSelect]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	select * from products;
END

GO
/****** Object:  StoredProcedure [dbo].[productDelete]    Script Date: 3/19/2017 5:03:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[productDelete]
(@id int)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	
	delete from products where id = @id
END

GO
/****** Object:  StoredProcedure [dbo].[productSelect]    Script Date: 3/19/2017 5:03:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[productSelect]
(@id int)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	select * from products where id = @id
END

GO
/****** Object:  StoredProcedure [dbo].[searchSelect]    Script Date: 3/19/2017 5:03:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[searchSelect]
(
@search varchar(50)
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select * from
	 products
	  where	   
	   name like '%' + @search + '%'
	   or	   
	   category like '%' + @search + '%'
	   or	   
	   subcategory like '%' + @search + '%'
	   or	   
	   description like '%' + @search + '%'
END

GO
/****** Object:  StoredProcedure [dbo].[selectSameUsername]    Script Date: 3/19/2017 5:03:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[selectSameUsername]
(@email varchar(50))
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	select * from [user] where email = @email;
END

GO
/****** Object:  StoredProcedure [dbo].[subcategSelect]    Script Date: 3/19/2017 5:03:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[subcategSelect]
(@category varchar(50))
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	select * from products where category = @category

END

GO
/****** Object:  StoredProcedure [dbo].[userAdd]    Script Date: 3/19/2017 5:03:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[userAdd]
(
@name varchar(50),
@email varchar(50),
@password varchar(50),
@phone varchar(50),
@ret int output
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

if(@@ROWCOUNT = 0)
	begin

		INSERT INTO [user] (name,email,password,phone)
		VALUES (@name,@email,@password,@phone)
			set @ret=1;
	end
	else
		set @ret=0;
END

GO
USE [master]
GO
ALTER DATABASE [dbStore] SET  READ_WRITE 
GO
