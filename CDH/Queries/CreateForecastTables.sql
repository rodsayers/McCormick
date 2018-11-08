USE [mccormick]
GO

/****** Object: Table [cleansed].[AccountAcceptance] Script Date: 10/22/2018 4:02:41 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO
-------------------------------------------------------------------------
--DROP TABLE [stage].[SKU_Input];


GO
CREATE TABLE [stage].[SKU_Input] (
    [Budget_Year]            INT           NULL,
    [Innovation_Name] NVARCHAR (50) NULL,
    [Nat_Ship_Date]   DATETIME      NULL,
    [Early_ship_Ind]  NVARCHAR (10) NULL,
    [Category]        NVARCHAR (50) NULL,
    [Launch_Type]     NVARCHAR (50) NULL,
    [SKU]             NVARCHAR (50) NULL,
    [Prod_Desc]       NVARCHAR (50) NULL,
	[Input_Type]       NVARCHAR (50) NULL,
    [Retailer]        NVARCHAR (50) NULL,
    [Value]            FLOAT    NULL,
    [Updloaded_By] [nvarchar](25) NULL DEFAULT CURRENT_USER,
	[Updated_Date] [date] NULL DEFAULT (getdate())
);



-------------------------------------------------------------------------
--DROP TABLE [cleansed].[SKU_Input];


GO
CREATE TABLE [cleansed].[SKU_Input] (

    [Budget_Year]            INT           NULL,
    [Innovation_Name] NVARCHAR (50) NULL,
    [Nat_Ship_Date]   DATETIME      NULL,
    [Early_ship_Ind]  NVARCHAR (10) NULL,
    [Category]        NVARCHAR (50) NULL,
    [Launch_Type]     NVARCHAR (50) NULL,
    [SKU]             NVARCHAR (50) NULL,
    [Prod_Desc]       NVARCHAR (50) NULL,
	[Input_Type]       NVARCHAR (50) NULL,
    [Retailer]        NVARCHAR (50) NULL,
    [Value]            FLOAT    NULL,
    [Updloaded_By] [nvarchar](25) NULL DEFAULT CURRENT_USER,
	[Updated_Date] [date] NULL DEFAULT (getdate())
);


-------------------------------------------------------------------------
--DROP TABLE [stage].[SKU_Input];


GO
CREATE TABLE [stage].[SKU_Input] (
    [Budget_Year]            INT           NULL,
    [Innovation_Name] NVARCHAR (50) NULL,
    [Nat_Ship_Date]   DATETIME      NULL,
    [Early_ship_Ind]  NVARCHAR (10) NULL,
    [Category]        NVARCHAR (50) NULL,
    [Launch_Type]     NVARCHAR (50) NULL,
    [SKU]             NVARCHAR (50) NULL,
    [Prod_Desc]       NVARCHAR (50) NULL,
	[Input_Type]       NVARCHAR (50) NULL,
    [Retailer]        NVARCHAR (50) NULL,
    [Value]            FLOAT    NULL,
    [Updloaded_By] [nvarchar](25) NULL DEFAULT CURRENT_USER,
	[Updated_Date] [date] NULL DEFAULT (getdate())
);



-------------------------------------------------------------------------
--DROP TABLE [stage].[Spend_Input];


GO
CREATE TABLE [stage].[Spend_Input] (

    [Budget_Year]            INT           NULL,
    [Innovation_Name] NVARCHAR (50) NULL,
    [Nat_Ship_Date]   DATETIME      NULL,
    [Early_ship_Ind]  NVARCHAR (10) NULL,
    [Category]        NVARCHAR (50) NULL,
    [Launch_Type]     NVARCHAR (50) NULL,
    [SKU]             NVARCHAR (50) NULL,
    [Prod_Desc]       NVARCHAR (50) NULL,
	[Shopper]            FLOAT    NULL,
	[TV]            FLOAT    NULL,
	[Print]            FLOAT    NULL,
	[Digital]	FLOAT    NULL,
	[Coupon]    FLOAT    NULL,
	[Multicultural]	FLOAT    NULL,
	[Other]		FLOAT    NULL,
    [Updloaded_By] [nvarchar](25) NULL DEFAULT CURRENT_USER,
	[Updated_Date] [date] NULL DEFAULT (getdate())
);

--DROP TABLE [cleansed].[Spend_Input];


GO
CREATE TABLE [cleansed].[Spend_Input] (

    [Budget_Year]            INT           NULL,
    [Innovation_Name] NVARCHAR (50) NULL,
    [Nat_Ship_Date]   DATETIME      NULL,
    [Early_ship_Ind]  NVARCHAR (10) NULL,
    [Category]        NVARCHAR (50) NULL,
    [Launch_Type]     NVARCHAR (50) NULL,
    [SKU]             NVARCHAR (50) NULL,
    [Prod_Desc]       NVARCHAR (50) NULL,
	[Shopper]            FLOAT    NULL,
	[TV]            FLOAT    NULL,
	[Print]            FLOAT    NULL,
	[Digital]	FLOAT    NULL,
	[Coupon]    FLOAT    NULL,
	[Multicultural]	FLOAT    NULL,
	[Other]		FLOAT    NULL,
    [Updloaded_By] [nvarchar](25) NULL DEFAULT CURRENT_USER,
	[Updated_Date] [date] NULL DEFAULT (getdate())
);


-------------------------------------------------------------------------
--DROP TABLE [stage].[Advanced_Input];


GO
CREATE TABLE [stage].Advanced_Input (
	[Month] NVARCHAR(50),
    [Year]            INT           NULL,
    [Innovation_Name] NVARCHAR (50) NULL,
    [Nat_Ship_Date]   DATETIME      NULL,
    [Early_ship_Ind]  NVARCHAR (10) NULL,
    [Category]        NVARCHAR (50) NULL,
    [Launch_Type]     NVARCHAR (50) NULL,
    [SKU]             NVARCHAR (50) NULL,
    [Prod_Desc]       NVARCHAR (50) NULL,
	[Seasonality_Shipments] FLOAT    NULL,
	[Unit_Turn_Food] FLOAT    NULL,
	[Unit_Turn_WMT] FLOAT    NULL,
	[Unit_Turn_Target]	 FLOAT    NULL,
	[Store_Count_Build_Food]	 FLOAT    NULL,
	[Store_Count_Build_WMT]	 FLOAT    NULL,
	[Store_Count_Build_Target] FLOAT    NULL,
    [Updloaded_By] [nvarchar](25) NULL DEFAULT CURRENT_USER,
	[Updated_Date] [date] NULL DEFAULT (getdate())
);

--DROP TABLE [cleansed].[Advanced_Input];
GO
CREATE TABLE [cleansed].Advanced_Input (
	[Month] NVARCHAR(50),
    [Year]            INT           NULL,
    [Innovation_Name] NVARCHAR (50) NULL,
    [Nat_Ship_Date]   DATETIME      NULL,
    [Early_ship_Ind]  NVARCHAR (10) NULL,
    [Category]        NVARCHAR (50) NULL,
    [Launch_Type]     NVARCHAR (50) NULL,
    [SKU]             NVARCHAR (50) NULL,
    [Prod_Desc]       NVARCHAR (50) NULL,
	[Seasonality_Shipments] FLOAT    NULL,
	[Unit_Turn_Food] FLOAT    NULL,
	[Unit_Turn_WMT] FLOAT    NULL,
	[Unit_Turn_Target]	 FLOAT    NULL,
	[Store_Count_Build_Food]	 FLOAT    NULL,
	[Store_Count_Build_WMT]	 FLOAT    NULL,
	[Store_Count_Build_Target] FLOAT    NULL,
    [Updloaded_By] [nvarchar](25) NULL DEFAULT CURRENT_USER,
	[Updated_Date] [date] NULL DEFAULT (getdate())
);