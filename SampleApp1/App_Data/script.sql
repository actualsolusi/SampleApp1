USE [SampleShopDb]
GO
/****** Object:  Table [dbo].[Authors]    Script Date: 11/2/2016 7:12:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Authors](
	[AuthorID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
 CONSTRAINT [PK_Authors] PRIMARY KEY CLUSTERED 
(
	[AuthorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Books]    Script Date: 11/2/2016 7:12:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Books](
	[BookID] [int] IDENTITY(1,1) NOT NULL,
	[AuthorID] [int] NOT NULL,
	[CategoryID] [int] NOT NULL,
	[Title] [nvarchar](50) NULL,
	[PublicationDate] [date] NOT NULL CONSTRAINT [DF_Books_PublicationDate]  DEFAULT (getdate()),
	[ISBN] [nvarchar](50) NULL,
	[CoverImage] [nvarchar](50) NULL,
	[Price] [money] NOT NULL CONSTRAINT [DF_Books_Price]  DEFAULT ((0)),
	[Description] [nvarchar](max) NULL,
	[Publisher] [nvarchar](50) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Categories]    Script Date: 11/2/2016 7:12:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](50) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 11/2/2016 7:12:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NULL,
	[BookID] [int] NULL,
	[Quantity] [int] NULL,
	[Price] [money] NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Orders]    Script Date: 11/2/2016 7:12:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerName] [nvarchar](50) NOT NULL,
	[OrderDate] [datetime] NOT NULL CONSTRAINT [DF_Orders_OrderDate]  DEFAULT (getdate()),
	[ShipDate] [datetime] NOT NULL CONSTRAINT [DF_Orders_ShipDate]  DEFAULT (getdate())
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Reviews]    Script Date: 11/2/2016 7:12:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reviews](
	[ReviewID] [int] IDENTITY(1,1) NOT NULL,
	[BookID] [int] NOT NULL,
	[CustomerName] [nvarchar](50) NULL,
	[CustomerEmail] [nvarchar](50) NULL,
	[Rating] [int] NOT NULL,
	[Comments] [nvarchar](3850) NULL,
 CONSTRAINT [PK_Reviews] PRIMARY KEY CLUSTERED 
(
	[ReviewID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ShoppingCart]    Script Date: 11/2/2016 7:12:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShoppingCart](
	[RecordID] [int] IDENTITY(1,1) NOT NULL,
	[CartID] [nvarchar](50) NULL,
	[Quantity] [int] NOT NULL CONSTRAINT [DF_ShoppingCart_Quantity]  DEFAULT ((1)),
	[BookID] [int] NOT NULL,
	[DateCreated] [datetime] NOT NULL CONSTRAINT [DF_ShoppingCart_DateCreated]  DEFAULT (getdate())
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[VewOrderDetails]    Script Date: 11/2/2016 7:12:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VewOrderDetails]
AS
SELECT     dbo.OrderDetails.Quantity, dbo.OrderDetails.Price, dbo.Authors.FirstName, dbo.Authors.LastName, dbo.Books.Title, dbo.Books.PublicationDate, dbo.Books.ISBN, 
                      dbo.Books.CoverImage, dbo.Books.Description, dbo.OrderDetails.OrderID, dbo.OrderDetails.Id
FROM         dbo.Books INNER JOIN
                      dbo.OrderDetails ON dbo.Books.BookID = dbo.OrderDetails.BookID INNER JOIN
                      dbo.Authors ON dbo.Books.AuthorID = dbo.Authors.AuthorID


GO
/****** Object:  View [dbo].[ViewCart]    Script Date: 11/2/2016 7:12:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ViewCart]
AS
SELECT     dbo.Books.BookID, dbo.Books.Title, dbo.Books.ISBN, dbo.Books.Price, dbo.ShoppingCart.CartID, dbo.ShoppingCart.Quantity
FROM         dbo.Books INNER JOIN
                      dbo.ShoppingCart ON dbo.Books.BookID = dbo.ShoppingCart.BookID


GO
SET IDENTITY_INSERT [dbo].[Authors] ON 

INSERT [dbo].[Authors] ([AuthorID], [FirstName], [LastName], [Email]) VALUES (1, N'Erick', N'Kurniawan', N'erick@actualtraining.com')
INSERT [dbo].[Authors] ([AuthorID], [FirstName], [LastName], [Email]) VALUES (2, N'Stephen', N'Walter', N'stephen@gmail.com')
INSERT [dbo].[Authors] ([AuthorID], [FirstName], [LastName], [Email]) VALUES (3, N'Scott', N'Guthrie', N'scott@microsoft.com')
SET IDENTITY_INSERT [dbo].[Authors] OFF
SET IDENTITY_INSERT [dbo].[Books] ON 

INSERT [dbo].[Books] ([BookID], [AuthorID], [CategoryID], [Title], [PublicationDate], [ISBN], [CoverImage], [Price], [Description], [Publisher]) VALUES (1, 1, 23, N'ASP.NET 3.5', CAST(N'2009-12-02' AS Date), N'111-222-333', N'asp1.jpg', 50000.0000, N'Mengulas Penggunaan ASP.NET Web Form untuk membuat aplikasi web yang interaktif', N'Andi Publisher')
INSERT [dbo].[Books] ([BookID], [AuthorID], [CategoryID], [Title], [PublicationDate], [ISBN], [CoverImage], [Price], [Description], [Publisher]) VALUES (2, 1, 21, N'Visual Basic 2010', CAST(N'2011-12-02' AS Date), N'222-333-444', N'vb1.jpg', 55000.0000, N'Pemrograman VB 2010 dari dasar sampai tingkat advance', N'Andi Publisher')
INSERT [dbo].[Books] ([BookID], [AuthorID], [CategoryID], [Title], [PublicationDate], [ISBN], [CoverImage], [Price], [Description], [Publisher]) VALUES (3, 1, 23, N'ASP.NET 4.0 Guide', CAST(N'2011-12-02' AS Date), N'444-555-777', N'asp2.jpg', 60000.0000, N'Pemrograman ASP.NET 4.0 dengan membahas banyak fitur terbaru', N'Andi Publisher')
INSERT [dbo].[Books] ([BookID], [AuthorID], [CategoryID], [Title], [PublicationDate], [ISBN], [CoverImage], [Price], [Description], [Publisher]) VALUES (4, 1, 25, N'Nokia Qt SDK', CAST(N'2011-09-09' AS Date), N'777-888-444', N'qt1.jpg', 90000.0000, N'Pemrograman Aplikasi Mobile dengan Qt SDK dengan target platform Symbian dan MeeGo', N'Andi Publisher')
INSERT [dbo].[Books] ([BookID], [AuthorID], [CategoryID], [Title], [PublicationDate], [ISBN], [CoverImage], [Price], [Description], [Publisher]) VALUES (8, 1, 23, N'Beginning ASP.NET 4.6', CAST(N'2016-03-23' AS Date), N'99999-888888', N'begasp.jpg', 55000.0000, N'Buku ini bagus bagi pemrogram web pemula yang ingin belajar asp.net', N'Apress')
SET IDENTITY_INSERT [dbo].[Books] OFF
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([CategoryID], [CategoryName]) VALUES (21, N'VB.NET')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName]) VALUES (22, N'CSharp')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName]) VALUES (23, N'ASP.NET')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName]) VALUES (24, N'VS LightSwitch')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName]) VALUES (25, N'Qt SDK')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName]) VALUES (26, N'Xamarin Android')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName]) VALUES (27, N'Xamarin IOS')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName]) VALUES (28, N'Xamarin Form')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName]) VALUES (29, N'Android Studio')
SET IDENTITY_INSERT [dbo].[Categories] OFF
SET IDENTITY_INSERT [dbo].[OrderDetails] ON 

INSERT [dbo].[OrderDetails] ([Id], [OrderID], [BookID], [Quantity], [Price]) VALUES (70, 132, 4, 1, 90000.0000)
INSERT [dbo].[OrderDetails] ([Id], [OrderID], [BookID], [Quantity], [Price]) VALUES (71, 132, 2, 1, 55000.0000)
INSERT [dbo].[OrderDetails] ([Id], [OrderID], [BookID], [Quantity], [Price]) VALUES (72, 133, 1, 1, 50000.0000)
INSERT [dbo].[OrderDetails] ([Id], [OrderID], [BookID], [Quantity], [Price]) VALUES (73, 133, 3, 1, 60000.0000)
INSERT [dbo].[OrderDetails] ([Id], [OrderID], [BookID], [Quantity], [Price]) VALUES (74, 134, 8, 1, 55000.0000)
INSERT [dbo].[OrderDetails] ([Id], [OrderID], [BookID], [Quantity], [Price]) VALUES (75, 135, 8, 1, 55000.0000)
INSERT [dbo].[OrderDetails] ([Id], [OrderID], [BookID], [Quantity], [Price]) VALUES (76, 136, 3, 1, 60000.0000)
INSERT [dbo].[OrderDetails] ([Id], [OrderID], [BookID], [Quantity], [Price]) VALUES (77, 137, 8, 1, 55000.0000)
INSERT [dbo].[OrderDetails] ([Id], [OrderID], [BookID], [Quantity], [Price]) VALUES (78, 138, 8, 1, 55000.0000)
INSERT [dbo].[OrderDetails] ([Id], [OrderID], [BookID], [Quantity], [Price]) VALUES (79, 139, 8, 1, 55000.0000)
INSERT [dbo].[OrderDetails] ([Id], [OrderID], [BookID], [Quantity], [Price]) VALUES (80, 139, 4, 1, 90000.0000)
INSERT [dbo].[OrderDetails] ([Id], [OrderID], [BookID], [Quantity], [Price]) VALUES (81, 140, 8, 1, 55000.0000)
INSERT [dbo].[OrderDetails] ([Id], [OrderID], [BookID], [Quantity], [Price]) VALUES (82, 140, 4, 1, 90000.0000)
SET IDENTITY_INSERT [dbo].[OrderDetails] OFF
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([OrderID], [CustomerName], [OrderDate], [ShipDate]) VALUES (133, N'erick@actual-training.com', CAST(N'2016-03-22 11:23:43.147' AS DateTime), CAST(N'2016-03-24 11:23:43.147' AS DateTime))
INSERT [dbo].[Orders] ([OrderID], [CustomerName], [OrderDate], [ShipDate]) VALUES (134, N'erick@actual-training.com', CAST(N'2016-03-22 11:26:03.017' AS DateTime), CAST(N'2016-03-24 11:26:03.017' AS DateTime))
INSERT [dbo].[Orders] ([OrderID], [CustomerName], [OrderDate], [ShipDate]) VALUES (135, N'erick@actual-training.com', CAST(N'2016-03-22 11:47:20.597' AS DateTime), CAST(N'2016-03-24 11:47:20.597' AS DateTime))
INSERT [dbo].[Orders] ([OrderID], [CustomerName], [OrderDate], [ShipDate]) VALUES (136, N'erick@actual-training.com', CAST(N'2016-03-22 11:49:26.240' AS DateTime), CAST(N'2016-03-24 11:49:26.243' AS DateTime))
INSERT [dbo].[Orders] ([OrderID], [CustomerName], [OrderDate], [ShipDate]) VALUES (132, N'erick@actual-training.com', CAST(N'2016-03-19 23:52:03.357' AS DateTime), CAST(N'2016-03-21 23:52:03.357' AS DateTime))
INSERT [dbo].[Orders] ([OrderID], [CustomerName], [OrderDate], [ShipDate]) VALUES (137, N'erick@actual-training.com', CAST(N'2016-03-22 11:51:58.733' AS DateTime), CAST(N'2016-03-24 11:51:58.733' AS DateTime))
INSERT [dbo].[Orders] ([OrderID], [CustomerName], [OrderDate], [ShipDate]) VALUES (138, N'erick@actual-training.com', CAST(N'2016-03-22 12:00:45.003' AS DateTime), CAST(N'2016-03-24 12:00:45.003' AS DateTime))
INSERT [dbo].[Orders] ([OrderID], [CustomerName], [OrderDate], [ShipDate]) VALUES (139, N'erick@actual-training.com', CAST(N'2016-03-24 16:15:06.663' AS DateTime), CAST(N'2016-03-26 16:15:06.663' AS DateTime))
INSERT [dbo].[Orders] ([OrderID], [CustomerName], [OrderDate], [ShipDate]) VALUES (140, N'erick@actual-training.com', CAST(N'2016-03-25 11:38:22.697' AS DateTime), CAST(N'2016-03-27 11:38:22.697' AS DateTime))
SET IDENTITY_INSERT [dbo].[Orders] OFF
SET IDENTITY_INSERT [dbo].[Reviews] ON 

INSERT [dbo].[Reviews] ([ReviewID], [BookID], [CustomerName], [CustomerEmail], [Rating], [Comments]) VALUES (32, 2, N'Erick', N'erick@gmail.com', 4, N'Buagus Mantabs Bukunya bro !&lt;br /&gt;')
INSERT [dbo].[Reviews] ([ReviewID], [BookID], [CustomerName], [CustomerEmail], [Rating], [Comments]) VALUES (33, 1, N'erick@actual-training.com', N'erick@actual-training.com', 4, N'Bagus banget dan sangat membantu <font color="&#x23;ff0099"><b>TOP !</b></font>')
INSERT [dbo].[Reviews] ([ReviewID], [BookID], [CustomerName], [CustomerEmail], [Rating], [Comments]) VALUES (35, 1, N'erick@actual-training.com', N'erick@actual-training.com', 5, N'studi kasus <font color="&#x23;ff33cc" style="background&#x2D;color&#x3A;&#x20;&#x23;ccccff&#x3B;"><u>sangat</u> </font>membantu pemahaman materi.')
SET IDENTITY_INSERT [dbo].[Reviews] OFF
SET IDENTITY_INSERT [dbo].[ShoppingCart] ON 

INSERT [dbo].[ShoppingCart] ([RecordID], [CartID], [Quantity], [BookID], [DateCreated]) VALUES (255, N'erick@actual-training.com', 1, 1, CAST(N'2016-03-25 23:19:56.487' AS DateTime))
INSERT [dbo].[ShoppingCart] ([RecordID], [CartID], [Quantity], [BookID], [DateCreated]) VALUES (241, N'633e0650-296f-414b-9252-094773396acd', 1, 3, CAST(N'2016-03-19 22:49:49.857' AS DateTime))
SET IDENTITY_INSERT [dbo].[ShoppingCart] OFF
/****** Object:  Index [PK_Products]    Script Date: 11/2/2016 7:12:08 PM ******/
ALTER TABLE [dbo].[Books] ADD  CONSTRAINT [PK_Products] PRIMARY KEY NONCLUSTERED 
(
	[BookID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK_Categories]    Script Date: 11/2/2016 7:12:08 PM ******/
ALTER TABLE [dbo].[Categories] ADD  CONSTRAINT [PK_Categories] PRIMARY KEY NONCLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK_Orders]    Script Date: 11/2/2016 7:12:08 PM ******/
ALTER TABLE [dbo].[Orders] ADD  CONSTRAINT [PK_Orders] PRIMARY KEY NONCLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK_ShoppingCart]    Script Date: 11/2/2016 7:12:08 PM ******/
ALTER TABLE [dbo].[ShoppingCart] ADD  CONSTRAINT [PK_ShoppingCart] PRIMARY KEY NONCLUSTERED 
(
	[RecordID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Books]  WITH CHECK ADD  CONSTRAINT [FK_Books_Authors] FOREIGN KEY([AuthorID])
REFERENCES [dbo].[Authors] ([AuthorID])
GO
ALTER TABLE [dbo].[Books] CHECK CONSTRAINT [FK_Books_Authors]
GO
ALTER TABLE [dbo].[Books]  WITH CHECK ADD  CONSTRAINT [FK_Books_Categories] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Categories] ([CategoryID])
GO
ALTER TABLE [dbo].[Books] CHECK CONSTRAINT [FK_Books_Categories]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Books] FOREIGN KEY([BookID])
REFERENCES [dbo].[Books] ([BookID])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Books]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Orders] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([OrderID])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Orders]
GO
ALTER TABLE [dbo].[Reviews]  WITH CHECK ADD  CONSTRAINT [FK_Reviews_Books] FOREIGN KEY([BookID])
REFERENCES [dbo].[Books] ([BookID])
GO
ALTER TABLE [dbo].[Reviews] CHECK CONSTRAINT [FK_Reviews_Books]
GO
ALTER TABLE [dbo].[ShoppingCart]  WITH CHECK ADD  CONSTRAINT [FK_ShoppingCart_Books] FOREIGN KEY([BookID])
REFERENCES [dbo].[Books] ([BookID])
GO
ALTER TABLE [dbo].[ShoppingCart] CHECK CONSTRAINT [FK_ShoppingCart_Books]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[48] 4[14] 2[21] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Books"
            Begin Extent = 
               Top = 11
               Left = 220
               Bottom = 211
               Right = 383
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "OrderDetails"
            Begin Extent = 
               Top = 24
               Left = 30
               Bottom = 181
               Right = 190
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Authors"
            Begin Extent = 
               Top = 20
               Left = 397
               Bottom = 144
               Right = 557
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VewOrderDetails'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VewOrderDetails'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[44] 4[18] 2[21] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Books"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 207
               Right = 201
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ShoppingCart"
            Begin Extent = 
               Top = 6
               Left = 239
               Bottom = 141
               Right = 399
            End
            DisplayFlags = 280
            TopColumn = 1
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 5535
         Alias = 900
         Table = 2790
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ViewCart'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ViewCart'
GO
