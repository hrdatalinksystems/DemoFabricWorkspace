CREATE TABLE [dbo].[Customer] (

	[CustomerId] bigint NULL, 
	[Age] bigint NULL, 
	[City] varchar(8000) NULL, 
	[State] varchar(8000) NULL, 
	[Name] varchar(8000) NULL
);


GO
ALTER TABLE [dbo].[Customer] ADD CONSTRAINT UQ_b2cb3b4b_25f9_4473_bea4_308ba566fda3 unique NONCLUSTERED ([CustomerId]);