USE [master]
GO
/****** Object:  Database [Food]    Script Date: 12/25/2023 9:43:09 PM ******/
CREATE DATABASE [Food]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Food', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Food.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Food_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Food_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Food] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Food].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Food] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Food] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Food] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Food] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Food] SET ARITHABORT OFF 
GO
ALTER DATABASE [Food] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Food] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Food] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Food] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Food] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Food] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Food] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Food] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Food] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Food] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Food] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Food] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Food] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Food] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Food] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Food] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Food] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Food] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Food] SET  MULTI_USER 
GO
ALTER DATABASE [Food] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Food] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Food] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Food] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Food] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Food] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Food] SET QUERY_STORE = ON
GO
ALTER DATABASE [Food] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Food]
GO
/****** Object:  Table [dbo].[carts]    Script Date: 12/25/2023 9:43:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[carts](
	[cartId] [int] IDENTITY(1,1) NOT NULL,
	[userId] [int] NULL,
	[isClosed] [bit] NULL,
	[date] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[categories]    Script Date: 12/25/2023 9:43:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[categories](
	[name] [nvarchar](50) NULL,
	[id] [int] NOT NULL,
 CONSTRAINT [PK_categories] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[items]    Script Date: 12/25/2023 9:43:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[items](
	[itemsId] [int] IDENTITY(1,1) NOT NULL,
	[quantity] [nvarchar](50) NULL,
	[total] [nvarchar](50) NULL,
	[productId] [int] NULL,
	[cartId] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OVDIM]    Script Date: 12/25/2023 9:43:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OVDIM](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[firstName] [nvarchar](50) NULL,
	[lastName] [nvarchar](50) NULL,
	[status] [bit] NULL,
 CONSTRAINT [PK_OVDIM] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[productFood]    Script Date: 12/25/2023 9:43:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[productFood](
	[productId] [int] NOT NULL,
	[productname] [nvarchar](50) NULL,
	[amount] [nvarchar](50) NULL,
	[price] [decimal](18, 0) NULL,
	[imageName] [nvarchar](max) NULL,
	[note] [nvarchar](max) NULL,
	[status] [bit] NULL,
	[categoryId] [int] NULL,
 CONSTRAINT [PK_productFood] PRIMARY KEY CLUSTERED 
(
	[productId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PurchaseDetailsByUser]    Script Date: 12/25/2023 9:43:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PurchaseDetailsByUser](
	[amount] [nvarchar](50) NULL,
	[date] [nvarchar](50) NULL,
	[productname] [nvarchar](50) NULL,
	[quantity] [nvarchar](50) NULL,
	[total] [nvarchar](50) NULL,
	[userId] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 12/25/2023 9:43:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[firstName] [nvarchar](50) NULL,
	[lastName] [nvarchar](50) NULL,
	[status] [bit] NULL,
	[role] [nvarchar](50) NULL,
	[userId] [int] NOT NULL,
	[id] [int] NULL,
 CONSTRAINT [PK_users] PRIMARY KEY CLUSTERED 
(
	[userId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[AddCart]    Script Date: 12/25/2023 9:43:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Create the stored procedure
CREATE PROCEDURE [dbo].[AddCart]
@userId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

		INSERT INTO
	carts(userId, isClosed)
	VALUES 
	(@userId, 'false')
END
GO
/****** Object:  StoredProcedure [dbo].[CountProducts]    Script Date: 12/25/2023 9:43:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Create the stored procedure
CREATE PROCEDURE [dbo].[CountProducts]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT COUNT(*) AS ObjectCount
    FROM [dbo].[productFood]
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteItemfromShoppingCart]    Script Date: 12/25/2023 9:43:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Create the stored procedure
CREATE PROCEDURE [dbo].[DeleteItemfromShoppingCart]
@productId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	 
DELETE FROM [dbo].[items] WHERE productId = @productId
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteOne]    Script Date: 12/25/2023 9:43:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Create the stored procedure
CREATE PROCEDURE [dbo].[DeleteOne]
@productId int

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

DELETE FROM [dbo].[productFood] WHERE productId=@productId
END
GO
/****** Object:  StoredProcedure [dbo].[GetAllCatogories]    Script Date: 12/25/2023 9:43:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Create the stored procedure
CREATE PROCEDURE [dbo].[GetAllCatogories]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT * FROM [dbo].[categories]
END
GO
/****** Object:  StoredProcedure [dbo].[getAllItemsByCart]    Script Date: 12/25/2023 9:43:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Create the stored procedure
CREATE PROCEDURE [dbo].[getAllItemsByCart]
@cartId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

SELECT [dbo].[carts].*, [dbo].[items].*, [dbo].[productFood].*
FROM [dbo].[carts]
INNER JOIN [dbo].[items] ON [dbo].[carts].cartId = [dbo].[items].cartId
INNER JOIN [dbo].[productFood] ON [dbo].[items].productId = [dbo].[productFood].productId
WHERE [dbo].[carts].cartId = @cartId;



END
GO
/****** Object:  StoredProcedure [dbo].[GetAllProducts]    Script Date: 12/25/2023 9:43:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetAllProducts] 
	-- Add the parameters for the stored procedure here
AS
BEGIN

	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	 select * from productFood
END
GO
/****** Object:  StoredProcedure [dbo].[GetAllWorkers]    Script Date: 12/25/2023 9:43:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Create the stored procedure
CREATE PROCEDURE [dbo].[GetAllWorkers]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT * FROM [dbo].[OVDIM]
END
GO
/****** Object:  StoredProcedure [dbo].[getCartByUser]    Script Date: 12/25/2023 9:43:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Create the stored procedure
CREATE PROCEDURE [dbo].[getCartByUser]
@userId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT cartId,userId,isClosed,date FROM [dbo].[carts] where userId= @userId;
END
GO
/****** Object:  StoredProcedure [dbo].[GetOneCart]    Script Date: 12/25/2023 9:43:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Create the stored procedure
CREATE PROCEDURE [dbo].[GetOneCart]
@userId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT * FROM [dbo].[carts] where userId= @userId;
END
GO
/****** Object:  StoredProcedure [dbo].[GetOneitem]    Script Date: 12/25/2023 9:43:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Create the stored procedure
CREATE PROCEDURE [dbo].[GetOneitem]
@productId int,
@cartId int


AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT * FROM [dbo].[items] where productId= @productId and cartId= @cartId;
END
GO
/****** Object:  StoredProcedure [dbo].[GetOneProduct]    Script Date: 12/25/2023 9:43:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Create the stored procedure
CREATE PROCEDURE [dbo].[GetOneProduct]
	@productId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT productId,productname,amount,price,note,status,concat(productId,'.jpg') as imageName FROM [dbo].[productFood] where productId= @productId;
END
GO
/****** Object:  StoredProcedure [dbo].[GetOneUser]    Script Date: 12/25/2023 9:43:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Create the stored procedure
CREATE PROCEDURE [dbo].[GetOneUser]
@userId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT firstName,lastName,status,role,userId FROM [dbo].[users] where userId= @userId;
END
GO
/****** Object:  StoredProcedure [dbo].[InsertOne]    Script Date: 12/25/2023 9:43:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Create the stored procedure
CREATE PROCEDURE [dbo].[InsertOne]
	@categoryId int,
	@productname nvarchar(50),
	@productId int,
	@amount nvarchar(50),
	@price decimal(18, 0),
	@imageName nvarchar(MAX),
	@note nvarchar(MAX),
	@status bit
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	INSERT INTO
	productFood(productname, amount, price, imageName, note, status,productId,categoryId)
	VALUES 
	(@productname, @amount, @price, @imageName, @note, @status, @productId, @categoryId)

END
GO
/****** Object:  StoredProcedure [dbo].[InsertOneitem]    Script Date: 12/25/2023 9:43:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Create the stored procedure
CREATE PROCEDURE [dbo].[InsertOneitem]
	@quantity nvarchar(50),
	@total nvarchar(50),
	@productId int,
	@cartId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	INSERT INTO [dbo].[items](quantity,total,productId,cartId)
	VALUES 
	(@quantity, @total, @productId, @cartId)
END


GO
/****** Object:  StoredProcedure [dbo].[InsertPurchaseDetailsByUser]    Script Date: 12/25/2023 9:43:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Create the stored procedure
CREATE PROCEDURE [dbo].[InsertPurchaseDetailsByUser]
	@amount nvarchar(50),
	@date nvarchar(50),
	@productname nvarchar(50),
	@quantity nvarchar(50),
	@total nvarchar(50),
	@userId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SET NOCOUNT ON;
	INSERT INTO [dbo].[PurchaseDetailsByUser](amount,date,productname,quantity,total,userId)
	VALUES 
	(@amount, @date, @productname, @quantity,@total,@userId)END
GO
/****** Object:  StoredProcedure [dbo].[prc_get_oved]    Script Date: 12/25/2023 9:43:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================

--exec prc_get_oved 2,'א'


CREATE PROCEDURE [dbo].[prc_get_oved]
	-- Add the parameters for the stored procedure here
	@id int

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    select * from ovdim where id=@id --and name like '%' + @name + '%'

END
GO
/****** Object:  StoredProcedure [dbo].[UpDateItem]    Script Date: 12/25/2023 9:43:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Create the stored procedure
CREATE PROCEDURE [dbo].[UpDateItem]
	@quantity nvarchar(50),
	@total nvarchar(50),
	@productId int,
	@cartId int

	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	UPDATE [dbo].[items]
	set quantity=@quantity ,
		total=@total
	where productId=@productId
	AND cartId = @cartId;
END

GO
/****** Object:  StoredProcedure [dbo].[UpDateProduct]    Script Date: 12/25/2023 9:43:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Create the stored procedure
CREATE PROCEDURE [dbo].[UpDateProduct]
	@productname nvarchar(50),
	@amount nvarchar(50),
	@price decimal(18, 0),
	@imageName nvarchar(MAX),
	@note nvarchar(MAX),
	@status bit,
	@productId int

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	UPDATE [dbo].[productFood] 
	set productname=@productname ,
	    price=@price,amount=@amount,
		imageName=@imageName,
		note=@note,
		status=@status 
	where productId=@productId;

END
GO
USE [master]
GO
ALTER DATABASE [Food] SET  READ_WRITE 
GO
