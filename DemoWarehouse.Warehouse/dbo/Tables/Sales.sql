CREATE TABLE [dbo].[Sales] (

	[OrderNo] bigint NULL, 
	[ItemID] bigint NULL, 
	[SalesDate] date NULL, 
	[DeilveryDate] date NULL, 
	[CustomerId] bigint NULL, 
	[CityId] bigint NULL, 
	[Qty] bigint NULL, 
	[Price] bigint NULL, 
	[cost] bigint NULL, 
	[DiscountPercent] bigint NULL, 
	[Gross Amount] float NULL, 
	[COGS Amount] float NULL, 
	[DiscountAmount] float NULL
);


GO
ALTER TABLE [dbo].[Sales] ADD CONSTRAINT FK_1ac13f85_2ad3_40fe_964b_bd617f991f84 FOREIGN KEY ([CustomerId]) REFERENCES [dbo].[Customer]([CustomerId]);
GO
ALTER TABLE [dbo].[Sales] ADD CONSTRAINT FK_55fc6da5_8c97_47ab_825e_bbcb2600e513 FOREIGN KEY ([ItemID]) REFERENCES [dbo].[Item]([ItemId]);
GO
ALTER TABLE [dbo].[Sales] ADD CONSTRAINT FK_f9d13a96_f695_4d8e_a625_bdf1d2b33a3a FOREIGN KEY ([CityId]) REFERENCES [dbo].[Geography]([CityId]);