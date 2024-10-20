USE [master]
GO
/****** Object:  Database [GenAI]    Script Date: 10/4/2024 9:58:05 AM ******/
CREATE DATABASE [GenAI]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'GenAI', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\GenAI.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'GenAI_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\GenAI_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [GenAI] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [GenAI].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [GenAI] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [GenAI] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [GenAI] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [GenAI] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [GenAI] SET ARITHABORT OFF 
GO
ALTER DATABASE [GenAI] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [GenAI] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [GenAI] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [GenAI] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [GenAI] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [GenAI] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [GenAI] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [GenAI] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [GenAI] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [GenAI] SET  DISABLE_BROKER 
GO
ALTER DATABASE [GenAI] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [GenAI] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [GenAI] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [GenAI] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [GenAI] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [GenAI] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [GenAI] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [GenAI] SET RECOVERY FULL 
GO
ALTER DATABASE [GenAI] SET  MULTI_USER 
GO
ALTER DATABASE [GenAI] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [GenAI] SET DB_CHAINING OFF 
GO
ALTER DATABASE [GenAI] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [GenAI] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [GenAI] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [GenAI] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'GenAI', N'ON'
GO
ALTER DATABASE [GenAI] SET QUERY_STORE = OFF
GO
USE [GenAI]
GO
/****** Object:  Schema [geo]    Script Date: 10/4/2024 9:58:06 AM ******/
CREATE SCHEMA [geo]
GO
/****** Object:  Schema [ied]    Script Date: 10/4/2024 9:58:06 AM ******/
CREATE SCHEMA [ied]
GO
/****** Object:  Table [dbo].[Diet]    Script Date: 10/4/2024 9:58:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Diet](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[dietName] [varchar](200) NOT NULL,
	[IsActive] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EnergyLevel]    Script Date: 10/4/2024 9:58:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EnergyLevel](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[energyLevelName] [varchar](200) NOT NULL,
	[IsActive] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HarmonalProfile]    Script Date: 10/4/2024 9:58:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HarmonalProfile](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[profileName] [varchar](200) NOT NULL,
	[IsActive] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MedicalCondition]    Script Date: 10/4/2024 9:58:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MedicalCondition](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MedicalConditionName] [varchar](200) NOT NULL,
	[IsActive] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Test]    Script Date: 10/4/2024 9:58:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Test](
	[Id] [int] NOT NULL,
	[FirstName] [varchar](64) NULL,
	[LastName] [varchar](64) NULL,
	[Email] [varchar](128) NULL,
	[Address1] [varchar](128) NULL,
	[Address2] [varchar](128) NULL,
	[City] [varchar](64) NULL,
	[State] [varchar](64) NULL,
	[StateId] [int] NULL,
	[PostalCode] [varchar](64) NULL,
	[CountryId] [int] NULL,
	[Phone] [varchar](64) NULL,
	[PhoneTypeId] [int] NULL,
	[BirthDate] [datetime] NULL,
	[GenderId] [int] NULL,
	[HariId] [int] NULL,
	[HairName] [varchar](64) NULL,
	[EyesId] [int] NULL,
	[EyesName] [varchar](64) NULL,
	[Height] [int] NULL,
	[HeightName] [varchar](64) NULL,
	[Weight] [int] NULL,
	[EducationId] [int] NULL,
	[EducationName] [varchar](64) NULL,
	[BloodTypeId] [int] NULL,
	[BloodTypeName] [varchar](64) NULL,
	[Status] [varchar](512) NULL,
	[PictureName1] [varchar](128) NULL,
	[PictureName2] [varchar](128) NULL,
	[Personality] [nvarchar](max) NULL,
	[MedicalHistory] [nvarchar](max) NULL,
	[Occupation] [varchar](512) NULL,
	[TitleId] [int] NULL,
	[RaceId] [int] NULL,
	[RaceName] [varchar](64) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [geo].[Countries]    Script Date: 10/4/2024 9:58:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [geo].[Countries](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ISO] [varchar](2) NOT NULL,
	[ISO3] [varchar](3) NULL,
	[NumberCode] [int] NULL,
	[Title] [varchar](128) NOT NULL,
	[TitleUpper] [varchar](128) NOT NULL,
	[Enabled] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [geo].[States]    Script Date: 10/4/2024 9:58:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [geo].[States](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CountryId] [int] NOT NULL,
	[StateCode] [nvarchar](3) NULL,
	[Abbreviation] [nvarchar](2) NULL,
	[Name] [nvarchar](15) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [ied].[Address]    Script Date: 10/4/2024 9:58:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ied].[Address](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Address1] [varchar](128) NULL,
	[Address2] [varchar](128) NULL,
	[City] [varchar](64) NULL,
	[State] [varchar](64) NULL,
	[StateId] [int] NULL,
	[PostalCode] [varchar](64) NULL,
	[Country] [varchar](128) NULL,
	[CountryId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [ied].[ApplicationTypes]    Script Date: 10/4/2024 9:58:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ied].[ApplicationTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](32) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [ied].[Attributes]    Script Date: 10/4/2024 9:58:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ied].[Attributes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AttributeTypeId] [int] NULL,
	[Name] [varchar](64) NULL,
	[IsDeleted] [tinyint] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [ied].[AttributeTypes]    Script Date: 10/4/2024 9:58:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ied].[AttributeTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](64) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [ied].[ConsultationRegistration]    Script Date: 10/4/2024 9:58:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ied].[ConsultationRegistration](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[Phone] [varchar](15) NULL,
	[Interest] [varchar](50) NULL,
	[Comment] [varchar](250) NULL,
	[CreatedOn] [datetime] NULL,
	[IsDeleted] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [ied].[Person]    Script Date: 10/4/2024 9:58:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ied].[Person](
	[Id] [int] IDENTITY(1000,1) NOT NULL,
	[Created] [datetime] NULL,
	[UserId] [uniqueidentifier] NULL,
	[ApplicationType] [int] NULL,
	[FirstName] [varchar](64) NULL,
	[LastName] [varchar](64) NULL,
	[Email] [varchar](128) NULL,
	[Address1] [varchar](128) NULL,
	[Address2] [varchar](128) NULL,
	[City] [varchar](64) NULL,
	[State] [varchar](64) NULL,
	[StateId] [int] NULL,
	[PostalCode] [varchar](64) NULL,
	[CountryId] [int] NULL,
	[Phone] [varchar](64) NULL,
	[PhoneTypeId] [int] NULL,
	[BirthDate] [datetime] NULL,
	[GenderId] [int] NULL,
	[HariId] [int] NULL,
	[EyesId] [int] NULL,
	[Height] [int] NULL,
	[Weight] [int] NULL,
	[EducationId] [int] NULL,
	[FatherEthnicityId] [int] NULL,
	[FathersBirthPlace] [int] NULL,
	[MotherEthnicityId] [int] NULL,
	[MothersBirthPlace] [int] NULL,
	[MaritalStatusId] [int] NULL,
	[DietId] [int] NULL,
	[BodyId] [int] NULL,
	[ReligionId] [int] NULL,
	[SmokingId] [int] NULL,
	[DrinkerId] [int] NULL,
	[BloodTypeId] [int] NULL,
	[Hidden] [bit] NULL,
	[Deleted] [bit] NULL,
	[ForeignId] [varchar](32) NULL,
	[HistoryId] [int] NULL,
	[ComplexionId] [int] NULL,
	[Status] [varchar](512) NULL,
	[PictureName1] [varchar](128) NULL,
	[PictureName2] [varchar](128) NULL,
	[Personality] [nvarchar](max) NULL,
	[MedicalHistory] [nvarchar](max) NULL,
	[Occupation] [varchar](512) NULL,
	[TitleId] [int] NULL,
	[RaceId] [int] NULL,
	[Priority] [int] NULL,
	[RequestFromWeb] [varchar](50) NULL,
	[admin_notes] [nvarchar](max) NULL,
	[admin_comments] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [ied].[SearchCriteria]    Script Date: 10/4/2024 9:58:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ied].[SearchCriteria](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[SearchCriteriaName] [varchar](100) NULL,
	[Weightage] [int] NULL,
	[Threshold] [varchar](10) NULL,
	[TypeCheck] [varchar](100) NULL,
	[Priorites] [tinyint] NULL,
	[AdultCheck] [bit] NULL,
	[IsActive] [bit] NULL
) ON [PRIMARY]
GO
ALTER TABLE [geo].[Countries] ADD  DEFAULT ((0)) FOR [Enabled]
GO
ALTER TABLE [ied].[Attributes] ADD  CONSTRAINT [DF_Attributes_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [ied].[ConsultationRegistration] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [ied].[Person] ADD  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [ied].[Person] ADD  DEFAULT ((0)) FOR [Hidden]
GO
ALTER TABLE [ied].[Person] ADD  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [ied].[Person] ADD  CONSTRAINT [DF_Person_Priority]  DEFAULT ((0)) FOR [Priority]
GO
ALTER TABLE [ied].[SearchCriteria] ADD  CONSTRAINT [DF__SearchCri__IsAct__619B8048]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [geo].[States]  WITH CHECK ADD FOREIGN KEY([CountryId])
REFERENCES [geo].[Countries] ([Id])
GO
ALTER TABLE [ied].[Attributes]  WITH CHECK ADD FOREIGN KEY([AttributeTypeId])
REFERENCES [ied].[AttributeTypes] ([Id])
GO
ALTER TABLE [ied].[Person]  WITH CHECK ADD FOREIGN KEY([ApplicationType])
REFERENCES [ied].[ApplicationTypes] ([Id])
GO
ALTER TABLE [ied].[Person]  WITH CHECK ADD FOREIGN KEY([BloodTypeId])
REFERENCES [ied].[Attributes] ([Id])
GO
ALTER TABLE [ied].[Person]  WITH CHECK ADD FOREIGN KEY([BodyId])
REFERENCES [ied].[Attributes] ([Id])
GO
ALTER TABLE [ied].[Person]  WITH CHECK ADD FOREIGN KEY([ComplexionId])
REFERENCES [ied].[Attributes] ([Id])
GO
ALTER TABLE [ied].[Person]  WITH CHECK ADD FOREIGN KEY([DietId])
REFERENCES [ied].[Attributes] ([Id])
GO
ALTER TABLE [ied].[Person]  WITH CHECK ADD FOREIGN KEY([DrinkerId])
REFERENCES [ied].[Attributes] ([Id])
GO
ALTER TABLE [ied].[Person]  WITH CHECK ADD FOREIGN KEY([EducationId])
REFERENCES [ied].[Attributes] ([Id])
GO
ALTER TABLE [ied].[Person]  WITH CHECK ADD FOREIGN KEY([EyesId])
REFERENCES [ied].[Attributes] ([Id])
GO
ALTER TABLE [ied].[Person]  WITH CHECK ADD FOREIGN KEY([FatherEthnicityId])
REFERENCES [ied].[Attributes] ([Id])
GO
ALTER TABLE [ied].[Person]  WITH CHECK ADD FOREIGN KEY([FathersBirthPlace])
REFERENCES [geo].[Countries] ([Id])
GO
ALTER TABLE [ied].[Person]  WITH CHECK ADD FOREIGN KEY([GenderId])
REFERENCES [ied].[Attributes] ([Id])
GO
ALTER TABLE [ied].[Person]  WITH CHECK ADD FOREIGN KEY([HariId])
REFERENCES [ied].[Attributes] ([Id])
GO
ALTER TABLE [ied].[Person]  WITH CHECK ADD FOREIGN KEY([HistoryId])
REFERENCES [ied].[Attributes] ([Id])
GO
ALTER TABLE [ied].[Person]  WITH CHECK ADD FOREIGN KEY([MaritalStatusId])
REFERENCES [ied].[Attributes] ([Id])
GO
ALTER TABLE [ied].[Person]  WITH CHECK ADD FOREIGN KEY([MotherEthnicityId])
REFERENCES [ied].[Attributes] ([Id])
GO
ALTER TABLE [ied].[Person]  WITH CHECK ADD FOREIGN KEY([MothersBirthPlace])
REFERENCES [geo].[Countries] ([Id])
GO
ALTER TABLE [ied].[Person]  WITH CHECK ADD FOREIGN KEY([PhoneTypeId])
REFERENCES [ied].[Attributes] ([Id])
GO
ALTER TABLE [ied].[Person]  WITH CHECK ADD FOREIGN KEY([ReligionId])
REFERENCES [ied].[Attributes] ([Id])
GO
ALTER TABLE [ied].[Person]  WITH CHECK ADD FOREIGN KEY([SmokingId])
REFERENCES [ied].[Attributes] ([Id])
GO
ALTER TABLE [ied].[Person]  WITH CHECK ADD  CONSTRAINT [FK_Person_Attributes] FOREIGN KEY([TitleId])
REFERENCES [ied].[Attributes] ([Id])
GO
ALTER TABLE [ied].[Person] CHECK CONSTRAINT [FK_Person_Attributes]
GO
ALTER TABLE [ied].[Person]  WITH CHECK ADD  CONSTRAINT [FK_Person_Attributes1] FOREIGN KEY([RaceId])
REFERENCES [ied].[Attributes] ([Id])
GO
ALTER TABLE [ied].[Person] CHECK CONSTRAINT [FK_Person_Attributes1]
GO
/****** Object:  StoredProcedure [dbo].[FetchAttributes]    Script Date: 10/4/2024 9:58:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[FetchAttributes](@AttributeTypeId int=0)
as 
begin 
 SELECT [Id]
      ,[AttributeTypeId]
      ,[Name]
      ,[IsDeleted]
  FROM [GenAI].[ied].[Attributes] where IsDeleted = 0 and ( @AttributeTypeId = 0 or AttributeTypeId = @AttributeTypeId) order by Name

end
GO
/****** Object:  StoredProcedure [dbo].[InsertPersonData]    Script Date: 10/4/2024 9:58:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[InsertPersonData](  @Id INT OUTPUT,  
           @UserId  uniqueidentifier   
           ,@ApplicationType  int = null  
           ,@FirstName  varchar(200) = null  
           ,@LastName  varchar(200) = null  
           ,@Email  varchar(200) = null  
           ,@Address1  varchar(200) = null  
           ,@Address2  varchar(200) = null  
           ,@City  varchar(200) = null  
           ,@State  varchar(200) = null  
           ,@StateId  int = null  
           ,@PostalCode  varchar(200) = null  
           ,@CountryId  int = null  
           ,@Phone  int = null  
           ,@PhoneTypeId  int = null  
           ,@BirthDate  varchar(200) = null  
           ,@GenderId  int = null  
           ,@HariId  int = null  
           ,@EyesId  int = null  
           ,@Height  int = null  
           ,@Weight  int = null  
           ,@EducationId  int = null  
           ,@FatherEthnicityId  int = null  
           ,@FathersBirthPlace  int = null  
           ,@MotherEthnicityId  int = null  
           ,@MothersBirthPlace  int = null  
           ,@MaritalStatusId  int = null  
           ,@DietId  int = null  
           ,@BodyId  int = null  
           ,@ReligionId  int = null  
           ,@SmokingId  int = null  
           ,@DrinkerId  int = null  
           ,@BloodTypeId  int = null  
           ,@Hidden  int = null  
           ,@Deleted  int = null  
           ,@ForeignId  varchar(200) = null  
           ,@HistoryId  int = null  
           ,@ComplexionId  int = null  
           ,@Status  varchar(200) = null  
           ,@PictureName1  varchar(200) = null  
           ,@PictureName2  varchar(200) = null  
           ,@Personality  varchar(200) = null  
           ,@MedicalHistory  varchar(200) = null  
           ,@Occupation  varchar(200) = null  
           ,@TitleId  int = null  
           ,@RaceId  int = null  
           ,@Priority  int = null  
           ,@RequestFromWeb  varchar(max) = null  
           ,@admin_notes  varchar(max) = null  
           ,@admin_comments  varchar(max) = null
		  
)  
AS   
  
BEGIN  

SET NOCOUNT ON

INSERT INTO [ied].[Person]  
           ([Created]  
           ,[UserId]  
           ,[ApplicationType]  
           ,[FirstName]  
           ,[LastName]  
           ,[Email]  
           ,[Address1]  
           ,[Address2]  
           ,[City]  
           ,[State]  
           ,[StateId]  
           ,[PostalCode]  
           ,[CountryId]  
           ,[Phone]  
           ,[PhoneTypeId]  
           ,[BirthDate]  
           ,[GenderId]  
           ,[HariId]  
           ,[EyesId]  
           ,[Height]  
           ,[Weight]  
           ,[EducationId]  
           ,[FatherEthnicityId]  
           ,[FathersBirthPlace]  
           ,[MotherEthnicityId]  
           ,[MothersBirthPlace]  
           ,[MaritalStatusId]  
           ,[DietId]  
           ,[BodyId]  
           ,[ReligionId]  
           ,[SmokingId]  
           ,[DrinkerId]  
           ,[BloodTypeId]  
           ,[Hidden]  
           ,[Deleted]  
           ,[ForeignId]  
           ,[HistoryId]  
           ,[ComplexionId]  
           ,[Status]  
           ,[PictureName1]  
           ,[PictureName2]  
           ,[Personality]  
           ,[MedicalHistory]  
           ,[Occupation]  
           ,[TitleId]  
           ,[RaceId]  
           ,[Priority]  
           ,[RequestFromWeb]  
           ,[admin_notes]  
           ,[admin_comments])  
     VALUES  
           (GETDATE(),  
            @UserId  
           ,@ApplicationType  
           ,@FirstName  
           ,@LastName  
           ,@Email  
           ,@Address1  
           ,@Address2  
           ,@City  
           ,@State  
           ,@StateId  
           ,@PostalCode  
           ,@CountryId  
           ,@Phone  
           ,@PhoneTypeId  
           ,@BirthDate  
           ,@GenderId  
           ,@HariId  
           ,@EyesId  
           ,@Height  
           ,@Weight  
           ,@EducationId  
           ,@FatherEthnicityId  
           ,@FathersBirthPlace  
           ,@MotherEthnicityId  
           ,@MothersBirthPlace  
           ,@MaritalStatusId  
           ,@DietId  
           ,@BodyId  
           ,@ReligionId  
           ,@SmokingId  
           ,@DrinkerId  
           ,@BloodTypeId  
           ,@Hidden  
           ,@Deleted  
           ,@ForeignId  
           ,@HistoryId  
           ,@ComplexionId  
           ,@Status  
           ,@PictureName1  
           ,@PictureName2  
           ,@Personality  
           ,@MedicalHistory  
           ,@Occupation  
           ,@TitleId  
           ,@RaceId  
           ,@Priority  
           ,@RequestFromWeb  
           ,@admin_notes  
           ,@admin_comments)  
  
	SET @Id= SCOPE_IDENTITY()
    SELECT @Id AS ID
    
end
GO
/****** Object:  StoredProcedure [dbo].[SP_FetchRace]    Script Date: 10/4/2024 9:58:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SP_FetchRace]
as 
begin 
 SELECT [Id]
      ,[AttributeTypeId]
      ,[Name]
      ,[IsDeleted]
  FROM [GenAI].[ied].[Attributes] where AttributeTypeId = 18

end
GO
/****** Object:  StoredProcedure [dbo].[Usp_searchDetails]    Script Date: 10/4/2024 9:58:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Usp_searchDetails](@SearchCriteria varchar(max)='')      
as      
begin       
      
SELECT       
      P.[Id]      
      --,[Created]      
      --,[UserId]      
      --,[ApplicationType]      
      ,[FirstName]      
      ,[LastName]      
      ,[Email]      
      --,[Address1]      
      --,[Address2]      
      --,[City]      
      --,[State]      
      --,[StateId]      
      --,[PostalCode]      
      --,[CountryId]      
      --,[Phone]      
      --,[PhoneTypeId]            
   ,DATEDIFF(YEAR, BirthDate, GETDATE()) -      CASE          WHEN MONTH(BirthDate) > MONTH(GETDATE()) OR     
   (MONTH(BirthDate) = MONTH(GETDATE()) AND DAY(BirthDate) > DAY(GETDATE()))          THEN 1          ELSE   
  0     END AS Age     
     -- ,[GenderId]      
      ,[HariId]      
   ,AHair.Name  HairName       
      ,[EyesId]      
   ,AEYE.Name EyesName      
      ,[Height]      
   ,Height.Name HeightName      
      ,[Weight]      
      ,[EducationId]      
   ,AEducation.Name EducationName      
      --,[FatherEthnicityId]      
      --,[FathersBirthPlace]      
      --,[MotherEthnicityId]      
      --,[MothersBirthPlace]      
      --,[MaritalStatusId]      
      --,[DietId]      
      --,[BodyId]      
      --,[ReligionId]      
      --,[SmokingId]      
      --,[DrinkerId]      
      ,[BloodTypeId]      
   ,ABloodType.Name BloodTypeName      
      --,[Hidden]      
      --,[Deleted]      
      --,[ForeignId]      
      --,[HistoryId]      
      --,[ComplexionId]      
      ,[Status]      
      ,[PictureName1]      
      ,[PictureName2]      
      ,[Personality]      
      ,[MedicalHistory]      
      --,[Occupation]      
      --,[TitleId]      
      ,[RaceId]      
   ,ARace.Name RaceName    
   , 0 SearchRatio    
      --,[Priority]      
      --,[RequestFromWeb]      
      --,[admin_notes]      
      --,[admin_comments]       
        
   FROM [GenAI].[ied].[Person] P   
  inner join  [ied].[Attributes] AHair on P.HariId = AHair.Id  and AHair.AttributeTypeId = 10  
  inner join  [ied].[Attributes] AEYE on P.EyesId = AEYE.Id and AEYE.AttributeTypeId= 9  
  left join  [ied].[Attributes] Height on P.Height = Height.Id  and Height.AttributeTypeId= 20  
  inner join  [ied].[Attributes] AEducation on P.EducationId = AEducation.Id and AEducation.AttributeTypeId= 6  
  inner join  [ied].[Attributes] ABloodType on P.BloodTypeId = ABloodType.Id  and ABloodType.AttributeTypeId= 1  
  inner join  [ied].[Attributes] ARace on P.RaceId = ARace.Id   and ARace.AttributeTypeId = 18  
  where [PictureName1] is not null
end
GO
USE [master]
GO
ALTER DATABASE [GenAI] SET  READ_WRITE 
GO
