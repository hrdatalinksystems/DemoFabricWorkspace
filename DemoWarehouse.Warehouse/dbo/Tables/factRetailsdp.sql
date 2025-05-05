CREATE TABLE [dbo].[factRetailsdp] (

	[order_id] bigint NULL, 
	[order_date] date NULL, 
	[item_id] bigint NULL, 
	[unit_price] decimal(38,18) NULL, 
	[qty] bigint NULL, 
	[discount_percent] float NULL, 
	[unit_cost] float NULL, 
	[gross_amt] decimal(38,6) NULL, 
	[discount_amt] float NULL, 
	[net_amt] float NULL, 
	[COGS_amt] float NULL, 
	[delivery_date] date NULL, 
	[loc_id] bigint NULL, 
	[order_type] varchar(8000) NULL, 
	[payment_method_id] bigint NULL, 
	[customer_id] bigint NULL
);