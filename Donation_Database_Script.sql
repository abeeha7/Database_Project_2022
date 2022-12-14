USE [master]
GO
/****** Object:  Database [donationdatabase]    Script Date: 11/25/2022 10:17:31 PM ******/
CREATE DATABASE [donationdatabase]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'donationdatabase', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SPARTA\MSSQL\DATA\donationdatabase.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'donationdatabase_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SPARTA\MSSQL\DATA\donationdatabase_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [donationdatabase] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [donationdatabase].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [donationdatabase] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [donationdatabase] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [donationdatabase] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [donationdatabase] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [donationdatabase] SET ARITHABORT OFF 
GO
ALTER DATABASE [donationdatabase] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [donationdatabase] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [donationdatabase] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [donationdatabase] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [donationdatabase] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [donationdatabase] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [donationdatabase] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [donationdatabase] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [donationdatabase] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [donationdatabase] SET  DISABLE_BROKER 
GO
ALTER DATABASE [donationdatabase] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [donationdatabase] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [donationdatabase] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [donationdatabase] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [donationdatabase] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [donationdatabase] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [donationdatabase] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [donationdatabase] SET RECOVERY FULL 
GO
ALTER DATABASE [donationdatabase] SET  MULTI_USER 
GO
ALTER DATABASE [donationdatabase] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [donationdatabase] SET DB_CHAINING OFF 
GO
ALTER DATABASE [donationdatabase] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [donationdatabase] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [donationdatabase] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [donationdatabase] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'donationdatabase', N'ON'
GO
ALTER DATABASE [donationdatabase] SET QUERY_STORE = OFF
GO
USE [donationdatabase]
GO
/****** Object:  Table [dbo].[Areas_In_Need]    Script Date: 11/25/2022 10:17:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Areas_In_Need](
	[ID] [int] IDENTITY(10,1) NOT NULL,
	[City] [int] NOT NULL,
	[Province] [varchar](50) NOT NULL,
	[Affected] [int] NOT NULL,
 CONSTRAINT [PK_AREAS_IN_NEED] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Branch_of_NGO]    Script Date: 11/25/2022 10:17:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Branch_of_NGO](
	[Branch_id] [int] IDENTITY(2070,1) NOT NULL,
	[NGO] [int] NOT NULL,
	[City] [int] NOT NULL,
 CONSTRAINT [PK_BRANCH_OF_NGO] PRIMARY KEY CLUSTERED 
(
	[Branch_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 11/25/2022 10:17:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[Category_id] [int] IDENTITY(3500,1) NOT NULL,
	[Category_Name] [varchar](60) NOT NULL,
 CONSTRAINT [PK_CATEGORY] PRIMARY KEY CLUSTERED 
(
	[Category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category_Per_NGO]    Script Date: 11/25/2022 10:17:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category_Per_NGO](
	[S.no] [int] IDENTITY(1023,1) NOT NULL,
	[Category_id] [int] NOT NULL,
	[NGO_Id] [int] NOT NULL,
 CONSTRAINT [PK_Category_Per_NGO_1] PRIMARY KEY CLUSTERED 
(
	[S.no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[City]    Script Date: 11/25/2022 10:17:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[City](
	[ID] [int] IDENTITY(7800,1) NOT NULL,
	[Name] [varchar](55) NOT NULL,
 CONSTRAINT [PK_CITY] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Donor]    Script Date: 11/25/2022 10:17:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Donor](
	[Userid] [int] IDENTITY(1200,1) NOT NULL,
	[UserName] [varchar](255) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[PhoneNumber] [varchar](25) NOT NULL,
	[EmailAddress] [varchar](255) NOT NULL,
	[Province] [varchar](255) NOT NULL,
	[City] [int] NOT NULL,
 CONSTRAINT [PK_DONOR] PRIMARY KEY CLUSTERED 
(
	[Userid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Donor_History]    Script Date: 11/25/2022 10:17:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Donor_History](
	[S.no] [int] IDENTITY(900,1) NOT NULL,
	[User_id] [int] NOT NULL,
	[NGO] [int] NOT NULL,
	[Date_of_Donation] [nvarchar](50) NOT NULL,
	[Donation_Given] [int] NOT NULL,
	[Project] [int] NOT NULL,
 CONSTRAINT [PK_Donor_History_1] PRIMARY KEY CLUSTERED 
(
	[S.no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 11/25/2022 10:17:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[Employee_Id] [int] IDENTITY(10090,1) NOT NULL,
	[Name] [varchar](30) NOT NULL,
	[NGO] [int] NOT NULL,
	[Branch] [int] NOT NULL,
	[Contact_Number] [varchar](20) NULL,
	[Email_Address] [varchar](255) NOT NULL,
 CONSTRAINT [PK_EMPLOYEE] PRIMARY KEY CLUSTERED 
(
	[Employee_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NGO]    Script Date: 11/25/2022 10:17:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NGO](
	[Ngoid] [int] IDENTITY(65780,1) NOT NULL,
	[username] [varchar](255) NOT NULL,
	[password] [varchar](50) NOT NULL,
	[NGO_Name] [varchar](255) NOT NULL,
	[Contact_Number] [varchar](255) NOT NULL,
	[City] [int] NOT NULL,
 CONSTRAINT [PK_NGO] PRIMARY KEY NONCLUSTERED 
(
	[Ngoid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Project]    Script Date: 11/25/2022 10:17:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Project](
	[Project_id] [int] IDENTITY(45698,1) NOT NULL,
	[Name] [varchar](105) NOT NULL,
	[NGO] [int] NOT NULL,
	[Start_Date] [nvarchar](50) NOT NULL,
	[End_Date] [nvarchar](50) NULL,
	[Amount_Collected] [float] NOT NULL,
	[Goal] [float] NOT NULL,
	[Lead_Id] [int] NOT NULL,
	[Branch_id] [int] NOT NULL,
	[Category] [int] NOT NULL,
	[Area] [int] NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_PROJECT] PRIMARY KEY CLUSTERED 
(
	[Project_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Index [IX_Category_Per_NGO]    Script Date: 11/25/2022 10:17:32 PM ******/
CREATE NONCLUSTERED COLUMNSTORE INDEX [IX_Category_Per_NGO] ON [dbo].[Category_Per_NGO]
(
	[Category_id]
)WITH (DROP_EXISTING = OFF, COMPRESSION_DELAY = 0) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Branch_of_NGO]  WITH CHECK ADD  CONSTRAINT [Branch_of_NGO_fk0] FOREIGN KEY([NGO])
REFERENCES [dbo].[NGO] ([Ngoid])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Branch_of_NGO] CHECK CONSTRAINT [Branch_of_NGO_fk0]
GO
ALTER TABLE [dbo].[Branch_of_NGO]  WITH CHECK ADD  CONSTRAINT [Branch_of_NGO_fk1] FOREIGN KEY([City])
REFERENCES [dbo].[City] ([ID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Branch_of_NGO] CHECK CONSTRAINT [Branch_of_NGO_fk1]
GO
ALTER TABLE [dbo].[Category_Per_NGO]  WITH CHECK ADD  CONSTRAINT [Category_Per_NGO_fk0] FOREIGN KEY([Category_id])
REFERENCES [dbo].[Category] ([Category_id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Category_Per_NGO] CHECK CONSTRAINT [Category_Per_NGO_fk0]
GO
ALTER TABLE [dbo].[Category_Per_NGO]  WITH CHECK ADD  CONSTRAINT [Category_Per_NGO_fk1] FOREIGN KEY([NGO_Id])
REFERENCES [dbo].[NGO] ([Ngoid])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Category_Per_NGO] CHECK CONSTRAINT [Category_Per_NGO_fk1]
GO
ALTER TABLE [dbo].[Donor]  WITH CHECK ADD  CONSTRAINT [Donor_fk0] FOREIGN KEY([City])
REFERENCES [dbo].[City] ([ID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Donor] CHECK CONSTRAINT [Donor_fk0]
GO
ALTER TABLE [dbo].[Donor_History]  WITH CHECK ADD  CONSTRAINT [Donor_History_fk0] FOREIGN KEY([User_id])
REFERENCES [dbo].[Donor] ([Userid])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Donor_History] CHECK CONSTRAINT [Donor_History_fk0]
GO
ALTER TABLE [dbo].[Donor_History]  WITH CHECK ADD  CONSTRAINT [Donor_History_fk1] FOREIGN KEY([NGO])
REFERENCES [dbo].[NGO] ([Ngoid])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Donor_History] CHECK CONSTRAINT [Donor_History_fk1]
GO
ALTER TABLE [dbo].[Donor_History]  WITH CHECK ADD  CONSTRAINT [Donor_History_fk2] FOREIGN KEY([Project])
REFERENCES [dbo].[Project] ([Project_id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Donor_History] CHECK CONSTRAINT [Donor_History_fk2]
GO
ALTER TABLE [dbo].[Project]  WITH CHECK ADD  CONSTRAINT [Project_fk1] FOREIGN KEY([Lead_Id])
REFERENCES [dbo].[Employee] ([Employee_Id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Project] CHECK CONSTRAINT [Project_fk1]
GO
ALTER TABLE [dbo].[Project]  WITH CHECK ADD  CONSTRAINT [Project_fk3] FOREIGN KEY([Category])
REFERENCES [dbo].[Category] ([Category_id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Project] CHECK CONSTRAINT [Project_fk3]
GO
ALTER TABLE [dbo].[Project]  WITH CHECK ADD  CONSTRAINT [Project_fk4] FOREIGN KEY([Area])
REFERENCES [dbo].[Areas_In_Need] ([ID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Project] CHECK CONSTRAINT [Project_fk4]
GO
/****** Object:  StoredProcedure [dbo].[Area]    Script Date: 11/25/2022 10:17:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Area]
 @city int, @pro varchar(50), @affected int
as
begin
Insert into Areas_In_Need(City,Province,Affected) values(@city,@pro,@affected)
end
GO
/****** Object:  StoredProcedure [dbo].[Branch1]    Script Date: 11/25/2022 10:17:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Branch1] 
 @ngo int, @city int
as
begin
Insert into Branch_of_NGO(NGO,City) values (@ngo,@city)
end
GO
/****** Object:  StoredProcedure [dbo].[Branches]    Script Date: 11/25/2022 10:17:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Branches] 
@id int, @ngo int, @city int
as
begin
Insert into Branch_of_NGO(Branch_id,NGO,City) values (@id,@ngo,@city)
end
GO
/****** Object:  StoredProcedure [dbo].[cat]    Script Date: 11/25/2022 10:17:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[cat]
 @name varchar(60)
as
begin
Insert into Category (Category_Name) values(@name)
end
GO
/****** Object:  StoredProcedure [dbo].[Category_Ngo]    Script Date: 11/25/2022 10:17:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Category_Ngo]
@cat int, @ngo int
as
begin
Insert into Category_Per_NGO(Category_id,NGO_Id) values(@cat,@ngo)
end
GO
/****** Object:  StoredProcedure [dbo].[categoryngo]    Script Date: 11/25/2022 10:17:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create Procedure [dbo].[categoryngo]
@cat int, @ngo int
as 
begin
Insert into Category_Per_NGO(Category_id,NGO_Id) values (@cat,@ngo)
end
GO
/****** Object:  StoredProcedure [dbo].[donor1]    Script Date: 11/25/2022 10:17:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create Procedure [dbo].[donor1]
@userName varchar(255), @password varchar(50), @no varchar(25), @email varchar(255), @province varchar(255), @city int
as 
begin
Insert into Donor (UserName,Password,PhoneNumber,EmailAddress,Province,City) values (@userName,@password,@no,@email,@province,@city)
end
GO
/****** Object:  StoredProcedure [dbo].[InsertCity]    Script Date: 11/25/2022 10:17:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create Procedure [dbo].[InsertCity]
 @ID int, @Name varchar(55)
 as
 begin
 Insert into City (ID,Name) values(@ID,@Name)
 end
GO
/****** Object:  StoredProcedure [dbo].[InsertCity0]    Script Date: 11/25/2022 10:17:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create Procedure [dbo].[InsertCity0]
 @ID int, @Name varchar(55)
 as
 begin
 Insert into City (ID,Name) values(@ID,@Name)
 end
GO
/****** Object:  StoredProcedure [dbo].[InsertCity1]    Script Date: 11/25/2022 10:17:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create Procedure [dbo].[InsertCity1]
 @ID int, @Name varchar(55)
 as
 begin
 SET IDENTITY_INSERT [Employee] OFF
 Insert into City (ID,Name) values(@ID,@Name)
 end
GO
/****** Object:  StoredProcedure [dbo].[InsertCity2]    Script Date: 11/25/2022 10:17:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create Procedure [dbo].[InsertCity2]
 @ID int, @Name varchar(55)
 as
 begin
 SET IDENTITY_INSERT [City] OFF
 Insert into City (ID,Name) values(@ID,@Name)
 end
GO
/****** Object:  StoredProcedure [dbo].[InsertCity5]    Script Date: 11/25/2022 10:17:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create Procedure [dbo].[InsertCity5]
  @Name varchar(55)
 as
 begin
 Insert into City (Name) values(@Name)
 end
GO
/****** Object:  StoredProcedure [dbo].[InsertEmployee]    Script Date: 11/25/2022 10:17:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create Procedure [dbo].[InsertEmployee]
@Employee_id int,@Name varchar(30) ,@NGO int ,@Branch int ,@Conatact int ,@Email varchar(255)
as 
begin
Insert into Employee (Employee_Id,Name,NGO,Branch,Contact_Number,Email_Address) values (@Employee_id,@Name,@NGO,@Branch,@Conatact,@Email)
end
GO
/****** Object:  StoredProcedure [dbo].[InsertEmployee1]    Script Date: 11/25/2022 10:17:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create Procedure [dbo].[InsertEmployee1]
@Employee_id int,@Name varchar(30) ,@NGO int ,@Branch int ,@Conatact varchar(50) ,@Email varchar(255)
as 
begin
Insert into Employee (Employee_Id,Name,NGO,Branch,Contact_Number,Email_Address) values (@Employee_id,@Name,@NGO,@Branch,@Conatact,@Email)
end
 exec InsertEmployee1 00001,'Ahmed',12333,34215,'03346786505','ad1@gmail.com'
GO
/****** Object:  StoredProcedure [dbo].[InsertEmployee2]    Script Date: 11/25/2022 10:17:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create Procedure [dbo].[InsertEmployee2]
@Employee_id int,@Name varchar(30) ,@NGO int ,@Branch int ,@Conatact varchar(20) ,@Email varchar(255)
as 
begin
Insert into Employee (Employee_Id,Name,NGO,Branch,Contact_Number,Email_Address) values (@Employee_id,@Name,@NGO,@Branch,@Conatact,@Email)
end
GO
/****** Object:  StoredProcedure [dbo].[InsertEmployee3]    Script Date: 11/25/2022 10:17:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create Procedure [dbo].[InsertEmployee3]

@Employee_id int,@Name varchar(30) ,@NGO int ,@Branch int ,@Conatact varchar(20) ,@Email varchar(255)
as 
begin
SET IDENTITY_INSERT [Employee] OFF
Insert into Employee (Employee_Id,Name,NGO,Branch,Contact_Number,Email_Address) values (@Employee_id,@Name,@NGO,@Branch,@Conatact,@Email)
end
GO
/****** Object:  StoredProcedure [dbo].[InsertEmployee5]    Script Date: 11/25/2022 10:17:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create Procedure [dbo].[InsertEmployee5]

@Name varchar(30) ,@NGO int ,@Branch int ,@Conatact varchar(20) ,@Email varchar(255)
as 
begin
SET IDENTITY_INSERT [Employee] OFF
Insert into Employee (Name,NGO,Branch,Contact_Number,Email_Address) values (@Name,@NGO,@Branch,@Conatact,@Email)
end
GO
/****** Object:  StoredProcedure [dbo].[InsertEmployee6]    Script Date: 11/25/2022 10:17:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create Procedure [dbo].[InsertEmployee6]

@Name varchar(30) ,@NGO int ,@Branch int ,@Conatact varchar(20) ,@Email varchar(255)
as 
begin
SET IDENTITY_INSERT [Employee] OFF
Insert into Employee (Name,Branch,NGO,Contact_Number,Email_Address) values (@Name,@Branch,@NGO,@Conatact,@Email)
end
GO
/****** Object:  StoredProcedure [dbo].[InsertEmployee7]    Script Date: 11/25/2022 10:17:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create Procedure [dbo].[InsertEmployee7]

@Name varchar(30) ,@NGO int ,@Branch int ,@Conatact varchar(20) ,@Email varchar(255)
as 
begin
SET IDENTITY_INSERT [Employee] OFF
Insert into Employee (Name,NGO,Branch,Contact_Number,Email_Address) values (@Name,@NGO,@Branch,@Conatact,@Email)
end
GO
/****** Object:  StoredProcedure [dbo].[NGO1]    Script Date: 11/25/2022 10:17:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create Procedure [dbo].[NGO1]
 @username varchar(255), @password varchar(255),@name varchar(255),@number varchar(255), @hq int
 as
 begin
 Insert into NGO(username,password,NGO_Name,Contact_Number,City) Values(@username,@password,@name,@number,@hq)
 end
GO
/****** Object:  StoredProcedure [dbo].[NGOS]    Script Date: 11/25/2022 10:17:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create Procedure [dbo].[NGOS]
 @id int, @username varchar(255), @password varchar(255),@name varchar(255),@number varchar(255), @hq int
 as
 begin
 Insert into NGO(Ngoid,username,password,NGO_Name,Contact_Number,City) Values(@id,@username,@password,@name,@number,@hq)
 end
GO
/****** Object:  StoredProcedure [dbo].[project2]    Script Date: 11/25/2022 10:17:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[project2]
@name varchar(105), @ngo int, @start date, @end date, @coll float, @goal float,
@lead int, @branch int, @cat int, @area int, @des nvarchar(max)
as
begin
Insert into Project(Name,NGO,Start_Date,End_Date,Amount_Collected,Goal,Lead_Id,Branch_id,Category,Area,Description) values (@name,@ngo,@start,@end,@coll,@goal,@lead,@branch,@cat,@area,@des)
end
GO
/****** Object:  StoredProcedure [dbo].[project3]    Script Date: 11/25/2022 10:17:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[project3]
@name varchar(105), @ngo int, @start nvarchar(50), @end  nvarchar(50), @coll float, @goal float,
@lead int, @branch int, @cat int, @area int, @des nvarchar(max)
as
begin
Insert into Project(Name,NGO,Start_Date,End_Date,Amount_Collected,Goal,Lead_Id,Branch_id,Category,Area,Description) values (@name,@ngo,@start,@end,@coll,@goal,@lead,@branch,@cat,@area,@des)
end
GO
/****** Object:  StoredProcedure [dbo].[userhistory]    Script Date: 11/25/2022 10:17:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create Procedure [dbo].[userhistory]
@user int, @ngo int, @date varchar, @donation int, @project int
as 
begin
Insert into Donor_History(User_id,NGO,Date_of_Donation,Donation_Given,Project) values (@user,@ngo,@date,@donation,@project)
end
GO
/****** Object:  StoredProcedure [dbo].[userhistory1]    Script Date: 11/25/2022 10:17:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create Procedure [dbo].[userhistory1]
@user int, @ngo int, @date nvarchar, @donation int, @project int
as 
begin
Insert into Donor_History(User_id,NGO,Date_of_Donation,Donation_Given,Project) values (@user,@ngo,@date,@donation,@project)
end

exec userhistory1 1200,65789,'12/09/2021',1200,45707
exec userhistory1 1200,65788,'12/09/2021',15000,45705
exec userhistory1 1204,65785,'03/04/2018',20000,45704
exec userhistory1 1202,65787,'16/12/2017',1650,45700
exec userhistory1 1201,65786,'09/08/2021',9000,45706
exec userhistory1 1201,65785,'09/08/2021',19000,45703
GO
/****** Object:  StoredProcedure [dbo].[userhistory2]    Script Date: 11/25/2022 10:17:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create Procedure [dbo].[userhistory2]
@user int, @ngo int, @date nvarchar(50), @donation int, @project int
as 
begin
Insert into Donor_History(User_id,NGO,Date_of_Donation,Donation_Given,Project) values (@user,@ngo,@date,@donation,@project)
end
GO
USE [master]
GO
ALTER DATABASE [donationdatabase] SET  READ_WRITE 
GO
