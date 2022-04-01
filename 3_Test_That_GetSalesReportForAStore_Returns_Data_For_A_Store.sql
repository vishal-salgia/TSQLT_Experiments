USE [BikeStores]
GO

/****** Object:  StoredProcedure [testBikesStore].[test that GetSalesReportForAStore reurns data for a store]    Script Date: 4/1/2022 3:11:57 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

EXEC tSQLt.NewTestClass 'testBikesStore';
GO

Create Or Alter   Procedure [testBikesStore].[test that GetSalesReportForAStore returns data for a store] 
AS
BEGIN

Declare @CaptureTable Table(product_id int, product_name nvarchar(255), customer_Id int, first_Name nvarchar(255), last_Name nvarchar(255), order_id int, Sales decimal, store_name nvarchar(255))

DECLARE @actual as int
declare @expected as int

insert into @CaptureTable
EXEC	[dbo].[GetSalesReportForAStore]
		@storeId = 1

SELECT	@actual = count(1)from @CaptureTable
SET	@expected = 1006

EXEC tSQLt.AssertEquals @expected, @actual;

END
GO


