--CREATE TABLE [dbo].[Student]
--(
--	[ID] [int] IDENTITY(1,1) NOT NULL,
--	[FirstName] [nvarchar](50) NOT NULL,
--	[LastName] [nvarchar](50) NOT NULL,
--	[DateOfBirth] [date] NULL,
--	[EnrolledDate] [date] NUlL,
--	[Gender] [nchar](1) NULL,
--	[NationalIdNuber] [nvarchar](30) NOT NULL,
--	[StudentCArdNumber] [nvarchar](30) NOT NULL

--	CONSTRAINT [PK Student] PRIMARY KEY CLUSTERED
--	(
--		[ID] ASC
--	)
--)
--GO


--CREATE TABLE [dbo].[Teacher]
--(
--	[ID] int IDENTITY(1,1) NOT NULL,
--	[FirstName] [nvarchar](50) NOT NULL,
--	[LastName] [nvarchar](50) NOT NULL,
--	[DateOfBirth] [date] NULL,
--	[AcademicRank] [decimal](1,1) NULL,
--	[HireDate] [date] NOT NULL

--	CONSTRAINT [PK Teacher] PRIMARY KEY CLUSTERED
--	(
--		[ID] ASC
--	)
--)


--CREATE TABLE [dbo].[GradeDetails]
--(
--	[ID] [int] IDENTITY(1,1) NOT NULL,
--	[GradeId] [nvarchar](10) NOT NULL,
--	[AchivmentTypeId] [nvarchar](15) NULL,
--	[AchievmentPoints] [decimal](1,1)NOT NULL,
--	[AchivmentMaxPoints] [int] NOT NULL,
--	[AchievmentDate] [date] NOT NULL

--	CONSTRAINT [PK GradeDetails] PRIMARY KEY CLUSTERED 
--	(
--		[ID] ASC
--	)
--)
--GO


--CREATE TABLE [dbo].[Course]
--(
--	[ID] [int] IDENTITY(1,1) NOT NULL,
--	[Name] [nvarchar](30) NOT NULL,
--	[Credit] [int] NOT NULL,
--	[AcademicYear] [varchar](4) NOT NULL,
--	[Semester] [nvarchar](10) NOT NULL,

--	CONSTRAINT [PK Course] PRIMARY KEY CLUSTERED
--	(
--		[ID] ASC
--	)
--)
--GO


--CREATE TABLE [dbo].[Grade]
--(
--	[ID] [int] IDENTITY(1,1) NOT NULL,
--	[StudentId] [nvarchar](15) NOT NULL,
--	[CourseId] [nvarchar](15) NOT NULL,
--	[TeacherId] [nvarchar](15) NOT NULL,
--	[Grade] [tinyint] NOT NULL,
--	[Comment] [nchar] NULL,
--	[CreatedDate] [date] NOT NULL

--	CONSTRAINT [PK Grade] PRIMARY KEY CLUSTERED
--	(
--		[ID] ASC
--	)
--)
--GO


--CREATE TABLE [dbo].[AchievmentType]
--(
--	[ID] [int] IDENTITY(1,1) NOT NULL,
--	[Name] [nvarchar](15) NOT NULL,
--	[Description] [nvarchar](100) NULL,
--	[ParticipationRate] [decimal](4,2) NOT NULL

--	CONSTRAINT [PK AchievmentType] PRIMARY KEY CLUSTERED
--	(
--		[ID] ASC
--	)
--)
--GO