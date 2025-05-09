CREATE DATABASE [UP2]
ALTER DATABASE [UP2] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [UP2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [UP2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [UP2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [UP2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [UP2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [UP2] SET ARITHABORT OFF 
GO
ALTER DATABASE [UP2] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [UP2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [UP2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [UP2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [UP2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [UP2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [UP2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [UP2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [UP2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [UP2] SET  DISABLE_BROKER 
GO
ALTER DATABASE [UP2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [UP2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [UP2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [UP2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [UP2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [UP2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [UP2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [UP2] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [UP2] SET  MULTI_USER 
GO
ALTER DATABASE [UP2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [UP2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [UP2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [UP2] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [UP2] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [UP2] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [UP2] SET QUERY_STORE = ON
GO
ALTER DATABASE [UP2] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [UP2]
GO
/****** Object:  Table [dbo].[MaterialType]    Script Date: 18.12.2024 22:19:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MaterialType](
	[materialType] [int] IDENTITY(1,1) NOT NULL,
	[DefectPercent] [float] NOT NULL,
 CONSTRAINT [PK_MaterialType] PRIMARY KEY CLUSTERED 
(
	[materialType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PartnerProducts]    Script Date: 18.12.2024 22:19:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PartnerProducts](
	[PartnerID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[Quantity] [int] NULL,
	[Date] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[PartnerID] ASC,
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Partners]    Script Date: 18.12.2024 22:19:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Partners](
	[PartnerID] [int] IDENTITY(1,1) NOT NULL,
	[PartnerType] [int] NULL,
	[CompanyName] [varchar](255) NOT NULL,
	[LegalAddress] [varchar](255) NULL,
	[INN] [varchar](12) NOT NULL,
	[DirectorName] [varchar](255) NULL,
	[Phone] [varchar](20) NULL,
	[Email] [varchar](100) NULL,
	[Rating] [int] NULL,
 CONSTRAINT [PK__Partners__39FD6332DFB1FD58] PRIMARY KEY CLUSTERED 
(
	[PartnerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PartnersType]    Script Date: 18.12.2024 22:19:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PartnersType](
	[PartnersTypeID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](150) NULL,
PRIMARY KEY CLUSTERED 
(
	[PartnersTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 18.12.2024 22:19:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[Article] [varchar](100) NULL,
	[ProductType] [int] NULL,
	[ProductName] [varchar](255) NULL,
	[MinPrice] [decimal](10, 2) NULL,
	[Description] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductsType]    Script Date: 18.12.2024 22:19:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductsType](
	[ProductsTypeID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](150) NULL,
	[Ratio] [decimal](3, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductsTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[MaterialType] ON 

INSERT [dbo].[MaterialType] ([materialType], [DefectPercent]) VALUES (1, 0.1)
INSERT [dbo].[MaterialType] ([materialType], [DefectPercent]) VALUES (2, 0.95)
INSERT [dbo].[MaterialType] ([materialType], [DefectPercent]) VALUES (3, 0.28)
INSERT [dbo].[MaterialType] ([materialType], [DefectPercent]) VALUES (4, 0.55)
INSERT [dbo].[MaterialType] ([materialType], [DefectPercent]) VALUES (5, 0.34)
SET IDENTITY_INSERT [dbo].[MaterialType] OFF
GO
INSERT [dbo].[PartnerProducts] ([PartnerID], [ProductID], [Quantity], [Date]) VALUES (6, 1, 15500, CAST(N'2023-03-23T00:00:00.000' AS DateTime))
INSERT [dbo].[PartnerProducts] ([PartnerID], [ProductID], [Quantity], [Date]) VALUES (6, 3, 12350, CAST(N'2023-12-18T00:00:00.000' AS DateTime))
INSERT [dbo].[PartnerProducts] ([PartnerID], [ProductID], [Quantity], [Date]) VALUES (6, 4, 37400, CAST(N'2024-06-07T00:00:00.000' AS DateTime))
INSERT [dbo].[PartnerProducts] ([PartnerID], [ProductID], [Quantity], [Date]) VALUES (8, 1, 7550, CAST(N'2024-07-01T00:00:00.000' AS DateTime))
INSERT [dbo].[PartnerProducts] ([PartnerID], [ProductID], [Quantity], [Date]) VALUES (8, 2, 35000, CAST(N'2022-12-02T00:00:00.000' AS DateTime))
INSERT [dbo].[PartnerProducts] ([PartnerID], [ProductID], [Quantity], [Date]) VALUES (8, 3, 1000, CAST(N'2024-06-07T00:00:00.000' AS DateTime))
INSERT [dbo].[PartnerProducts] ([PartnerID], [ProductID], [Quantity], [Date]) VALUES (8, 5, 1250, CAST(N'2023-05-17T00:00:00.000' AS DateTime))
INSERT [dbo].[PartnerProducts] ([PartnerID], [ProductID], [Quantity], [Date]) VALUES (9, 1, 7250, CAST(N'2023-01-22T00:00:00.000' AS DateTime))
INSERT [dbo].[PartnerProducts] ([PartnerID], [ProductID], [Quantity], [Date]) VALUES (9, 2, 2500, CAST(N'2024-07-05T00:00:00.000' AS DateTime))
INSERT [dbo].[PartnerProducts] ([PartnerID], [ProductID], [Quantity], [Date]) VALUES (10, 3, 37200, CAST(N'2024-03-12T00:00:00.000' AS DateTime))
INSERT [dbo].[PartnerProducts] ([PartnerID], [ProductID], [Quantity], [Date]) VALUES (10, 4, 59050, CAST(N'2023-03-20T00:00:00.000' AS DateTime))
INSERT [dbo].[PartnerProducts] ([PartnerID], [ProductID], [Quantity], [Date]) VALUES (10, 5, 4500, CAST(N'2024-05-14T00:00:00.000' AS DateTime))
INSERT [dbo].[PartnerProducts] ([PartnerID], [ProductID], [Quantity], [Date]) VALUES (11, 1, 35000, CAST(N'2024-04-15T00:00:00.000' AS DateTime))
INSERT [dbo].[PartnerProducts] ([PartnerID], [ProductID], [Quantity], [Date]) VALUES (11, 2, 25000, CAST(N'2024-06-12T00:00:00.000' AS DateTime))
INSERT [dbo].[PartnerProducts] ([PartnerID], [ProductID], [Quantity], [Date]) VALUES (11, 3, 50000, CAST(N'2023-09-19T00:00:00.000' AS DateTime))
INSERT [dbo].[PartnerProducts] ([PartnerID], [ProductID], [Quantity], [Date]) VALUES (11, 4, 670000, CAST(N'2023-11-10T00:00:00.000' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Partners] ON 

INSERT [dbo].[Partners] ([PartnerID], [PartnerType], [CompanyName], [LegalAddress], [INN], [DirectorName], [Phone], [Email], [Rating]) VALUES (6, 1, N'База Строитель', N'652050, Кемеровская область, город Юрга, ул. Лесная, 15', N'2222455179', N'Иванова Александра Ивановна', N'493 123 45 67', N'aleksandraivanova@ml.ru', 7)
INSERT [dbo].[Partners] ([PartnerID], [PartnerType], [CompanyName], [LegalAddress], [INN], [DirectorName], [Phone], [Email], [Rating]) VALUES (8, 2, N'Паркет 29', N'164500, Архангельская область, город Северодвинск, ул. Строителей, 18', N'3333888520', N'Петров Василий Петрович', N'987 123 56 78', N'vppetrov@vl.ru', 7)
INSERT [dbo].[Partners] ([PartnerID], [PartnerType], [CompanyName], [LegalAddress], [INN], [DirectorName], [Phone], [Email], [Rating]) VALUES (9, 3, N'Стройсервис', N'188910, Ленинградская область, город Приморск, ул. Парковая, 21', N'4440391035', N'Соловьев Андрей Николаевич', N'812 223 32 00', N'ansolovev@st.ru', 7)
INSERT [dbo].[Partners] ([PartnerID], [PartnerType], [CompanyName], [LegalAddress], [INN], [DirectorName], [Phone], [Email], [Rating]) VALUES (10, 4, N'Ремонт и отделка', N'143960, Московская область, город Реутов, ул. Свободы, 51', N'1111520857', N'Воробьева Екатерина Валерьевна', N'444 222 33 11', N'ekaterina.vorobeva@ml.ru', 5)
INSERT [dbo].[Partners] ([PartnerID], [PartnerType], [CompanyName], [LegalAddress], [INN], [DirectorName], [Phone], [Email], [Rating]) VALUES (11, 1, N'МонтажПро
', N'309500, Белгородская область, город Старый Оскол, ул. Рабочая, 122
', N'5552431140
', N'Степанов Степан Сергеевич
', N'912 888 33 33
', N'stepanov@stepan.ru
', 10)
INSERT [dbo].[Partners] ([PartnerID], [PartnerType], [CompanyName], [LegalAddress], [INN], [DirectorName], [Phone], [Email], [Rating]) VALUES (12, 1, N'ffff', N'fffff', N'856865865', N'dbfbf', N'7457554547', N'dgfdfdgddfg', 22)
SET IDENTITY_INSERT [dbo].[Partners] OFF
GO
SET IDENTITY_INSERT [dbo].[PartnersType] ON 

INSERT [dbo].[PartnersType] ([PartnersTypeID], [Name]) VALUES (1, N'ЗАО')
INSERT [dbo].[PartnersType] ([PartnersTypeID], [Name]) VALUES (2, N'ООО')
INSERT [dbo].[PartnersType] ([PartnersTypeID], [Name]) VALUES (3, N'ПАО')
INSERT [dbo].[PartnersType] ([PartnersTypeID], [Name]) VALUES (4, N'ОАО')
SET IDENTITY_INSERT [dbo].[PartnersType] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([ProductID], [Article], [ProductType], [ProductName], [MinPrice], [Description]) VALUES (1, N'8758385', 3, N'Паркетная доска Ясень темный однополосная 14 мм', CAST(4456.90 AS Decimal(10, 2)), NULL)
INSERT [dbo].[Products] ([ProductID], [Article], [ProductType], [ProductName], [MinPrice], [Description]) VALUES (2, N'8858958', 3, N'Инженерная доска Дуб Французская елка однополосная 12 мм', CAST(7330.99 AS Decimal(10, 2)), NULL)
INSERT [dbo].[Products] ([ProductID], [Article], [ProductType], [ProductName], [MinPrice], [Description]) VALUES (3, N'7750282', 1, N'Ламинат Дуб дымчато-белый 33 класс 12 мм', CAST(1799.33 AS Decimal(10, 2)), NULL)
INSERT [dbo].[Products] ([ProductID], [Article], [ProductType], [ProductName], [MinPrice], [Description]) VALUES (4, N'7028748', 1, N'Ламинат Дуб серый 32 класс 8 мм с фаской', CAST(3890.41 AS Decimal(10, 2)), NULL)
INSERT [dbo].[Products] ([ProductID], [Article], [ProductType], [ProductName], [MinPrice], [Description]) VALUES (5, N'5012543', 4, N'Пробковое напольное клеевое покрытие 32 класс 4 мм', CAST(5450.59 AS Decimal(10, 2)), NULL)
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductsType] ON 

INSERT [dbo].[ProductsType] ([ProductsTypeID], [Name], [Ratio]) VALUES (1, N'Ламинат', CAST(2.35 AS Decimal(3, 2)))
INSERT [dbo].[ProductsType] ([ProductsTypeID], [Name], [Ratio]) VALUES (2, N'Массивная доска', CAST(5.15 AS Decimal(3, 2)))
INSERT [dbo].[ProductsType] ([ProductsTypeID], [Name], [Ratio]) VALUES (3, N'Паркетная доска', CAST(4.34 AS Decimal(3, 2)))
INSERT [dbo].[ProductsType] ([ProductsTypeID], [Name], [Ratio]) VALUES (4, N'Пробковое покрытие', CAST(1.50 AS Decimal(3, 2)))
SET IDENTITY_INSERT [dbo].[ProductsType] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Partners__C490CCF55914CB43]    Script Date: 18.12.2024 22:19:51 ******/
ALTER TABLE [dbo].[Partners] ADD  CONSTRAINT [UQ__Partners__C490CCF55914CB43] UNIQUE NONCLUSTERED 
(
	[INN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[PartnerProducts] ADD  DEFAULT (getdate()) FOR [Date]
GO
ALTER TABLE [dbo].[PartnerProducts]  WITH CHECK ADD  CONSTRAINT [FK__PartnerPr__Partn__6754599E] FOREIGN KEY([PartnerID])
REFERENCES [dbo].[Partners] ([PartnerID])
GO
ALTER TABLE [dbo].[PartnerProducts] CHECK CONSTRAINT [FK__PartnerPr__Partn__6754599E]
GO
ALTER TABLE [dbo].[PartnerProducts]  WITH CHECK ADD FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[PartnerProducts]  WITH CHECK ADD FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[Partners]  WITH CHECK ADD  CONSTRAINT [FK__Partners__Partne__693CA210] FOREIGN KEY([PartnerType])
REFERENCES [dbo].[PartnersType] ([PartnersTypeID])
GO
ALTER TABLE [dbo].[Partners] CHECK CONSTRAINT [FK__Partners__Partne__693CA210]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK__Products__Produc__440B1D61] FOREIGN KEY([ProductType])
REFERENCES [dbo].[ProductsType] ([ProductsTypeID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK__Products__Produc__440B1D61]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD FOREIGN KEY([ProductType])
REFERENCES [dbo].[ProductsType] ([ProductsTypeID])
GO
USE [master]
GO
ALTER DATABASE [UP2] SET  READ_WRITE 
GO
