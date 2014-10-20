-- create a database
CREATE DATABASE [Street_reyser]

GO

USE Street_reyser
GO

--create tables

CREATE TABLE [Reysers] 
( 
[ID][int] NOT NULL IDENTITY(1,1) PRIMARY KEY ,
[NAME] [nvarchar](50) NULL,
[SURNAME] [nvarchar](50) NULL,
[RATING] [int] NULL,
[CAR_ID] [int] NULL,
[BIRTHDAY] [datetime] NULL
) 
GO

CREATE TABLE [Cars]  ( 
[ID][int] IDENTITY(1,1) PRIMARY KEY NOT NULL,
[Car_Brand] [nvarchar](50) NULL,
[Ìodel] [nvarchar](50) NULL,
[Weight_kg] [int] NULL,
[Body_type] [nvarchar] (50) NULL,
[Engine] [nvarchar](50) NULL)
GO
 CREATE TABLE [Race]  ( 
[ID][int] IDENTITY(1,1) PRIMARY KEY NOT NULL,
[City] [nvarchar](50) NULL,
[laps] [int] NULL,
[Date_Reys] [datetime] NULL,
[Reysers_ID] [int] NULL,
[Podium] [nvarchar] (50) NULL,
[Time_millisecond ] [int] NULL
)
GO
-- fill the tables;

INSERT INTO [Reysers] 
        (  NAME,      SURNAME,   RATING,  CAR_ID,  BIRTHDAY)
VALUES  ( 'Sergey' , ' Kabanov' ,   340 ,      1 ,  '3/16/1990'),
        ( 'Kolya'  , ' Sokov'   ,   504  ,     1 ,  '2/22/1987'),
        ( 'Sveta'  , ' Krasnova' ,  555  ,    2  ,  '5/15/1986'),
        ( 'Olya'   , ' Serova'   ,  589  ,    2  ,  '7/7/1987' ),
        ( 'Toto'   , ' Kutunio'  ,  789  ,    3  ,  '8/18/1978'),
        ('Yazunavi', ' Kavobata' ,  857  ,    3  ,  '6/15/1974'),
        ( 'German' , ' Gesse'    ,  467  ,    4  ,  '7/2/1977' ),
        ( 'Sem'    , ' Kaner'    ,  777  ,    4  ,  '3/13/1964')

GO

INSERT INTO [Cars]
             ( Car_Brand  , Ìodel            , Weight_kg ,Body_type )
    VALUES   ( 'Subaru'   ,'Impreza WRX STI' ,  1509     , 'Estate '),
             ('Subaru'   ,'Impreza WRX '    ,  1465     , 'Sedan' )
GO
INSERT INTO [Cars]
             ( Car_Brand  , Ìodel            , Weight_kg ,Body_type ,  Engine )
    VALUES   ('Mitsubishi','Lancer_Evolution_X',   1635    ,'Sedan'   , '4B11T' ),
             ('Mitsubishi','Lancer_Evolution_5',   1360    ,'Sedan'   , '4G63T' )
 GO
      
INSERT INTO [Race]
           ( City  ,  laps  , Date_Reys , Reysers_ID , Podium , Time_millisecond )
  VALUES   ( 'Kiev' ,  10    , '10/1/2013', 3         , 1      , 947474 ),
           ( 'Kiev' ,  10    , '10/1/2013', 1         , 2      , 969689 ),
           ( 'Kiev' ,  10    , '10/1/2013', 5         , 3      , 1197452 ),
           ('Tokyo' ,  15    , '4/2/2014' , 4         , 1      , 1576768 ),
           ('Tokyo' ,  15    , '4/2/2014' , 7         , 2      , 1689045 ),
           ('Tokyo' ,  15    , '4/2/2014' , 2         , 3      , 1709873 ),
           ('london' , 18    , '6/15/2014', 8         , 1      , 1867849 ),
           ('london' , 18    , '6/15/2014', 4         , 2      , 1936754 ),
           ('london' , 18    , '6/15/2014', 5         , 3      , 2001246 )
 GO
 
  --Select from one table
  select Car_Brand , Ìodel, Weight_kg ,Body_type   from Cars where Weight_kg > 1500
 GO
 -- Select from few tables
  select City, Date_Reys ,Podium , NAME ,SURNAME , Car_Brand , c.Ìodel  from
   Race r , Reysers re, cars c where re.ID=r.Reysers_ID and re.CAR_ID=c.ID
 GO
  --Count rows for any table.
   select COUNT(*) qnt_rows  from Reysers  where RATING<570