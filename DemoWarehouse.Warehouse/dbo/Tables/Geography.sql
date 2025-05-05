CREATE TABLE [dbo].[Geography] (

	[CityId] bigint NULL, 
	[City] varchar(8000) NULL, 
	[State] varchar(8000) NULL
);


GO
ALTER TABLE [dbo].[Geography] ADD CONSTRAINT UQ_04d84f16_e030_4ba7_acc0_e414682d242c unique NONCLUSTERED ([CityId]);