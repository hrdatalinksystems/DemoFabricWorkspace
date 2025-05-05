CREATE TABLE [dbo].[retaildp] (

	[order_id] bigint NULL, 
	[order_date] date NULL, 
	[item_id] bigint NULL, 
	[category] varchar(8000) NULL, 
	[sub_category] varchar(8000) NULL, 
	[sub_sub_category] varchar(8000) NULL, 
	[brand] varchar(8000) NULL, 
	[unit_price] decimal(38,18) NULL, 
	[qty] bigint NULL, 
	[discount_percent] float NULL, 
	[unit_cost] float NULL, 
	[delivery_date] date NULL, 
	[city] varchar(8000) NULL, 
	[state] varchar(8000) NULL, 
	[loc_id] bigint NULL, 
	[order_type] varchar(8000) NULL, 
	[payment_method] varchar(8000) NULL, 
	[customer_id] bigint NULL
);