USE [restomgmt]
GO

/****** Object:  Table [dbo].[users]    Script Date: 24-06-2024 18:28:10 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[users] ADD  DEFAULT (getdate()) FOR [createdAt]
GO

ALTER TABLE [dbo].[users] ADD  DEFAULT (getdate()) FOR [updatedAt]
GO


