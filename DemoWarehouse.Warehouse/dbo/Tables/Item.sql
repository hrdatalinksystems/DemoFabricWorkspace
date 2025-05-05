CREATE TABLE [dbo].[Item] (

	[ItemId] bigint NULL, 
	[Name] varchar(8000) NULL, 
	[BrandId] bigint NULL, 
	[CategoryId] bigint NULL, 
	[SubCategoryId] bigint NULL, 
	[Brand] varchar(8000) NULL, 
	[Category] varchar(8000) NULL, 
	[SubCategory] varchar(8000) NULL
);


GO
ALTER TABLE [dbo].[Item] ADD CONSTRAINT UQ_c00a7fd3_d3f7_4e69_a410_21b9c133fd70 unique NONCLUSTERED ([ItemId]);