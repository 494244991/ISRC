
USE [ISRCDB]
GO
/****** Object:  StoredProcedure [dbo].[proc_delete_Menu]    Script Date: 2016/9/30 16:01:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create procedure [dbo].[proc_delete_Menu]
(
	@id nvarchar(64),
	@result nvarchar(32) output
)
As
	declare @childNumber int;
	select @childNumber = COUNT(ID) from tb_SYS_Menu where ParentID = @id;
	delete from tb_SYS_Menu where ID = @id and @childNumber = 0;
	--@result == 0 : 删除成功
	--@result > 0 : 删除失败，其值为被引次数
	select @result = CAST(@childNumber as nvarchar(32));




GO
/****** Object:  StoredProcedure [dbo].[proc_delete_Role]    Script Date: 2016/9/30 16:01:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create procedure [dbo].[proc_delete_Role]
(
	@id nvarchar(64),
	@result nvarchar(32) output
)
As
	declare @childNumber int;
	select @childNumber = COUNT(ID) from tb_SYS_Role where ParentID = @id;
	delete from tb_SYS_Role where ID = @id and @childNumber = 0;
	--@result == 0 : 删除成功
	--@result > 0 : 删除失败，其值为被引次数
	select @result = CAST(@childNumber as nvarchar(32));




GO
/****** Object:  Table [dbo].[T_Dept]    Script Date: 2016/9/30 16:01:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_Dept](
	[ID] [varchar](64) NOT NULL,
	[Name] [varchar](64) NULL,
	[Quality] [char](1) NULL,
	[RegionID] [varchar](64) NULL,
	[Contactor] [varchar](64) NULL,
	[Tel] [varchar](64) NULL,
	[OderID] [varchar](64) NOT NULL,
 CONSTRAINT [PK_T_Dept] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_DeptIndex]    Script Date: 2016/9/30 16:01:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_DeptIndex](
	[DeptID] [varchar](64) NOT NULL,
	[IndexID] [varchar](64) NOT NULL,
 CONSTRAINT [PK_T_DeptIndex] PRIMARY KEY CLUSTERED 
(
	[DeptID] ASC,
	[IndexID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_Index]    Script Date: 2016/9/30 16:01:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_Index](
	[ID] [varchar](64) NOT NULL,
	[Name] [varchar](64) NULL,
	[Description] [varchar](64) NULL,
	[OderID] [varchar](64) NULL,
 CONSTRAINT [PK_T_Index] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_IndexCategory]    Script Date: 2016/9/30 16:01:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_IndexCategory](
	[ID] [varchar](64) NOT NULL,
	[Name] [varchar](64) NULL,
	[FatherID] [varchar](64) NULL,
 CONSTRAINT [PK_T_IndexCategory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_Region]    Script Date: 2016/9/30 16:01:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_Region](
	[ID] [varchar](64) NOT NULL,
	[Name] [varchar](64) NOT NULL,
 CONSTRAINT [PK_T_Region] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_Report]    Script Date: 2016/9/30 16:01:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_Report](
	[ID] [varchar](64) NOT NULL,
	[Cycle] [char](1) NULL,
	[Year] [char](4) NULL,
	[Month] [char](2) NULL,
	[Quarter] [char](1) NULL,
	[SemiYear] [char](6) NULL,
	[DeptID] [varchar](64) NULL,
	[UserID] [varchar](64) NULL,
	[FillDate] [varchar](64) NULL,
	[Description] [varchar](1024) NULL,
	[Status] [char](1) NULL,
 CONSTRAINT [PK_T_Report] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_SubReport]    Script Date: 2016/9/30 16:01:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_SubReport](
	[ID] [varchar](64) NOT NULL,
	[ReportID] [varchar](64) NULL,
	[IndexID] [varchar](64) NULL,
	[IndexValue] [varchar](64) NULL,
	[Description] [varchar](1024) NULL,
 CONSTRAINT [PK_T_SubFillInfo] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_SYS_Account]    Script Date: 2016/9/30 16:01:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_SYS_Account](
	[ID] [nvarchar](64) NOT NULL,
	[AccountName] [nvarchar](64) NOT NULL,
	[Password] [nvarchar](64) NOT NULL,
	[AccountType] [nvarchar](1) NULL,
	[RoleID] [nvarchar](64) NULL,
	[State] [nvarchar](1) NULL,
	[CreateID] [nvarchar](64) NULL,
	[CreateTime] [datetime] NULL,
	[UpdateID] [nvarchar](64) NULL,
	[UpdateTime] [datetime] NULL,
	[DeptID] [varchar](64) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_SYS_Menu]    Script Date: 2016/9/30 16:01:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_SYS_Menu](
	[ID] [nvarchar](64) NOT NULL,
	[MenuNO] [nvarchar](64) NULL,
	[MenuName] [nvarchar](64) NOT NULL,
	[ParentID] [nvarchar](64) NULL,
	[MenuUrl] [nvarchar](255) NULL,
	[ImageUrl] [nvarchar](255) NULL,
	[State] [nvarchar](1) NULL,
	[CreateID] [nvarchar](64) NULL,
	[CreateTime] [datetime] NULL,
	[UpdateID] [nvarchar](64) NULL,
	[UpdateTime] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tb_SYS_Role]    Script Date: 2016/9/30 16:01:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_SYS_Role](
	[ID] [nvarchar](64) NOT NULL,
	[RoleNO] [nvarchar](64) NULL,
	[RoleName] [nvarchar](64) NOT NULL,
	[ParentID] [nvarchar](64) NULL,
	[DefaultUrl] [nvarchar](255) NULL,
	[State] [nvarchar](1) NULL,
	[CreateID] [nvarchar](64) NULL,
	[CreateTime] [datetime] NULL,
	[UpdateID] [nvarchar](64) NULL,
	[UpdateTime] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tb_SYS_RoleMenu]    Script Date: 2016/9/30 16:01:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_SYS_RoleMenu](
	[ID] [nvarchar](64) NOT NULL,
	[MenuID] [nvarchar](64) NOT NULL,
	[RoleID] [nvarchar](64) NOT NULL,
	[AuthorizationDelete] [nvarchar](1) NULL,
	[AuthorizationUpdate] [nvarchar](1) NULL,
	[AuthorizationInsert] [nvarchar](1) NULL,
	[State] [nvarchar](1) NULL,
	[CreateID] [nvarchar](64) NULL,
	[CreateTime] [datetime] NULL,
	[UpdateID] [nvarchar](64) NULL,
	[UpdateTime] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tb_SYS_RoleXML]    Script Date: 2016/9/30 16:01:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_SYS_RoleXML](
	[ID] [nvarchar](64) NOT NULL,
	[RoleID] [nvarchar](64) NOT NULL,
	[XML] [nvarchar](max) NULL,
	[State] [nvarchar](1) NULL,
	[CreateID] [nvarchar](64) NULL,
	[CreateTime] [datetime] NULL,
	[UpdateID] [nvarchar](64) NULL,
	[UpdateTime] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  View [dbo].[vw_CX_ReportDetails]    Script Date: 2016/9/30 16:01:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_CX_ReportDetails]
AS
SELECT   dbo.T_Report.ID, dbo.T_Report.Cycle, dbo.T_Report.Year, dbo.T_Report.Month, dbo.T_Report.Quarter, 
                dbo.T_Report.SemiYear, dbo.T_Report.DeptID, dbo.T_Report.UserID, dbo.T_Report.FillDate, dbo.T_Report.Description, 
                dbo.T_Report.Status, dbo.T_SubReport.ID AS Expr1, dbo.T_SubReport.ReportID, dbo.T_SubReport.IndexID, 
                dbo.T_SubReport.IndexValue, dbo.T_SubReport.Description AS Expr2
FROM      dbo.T_Report INNER JOIN
                dbo.T_SubReport ON dbo.T_Report.ID = dbo.T_SubReport.ReportID


GO
/****** Object:  View [dbo].[vw_SYS_Account]    Script Date: 2016/9/30 16:01:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create view [dbo].[vw_SYS_Account]
As
	select t1.ID,t1.AccountName,t1.[Password],t1.AccountType,t1.RoleID,t2.RoleName,t1.[State],t2.DefaultUrl
	from tb_SYS_Account t1,tb_SYS_Role t2
	where t1.RoleID = t2.ID




GO
/****** Object:  View [dbo].[vw_SYS_Menu]    Script Date: 2016/9/30 16:01:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create view [dbo].[vw_SYS_Menu]
As
Select t1.*,t2.MenuNO as ParentNO,t2.MenuName as ParentName
From tb_SYS_Menu t1 left join tb_SYS_Menu t2
On t1.ParentID = t2.ID



GO
/****** Object:  View [dbo].[vw_SYS_Role]    Script Date: 2016/9/30 16:01:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create view [dbo].[vw_SYS_Role]
As
Select t1.*,t2.RoleName as ParentName
From tb_SYS_Role t1 left join tb_SYS_Role t2
On t1.ParentID = t2.ID



GO
/****** Object:  View [dbo].[vw_SYS_RoleMenu]    Script Date: 2016/9/30 16:01:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


Create view [dbo].[vw_SYS_RoleMenu]
As
	select t1.MenuID,t1.RoleID,t2.MenuNO,t2.MenuName,t2.MenuUrl,t3.MenuName as ParentName
	from tb_SYS_RoleMenu t1,tb_SYS_Menu t2,tb_SYS_Menu t3
	where t1.MenuID = t2.ID and t2.ParentID = t3.ID





GO
INSERT [dbo].[T_Dept] ([ID], [Name], [Quality], [RegionID], [Contactor], [Tel], [OderID]) VALUES (N'1', N'市财政局', N'0', N'', N'', N'', N'')
INSERT [dbo].[T_Region] ([ID], [Name]) VALUES (N'1', N'江岸区')
INSERT [dbo].[T_Region] ([ID], [Name]) VALUES (N'10', N'江夏区')
INSERT [dbo].[T_Region] ([ID], [Name]) VALUES (N'11', N'黄陂区')
INSERT [dbo].[T_Region] ([ID], [Name]) VALUES (N'12', N'新洲区')
INSERT [dbo].[T_Region] ([ID], [Name]) VALUES (N'13', N'汉南区')
INSERT [dbo].[T_Region] ([ID], [Name]) VALUES (N'2', N'江汉区')
INSERT [dbo].[T_Region] ([ID], [Name]) VALUES (N'3', N'硚口区')
INSERT [dbo].[T_Region] ([ID], [Name]) VALUES (N'4', N'汉阳区')
INSERT [dbo].[T_Region] ([ID], [Name]) VALUES (N'5', N'武昌区')
INSERT [dbo].[T_Region] ([ID], [Name]) VALUES (N'6', N'洪山区')
INSERT [dbo].[T_Region] ([ID], [Name]) VALUES (N'7', N'青山区')
INSERT [dbo].[T_Region] ([ID], [Name]) VALUES (N'8', N'东西湖区')
INSERT [dbo].[T_Region] ([ID], [Name]) VALUES (N'9', N'蔡甸区')
INSERT [dbo].[tb_SYS_Account] ([ID], [AccountName], [Password], [AccountType], [RoleID], [State], [CreateID], [CreateTime], [UpdateID], [UpdateTime], [DeptID]) VALUES (N'da3d7f96-8eb1-4baf-a289-449cbe75dfc1', N'Admin0001', N'12345', N'0', N'4a226132-38b5-42f1-8a57-7ca5793031b7', N'1', N'da3d7f96-8eb1-4baf-a289-449cbe75dfc1', CAST(0x0000A590011FCF6A AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tb_SYS_Menu] ([ID], [MenuNO], [MenuName], [ParentID], [MenuUrl], [ImageUrl], [State], [CreateID], [CreateTime], [UpdateID], [UpdateTime]) VALUES (N'0', N'0', N'根项', NULL, NULL, NULL, N'1', NULL, NULL, NULL, NULL)
INSERT [dbo].[tb_SYS_Menu] ([ID], [MenuNO], [MenuName], [ParentID], [MenuUrl], [ImageUrl], [State], [CreateID], [CreateTime], [UpdateID], [UpdateTime]) VALUES (N'29827910-652f-4dae-b460-5ab6d5c0e3ac', N'2', N'用户管理', N'2cee3e59-d4ad-44d0-b099-6641ff3d0d62', N'~/Sys/Account/List.aspx', NULL, N'1', N'da3d7f96-8eb1-4baf-a289-449cbe75dfc1', CAST(0x0000A59D01499590 AS DateTime), N'da3d7f96-8eb1-4baf-a289-449cbe75dfc1', CAST(0x0000A690017BEE4E AS DateTime))
INSERT [dbo].[tb_SYS_Menu] ([ID], [MenuNO], [MenuName], [ParentID], [MenuUrl], [ImageUrl], [State], [CreateID], [CreateTime], [UpdateID], [UpdateTime]) VALUES (N'2cee3e59-d4ad-44d0-b099-6641ff3d0d62', N'1', N'系统管理', N'0', N'', NULL, N'1', N'da3d7f96-8eb1-4baf-a289-449cbe75dfc1', CAST(0x0000A59D0146943B AS DateTime), N'da3d7f96-8eb1-4baf-a289-449cbe75dfc1', CAST(0x0000A5BC00D20356 AS DateTime))
INSERT [dbo].[tb_SYS_Menu] ([ID], [MenuNO], [MenuName], [ParentID], [MenuUrl], [ImageUrl], [State], [CreateID], [CreateTime], [UpdateID], [UpdateTime]) VALUES (N'3d8db3b3-c2b8-494f-907b-cf9919567488', N'1', N'基础数据管理', N'0', N'', NULL, N'1', N'da3d7f96-8eb1-4baf-a289-449cbe75dfc1', CAST(0x0000A59D0146CCB9 AS DateTime), N'da3d7f96-8eb1-4baf-a289-449cbe75dfc1', CAST(0x0000A5BC00D20CB0 AS DateTime))
INSERT [dbo].[tb_SYS_Menu] ([ID], [MenuNO], [MenuName], [ParentID], [MenuUrl], [ImageUrl], [State], [CreateID], [CreateTime], [UpdateID], [UpdateTime]) VALUES (N'9af9e226-f0e7-43f0-9073-77cda8e7964e', N'2', N'角色管理', N'2cee3e59-d4ad-44d0-b099-6641ff3d0d62', N'~/Web/Sys/Role/List.aspx', NULL, N'1', N'da3d7f96-8eb1-4baf-a289-449cbe75dfc1', CAST(0x0000A59D0149D54E AS DateTime), N'da3d7f96-8eb1-4baf-a289-449cbe75dfc1', CAST(0x0000A5BC00D22D4C AS DateTime))
INSERT [dbo].[tb_SYS_Menu] ([ID], [MenuNO], [MenuName], [ParentID], [MenuUrl], [ImageUrl], [State], [CreateID], [CreateTime], [UpdateID], [UpdateTime]) VALUES (N'df2c77ab-74c4-44ea-847d-3c8241d175c0', N'2', N'菜单管理', N'2cee3e59-d4ad-44d0-b099-6641ff3d0d62', N'~/Web/Sys/Menu/List.aspx', NULL, N'1', N'da3d7f96-8eb1-4baf-a289-449cbe75dfc1', CAST(0x0000A59D0149F32A AS DateTime), N'da3d7f96-8eb1-4baf-a289-449cbe75dfc1', CAST(0x0000A5BC00D2230C AS DateTime))
INSERT [dbo].[tb_SYS_Role] ([ID], [RoleNO], [RoleName], [ParentID], [DefaultUrl], [State], [CreateID], [CreateTime], [UpdateID], [UpdateTime]) VALUES (N'430b4e77-a49a-49d7-8809-fbcfaae724e3', N'001', N'初始角色', N'', N'default.aspx', N'1', N'da3d7f96-8eb1-4baf-a289-449cbe75dfc1', CAST(0x0000A690017AC1C6 AS DateTime), NULL, NULL)
INSERT [dbo].[tb_SYS_Role] ([ID], [RoleNO], [RoleName], [ParentID], [DefaultUrl], [State], [CreateID], [CreateTime], [UpdateID], [UpdateTime]) VALUES (N'4a226132-38b5-42f1-8a57-7ca5793031b7', N'002', N'查阅者', N'', N'default.aspx', N'1', NULL, NULL, N'da3d7f96-8eb1-4baf-a289-449cbe75dfc1', CAST(0x0000A690017AA022 AS DateTime))
INSERT [dbo].[tb_SYS_RoleMenu] ([ID], [MenuID], [RoleID], [AuthorizationDelete], [AuthorizationUpdate], [AuthorizationInsert], [State], [CreateID], [CreateTime], [UpdateID], [UpdateTime]) VALUES (N'102ee161-84f0-4937-94b3-35e9d5d41159', N'7b7e308b-7c5c-4e60-8dac-b30a0e422438', N'4a226132-38b5-42f1-8a57-7ca5793031b7', N'1', N'1', N'1', NULL, N'da3d7f96-8eb1-4baf-a289-449cbe75dfc1', CAST(0x0000A61201769D80 AS DateTime), N'da3d7f96-8eb1-4baf-a289-449cbe75dfc1', CAST(0x0000A62100BA46D8 AS DateTime))
INSERT [dbo].[tb_SYS_RoleMenu] ([ID], [MenuID], [RoleID], [AuthorizationDelete], [AuthorizationUpdate], [AuthorizationInsert], [State], [CreateID], [CreateTime], [UpdateID], [UpdateTime]) VALUES (N'173bea0b-4d8a-4976-9bbd-c9f232020621', N'5f4ab113-9816-49a5-9652-64c5c41546f6', N'4a226132-38b5-42f1-8a57-7ca5793031b7', N'1', N'1', N'1', NULL, N'da3d7f96-8eb1-4baf-a289-449cbe75dfc1', CAST(0x0000A61201769D81 AS DateTime), N'da3d7f96-8eb1-4baf-a289-449cbe75dfc1', CAST(0x0000A62100BA46D9 AS DateTime))
INSERT [dbo].[tb_SYS_RoleMenu] ([ID], [MenuID], [RoleID], [AuthorizationDelete], [AuthorizationUpdate], [AuthorizationInsert], [State], [CreateID], [CreateTime], [UpdateID], [UpdateTime]) VALUES (N'2bf319d2-3e0b-4532-b00c-cfd2032f8834', N'4394fbcd-429e-4819-8644-653540abccb1', N'4a226132-38b5-42f1-8a57-7ca5793031b7', N'1', N'1', N'1', NULL, N'da3d7f96-8eb1-4baf-a289-449cbe75dfc1', CAST(0x0000A62100BA46D9 AS DateTime), N'da3d7f96-8eb1-4baf-a289-449cbe75dfc1', CAST(0x0000A62100BA46D9 AS DateTime))
INSERT [dbo].[tb_SYS_RoleMenu] ([ID], [MenuID], [RoleID], [AuthorizationDelete], [AuthorizationUpdate], [AuthorizationInsert], [State], [CreateID], [CreateTime], [UpdateID], [UpdateTime]) VALUES (N'2fd7494a-3e6e-49bb-8f2c-2196c56fd095', N'8bf54f9b-529d-456b-9e0f-e667a8cb5b0e', N'4a226132-38b5-42f1-8a57-7ca5793031b7', N'1', N'1', N'1', NULL, N'da3d7f96-8eb1-4baf-a289-449cbe75dfc1', CAST(0x0000A61201769D82 AS DateTime), N'da3d7f96-8eb1-4baf-a289-449cbe75dfc1', CAST(0x0000A6130180157B AS DateTime))
INSERT [dbo].[tb_SYS_RoleMenu] ([ID], [MenuID], [RoleID], [AuthorizationDelete], [AuthorizationUpdate], [AuthorizationInsert], [State], [CreateID], [CreateTime], [UpdateID], [UpdateTime]) VALUES (N'32f4e798-2908-47b3-8b73-6d929a69a9ea', N'244e9855-e105-4b7f-8c38-cb3d29ef0867', N'4a226132-38b5-42f1-8a57-7ca5793031b7', N'1', N'1', N'1', NULL, N'da3d7f96-8eb1-4baf-a289-449cbe75dfc1', CAST(0x0000A613017FA4AA AS DateTime), N'da3d7f96-8eb1-4baf-a289-449cbe75dfc1', CAST(0x0000A62100BA46D9 AS DateTime))
INSERT [dbo].[tb_SYS_RoleMenu] ([ID], [MenuID], [RoleID], [AuthorizationDelete], [AuthorizationUpdate], [AuthorizationInsert], [State], [CreateID], [CreateTime], [UpdateID], [UpdateTime]) VALUES (N'74f61f80-c741-4961-b229-72ef6af16921', N'0fde0d2f-1d3a-4061-ad65-94c749d124fe', N'4a226132-38b5-42f1-8a57-7ca5793031b7', N'1', N'1', N'1', NULL, N'da3d7f96-8eb1-4baf-a289-449cbe75dfc1', CAST(0x0000A5C00107438B AS DateTime), N'da3d7f96-8eb1-4baf-a289-449cbe75dfc1', CAST(0x0000A62100BA46DB AS DateTime))
INSERT [dbo].[tb_SYS_RoleMenu] ([ID], [MenuID], [RoleID], [AuthorizationDelete], [AuthorizationUpdate], [AuthorizationInsert], [State], [CreateID], [CreateTime], [UpdateID], [UpdateTime]) VALUES (N'7992feb3-0ad5-4a60-a9ca-5c9ce3e1d56d', N'b5d95627-4821-4e8d-8642-89cdbee1f0a3', N'430b4e77-a49a-49d7-8809-fbcfaae724e3', N'1', N'1', N'1', NULL, N'da3d7f96-8eb1-4baf-a289-449cbe75dfc1', CAST(0x0000A690017C29FC AS DateTime), NULL, NULL)
INSERT [dbo].[tb_SYS_RoleMenu] ([ID], [MenuID], [RoleID], [AuthorizationDelete], [AuthorizationUpdate], [AuthorizationInsert], [State], [CreateID], [CreateTime], [UpdateID], [UpdateTime]) VALUES (N'7a46fea8-38f9-46c9-95ca-70d9e271828e', N'29827910-652f-4dae-b460-5ab6d5c0e3ac', N'4a226132-38b5-42f1-8a57-7ca5793031b7', N'0', N'0', N'0', NULL, N'da3d7f96-8eb1-4baf-a289-449cbe75dfc1', CAST(0x0000A5BC016560EC AS DateTime), N'da3d7f96-8eb1-4baf-a289-449cbe75dfc1', CAST(0x0000A690017AFEFD AS DateTime))
INSERT [dbo].[tb_SYS_RoleMenu] ([ID], [MenuID], [RoleID], [AuthorizationDelete], [AuthorizationUpdate], [AuthorizationInsert], [State], [CreateID], [CreateTime], [UpdateID], [UpdateTime]) VALUES (N'b0b4072b-007c-45f0-8c0d-d1437d6d94a5', N'a6b0dabd-a2f8-474f-a484-6139bc319393', N'4a226132-38b5-42f1-8a57-7ca5793031b7', N'1', N'1', N'1', NULL, N'da3d7f96-8eb1-4baf-a289-449cbe75dfc1', CAST(0x0000A5C001074390 AS DateTime), N'da3d7f96-8eb1-4baf-a289-449cbe75dfc1', CAST(0x0000A62100BA46DD AS DateTime))
INSERT [dbo].[tb_SYS_RoleMenu] ([ID], [MenuID], [RoleID], [AuthorizationDelete], [AuthorizationUpdate], [AuthorizationInsert], [State], [CreateID], [CreateTime], [UpdateID], [UpdateTime]) VALUES (N'bf6373a1-d1b1-46dc-8dd6-a65ed12a0d24', N'8791235a-fa22-4d33-8a81-b2a9d5808696', N'4a226132-38b5-42f1-8a57-7ca5793031b7', N'1', N'1', N'1', NULL, N'da3d7f96-8eb1-4baf-a289-449cbe75dfc1', CAST(0x0000A5C001074390 AS DateTime), N'da3d7f96-8eb1-4baf-a289-449cbe75dfc1', CAST(0x0000A62100BA46DE AS DateTime))
INSERT [dbo].[tb_SYS_RoleMenu] ([ID], [MenuID], [RoleID], [AuthorizationDelete], [AuthorizationUpdate], [AuthorizationInsert], [State], [CreateID], [CreateTime], [UpdateID], [UpdateTime]) VALUES (N'c80feaf6-c8cd-4e86-940f-5c05df7385f2', N'4561e3c5-0b7a-4588-9b8d-6a540543d3fc', N'4a226132-38b5-42f1-8a57-7ca5793031b7', N'1', N'1', N'1', NULL, N'da3d7f96-8eb1-4baf-a289-449cbe75dfc1', CAST(0x0000A613017FA4AA AS DateTime), N'da3d7f96-8eb1-4baf-a289-449cbe75dfc1', CAST(0x0000A62100BA46D9 AS DateTime))
INSERT [dbo].[tb_SYS_RoleMenu] ([ID], [MenuID], [RoleID], [AuthorizationDelete], [AuthorizationUpdate], [AuthorizationInsert], [State], [CreateID], [CreateTime], [UpdateID], [UpdateTime]) VALUES (N'edb9d020-95f2-4d52-a8e4-ada903af6341', N'b23fa634-f3b5-468c-b576-cc2450c79518', N'4a226132-38b5-42f1-8a57-7ca5793031b7', N'1', N'1', N'1', NULL, N'da3d7f96-8eb1-4baf-a289-449cbe75dfc1', CAST(0x0000A61201769D82 AS DateTime), N'da3d7f96-8eb1-4baf-a289-449cbe75dfc1', CAST(0x0000A62100BA46DD AS DateTime))
INSERT [dbo].[tb_SYS_RoleMenu] ([ID], [MenuID], [RoleID], [AuthorizationDelete], [AuthorizationUpdate], [AuthorizationInsert], [State], [CreateID], [CreateTime], [UpdateID], [UpdateTime]) VALUES (N'fbc69e7b-46b0-4913-bf97-6070cfa0bb4e', N'c183a75d-b5f6-438c-9ec6-39027c9d4def', N'4a226132-38b5-42f1-8a57-7ca5793031b7', N'1', N'1', N'1', NULL, N'da3d7f96-8eb1-4baf-a289-449cbe75dfc1', CAST(0x0000A5C00107438B AS DateTime), N'da3d7f96-8eb1-4baf-a289-449cbe75dfc1', CAST(0x0000A62100BA46DB AS DateTime))
INSERT [dbo].[tb_SYS_RoleXML] ([ID], [RoleID], [XML], [State], [CreateID], [CreateTime], [UpdateID], [UpdateTime]) VALUES (N'9f77b1a9-54b3-4fe7-b561-2d7898758da0', N'430b4e77-a49a-49d7-8809-fbcfaae724e3', N'<?xml version="1.0"?>
<Tree>
  <TreeNode Text="asdfasd" NavigateUrl="asdfasdf" />
</Tree>', N'0', N'da3d7f96-8eb1-4baf-a289-449cbe75dfc1', CAST(0x0000A690017C2A06 AS DateTime), NULL, NULL)
INSERT [dbo].[tb_SYS_RoleXML] ([ID], [RoleID], [XML], [State], [CreateID], [CreateTime], [UpdateID], [UpdateTime]) VALUES (N'd6d44a13-f34d-4b56-8980-74f4e537b5e2', N'4a226132-38b5-42f1-8a57-7ca5793031b7', N'<?xml version="1.0"?>
<Tree>
  <TreeNode Text="系统管理" SingleClickExpand="true">
    <TreeNode Text="用户管理" NavigateUrl="~/Sys/Account/List.aspx" />
    <TreeNode Text="菜单管理" NavigateUrl="~/Sys/Menu/List.aspx" />
    <TreeNode Text="角色管理" NavigateUrl="~/Sys/Role/List.aspx" />
  </TreeNode>
  <TreeNode Text="基础数据管理" SingleClickExpand="true">
  </TreeNode>
</Tree>', N'0', N'da3d7f96-8eb1-4baf-a289-449cbe75dfc1', CAST(0x0000A5BC01656110 AS DateTime), N'da3d7f96-8eb1-4baf-a289-449cbe75dfc1', CAST(0x0000A690017AFF0B AS DateTime))
ALTER TABLE [dbo].[T_Dept]  WITH CHECK ADD  CONSTRAINT [FK_T_Dept_T_Dept] FOREIGN KEY([ID])
REFERENCES [dbo].[T_Dept] ([ID])
GO
ALTER TABLE [dbo].[T_Dept] CHECK CONSTRAINT [FK_T_Dept_T_Dept]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[35] 4[15] 2[31] 3) )"
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
         Begin Table = "T_Report"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 145
               Right = 193
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "T_SubReport"
            Begin Extent = 
               Top = 6
               Left = 231
               Bottom = 145
               Right = 386
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
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 2295
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_CX_ReportDetails'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_CX_ReportDetails'
GO
USE [master]
GO
ALTER DATABASE [ISRCDB] SET  READ_WRITE 
GO
