-- <Migration ID="e1525d98-7a8e-4f15-a5c6-6795aa614d4b" />
GO

CREATE USER [gdoran] WITHOUT LOGIN
GO
CREATE USER [jhyer] WITHOUT LOGIN
GO
CREATE USER [jshea] WITHOUT LOGIN
GO
CREATE USER [jsherma] WITHOUT LOGIN
GO
CREATE USER [mbrown] WITHOUT LOGIN
GO
CREATE USER [rsayers] WITHOUT LOGIN
GO
PRINT N'Altering members of role db_datareader'
GO
EXEC sp_addrolemember N'db_datareader', N'jhyer'
GO
EXEC sp_addrolemember N'db_datareader', N'jshea'
GO
EXEC sp_addrolemember N'db_datareader', N'jsherma'
GO
EXEC sp_addrolemember N'db_datareader', N'mbrown'
GO
EXEC sp_addrolemember N'db_datareader', N'rsayers'
GO
PRINT N'Altering members of role db_datawriter'
GO
EXEC sp_addrolemember N'db_datawriter', N'jhyer'
GO
EXEC sp_addrolemember N'db_datawriter', N'jshea'
GO
EXEC sp_addrolemember N'db_datawriter', N'jsherma'
GO
EXEC sp_addrolemember N'db_datawriter', N'mbrown'
GO
EXEC sp_addrolemember N'db_datawriter', N'rsayers'
GO
PRINT N'Altering members of role db_owner'
GO
EXEC sp_addrolemember N'db_owner', N'gdoran'
GO
EXEC sp_addrolemember N'db_owner', N'jsherma'
GO
EXEC sp_addrolemember N'db_owner', N'rsayers'
GO
PRINT N'Creating schemas'
GO
CREATE SCHEMA [cleansed]
AUTHORIZATION [rsayers]
GO
CREATE SCHEMA [stage]
AUTHORIZATION [rsayers]
GO
PRINT N'Creating [stage].[iri_weekly]'
GO
CREATE TABLE [stage].[iri_weekly]
(
[Product] [nvarchar] (500) NULL,
[Time] [nvarchar] (500) NULL,
[Geog] [nvarchar] (500) NULL,
[Dol] [nvarchar] (500) NULL,
[Dol_LY] [float] NULL,
[Dol_No_merch] [float] NULL,
[Dol_No_merch_LY] [float] NULL,
[Base_Dol] [float] NULL,
[Base_Dol_LY] [float] NULL,
[ACV] [float] NULL,
[ACV_LY] [float] NULL,
[Units] [float] NULL,
[Units_LY] [float] NULL,
[Units_No_merch] [float] NULL,
[Units_No_merch_LY] [float] NULL,
[Base_units] [float] NULL,
[Base_units_LY] [float] NULL,
[Inc_Units] [float] NULL,
[Inc_Units_LY] [float] NULL,
[Parent_Co] [nvarchar] (500) NULL,
[Major_Brand] [nvarchar] (500) NULL,
[Brand] [nvarchar] (500) NULL,
[Category] [nvarchar] (500) NULL,
[Sub_Category] [nvarchar] (500) NULL,
[Segment] [nvarchar] (500) NULL,
[Sub_Segment] [nvarchar] (500) NULL,
[Volume_Eq] [float] NULL,
[upc] [float] NULL,
[date] [datetime2] NULL,
[iri_week_ending] [datetime2] NULL,
[iri_week_starting] [datetime2] NULL,
[Geog2] [nvarchar] (500) NULL
)
GO
PRINT N'Creating [dbo].[Clean_IRI_Weekly_1]'
GO
-- =============================================
-- Author:      <Author, , Name>
-- Create Date: <Create Date, , >
-- Description: <Description, , >
-- =============================================
CREATE PROCEDURE [dbo].[Clean_IRI_Weekly_1]
--(
    -- Add the parameters for the stored procedure here
    --<@Param1, sysname, @p1> <Datatype_For_Param1, , int> = <Default_Value_For_Param1, , 0>,
    --<@Param2, sysname, @p2> <Datatype_For_Param2, , int> = <Default_Value_For_Param2, , 0>
--)
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON

    -- Insert statements for procedure here
	update [stage].[iri_weekly] set [Dol] = NULL WHERE [Dol]='NA';
	update [stage].[iri_weekly] set [Dol_LY]= NULL WHERE [Dol_LY]='NA';
    update [stage].[iri_weekly] SET [Dol_No_merch] = NULL WHERE [Dol_No_merch]='NA';
       update [stage].[iri_weekly] SET [Dol_No_merch_LY] = NULL WHERE [Dol_No_merch_LY]='NA';
       update [stage].[iri_weekly] SET [Base_Dol] = NULL WHERE [Base_Dol]='NA';
       update [stage].[iri_weekly] SET [Base_Dol_LY] = NULL WHERE [Base_Dol_LY]='NA';
       update [stage].[iri_weekly] SET [ACV] = NULL WHERE [ACV]='NA';
       update [stage].[iri_weekly] SET [ACV_LY] = NULL WHERE [ACV_LY]='NA';
       update [stage].[iri_weekly] SET [Units] = NULL WHERE [Units]='NA';
       update [stage].[iri_weekly] SET [Units_LY] = NULL WHERE [Units_LY]='NA';
       update [stage].[iri_weekly] SET [Units_No_merch] = NULL WHERE [Units_No_merch]='NA';
       update [stage].[iri_weekly] SET [Units_No_merch_LY] = NULL WHERE [Units_No_merch_LY]='NA';
       update [stage].[iri_weekly] SET [Base_units] = NULL WHERE [Base_units]='NA';
       update [stage].[iri_weekly] SET [Base_units_LY] = NULL WHERE [Base_units_LY]='NA';
       update [stage].[iri_weekly] SET [Inc_Units] = NULL WHERE [Inc_Units]='NA';
       update [stage].[iri_weekly] SET [Inc_Units_LY] = NULL WHERE [Inc_Units_LY]='NA';
	   update [stage].[iri_weekly] SET [Volume_Eq] = NULL WHERE [Volume_Eq]='NA';
END
GO
PRINT N'Creating [dbo].[MergeData4_manju]'
GO
CREATE TABLE [dbo].[MergeData4_manju]
(
[Product] [nvarchar] (500) NULL,
[Time] [nvarchar] (500) NULL,
[Geog] [nvarchar] (500) NULL,
[Dol] [nvarchar] (500) NULL,
[Dol_LY] [nvarchar] (500) NULL,
[Dol_No_merch] [nvarchar] (500) NULL,
[Dol_No_merch_LY] [nvarchar] (500) NULL,
[Base_Dol] [nvarchar] (500) NULL,
[Base_Dol_LY] [nvarchar] (500) NULL,
[ACV] [nvarchar] (500) NULL,
[ACV_LY] [nvarchar] (500) NULL,
[Units] [nvarchar] (500) NULL,
[Units_LY] [nvarchar] (500) NULL,
[Units_No_merch] [nvarchar] (500) NULL,
[Units_No_merch_LY] [nvarchar] (500) NULL,
[Base_units] [nvarchar] (500) NULL,
[Base_units_LY] [nvarchar] (500) NULL,
[Inc_Units] [nvarchar] (500) NULL,
[Inc_Units_LY] [nvarchar] (500) NULL,
[Parent_Co] [nvarchar] (500) NULL,
[Major_Brand] [nvarchar] (500) NULL,
[Brand] [nvarchar] (500) NULL,
[Category] [nvarchar] (500) NULL,
[Sub_Category] [nvarchar] (500) NULL,
[Segment] [nvarchar] (500) NULL,
[Sub_Segment] [nvarchar] (500) NULL,
[Volume_Eq] [float] NULL,
[upc] [float] NULL,
[date] [datetime2] NULL,
[iri_week_ending] [datetime2] NULL,
[iri_week_starting] [datetime2] NULL,
[Geog2] [nvarchar] (500) NULL
)
GO
PRINT N'Creating [dbo].[NAtoNull]'
GO
CREATE procedure [dbo].[NAtoNull] 
as 
begin
update [dbo].[MergeData4_manju] set [dol] = NULL where dol='NA'
update [dbo].[MergeData4_manju] set Dol_LY = null where dol_ly ='NA'
update [dbo].[MergeData4_manju] set dol_no_merch = null where dol_no_merch='NA'
update [dbo].[MergeData4_manju] set [Dol_No_merch_LY] = null where [Dol_No_merch_LY]='NA'
update [dbo].[MergeData4_manju] set [Base_Dol] = null where [Base_Dol]='NA'
update [dbo].[MergeData4_manju] set [Base_Dol_LY] = null where [Base_Dol_LY]='NA'
update [dbo].[MergeData4_manju] set [ACV] = null where [ACV] ='NA'
update [dbo].[MergeData4_manju] set [ACV_LY] = null where [ACV_LY] ='NA'
update [dbo].[MergeData4_manju] set [Units] = null where [Units] ='NA'
update [dbo].[MergeData4_manju] set [Units_LY] = null where [Units_LY] ='NA'
update [dbo].[MergeData4_manju] set [Units_No_merch] = null where [Units_No_merch] ='NA'
update [dbo].[MergeData4_manju] set [Units_No_merch_LY] = null where [Units_No_merch_LY] ='NA'
update [dbo].[MergeData4_manju] set [Base_units] = null where [Base_units] ='NA'
update [dbo].[MergeData4_manju] set [Base_units_LY] = null where [Base_units_LY] ='NA'
update [dbo].[MergeData4_manju] set [Inc_Units] = null where [Inc_Units] ='NA'
update [dbo].[MergeData4_manju] set [Inc_Units_LY] = null where [Inc_Units_LY] ='NA'
end
GO
PRINT N'Creating [dbo].[MergeData_stage_manju]'
GO
CREATE TABLE [dbo].[MergeData_stage_manju]
(
[Product] [nvarchar] (500) NULL,
[Time] [nvarchar] (500) NULL,
[Geog] [nvarchar] (500) NULL,
[Dol] [nvarchar] (500) NULL,
[Dol_LY] [float] NULL,
[Dol_No_merch] [float] NULL,
[Dol_No_merch_LY] [float] NULL,
[Base_Dol] [float] NULL,
[Base_Dol_LY] [float] NULL,
[ACV] [float] NULL,
[ACV_LY] [float] NULL,
[Units] [float] NULL,
[Units_LY] [float] NULL,
[Units_No_merch] [float] NULL,
[Units_No_merch_LY] [float] NULL,
[Base_units] [float] NULL,
[Base_units_LY] [float] NULL,
[Inc_Units] [float] NULL,
[Inc_Units_LY] [float] NULL,
[Parent_Co] [nvarchar] (500) NULL,
[Major_Brand] [nvarchar] (500) NULL,
[Brand] [nvarchar] (500) NULL,
[Category] [nvarchar] (500) NULL,
[Sub_Category] [nvarchar] (500) NULL,
[Segment] [nvarchar] (500) NULL,
[Sub_Segment] [nvarchar] (500) NULL,
[Volume_Eq] [float] NULL,
[upc] [float] NULL,
[date] [datetime2] NULL,
[iri_week_ending] [datetime2] NULL,
[iri_week_starting] [datetime2] NULL,
[Geog2] [nvarchar] (500) NULL
)
GO
PRINT N'Creating [dbo].[loaddata]'
GO
CREATE PROCEDURE [dbo].[loaddata]
AS
BEGIN
    INSERT INTO dbo.MergeData_stage_manju(Product) --- Columns of smaller table
        SELECT dbo.MergeData4_manju.Product
        FROM dbo.MergeData4_manju
        WHERE dbo.MergeData4_manju.Product = Product --- Where value of C1 of Master table matches the value of @C1
END
GO
PRINT N'Creating [dbo].[loaddata1]'
GO
CREATE PROCEDURE [dbo].[loaddata1]
--(@product nvarchar(500))
AS
BEGIN
    INSERT INTO dbo.MergeData_stage_manju([Product]
      ,[Time]
      ,[Geog]
      ,[Dol]
      ,[Dol_LY]
      ,[Dol_No_merch]
      ,[Dol_No_merch_LY]
      ,[Base_Dol]
      ,[Base_Dol_LY]
      ,[ACV]
      ,[ACV_LY]
      ,[Units]
      ,[Units_LY]
      ,[Units_No_merch]
      ,[Units_No_merch_LY]
      ,[Base_units]
      ,[Base_units_LY]
      ,[Inc_Units]
      ,[Inc_Units_LY]
      ,[Parent_Co]
      ,[Major_Brand]
      ,[Brand]
      ,[Category]
      ,[Sub_Category]
      ,[Segment]
      ,[Sub_Segment]
      ,[Volume_Eq]
      ,[upc]
      ,[date]
      ,[iri_week_ending]
      ,[iri_week_starting]
      ,[Geog2]) --- Columns of smaller table
        SELECT [Product]
      ,[Time]
      ,[Geog]
      ,[Dol]
      ,[Dol_LY]
      ,[Dol_No_merch]
      ,[Dol_No_merch_LY]
      ,[Base_Dol]
      ,[Base_Dol_LY]
      ,[ACV]
      ,[ACV_LY]
      ,[Units]
      ,[Units_LY]
      ,[Units_No_merch]
      ,[Units_No_merch_LY]
      ,[Base_units]
      ,[Base_units_LY]
      ,[Inc_Units]
      ,[Inc_Units_LY]
      ,[Parent_Co]
      ,[Major_Brand]
      ,[Brand]
      ,[Category]
      ,[Sub_Category]
      ,[Segment]
      ,[Sub_Segment]
      ,[Volume_Eq]
      ,[upc]
      ,[date]
      ,[iri_week_ending]
      ,[iri_week_starting]
      ,[Geog2] ---Columns of Master table
        FROM dbo.MergeData4_manju
       -- WHERE Product = @product --- Where value of C1 of Master table matches the value of @C1
END
GO
PRINT N'Creating [dbo].[natonull1]'
GO
create procedure [dbo].[natonull1]
as
BEGIN
update [dbo].[MergeData4_manju] set [dol] = NULL where dol='NA'
update [dbo].[MergeData4_manju] set dol_ly = null where dol_ly ='NA'
update [dbo].[MergeData4_manju] set dol_no_merch = null where dol_no_merch='NA'
update [dbo].[MergeData4_manju] set [Dol_No_merch_LY] = null where [Dol_No_merch_LY]='NA'
update [dbo].[MergeData4_manju] set [Base_Dol] = null where [Base_Dol]='NA'
update [dbo].[MergeData4_manju] set [Base_Dol_LY] = null where [Base_Dol_LY]='NA'
update [dbo].[MergeData4_manju] set [ACV] = null where [ACV] ='NA'
update [dbo].[MergeData4_manju] set [ACV_LY] = null where [ACV_LY] ='NA'
update [dbo].[MergeData4_manju] set [Units] = null where [Units] ='NA'
update [dbo].[MergeData4_manju] set [Units_No_merch] = null where [Units_No_merch] ='NA'
update [dbo].[MergeData4_manju] set [Units_No_merch_LY] = null where [Units_No_merch_LY] ='NA'
update [dbo].[MergeData4_manju] set [Base_units] = null where [Base_units] ='NA'
update [dbo].[MergeData4_manju] set [Base_units_LY] = null where [Base_units_LY] ='NA'
update [dbo].[MergeData4_manju] set [Inc_Units] = null where [Inc_Units] ='NA'
update [dbo].[MergeData4_manju] set [Inc_Units_LY] = null where [Inc_Units_LY] ='NA'
END
GO
PRINT N'Creating [stage].[AccountAcceptance]'
GO
CREATE TABLE [stage].[AccountAcceptance]
(
[Month] [nvarchar] (50) NULL,
[Year] [int] NULL,
[Innovation_Name] [nvarchar] (50) NULL,
[Nat_Ship_Date] [datetime] NULL,
[Early_ship_Ind] [nvarchar] (10) NULL,
[Category] [nvarchar] (50) NULL,
[Launch_Type] [nvarchar] (50) NULL,
[SKU] [nvarchar] (50) NULL,
[Prod_Desc] [nvarchar] (50) NULL,
[Retailer] [nvarchar] (50) NULL,
[Food] [float] NULL,
[Updloaded_By] [nvarchar] (25) NULL CONSTRAINT [DF__AccountAc__Updlo__208CD6FA] DEFAULT (user_name()),
[Updated_Date] [date] NULL CONSTRAINT [DF__AccountAc__Updat__2180FB33] DEFAULT (getdate())
)
GO
PRINT N'Creating [cleansed].[AccountAcceptance]'
GO
CREATE TABLE [cleansed].[AccountAcceptance]
(
[Month] [nvarchar] (50) NULL,
[Year] [int] NULL,
[Innovation_Name] [nvarchar] (50) NULL,
[Nat_Ship_Date] [datetime] NULL,
[Early_ship_Ind] [nvarchar] (10) NULL,
[Category] [nvarchar] (50) NULL,
[Launch_Type] [nvarchar] (50) NULL,
[SKU] [nvarchar] (50) NULL,
[Prod_Desc] [nvarchar] (50) NULL,
[Retailer] [nvarchar] (50) NULL,
[Food] [float] NULL,
[Updloaded_By] [nvarchar] (25) NULL CONSTRAINT [DF__AccountAc__Updlo__236943A5] DEFAULT (user_name()),
[Updated_Date] [date] NULL CONSTRAINT [DF__AccountAc__Updat__245D67DE] DEFAULT (getdate())
)
GO
PRINT N'Creating [dbo].[Clean_Forecast_AccountAcceptance_1]'
GO
-- =============================================
-- Author:      <Author, , Name>
-- Create Date: <Create Date, , >
-- Description: <Description, , >
-- =============================================
Create PROCEDURE [dbo].[Clean_Forecast_AccountAcceptance_1]
--(
    ---- Add the parameters for the stored procedure here
    --<@Param1, sysname, @p1> <Datatype_For_Param1, , int> = <Default_Value_For_Param1, , 0>,
    --<@Param2, sysname, @p2> <Datatype_For_Param2, , int> = <Default_Value_For_Param2, , 0>
--)
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON

    -- Insert statements for procedure here
	TRUNCATE TABLE [cleansed].[AccountAcceptance]


INSERT INTO [cleansed].[AccountAcceptance]
([Month]
      ,[Year]
      ,[Innovation_Name]
      ,[Nat_Ship_Date]
      ,[Early_ship_Ind]
      ,[Category]
      ,[Launch_Type]
      ,[SKU]
      ,[Prod_Desc]
      ,[Retailer]
      ,[Food]
      ,[Updloaded_By]
      ,[Updated_Date])
SELECT SAA.[Month]
      ,SAA.[Year]
      ,SAA.[Innovation_Name]
      ,SAA.[Nat_Ship_Date]
      ,SAA.[Early_ship_Ind]
      ,SAA.[Category]
      ,SAA.[Launch_Type]
      ,SAA.[SKU]
      ,SAA.[Prod_Desc]
      ,SAA.[Retailer]
      ,SAA.[Food]
      ,SAA.[Updloaded_By]
      ,SAA.[Updated_Date]
  FROM [stage].[AccountAcceptance] AS SAA

END
GO
PRINT N'Creating [stage].[SAP_COPA]'
GO
CREATE TABLE [stage].[SAP_COPA]
(
[Fiscal_Year_Period] [nvarchar] (50) NULL,
[Highest_Parent] [nvarchar] (50) NULL,
[Highest_Parent_Name] [nvarchar] (50) NULL,
[Finance_TM1_Brand] [nvarchar] (50) NULL,
[Finance_TM1_Brand Name] [nvarchar] (50) NULL,
[TPM_PPG] [nvarchar] (50) NULL,
[Material] [nvarchar] (50) NULL,
[Material_Description] [nvarchar] (50) NULL,
[EAN_UPC] [nvarchar] (50) NULL,
[EAN_Number_Type] [nvarchar] (50) NULL,
[Reporting_UPC_Code] [nvarchar] (50) NULL,
[Reporting_UPC_Code_Description] [nvarchar] (50) NULL,
[UPC_Code_12_Digits_] [nvarchar] (50) NULL,
[TPM_Plan_Customer] [nvarchar] (50) NULL,
[TPM_Plan_Customer_Name] [nvarchar] (50) NULL,
[Finance_TM1_Product_Group] [nvarchar] (50) NULL,
[Finance_TM1_Product_Group Name] [nvarchar] (50) NULL,
[TPM_Prod_Category] [nvarchar] (50) NULL,
[Profit_Center] [nvarchar] (50) NULL,
[Profit_Center_Name] [nvarchar] (50) NULL,
[Fiscal_year] [nvarchar] (4) NULL,
[Business_Segment] [nvarchar] (50) NULL,
[Business_Segment_name] [nvarchar] (50) NULL,
[Gross_Sales_Volume_Alt_UOM] [float] NULL,
[Gross_Sales_Amount] [float] NULL,
[Updloaded_By] [nvarchar] (25) NULL CONSTRAINT [DF__SAP_COPA__Updloa__2A164134] DEFAULT (user_name()),
[Updated_Date] [date] NULL CONSTRAINT [DF__SAP_COPA__Update__2B0A656D] DEFAULT (getdate())
)
GO
PRINT N'Creating [cleansed].[SAP_COPA]'
GO
CREATE TABLE [cleansed].[SAP_COPA]
(
[Fiscal_Year_Period] [nvarchar] (50) NULL,
[Highest_Parent] [nvarchar] (50) NULL,
[Highest_Parent_Name] [nvarchar] (50) NULL,
[Finance_TM1_Brand] [nvarchar] (50) NULL,
[Finance_TM1_Brand Name] [nvarchar] (50) NULL,
[TPM_PPG] [nvarchar] (50) NULL,
[Material] [nvarchar] (50) NULL,
[Material_Description] [nvarchar] (50) NULL,
[EAN_UPC] [nvarchar] (50) NULL,
[EAN_Number_Type] [nvarchar] (50) NULL,
[Reporting_UPC_Code] [nvarchar] (50) NULL,
[Reporting_UPC_Code_Description] [nvarchar] (50) NULL,
[UPC_Code_12_Digits_] [nvarchar] (50) NULL,
[TPM_Plan_Customer] [nvarchar] (50) NULL,
[TPM_Plan_Customer_Name] [nvarchar] (50) NULL,
[Finance_TM1_Product_Group] [nvarchar] (50) NULL,
[Finance_TM1_Product_Group Name] [nvarchar] (50) NULL,
[TPM_Prod_Category] [nvarchar] (50) NULL,
[Profit_Center] [nvarchar] (50) NULL,
[Profit_Center_Name] [nvarchar] (50) NULL,
[Fiscal_year] [nvarchar] (4) NULL,
[Business_Segment] [nvarchar] (50) NULL,
[Business_Segment_name] [nvarchar] (50) NULL,
[Gross_Sales_Volume_Alt_UOM] [float] NULL,
[Gross_Sales_Amount] [float] NULL,
[Updloaded_By] [nvarchar] (25) NULL CONSTRAINT [DF__SAP_COPA__Updloa__2CF2ADDF] DEFAULT (user_name()),
[Updated_Date] [date] NULL CONSTRAINT [DF__SAP_COPA__Update__2DE6D218] DEFAULT (getdate())
)
GO
PRINT N'Creating [dbo].[Clean_SAP_COPA_1]'
GO
-- =============================================
-- Author:      <Author, , Name>
-- Create Date: <Create Date, , >
-- Description: <Description, , >
-- =============================================
Create PROCEDURE [dbo].[Clean_SAP_COPA_1]
--(
    ---- Add the parameters for the stored procedure here
    --<@Param1, sysname, @p1> <Datatype_For_Param1, , int> = <Default_Value_For_Param1, , 0>,
    --<@Param2, sysname, @p2> <Datatype_For_Param2, , int> = <Default_Value_For_Param2, , 0>
--)
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON

    -- Insert statements for procedure here
	TRUNCATE TABLE [cleansed].[SAP_COPA]


INSERT INTO [cleansed].[SAP_COPA]
([Fiscal_Year_Period]
      ,[Highest_Parent]
      ,[Highest_Parent_Name]
      ,[Finance_TM1_Brand]
      ,[Finance_TM1_Brand Name]
      ,[TPM_PPG]
      ,[Material]
      ,[Material_Description]
      ,[EAN_UPC]
      ,[EAN_Number_Type]
      ,[Reporting_UPC_Code]
      ,[Reporting_UPC_Code_Description]
      ,[UPC_Code_12_Digits_]
      ,[TPM_Plan_Customer]
      ,[TPM_Plan_Customer_Name]
      ,[Finance_TM1_Product_Group]
      ,[Finance_TM1_Product_Group Name]
      ,[TPM_Prod_Category]
      ,[Profit_Center]
      ,[Profit_Center_Name]
      ,[Fiscal_year]
      ,[Business_Segment]
      ,[Business_Segment_name]
      ,[Gross_Sales_Volume_Alt_UOM]
      ,[Gross_Sales_Amount]
      ,[Updloaded_By]
      ,[Updated_Date])

SELECT [Fiscal_Year_Period]
      ,[Highest_Parent]
      ,[Highest_Parent_Name]
      ,[Finance_TM1_Brand]
      ,[Finance_TM1_Brand Name]
      ,[TPM_PPG]
      ,[Material]
      ,[Material_Description]
      ,[EAN_UPC]
      ,[EAN_Number_Type]
      ,[Reporting_UPC_Code]
      ,[Reporting_UPC_Code_Description]
      ,[UPC_Code_12_Digits_]
      ,[TPM_Plan_Customer]
      ,[TPM_Plan_Customer_Name]
      ,[Finance_TM1_Product_Group]
      ,[Finance_TM1_Product_Group Name]
      ,[TPM_Prod_Category]
      ,[Profit_Center]
      ,[Profit_Center_Name]
      ,[Fiscal_year]
      ,[Business_Segment]
      ,[Business_Segment_name]
      ,[Gross_Sales_Volume_Alt_UOM]
      ,[Gross_Sales_Amount]
      ,[Updloaded_By]
      ,[Updated_Date]
  FROM [stage].[SAP_COPA]

END
GO
PRINT N'Creating [stage].[Planning_Customer]'
GO
CREATE TABLE [stage].[Planning_Customer]
(
[Account] [nvarchar] (50) NULL,
[Account_Number] [nvarchar] (50) NULL,
[Updloaded_By] [nvarchar] (25) NULL CONSTRAINT [DF__Planning___Updlo__3E1D39E1] DEFAULT (user_name()),
[Updated_Date] [date] NULL CONSTRAINT [DF__Planning___Updat__3F115E1A] DEFAULT (getdate())
)
GO
PRINT N'Creating [cleansed].[Planning_Customer]'
GO
CREATE TABLE [cleansed].[Planning_Customer]
(
[Account] [nvarchar] (50) NULL,
[Account_Number] [nvarchar] (50) NULL,
[Updloaded_By] [nvarchar] (25) NULL CONSTRAINT [DF__Planning___Updlo__3A4CA8FD] DEFAULT (user_name()),
[Updated_Date] [date] NULL CONSTRAINT [DF__Planning___Updat__3B40CD36] DEFAULT (getdate())
)
GO
PRINT N'Creating [dbo].[Clean_Forecast_Planning_Customer_1]'
GO
-- =============================================
-- Author:      <Author, , Name>
-- Create Date: <Create Date, , >
-- Description: <Description, , >
-- =============================================
Create PROCEDURE [dbo].[Clean_Forecast_Planning_Customer_1]
--(
    ---- Add the parameters for the stored procedure here
    --<@Param1, sysname, @p1> <Datatype_For_Param1, , int> = <Default_Value_For_Param1, , 0>,
    --<@Param2, sysname, @p2> <Datatype_For_Param2, , int> = <Default_Value_For_Param2, , 0>
--)
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON

    -- Insert statements for procedure here
	TRUNCATE TABLE [cleansed].[Planning_Customer]


INSERT INTO [cleansed].[Planning_Customer]
([Account]
	,[Account_Number]
      ,[Updloaded_By]
      ,[Updated_Date])
SELECT 
	[Account]
	,[Account_Number]
      ,[Updloaded_By]
      ,[Updated_Date]
  FROM [stage].[Planning_Customer]

END
GO
PRINT N'Creating [cleansed].[iri_weekly]'
GO
CREATE TABLE [cleansed].[iri_weekly]
(
[Product] [nvarchar] (500) NULL,
[Time] [nvarchar] (500) NULL,
[Geog] [nvarchar] (500) NULL,
[Dol] [nvarchar] (500) NULL,
[Dol_LY] [float] NULL,
[Dol_No_merch] [float] NULL,
[Dol_No_merch_LY] [float] NULL,
[Base_Dol] [float] NULL,
[Base_Dol_LY] [float] NULL,
[ACV] [float] NULL,
[ACV_LY] [float] NULL,
[Units] [float] NULL,
[Units_LY] [float] NULL,
[Units_No_merch] [float] NULL,
[Units_No_merch_LY] [float] NULL,
[Base_units] [float] NULL,
[Base_units_LY] [float] NULL,
[Inc_Units] [float] NULL,
[Inc_Units_LY] [float] NULL,
[Parent_Co] [nvarchar] (500) NULL,
[Major_Brand] [nvarchar] (500) NULL,
[Brand] [nvarchar] (500) NULL,
[Category] [nvarchar] (500) NULL,
[Sub_Category] [nvarchar] (500) NULL,
[Segment] [nvarchar] (500) NULL,
[Sub_Segment] [nvarchar] (500) NULL,
[Volume_Eq] [float] NULL,
[upc] [float] NULL,
[date] [datetime2] NULL,
[iri_week_ending] [datetime2] NULL,
[iri_week_starting] [datetime2] NULL,
[Geog2] [nvarchar] (500) NULL,
[Updloaded_By] [nvarchar] (25) NULL CONSTRAINT [DF__iri_weekl__Updlo__06CD04F7] DEFAULT (user_name()),
[Updated_Date] [date] NULL CONSTRAINT [DF__iri_weekl__Updat__07C12930] DEFAULT (getdate())
)
GO
PRINT N'Creating [dbo].[GaryAccountAcceptance]'
GO
CREATE TABLE [dbo].[GaryAccountAcceptance]
(
[Month] [nvarchar] (50) NULL,
[Year] [int] NULL,
[Innovation_Name] [nvarchar] (50) NULL,
[Nat_Ship_Date] [datetime] NULL,
[Early_ship_Ind] [nvarchar] (10) NULL,
[Category] [nvarchar] (50) NULL,
[Launch Type] [nvarchar] (50) NULL,
[SKU] [nvarchar] (50) NULL,
[Prod_Desc] [nvarchar] (50) NULL,
[Retailer] [nvarchar] (50) NULL,
[Food] [float] NULL,
[Uploaded_by] [nvarchar] (50) NULL,
[Upload_date] [datetime] NULL
)
GO
PRINT N'Creating [dbo].[Gary_SAP_COPA]'
GO
CREATE TABLE [dbo].[Gary_SAP_COPA]
(
[Fiscal Year / Period] [nvarchar] (50) NULL,
[Highest Parent] [nvarchar] (50) NULL,
[Highest Parent Name] [nvarchar] (50) NULL,
[Finance (TM1) Brand] [nvarchar] (50) NULL,
[Finance (TM1) Brand Name] [nvarchar] (50) NULL,
[TPM PPG] [nvarchar] (50) NULL,
[Material] [nvarchar] (50) NULL,
[Material Description] [nvarchar] (50) NULL,
[EAN/UPC] [nvarchar] (50) NULL,
[EAN Number Type] [nvarchar] (50) NULL,
[Reporting UPC Code] [nvarchar] (50) NULL,
[Reporting UPC Code Description] [nvarchar] (50) NULL,
[UPC Code (12 Digits)] [nvarchar] (50) NULL,
[TPM Plan Customer] [nvarchar] (50) NULL,
[TPM Plan Customer Name] [nvarchar] (50) NULL,
[Finance (TM1) Product Group] [nvarchar] (50) NULL,
[Finance (TM1) Product Group Name] [nvarchar] (50) NULL,
[TPM Prod Category] [nvarchar] (50) NULL,
[Profit Center] [nvarchar] (50) NULL,
[Profit Center Name] [nvarchar] (50) NULL,
[Fiscal year] [nvarchar] (4) NULL,
[Business Segment] [nvarchar] (50) NULL,
[Business Segment name] [nvarchar] (50) NULL,
[Gross Sales Volume (Alt UOM)] [float] NULL,
[Gross Sales Amount] [float] NULL,
[Updloaded By] [nvarchar] (25) NULL,
[Updated Date] [date] NULL
)
GO
PRINT N'Creating [dbo].[MergeData2_harsh]'
GO
CREATE TABLE [dbo].[MergeData2_harsh]
(
[Product] [nvarchar] (500) NULL,
[Time] [nvarchar] (500) NULL,
[Geog] [nvarchar] (500) NULL,
[Dol] [float] NULL,
[Dol_LY] [float] NULL,
[Dol_No_merch] [float] NULL,
[Dol_No_merch_LY] [float] NULL,
[Base_Dol] [float] NULL,
[Base_Dol_LY] [float] NULL,
[ACV] [float] NULL,
[ACV_LY] [float] NULL,
[Units] [float] NULL,
[Units_LY] [float] NULL,
[Units_No_merch] [float] NULL,
[Units_No_merch_LY] [float] NULL,
[Base_units] [float] NULL,
[Base_units_LY] [float] NULL,
[Inc_Units] [float] NULL,
[Inc_Units_LY] [float] NULL,
[Parent_Co] [nvarchar] (500) NULL,
[Major_Brand] [nvarchar] (500) NULL,
[Brand] [nvarchar] (500) NULL,
[Category] [nvarchar] (500) NULL,
[Sub_Category] [nvarchar] (500) NULL,
[Segment] [nvarchar] (500) NULL,
[Sub_Segment] [nvarchar] (500) NULL,
[Volume_Eq] [float] NULL,
[upc] [nvarchar] (500) NULL,
[date] [datetime2] NULL,
[iri_week_ending] [datetime2] NULL,
[iri_week_starting] [datetime2] NULL,
[Geog2] [nvarchar] (500) NULL
)
GO
PRINT N'Creating [dbo].[MergeData3_harsh]'
GO
CREATE TABLE [dbo].[MergeData3_harsh]
(
[Product] [nvarchar] (500) NULL,
[Time] [nvarchar] (500) NULL,
[Geog] [nvarchar] (500) NULL,
[Dol] [float] NULL,
[Dol_LY] [float] NULL,
[Dol_No_merch] [float] NULL,
[Dol_No_merch_LY] [float] NULL,
[Base_Dol] [float] NULL,
[Base_Dol_LY] [float] NULL,
[ACV] [float] NULL,
[ACV_LY] [float] NULL,
[Units] [float] NULL,
[Units_LY] [float] NULL,
[Units_No_merch] [float] NULL,
[Units_No_merch_LY] [float] NULL,
[Base_units] [float] NULL,
[Base_units_LY] [float] NULL,
[Inc_Units] [float] NULL,
[Inc_Units_LY] [float] NULL,
[Parent_Co] [nvarchar] (500) NULL,
[Major_Brand] [nvarchar] (500) NULL,
[Brand] [nvarchar] (500) NULL,
[Category] [nvarchar] (500) NULL,
[Sub_Category] [nvarchar] (500) NULL,
[Segment] [nvarchar] (500) NULL,
[Sub_Segment] [nvarchar] (500) NULL,
[Volume_Eq] [float] NULL,
[upc] [float] NULL,
[date] [datetime2] NULL,
[iri_week_ending] [datetime2] NULL,
[iri_week_starting] [datetime2] NULL,
[Geog2] [nvarchar] (500) NULL
)
GO
PRINT N'Creating [dbo].[MergeData4B]'
GO
CREATE TABLE [dbo].[MergeData4B]
(
[Product] [varchar] (1000) NULL,
[Time] [varchar] (50) NULL,
[Geog] [varchar] (50) NULL,
[Dol] [varchar] (50) NULL,
[Dol_LY] [varchar] (50) NULL,
[Dol_No_merch] [varchar] (50) NULL,
[Dol_No_merch_LY] [varchar] (50) NULL,
[Base_Dol] [varchar] (50) NULL,
[Base_Dol_LY] [varchar] (50) NULL,
[ACV] [varchar] (50) NULL,
[ACV_LY] [varchar] (50) NULL,
[Units] [varchar] (50) NULL,
[Units_LY] [varchar] (50) NULL,
[Units_No_merch] [varchar] (50) NULL,
[Units_No_merch_LY] [varchar] (50) NULL,
[Base_units] [varchar] (50) NULL,
[Base_units_LY] [varchar] (50) NULL,
[Inc_Units] [varchar] (50) NULL,
[Inc_Units_LY] [varchar] (50) NULL,
[Parent_Co] [varchar] (50) NULL,
[Major_Brand] [varchar] (50) NULL,
[Brand] [varchar] (50) NULL,
[Category] [varchar] (50) NULL,
[Sub_Category] [varchar] (50) NULL,
[Segment] [varchar] (50) NULL,
[Sub_Segment] [varchar] (50) NULL,
[Volume_Eq] [varchar] (50) NULL,
[upc] [varchar] (50) NULL,
[date] [varchar] (50) NULL,
[iri_week_ending] [varchar] (50) NULL,
[iri_week_starting] [varchar] (50) NULL,
[Geog2] [varchar] (50) NULL
)
GO
PRINT N'Creating [dbo].[MergeData4_harsh]'
GO
CREATE TABLE [dbo].[MergeData4_harsh]
(
[Product] [nvarchar] (500) NULL,
[Time] [nvarchar] (500) NULL,
[Geog] [nvarchar] (500) NULL,
[Dol] [nvarchar] (500) NULL,
[Dol_LY] [nvarchar] (500) NULL,
[Dol_No_merch] [nvarchar] (500) NULL,
[Dol_No_merch_LY] [nvarchar] (500) NULL,
[Base_Dol] [nvarchar] (500) NULL,
[Base_Dol_LY] [nvarchar] (500) NULL,
[ACV] [nvarchar] (500) NULL,
[ACV_LY] [nvarchar] (500) NULL,
[Units] [nvarchar] (500) NULL,
[Units_LY] [nvarchar] (500) NULL,
[Units_No_merch] [nvarchar] (500) NULL,
[Units_No_merch_LY] [nvarchar] (500) NULL,
[Base_units] [nvarchar] (500) NULL,
[Base_units_LY] [nvarchar] (500) NULL,
[Inc_Units] [nvarchar] (500) NULL,
[Inc_Units_LY] [nvarchar] (500) NULL,
[Parent_Co] [nvarchar] (500) NULL,
[Major_Brand] [nvarchar] (500) NULL,
[Brand] [nvarchar] (500) NULL,
[Category] [nvarchar] (500) NULL,
[Sub_Category] [nvarchar] (500) NULL,
[Segment] [nvarchar] (500) NULL,
[Sub_Segment] [nvarchar] (500) NULL,
[Volume_Eq] [float] NULL,
[upc] [float] NULL,
[date] [datetime2] NULL,
[iri_week_ending] [datetime2] NULL,
[iri_week_starting] [datetime2] NULL,
[Geog2] [nvarchar] (500) NULL
)
GO
PRINT N'Creating [dbo].[MergeData4_marcus]'
GO
CREATE TABLE [dbo].[MergeData4_marcus]
(
[Product] [nvarchar] (500) NULL,
[Time] [nvarchar] (500) NULL,
[Geog] [nvarchar] (500) NULL,
[Dol] [nvarchar] (500) NULL,
[Dol_LY] [nvarchar] (500) NULL,
[Dol_No_merch] [nvarchar] (500) NULL,
[Dol_No_merch_LY] [nvarchar] (500) NULL,
[Base_Dol] [nvarchar] (500) NULL,
[Base_Dol_LY] [nvarchar] (500) NULL,
[ACV] [nvarchar] (500) NULL,
[ACV_LY] [nvarchar] (500) NULL,
[Units] [nvarchar] (500) NULL,
[Units_LY] [nvarchar] (500) NULL,
[Units_No_merch] [nvarchar] (500) NULL,
[Units_No_merch_LY] [nvarchar] (500) NULL,
[Base_units] [nvarchar] (500) NULL,
[Base_units_LY] [nvarchar] (500) NULL,
[Inc_Units] [nvarchar] (500) NULL,
[Inc_Units_LY] [nvarchar] (500) NULL,
[Parent_Co] [nvarchar] (500) NULL,
[Major_Brand] [nvarchar] (500) NULL,
[Brand] [nvarchar] (500) NULL,
[Category] [nvarchar] (500) NULL,
[Sub_Category] [nvarchar] (500) NULL,
[Segment] [nvarchar] (500) NULL,
[Sub_Segment] [nvarchar] (500) NULL,
[Volume_Eq] [float] NULL,
[upc] [float] NULL,
[date] [datetime2] NULL,
[iri_week_ending] [datetime2] NULL,
[iri_week_starting] [datetime2] NULL,
[Geog2] [nvarchar] (500) NULL
)
GO
PRINT N'Creating [dbo].[MergeData_stage]'
GO
CREATE TABLE [dbo].[MergeData_stage]
(
[Product] [nvarchar] (500) NULL,
[Time] [nvarchar] (500) NULL,
[Geog] [nvarchar] (500) NULL,
[Dol] [nvarchar] (500) NULL,
[Dol_LY] [float] NULL,
[Dol_No_merch] [float] NULL,
[Dol_No_merch_LY] [float] NULL,
[Base_Dol] [float] NULL,
[Base_Dol_LY] [float] NULL,
[ACV] [float] NULL,
[ACV_LY] [float] NULL,
[Units] [float] NULL,
[Units_LY] [float] NULL,
[Units_No_merch] [float] NULL,
[Units_No_merch_LY] [float] NULL,
[Base_units] [float] NULL,
[Base_units_LY] [float] NULL,
[Inc_Units] [float] NULL,
[Inc_Units_LY] [float] NULL,
[Parent_Co] [nvarchar] (500) NULL,
[Major_Brand] [nvarchar] (500) NULL,
[Brand] [nvarchar] (500) NULL,
[Category] [nvarchar] (500) NULL,
[Sub_Category] [nvarchar] (500) NULL,
[Segment] [nvarchar] (500) NULL,
[Sub_Segment] [nvarchar] (500) NULL,
[Volume_Eq] [float] NULL,
[upc] [float] NULL,
[date] [datetime2] NULL,
[iri_week_ending] [datetime2] NULL,
[iri_week_starting] [datetime2] NULL,
[Geog2] [nvarchar] (500) NULL
)
GO
PRINT N'Creating [dbo].[MergeData_stage_manju1]'
GO
CREATE TABLE [dbo].[MergeData_stage_manju1]
(
[Product] [nvarchar] (500) NULL,
[Time] [nvarchar] (500) NULL,
[Geog] [nvarchar] (500) NULL,
[Dol] [nvarchar] (500) NULL,
[Dol_LY] [float] NULL,
[Dol_No_merch] [float] NULL,
[Dol_No_merch_LY] [float] NULL,
[Base_Dol] [float] NULL,
[Base_Dol_LY] [float] NULL,
[ACV] [float] NULL,
[ACV_LY] [float] NULL,
[Units] [float] NULL,
[Units_LY] [float] NULL,
[Units_No_merch] [float] NULL,
[Units_No_merch_LY] [float] NULL,
[Base_units] [float] NULL,
[Base_units_LY] [float] NULL,
[Inc_Units] [float] NULL,
[Inc_Units_LY] [float] NULL,
[Parent_Co] [nvarchar] (500) NULL,
[Major_Brand] [nvarchar] (500) NULL,
[Brand] [nvarchar] (500) NULL,
[Category] [nvarchar] (500) NULL,
[Sub_Category] [nvarchar] (500) NULL,
[Segment] [nvarchar] (500) NULL,
[Sub_Segment] [nvarchar] (500) NULL,
[Volume_Eq] [float] NULL,
[upc] [float] NULL,
[date] [datetime2] NULL,
[iri_week_ending] [datetime2] NULL,
[iri_week_starting] [datetime2] NULL,
[Geog2] [nvarchar] (500) NULL
)
GO
PRINT N'Creating [dbo].[Table]'
GO
CREATE TABLE [dbo].[Table]
(
[Id] [int] NOT NULL,
[blob] [nchar] (10) NULL,
[random] [nchar] (10) NULL
)
GO
PRINT N'Creating primary key [PK__Table__3214EC073D3FAC59] on [dbo].[Table]'
GO
ALTER TABLE [dbo].[Table] ADD CONSTRAINT [PK__Table__3214EC073D3FAC59] PRIMARY KEY CLUSTERED  ([Id])
GO
PRINT N'Creating [dbo].[jirasource]'
GO
CREATE TABLE [dbo].[jirasource]
(
[Issue_Type] [nvarchar] (50) NOT NULL,
[Issue_key] [nvarchar] (50) NOT NULL,
[Issue_id] [int] NOT NULL,
[Parent_id] [int] NULL,
[Summary] [nvarchar] (200) NOT NULL,
[Assignee] [nvarchar] (50) NULL,
[Reporter] [nvarchar] (50) NOT NULL,
[Priority] [nvarchar] (50) NOT NULL,
[Status] [nvarchar] (50) NOT NULL,
[Resolution] [nvarchar] (50) NULL,
[Created] [datetime2] NOT NULL,
[Updated] [datetime2] NOT NULL,
[Due_Date] [nvarchar] (50) NULL,
[Component_s] [nvarchar] (100) NOT NULL,
[Component_s2] [nvarchar] (50) NOT NULL,
[Component_s3] [nvarchar] (50) NOT NULL,
[Component_s4] [nvarchar] (50) NOT NULL,
[Sprint] [nvarchar] (50) NOT NULL,
[Sprint5] [nvarchar] (50) NOT NULL,
[Sprint6] [nvarchar] (50) NOT NULL,
[Resolved] [datetime2] NULL,
[Custom_field__Story_Points_] [nvarchar] (1) NULL
)
GO
PRINT N'Creating [dbo].[rodiri]'
GO
CREATE TABLE [dbo].[rodiri]
(
[Product] [nvarchar] (500) NULL,
[Time] [nvarchar] (500) NULL,
[Geog] [nvarchar] (500) NULL,
[Dol] [float] NULL,
[DolLY] [float] NULL,
[DolNomerch] [float] NULL,
[DolNomerchLY] [float] NULL,
[BaseDol] [float] NULL,
[BaseDolLY] [float] NULL,
[ACV] [float] NULL,
[ACVLY] [float] NULL,
[Units] [float] NULL,
[UnitsLY] [float] NULL,
[UnitsNomerch] [float] NULL,
[UnitsNomerchLY] [float] NULL,
[Baseunits] [float] NULL,
[BaseunitsLY] [float] NULL,
[IncUnits] [float] NULL,
[IncUnitsLY] [float] NULL,
[ParentCo] [nvarchar] (500) NULL,
[MajorBrand] [nvarchar] (500) NULL,
[Brand] [nvarchar] (500) NULL,
[Category] [nvarchar] (500) NULL,
[SubCategory] [nvarchar] (500) NULL,
[Segment] [nvarchar] (500) NULL,
[SubSegment] [nvarchar] (500) NULL,
[VolumeEq] [float] NULL,
[upc] [nvarchar] (500) NULL,
[date] [datetime2] NULL,
[iriweekending] [datetime2] NULL,
[iriweekstarting] [datetime2] NULL,
[Geog2] [nvarchar] (500) NULL,
[Updloaded_By] [nvarchar] (25) NULL CONSTRAINT [DF__rodiri__Updloade__03F0984C] DEFAULT (user_name()),
[Updated_Date] [date] NULL CONSTRAINT [DF__rodiri__Updated___04E4BC85] DEFAULT (getdate())
)
GO
PRINT N'Creating [dbo].[rodiri_bu]'
GO
CREATE TABLE [dbo].[rodiri_bu]
(
[_Product_] [nvarchar] (500) NULL,
[_Time_] [nvarchar] (500) NULL,
[_Geog_] [nvarchar] (500) NULL,
[_Dol_] [float] NULL,
[_Dol_LY_] [float] NULL,
[_Dol_No_merch_] [float] NULL,
[_Dol_No_merch_LY_] [float] NULL,
[_Base_Dol_] [float] NULL,
[_Base_Dol_LY_] [float] NULL,
[_ACV_] [float] NULL,
[_ACV_LY_] [float] NULL,
[_Units_] [float] NULL,
[_Units_LY_] [float] NULL,
[_Units_No_merch_] [float] NULL,
[_Units_No_merch_LY_] [float] NULL,
[_Base_units_] [float] NULL,
[_Base_units_LY_] [float] NULL,
[_Inc_Units_] [float] NULL,
[_Inc_Units_LY_] [float] NULL,
[_Parent_Co_] [nvarchar] (500) NULL,
[_Major_Brand_] [nvarchar] (500) NULL,
[_Brand_] [nvarchar] (500) NULL,
[_Category_] [nvarchar] (500) NULL,
[_Sub_Category_] [nvarchar] (500) NULL,
[_Segment_] [nvarchar] (500) NULL,
[_Sub_Segment_] [nvarchar] (500) NULL,
[_Volume_Eq_] [float] NULL,
[_upc_] [nvarchar] (500) NULL,
[_date_] [datetime2] NULL,
[_iri_week_ending_] [datetime2] NULL,
[_iri_week_starting_] [datetime2] NULL,
[_Geog2_] [nvarchar] (500) NULL
)
GO
PRINT N'Creating [dbo].[sprintdates]'
GO
CREATE TABLE [dbo].[sprintdates]
(
[Sprint] [nvarchar] (50) NOT NULL,
[Date] [datetime2] NOT NULL
)
GO
