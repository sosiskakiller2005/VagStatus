USE [master]
GO
/****** Object:  Database [VagStatusDb]    Script Date: 15.06.2025 20:16:09 ******/
CREATE DATABASE [VagStatusDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'VagStatusDb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\VagStatusDb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'VagStatusDb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\VagStatusDb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [VagStatusDb] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [VagStatusDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [VagStatusDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [VagStatusDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [VagStatusDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [VagStatusDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [VagStatusDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [VagStatusDb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [VagStatusDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [VagStatusDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [VagStatusDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [VagStatusDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [VagStatusDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [VagStatusDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [VagStatusDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [VagStatusDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [VagStatusDb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [VagStatusDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [VagStatusDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [VagStatusDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [VagStatusDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [VagStatusDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [VagStatusDb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [VagStatusDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [VagStatusDb] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [VagStatusDb] SET  MULTI_USER 
GO
ALTER DATABASE [VagStatusDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [VagStatusDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [VagStatusDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [VagStatusDb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [VagStatusDb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [VagStatusDb] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [VagStatusDb] SET QUERY_STORE = ON
GO
ALTER DATABASE [VagStatusDb] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [VagStatusDb]
GO
/****** Object:  Table [dbo].[Appointment]    Script Date: 15.06.2025 20:16:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Appointment](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DateTime] [datetime] NOT NULL,
	[UserId] [int] NOT NULL,
	[CarId] [int] NOT NULL,
	[ServiceId] [int] NOT NULL,
 CONSTRAINT [PK_Appointment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Car]    Script Date: 15.06.2025 20:16:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Car](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Number] [char](8) NOT NULL,
	[ClientId] [int] NOT NULL,
 CONSTRAINT [PK_Car] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CarPart]    Script Date: 15.06.2025 20:16:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CarPart](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CarId] [int] NOT NULL,
	[PartId] [int] NOT NULL,
 CONSTRAINT [PK_CarPart] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Client]    Script Date: 15.06.2025 20:16:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Lastname] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Surname] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Client] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Part]    Script Date: 15.06.2025 20:16:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Part](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Part] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 15.06.2025 20:16:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Service]    Script Date: 15.06.2025 20:16:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Service](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Service] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 15.06.2025 20:16:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Lastname] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Surname] [nvarchar](50) NOT NULL,
	[RoleId] [int] NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Photo] [varbinary](max) NULL,
	[AutosFixed] [int] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Appointment] ON 

INSERT [dbo].[Appointment] ([Id], [DateTime], [UserId], [CarId], [ServiceId]) VALUES (1, CAST(N'2024-12-15T13:00:00.000' AS DateTime), 1, 1, 1)
INSERT [dbo].[Appointment] ([Id], [DateTime], [UserId], [CarId], [ServiceId]) VALUES (3, CAST(N'2024-12-15T14:00:00.000' AS DateTime), 2, 1, 1)
SET IDENTITY_INSERT [dbo].[Appointment] OFF
GO
SET IDENTITY_INSERT [dbo].[Car] ON 

INSERT [dbo].[Car] ([Id], [Name], [Number], [ClientId]) VALUES (1, N'Audi RS6 C7', N'Р006СС77', 1)
SET IDENTITY_INSERT [dbo].[Car] OFF
GO
SET IDENTITY_INSERT [dbo].[CarPart] ON 

INSERT [dbo].[CarPart] ([Id], [CarId], [PartId]) VALUES (5, 1, 1)
INSERT [dbo].[CarPart] ([Id], [CarId], [PartId]) VALUES (7, 1, 2)
INSERT [dbo].[CarPart] ([Id], [CarId], [PartId]) VALUES (8, 1, 3)
INSERT [dbo].[CarPart] ([Id], [CarId], [PartId]) VALUES (9, 1, 4)
SET IDENTITY_INSERT [dbo].[CarPart] OFF
GO
SET IDENTITY_INSERT [dbo].[Client] ON 

INSERT [dbo].[Client] ([Id], [Lastname], [Name], [Surname], [Email]) VALUES (1, N'Тихонов', N'Кирилл', N'Венедиктович', N'kirill10@ya.ru')
INSERT [dbo].[Client] ([Id], [Lastname], [Name], [Surname], [Email]) VALUES (2, N'Чернышев', N'Василий', N'Павлович', N'vasiliy13061962@mail.ru')
INSERT [dbo].[Client] ([Id], [Lastname], [Name], [Surname], [Email]) VALUES (3, N'Остальцева', N'Мария', N'Никандровна', N'mariya.ostalceva@ya.ru')
INSERT [dbo].[Client] ([Id], [Lastname], [Name], [Surname], [Email]) VALUES (4, N'Ожгибесова', N'Клара', N'Кузьминовна', N'klara.ojgibesova@outlook.com')
INSERT [dbo].[Client] ([Id], [Lastname], [Name], [Surname], [Email]) VALUES (5, N'Игнатьева', N'Серафима', N'Тимофеевна', N'serafima1964@yandex.ru')
INSERT [dbo].[Client] ([Id], [Lastname], [Name], [Surname], [Email]) VALUES (6, N'Шульдешов', N'Игнат', N'Юлианович', N'ignat23101968@yandex.ru')
INSERT [dbo].[Client] ([Id], [Lastname], [Name], [Surname], [Email]) VALUES (7, N'Мурогов', N'Федор', N'Алексеевич', N'fedor1448@ya.ru')
INSERT [dbo].[Client] ([Id], [Lastname], [Name], [Surname], [Email]) VALUES (8, N'Толбоев', N'Александр', N'Георгиевич', N'aleksandr41@rambler.ru')
INSERT [dbo].[Client] ([Id], [Lastname], [Name], [Surname], [Email]) VALUES (9, N'Лесничий', N'Валерий', N'Леонтьевич', N'valeriy1989@ya.ru')
INSERT [dbo].[Client] ([Id], [Lastname], [Name], [Surname], [Email]) VALUES (10, N'Ямковой', N'Тимофей', N'Ефимович', N'timofey1986@yandex.ru')
SET IDENTITY_INSERT [dbo].[Client] OFF
GO
SET IDENTITY_INSERT [dbo].[Part] ON 

INSERT [dbo].[Part] ([Id], [Name]) VALUES (1, N'Передний бампер')
INSERT [dbo].[Part] ([Id], [Name]) VALUES (2, N'Задний бампер')
INSERT [dbo].[Part] ([Id], [Name]) VALUES (3, N'Лобовое стекло')
INSERT [dbo].[Part] ([Id], [Name]) VALUES (4, N'Заднее стекло')
SET IDENTITY_INSERT [dbo].[Part] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([Id], [Name]) VALUES (1, N'Администратор')
INSERT [dbo].[Role] ([Id], [Name]) VALUES (2, N'Старший специалист')
INSERT [dbo].[Role] ([Id], [Name]) VALUES (3, N'Младший специалист')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[Service] ON 

INSERT [dbo].[Service] ([Id], [Name]) VALUES (1, N'TO')
INSERT [dbo].[Service] ([Id], [Name]) VALUES (2, N'Замена масла')
INSERT [dbo].[Service] ([Id], [Name]) VALUES (3, N'Полировка')
INSERT [dbo].[Service] ([Id], [Name]) VALUES (4, N'Покраска')
SET IDENTITY_INSERT [dbo].[Service] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([Id], [Lastname], [Name], [Surname], [RoleId], [Password], [Photo], [AutosFixed]) VALUES (1, N'Семина', N'Рада', N'Константиновна', 1, N'1', NULL, 5)
INSERT [dbo].[User] ([Id], [Lastname], [Name], [Surname], [RoleId], [Password], [Photo], [AutosFixed]) VALUES (2, N'Захаров', N'Игнат', N'Валентинович', 2, N'e297c5937', NULL, NULL)
INSERT [dbo].[User] ([Id], [Lastname], [Name], [Surname], [RoleId], [Password], [Photo], [AutosFixed]) VALUES (3, N'Битнер', N'София', N'Алексеевна', 3, N'538b357e5', NULL, NULL)
INSERT [dbo].[User] ([Id], [Lastname], [Name], [Surname], [RoleId], [Password], [Photo], [AutosFixed]) VALUES (4, N'Земляков', N'Алексей', N'Тимофеевич', 1, N'124a55a1e', NULL, NULL)
INSERT [dbo].[User] ([Id], [Lastname], [Name], [Surname], [RoleId], [Password], [Photo], [AutosFixed]) VALUES (5, N'Ёжиков', N'Тарас', N'Емельянович', 2, N'5ae312617', NULL, NULL)
INSERT [dbo].[User] ([Id], [Lastname], [Name], [Surname], [RoleId], [Password], [Photo], [AutosFixed]) VALUES (6, N'Смирнов', N'Максим', N'Феликсович', 3, N'828d0129f', NULL, NULL)
INSERT [dbo].[User] ([Id], [Lastname], [Name], [Surname], [RoleId], [Password], [Photo], [AutosFixed]) VALUES (7, N'Фастера', N'Ника', N'Серафимовна', 1, N'b3702df2e', NULL, NULL)
INSERT [dbo].[User] ([Id], [Lastname], [Name], [Surname], [RoleId], [Password], [Photo], [AutosFixed]) VALUES (8, N'Шинский', N'Феликс', N'Сергеевич', 2, N'c448db65f', NULL, NULL)
INSERT [dbo].[User] ([Id], [Lastname], [Name], [Surname], [RoleId], [Password], [Photo], [AutosFixed]) VALUES (9, N'Низовкин', N'Трофим', N'Степанович', 3, N'cf97a073e', NULL, NULL)
INSERT [dbo].[User] ([Id], [Lastname], [Name], [Surname], [RoleId], [Password], [Photo], [AutosFixed]) VALUES (10, N'Яшунина', N'Людмила', N'Ипполитовна', 1, N'fba22ea88', NULL, NULL)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[Appointment]  WITH CHECK ADD  CONSTRAINT [FK_Appointment_Car] FOREIGN KEY([CarId])
REFERENCES [dbo].[Car] ([Id])
GO
ALTER TABLE [dbo].[Appointment] CHECK CONSTRAINT [FK_Appointment_Car]
GO
ALTER TABLE [dbo].[Appointment]  WITH CHECK ADD  CONSTRAINT [FK_Appointment_Service] FOREIGN KEY([ServiceId])
REFERENCES [dbo].[Service] ([Id])
GO
ALTER TABLE [dbo].[Appointment] CHECK CONSTRAINT [FK_Appointment_Service]
GO
ALTER TABLE [dbo].[Appointment]  WITH CHECK ADD  CONSTRAINT [FK_Appointment_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Appointment] CHECK CONSTRAINT [FK_Appointment_User]
GO
ALTER TABLE [dbo].[Car]  WITH CHECK ADD  CONSTRAINT [FK_Car_Client] FOREIGN KEY([ClientId])
REFERENCES [dbo].[Client] ([Id])
GO
ALTER TABLE [dbo].[Car] CHECK CONSTRAINT [FK_Car_Client]
GO
ALTER TABLE [dbo].[CarPart]  WITH CHECK ADD  CONSTRAINT [FK_CarPart_Car] FOREIGN KEY([CarId])
REFERENCES [dbo].[Car] ([Id])
GO
ALTER TABLE [dbo].[CarPart] CHECK CONSTRAINT [FK_CarPart_Car]
GO
ALTER TABLE [dbo].[CarPart]  WITH CHECK ADD  CONSTRAINT [FK_CarPart_Part] FOREIGN KEY([PartId])
REFERENCES [dbo].[Part] ([Id])
GO
ALTER TABLE [dbo].[CarPart] CHECK CONSTRAINT [FK_CarPart_Part]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Role] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([Id])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Role]
GO
USE [master]
GO
ALTER DATABASE [VagStatusDb] SET  READ_WRITE 
GO
