USE [restomgmt]
GO
/****** Object:  Table [dbo].[user_type]    Script Date: 24-06-2024 18:33:42 ******/
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
INSERT [dbo].[user_type] ([user_type_id], [user_type]) VALUES (N'admin', N'admin')
GO
INSERT [dbo].[user_type] ([user_type_id], [user_type]) VALUES (N'manager', N'manager')
GO
INSERT [dbo].[user_type] ([user_type_id], [user_type]) VALUES (N'owner', N'owner')
GO
INSERT [dbo].[user_type] ([user_type_id], [user_type]) VALUES (N'superadmin', N'superadmin')
GO
