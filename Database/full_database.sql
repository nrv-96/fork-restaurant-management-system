USE [master]
GO
/****** Object:  Database [restomgmt]    Script Date: 26-06-2024 19:32:21 ******/
CREATE DATABASE [restomgmt]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'restomgmt', FILENAME = N'/var/opt/mssql/data/restomgmt.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'restomgmt_log', FILENAME = N'/var/opt/mssql/data/restomgmt_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [restomgmt] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [restomgmt].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [restomgmt] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [restomgmt] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [restomgmt] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [restomgmt] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [restomgmt] SET ARITHABORT OFF 
GO
ALTER DATABASE [restomgmt] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [restomgmt] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [restomgmt] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [restomgmt] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [restomgmt] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [restomgmt] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [restomgmt] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [restomgmt] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [restomgmt] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [restomgmt] SET  DISABLE_BROKER 
GO
ALTER DATABASE [restomgmt] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [restomgmt] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [restomgmt] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [restomgmt] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [restomgmt] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [restomgmt] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [restomgmt] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [restomgmt] SET RECOVERY FULL 
GO
ALTER DATABASE [restomgmt] SET  MULTI_USER 
GO
ALTER DATABASE [restomgmt] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [restomgmt] SET DB_CHAINING OFF 
GO
ALTER DATABASE [restomgmt] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [restomgmt] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [restomgmt] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [restomgmt] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'restomgmt', N'ON'
GO
ALTER DATABASE [restomgmt] SET QUERY_STORE = ON
GO
ALTER DATABASE [restomgmt] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [restomgmt]
GO
/****** Object:  Table [dbo].[user_type]    Script Date: 26-06-2024 19:32:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_type](
	[user_type_id] [char](10) NOT NULL,
	[user_type] [char](10) NOT NULL,
 CONSTRAINT [PK_user_type] PRIMARY KEY CLUSTERED 
(
	[user_type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 26-06-2024 19:32:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[userid] [nvarchar](10) NOT NULL,
	[username] [nvarchar](10) NOT NULL,
	[email] [nvarchar](100) NOT NULL,
	[passwordhash] [nvarchar](255) NOT NULL,
	[user_type_id] [char](10) NOT NULL,
	[createdAt] [datetime2](7) NULL,
	[updatedAt] [datetime2](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[userid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[user_type] ([user_type_id], [user_type]) VALUES (N'admin     ', N'admin     ')
GO
INSERT [dbo].[user_type] ([user_type_id], [user_type]) VALUES (N'manager   ', N'manager   ')
GO
INSERT [dbo].[user_type] ([user_type_id], [user_type]) VALUES (N'owner     ', N'owner     ')
GO
INSERT [dbo].[users] ([userid], [username], [email], [passwordhash], [user_type_id], [createdAt], [updatedAt]) VALUES (N'1', N'nishit', N'nishit@gmail.com', N'nishit123', N'owner     ', CAST(N'2024-06-24T19:26:30.2533333' AS DateTime2), CAST(N'2024-06-24T19:26:30.2533333' AS DateTime2))
GO
INSERT [dbo].[users] ([userid], [username], [email], [passwordhash], [user_type_id], [createdAt], [updatedAt]) VALUES (N'10', N'bhargav', N'bhargav@gmail.com', N'Bhargav@123', N'admin     ', CAST(N'2024-06-25T19:34:30.5833333' AS DateTime2), CAST(N'2024-06-25T19:34:30.5833333' AS DateTime2))
GO
INSERT [dbo].[users] ([userid], [username], [email], [passwordhash], [user_type_id], [createdAt], [updatedAt]) VALUES (N'113', N'bhawvik', N'bhavwwik@gmail.com', N'bhawvik123', N'manager   ', CAST(N'2024-06-26T18:54:11.2533333' AS DateTime2), CAST(N'2024-06-26T18:54:11.2533333' AS DateTime2))
GO
INSERT [dbo].[users] ([userid], [username], [email], [passwordhash], [user_type_id], [createdAt], [updatedAt]) VALUES (N'12', N'nishwrit2', N'nishi3tw2sds@gmail.com', N'nishit2', N'owner     ', CAST(N'2024-06-24T19:52:23.6233333' AS DateTime2), CAST(N'2024-06-24T19:52:23.6266667' AS DateTime2))
GO
INSERT [dbo].[users] ([userid], [username], [email], [passwordhash], [user_type_id], [createdAt], [updatedAt]) VALUES (N'13', N'bhavik', N'bhavik@gmail.com', N'bhavik123', N'manager   ', CAST(N'2024-06-25T16:49:25.1766667' AS DateTime2), CAST(N'2024-06-25T16:49:25.1766667' AS DateTime2))
GO
INSERT [dbo].[users] ([userid], [username], [email], [passwordhash], [user_type_id], [createdAt], [updatedAt]) VALUES (N'131', N'bhavik1', N'bhavik1@gmail.com', N'bhavik1123', N'manager   ', CAST(N'2024-06-25T17:55:02.3233333' AS DateTime2), CAST(N'2024-06-25T17:55:02.3233333' AS DateTime2))
GO
INSERT [dbo].[users] ([userid], [username], [email], [passwordhash], [user_type_id], [createdAt], [updatedAt]) VALUES (N'2', N'nishit2', N'nishit2sds@gmail.com', N'nishit2', N'owner     ', CAST(N'2024-06-24T14:07:00.2933333' AS DateTime2), CAST(N'2024-06-24T14:07:00.2933333' AS DateTime2))
GO
INSERT [dbo].[users] ([userid], [username], [email], [passwordhash], [user_type_id], [createdAt], [updatedAt]) VALUES (N'22', N'nishrqit2', N'nishi3t2swds@gmail.com', N'nishit2', N'owner     ', CAST(N'2024-06-24T19:48:41.1366667' AS DateTime2), CAST(N'2024-06-24T19:48:41.1366667' AS DateTime2))
GO
INSERT [dbo].[users] ([userid], [username], [email], [passwordhash], [user_type_id], [createdAt], [updatedAt]) VALUES (N'3', N'nirav', N'nirav@gmail.com', N'nirav', N'manager   ', CAST(N'2024-06-24T21:45:56.4400000' AS DateTime2), CAST(N'2024-06-24T21:45:56.4433333' AS DateTime2))
GO
INSERT [dbo].[users] ([userid], [username], [email], [passwordhash], [user_type_id], [createdAt], [updatedAt]) VALUES (N'33', N'werwe', N'bhavik44@gmail.com', N'111111', N'admin     ', CAST(N'2024-06-25T18:47:30.9166667' AS DateTime2), CAST(N'2024-06-25T18:47:30.9166667' AS DateTime2))
GO
INSERT [dbo].[users] ([userid], [username], [email], [passwordhash], [user_type_id], [createdAt], [updatedAt]) VALUES (N'4', N'nirav1', N'nirav1@gmail.com', N'nirav1', N'manager   ', CAST(N'2024-06-24T22:33:04.3900000' AS DateTime2), CAST(N'2024-06-24T22:33:04.3900000' AS DateTime2))
GO
INSERT [dbo].[users] ([userid], [username], [email], [passwordhash], [user_type_id], [createdAt], [updatedAt]) VALUES (N'5', N'nirav2', N'nirav2@gmail.com', N'nirav2', N'owner     ', CAST(N'2024-06-25T11:04:03.8400000' AS DateTime2), CAST(N'2024-06-25T11:04:03.8400000' AS DateTime2))
GO
INSERT [dbo].[users] ([userid], [username], [email], [passwordhash], [user_type_id], [createdAt], [updatedAt]) VALUES (N'55', N'werwe', N'nirav11@gmail.com', N'Nirav@123', N'owner     ', CAST(N'2024-06-25T20:57:52.6166667' AS DateTime2), CAST(N'2024-06-25T20:57:52.6166667' AS DateTime2))
GO
INSERT [dbo].[users] ([userid], [username], [email], [passwordhash], [user_type_id], [createdAt], [updatedAt]) VALUES (N'6', N'nirav3', N'nirav3@gmail.com', N'nirav2', N'owner     ', CAST(N'2024-06-25T12:38:21.9033333' AS DateTime2), CAST(N'2024-06-25T12:38:21.9033333' AS DateTime2))
GO
INSERT [dbo].[users] ([userid], [username], [email], [passwordhash], [user_type_id], [createdAt], [updatedAt]) VALUES (N'90', N'90', N'9o@gmail.com', N'90Nishit2', N'owner     ', CAST(N'2024-06-25T18:53:12.1566667' AS DateTime2), CAST(N'2024-06-25T18:53:12.1600000' AS DateTime2))
GO
INSERT [dbo].[users] ([userid], [username], [email], [passwordhash], [user_type_id], [createdAt], [updatedAt]) VALUES (N'asdf', N'aerit', N'arti@gmail.com', N'Arti@123', N'owner     ', CAST(N'2024-06-26T18:57:00.5300000' AS DateTime2), CAST(N'2024-06-26T18:57:00.5300000' AS DateTime2))
GO
INSERT [dbo].[users] ([userid], [username], [email], [passwordhash], [user_type_id], [createdAt], [updatedAt]) VALUES (N'nishit', N'nishit', N'nishijt@gmail.com', N'PasswordHash', N'admin     ', CAST(N'2024-06-24T14:03:48.0033333' AS DateTime2), CAST(N'2024-06-24T14:03:48.0033333' AS DateTime2))
GO
INSERT [dbo].[users] ([userid], [username], [email], [passwordhash], [user_type_id], [createdAt], [updatedAt]) VALUES (N'ws2', N'nishrit2', N'nishi3t2sds@gmail.com', N'nishit2', N'owner     ', CAST(N'2024-06-24T19:40:05.6766667' AS DateTime2), CAST(N'2024-06-24T19:40:05.6766667' AS DateTime2))
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__users__AB6E616469F2A08E]    Script Date: 26-06-2024 19:32:22 ******/
ALTER TABLE [dbo].[users] ADD UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[users] ADD  DEFAULT (getdate()) FOR [createdAt]
GO
ALTER TABLE [dbo].[users] ADD  DEFAULT (getdate()) FOR [updatedAt]
GO
ALTER TABLE [dbo].[users]  WITH CHECK ADD  CONSTRAINT [FK_user_type_id] FOREIGN KEY([user_type_id])
REFERENCES [dbo].[user_type] ([user_type_id])
GO
ALTER TABLE [dbo].[users] CHECK CONSTRAINT [FK_user_type_id]
GO
USE [master]
GO
ALTER DATABASE [restomgmt] SET  READ_WRITE 
GO
