/*
IF EXISTS (SELECT name FROM master.dbo.sysdatabases WHERE name = N'nsctren')
	DROP DATABASE [nsctren]
GO

CREATE DATABASE [nsctren]  ON (NAME = N'nsctren_Data', FILENAME = N'd:\Program Files\Microsoft SQL Server\MSSQL\data\nsctren_Data.MDF' , SIZE = 15, FILEGROWTH = 10%) LOG ON (NAME = N'nsctren_Log', FILENAME = N'd:\Program Files\Microsoft SQL Server\MSSQL\data\nsctren_Log.LDF' , SIZE = 7, FILEGROWTH = 10%)
 COLLATE SQL_Latin1_General_CP1_CI_AS
GO

exec sp_dboption N'nsctren', N'autoclose', N'false'
GO

exec sp_dboption N'nsctren', N'bulkcopy', N'false'
GO

exec sp_dboption N'nsctren', N'trunc. log', N'false'
GO

exec sp_dboption N'nsctren', N'torn page detection', N'true'
GO

exec sp_dboption N'nsctren', N'read only', N'false'
GO

exec sp_dboption N'nsctren', N'dbo use', N'false'
GO

exec sp_dboption N'nsctren', N'single', N'false'
GO

exec sp_dboption N'nsctren', N'autoshrink', N'false'
GO

exec sp_dboption N'nsctren', N'ANSI null default', N'false'
GO

exec sp_dboption N'nsctren', N'recursive triggers', N'false'
GO

exec sp_dboption N'nsctren', N'ANSI nulls', N'false'
GO

exec sp_dboption N'nsctren', N'concat null yields null', N'false'
GO

exec sp_dboption N'nsctren', N'cursor close on commit', N'false'
GO

exec sp_dboption N'nsctren', N'default to local cursor', N'false'
GO

exec sp_dboption N'nsctren', N'quoted identifier', N'false'
GO

exec sp_dboption N'nsctren', N'ANSI warnings', N'false'
GO

exec sp_dboption N'nsctren', N'auto create statistics', N'true'
GO

exec sp_dboption N'nsctren', N'auto update statistics', N'true'
GO

use [nsctren]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_tAccIW_tAccFile]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[tAccIW] DROP CONSTRAINT FK_tAccIW_tAccFile
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_tAccLightningData_tAccIW]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[tAccLightningData] DROP CONSTRAINT FK_tAccLightningData_tAccIW
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_tAccRadwayData_tAccIW]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[tAccRadwayData] DROP CONSTRAINT FK_tAccRadwayData_tAccIW
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_tAccRoadCondData_tAccIW]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[tAccRoadCondData] DROP CONSTRAINT FK_tAccRoadCondData_tAccIW
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_tAccSurfaceData_tAccIW]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[tAccSurfaceData] DROP CONSTRAINT FK_tAccSurfaceData_tAccIW
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_tAccTraficControl_tAccIW]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[tAccTraficControl] DROP CONSTRAINT FK_tAccTraficControl_tAccIW
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_tAccTraficData_tAccIW]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[tAccTraficData] DROP CONSTRAINT FK_tAccTraficData_tAccIW
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_tAccWatherData_tAccIW]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[tAccWeatherData] DROP CONSTRAINT FK_tAccWatherData_tAccIW
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_tAccOtherMovement_tAccOtherDriver]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[tAccOtherMovement] DROP CONSTRAINT FK_tAccOtherMovement_tAccOtherDriver
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_tAccFile_tAccident]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[tAccFile] DROP CONSTRAINT FK_tAccFile_tAccident
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_tHomeBase_tCompany]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[tHomeBase] DROP CONSTRAINT FK_tHomeBase_tCompany
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_tDQFAnnualReview_tDQFDoc]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[tDQFAnnualReview] DROP CONSTRAINT FK_tDQFAnnualReview_tDQFDoc
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_tDQFDisq383_tDQFDoc]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[tDQFDisq383] DROP CONSTRAINT FK_tDQFDisq383_tDQFDoc
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_tDQFDisq391_tDQFDoc]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[tDQFDisq391] DROP CONSTRAINT FK_tDQFDisq391_tDQFDoc
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_tFaxRequest_tDQFDoc]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[tFaxRequest] DROP CONSTRAINT FK_tFaxRequest_tDQFDoc
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_tFile_tDriver]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[tFile] DROP CONSTRAINT FK_tFile_tDriver
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_tFile_tHomeBase]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[tFile] DROP CONSTRAINT FK_tFile_tHomeBase
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_tHBStaff_tHomeBase]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[tHBStaff] DROP CONSTRAINT FK_tHBStaff_tHomeBase
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_tTruckFile_tTruck]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[tTruckFile] DROP CONSTRAINT FK_tTruckFile_tTruck
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tAccFile]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tAccFile]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tAccIW]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tAccIW]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tAccInvolvedWith]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tAccInvolvedWith]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tAccLightningData]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tAccLightningData]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tAccNarrative]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tAccNarrative]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tAccNotes]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tAccNotes]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tAccOtherDriver]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tAccOtherDriver]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tAccOtherMovement]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tAccOtherMovement]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tAccOtherVehicle]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tAccOtherVehicle]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tAccPassanger]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tAccPassanger]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tAccRadwayData]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tAccRadwayData]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tAccRoadCondData]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tAccRoadCondData]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tAccSurfaceData]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tAccSurfaceData]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tAccTraficControl]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tAccTraficControl]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tAccTraficData]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tAccTraficData]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tAccTypeOfCollison]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tAccTypeOfCollison]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tAccWeatherData]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tAccWeatherData]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tAccWitness]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tAccWitness]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tAccident]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tAccident]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tActionDriver]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tActionDriver]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tActionSystem]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tActionSystem]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tActionSystemForFile]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tActionSystemForFile]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tActionUser]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tActionUser]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tAppCheck]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tAppCheck]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tCStaff]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tCStaff]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tCompany]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tCompany]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tCompanyDoc]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tCompanyDoc]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tCompanyDocList]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tCompanyDocList]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tDIW]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tDIW]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tDIWAccident]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tDIWAccident]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tDIWAddress]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tDIWAddress]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tDIWCDL]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tDIWCDL]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tDIWDataSheet]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tDIWDataSheet]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tDIWEmployer]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tDIWEmployer]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tDIWVehicle]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tDIWVehicle]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tDIWViolation]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tDIWViolation]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tDOTInspections]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tDOTInspections]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tDQFAnnualReview]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tDQFAnnualReview]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tDQFDisq383]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tDQFDisq383]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tDQFDisq391]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tDQFDisq391]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tDQFDoc]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tDQFDoc]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tDQFDocDOTCheck]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tDQFDocDOTCheck]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tDQFDocNSCCheck]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tDQFDocNSCCheck]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tDoc]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tDoc]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tDriver]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tDriver]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tDriverAccount]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tDriverAccount]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tDriversCrossSection]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tDriversCrossSection]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tDriversNoncomplientItemSum]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tDriversNoncomplientItemSum]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tFaxRequest]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tFaxRequest]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tFile]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tFile]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tHBStaff]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tHBStaff]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tHomeBase]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tHomeBase]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tHomeBaseLocations]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tHomeBaseLocations]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tInvoice]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tInvoice]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tInvoiceForHB]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tInvoiceForHB]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tInvoiceTruck]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tInvoiceTruck]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tInvoiceTruckForHB]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tInvoiceTruckForHB]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tLoginUrl]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tLoginUrl]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tMError]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tMError]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tNSCStaff]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tNSCStaff]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tSession]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tSession]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tSetup]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tSetup]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tTIW]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tTIW]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tTIWBITInspection]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tTIWBITInspection]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tTIWDISInspection]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tTIWDISInspection]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tTruck]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tTruck]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tTruckActionSystem]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tTruckActionSystem]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tTruckActionSystemForFile]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tTruckActionSystemForFile]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tTruckAppCheck]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tTruckAppCheck]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tTruckDoc]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tTruckDoc]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tTruckDriver]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tTruckDriver]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tTruckFile]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tTruckFile]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tTruckInspectionCompany]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tTruckInspectionCompany]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tTruckInspector]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tTruckInspector]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tTruckInspectorCertificate]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tTruckInspectorCertificate]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tTruckMaintenance]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tTruckMaintenance]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tTruckQFDoc]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tTruckQFDoc]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tUser]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tUser]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tVIW]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tVIW]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tVendor]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tVendor]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tVendorAppCheck]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tVendorAppCheck]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tVendorContract]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tVendorContract]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tVendorDoc]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tVendorDoc]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tVendorDriver]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tVendorDriver]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tVendorFile]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tVendorFile]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tVendorQFDoc]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tVendorQFDoc]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[vAccidentListForAllHB]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[vAccidentListForAllHB]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[vAllHB]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[vAllHB]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[vFileDocTypes]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[vFileDocTypes]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[vLastAnnualReview]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[vLastAnnualReview]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[vLastDIWForHBForArchives]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[vLastDIWForHBForArchives]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[vLastRecordOfViolations]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[vLastRecordOfViolations]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[vLastTIWforHB]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[vLastTIWforHB]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[vLastVIWForHB]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[vLastVIWForHB]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[vLastVIWIDforHB]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[vLastVIWIDforHB]
GO

if not exists (select * from dbo.sysusers where name = N'guest' and uid < 16382 and hasdbaccess = 1)
	EXEC sp_grantdbaccess N'guest'
GO

if not exists (select * from dbo.sysusers where name = N'nscuser62' and uid < 16382)
	EXEC sp_grantdbaccess N'nscuser62'
GO

exec sp_addrolemember N'db_backupoperator', N'nscuser62'
GO

exec sp_addrolemember N'db_owner', N'nscuser62'
GO
*/
CREATE TABLE IF NOT EXISTS `tAccFile` (
	`AccFileID` BIGINT NOT NULL auto_increment  ,
	`AccidentID` BIGINT NOT NULL ,
	`HomeBaseID` BIGINT NOT NULL ,
	`Status` varchar (10) COLLATE utf8_unicode_ci NOT NULL ,
	`ClosingDate` datetime NOT NULL ,
	`FileOpened` datetime NOT NULL ,
	`FileCreated` datetime NOT NULL ,
	`DOTCheck` TINYINT NOT NULL ,
	PRIMARY KEY  (`AccFileID`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `tAccIW` (
	`AccIWID` BIGINT NOT NULL auto_increment  ,
	`AccFileID` BIGINT NOT NULL ,
	`City` varchar (30) COLLATE utf8_unicode_ci NOT NULL ,
	`County` varchar (30) COLLATE utf8_unicode_ci NOT NULL ,
	`State` varchar (4) COLLATE utf8_unicode_ci NOT NULL ,
	`AccLocation` varchar (100) COLLATE utf8_unicode_ci NOT NULL ,
	`Intersection` varchar (100) COLLATE utf8_unicode_ci NOT NULL ,
	`Distance` varchar (20) COLLATE utf8_unicode_ci NOT NULL ,
	`DistFrom` varchar (100) COLLATE utf8_unicode_ci NOT NULL ,
	`AccTime` varchar (15) COLLATE utf8_unicode_ci NOT NULL ,
	`PhotoBy` varchar (30) COLLATE utf8_unicode_ci NOT NULL ,
	`SpeedLimit` varchar (10) COLLATE utf8_unicode_ci NOT NULL ,
	`Reported` varchar (5) COLLATE utf8_unicode_ci NOT NULL ,
	`PoliceDep` varchar (20) COLLATE utf8_unicode_ci NOT NULL ,
	`Scatched` varchar (5) COLLATE utf8_unicode_ci NOT NULL ,
	`OfficerName` varchar (40) COLLATE utf8_unicode_ci NOT NULL ,
	`ReportNum` varchar (40) COLLATE utf8_unicode_ci NOT NULL ,
	`FileOpened` datetime NOT NULL ,
	`AccNarative` text COLLATE utf8_unicode_ci NOT NULL ,
	`MileMarker` text COLLATE utf8_unicode_ci NOT NULL ,
	`Preventable` varchar (3) COLLATE utf8_unicode_ci NOT NULL ,
	`AccType` varchar (15) COLLATE utf8_unicode_ci NOT NULL ,
	`AccNumber` varchar (50) COLLATE utf8_unicode_ci NOT NULL ,
	`HazmatSpill` varchar (3) COLLATE utf8_unicode_ci NOT NULL ,
	`FuelSpill` varchar (3) COLLATE utf8_unicode_ci NOT NULL ,
	PRIMARY KEY  (`AccIWID`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;
--  ON `PRIMARY` TEXTIMAGE_ON `PRIMARY`


CREATE TABLE IF NOT EXISTS `tAccInvolvedWith` (
	`InvolvedWithID` BIGINT NOT NULL auto_increment  ,
	`AccIWID` BIGINT NOT NULL ,
	`Noncollision` varchar (3) COLLATE utf8_unicode_ci NOT NULL ,
	`OtherMotorVehicle` varchar (3) COLLATE utf8_unicode_ci NOT NULL ,
	`Pedestrian` varchar (3) COLLATE utf8_unicode_ci NOT NULL ,
	`ParkedVehicle` varchar (3) COLLATE utf8_unicode_ci NOT NULL ,
	`Train` varchar (3) COLLATE utf8_unicode_ci NOT NULL ,
	`Bus` varchar (3) COLLATE utf8_unicode_ci NOT NULL ,
	`Bicycle` varchar (3) COLLATE utf8_unicode_ci NOT NULL ,
	`Animal` varchar (3) COLLATE utf8_unicode_ci NOT NULL ,
	`FixedObject` varchar (3) COLLATE utf8_unicode_ci NOT NULL ,
	`Other` varchar (30) COLLATE utf8_unicode_ci NOT NULL ,
	PRIMARY KEY  (`InvolvedWithID`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;


CREATE TABLE IF NOT EXISTS `tAccLightningData` (
	`LightningDataID` BIGINT NOT NULL auto_increment  ,
	`AccIWID` BIGINT NOT NULL ,
	`DayLight` varchar (3) COLLATE utf8_unicode_ci NOT NULL ,
	`Dusk` varchar (3) COLLATE utf8_unicode_ci NOT NULL ,
	`Down` varchar (3) COLLATE utf8_unicode_ci NOT NULL ,
	`DarkLights` varchar (3) COLLATE utf8_unicode_ci NOT NULL ,
	`DarkNoLights` varchar (3) COLLATE utf8_unicode_ci NOT NULL ,
	`DarkLightsOff` varchar (3) COLLATE utf8_unicode_ci NOT NULL ,
	`Other` varchar (30) COLLATE utf8_unicode_ci NOT NULL ,
	PRIMARY KEY  (`LightningDataID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;


CREATE TABLE IF NOT EXISTS `tAccNarrative` (
	`AccIWID` BIGINT NOT NULL ,
	`AccNarrative` text COLLATE utf8_unicode_ci NOT NULL 
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;


CREATE TABLE IF NOT EXISTS `tAccNotes` (
	`AccNotesID` BIGINT NOT NULL auto_increment  ,
	`AccWID` BIGINT NOT NULL ,
	`NotesDate` datetime NOT NULL ,
	`Notes` text COLLATE utf8_unicode_ci NOT NULL ,
	PRIMARY KEY  (`AccNotesID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;


CREATE TABLE IF NOT EXISTS `tAccOtherDriver` (
	`OtherDrID` BIGINT NOT NULL auto_increment  ,
	`AccIWID` BIGINT NOT NULL ,
	`HomeBaseID` BIGINT NOT NULL ,
	`SSN` varchar (11) COLLATE utf8_unicode_ci NOT NULL ,
	`FirstName` varchar (15) COLLATE utf8_unicode_ci NOT NULL ,
	`LastName` varchar (15) COLLATE utf8_unicode_ci NOT NULL ,
	`MiddleName` varchar (15) COLLATE utf8_unicode_ci NOT NULL ,
	`BirthName` varchar (15) COLLATE utf8_unicode_ci NOT NULL ,
	`StreetAddress` varchar (30) COLLATE utf8_unicode_ci NOT NULL ,
	`CityAddress` varchar (20) COLLATE utf8_unicode_ci NOT NULL ,
	`StateAddress` varchar (5) COLLATE utf8_unicode_ci NOT NULL ,
	`ZIPAddress` varchar (6) COLLATE utf8_unicode_ci NOT NULL ,
	`CDLNumber` varchar (15) COLLATE utf8_unicode_ci NOT NULL ,
	`State` varchar (5) COLLATE utf8_unicode_ci NOT NULL ,
	`Class` varchar (5) COLLATE utf8_unicode_ci NOT NULL ,
	`Injured` varchar (3) COLLATE utf8_unicode_ci NOT NULL ,
	`InjuryDescription` varchar (200) COLLATE utf8_unicode_ci NOT NULL ,
	`killed` varchar (3) COLLATE utf8_unicode_ci NOT NULL ,
	`HomePhone` varchar (15) COLLATE utf8_unicode_ci NOT NULL ,
	`BusinessPhone` varchar (15) COLLATE utf8_unicode_ci NOT NULL ,
	`InsuranceCarier` varchar (30) COLLATE utf8_unicode_ci NOT NULL ,
	`InsPolicy` varchar (20) COLLATE utf8_unicode_ci NOT NULL ,
	`TravDirection` varchar (3) COLLATE utf8_unicode_ci NOT NULL ,
	`OnStreet` varchar (30) COLLATE utf8_unicode_ci NOT NULL ,
	`Speed` varchar (3) COLLATE utf8_unicode_ci NOT NULL ,
	`SpeedMax` varchar (3) COLLATE utf8_unicode_ci NOT NULL ,
	`Sex` varchar (7) COLLATE utf8_unicode_ci NOT NULL ,
	`HairColor` varchar (10) COLLATE utf8_unicode_ci NOT NULL ,
	`Eyes` varchar (10) COLLATE utf8_unicode_ci NOT NULL ,
	`HeightFeet` varchar (3) COLLATE utf8_unicode_ci NOT NULL ,
	`HeightInch` varchar (3) COLLATE utf8_unicode_ci NOT NULL ,
	`Weight` varchar (3) COLLATE utf8_unicode_ci NOT NULL ,
	`NumberOfPassanger` varchar (2) COLLATE utf8_unicode_ci NOT NULL ,
	`DOB` datetime NOT NULL ,
	PRIMARY KEY  (`OtherDrID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;


CREATE TABLE IF NOT EXISTS `tAccOtherMovement` (
	`OtherMovID` BIGINT NOT NULL auto_increment  ,
	`OtherDrID` BIGINT NOT NULL ,
	`Stopped` TINYINT NOT NULL ,
	`ProceedingStraight` TINYINT NOT NULL ,
	`RunOffRoadway` TINYINT NOT NULL ,
	`MakingRightTurn` TINYINT NOT NULL ,
	`MakingLeftTurn` TINYINT NOT NULL ,
	`MakingUTurn` TINYINT NOT NULL ,
	`Backing` TINYINT NOT NULL ,
	`Slowing` TINYINT NOT NULL ,
	`Stopping` TINYINT NOT NULL ,
	`Passing` TINYINT NOT NULL ,
	`ChangingLanes` TINYINT NOT NULL ,
	`Parking` TINYINT NOT NULL ,
	`EnteringTraffic` TINYINT NOT NULL ,
	`UnsafeTurning` TINYINT NOT NULL ,
	`Parked` TINYINT NOT NULL ,
	`Merging` TINYINT NOT NULL ,
	`WrongWay` TINYINT NOT NULL ,
	`Other` text COLLATE utf8_unicode_ci NOT NULL ,
	PRIMARY KEY  (`OtherMovID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;


CREATE TABLE IF NOT EXISTS `tAccOtherVehicle` (
	`AccOtherVehicleID` BIGINT NOT NULL auto_increment  ,
	`OtherDrID` BIGINT NOT NULL ,
	`HomeBaseID` BIGINT NOT NULL ,
	`AccIWID` BIGINT NOT NULL ,
	`Make` varchar (20) COLLATE utf8_unicode_ci NOT NULL ,
	`Model` varchar (20) COLLATE utf8_unicode_ci NOT NULL ,
	`Color` varchar (20) COLLATE utf8_unicode_ci NOT NULL ,
	`ProdYear` varchar (5) COLLATE utf8_unicode_ci NOT NULL ,
	`LicPlate` varchar (15) COLLATE utf8_unicode_ci NOT NULL ,
	`State` varchar (5) COLLATE utf8_unicode_ci NOT NULL ,
	`OwnersFirstName` varchar (20) COLLATE utf8_unicode_ci NOT NULL ,
	`OwnersLastName` varchar (20) COLLATE utf8_unicode_ci NOT NULL ,
	`OwnersMiddleName` varchar (20) COLLATE utf8_unicode_ci NOT NULL ,
	`OwnersStreetAddress` varchar (20) COLLATE utf8_unicode_ci NOT NULL ,
	`OwnersCityAddress` varchar (20) COLLATE utf8_unicode_ci NOT NULL ,
	`OwnersStateAddress` varchar (20) COLLATE utf8_unicode_ci NOT NULL ,
	`OwnersZIPAddress` varchar (5) COLLATE utf8_unicode_ci NOT NULL ,
	`VIN` varchar (25) COLLATE utf8_unicode_ci NOT NULL ,
	`Towed` varchar (50) COLLATE utf8_unicode_ci NOT NULL ,
	`DOT` varchar (10) COLLATE utf8_unicode_ci NOT NULL ,
	`Damage` text COLLATE utf8_unicode_ci NOT NULL ,
	`PhotoTaken` varchar (3) COLLATE utf8_unicode_ci NOT NULL ,
	`InsCompany` varchar (30) COLLATE utf8_unicode_ci NOT NULL ,
	`InsPolicyNum` varchar (30) COLLATE utf8_unicode_ci NOT NULL ,
	`InsExpDate` datetime NOT NULL ,
	`VehicleValue` BIGINT NOT NULL ,
	`DamageEstimate` BIGINT NOT NULL ,
	PRIMARY KEY  (`AccOtherVehicleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;


CREATE TABLE IF NOT EXISTS `tAccPassanger` (
	`PassangerID` BIGINT NOT NULL auto_increment  ,
	`AccIWID` BIGINT NOT NULL ,
	`SSN` varchar (15) COLLATE utf8_unicode_ci NOT NULL ,
	`HomeBaseID` BIGINT NOT NULL ,
	`Status` varchar (10) COLLATE utf8_unicode_ci NOT NULL ,
	`DOB` datetime NOT NULL ,
	`FirstName` varchar (30) COLLATE utf8_unicode_ci NOT NULL ,
	`LastName` varchar (30) COLLATE utf8_unicode_ci NOT NULL ,
	`MiddleName` varchar (30) COLLATE utf8_unicode_ci NOT NULL ,
	`StreetAddress` varchar (20) COLLATE utf8_unicode_ci NOT NULL ,
	`CityAddress` varchar (20) COLLATE utf8_unicode_ci NOT NULL ,
	`StateAddress` varchar (3) COLLATE utf8_unicode_ci NOT NULL ,
	`ZIPAddress` varchar (8) COLLATE utf8_unicode_ci NOT NULL ,
	`CDLNumber` varchar (30) COLLATE utf8_unicode_ci NOT NULL ,
	`State` varchar (5) COLLATE utf8_unicode_ci NOT NULL ,
	`Injured` varchar (5) COLLATE utf8_unicode_ci NOT NULL ,
	`InjuryDescription` varchar (200) COLLATE utf8_unicode_ci NOT NULL ,
	`killed` varchar (5) COLLATE utf8_unicode_ci NOT NULL ,
	`HomePhone` varchar (15) COLLATE utf8_unicode_ci NOT NULL ,
	`BusinessPhone` varchar (15) COLLATE utf8_unicode_ci NOT NULL ,
	`Sex` varchar (10) COLLATE utf8_unicode_ci NOT NULL ,
	`HairColor` varchar (10) COLLATE utf8_unicode_ci NOT NULL ,
	`Eyes` varchar (10) COLLATE utf8_unicode_ci NOT NULL ,
	`Height` varchar (10) COLLATE utf8_unicode_ci NOT NULL ,
	`Weight` varchar (10) COLLATE utf8_unicode_ci NOT NULL ,
	PRIMARY KEY  (`PassangerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;


CREATE TABLE IF NOT EXISTS `tAccRadwayData` (
	`RoadwayDataID` BIGINT NOT NULL auto_increment  ,
	`AccIWID` BIGINT NOT NULL ,
	`Oneway` varchar (3) COLLATE utf8_unicode_ci NOT NULL ,
	`Twoway` varchar (3) COLLATE utf8_unicode_ci NOT NULL ,
	`TwoLane` varchar (3) COLLATE utf8_unicode_ci NOT NULL ,
	`ThreeLane` varchar (3) COLLATE utf8_unicode_ci NOT NULL ,
	`FourLane` varchar (3) COLLATE utf8_unicode_ci NOT NULL ,
	`Other` varchar (200) COLLATE utf8_unicode_ci NOT NULL  ,
	PRIMARY KEY  (`RoadwayDataID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;


CREATE TABLE IF NOT EXISTS `tAccRoadCondData` (
	`RoadCondID` BIGINT NOT NULL auto_increment  ,
	`AccIWID` BIGINT NOT NULL ,
	`Holes` varchar (3) COLLATE utf8_unicode_ci NOT NULL ,
	`LooseMaterial` varchar (3) COLLATE utf8_unicode_ci NOT NULL ,
	`Obstruction` varchar (3) COLLATE utf8_unicode_ci NOT NULL ,
	`Construction` varchar (3) COLLATE utf8_unicode_ci NOT NULL ,
	`ReducedRoadway` varchar (3) COLLATE utf8_unicode_ci NOT NULL ,
	`Flooded` varchar (3) COLLATE utf8_unicode_ci NOT NULL ,
	`NoUnusual` varchar (3) COLLATE utf8_unicode_ci NOT NULL ,
	`Other` varchar (30) COLLATE utf8_unicode_ci NOT NULL ,
	PRIMARY KEY  (`RoadCondID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;


CREATE TABLE IF NOT EXISTS `tAccSurfaceData` (
	`SurfaceDataID` BIGINT NOT NULL auto_increment  ,
	`AccIWID` BIGINT NOT NULL ,
	`Dry` varchar (3) COLLATE utf8_unicode_ci NOT NULL ,
	`Wet` varchar (3) COLLATE utf8_unicode_ci NOT NULL ,
	`Snow` varchar (3) COLLATE utf8_unicode_ci NOT NULL ,
	`Icy` varchar (3) COLLATE utf8_unicode_ci NOT NULL ,
	`Muddy` varchar (3) COLLATE utf8_unicode_ci NOT NULL ,
	`Oily` varchar (3) COLLATE utf8_unicode_ci NOT NULL ,
	`Other` varchar (30) COLLATE utf8_unicode_ci NOT NULL ,
	PRIMARY KEY  (`SurfaceDataID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;
-- ==============================================================
-- ==============================================================

CREATE TABLE IF NOT EXISTS `tAccTraficControl` (
	`TraficControlDataID` BIGINT NOT NULL auto_increment  ,
	`AccIWID` BIGINT NOT NULL ,
	`Functioning` varchar (3) COLLATE utf8_unicode_ci NOT NULL ,
	`NotFunctioning` varchar (3) COLLATE utf8_unicode_ci NOT NULL ,
	`NoControl` varchar (3) COLLATE utf8_unicode_ci NOT NULL ,
	`Obscured` varchar (3) COLLATE utf8_unicode_ci NOT NULL ,
	`Other` varchar (30) COLLATE utf8_unicode_ci NOT NULL ,
	PRIMARY KEY  (`TraficControlDataID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;


CREATE TABLE IF NOT EXISTS `tAccTraficData` (
	`TrafficDataID` BIGINT NOT NULL auto_increment  ,
	`AccIWID` BIGINT NOT NULL ,
	`Light` varchar (3) COLLATE utf8_unicode_ci NOT NULL ,
	`Heavy` varchar (3) COLLATE utf8_unicode_ci NOT NULL ,
	`Medium` varchar (3) COLLATE utf8_unicode_ci NOT NULL ,
	`Other` varchar (30) COLLATE utf8_unicode_ci NOT NULL ,
	PRIMARY KEY  (`TrafficDataID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;


CREATE TABLE IF NOT EXISTS `tAccTypeOfCollison` (
	`TypeOfCollisionID` BIGINT NOT NULL auto_increment  ,
	`AccIWID` BIGINT NOT NULL ,
	`HeadOn` varchar (3) COLLATE utf8_unicode_ci NOT NULL ,
	`Sideswipe` varchar (3) COLLATE utf8_unicode_ci NOT NULL ,
	`RearEnd` varchar (3) COLLATE utf8_unicode_ci NOT NULL ,
	`Broadside` varchar (3) COLLATE utf8_unicode_ci NOT NULL ,
	`Overturned` varchar (3) COLLATE utf8_unicode_ci NOT NULL ,
	`HitObject` varchar (3) COLLATE utf8_unicode_ci NOT NULL ,
	`VehiclePedestrian` varchar (3) COLLATE utf8_unicode_ci NOT NULL ,
	`Other` varchar (30) COLLATE utf8_unicode_ci NOT NULL ,
	PRIMARY KEY  (`TypeOfCollisionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;


CREATE TABLE IF NOT EXISTS `tAccWeatherData` (
	`WeatherID` BIGINT NOT NULL auto_increment  ,
	`AccIWID` BIGINT NOT NULL ,
	`ClearW` varchar (3) COLLATE utf8_unicode_ci NOT NULL ,
	`Cloudy` varchar (3) COLLATE utf8_unicode_ci NOT NULL ,
	`Raining` varchar (3) COLLATE utf8_unicode_ci NOT NULL ,
	`Snowing` varchar (3) COLLATE utf8_unicode_ci NOT NULL ,
	`Fog` varchar (3) COLLATE utf8_unicode_ci NOT NULL ,
	`Wind` varchar (3) COLLATE utf8_unicode_ci NOT NULL ,
	`Other` varchar (30) COLLATE utf8_unicode_ci NOT NULL ,
	PRIMARY KEY  (`WeatherID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;


CREATE TABLE IF NOT EXISTS `tAccWitness` (
	`WitnessID` BIGINT NOT NULL auto_increment  ,
	`AccIWID` BIGINT NOT NULL ,
	`FirstName` varchar (20) COLLATE utf8_unicode_ci NOT NULL ,
	`LastName` varchar (20) COLLATE utf8_unicode_ci NOT NULL ,
	`MIddleName` varchar (20) COLLATE utf8_unicode_ci NOT NULL ,
	`Phone` varchar (15) COLLATE utf8_unicode_ci NOT NULL ,
	`Street` varchar (20) COLLATE utf8_unicode_ci NOT NULL ,
	`City` varchar (20) COLLATE utf8_unicode_ci NOT NULL ,
	`State` varchar (3) COLLATE utf8_unicode_ci NOT NULL ,
	`ZIP` varchar (7) COLLATE utf8_unicode_ci NOT NULL ,
	`Injured` varchar (5) COLLATE utf8_unicode_ci NOT NULL ,
	`InjuryDescription` varchar (200) COLLATE utf8_unicode_ci NOT NULL ,
	`Killed` varchar (5) COLLATE utf8_unicode_ci NOT NULL ,
	PRIMARY KEY  (`WitnessID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;


CREATE TABLE IF NOT EXISTS `tAccident` (
	`AccidentID` BIGINT NOT NULL auto_increment  ,
	`Created` datetime NOT NULL ,
	`AccDate` datetime NOT NULL ,
	PRIMARY KEY  (`AccidentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;


CREATE TABLE IF NOT EXISTS `tActionDriver` (
	`ActionDriverID` BIGINT NOT NULL auto_increment  ,
	`HomeBaseID` BIGINT NOT NULL ,
	`DIWID` BIGINT NOT NULL ,
	`ActionType` varchar (15) COLLATE utf8_unicode_ci NOT NULL ,
	`Status` varchar (15) COLLATE utf8_unicode_ci NOT NULL ,
	`FromDate` datetime NOT NULL ,
	`ValidForDays` TINYINT NOT NULL ,
	`ValidForMin` TINYINT NOT NULL ,
	`StartDateTime` datetime NOT NULL ,
	`EndDateTime` datetime NOT NULL ,
	`Created` datetime NOT NULL ,
	`CreatedByUserID` BIGINT NOT NULL ,
	PRIMARY KEY  (`ActionDriverID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;


CREATE TABLE IF NOT EXISTS `tActionSystem` (
	`ActionSystemID` BIGINT NOT NULL auto_increment  ,
	`ActionType` varchar (15) COLLATE utf8_unicode_ci NOT NULL ,
	`ActionDate` datetime NOT NULL ,
	`ToHomeBaseID` BIGINT NOT NULL ,
	`ToUserID` BIGINT NOT NULL ,
	`Confirmed` TINYINT NOT NULL ,
	PRIMARY KEY  (`ActionSystemID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;


CREATE TABLE IF NOT EXISTS `tActionSystemForFile` (
	`ActionSystemForFileID` BIGINT NOT NULL auto_increment  ,
	`ActionSystemID` BIGINT NOT NULL ,
	`FileID` BIGINT NOT NULL ,
	`DIWID` BIGINT NOT NULL ,
	`ExpType` varchar (20) COLLATE utf8_unicode_ci NOT NULL ,
	`Expires` datetime NOT NULL ,
	`Created` datetime NOT NULL ,
	`ActionType` varchar (15) COLLATE utf8_unicode_ci NOT NULL ,
	PRIMARY KEY  (`ActionSystemForFileID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;


CREATE TABLE IF NOT EXISTS `tActionUser` (
	`ActionUserID` BIGINT NOT NULL auto_increment  ,
	`HomeBaseID` BIGINT NOT NULL ,
	`ActionType` varchar (100) COLLATE utf8_unicode_ci NOT NULL ,
	`ActionDate` datetime NOT NULL ,
	`ActionOn` varchar (20) COLLATE utf8_unicode_ci NOT NULL ,
	`OnID` BIGINT NOT NULL ,
	`ByName` varchar (50) COLLATE utf8_unicode_ci NOT NULL ,
	`ByUserID` BIGINT NOT NULL ,
	`Parameters` varchar (3000) COLLATE utf8_unicode_ci NOT NULL ,
	`Comment` text COLLATE utf8_unicode_ci NOT NULL ,
	PRIMARY KEY  (`ActionUserID`)
	
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;


CREATE TABLE IF NOT EXISTS `tAppCheck` (
	`AppCheckID` BIGINT NOT NULL auto_increment  ,
	`DIWID` BIGINT NOT NULL ,
	`CheckReview` varchar (1) COLLATE utf8_unicode_ci NOT NULL ,
	`CheckPrintForms` varchar (1) COLLATE utf8_unicode_ci NOT NULL ,
	`CheckScanAllForms` varchar (1) COLLATE utf8_unicode_ci NOT NULL ,
	`CheckSignature` varchar (1) COLLATE utf8_unicode_ci NOT NULL ,
	`CheckPicture` varchar (1) COLLATE utf8_unicode_ci NOT NULL ,
	`CheckScan` varchar (1) COLLATE utf8_unicode_ci NOT NULL ,
	`CheckAutoFax` varchar (1) COLLATE utf8_unicode_ci NOT NULL ,
	PRIMARY KEY  (`AppCheckID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;


CREATE TABLE IF NOT EXISTS `tCStaff` (
	`CStaffID` BIGINT NOT NULL auto_increment  ,
	`CompanyID` BIGINT NOT NULL ,
	`FirstName` varchar (50) COLLATE utf8_unicode_ci NOT NULL ,
	`LastName` varchar (50) COLLATE utf8_unicode_ci NOT NULL ,
	`Title` varchar (50) COLLATE utf8_unicode_ci NOT NULL ,
	`Telephone` varchar (30) COLLATE utf8_unicode_ci NOT NULL ,
	`Email` varchar (100) COLLATE utf8_unicode_ci NOT NULL ,
	`Role` varchar (30) COLLATE utf8_unicode_ci NOT NULL ,
	`Status` varchar (10) COLLATE utf8_unicode_ci NOT NULL ,
	`Created` datetime NOT NULL ,
	`DQF` TINYINT NOT NULL ,
	`VIM` TINYINT NOT NULL ,
	`Accident` TINYINT NOT NULL ,
	PRIMARY KEY  (`CStaffID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;
-- ========================================================================
-- ========================================================================

CREATE TABLE IF NOT EXISTS `tCompany` (
	`CompanyID` BIGINT NOT NULL auto_increment  ,
	`CompanyName` varchar (100) COLLATE utf8_unicode_ci NOT NULL ,
	`CompanyCode` varchar (20) COLLATE utf8_unicode_ci NOT NULL ,
	`Address` varchar (100) COLLATE utf8_unicode_ci NOT NULL ,
	`City` varchar (50) COLLATE utf8_unicode_ci NOT NULL ,
	`State` varchar (2) COLLATE utf8_unicode_ci NOT NULL ,
	`Zip` varchar (20) COLLATE utf8_unicode_ci NOT NULL ,
	`Telephone` varchar (30) COLLATE utf8_unicode_ci NOT NULL ,
	`Fax` varchar (30) COLLATE utf8_unicode_ci NOT NULL ,
	`Created` datetime NOT NULL ,
	`P1FirstName` varchar (50) COLLATE utf8_unicode_ci NOT NULL ,
	`P1LastName` varchar (50) COLLATE utf8_unicode_ci NOT NULL ,
	`P1Title` varchar (50) COLLATE utf8_unicode_ci NOT NULL ,
	`P1Telephone` varchar (30) COLLATE utf8_unicode_ci NOT NULL ,
	`P1Email` varchar (100) COLLATE utf8_unicode_ci NOT NULL ,
	`P1Role` varchar (30) COLLATE utf8_unicode_ci NOT NULL ,
	`P1Status` varchar (10) COLLATE utf8_unicode_ci NOT NULL ,
	`Url` varchar (100) COLLATE utf8_unicode_ci NOT NULL ,
	PRIMARY KEY  (`CompanyID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;


CREATE TABLE IF NOT EXISTS `tCompanyDoc` (
	`DocID` BIGINT NOT NULL ,
	`DocType` varchar (30) COLLATE utf8_unicode_ci NOT NULL ,
	`Category` varchar (30) COLLATE utf8_unicode_ci NOT NULL ,
	`DocTitle` varchar (100) COLLATE utf8_unicode_ci NOT NULL ,
	`DocCode` varchar (10) COLLATE utf8_unicode_ci NOT NULL ,
	`HasPDF` TINYINT NOT NULL ,
	`PDFFile` varchar (100) COLLATE utf8_unicode_ci NOT NULL ,
	`HasScan` TINYINT NOT NULL ,
	`Multiple` TINYINT NOT NULL ,
	`PageNum` TINYINT NOT NULL ,
	PRIMARY KEY  (`DocID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;


CREATE TABLE IF NOT EXISTS `tCompanyDocList` (
	`CompanyDocID` BIGINT NOT NULL auto_increment  ,
	`CompanyID` BIGINT NOT NULL ,
	`DocID` BIGINT NOT NULL ,
	`Status` varchar (15) COLLATE utf8_unicode_ci NOT NULL ,
	`Requested` datetime NOT NULL ,
	`Completed` datetime NOT NULL ,
	`ScanDateTime` varchar (20) COLLATE utf8_unicode_ci NOT NULL ,
	`Created` datetime NOT NULL ,
	`OtherTitle` varchar (200) COLLATE utf8_unicode_ci NOT NULL ,
	PRIMARY KEY  (`CompanyDocID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;


CREATE TABLE IF NOT EXISTS `tDIW` (
	`DIWID` BIGINT NOT NULL auto_increment  ,
	`FileID` BIGINT NOT NULL ,
	`EntryDate` datetime NOT NULL ,
	`AppDate` datetime NOT NULL ,
	`AppType` varchar (15) COLLATE utf8_unicode_ci NOT NULL ,
	`AppNumber` varchar (20) COLLATE utf8_unicode_ci NOT NULL ,
	`DateOfHire` datetime NOT NULL ,
	`TruckNumber` varchar (20) COLLATE utf8_unicode_ci NOT NULL ,
	`FirstName` varchar (20) COLLATE utf8_unicode_ci NOT NULL ,
	`LastName` varchar (20) COLLATE utf8_unicode_ci NOT NULL ,
	`MiddleName` varchar (20) COLLATE utf8_unicode_ci NOT NULL ,
	`BirthName` varchar (100) COLLATE utf8_unicode_ci NOT NULL ,
	`RANumber` varchar (20) COLLATE utf8_unicode_ci NOT NULL ,
	`RAExpDate` datetime NOT NULL ,
	`MedNumber` varchar (20) COLLATE utf8_unicode_ci NOT NULL ,
	`MedExpDate` datetime NOT NULL ,
	`MedExaminerName` varchar (50) COLLATE utf8_unicode_ci NOT NULL ,
	`StraightTruck` varchar (3) COLLATE utf8_unicode_ci NOT NULL ,
	`STFromDate` datetime NOT NULL ,
	`STToDate` datetime NOT NULL ,
	`STTotalMiles` varchar (10) COLLATE utf8_unicode_ci NOT NULL ,
	`TractorSemiTrailer` varchar (3) COLLATE utf8_unicode_ci NOT NULL ,
	`TSTFromDate` datetime NOT NULL ,
	`TSTToDate` datetime NOT NULL ,
	`TSTTotalMiles` varchar (10) COLLATE utf8_unicode_ci NOT NULL ,
	`DoublesTriples` varchar (3) COLLATE utf8_unicode_ci NOT NULL ,
	`DTFromDate` datetime NOT NULL ,
	`DTToDate` datetime NOT NULL ,
	`DTTotalMiles` varchar (10) COLLATE utf8_unicode_ci NOT NULL ,
	`Busses` varchar (3) COLLATE utf8_unicode_ci NOT NULL ,
	`BusFromDate` datetime NOT NULL ,
	`BusToDate` datetime NOT NULL ,
	`BusTotalMiles` varchar (10) COLLATE utf8_unicode_ci NOT NULL ,
	`Tankers` varchar (3) COLLATE utf8_unicode_ci NOT NULL ,
	`TanFromDate` datetime NOT NULL ,
	`TanToDate` datetime NOT NULL ,
	`TanTotalMiles` varchar (10) COLLATE utf8_unicode_ci NOT NULL ,
	`OtherEquip` varchar (3) COLLATE utf8_unicode_ci NOT NULL ,
	`OthFromDate` datetime NOT NULL ,
	`OthToDate` datetime NOT NULL ,
	`OthTotalMiles` varchar (10) COLLATE utf8_unicode_ci NOT NULL ,
	`OthDescribe` varchar (200) COLLATE utf8_unicode_ci NOT NULL ,
	`DeniedCDL` varchar (3) COLLATE utf8_unicode_ci NOT NULL ,
	`DeniedCDLExplain` varchar (200) COLLATE utf8_unicode_ci NOT NULL ,
	`SuspCDL` varchar (3) COLLATE utf8_unicode_ci NOT NULL ,
	`SuspCDLExplain` varchar (200) COLLATE utf8_unicode_ci NOT NULL ,
	`CopyStatus` varchar (15) COLLATE utf8_unicode_ci NOT NULL ,
	`Created` datetime NOT NULL ,
	`NoRA` TINYINT NOT NULL ,
	`NoAcc` TINYINT NOT NULL ,
	`NoViol` TINYINT NOT NULL ,
	`NoEmpl` TINYINT NOT NULL ,
	`DriverCode` varchar (30) COLLATE utf8_unicode_ci NOT NULL ,
	`TWICSerial` varchar (50) COLLATE utf8_unicode_ci NOT NULL ,
	`TWICExpDate` datetime NOT NULL ,
	`NextelPhone` varchar (15) COLLATE utf8_unicode_ci NOT NULL ,
	`NextelPhoneSerial` varchar (20) COLLATE utf8_unicode_ci NOT NULL ,
	`RadioFrequency` varchar (15) COLLATE utf8_unicode_ci NOT NULL ,
	`RadioSerial` varchar (20) COLLATE utf8_unicode_ci NOT NULL ,
	PRIMARY KEY  (`DIWID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;


CREATE TABLE IF NOT EXISTS `tDIWAccident` (
	`DIWAccidentID` BIGINT NOT NULL auto_increment  ,
	`DIWID` BIGINT NOT NULL ,
	`AccDate` datetime NOT NULL ,
	`City` varchar (50) COLLATE utf8_unicode_ci NOT NULL ,
	`State` varchar (2) COLLATE utf8_unicode_ci NOT NULL ,
	`AccType` varchar (30) COLLATE utf8_unicode_ci NOT NULL ,
	`Fatalies` varchar (3) COLLATE utf8_unicode_ci NOT NULL ,
	`Injuries` varchar (3) COLLATE utf8_unicode_ci NOT NULL ,
	`OrderNo` TINYINT NOT NULL ,
	PRIMARY KEY  (`DIWAccidentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;


CREATE TABLE IF NOT EXISTS `tDIWAddress` (
	`DIWAddressID` BIGINT NOT NULL auto_increment  ,
	`DIWID` BIGINT NOT NULL ,
	`Address` varchar (200) COLLATE utf8_unicode_ci NOT NULL ,
	`City` varchar (50) COLLATE utf8_unicode_ci NOT NULL ,
	`State` varchar (2) COLLATE utf8_unicode_ci NOT NULL ,
	`Zip` varchar (20) COLLATE utf8_unicode_ci NOT NULL ,
	`Phone` varchar (30) COLLATE utf8_unicode_ci NOT NULL ,
	`YearsAtAddress` varchar (2) COLLATE utf8_unicode_ci NOT NULL ,
	`MonthsAtAddress` varchar (2) COLLATE utf8_unicode_ci NOT NULL ,
	`FromDate` datetime NOT NULL ,
	`CurrAddress` varchar (3) COLLATE utf8_unicode_ci NOT NULL ,
	PRIMARY KEY  (`DIWAddressID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;


CREATE TABLE IF NOT EXISTS `tDIWCDL` (
	`DIWCDLID` BIGINT NOT NULL auto_increment  ,
	`DIWID` BIGINT NOT NULL ,
	`CDLNumber` varchar (20) COLLATE utf8_unicode_ci NOT NULL ,
	`State` varchar (2) COLLATE utf8_unicode_ci NOT NULL ,
	`Class` varchar (1) COLLATE utf8_unicode_ci NOT NULL ,
	`EndorP` varchar (3) COLLATE utf8_unicode_ci NOT NULL ,
	`EndorT` varchar (3) COLLATE utf8_unicode_ci NOT NULL ,
	`EndorH` varchar (3) COLLATE utf8_unicode_ci NOT NULL ,
	`EndorN` varchar (3) COLLATE utf8_unicode_ci NOT NULL ,
	`EndorX` varchar (3) COLLATE utf8_unicode_ci NOT NULL ,
	`AirBrakeRestriction` varchar (3) COLLATE utf8_unicode_ci NOT NULL ,
	`Expires` datetime NOT NULL ,
	`CDLCurrent` varchar (3) COLLATE utf8_unicode_ci NOT NULL ,
	`OrderNo` TINYINT NOT NULL ,
	PRIMARY KEY  (`DIWCDLID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;


CREATE TABLE IF NOT EXISTS `tDIWDataSheet` (
	`DIWDataSheetID` BIGINT NOT NULL auto_increment  ,
	`DIWID` BIGINT NOT NULL ,
	`Date1` datetime NOT NULL ,
	`Hours1` varchar (2) COLLATE utf8_unicode_ci NOT NULL ,
	`Date2` datetime NOT NULL ,
	`Hours2` varchar (2) COLLATE utf8_unicode_ci NOT NULL ,
	`Date3` datetime NOT NULL ,
	`Hours3` varchar (2) COLLATE utf8_unicode_ci NOT NULL ,
	`Date4` datetime NOT NULL ,
	`Hours4` varchar (2) COLLATE utf8_unicode_ci NOT NULL ,
	`Date5` datetime NOT NULL ,
	`Hours5` varchar (2) COLLATE utf8_unicode_ci NOT NULL ,
	`Date6` datetime NOT NULL ,
	`Hours6` varchar (2) COLLATE utf8_unicode_ci NOT NULL ,
	`Date7` datetime NOT NULL ,
	`Hours7` varchar (2) COLLATE utf8_unicode_ci NOT NULL ,
	`LastRelievedDate` datetime NOT NULL ,
	`LastRelievedTime` varchar (10) COLLATE utf8_unicode_ci NOT NULL ,
	PRIMARY KEY  (`DIWDataSheetID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;


CREATE TABLE IF NOT EXISTS `tDIWEmployer` (
	`DIWEmployerID` BIGINT NOT NULL auto_increment  ,
	`DIWID` BIGINT NOT NULL ,
	`Employer` varchar (200) COLLATE utf8_unicode_ci NOT NULL ,
	`Address` varchar (200) COLLATE utf8_unicode_ci NOT NULL ,
	`City` varchar (50) COLLATE utf8_unicode_ci NOT NULL ,
	`State` varchar (2) COLLATE utf8_unicode_ci NOT NULL ,
	`Zip` varchar (20) COLLATE utf8_unicode_ci NOT NULL ,
	`Telephone` varchar (30) COLLATE utf8_unicode_ci NOT NULL ,
	`Fax` varchar (30) COLLATE utf8_unicode_ci NOT NULL ,
	`Job` varchar (200) COLLATE utf8_unicode_ci NOT NULL ,
	`FromMonth` varchar (3) COLLATE utf8_unicode_ci NOT NULL ,
	`FromYear` varchar (5) COLLATE utf8_unicode_ci NOT NULL ,
	`ToMonth` varchar (3) COLLATE utf8_unicode_ci NOT NULL ,
	`ToYear` varchar (5) COLLATE utf8_unicode_ci NOT NULL ,
	`Reason` varchar (200) COLLATE utf8_unicode_ci NOT NULL ,
	PRIMARY KEY  (`DIWEmployerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;


CREATE TABLE IF NOT EXISTS `tDIWVehicle` (
	`DIWVehicleID` BIGINT NOT NULL auto_increment  ,
	`DIWID` BIGINT NOT NULL ,
	`OwnerFirstName` varchar (20) COLLATE utf8_unicode_ci NOT NULL ,
	`OwnerLastName` varchar (20) COLLATE utf8_unicode_ci NOT NULL ,
	`VehicleType` varchar (30) COLLATE utf8_unicode_ci NOT NULL ,
	`NumberOfAxles` varchar (5) COLLATE utf8_unicode_ci NOT NULL ,
	`LicPlateNumber` varchar (20) COLLATE utf8_unicode_ci NOT NULL ,
	`VIN` varchar (30) COLLATE utf8_unicode_ci NOT NULL ,
	`RegExpDate` datetime NOT NULL ,
	`ValueOfVehicle` varchar (15) COLLATE utf8_unicode_ci NOT NULL ,
	`InsCompany` varchar (100) COLLATE utf8_unicode_ci NOT NULL ,
	`InsPolicy` varchar (20) COLLATE utf8_unicode_ci NOT NULL ,
	`InsExpDate` datetime NOT NULL ,
	`InsLimits` varchar (200) COLLATE utf8_unicode_ci NOT NULL ,
	PRIMARY KEY  (`DIWVehicleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;


CREATE TABLE IF NOT EXISTS `tDIWViolation` (
	`DIWViolationID` BIGINT NOT NULL auto_increment  ,
	`DIWID` BIGINT NOT NULL ,
	`ViolDate` datetime NOT NULL ,
	`Location` varchar (50) COLLATE utf8_unicode_ci NOT NULL ,
	`Violation` varchar (50) COLLATE utf8_unicode_ci NOT NULL ,
	`Penalty` varchar (50) COLLATE utf8_unicode_ci NOT NULL ,
	`TypeOfVehicle` varchar (20) COLLATE utf8_unicode_ci NOT NULL ,
	`OrderNo` TINYINT NOT NULL ,
	PRIMARY KEY  (`DIWViolationID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;


CREATE TABLE IF NOT EXISTS `tDOTInspections` (
	`DOTInspectionID` BIGINT NOT NULL auto_increment  ,
	`CompanyID` BIGINT NOT NULL ,
	`InspectionDate` datetime NOT NULL ,
	`InspectionTime` varchar (15) COLLATE utf8_unicode_ci NOT NULL ,
	`RequestedByFName` varchar (20) COLLATE utf8_unicode_ci NOT NULL ,
	`RequestedByLName` varchar (20) COLLATE utf8_unicode_ci NOT NULL ,
	`Status` varchar (50) COLLATE utf8_unicode_ci NOT NULL ,
	PRIMARY KEY  (`DOTInspectionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;
-- ============================================================================
-- ============================================================================

CREATE TABLE IF NOT EXISTS `tDQFAnnualReview` (
	`DQFAnnualReviewID` BIGINT NOT NULL auto_increment  ,
	`DQFDocID` BIGINT NOT NULL ,
	`ReviewDate` datetime NOT NULL ,
	`Qualified` TINYINT NOT NULL ,
	`Name` varchar (50) COLLATE utf8_unicode_ci NOT NULL ,
	`Remarks` text COLLATE utf8_unicode_ci NOT NULL ,
	`ConfirmReview` TINYINT NOT NULL ,
	`Created` datetime NOT NULL ,
	PRIMARY KEY  (`DQFAnnualReviewID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;


CREATE TABLE IF NOT EXISTS `tDQFDisq383` (
	`DQFDisq383ID` BIGINT NOT NULL auto_increment  ,
	`DQFDocID` BIGINT NOT NULL ,
	`AADate` varchar (10) COLLATE utf8_unicode_ci NOT NULL ,
	`BBDate` varchar (10) COLLATE utf8_unicode_ci NOT NULL ,
	`CCDate` varchar (10) COLLATE utf8_unicode_ci NOT NULL ,
	`DDDate` varchar (10) COLLATE utf8_unicode_ci NOT NULL ,
	`EEDate` varchar (10) COLLATE utf8_unicode_ci NOT NULL ,
	`FFDate` varchar (10) COLLATE utf8_unicode_ci NOT NULL ,
	`GGDate` varchar (10) COLLATE utf8_unicode_ci NOT NULL ,
	`ToName` varchar (50) COLLATE utf8_unicode_ci NOT NULL ,
	`NoticeDate` datetime NOT NULL ,
	`Period` varchar (20) COLLATE utf8_unicode_ci NOT NULL ,
	`SuspCode` varchar (20) COLLATE utf8_unicode_ci NOT NULL ,
	`SuspFromDate` datetime NOT NULL ,
	`SuspToDate` datetime NOT NULL ,
	`TermCode` varchar (20) COLLATE utf8_unicode_ci NOT NULL ,
	`TermDate` datetime NOT NULL ,
	`ByName` varchar (50) COLLATE utf8_unicode_ci NOT NULL ,
	`ByTitle` varchar (50) COLLATE utf8_unicode_ci NOT NULL ,
	`Created` datetime NOT NULL ,
	PRIMARY KEY  (`DQFDisq383ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;


CREATE TABLE IF NOT EXISTS `tDQFDisq391` (
	`DQFDisq391ID` BIGINT NOT NULL auto_increment  ,
	`DQFDocID` BIGINT NOT NULL ,
	`ADate` varchar (10) COLLATE utf8_unicode_ci NOT NULL ,
	`BDate` varchar (10) COLLATE utf8_unicode_ci NOT NULL ,
	`CDate` varchar (10) COLLATE utf8_unicode_ci NOT NULL ,
	`DDate` varchar (10) COLLATE utf8_unicode_ci NOT NULL ,
	`EDate` varchar (10) COLLATE utf8_unicode_ci NOT NULL ,
	`FDate` varchar (10) COLLATE utf8_unicode_ci NOT NULL ,
	`GDate` varchar (10) COLLATE utf8_unicode_ci NOT NULL ,
	`HDate` varchar (10) COLLATE utf8_unicode_ci NOT NULL ,
	`IDate` varchar (10) COLLATE utf8_unicode_ci NOT NULL ,
	`JDate` varchar (10) COLLATE utf8_unicode_ci NOT NULL ,
	`KDate` varchar (10) COLLATE utf8_unicode_ci NOT NULL ,
	`LDate` varchar (10) COLLATE utf8_unicode_ci NOT NULL ,
	`MDate` varchar (10) COLLATE utf8_unicode_ci NOT NULL ,
	`NDate` varchar (10) COLLATE utf8_unicode_ci NOT NULL ,
	`ODate` varchar (10) COLLATE utf8_unicode_ci NOT NULL ,
	`PRegulation` varchar (15) COLLATE utf8_unicode_ci NOT NULL ,
	`PDate` varchar (10) COLLATE utf8_unicode_ci NOT NULL ,
	`PDescription` varchar (200) COLLATE utf8_unicode_ci NOT NULL ,
	`QRegulation` varchar (15) COLLATE utf8_unicode_ci NOT NULL ,
	`QDate` varchar (10) COLLATE utf8_unicode_ci NOT NULL ,
	`QDescription` varchar (200) COLLATE utf8_unicode_ci NOT NULL ,
	`RRegulation` varchar (15) COLLATE utf8_unicode_ci NOT NULL ,
	`RDate` varchar (10) COLLATE utf8_unicode_ci NOT NULL ,
	`RDescription` varchar (200) COLLATE utf8_unicode_ci NOT NULL ,
	`SRegulation` varchar (15) COLLATE utf8_unicode_ci NOT NULL ,
	`SDate` varchar (10) COLLATE utf8_unicode_ci NOT NULL ,
	`SDescription` varchar (200) COLLATE utf8_unicode_ci NOT NULL ,
	`ToName` varchar (50) COLLATE utf8_unicode_ci NOT NULL ,
	`NoticeDate` datetime NOT NULL ,
	`Period` varchar (20) COLLATE utf8_unicode_ci NOT NULL ,
	`SuspCode` varchar (20) COLLATE utf8_unicode_ci NOT NULL ,
	`SuspFromDate` datetime NOT NULL ,
	`SuspToDate` datetime NOT NULL ,
	`TermCode` varchar (20) COLLATE utf8_unicode_ci NOT NULL ,
	`TermDate` datetime NOT NULL ,
	`ByName` varchar (50) COLLATE utf8_unicode_ci NOT NULL ,
	`ByTitle` varchar (50) COLLATE utf8_unicode_ci NOT NULL ,
	PRIMARY KEY  (`DQFDisq391ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;


CREATE TABLE IF NOT EXISTS `tDQFDoc` (
	`DQFDocID` BIGINT NOT NULL auto_increment  ,
	`DIWID` BIGINT NOT NULL ,
	`DocID` BIGINT NOT NULL ,
	`Status` varchar (15) COLLATE utf8_unicode_ci NOT NULL ,
	`Requested` datetime NOT NULL ,
	`Completed` datetime NOT NULL ,
	`DIWEmployerID` BIGINT NOT NULL ,
	`ScanDateTime` varchar (20) COLLATE utf8_unicode_ci NOT NULL ,
	`Created` datetime NOT NULL ,
	`OtherTitle` varchar (200) COLLATE utf8_unicode_ci NOT NULL ,
	`RelatedTo` BIGINT NOT NULL ,
	PRIMARY KEY  (`DQFDocID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;


CREATE TABLE IF NOT EXISTS `tDQFDocDOTCheck` (
	`DOTCheckID` TINYINT NOT NULL auto_increment  ,
	`DQFDocID` TINYINT NOT NULL ,
	`TruckQFDocID` TINYINT NOT NULL ,
	`AccQFDocID` TINYINT NOT NULL ,
	`DriverFileID` TINYINT NOT NULL ,
	`AccFileID` TINYINT NOT NULL ,
	`VehFileID` TINYINT NOT NULL ,
	`CompanyID` TINYINT NOT NULL ,
	`CompanyDocID` BIGINT NOT NULL ,
	`DOTCheckStatus` TINYINT NOT NULL ,
	`DOTCheckNote` text COLLATE utf8_unicode_ci NOT NULL ,
	`DOTCheckDate` datetime NOT NULL ,
	`DOTCheckBy` varchar (30) COLLATE utf8_unicode_ci NOT NULL ,
	`DocStatus` varchar (10) COLLATE utf8_unicode_ci NOT NULL ,
	`DOTInspectionID` TINYINT NOT NULL ,
	`DocTitle` varchar (50) COLLATE utf8_unicode_ci NOT NULL ,
	`HomeBaseID` TINYINT NOT NULL ,
	`HBName` varchar (50) COLLATE utf8_unicode_ci NOT NULL ,
	`CompName` varchar (50) COLLATE utf8_unicode_ci NOT NULL ,
	PRIMARY KEY  (`DOTCheckID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;


CREATE TABLE IF NOT EXISTS `tDQFDocNSCCheck` (
	`NSCCheckID` TINYINT NOT NULL ,
	`DQFDocID` TINYINT NOT NULL ,
	`NSCCheckStatus` TINYINT NOT NULL ,
	`NSCCheckNote` text COLLATE utf8_unicode_ci NOT NULL ,
	`NSCCheckDate` datetime NOT NULL ,
	`NSCCheckBy` varchar (30) COLLATE utf8_unicode_ci NOT NULL  ,
	PRIMARY KEY  (`NSCCheckID`)

) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;


CREATE TABLE IF NOT EXISTS `tDoc` (
	`DocID` BIGINT NOT NULL auto_increment  ,
	`DocType` varchar (10) COLLATE utf8_unicode_ci NOT NULL ,
	`Category` varchar (30) COLLATE utf8_unicode_ci NOT NULL ,
	`DocTitle` varchar (100) COLLATE utf8_unicode_ci NOT NULL ,
	`DocCode` varchar (10) COLLATE utf8_unicode_ci NOT NULL ,
	`HasPDF` TINYINT NOT NULL ,
	`PDFFile` varchar (100) COLLATE utf8_unicode_ci NOT NULL ,
	`HasScan` TINYINT NOT NULL ,
	`Multiple` TINYINT NOT NULL ,
	`ForEmployer` TINYINT NOT NULL ,
	`PageNum` TINYINT NOT NULL ,
	`HasNSCCheck` TINYINT NOT NULL ,
	PRIMARY KEY  (`DocID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;


CREATE TABLE IF NOT EXISTS `tDriver` (
	`DriverID` BIGINT NOT NULL auto_increment  ,
	`SSN` varchar (9) COLLATE utf8_unicode_ci NOT NULL ,
	`DOB` datetime NOT NULL ,
	`Created` datetime NOT NULL ,
	PRIMARY KEY  (`DriverID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;


CREATE TABLE IF NOT EXISTS `tDriverAccount` (
	`DriverAccountID` BIGINT NOT NULL auto_increment,
	`DIWID` BIGINT NOT NULL ,
	`AccountType` varchar (10) COLLATE utf8_unicode_ci NOT NULL ,
	`DQFDocID` BIGINT NOT NULL ,
	`StartTime` datetime NOT NULL ,
	`Duration` TINYINT NOT NULL ,
	`Status` varchar (15) COLLATE utf8_unicode_ci NOT NULL ,
	PRIMARY KEY  (`DriverAccountID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;


CREATE TABLE IF NOT EXISTS `tDriversCrossSection` (
	`CrossID` BIGINT NOT NULL auto_increment  ,
	`HBID` TINYINT NOT NULL ,
	`CompanyID` TINYINT NOT NULL ,
	`DateCreated` datetime NOT NULL ,
	`Pending` TINYINT NOT NULL ,
	`Applicant` TINYINT NOT NULL ,
	`Hired` TINYINT NOT NULL ,
	`HiredActive` TINYINT NOT NULL ,
	`HiredInactive` TINYINT NOT NULL ,
	`Declined` TINYINT NOT NULL ,
	`Denied` TINYINT NOT NULL ,
	`Terminated` TINYINT NOT NULL ,
	`NoComplDrivers` BIGINT NOT NULL ,
	`NoComplItems` BIGINT NOT NULL ,
	`NoComplDriversByNSC` BIGINT NOT NULL ,
	`NoComplItemsByNSC` BIGINT NOT NULL ,
	PRIMARY KEY  (`CrossID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;


CREATE TABLE IF NOT EXISTS `tDriversNoncomplientItemSum` (
	`NoncompID` BIGINT NOT NULL auto_increment  ,
	`DateCreated` datetime NOT NULL ,
	`HBID` TINYINT NOT NULL ,
	`CompanyID` TINYINT NOT NULL ,
	`CDLExpired` TINYINT NOT NULL ,
	`RAExpired` TINYINT NOT NULL ,
	`MDExpired` TINYINT NOT NULL ,
	`AnRevExpired` TINYINT NOT NULL ,
	`RecViolExpired` TINYINT NOT NULL ,
	`MissCreatedNeverScanned` TINYINT NOT NULL ,
	`MissRequiredFormDocument` TINYINT NOT NULL ,
	`MissingRA` TINYINT NOT NULL ,
	`MissingPrevEmploy` TINYINT NOT NULL ,
	`MissingRADIWData` TINYINT NOT NULL ,
	`MissingMDDIWData` TINYINT NOT NULL ,
	`MissingAddressDIWData` TINYINT NOT NULL ,
	`MissingCDLDIWData` TINYINT NOT NULL ,
	`MissingPrevEmplLDIWData` TINYINT NOT NULL ,
	`MissingAccDIWData` TINYINT NOT NULL ,
	`MissingViolDIWData` TINYINT NOT NULL ,
	`MissingVehDIWData` TINYINT NOT NULL ,
	`MissRequiredFormDocumentForVeh` TINYINT NOT NULL ,
	`VehInsExpired` TINYINT NOT NULL ,
	`VehRegExpired` TINYINT NOT NULL ,
	PRIMARY KEY  (`NoncompID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;


CREATE TABLE IF NOT EXISTS `tFaxRequest` (
	`FaxRequestID` BIGINT NOT NULL auto_increment  ,
	`DQFDocID` BIGINT NOT NULL ,
	`RequestDate` datetime NOT NULL ,
	`RequestByUserID` BIGINT NOT NULL ,
	`SubmitDate` datetime NULL ,
	`SubmitByUserID` BIGINT NOT NULL ,
	`Status` varchar (15) COLLATE utf8_unicode_ci NOT NULL ,
	PRIMARY KEY  (`FaxRequestID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;


CREATE TABLE IF NOT EXISTS `tFile` (
	`FileID` BIGINT NOT NULL auto_increment  ,
	`DriverID` BIGINT NOT NULL ,
	`HomeBaseID` BIGINT NOT NULL ,
	`Created` datetime NOT NULL ,
	`Status` varchar (10) COLLATE utf8_unicode_ci NOT NULL ,
	`TerminationDate` datetime NOT NULL ,
	`NSCCheck` TINYINT NOT NULL ,
	`NSCCheckAction` varchar (50) COLLATE utf8_unicode_ci NOT NULL ,
	`VendorID` BIGINT NOT NULL ,
	`ActiveStatus` varchar (10) COLLATE utf8_unicode_ci NOT NULL ,
	`DOTCheck` TINYINT NOT NULL ,
	`LocationID` TINYINT NOT NULL ,
	PRIMARY KEY  (`FileID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;


CREATE TABLE IF NOT EXISTS `tHBStaff` (
	`HBStaffID` BIGINT NOT NULL auto_increment  ,
	`HomeBaseID` BIGINT NOT NULL ,
	`FirstName` varchar (20) COLLATE utf8_unicode_ci NOT NULL ,
	`LastName` varchar (20) COLLATE utf8_unicode_ci NOT NULL ,
	`Title` varchar (50) COLLATE utf8_unicode_ci NOT NULL ,
	`Role` varchar (20) COLLATE utf8_unicode_ci NOT NULL ,
	`Telephone` varchar (30) COLLATE utf8_unicode_ci NOT NULL ,
	`Email` varchar (100) COLLATE utf8_unicode_ci NOT NULL ,
	`Status` varchar (10) COLLATE utf8_unicode_ci NOT NULL ,
	`Created` datetime NOT NULL ,
	`CreatedByUserID` BIGINT NOT NULL ,
	`DQF` TINYINT NOT NULL ,
	`VIM` TINYINT NOT NULL ,
	`Accident` TINYINT NOT NULL ,
	PRIMARY KEY  (`HBStaffID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;


CREATE TABLE IF NOT EXISTS `tHomeBase` (
	`HomeBaseID` BIGINT NOT NULL auto_increment  ,
	`CompanyID` BIGINT NOT NULL ,
	`HomeBaseName` varchar (100) COLLATE utf8_unicode_ci NOT NULL ,
	`HomeBaseCode` varchar (20) COLLATE utf8_unicode_ci NOT NULL ,
	`Address` varchar (100) COLLATE utf8_unicode_ci NOT NULL ,
	`City` varchar (50) COLLATE utf8_unicode_ci NOT NULL ,
	`State` varchar (2) COLLATE utf8_unicode_ci NOT NULL ,
	`Zip` varchar (20) COLLATE utf8_unicode_ci NOT NULL ,
	`Telephone` varchar (30) COLLATE utf8_unicode_ci NOT NULL ,
	`Fax` varchar (30) COLLATE utf8_unicode_ci NOT NULL ,
	`Status` varchar (10) COLLATE utf8_unicode_ci NOT NULL ,
	`StartDate` datetime NOT NULL ,
	`Created` datetime NOT NULL ,
	`Url` varchar (100) COLLATE utf8_unicode_ci NOT NULL ,
	`DQFModul` varchar (3) COLLATE utf8_unicode_ci NOT NULL ,
	`TruckModul` varchar (3) COLLATE utf8_unicode_ci NOT NULL ,
	`NewDriverRate` double NOT NULL ,
	`MonthlyDriverRate` double NOT NULL ,
	`NewVehicleRate` double NOT NULL ,
	`MonthlyVehicleRate` double NOT NULL ,
	`RenewDriverRate` double NOT NULL ,
	`NewTruckRate` double NOT NULL ,
	`MonthlyTruckRate` double NOT NULL ,
	PRIMARY KEY  (`HomeBaseID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;


CREATE TABLE IF NOT EXISTS `tHomeBaseLocations` (
	`LocationID` TINYINT NOT NULL auto_increment  ,
	`HomeBaseID` TINYINT NOT NULL ,
	`CompanyID` TINYINT NOT NULL ,
	`LocationCode` varchar (20) COLLATE utf8_unicode_ci NOT NULL ,
	`LocationDistrict` varchar (20) COLLATE utf8_unicode_ci NOT NULL ,
	`LocationAddress` varchar (20) COLLATE utf8_unicode_ci NOT NULL ,
	`LocationCity` varchar (20) COLLATE utf8_unicode_ci NOT NULL ,
	`LocationState` varchar (3) COLLATE utf8_unicode_ci NOT NULL ,
	`LocationZIP` varchar (10) COLLATE utf8_unicode_ci NOT NULL ,
	`MngFirstName` varchar (20) COLLATE utf8_unicode_ci NOT NULL ,
	`MngLastName` varchar (20) COLLATE utf8_unicode_ci NOT NULL ,
	`MngEmail` varchar (20) COLLATE utf8_unicode_ci NOT NULL ,
	`LocationPhone` varchar (20) COLLATE utf8_unicode_ci NOT NULL ,
	`LocationFax` varchar (20) COLLATE utf8_unicode_ci NOT NULL ,
	`LocationCell` varchar (20) COLLATE utf8_unicode_ci NOT NULL ,
	PRIMARY KEY  (`LocationID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;


CREATE TABLE IF NOT EXISTS `tInvoice` (
	`InvoiceID` BIGINT NOT NULL auto_increment  ,
	`InvoiceForHBID` BIGINT NOT NULL ,
	`FileID` BIGINT NOT NULL ,
	`InvoiceType` varchar (20) COLLATE utf8_unicode_ci NOT NULL ,
	`InvoiceDate` datetime NOT NULL ,
	`Name` varchar (50) COLLATE utf8_unicode_ci NOT NULL ,
	`ForYear` varchar (4) COLLATE utf8_unicode_ci NOT NULL ,
	`Created` datetime NOT NULL ,
	`ByUserID` BIGINT NOT NULL ,
	PRIMARY KEY  (`InvoiceID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;


CREATE TABLE IF NOT EXISTS `tInvoiceForHB` (
	`InvoiceForHBID` BIGINT NOT NULL auto_increment  ,
	`HomeBaseID` BIGINT NOT NULL ,
	`InvoiceType` varchar (20) COLLATE utf8_unicode_ci NOT NULL ,
	`InvoiceDate` datetime NOT NULL ,
	`Rate` double NOT NULL ,
	PRIMARY KEY  (`InvoiceForHBID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;


CREATE TABLE IF NOT EXISTS `tInvoiceTruck` (
	`InvoiceID` BIGINT NOT NULL auto_increment  ,
	`InvoiceForHBID` BIGINT NOT NULL ,
	`TruckFileID` BIGINT NOT NULL ,
	`InvoiceType` varchar (20) COLLATE utf8_unicode_ci NOT NULL ,
	`InvoiceDate` datetime NOT NULL ,
	`Name` varchar (50) COLLATE utf8_unicode_ci NOT NULL ,
	`ForYear` varchar (4) COLLATE utf8_unicode_ci NOT NULL ,
	`Created` datetime NOT NULL ,
	`ByUserID` BIGINT NOT NULL ,
	PRIMARY KEY  (`InvoiceID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;


CREATE TABLE IF NOT EXISTS `tInvoiceTruckForHB` (
	`InvoiceForHBID` BIGINT NOT NULL auto_increment  ,
	`HomeBaseID` BIGINT NOT NULL ,
	`InvoiceType` varchar (20) COLLATE utf8_unicode_ci NOT NULL ,
	`InvoiceDate` datetime NOT NULL ,
	`Rate` double NOT NULL ,
	PRIMARY KEY  (`InvoiceForHBID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;


CREATE TABLE IF NOT EXISTS `tLoginUrl` (
	`LoginID` TINYINT NOT NULL auto_increment  ,
	`CompanyCode` varchar (20) COLLATE utf8_unicode_ci NOT NULL ,
	`HBCode` varchar (20) COLLATE utf8_unicode_ci NOT NULL ,
	`LoginUrl` varchar (100) COLLATE utf8_unicode_ci NOT NULL ,
	PRIMARY KEY  (`LoginID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;


CREATE TABLE IF NOT EXISTS `tMError` (
	`ErrorID` BIGINT NOT NULL auto_increment  ,
	`SessionID` varchar (50) COLLATE utf8_unicode_ci NOT NULL ,
	`ModuleName` varchar (500) COLLATE utf8_unicode_ci NOT NULL ,
	`Created` datetime NOT NULL ,
	`ErrorType` TINYINT NOT NULL ,
	`SystemMsg` varchar (5000) COLLATE utf8_unicode_ci NOT NULL ,
	`CustomerMsg` varchar (800) COLLATE utf8_unicode_ci NOT NULL ,
	`ActionType` varchar (50) COLLATE utf8_unicode_ci NOT NULL ,
	PRIMARY KEY  (`ErrorID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;


CREATE TABLE IF NOT EXISTS `tNSCStaff` (
	`NSCStaffID` BIGINT NOT NULL auto_increment  ,
	`FirstName` varchar (20) COLLATE utf8_unicode_ci NOT NULL ,
	`LastName` varchar (20) COLLATE utf8_unicode_ci NOT NULL ,
	`Title` varchar (50) COLLATE utf8_unicode_ci NOT NULL ,
	`Telephone` varchar (30) COLLATE utf8_unicode_ci NOT NULL ,
	`Email` varchar (100) COLLATE utf8_unicode_ci NOT NULL ,
	`Role` varchar (20) COLLATE utf8_unicode_ci NOT NULL ,
	`Status` varchar (10) COLLATE utf8_unicode_ci NOT NULL ,
	`Created` datetime NOT NULL ,
	`CreatedByUserID` BIGINT NOT NULL ,
	PRIMARY KEY  (`NSCStaffID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;


CREATE TABLE IF NOT EXISTS `tSession` (
	`SID` BIGINT NOT NULL ,
	`RID` varchar (12) COLLATE utf8_unicode_ci NOT NULL ,
	`UserID` BIGINT NOT NULL ,
	`CurrentHBID` BIGINT NOT NULL ,
	`LastClickTime` datetime NOT NULL ,
	`StartTime` datetime NOT NULL ,
	`SessionStatus` TINYINT NOT NULL ,
	`CurrentCompanyID` INT NOT NULL ,
	UNIQUE  (`SID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;


CREATE TABLE IF NOT EXISTS `tSetup` (
	`SetupID` BIGINT NOT NULL auto_increment  ,
	`ParentID` BIGINT NOT NULL ,
	`SetupName` varchar (50) COLLATE utf8_unicode_ci NOT NULL ,
	`Status` TINYINT NOT NULL ,
	`Code` varchar (20) COLLATE utf8_unicode_ci NOT NULL ,
	PRIMARY KEY  (`SetupID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;


CREATE TABLE IF NOT EXISTS `tTIW` (
	`TIWID` int NOT NULL auto_increment  ,
	`TruckFileID` int NOT NULL ,
	`TruckVendorID` TINYINT NOT NULL ,
	`EntryDate` datetime NOT NULL ,
	`DateOfHire` datetime NOT NULL ,
	`AppDate` datetime NOT NULL ,
	`AppNumber` varchar (20) COLLATE utf8_unicode_ci NOT NULL ,
	`VehType` varchar (20) COLLATE utf8_unicode_ci NOT NULL ,
	`UnitNumber` varchar (25) COLLATE utf8_unicode_ci NOT NULL ,
	`Year` varchar (10) COLLATE utf8_unicode_ci NOT NULL ,
	`Make` varchar (20) COLLATE utf8_unicode_ci NOT NULL ,
	`Model` varchar (20) COLLATE utf8_unicode_ci NOT NULL ,
	`Color` varchar (15) COLLATE utf8_unicode_ci NOT NULL ,
	`UnladenWeight` BIGINT NOT NULL ,
	`GVW` INT NOT NULL ,
	`NumOfAxles` varchar (10) COLLATE utf8_unicode_ci NOT NULL ,
	`LicPlateNum` varchar (20) COLLATE utf8_unicode_ci NOT NULL ,
	`RegState` varchar (20) COLLATE utf8_unicode_ci NOT NULL ,
	`RegExpDate` datetime NOT NULL ,
	`VehicleValue` BIGINT NOT NULL ,
	`LastEvaluationDate` datetime NOT NULL ,
	`InsCompany` varchar (30) COLLATE utf8_unicode_ci NOT NULL ,
	`InsPolicyNum` varchar (30) COLLATE utf8_unicode_ci NOT NULL ,
	`InsExpDate` datetime NOT NULL ,
	`AppType` varchar (10) COLLATE utf8_unicode_ci NOT NULL ,
	`InsLimits` BIGINT NOT NULL ,
	`NSCCheck` varchar (3) COLLATE utf8_unicode_ci NOT NULL ,
	`RFID` varchar (15) COLLATE utf8_unicode_ci NOT NULL ,
	`ProfitCN` varchar (15) COLLATE utf8_unicode_ci NOT NULL ,
	`ProfitCNLocation` varchar (30) COLLATE utf8_unicode_ci NOT NULL ,
	`OwningCompany` varchar (50) COLLATE utf8_unicode_ci NOT NULL ,
	`IRP` varchar (20) COLLATE utf8_unicode_ci NOT NULL ,
	`IFTASticker` varchar (20) COLLATE utf8_unicode_ci NOT NULL ,
	`Weight2290` varchar (10) COLLATE utf8_unicode_ci NOT NULL ,
	`TitleStatus` varchar (20) COLLATE utf8_unicode_ci NOT NULL ,
	`GVRW` BIGINT NOT NULL ,
	`HUT` varchar (10) COLLATE utf8_unicode_ci NOT NULL ,
	`IFTAStickerExpDate` datetime NOT NULL ,
	PRIMARY KEY  (`TIWID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;


CREATE TABLE IF NOT EXISTS `tTIWBITInspection` (
	`TIWBITInspID` TINYINT NOT NULL auto_increment  ,
	`TIWID` TINYINT NOT NULL ,
	`InspectorName` varchar (30) COLLATE utf8_unicode_ci NOT NULL ,
	`InspCompany` varchar (100) COLLATE utf8_unicode_ci NOT NULL ,
	`Result` varchar (15) COLLATE utf8_unicode_ci NOT NULL ,
	`ShopNote` text COLLATE utf8_unicode_ci NOT NULL ,
	`BITExpDate` datetime NOT NULL ,
	`ReinspectionDate` datetime NOT NULL ,
	`Created` datetime NOT NULL ,
	`InspectionDate` datetime NOT NULL ,
	`InspectorNumber` varchar (15) COLLATE utf8_unicode_ci NOT NULL ,
	`InspectionFormNumber` varchar (25) COLLATE utf8_unicode_ci NOT NULL ,
	`InspectionType` varchar (10) COLLATE utf8_unicode_ci NOT NULL ,
	`DOTExpDate` datetime NOT NULL ,
	`InspectorCertification` varchar (100) COLLATE utf8_unicode_ci NOT NULL ,
	`InspectorID` TINYINT NOT NULL ,
	`InsCompanyID` TINYINT NOT NULL ,
	PRIMARY KEY  (`TIWBITInspID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;


CREATE TABLE IF NOT EXISTS `tTIWDISInspection` (
	`TIWDISInspID` TINYINT NOT NULL auto_increment  ,
	`TIWID` TINYINT NOT NULL ,
	`InspectorName` varchar (30) COLLATE utf8_unicode_ci NOT NULL ,
	`InspCompany` varchar (30) COLLATE utf8_unicode_ci NOT NULL ,
	`Result` varchar (15) COLLATE utf8_unicode_ci NOT NULL ,
	`ShopNote` text COLLATE utf8_unicode_ci NOT NULL ,
	`DISExpDate` datetime NOT NULL ,
	`ReinspectionDate` datetime NOT NULL ,
	`Created` datetime NOT NULL ,
	`InspectionDate` datetime NOT NULL ,
	`InspectorNumber` varchar (15) COLLATE utf8_unicode_ci NOT NULL ,
	`InspectionFormNumber` varchar (25) COLLATE utf8_unicode_ci NOT NULL ,
	`InspectionType` varchar (20) COLLATE utf8_unicode_ci NOT NULL ,
	`StickerNumber` varchar (20) COLLATE utf8_unicode_ci NOT NULL ,
	PRIMARY KEY  (`TIWDISInspID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;


CREATE TABLE IF NOT EXISTS `tTruck` (
	`TruckID` BIGINT NOT NULL auto_increment  ,
	`VIN` varchar (30) COLLATE utf8_unicode_ci NOT NULL ,
	`Created` datetime NOT NULL ,
	PRIMARY KEY  (`TruckID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;


CREATE TABLE IF NOT EXISTS `tTruckActionSystem` (
	`ActionSystemID` BIGINT NOT NULL auto_increment  ,
	`ActionType` varchar (15) COLLATE utf8_unicode_ci NOT NULL ,
	`ActionDate` datetime NOT NULL ,
	`ToHomeBaseID` BIGINT NOT NULL ,
	`ToUserID` BIGINT NOT NULL ,
	`Confirmed` TINYINT NOT NULL ,
	PRIMARY KEY  (`ActionSystemID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;


CREATE TABLE IF NOT EXISTS `tTruckActionSystemForFile` (
	`ActionSystemForFileID` BIGINT NOT NULL auto_increment  ,
	`ActionSystemID` BIGINT NOT NULL ,
	`TruckFileID` BIGINT NOT NULL ,
	`TIWID` BIGINT NOT NULL ,
	`ExpType` varchar (20) COLLATE utf8_unicode_ci NOT NULL ,
	`Expires` datetime NOT NULL ,
	`Created` datetime NOT NULL ,
	`ActionType` varchar (15) COLLATE utf8_unicode_ci NOT NULL ,
	PRIMARY KEY  (`ActionSystemForFileID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;


CREATE TABLE IF NOT EXISTS `tTruckAppCheck` (
	`AppCheckID` TINYINT NOT NULL auto_increment  ,
	`TIWID` TINYINT NOT NULL ,
	`CheckReview` varchar (1) COLLATE utf8_unicode_ci NOT NULL ,
	`CheckBIT` varchar (1) COLLATE utf8_unicode_ci NOT NULL ,
	`CheckPicture` varchar (1) COLLATE utf8_unicode_ci NOT NULL ,
	`CheckReqDoc` varchar (1) COLLATE utf8_unicode_ci NOT NULL ,
	`CheckVehReg` varchar (1) COLLATE utf8_unicode_ci NOT NULL ,
	`CheckInsSert` varchar (1) COLLATE utf8_unicode_ci NOT NULL ,
	PRIMARY KEY  (`AppCheckID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;
-- ============================================================================
-- ============================================================================

CREATE TABLE IF NOT EXISTS `tTruckDoc` (
	`DocID` TINYINT NOT NULL auto_increment  ,
	`DocType` varchar (10) COLLATE utf8_unicode_ci NOT NULL ,
	`Category` varchar (30) COLLATE utf8_unicode_ci NOT NULL ,
	`DocTitle` varchar (100) COLLATE utf8_unicode_ci NOT NULL ,
	`DocCode` varchar (10) COLLATE utf8_unicode_ci NOT NULL ,
	`HasPDF` TINYINT NOT NULL ,
	`PDFFile` varchar (100) COLLATE utf8_unicode_ci NOT NULL ,
	`HasScan` TINYINT NOT NULL ,
	`Muitiple` TINYINT NOT NULL ,
	`PageNum` TINYINT NOT NULL ,
	PRIMARY KEY  (`DocID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;


CREATE TABLE IF NOT EXISTS `tTruckDriver` (
	`DriverID` TINYINT NOT NULL ,
	`TruckID` TINYINT NOT NULL ,
	`Created` datetime NOT NULL ,
	`HBID` BIGINT NOT NULL 
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci  ;


CREATE TABLE IF NOT EXISTS `tTruckFile` (
	`TruckFileID` BIGINT NOT NULL auto_increment  ,
	`TruckID` BIGINT NOT NULL ,
	`HomeBaseID` BIGINT NOT NULL ,
	`Created` datetime NOT NULL ,
	`Status` varchar (20) COLLATE utf8_unicode_ci NOT NULL ,
	`TerminationDate` datetime NOT NULL ,
	`VendorID` TINYINT NOT NULL ,
	`DOTCheck` TINYINT NOT NULL ,
	PRIMARY KEY  (`TruckFileID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;


CREATE TABLE IF NOT EXISTS `tTruckInspectionCompany` (
	`InsCompanyID` TINYINT NOT NULL auto_increment  ,
	`CompanyID` TINYINT NOT NULL ,
	`HBID` TINYINT NOT NULL ,
	`InsCompanyName` varchar (100) COLLATE utf8_unicode_ci NOT NULL ,
	`InsCompanyAddress` varchar (100) COLLATE utf8_unicode_ci NOT NULL ,
	`InsCompanyCity` varchar (50) COLLATE utf8_unicode_ci NOT NULL ,
	`InsCompanyState` varchar (10) COLLATE utf8_unicode_ci NOT NULL ,
	`InsCompanyZIP` varchar (10) COLLATE utf8_unicode_ci NOT NULL ,
	`InsCompCreated` datetime NOT NULL ,
	PRIMARY KEY  (`InsCompanyID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;


CREATE TABLE IF NOT EXISTS `tTruckInspector` (
	`InspectorID` TINYINT NOT NULL auto_increment  ,
	`InsCompanyID` TINYINT NOT NULL ,
	`InspectorFirstName` varchar (50) COLLATE utf8_unicode_ci NOT NULL ,
	`InspectorLastName` varchar (50) COLLATE utf8_unicode_ci NOT NULL ,
	`InspectorNumber` varchar (50) COLLATE utf8_unicode_ci NOT NULL ,
	`InspectorCreated` datetime NOT NULL ,
	`InspectorCertificate` varchar (100) COLLATE utf8_unicode_ci NOT NULL ,
	PRIMARY KEY  (`InspectorID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;


CREATE TABLE IF NOT EXISTS `tTruckInspectorCertificate` (
	`InspectorCertificateID` TINYINT NOT NULL auto_increment  ,
	`InspectorID` TINYINT NOT NULL ,
	`InspectorCertificate` varchar (100) COLLATE utf8_unicode_ci NOT NULL ,
	`InspectorCertificateCreated` datetime NOT NULL ,
	PRIMARY KEY  (`InspectorCertificateID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;


CREATE TABLE IF NOT EXISTS `tTruckMaintenance` (
	`MaintenanceID` TINYINT NOT NULL auto_increment  ,
	`TIWID` TINYINT NOT NULL ,
	`RequestedDate` datetime NOT NULL ,
	`CompletedDate` datetime NOT NULL ,
	`NextMaintDate` datetime NOT NULL ,
	`MaintNumber` varchar (20) COLLATE utf8_unicode_ci NOT NULL ,
	`Amount` BIGINT NOT NULL ,
	`MaintCompany` varchar (30) COLLATE utf8_unicode_ci NOT NULL ,
	`MaintMonth` varchar (10) COLLATE utf8_unicode_ci NOT NULL ,
	`Notes` text COLLATE utf8_unicode_ci NOT NULL ,
	`Created` datetime NOT NULL ,
	PRIMARY KEY  (`MaintenanceID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;


CREATE TABLE IF NOT EXISTS `tTruckQFDoc` (
	`TruckQFDocID` BIGINT NOT NULL auto_increment  ,
	`TIWID` BIGINT NOT NULL ,
	`DocID` BIGINT NOT NULL ,
	`Status` varchar (15) COLLATE utf8_unicode_ci NOT NULL ,
	`Requested` datetime NOT NULL ,
	`Completed` datetime NOT NULL ,
	`TIWBITInspID` BIGINT NOT NULL ,
	`ScanDateTime` varchar (50) COLLATE utf8_unicode_ci NOT NULL ,
	`Created` datetime NOT NULL ,
	`OtherTitle` varchar (200) COLLATE utf8_unicode_ci NOT NULL ,
	`TIWDISInspID` BIGINT NOT NULL ,
	PRIMARY KEY  (`TruckQFDocID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;


CREATE TABLE IF NOT EXISTS `tUser` (
	`UserID` BIGINT NOT NULL auto_increment  ,
	`UserType` varchar (20) COLLATE utf8_unicode_ci NOT NULL ,
	`StaffID` BIGINT NOT NULL ,
	`HomeBaseID` BIGINT NOT NULL ,
	`CompanyID` BIGINT NOT NULL ,
	`Username` varchar (20) COLLATE utf8_unicode_ci NOT NULL ,
	`Password` varchar (20) COLLATE utf8_unicode_ci NOT NULL ,
	`Agreed` TINYINT NOT NULL ,
	PRIMARY KEY  (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;


CREATE TABLE IF NOT EXISTS `tVIW` (
	`VIWID` TINYINT NOT NULL auto_increment  ,
	`VendorFileID` TINYINT NOT NULL ,
	`VendorCode` varchar (25) COLLATE utf8_unicode_ci NOT NULL ,
	`AppType` varchar (15) COLLATE utf8_unicode_ci NOT NULL ,
	`CompanyName` varchar (50) COLLATE utf8_unicode_ci NOT NULL ,
	`FirstName` varchar (20) COLLATE utf8_unicode_ci NOT NULL ,
	`LastName` varchar (20) COLLATE utf8_unicode_ci NOT NULL ,
	`Address` varchar (50) COLLATE utf8_unicode_ci NOT NULL ,
	`City` varchar (20) COLLATE utf8_unicode_ci NOT NULL ,
	`ZIP` varchar (15) COLLATE utf8_unicode_ci NOT NULL ,
	`State` varchar (5) COLLATE utf8_unicode_ci NOT NULL ,
	`Phone` varchar (12) COLLATE utf8_unicode_ci NOT NULL ,
	`Fax` varchar (12) COLLATE utf8_unicode_ci NOT NULL ,
	`Email` varchar (50) COLLATE utf8_unicode_ci NOT NULL ,
	`EntryDate` datetime NOT NULL ,
	`DateOfHire` datetime NOT NULL ,
	`AppDate` datetime NOT NULL ,
	`AppNumber` varchar (20) COLLATE utf8_unicode_ci NOT NULL ,
	PRIMARY KEY  (`VIWID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;


CREATE TABLE IF NOT EXISTS `tVendor` (
	`VendorID` TINYINT NOT NULL auto_increment  ,
	`SSN` varchar (12) COLLATE utf8_unicode_ci NOT NULL ,
	`FederalID` varchar (20) COLLATE utf8_unicode_ci NOT NULL ,
	`Created` datetime NOT NULL ,
	PRIMARY KEY  (`VendorID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;


CREATE TABLE IF NOT EXISTS `tVendorAppCheck` (
	`AppCheckID` TINYINT NOT NULL auto_increment  ,
	`VIWID` TINYINT NOT NULL ,
	`CheckReview` varchar (1) COLLATE utf8_unicode_ci NOT NULL ,
	`CheckContract` varchar (1) COLLATE utf8_unicode_ci NOT NULL ,
	PRIMARY KEY  (`AppCheckID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;


CREATE TABLE IF NOT EXISTS `tVendorContract` (
	`ContractID` TINYINT NOT NULL auto_increment  ,
	`VIWID` TINYINT NOT NULL ,
	`ContractNum` varchar (20) COLLATE utf8_unicode_ci NOT NULL ,
	`DateOfContractSign` datetime NOT NULL ,
	`ExpDateContract` datetime NOT NULL ,
	`ContractSign` varchar (10) COLLATE utf8_unicode_ci NOT NULL ,
	`ContractFileName` varchar (100) COLLATE utf8_unicode_ci NOT NULL ,
	`UnitNumber` varchar (25) COLLATE utf8_unicode_ci NOT NULL ,
	`TruckID` BIGINT NOT NULL ,
	PRIMARY KEY  (`ContractID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;


CREATE TABLE IF NOT EXISTS `tVendorDoc` (
	`DocID` TINYINT NOT NULL auto_increment  ,
	`DocType` varchar (10) COLLATE utf8_unicode_ci NOT NULL ,
	`Category` varchar (30) COLLATE utf8_unicode_ci NOT NULL ,
	`DocTitle` varchar (100) COLLATE utf8_unicode_ci NOT NULL ,
	`DocCode` varchar (10) COLLATE utf8_unicode_ci NOT NULL ,
	`HasPDF` TINYINT NOT NULL ,
	`PDFFile` varchar (100) COLLATE utf8_unicode_ci NOT NULL ,
	`HasScan` TINYINT NOT NULL ,
	`Multiple` TINYINT NOT NULL ,
	`PageNum` TINYINT NOT NULL ,
	PRIMARY KEY  (`DocID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;


CREATE TABLE IF NOT EXISTS `tVendorDriver` (
	`VendDriverID` TINYINT NOT NULL auto_increment  ,
	`VendorID` TINYINT NOT NULL ,
	`DriverID` TINYINT NOT NULL ,
	`VendorCode` varchar (15) COLLATE utf8_unicode_ci NOT NULL ,
	PRIMARY KEY  (`VendDriverID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;


CREATE TABLE IF NOT EXISTS `tVendorFile` (
	`VendorFileID` TINYINT NOT NULL auto_increment  ,
	`VendorID` TINYINT NOT NULL ,
	`HomeBaseID` BIGINT NOT NULL ,
	`Created` datetime NOT NULL ,
	`Status` varchar (10) COLLATE utf8_unicode_ci NOT NULL ,
	`TerminationDate` datetime NOT NULL ,
	PRIMARY KEY  (`VendorFileID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;


CREATE TABLE IF NOT EXISTS `tVendorQFDoc` (
	`VendorQFDocID` BIGINT NOT NULL auto_increment  ,
	`VIWID` BIGINT NOT NULL ,
	`DocID` BIGINT NOT NULL ,
	`Status` varchar (15) COLLATE utf8_unicode_ci NOT NULL ,
	`Requested` datetime NOT NULL ,
	`Completed` datetime NOT NULL ,
	`ContractID` TINYINT NOT NULL ,
	`ScanDateTime` varchar (50) COLLATE utf8_unicode_ci NOT NULL ,
	`Created` datetime NOT NULL ,
	`OtherTitle` varchar (100) COLLATE utf8_unicode_ci NOT NULL ,
	PRIMARY KEY  (`VendorQFDocID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;


CREATE TABLE IF NOT EXISTS `vAccidentListForAllHB` (
	`AccidentID` BIGINT NOT NULL ,
	`AccDate` datetime NOT NULL ,
	`Created` datetime NOT NULL ,
	`AccFileID` BIGINT NOT NULL ,
	`Status` varchar (10) COLLATE utf8_unicode_ci NOT NULL ,
	`HomeBaseID` BIGINT NOT NULL ,
	`AccIWID` BIGINT NOT NULL ,
	`City` varchar (30) COLLATE utf8_unicode_ci NOT NULL ,
	`State` varchar (4) COLLATE utf8_unicode_ci NOT NULL ,
	`FirstName` varchar (30) COLLATE utf8_unicode_ci NOT NULL ,
	`LastName` varchar (30) COLLATE utf8_unicode_ci NOT NULL ,
	`EmployeeDrID` BIGINT NOT NULL 
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci  ;


CREATE TABLE IF NOT EXISTS `vAllHB` (
	`CompanyID` BIGINT NOT NULL ,
	`CompanyName` varchar (100) COLLATE utf8_unicode_ci NOT NULL ,
	`CompanyCode` varchar (20) COLLATE utf8_unicode_ci NOT NULL ,
	`Address` varchar (100) COLLATE utf8_unicode_ci NOT NULL ,
	`City` varchar (50) COLLATE utf8_unicode_ci NOT NULL ,
	`State` varchar (2) COLLATE utf8_unicode_ci NOT NULL ,
	`Zip` varchar (20) COLLATE utf8_unicode_ci NOT NULL ,
	`Telephone` varchar (30) COLLATE utf8_unicode_ci NOT NULL ,
	`Fax` varchar (30) COLLATE utf8_unicode_ci NOT NULL ,
	`Created` datetime NOT NULL ,
	`P1FirstName` varchar (50) COLLATE utf8_unicode_ci NOT NULL ,
	`P1LastName` varchar (50) COLLATE utf8_unicode_ci NOT NULL ,
	`P1Title` varchar (50) COLLATE utf8_unicode_ci NOT NULL ,
	`P1Telephone` varchar (30) COLLATE utf8_unicode_ci NOT NULL ,
	`P1Email` varchar (100) COLLATE utf8_unicode_ci NOT NULL ,
	`P1Role` varchar (30) COLLATE utf8_unicode_ci NOT NULL ,
	`P1Status` varchar (10) COLLATE utf8_unicode_ci NOT NULL ,
	`HomeBaseID` varchar (100) COLLATE utf8_unicode_ci NOT NULL ,
	`HomeBaseName` BIGINT NULL ,
	`HomeBaseCode` varchar (100) COLLATE utf8_unicode_ci NULL ,
	`HBAddress` varchar (20) COLLATE utf8_unicode_ci NULL ,
	`HBCity` varchar (100) COLLATE utf8_unicode_ci NULL ,
	`HBState` varchar (50) COLLATE utf8_unicode_ci NULL ,
	`HBZip` varchar (2) COLLATE utf8_unicode_ci NULL ,
	`HBTelephone` varchar (20) COLLATE utf8_unicode_ci NULL ,
	`HBFax` varchar (30) COLLATE utf8_unicode_ci NULL ,
	`HBStatus` varchar (30) COLLATE utf8_unicode_ci NULL ,
	`HBStartDate` varchar (10) COLLATE utf8_unicode_ci NULL ,
	`HBCreated` datetime NULL 
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;


CREATE TABLE IF NOT EXISTS `vFileDocTypes` (
	`DocID` BIGINT NOT NULL ,
	`FileID` BIGINT NOT NULL 
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci  ;


CREATE TABLE IF NOT EXISTS `vLastAnnualReview` (
	`FileID` BIGINT NOT NULL ,
	`DQFDocID` BIGINT NOT NULL ,
	`DIWID` BIGINT NOT NULL ,
	`DocID` BIGINT NOT NULL ,
	`Status` varchar (15) COLLATE utf8_unicode_ci NOT NULL ,
	`Requested` datetime NOT NULL ,
	`Completed` datetime NOT NULL ,
	`DIWEmployerID` BIGINT NOT NULL ,
	`ScanDateTime` varchar (20) COLLATE utf8_unicode_ci NOT NULL ,
	`Created` datetime NOT NULL ,
	`OtherTitle` varchar (200) COLLATE utf8_unicode_ci NOT NULL 
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci  ;


CREATE TABLE IF NOT EXISTS `vLastDIWForHBForArchives` (
	`DIWID` BIGINT NULL 
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci  ;


CREATE TABLE IF NOT EXISTS `vLastRecordOfViolations` (
	`FileID` BIGINT NOT NULL ,
	`DQFDocID` BIGINT NOT NULL ,
	`DIWID` BIGINT NOT NULL ,
	`DocID` BIGINT NOT NULL ,
	`Status` varchar (15) COLLATE utf8_unicode_ci NOT NULL ,
	`Requested` datetime NOT NULL ,
	`Completed` datetime NOT NULL ,
	`DIWEmployerID` BIGINT NOT NULL ,
	`ScanDateTime` varchar (20) COLLATE utf8_unicode_ci NOT NULL ,
	`Created` datetime NOT NULL ,
	`OtherTitle` varchar (200) COLLATE utf8_unicode_ci NOT NULL 
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


CREATE TABLE IF NOT EXISTS `vLastTIWforHB` (
	`TIWID` int NULL 
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci  ;


CREATE TABLE IF NOT EXISTS `vLastVIWForHB` (
	`VIWID` TINYINT NULL 
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci  ;


CREATE TABLE IF NOT EXISTS `vLastVIWIDforHB` (
	`VIWID` TINYINT NULL 
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;


-- ======================================================================
-- ======================================================================
/*
ALTER TABLE `tAccFile` WITH NOCHECK ADD 
	CONSTRAINT `PK_tAccFile` PRIMARY KEY  CLUSTERED 
	(
		`AccFileID`
	) WITH  FILLFACTOR = 90  ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ; 
GO

ALTER TABLE `tAccIW` WITH NOCHECK ADD 
	CONSTRAINT `PK_tAccIW` PRIMARY KEY  CLUSTERED 
	(
		`AccIWID`
	) WITH  FILLFACTOR = 90  ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ; 
GO

ALTER TABLE `tAccLightningData` WITH NOCHECK ADD 
	CONSTRAINT `PK_tAccLightningData` PRIMARY KEY  CLUSTERED 
	(
		`LightningDataID`
	) WITH  FILLFACTOR = 90  ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ; 
GO

ALTER TABLE `tAccOtherDriver` WITH NOCHECK ADD 
	CONSTRAINT `PK_tAccOtherDriver` PRIMARY KEY  CLUSTERED 
	(
		`OtherDrID`
	) WITH  FILLFACTOR = 90  ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ; 
GO

ALTER TABLE `tAccOtherMovement` WITH NOCHECK ADD 
	CONSTRAINT `PK_tAccOtherMovement` PRIMARY KEY  CLUSTERED 
	(
		`OtherMovID`
	) WITH  FILLFACTOR = 90  ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ; 
GO

ALTER TABLE `tAccRadwayData` WITH NOCHECK ADD 
	CONSTRAINT `PK_tAccRadwayData` PRIMARY KEY  CLUSTERED 
	(
		`RoadwayDataID`
	) WITH  FILLFACTOR = 90  ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ; 
GO

ALTER TABLE `tAccRoadCondData` WITH NOCHECK ADD 
	CONSTRAINT `PK_tAccRoadCondData` PRIMARY KEY  CLUSTERED 
	(
		`RoadCondID`
	) WITH  FILLFACTOR = 90  ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ; 
GO

ALTER TABLE `tAccSurfaceData` WITH NOCHECK ADD 
	CONSTRAINT `PK_tAccSurfaceData` PRIMARY KEY  CLUSTERED 
	(
		`SurfaceDataID`
	) WITH  FILLFACTOR = 90  ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ; 
GO

ALTER TABLE `tAccTraficControl` WITH NOCHECK ADD 
	CONSTRAINT `PK_tAccTraficControl` PRIMARY KEY  CLUSTERED 
	(
		`TraficControlDataID`
	) WITH  FILLFACTOR = 90  ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ; 
GO

ALTER TABLE `tAccTraficData` WITH NOCHECK ADD 
	CONSTRAINT `PK_tAccTraficData` PRIMARY KEY  CLUSTERED 
	(
		`TrafficDataID`
	) WITH  FILLFACTOR = 90  ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ; 
GO

ALTER TABLE `tAccWeatherData` WITH NOCHECK ADD 
	CONSTRAINT `PK_tAccWeatherData` PRIMARY KEY  CLUSTERED 
	(
		`WeatherID`
	) WITH  FILLFACTOR = 90  ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ; 
GO

ALTER TABLE `tAccident` WITH NOCHECK ADD 
	CONSTRAINT `PK_tAccident` PRIMARY KEY  CLUSTERED 
	(
		`AccidentID`
	) WITH  FILLFACTOR = 90  ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ; 
GO

ALTER TABLE `tCompany` WITH NOCHECK ADD 
	CONSTRAINT `PK_tCompany` PRIMARY KEY  CLUSTERED 
	(
		`CompanyID`
	) WITH  FILLFACTOR = 90  ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ; 
GO

ALTER TABLE `tDIWAccident` WITH NOCHECK ADD 
	CONSTRAINT `PK_tDIWAccident` PRIMARY KEY  CLUSTERED 
	(
		`DIWAccidentID`
	) WITH  FILLFACTOR = 90  ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ; 
GO

ALTER TABLE `tDIWAddress` WITH NOCHECK ADD 
	CONSTRAINT `PK_tDIWAddress` PRIMARY KEY  CLUSTERED 
	(
		`DIWAddressID`
	) WITH  FILLFACTOR = 90  ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ; 
GO

ALTER TABLE `tDIWCDL` WITH NOCHECK ADD 
	CONSTRAINT `PK_tDIWCDL` PRIMARY KEY  CLUSTERED 
	(
		`DIWCDLID`
	) WITH  FILLFACTOR = 90  ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ; 
GO

ALTER TABLE `tDIWDataSheet` WITH NOCHECK ADD 
	CONSTRAINT `PK_tDIWDataSheet` PRIMARY KEY  CLUSTERED 
	(
		`DIWDataSheetID`
	) WITH  FILLFACTOR = 90  ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ; 
GO

ALTER TABLE `tDIWEmployer` WITH NOCHECK ADD 
	CONSTRAINT `PK_tDIWEmployer` PRIMARY KEY  CLUSTERED 
	(
		`DIWEmployerID`
	) WITH  FILLFACTOR = 90  ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ; 
GO

ALTER TABLE `tDIWVehicle` WITH NOCHECK ADD 
	CONSTRAINT `PK_tDIWVehicle` PRIMARY KEY  CLUSTERED 
	(
		`DIWVehicleID`
	) WITH  FILLFACTOR = 90  ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ; 
GO

ALTER TABLE `tDIWViolation` WITH NOCHECK ADD 
	CONSTRAINT `PK_tDIWViolation` PRIMARY KEY  CLUSTERED 
	(
		`DIWViolationID`
	) WITH  FILLFACTOR = 90  ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ; 
GO

ALTER TABLE `tDQFAnnualReview` WITH NOCHECK ADD 
	CONSTRAINT `PK_tDQFAnnualReview` PRIMARY KEY  CLUSTERED 
	(
		`DQFAnnualReviewID`
	) WITH  FILLFACTOR = 90  ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ; 
GO

ALTER TABLE `tDQFDisq383` WITH NOCHECK ADD 
	CONSTRAINT `PK_tDQFDisq383` PRIMARY KEY  CLUSTERED 
	(
		`DQFDisq383ID`
	) WITH  FILLFACTOR = 90  ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ; 
GO

ALTER TABLE `tDQFDisq391` WITH NOCHECK ADD 
	CONSTRAINT `PK_tDQFDisq391` PRIMARY KEY  CLUSTERED 
	(
		`DQFDisq391ID`
	) WITH  FILLFACTOR = 90  ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ; 
GO

ALTER TABLE `tDQFDoc` WITH NOCHECK ADD 
	CONSTRAINT `PK_tDQFDoc` PRIMARY KEY  CLUSTERED 
	(
		`DQFDocID`
	) WITH  FILLFACTOR = 90  ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ; 
GO

ALTER TABLE `tDoc` WITH NOCHECK ADD 
	CONSTRAINT `PK_tDoc` PRIMARY KEY  CLUSTERED 
	(
		`DocID`
	) WITH  FILLFACTOR = 90  ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ; 
GO

ALTER TABLE `tDriver` WITH NOCHECK ADD 
	CONSTRAINT `PK_tDriver` PRIMARY KEY  CLUSTERED 
	(
		`DriverID`
	) WITH  FILLFACTOR = 90  ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ; 
GO

ALTER TABLE `tDriverAccount` WITH NOCHECK ADD 
	CONSTRAINT `PK_tDriverAccount` PRIMARY KEY  CLUSTERED 
	(
		`DriverAccountID`
	) WITH  FILLFACTOR = 90  ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ; 
GO

ALTER TABLE `tFaxRequest` WITH NOCHECK ADD 
	CONSTRAINT `PK_tFaxRequest` PRIMARY KEY  CLUSTERED 
	(
		`FaxRequestID`
	) WITH  FILLFACTOR = 90  ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ; 
GO

ALTER TABLE `tFile` WITH NOCHECK ADD 
	CONSTRAINT `PK_tFile` PRIMARY KEY  CLUSTERED 
	(
		`FileID`
	) WITH  FILLFACTOR = 90  ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ; 
GO

ALTER TABLE `tHBStaff` WITH NOCHECK ADD 
	CONSTRAINT `PK_tHBStaff` PRIMARY KEY  CLUSTERED 
	(
		`HBStaffID`
	) WITH  FILLFACTOR = 90  ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ; 
GO

ALTER TABLE `tHomeBase` WITH NOCHECK ADD 
	CONSTRAINT `PK_tHomeBase` PRIMARY KEY  CLUSTERED 
	(
		`HomeBaseID`
	) WITH  FILLFACTOR = 90  ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ; 
GO

ALTER TABLE `tInvoice` WITH NOCHECK ADD 
	CONSTRAINT `PK_tInvoice` PRIMARY KEY  CLUSTERED 
	(
		`InvoiceID`
	) WITH  FILLFACTOR = 90  ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ; 
GO

ALTER TABLE `tInvoiceForHB` WITH NOCHECK ADD 
	CONSTRAINT `PK_tInvoiceForHB` PRIMARY KEY  CLUSTERED 
	(
		`InvoiceForHBID`
	) WITH  FILLFACTOR = 90  ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ; 
GO

ALTER TABLE `tInvoiceTruck` WITH NOCHECK ADD 
	CONSTRAINT `PK_tInvoiceTruck` PRIMARY KEY  CLUSTERED 
	(
		`InvoiceID`
	) WITH  FILLFACTOR = 90  ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ; 
GO

ALTER TABLE `tInvoiceTruckForHB` WITH NOCHECK ADD 
	CONSTRAINT `PK_tInvoiceTruckForHB` PRIMARY KEY  CLUSTERED 
	(
		`InvoiceForHBID`
	) WITH  FILLFACTOR = 90  ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ; 
GO

ALTER TABLE `tNSCStaff` WITH NOCHECK ADD 
	CONSTRAINT `PK_tNSCStaff` PRIMARY KEY  CLUSTERED 
	(
		`NSCStaffID`
	) WITH  FILLFACTOR = 90  ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ; 
GO

ALTER TABLE `tTIW` WITH NOCHECK ADD 
	CONSTRAINT `PK_tTIW` PRIMARY KEY  CLUSTERED 
	(
		`TIWID`
	) WITH  FILLFACTOR = 90  ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ; 
GO

ALTER TABLE `tTruck` WITH NOCHECK ADD 
	CONSTRAINT `PK_tTruck` PRIMARY KEY  CLUSTERED 
	(
		`TruckID`
	) WITH  FILLFACTOR = 90  ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ; 
GO

ALTER TABLE `tTruckFile` WITH NOCHECK ADD 
	CONSTRAINT `PK_tTruckFile` PRIMARY KEY  CLUSTERED 
	(
		`TruckFileID`
	) WITH  FILLFACTOR = 90  ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ; 
GO

ALTER TABLE `tTruckInspectionCompany` WITH NOCHECK ADD 
	CONSTRAINT `PK_tTruckInspectionCompany` PRIMARY KEY  CLUSTERED 
	(
		`InsCompanyID`
	) WITH  FILLFACTOR = 90  ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ; 
GO

ALTER TABLE `tTruckInspector` WITH NOCHECK ADD 
	CONSTRAINT `PK_tTruckInspector` PRIMARY KEY  CLUSTERED 
	(
		`InspectorID`
	) WITH  FILLFACTOR = 90  ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ; 
GO

ALTER TABLE `tTruckInspectorCertificate` WITH NOCHECK ADD 
	CONSTRAINT `PK_tTruckInspectorCertificate` PRIMARY KEY  CLUSTERED 
	(
		`InspectorCertificateID`
	) WITH  FILLFACTOR = 90  ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ; 
GO

ALTER TABLE `tUser` WITH NOCHECK ADD 
	CONSTRAINT `PK_tUser` PRIMARY KEY  CLUSTERED 
	(
		`UserID`
	) WITH  FILLFACTOR = 90  ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ; 
GO

ALTER TABLE `tVIW` WITH NOCHECK ADD 
	CONSTRAINT `PK_tVIW` PRIMARY KEY  CLUSTERED 
	(
		`VIWID`
	) WITH  FILLFACTOR = 90  ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ; 
GO

ALTER TABLE `tVendor` WITH NOCHECK ADD 
	CONSTRAINT `PK_tVendor` PRIMARY KEY  CLUSTERED 
	(
		`VendorID`
	) WITH  FILLFACTOR = 90  ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ; 
GO

ALTER TABLE `tVendorContract` WITH NOCHECK ADD 
	CONSTRAINT `PK_tVendorContract` PRIMARY KEY  CLUSTERED 
	(
		`ContractID`
	) WITH  FILLFACTOR = 90  ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ; 
GO

ALTER TABLE `tVendorFile` WITH NOCHECK ADD 
	CONSTRAINT `PK_tVendorFile` PRIMARY KEY  CLUSTERED 
	(
		`VendorFileID`
	) WITH  FILLFACTOR = 90  ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ; 
GO
*/
ALTER TABLE `tAccFile` 
	CHANGE `AccidentID` `AccidentID`  BIGINT DEFAULT '-1' ,
	CHANGE `HomeBaseID` `HomeBaseID`  BIGINT DEFAULT '-1' ,
	CHANGE `Status` `Status`  VARCHAR(20) DEFAULT 'Open' ,
	CHANGE `ClosingDate` `ClosingDate` DATE NOT NULL DEFAULT '1900-01-01',
	CHANGE `FileOpened` `FileOpened` DATE NOT NULL DEFAULT '1900-01-01',
	CHANGE `FileCreated` `FileCreated`  TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	CHANGE `DOTCheck` `DOTCheck`  TINYINT DEFAULT '0' 
	
	


ALTER TABLE `tAccIW` 
	CHANGE `AccFileID` `AccFileID`  BIGINT DEFAULT '-1' ,
	CHANGE `City` `City`  VARCHAR(30) DEFAULT '' ,
	CHANGE `County` `County`  VARCHAR(30) DEFAULT '' ,
	CHANGE `State` `State`  VARCHAR(4) DEFAULT '' ,
	CHANGE `AccLocation` `AccLocation`  VARCHAR(100) DEFAULT '' ,
	CHANGE `Intersection` `Intersection`  VARCHAR(100) DEFAULT '' ,
	CHANGE  `Distance`  `Distance` VARCHAR(20) DEFAULT '',
	CHANGE `DistFrom` `DistFrom` VARCHAR(100) DEFAULT '' ,
	CHANGE `AccTime` `AccTime` VARCHAR(15) DEFAULT '',
	CHANGE `PhotoBy` `PhotoBy` VARCHAR(30) DEFAULT '',
	CHANGE `SpeedLimit` `SpeedLimit` VARCHAR(10) DEFAULT '',
	CHANGE `Reported` `Reported` VARCHAR(5) DEFAULT '',
	CHANGE `PoliceDep` `PoliceDep` VARCHAR(20) DEFAULT '',
	CHANGE `Scatched` `Scatched` VARCHAR(5) DEFAULT '',
	CHANGE `OfficerName` `OfficerName` VARCHAR(40) DEFAULT '',
	CHANGE `ReportNum` `ReportNum` VARCHAR(40) DEFAULT '',
	CHANGE `FileOpened` `FileOpened` DATE NOT NULL DEFAULT '1900-01-01',
	CHANGE `AccNarative` `AccNarative` TEXT DEFAULT '' ,
	CHANGE `MileMarker` `MileMarker` TEXT DEFAULT '' ,
	CHANGE `Preventable` `Preventable` VARCHAR(3) DEFAULT '' ,
	CHANGE `AccType` `AccType` VARCHAR(15) DEFAULT 'Not Defined' ,
	CHANGE `AccNumber` `AccNumber` VARCHAR(50) DEFAULT '' ,
	CHANGE `HazmatSpill` `HazmatSpill` VARCHAR(3) DEFAULT 'No' ,
	CHANGE `FuelSpill` `FuelSpill` VARCHAR(3) DEFAULT 'No' 


ALTER TABLE `tAccLightningData` 
	CHANGE `AccIWID` `AccIWID` BIGINT  DEFAULT '-1' ,
	CHANGE `DayLight` `DayLight` VARCHAR(3) DEFAULT '' ,
	CHANGE `Dusk` `Dusk` VARCHAR(3) DEFAULT '' ,
	CHANGE `Down` `Down` VARCHAR(3) DEFAULT '' ,
	CHANGE `DarkLights` `DarkLights` VARCHAR(3) DEFAULT '' ,
	CHANGE `DarkNoLights` `DarkNoLights` VARCHAR(3) DEFAULT '' ,
	CHANGE `DarkLightsOff` `DarkLightsOff` VARCHAR(3) DEFAULT '' ,
	CHANGE `Other` `Other` VARCHAR(30) DEFAULT '' 


ALTER TABLE `tAccNarrative` 
	CHANGE `AccIWID` `AccIWID` BIGINT  DEFAULT '-1' ,
	CHANGE `AccNarrative` `AccNarrative` TEXT DEFAULT '' 


ALTER TABLE `tAccNotes` 
	CHANGE `AccWID` `AccWID` BIGINT  DEFAULT '-1' ,
	CHANGE `NotesDate` `NotesDate` DATE NOT NULL DEFAULT '1900-01-01' ,
	CHANGE `Notes` `Notes` TEXT DEFAULT '' 


ALTER TABLE `tAccOtherDriver` 
	CHANGE `HomeBaseID` `HomeBaseID` BIGINT DEFAULT '-1' ,
	CHANGE `SSN` `SSN` VARCHAR(11) DEFAULT '' ,
	CHANGE `FirstName` `FirstName` VARCHAR(15) DEFAULT '' ,
	CHANGE `LastName` `LastName` VARCHAR(15) DEFAULT '' ,
	CHANGE `MiddleName` `MiddleName` VARCHAR(15) DEFAULT '' ,
	CHANGE `BirthName` `BirthName` VARCHAR(15) DEFAULT '' ,
	CHANGE `StreetAddress` `StreetAddress` VARCHAR(30) DEFAULT '' ,
	CHANGE `CityAddress` `CityAddress` VARCHAR(20) DEFAULT '' ,
	CHANGE `StateAddress` `StateAddress` VARCHAR(5) DEFAULT '' ,
	CHANGE `ZIPAddress` `ZIPAddress` VARCHAR(6) DEFAULT '' ,
	CHANGE `CDLNumber` `CDLNumber` VARCHAR(15) DEFAULT '' ,
	CHANGE `State` `State` VARCHAR(5) DEFAULT '' ,
	CHANGE `Class` `Class` VARCHAR(5) DEFAULT '' ,
	CHANGE `Injured` `Injured` VARCHAR(3) DEFAULT '' ,
	CHANGE `InjuryDescription` `InjuryDescription` VARCHAR(200) DEFAULT '' ,
	CHANGE `killed` `killed` VARCHAR(3) DEFAULT '' ,
	CHANGE `HomePhone` `HomePhone` VARCHAR(15) DEFAULT '' ,
	CHANGE `BusinessPhone` `BusinessPhone` VARCHAR(15) DEFAULT '' ,
	CHANGE `InsuranceCarier` `InsuranceCarier` VARCHAR(30) DEFAULT '' ,
	CHANGE `InsPolicy` `InsPolicy` VARCHAR(20) DEFAULT '' ,
	CHANGE `TravDirection` `TravDirection` VARCHAR(3) DEFAULT '' ,
	CHANGE `OnStreet` `OnStreet` VARCHAR(30) DEFAULT '' ,
	CHANGE `Speed` `Speed` VARCHAR(3) DEFAULT '' ,
	CHANGE `SpeedMax` `SpeedMax` VARCHAR(3) DEFAULT '' ,
	CHANGE `Sex` `Sex` VARCHAR(7) DEFAULT '' ,
	CHANGE `HairColor` `HairColor` VARCHAR(10) DEFAULT '' ,
	CHANGE `Eyes` `Eyes` VARCHAR(10) DEFAULT '' ,
	CHANGE `HeightFeet` `HeightFeet` VARCHAR(3) DEFAULT '' ,
	CHANGE `HeightInch` `HeightInch` VARCHAR(3) DEFAULT '' ,
	CHANGE `Weight` `Weight` VARCHAR(3) DEFAULT '' ,
	CHANGE `NumberOfPassanger` `NumberOfPassanger` VARCHAR(2) DEFAULT '' ,
	CHANGE `DOB` `DOB` DATE NOT NULL DEFAULT '1900-01-01' 


ALTER TABLE `tAccOtherMovement` 
	CHANGE `OtherDrID` `OtherDrID` BIGINT DEFAULT '-1' ,
	CHANGE `Stopped` `Stopped` TINYINT DEFAULT '0' ,
	CHANGE `ProceedingStraight` `ProceedingStraight` TINYINT DEFAULT '0' ,
	CHANGE `RunOffRoadway` `RunOffRoadway` TINYINT DEFAULT '0' ,
	CHANGE `MakingRightTurn` `MakingRightTurn` TINYINT DEFAULT '0' ,
	CHANGE `MakingLeftTurn` `MakingLeftTurn` TINYINT DEFAULT '0' ,
	CHANGE `MakingUTurn` `MakingUTurn` TINYINT DEFAULT '0' ,
	CHANGE `Backing` `Backing` TINYINT DEFAULT '0' ,
	CHANGE `Slowing` `Slowing` TINYINT DEFAULT '0' ,
	CHANGE `Stopping` `Stopping` TINYINT DEFAULT '0' ,
	CHANGE `Passing` `Passing` TINYINT DEFAULT '0' ,
	CHANGE `ChangingLanes` `ChangingLanes` TINYINT DEFAULT '0' ,
	CHANGE `Parking` `Parking` TINYINT DEFAULT '0' ,
	CHANGE `EnteringTraffic` `EnteringTraffic` TINYINT DEFAULT '0' ,
	CHANGE `UnsafeTurning` `UnsafeTurning` TINYINT DEFAULT '0' ,
	CHANGE `Parked` `Parked` TINYINT DEFAULT '0' ,
	CHANGE `Merging` `Merging` TINYINT DEFAULT '0' ,
	CHANGE `WrongWay` `WrongWay` TINYINT DEFAULT '0' ,
	CHANGE `Other` `Other` TEXT DEFAULT '' 


ALTER TABLE `tAccOtherVehicle` 
	CHANGE `HomeBaseID` `HomeBaseID` BIGINT DEFAULT '-1' ,
	CHANGE `Make` `Make` varchar(20) DEFAULT '' ,
	CHANGE `Model` `Model` varchar(20) DEFAULT '' ,
	CHANGE `Color` `Color` varchar(20) DEFAULT '' ,
	CHANGE `ProdYear` `ProdYear` varchar(5) DEFAULT '' ,
	CHANGE `LicPlate` `LicPlate` varchar(15) DEFAULT '' ,
	CHANGE `State` `State` varchar(5) DEFAULT '' ,
	CHANGE `OwnersFirstName` `OwnersFirstName` varchar(20) DEFAULT '' ,
	CHANGE `OwnersLastName` `OwnersLastName` varchar(20) DEFAULT '' ,
	CHANGE `OwnersMiddleName` `OwnersMiddleName` varchar(20) DEFAULT '' ,
	CHANGE `OwnersStreetAddress` `OwnersStreetAddress` varchar(20) DEFAULT '' ,
	CHANGE `OwnersCityAddress` `OwnersCityAddress` varchar(20) DEFAULT '' ,
	CHANGE `OwnersStateAddress` `OwnersStateAddress` varchar(20) DEFAULT '' ,
	CHANGE `OwnersZIPAddress` `OwnersZIPAddress` varchar(5) DEFAULT '' ,
	CHANGE `VIN` `VIN` varchar(25) DEFAULT '' ,
	CHANGE `Towed` `Towed` varchar(50) DEFAULT '' ,
	CHANGE `DOT` `DOT` varchar(10) DEFAULT '' ,
	CHANGE `Damage` `Damage` TEXT DEFAULT '' ,
	CHANGE `PhotoTaken` `PhotoTaken` varchar(3) DEFAULT '' ,
	CHANGE `InsCompany` `InsCompany` varchar(30) DEFAULT '' ,
	CHANGE `InsPolicyNum` `InsPolicyNum` varchar(30) DEFAULT '' ,
	CHANGE `InsExpDate` `InsExpDate` DATE NOT NULL DEFAULT '1900-01-01' ,
	CHANGE `VehicleValue` `VehicleValue` BIGINT DEFAULT '0' ,
	CHANGE `DamageEstimate` `DamageEstimate` BIGINT DEFAULT '0' 


ALTER TABLE `tAccRadwayData` 
	CHANGE `AccIWID` `AccIWID` BIGINT DEFAULT '-1' ,
	CHANGE `Oneway` `Oneway` VARCHAR(3) DEFAULT '' ,
	CHANGE `Twoway` `Twoway` VARCHAR(3) DEFAULT '' ,
	CHANGE `TwoLane` `TwoLane` VARCHAR(3) DEFAULT '' ,
	CHANGE `ThreeLane` `ThreeLane` VARCHAR(3) DEFAULT '' ,
	CHANGE `FourLane` `FourLane` VARCHAR(3) DEFAULT '' ,
	CHANGE `Other` `Other` VARCHAR(200) DEFAULT ''


ALTER TABLE `tAccRoadCondData` 
	CHANGE `AccIWID` `AccIWID` BIGINT DEFAULT '-1' ,
	CHANGE `Holes` `Holes` varchar(3) DEFAULT '' ,
	CHANGE `LooseMaterial` `LooseMaterial` varchar(3) DEFAULT '-1' ,
	CHANGE `Obstruction` `Obstruction` varchar(3) DEFAULT '' ,
	CHANGE `Construction` `Construction` varchar(3) DEFAULT '' ,
	CHANGE `ReducedRoadway` `ReducedRoadway` varchar(3) DEFAULT '' ,
	CHANGE `Flooded` `Flooded` varchar(3) DEFAULT '' ,
	CHANGE `NoUnusual` `NoUnusual` varchar(3) DEFAULT '' ,
	CHANGE `Other` `Other` varchar(30) DEFAULT '' 


ALTER TABLE `tAccSurfaceData` 
	CHANGE `AccIWID` `AccIWID` BIGINT DEFAULT '-1' ,
	CHANGE `Dry` `Dry` varchar(3) DEFAULT '' ,
	CHANGE `Wet` `Wet` varchar(3) DEFAULT '' ,
	CHANGE `Snow` `Snow` varchar(3) DEFAULT '' ,
	CHANGE `Icy` `Icy` varchar(3) DEFAULT '' ,
	CHANGE `Muddy` `Muddy` varchar(3) DEFAULT '' ,
	CHANGE `Oily` `Oily` varchar(3) DEFAULT '' ,
	CHANGE `Other` `Other` varchar(30) DEFAULT '' 


ALTER TABLE `tAccTraficControl` 
	CHANGE `AccIWID` `AccIWID` BIGINT DEFAULT '-1' ,
	CHANGE `Functioning` `Functioning` varchar(3) DEFAULT '' ,
	CHANGE `NotFunctioning` `NotFunctioning` varchar(3) DEFAULT '' ,
	CHANGE `NoControl` `NoControl` varchar(3) DEFAULT '' ,
	CHANGE `Obscured` `Obscured` varchar(3) DEFAULT '' ,
	CHANGE `Other` `Other` varchar(30) DEFAULT '' 


ALTER TABLE `tAccTraficData` 
	CHANGE `AccIWID` `AccIWID` BIGINT DEFAULT '-1' ,
	CHANGE `Light` `Light` varchar(3) DEFAULT '' ,
	CHANGE `Heavy` `Heavy` varchar(3) DEFAULT '' ,
	CHANGE `Medium` `Medium` varchar(3) DEFAULT '' ,
	CHANGE `Other` `Other` varchar(30) DEFAULT '' 


ALTER TABLE `tAccWeatherData` 
	CHANGE `AccIWID` `AccIWID` BIGINT DEFAULT '-1' ,
	CHANGE `ClearW` `ClearW` varchar(3) DEFAULT '' ,
	CHANGE `Cloudy` `Cloudy` varchar(3) DEFAULT '' ,
	CHANGE `Raining` `Raining` varchar(3) DEFAULT '' ,
	CHANGE `Snowing` `Snowing` varchar(3) DEFAULT '' ,
	CHANGE `Fog` `Fog` varchar(3) DEFAULT '' ,
	CHANGE `Wind` `Wind` varchar(3) DEFAULT '' ,
	CHANGE `Other` `Other` varchar(30) DEFAULT '' 


ALTER TABLE `tAccident` 
	CHANGE `Created` `Created` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	CHANGE `AccDate` `AccDate` DATE NOT NULL DEFAULT '1900-01-01' 


ALTER TABLE `tActionDriver` 
	CHANGE `HomeBaseID` `HomeBaseID` BIGINT DEFAULT '-1' ,
	CHANGE `DIWID` `DIWID` BIGINT DEFAULT '-1' ,
	CHANGE `ActionType` `ActionType` varchar(15) DEFAULT '' ,
	CHANGE `Status` `Status` varchar(15) DEFAULT '' ,
	CHANGE `FromDate` `FromDate` DATE NOT NULL DEFAULT '1900-01-01' ,
	CHANGE `ValidForDays` `ValidForDays` TINYINT DEFAULT "1" ,
	CHANGE `ValidForMin` `ValidForMin` TINYINT DEFAULT "90" ,
	CHANGE `StartDateTime` `StartDateTime` DATE NOT NULL DEFAULT '1900-01-01' ,
	CHANGE `EndDateTime` `EndDateTime` DATE NOT NULL DEFAULT '1900-01-01' ,
	CHANGE `Created` `Created` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	CHANGE `CreatedByUserID` `CreatedByUserID`  BIGINT DEFAULT '-1' 
;

ALTER TABLE `tActionSystem` 
	CHANGE `ActionType` `ActionType` varchar(15) DEFAULT '' ,
	CHANGE `ActionDate` `ActionDate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	CHANGE `ToHomeBaseID` `ToHomeBaseID` bigint DEFAULT '-1' ,
	CHANGE `ToUserID` `ToUserID` bigint DEFAULT '-1' ,
	CHANGE `Confirmed` `Confirmed` tinyint DEFAULT '0' 
;

ALTER TABLE `tActionSystemForFile` 
	CHANGE `ActionSystemID` `ActionSystemID` bigint DEFAULT '-1' ,
	CHANGE `FileID` `FileID` bigint DEFAULT '-1' ,
	CHANGE `DIWID` `DIWID` bigint DEFAULT '-1' ,
	CHANGE `ExpType` `ExpType` varchar(20) DEFAULT '' ,
	CHANGE `Expires` `Expires` DATE NOT NULL DEFAULT '1900-01-01' ,
	CHANGE `Created` `Created` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	CHANGE `ActionType` `ActionType` varchar(15) DEFAULT '' 
;

ALTER TABLE `tActionUser` 
	CHANGE `HomeBaseID` `HomeBaseID` bigint DEFAULT '-1' ,
	CHANGE `ActionType` `ActionType` varchar(100) DEFAULT '' ,
	CHANGE `ActionDate` `ActionDate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ,
	CHANGE `ActionOn` `ActionOn` varchar(20) DEFAULT '' ,
	CHANGE `OnID` `OnID` bigint DEFAULT '-1' ,
	CHANGE `ByName` `ByName` varchar(50) DEFAULT '' ,
	CHANGE `ByUserID` `ByUserID` bigint DEFAULT '-1' ,
	CHANGE `Parameters` `Parameters` TEXT DEFAULT '' ,
	CHANGE `Comment` `Comment` TEXT DEFAULT '' 
;

ALTER TABLE `tAppCheck` 
	CHANGE `DIWID` `DIWID` bigint DEFAULT '-1' ,
	CHANGE `CheckReview` `CheckReview` TINYINT( 1 )  DEFAULT '0' ,
	CHANGE `CheckPrintForms` `CheckPrintForms` TINYINT( 1 )  DEFAULT '0' ,
	CHANGE `CheckScanAllForms` `CheckScanAllForms` TINYINT( 1 )  DEFAULT '0' ,
	CHANGE `CheckSignature` `CheckSignature` TINYINT( 1 )  DEFAULT '0' ,
	CHANGE `CheckPicture` `CheckPicture` TINYINT( 1 )  DEFAULT '0' ,
	CHANGE `CheckScan` `CheckScan` TINYINT( 1 )  DEFAULT '0' ,
	CHANGE `CheckAutoFax` `CheckAutoFax` TINYINT( 1 )  DEFAULT '0' 
;

ALTER TABLE `tCStaff` 
	CHANGE `CompanyID` `CompanyID` bigint DEFAULT '-1' ,
	CHANGE `FirstName` `FirstName` varchar(50) DEFAULT '' ,
	CHANGE `LastName` `LastName` varchar(50) DEFAULT '' ,
	CHANGE `Title` `Title` varchar(50) DEFAULT '' ,
	CHANGE `Telephone` `Telephone` varchar(30) DEFAULT '' ,
	CHANGE `Email` `Email` varchar(100) DEFAULT '' ,
	CHANGE `Role` `Role` varchar(30) DEFAULT '' ,
	CHANGE `Status` `Status` varchar(10) DEFAULT '' ,
	CHANGE `Created` `Created` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ,
	CHANGE `DQF` `DQF` TINYINT( 1 )  DEFAULT '1' ,
	CHANGE `VIM` `VIM` TINYINT( 1 )  DEFAULT '1' ,
	CHANGE `Accident` `Accident` TINYINT( 1 )  DEFAULT '1' 
;

ALTER TABLE `tCompany` 
	CHANGE `CompanyName` `CompanyName` varchar(100) DEFAULT '' ,
	CHANGE `CompanyCode` `CompanyCode` varchar(20) DEFAULT '' ,
	CHANGE `Address` `Address` varchar(100) DEFAULT '' ,
	CHANGE `City` `City` varchar(50) DEFAULT '' ,
	CHANGE `State` `State` varchar(2) DEFAULT '' ,
	CHANGE `Zip` `Zip` varchar(20) DEFAULT '' ,
	CHANGE `Telephone` `Telephone` varchar(30) DEFAULT '' ,
	CHANGE `Fax` `Fax` varchar(30) DEFAULT '' ,
	CHANGE `Created` `Created` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ,
	CHANGE `P1FirstName` `P1FirstName` varchar(50) DEFAULT '' ,
	CHANGE `P1LastName` `P1LastName` varchar(50) DEFAULT '' ,
	CHANGE `P1Title` `P1Title` varchar(50) DEFAULT '' ,
	CHANGE `P1Telephone` `P1Telephone` varchar(30) DEFAULT '' ,
	CHANGE `P1Email` `P1Email` varchar(100) DEFAULT '' ,
	CHANGE `P1Role` `P1Role` varchar(30) DEFAULT '' ,
	CHANGE `P1Status` `P1Status` varchar(10) DEFAULT '' ,
	CHANGE `Url` `Url` varchar(100) DEFAULT 'https://www.driverqualificationonline.com/nschanson'
;

ALTER TABLE `tCompanyDoc` 
	CHANGE `DocType` `DocType` varchar(30) DEFAULT '' ,
	CHANGE `Category` `Category` varchar(30) DEFAULT '' ,
	CHANGE `DocTitle` `DocTitle` varchar(100) DEFAULT '' ,
	CHANGE `DocCode` `DocCode` varchar(10) DEFAULT '' ,
	CHANGE `HasPDF` `HasPDF` TINYINT( 1 ) DEFAULT '0' ,
	CHANGE `PDFFile` `PDFFile` varchar(100) DEFAULT '' ,
	CHANGE `HasScan` `HasScan` TINYINT( 1 ) DEFAULT '0' ,
	CHANGE `Multiple` `Multiple` TINYINT( 1 ) DEFAULT '0' ,
	CHANGE `PageNum` `PageNum` TINYINT(4) DEFAULT '-1' 
;

ALTER TABLE `tCompanyDocList` 
	CHANGE `CompanyID` `CompanyID` bigint DEFAULT '-1' ,
	CHANGE `DocID` `DocID` bigint DEFAULT '-1' ,
	CHANGE `Status` `Status` VARCHAR(15) DEFAULT '' ,
	CHANGE `Requested` `Requested` DATE NOT NULL DEFAULT '1900-01-01' ,
	CHANGE `Completed` `Completed` DATE NOT NULL DEFAULT '1900-01-01' ,
	CHANGE `ScanDateTime` `ScanDateTime` DATETIME NULL DEFAULT NULL,
	CHANGE `Created` `Created` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ,
	CHANGE `OtherTitle` `OtherTitle` VARCHAR(200) DEFAULT '' 
;

ALTER TABLE `tDIW` 
	CHANGE `FileID` `FileID` bigint DEFAULT '-1' ,
	CHANGE `EntryDate` `EntryDate` DATETIME NOT NULL COMMENT 'при обновлении - установить текущее время и дату',
	CHANGE `AppDate` `AppDate` DATE NOT NULL DEFAULT '1900-01-01' ,
	CHANGE `AppType` `AppType` VARCHAR(15) DEFAULT '' ,
	CHANGE `AppNumber` `AppNumber` VARCHAR(20) DEFAULT '' ,
	CHANGE `DateOfHire` `DateOfHire` DATE NOT NULL DEFAULT '1900-01-01' ,
	CHANGE `TruckNumber` `TruckNumber` VARCHAR(20) DEFAULT '' ,
	CHANGE `FirstName` `FirstName` VARCHAR(20) DEFAULT '' ,
	CHANGE `LastName` `LastName` VARCHAR(20) DEFAULT '' ,
	CHANGE `MiddleName` `MiddleName` VARCHAR(20) DEFAULT '' ,
	CHANGE `BirthName` `BirthName` VARCHAR(100) DEFAULT '' ,
	CHANGE `RANumber` `RANumber` VARCHAR(20) DEFAULT '' ,
	CHANGE `RAExpDate` `RAExpDate` DATE NOT NULL DEFAULT '1900-01-01' ,
	CHANGE `MedNumber` `MedNumber` VARCHAR(20) DEFAULT '' ,
	CHANGE `MedExpDate` `MedExpDate` DATE NOT NULL DEFAULT '1900-01-01' ,
	CHANGE `MedExaminerName` `MedExaminerName` VARCHAR(50) DEFAULT '' ,
	CHANGE `StraightTruck` `StraightTruck` varchar(3) DEFAULT 'No' ,
	CHANGE `STFromDate` `STFromDate` DATE NOT NULL DEFAULT '1900-01-01' ,
	CHANGE `STToDate` `STToDate` DATE NOT NULL DEFAULT '1900-01-01' ,
	CHANGE `STTotalMiles` `STTotalMiles` VARCHAR(10) DEFAULT '' ,
	CHANGE `TractorSemiTrailer` `TractorSemiTrailer` VARCHAR(3) DEFAULT 'No' ,
	CHANGE `TSTFromDate` `TSTFromDate` DATE NOT NULL DEFAULT '1900-01-01' ,
	CHANGE `TSTToDate` `TSTToDate` DATE NOT NULL DEFAULT '1900-01-01' ,
	CHANGE `TSTTotalMiles` `TSTTotalMiles` VARCHAR(10) DEFAULT '' ,
	CHANGE `DoublesTriples` `DoublesTriples` VARCHAR(3) DEFAULT 'No' ,
	CHANGE `DTFromDate` `DTFromDate` DATE NOT NULL DEFAULT '1900-01-01' ,
	CHANGE `DTToDate` `DTToDate` DATE NOT NULL DEFAULT '1900-01-01' ,
	CHANGE `DTTotalMiles` `DTTotalMiles` VARCHAR(10) DEFAULT '' ,
	CHANGE `Busses` `Busses` VARCHAR(3) DEFAULT 'No' ,
	CHANGE `BusFromDate` `BusFromDate` DATE NOT NULL DEFAULT '1900-01-01' ,
	CHANGE `BusToDate` `BusToDate` DATE NOT NULL DEFAULT '1900-01-01' ,
	CHANGE `BusTotalMiles` `BusTotalMiles` VARCHAR(10) DEFAULT '' ,
	CHANGE `Tankers` `Tankers` VARCHAR(3) DEFAULT 'No' ,
	CHANGE `TanFromDate` `TanFromDate` DATE NOT NULL DEFAULT '1900-01-01' ,
	CHANGE `TanToDate` `TanToDate` DATE NOT NULL DEFAULT '1900-01-01' ,
	CHANGE `TanTotalMiles` `TanTotalMiles` VARCHAR(100) DEFAULT '' ,
	CHANGE `OtherEquip` `OtherEquip` VARCHAR(3) DEFAULT 'No' ,
	CHANGE `OthFromDate` `OthFromDate` DATE NOT NULL DEFAULT '1900-01-01' ,
	CHANGE `OthToDate` `OthToDate` DATE NOT NULL DEFAULT '1900-01-01' ,
	CHANGE `OthTotalMiles` `OthTotalMiles` VARCHAR(10) DEFAULT '' ,
	CHANGE `OthDescribe` `OthDescribe` VARCHAR(200) DEFAULT '' ,
	CHANGE `DeniedCDL` `DeniedCDL` VARCHAR(3) DEFAULT '' ,
	CHANGE `DeniedCDLExplain` `DeniedCDLExplain` VARCHAR(200) DEFAULT '' ,
	CHANGE `SuspCDL` `SuspCDL` VARCHAR(3) DEFAULT '' ,
	CHANGE `SuspCDLExplain` `SuspCDLExplain` VARCHAR(200) DEFAULT '' ,
	CHANGE `CopyStatus` `CopyStatus` VARCHAR(15) DEFAULT 'Incomplete' ,
	CHANGE `Created` `Created` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ,
	CHANGE `NoRA` `NoRA` tinyint(1) DEFAULT '0' ,
	CHANGE `NoAcc` `NoAcc` tinyint(1) DEFAULT '0' ,
	CHANGE `NoViol` `NoViol` tinyint(1) DEFAULT '0' ,
	CHANGE `NoEmpl` `NoEmpl` tinyint(1) DEFAULT '0' ,
	CHANGE `DriverCode` `DriverCode` VARCHAR(30) DEFAULT '' ,
	CHANGE `TWICSerial` `TWICSerial` VARCHAR(50) DEFAULT '-1' ,
	CHANGE `TWICExpDate` `TWICExpDate` DATE NOT NULL DEFAULT '1900-01-01' ,
	CHANGE `NextelPhone` `NextelPhone` VARCHAR(15) DEFAULT '' ,
	CHANGE `NextelPhoneSerial` `NextelPhoneSerial` VARCHAR(20) DEFAULT '' ,
	CHANGE `RadioFrequency` `RadioFrequency` VARCHAR(15) DEFAULT '' ,
	CHANGE `RadioSerial` `RadioSerial` VARCHAR(20) DEFAULT '' 
;

ALTER TABLE `tDIWAccident` 
	CHANGE `DIWID` `DIWID` bigint DEFAULT '-1' ,
	CHANGE `AccDate` `AccDate` DATE NOT NULL DEFAULT '1900-01-01' ,
	CHANGE `City` `City` VARCHAR(50) DEFAULT '' ,
	CHANGE `State` `State` VARCHAR(3) DEFAULT '' ,
	CHANGE `AccType` `AccType` VARCHAR(30) DEFAULT '' ,
	CHANGE `Fatalies` `Fatalies` VARCHAR(3) DEFAULT '' ,
	CHANGE `Injuries` `Injuries` VARCHAR(3) DEFAULT '' ,
	CHANGE `OrderNo` `OrderNo` tinyint DEFAULT '-1' 
;

ALTER TABLE `tDIWAddress` 
	CHANGE `DIWID` `DIWID` bigint DEFAULT '-1' ,
	CHANGE `Address` `Address` VARCHAR(200) DEFAULT '' ,
	CHANGE `City` `City` VARCHAR(50) DEFAULT '' ,
	CHANGE `State` `State` VARCHAR(3) DEFAULT '' ,
	CHANGE `Zip` `Zip` VARCHAR(20) DEFAULT '', 
	CHANGE `Phone` `Phone` VARCHAR(30) DEFAULT '' ,
	CHANGE `YearsAtAddress` `YearsAtAddress` VARCHAR(2) DEFAULT '' ,
	CHANGE `MonthsAtAddress` `MonthsAtAddress` VARCHAR(2) DEFAULT '' ,
	CHANGE `FromDate` `FromDate` DATE NOT NULL DEFAULT '1900-01-01' ,
	CHANGE `CurrAddress` `CurrAddress` VARCHAR(3) DEFAULT 'No' 
;

ALTER TABLE `tDIWCDL` 
	CHANGE `DIWID` `DIWID` bigint DEFAULT '-1' ,
	CHANGE `CDLNumber` `CDLNumber` VARCHAR(20) DEFAULT '' ,
	CHANGE `State` `State` VARCHAR(3) DEFAULT '' ,
	CHANGE `Class` `Class` VARCHAR(1) DEFAULT '' ,
	CHANGE `EndorP` `EndorP` VARCHAR(3) DEFAULT '' ,
	CHANGE `EndorT` `EndorT` VARCHAR(3) DEFAULT '' ,
	CHANGE `EndorH` `EndorH` VARCHAR(3) DEFAULT '' ,
	CHANGE `EndorN` `EndorN` VARCHAR(3) DEFAULT '' ,
	CHANGE `EndorX` `EndorX` VARCHAR(3) DEFAULT '' ,
	CHANGE `AirBrakeRestriction` `AirBrakeRestriction` VARCHAR(3) DEFAULT '0' ,
	CHANGE `Expires` `Expires` DATE NOT NULL DEFAULT '1900-01-01' ,
	CHANGE `CDLCurrent` `CDLCurrent` VARCHAR(3) DEFAULT '0' ,
	CHANGE `OrderNo` `OrderNo` tinyint DEFAULT '-1' 
;

ALTER TABLE `tDIWDataSheet` 
	CHANGE `DIWID` `DIWID` bigint DEFAULT '-1' ,
	CHANGE `Date1` `Date1` DATE NOT NULL DEFAULT '1900-01-01' ,
	CHANGE `Hours1` `Hours1` VARCHAR(2) DEFAULT '' ,
	CHANGE `Date2` `Date2` DATE NOT NULL DEFAULT '1900-01-01' ,
	CHANGE `Hours2` `Hours2` VARCHAR(2) DEFAULT '' ,
	CHANGE `Date3` `Date3` DATE NOT NULL DEFAULT '1900-01-01' ,
	CHANGE `Hours3` `Hours3` VARCHAR(2) DEFAULT '' ,
	CHANGE `Date4` `Date4` DATE NOT NULL DEFAULT '1900-01-01' ,
	CHANGE `Hours4` `Hours4` VARCHAR(2) DEFAULT '' ,
	CHANGE `Date5` `Date5` DATE NOT NULL DEFAULT '1900-01-01' ,
	CHANGE `Hours5` `Hours5` VARCHAR(2) DEFAULT '' ,
	CHANGE `Date6` `Date6` DATE NOT NULL DEFAULT '1900-01-01' ,
	CHANGE `Hours6` `Hours6` VARCHAR(2) DEFAULT '' ,
	CHANGE `Date7` `Date7` DATE NOT NULL DEFAULT '1900-01-01' ,
	CHANGE `Hours7` `Hours7` VARCHAR(2) DEFAULT '' ,
	CHANGE `LastRelievedDate` `LastRelievedDate` DATE NOT NULL DEFAULT '1900-01-01' ,
	CHANGE `LastRelievedTime` `LastRelievedTime` VARCHAR(10) DEFAULT '' 
;

ALTER TABLE `tDIWEmployer` 
	CHANGE `DIWID` `DIWID` bigint DEFAULT '-1' ,
	CHANGE `Employer` `Employer` VARCHAR(200) DEFAULT '' ,
	CHANGE `Address` `Address` VARCHAR(200) DEFAULT '' ,
	CHANGE `City` `City` VARCHAR(50) DEFAULT '' ,
	CHANGE `State` `State` VARCHAR(2) DEFAULT '' ,
	CHANGE `Zip` `Zip` VARCHAR(20) DEFAULT '' ,
	CHANGE `Telephone` `Telephone` VARCHAR(30) DEFAULT '' ,
	CHANGE `Fax` `Fax` VARCHAR(30) DEFAULT '',
	CHANGE `Job` `Job` VARCHAR(200) DEFAULT '' ,
	CHANGE `FromMonth` `FromMonth` VARCHAR(3) DEFAULT '0' ,
	CHANGE `FromYear` `FromYear` VARCHAR(5) DEFAULT '0' ,
	CHANGE `ToMonth` `ToMonth` VARCHAR(3) DEFAULT '0' ,
	CHANGE `ToYear` `ToYear` VARCHAR(5) DEFAULT '0' ,
	CHANGE `Reason` `Reason` VARCHAR(100) DEFAULT '' 
;

ALTER TABLE `tDIWVehicle` 
	CHANGE `DIWID` `DIWID` bigint DEFAULT '-1' ,
	CHANGE `OwnerFirstName` `OwnerFirstName` VARCHAR(20) DEFAULT '' ,
	CHANGE `OwnerLastName` `OwnerLastName` VARCHAR(20) DEFAULT '' ,
	CHANGE `VehicleType` `VehicleType` VARCHAR(30) DEFAULT '' ,
	CHANGE `NumberOfAxles` `NumberOfAxles` VARCHAR(5) DEFAULT '' ,
	CHANGE `LicPlateNumber` `LicPlateNumber` VARCHAR(20) DEFAULT '' ,
	CHANGE `VIN` `VIN` VARCHAR(30) DEFAULT '',
	CHANGE `RegExpDate` `RegExpDate` DATE NOT NULL DEFAULT '1900-01-01' ,
	CHANGE `ValueOfVehicle` `ValueOfVehicle` VARCHAR(15) DEFAULT '' ,
	CHANGE `InsCompany` `InsCompany` VARCHAR(100) DEFAULT '' ,
	CHANGE `InsPolicy` `InsPolicy` VARCHAR(20) DEFAULT '' ,
	CHANGE `InsExpDate` `InsExpDate` DATE NOT NULL DEFAULT '1900-01-01' ,
	CHANGE `InsLimits` `InsLimits` VARCHAR(200) DEFAULT '' 
;

ALTER TABLE `tDIWViolation` 
	CHANGE `DIWID` `DIWID` bigint DEFAULT '-1' ,
	CHANGE `ViolDate` `ViolDate` DATE NOT NULL DEFAULT '1900-01-01' ,
	CHANGE `Location` `Location` VARCHAR(50) DEFAULT '' ,
	CHANGE `Violation` `Violation` VARCHAR(50) DEFAULT '' ,
	CHANGE `Penalty` `Penalty` VARCHAR(50) DEFAULT '' ,
	CHANGE `TypeOfVehicle` `TypeOfVehicle` VARCHAR(20) DEFAULT '' ,
	CHANGE `OrderNo` `OrderNo` tinyint DEFAULT '-1' 
;

ALTER TABLE `tDOTInspections` 
	CHANGE `CompanyID` `CompanyID` bigint DEFAULT '-1' ,
	CHANGE `InspectionDate` `InspectionDate` DATE NOT NULL DEFAULT '1900-01-01' ,
	CHANGE `InspectionTime` `InspectionTime` VARCHAR(15) DEFAULT '' ,
	CHANGE `RequestedByFName` `RequestedByFName` VARCHAR(20) DEFAULT '' ,
	CHANGE `RequestedByLName` `RequestedByLName` VARCHAR(20) DEFAULT '' ,
	CHANGE `Status` `Status` VARCHAR(50) DEFAULT '' 
;

ALTER TABLE `tDQFAnnualReview` 
	CHANGE `DQFDocID` `DQFDocID` bigint DEFAULT '-1' ,
	CHANGE `ReviewDate` `ReviewDate` DATE NOT NULL DEFAULT '1900-01-01' ,
	CHANGE `Qualified` `Qualified` tinyint DEFAULT '-1' ,
	CHANGE `Name` `Name` VARCHAR(50) DEFAULT '' ,
	CHANGE `Remarks` `Remarks` TEXT DEFAULT '' ,
	CHANGE `ConfirmReview` `ConfirmReview` tinyint DEFAULT '-1' ,
	CHANGE `Created` `Created` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
;

ALTER TABLE `tDQFDisq383` 
	CHANGE `DQFDocID` `DQFDocID` bigint DEFAULT '-1' ,
	CHANGE `AADate` `AADate` VARCHAR( 10 )  DEFAULT '',
	CHANGE `BBDate` `BBDate` VARCHAR(10) DEFAULT '' ,
	CHANGE `CCDate` `CCDate` VARCHAR(10) DEFAULT '' ,
	CHANGE `DDDate` `DDDate` VARCHAR(10) DEFAULT '' ,
	CHANGE `EEDate` `EEDate` VARCHAR(10) DEFAULT '' ,
	CHANGE `FFDate` `FFDate` VARCHAR(10) DEFAULT '' ,
	CHANGE `GGDate` `GGDate` VARCHAR(10) DEFAULT '' ,
	CHANGE `AADate` `AADate` VARCHAR(10) DEFAULT '' ,
	CHANGE `ToName` `ToName` VARCHAR(50) DEFAULT '' ,
	CHANGE `NoticeDate` `NoticeDate` DATE NOT NULL DEFAULT '1900-01-01' ,
	CHANGE `Period` `Period` VARCHAR(20) DEFAULT '' ,
	CHANGE `SuspCode` `SuspCode` VARCHAR(20) DEFAULT '' ,
	CHANGE `SuspFromDate` `SuspFromDate` DATE NOT NULL DEFAULT '1900-01-01' ,
	CHANGE `SuspToDate` `SuspToDate` DATE NOT NULL DEFAULT '1900-01-01' ,
	CHANGE `TermCode` `TermCode` VARCHAR(20) DEFAULT '' ,
	CHANGE `TermDate` `TermDate` DATE NOT NULL DEFAULT '1900-01-01' ,
	CHANGE `ByName` `ByName` VARCHAR(50) DEFAULT '' ,
	CHANGE `ByTitle` `ByTitle` VARCHAR(50) DEFAULT '' ,
	CHANGE `Created` `Created` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
;

ALTER TABLE `tDQFDisq391` 
	CHANGE `DQFDocID` `DQFDocID` bigint DEFAULT '-1' ,
	CHANGE `ADate` `ADate` VARCHAR(10) DEFAULT '' ,
	CHANGE `BDate` `BDate` VARCHAR(10) DEFAULT '' ,
	CHANGE `CDate` `CDate` VARCHAR(10) DEFAULT '' ,
	CHANGE `DDate` `DDate` VARCHAR(10) DEFAULT '' ,
	CHANGE `EDate` `EDate` VARCHAR(10) DEFAULT '' ,
	CHANGE `FDate` `FDate` VARCHAR(10) DEFAULT '' ,
	CHANGE `GDate` `GDate` VARCHAR(10) DEFAULT '' ,
	CHANGE `HDate` `HDate` VARCHAR(10) DEFAULT '' ,
	CHANGE `IDate` `IDate` VARCHAR(10) DEFAULT '' ,
	CHANGE `JDate` `JDate` VARCHAR(10) DEFAULT '' ,
	CHANGE `KDate` `KDate` VARCHAR(10) DEFAULT '' ,
	CHANGE `LDate` `LDate` VARCHAR(10) DEFAULT '' ,
	CHANGE `MDate` `MDate` VARCHAR(10) DEFAULT '' ,
	CHANGE `NDate` `NDate` VARCHAR(10) DEFAULT '' ,
	CHANGE `ODate` `ODate` VARCHAR(10) DEFAULT '' ,
	CHANGE `PRegulation` `PRegulation` VARCHAR(15) DEFAULT '' ,
	CHANGE `PDate` `PDate` VARCHAR(10) DEFAULT '' ,
	CHANGE `PDescription` `PDescription` VARCHAR(200) DEFAULT '' ,
	CHANGE `QRegulation` `QRegulation` VARCHAR(15) DEFAULT '' ,
	CHANGE `QDate` `QDate` VARCHAR(10) DEFAULT '' ,
	CHANGE `QDescription` `QDescription` VARCHAR(200) DEFAULT '' ,
	CHANGE `RRegulation` `RRegulation` VARCHAR(15) DEFAULT '' ,
	CHANGE `RDate` `RDate` VARCHAR(10) DEFAULT '' ,
	CHANGE `RDescription` `RDescription` VARCHAR(200) DEFAULT '' ,
	CHANGE `SRegulation` `SRegulation` VARCHAR(15) DEFAULT '' ,
	CHANGE `SDate` `SDate` VARCHAR(10) DEFAULT '' ,
	CHANGE `SDescription` `SDescription` VARCHAR(200) DEFAULT '' ,
	CHANGE `ToName` `ToName` VARCHAR(50) DEFAULT '' ,
	CHANGE `NoticeDate` `NoticeDate` DATE NOT NULL DEFAULT '1900-01-01' ,
	CHANGE `Period` `Period` VARCHAR(20) DEFAULT '' ,
	CHANGE `SuspCode` `SuspCode` VARCHAR(20) DEFAULT '' ,
	CHANGE `SuspFromDate` `SuspFromDate` DATE NOT NULL DEFAULT '1900-01-01' ,
	CHANGE `SuspToDate` `SuspToDate` DATE NOT NULL DEFAULT '1900-01-01' ,
	CHANGE `TermCode` `TermCode` VARCHAR(20) DEFAULT '' ,
	CHANGE `TermDate` `TermDate` DATE NOT NULL DEFAULT '1900-01-01' ,
	CHANGE `ByName` `ByName` VARCHAR(50) DEFAULT '' ,
	CHANGE `ByTitle` `ByTitle` VARCHAR(50) DEFAULT '' 
;

ALTER TABLE `tDQFDoc` 
	CHANGE `DIWID` `DIWID` bigint DEFAULT '-1' ,
	CHANGE `DocID` `DocID` bigint DEFAULT '-1' ,
	CHANGE `Status` `Status` VARCHAR(50) DEFAULT '' ,
	CHANGE `Requested` `Requested` DATE NOT NULL DEFAULT '1900-01-01' ,
	CHANGE `Completed` `Completed` DATE NOT NULL DEFAULT '1900-01-01' ,
	CHANGE `DIWEmployerID` `DIWEmployerID` bigint DEFAULT '-1' ,
	CHANGE `ScanDateTime` `ScanDateTime` VARCHAR(20) DEFAULT '' ,
	CHANGE `Created` `Created` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	CHANGE `OtherTitle` `OtherTitle` VARCHAR(200) DEFAULT '',
	CHANGE `RelatedTo` `RelatedTo` bigint DEFAULT '-1' 
;

ALTER TABLE `tDQFDocDOTCheck` 
	CHANGE `DQFDocID` `DQFDocID` tinyint DEFAULT '-1' ,
	CHANGE `TruckQFDocID` `TruckQFDocID` tinyint DEFAULT '-1' ,
	CHANGE `AccQFDocID` `AccQFDocID` tinyint DEFAULT '-1' ,
	CHANGE `DriverFileID` `DriverFileID` tinyint DEFAULT '-1' ,
	CHANGE `AccFileID` `AccFileID` tinyint DEFAULT '-1' ,
	CHANGE `VehFileID` `VehFileID` tinyint DEFAULT '-1' ,
	CHANGE `CompanyID` `CompanyID` tinyint DEFAULT '-1' ,
	CHANGE `CompanyDocID` `CompanyDocID` int DEFAULT '-1' ,
	CHANGE `DOTCheckStatus` `DOTCheckStatus` tinyint DEFAULT '0' ,
	CHANGE `DOTCheckNote` `DOTCheckNote` TEXT DEFAULT '' ,
	CHANGE `DOTCheckDate` `DOTCheckDate` DATE NOT NULL DEFAULT '1900-01-01' ,
	CHANGE `DOTCheckBy` `DOTCheckBy` VARCHAR(30) DEFAULT '' ,
	CHANGE `DocStatus` `DocStatus` VARCHAR(10) DEFAULT '' ,
	CHANGE `DOTInspectionID` `DOTInspectionID` tinyint DEFAULT '-1' ,
	CHANGE `DocTitle` `DocTitle` VARCHAR(50) DEFAULT '' ,
	CHANGE `HomeBaseID` `HomeBaseID` tinyint DEFAULT '-1' ,
	CHANGE `HBName` `HBName` VARCHAR(50) DEFAULT '' ,
	CHANGE `CompName` `CompName` VARCHAR(50) DEFAULT '' 
;

ALTER TABLE `tDoc` 
	CHANGE `DocType` `DocType` VARCHAR(10) DEFAULT '' ,
	CHANGE `Category` `Category` VARCHAR(30) DEFAULT '' ,
	CHANGE `DocCode` `DocCode` VARCHAR(10) DEFAULT '' ,
	CHANGE `HasPDF` `HasPDF` tinyint DEFAULT '0' ,
	CHANGE `PDFFile` `PDFFile` VARCHAR(100) DEFAULT '' ,
	CHANGE `HasScan` `HasScan` tinyint DEFAULT '0' ,
	CHANGE `Multiple` `Multiple` tinyint  DEFAULT '0' ,
	CHANGE `ForEmployer` `ForEmployer` tinyint DEFAULT '0' ,
	CHANGE `PageNum` `PageNum` tinyint DEFAULT '-1' ,
	CHANGE `HasNSCCheck` `HasNSCCheck` tinyint DEFAULT '1' 
;

ALTER TABLE `tDriver` 
	CHANGE `SSN` `SSN` VARCHAR(11) DEFAULT '' ,
	CHANGE `DOB` `DOB` DATE NOT NULL DEFAULT '1900-01-01' ,
	CHANGE `Created` `Created` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
;

ALTER TABLE `tDriverAccount` 
	CHANGE `DIWID` `DIWID` bigint DEFAULT '-1' ,
	CHANGE `AccountType` `AccountType` VARCHAR(10) DEFAULT '' ,
	CHANGE `DQFDocID` `DQFDocID` int DEFAULT '-1' ,
	CHANGE `StartTime` `StartTime` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ,
	CHANGE `Duration` `Duration` tinyint DEFAULT '0' ,
	CHANGE `Status` `Status` VARCHAR(50) DEFAULT '' 
;

ALTER TABLE `tDriversCrossSection` 
	CHANGE `HBID` `HBID` tinyint DEFAULT '-1' ,
	CHANGE `CompanyID` `CompanyID` tinyint DEFAULT '-1' ,
	CHANGE `DateCreated` `DateCreated` DATE NOT NULL DEFAULT '1900-01-01' ,
	CHANGE `Pending` `Pending` tinyint DEFAULT '-1' ,
	CHANGE `Applicant` `Applicant` tinyint DEFAULT '-1' ,
	CHANGE `Hired` `Hired` tinyint DEFAULT '-1' ,
	CHANGE `HiredActive` `HiredActive` tinyint DEFAULT '-1' ,
	CHANGE `HiredInactive` `HiredInactive` tinyint DEFAULT '-1' ,
	CHANGE `Declined` `Declined` tinyint DEFAULT '-1' ,
	CHANGE `Denied` `Denied` tinyint DEFAULT '-1' ,
	CHANGE `Terminated` `Terminated` tinyint DEFAULT '-1' ,
	CHANGE `NoComplDrivers` `NoComplDrivers` int DEFAULT '-1' ,
	CHANGE `NoComplItems` `NoComplItems` int DEFAULT '-1' ,
	CHANGE `NoComplDriversByNSC` `NoComplDriversByNSC` int DEFAULT '-1' ,
	CHANGE `NoComplItemsByNSC` `NoComplItemsByNSC` int DEFAULT '-1' 
;

ALTER TABLE `tDriversNoncomplientItemSum` 
	CHANGE `DateCreated` `DateCreated` DATE NOT NULL DEFAULT '1900-01-01' ,
	CHANGE `HBID` `HBID` tinyint DEFAULT '-1' ,
	CHANGE `CompanyID` `CompanyID` tinyint DEFAULT '-1' ,
	CHANGE `CDLExpired` `CDLExpired` tinyint DEFAULT '-1' ,
	CHANGE `RAExpired` `RAExpired` tinyint DEFAULT '-1' ,
	CHANGE `MDExpired` `MDExpired` tinyint DEFAULT '-1' ,
	CHANGE `AnRevExpired` `AnRevExpired` tinyint DEFAULT '-1' ,
	CHANGE `RecViolExpired` `RecViolExpired` tinyint DEFAULT '-1' ,
	CHANGE `MissCreatedNeverScanned` `MissCreatedNeverScanned` tinyint DEFAULT '-1' ,
	CHANGE `MissRequiredFormDocument` `MissRequiredFormDocument` tinyint DEFAULT '-1' ,
	CHANGE `MissingRA` `MissingRA` tinyint DEFAULT '-1' ,
	CHANGE `MissingPrevEmploy` `MissingPrevEmploy` tinyint DEFAULT '-1' ,
	CHANGE `MissingRADIWData` `MissingRADIWData` tinyint DEFAULT '-1' ,
	CHANGE `MissingMDDIWData` `MissingMDDIWData` tinyint DEFAULT '-1' ,
	CHANGE `MissingAddressDIWData` `MissingAddressDIWData` tinyint DEFAULT '-1' ,
	CHANGE `MissingCDLDIWData` `MissingCDLDIWData` tinyint DEFAULT '-1' ,
	CHANGE `MissingPrevEmplLDIWData` `MissingPrevEmplLDIWData` tinyint DEFAULT '-1' ,
	CHANGE `MissingAccDIWData` `MissingAccDIWData` tinyint DEFAULT '-1' ,
	CHANGE `MissingViolDIWData` `MissingViolDIWData` tinyint DEFAULT '-1' ,
	CHANGE `MissingVehDIWData` `MissingVehDIWData` tinyint DEFAULT '-1' ,
	CHANGE `MissRequiredFormDocumentForVeh` `MissRequiredFormDocumentForVeh` tinyint DEFAULT '-1' ,
	CHANGE `VehInsExpired` `VehInsExpired` tinyint DEFAULT '-1' ,
	CHANGE `VehRegExpired` `VehRegExpired` tinyint DEFAULT '-1' 
;

ALTER TABLE `tFaxRequest` 
	CHANGE `DQFDocID` `DQFDocID` int DEFAULT '-1' ,
	CHANGE `RequestDate` `RequestDate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ,
	CHANGE `RequestByUserID` `RequestByUserID` int DEFAULT '-1' ,
	CHANGE `SubmitByUserID` `SubmitByUserID` int DEFAULT '-1' ,
	CHANGE `Status` `Status` VARCHAR(50) DEFAULT '' 
;

ALTER TABLE `tFile` 
	CHANGE `DriverID` `DriverID` int DEFAULT '-1' ,
	CHANGE `HomeBaseID` `HomeBaseID` int DEFAULT '-1' ,
	CHANGE `Created` `Created` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	CHANGE `Status` `Status` VARCHAR(10) DEFAULT '' ,
	CHANGE `TerminationDate` `TerminationDate` DATE NOT NULL DEFAULT '1900-01-01' ,
	CHANGE `NSCCheck` `NSCCheck` tinyint DEFAULT '0' ,
	CHANGE `NSCCheckAction` `NSCCheckAction` VARCHAR(50) DEFAULT '' ,
	CHANGE `VendorID` `VendorID` int DEFAULT '-1' ,
	CHANGE `ActiveStatus` `ActiveStatus` varchar(10) DEFAULT 'Active' ,
	CHANGE `DOTCheck` `DOTCheck` tinyint DEFAULT '0' ,
	CHANGE `LocationID` `LocationID` tinyint DEFAULT '-1' 
;

ALTER TABLE `tHBStaff` 
	CHANGE `HomeBaseID` `HomeBaseID` int DEFAULT '-1' ,
	CHANGE `FirstName` `FirstName` VARCHAR(20) DEFAULT '' ,
	CHANGE `LastName` `LastName` VARCHAR(20) DEFAULT '' ,
	CHANGE `Title` `Title` VARCHAR(50) DEFAULT '' ,
	CHANGE `Role` `Role` VARCHAR(20) DEFAULT '' ,
	CHANGE `Telephone` `Telephone` VARCHAR(30) DEFAULT '' ,
	CHANGE `Email` `Email` VARCHAR(100) DEFAULT '' ,
	CHANGE `Status` `Status` VARCHAR(10) DEFAULT '' ,
	CHANGE `Created` `Created` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	CHANGE `CreatedByUserID` `CreatedByUserID` int DEFAULT '-1' ,
	CHANGE `DQF` `DQF` tinyint DEFAULT '1' ,
	CHANGE `VIM` `VIM` tinyint DEFAULT '1' ,
	CHANGE `Accident` `Accident` tinyint DEFAULT '1' 
;


ALTER TABLE `tHomeBase` 
	CHANGE `CompanyID` `CompanyID` int DEFAULT '-1' ,
	CHANGE `HomeBaseName` `HomeBaseName` VARCHAR(100) DEFAULT '' ,
	CHANGE `HomeBaseCode` `HomeBaseCode` VARCHAR(20) DEFAULT '' ,
	CHANGE `Address` `Address` VARCHAR(100) DEFAULT '' ,
	CHANGE `City` `City` VARCHAR(50) DEFAULT '' ,
	CHANGE `State` `State` VARCHAR(2) DEFAULT '' ,
	CHANGE `Zip` `Zip` VARCHAR(20) DEFAULT '' ,
	CHANGE `Telephone` `Telephone` VARCHAR(30) DEFAULT '' ,
	CHANGE `Fax` `Fax` VARCHAR(30) DEFAULT '',
	CHANGE `Status` `Status` VARCHAR(10) DEFAULT '' ,
	-- CHANGE `StartDate` `StartDate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ,
	CHANGE `Created` `Created` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	CHANGE `Url` `Url` varchar(100) DEFAULT 'https://www.driverqualificationonline.com/nschanson' ,
	CHANGE `DQFModul` `DQFModul` VARCHAR(3) DEFAULT 'Yes' ,
	CHANGE `TruckModul` `TruckModul` VARCHAR(3) DEFAULT 'No' ,
	CHANGE `NewDriverRate` `NewDriverRate`  double DEFAULT '65.00' ,
	CHANGE `MonthlyDriverRate` `MonthlyDriverRate` double DEFAULT '2.50' ,
	CHANGE `NewVehicleRate` `NewVehicleRate` double DEFAULT '19.95' ,
	CHANGE `MonthlyVehicleRate` `MonthlyVehicleRate` double DEFAULT '1.65' ,
	CHANGE `RenewDriverRate` `RenewDriverRate` double DEFAULT '0' ,
	CHANGE `NewTruckRate` `NewTruckRate` double DEFAULT '19.95' ,
	CHANGE `MonthlyTruckRate` `MonthlyTruckRate` double DEFAULT '1.65' 
;

ALTER TABLE `tInvoice` 
	CHANGE `InvoiceForHBID` `InvoiceForHBID` int DEFAULT '-1' ,
	CHANGE `FileID` `FileID` int DEFAULT '-1' ,
	CHANGE `InvoiceType` `InvoiceType` VARCHAR(20) DEFAULT '' ,
	CHANGE `InvoiceDate` `InvoiceDate` DATE NOT NULL DEFAULT '1900-01-01' ,
	CHANGE `Name` `Name` VARCHAR(50) DEFAULT '' ,
	CHANGE `ForYear` `ForYear` VARCHAR(4) DEFAULT '' ,
	CHANGE `Created` `Created` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	CHANGE `ByUserID` `ByUserID` int DEFAULT '-1' 
;

ALTER TABLE `tInvoiceForHB` 
	CHANGE `HomeBaseID` `HomeBaseID` int DEFAULT '-1' ,
	CHANGE `InvoiceType` `InvoiceType` VARCHAR(20) DEFAULT '' ,
	CHANGE `InvoiceDate` `InvoiceDate` DATE NOT NULL DEFAULT '1900-01-01' ,
	CHANGE `Rate` `Rate` double DEFAULT '65.00' 
;

ALTER TABLE `tInvoiceTruck` 
	CHANGE `InvoiceForHBID` `InvoiceForHBID` int DEFAULT '-1' ,
	CHANGE `TruckFileID` `TruckFileID` int DEFAULT '-1' ,
	CHANGE `InvoiceType` `InvoiceType` VARCHAR(20) DEFAULT '' ,
	CHANGE `InvoiceDate` `InvoiceDate` DATE NOT NULL DEFAULT '1900-01-01' ,
	CHANGE `Name` `Name` VARCHAR(50) DEFAULT '' ,
	CHANGE `ForYear` `ForYear` VARCHAR(4) DEFAULT '' ,
	CHANGE `Created` `Created` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	CHANGE `ByUserID` `ByUserID` int DEFAULT '-1' 
;

ALTER TABLE `tInvoiceTruckForHB` 
	CHANGE `HomeBaseID` `HomeBaseID` int DEFAULT '-1' ,
	CHANGE `InvoiceType` `InvoiceType` VARCHAR(20) DEFAULT '' ,
	CHANGE `InvoiceDate` `InvoiceDate` DATE NOT NULL DEFAULT '1900-01-01' ,
	CHANGE `Rate` `Rate` double DEFAULT '0.00' 
;

ALTER TABLE `tMError` 
	CHANGE `ActionType` `ActionType` DEFAULT (1) 
;

ALTER TABLE `tNSCStaff` 
	CHANGE `FirstName` `FirstName` VARCHAR(20) DEFAULT '' ,
	CHANGE `LastName` `LastName` VARCHAR(20) DEFAULT '' ,
	CHANGE `Title` `Title` VARCHAR(50) DEFAULT '' ,
	CHANGE `Telephone` `Telephone` VARCHAR(30) DEFAULT '' ,
	CHANGE `Email` `Email` VARCHAR(100) DEFAULT '' ,
	CHANGE `Role` `Role` VARCHAR(20) DEFAULT '0' ,
	CHANGE `Status` `Status` VARCHAR(10) DEFAULT '' ,
	CHANGE `Created` `Created` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	CHANGE `CreatedByUserID` `CreatedByUserID` int DEFAULT '-1' 
;

ALTER TABLE `tSession` 
	CHANGE `UserID` `UserID` int DEFAULT '-1' ,
	CHANGE `CurrentHBID` `CurrentHBID` int DEFAULT '-1' ,
	CHANGE `LastClickTime` `LastClickTime` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ,
	CHANGE `StartTime` `StartTime` TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00',
	CHANGE `SessionStatus` `SessionStatus` tinyint DEFAULT '-1' ,
	CHANGE `CurrentCompanyID` `CurrentCompanyID` int DEFAULT '-1' 
;

ALTER TABLE `tSetup` 
	CHANGE `SetupName` `SetupName` VARCHAR(50) DEFAULT '' ,
	CHANGE `Code` `Code` VARCHAR(20) DEFAULT '' 
;

ALTER TABLE `tTIW` 
	CHANGE `TruckFileID` `TruckFileID` int DEFAULT '-1' ,
	CHANGE `TruckVendorID` `TruckVendorID` int DEFAULT '-1' ,
	CHANGE `EntryDate` `EntryDate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ,
	CHANGE `DateOfHire` `DateOfHire` DATE NOT NULL DEFAULT '1900-01-01' ,
	CHANGE `AppDate` `AppDate` DATE NOT NULL DEFAULT '1900-01-01' ,
	CHANGE `AppNumber` `AppNumber` VARCHAR(20) DEFAULT '' ,
	CHANGE `VehType` `VehType` VARCHAR(20) DEFAULT '' ,
	CHANGE `UnitNumber` `UnitNumber` VARCHAR(25) DEFAULT '' ,
	CHANGE `Year` `Year` VARCHAR(10) DEFAULT '' ,
	CHANGE `Make` `Make` VARCHAR(20) DEFAULT '' ,
	CHANGE `Model` `Model` VARCHAR(20) DEFAULT '' ,
	CHANGE `Color` `Color` VARCHAR(15) DEFAULT '' ,
	CHANGE `UnladenWeight` `UnladenWeight` VARCHAR(9) DEFAULT '0' ,
	CHANGE `GVW` `GVW` VARCHAR(9) DEFAULT '0' ,
	CHANGE `NumOfAxles` `NumOfAxles` VARCHAR(10) DEFAULT '' ,
	CHANGE `LicPlateNum` `LicPlateNum` VARCHAR(20) DEFAULT '' ,
	CHANGE `RegState` `RegState` VARCHAR(20) DEFAULT '' ,
	CHANGE `RegExpDate` `RegExpDate` DATE NOT NULL DEFAULT '1900-01-01' ,
	CHANGE `VehicleValue` `VehicleValue` int DEFAULT '0' ,
	CHANGE `LastEvaluationDate` `LastEvaluationDate` DATE NOT NULL DEFAULT '1900-01-01' ,
	CHANGE `InsCompany` `InsCompany` VARCHAR(30) DEFAULT '' ,
	CHANGE `InsPolicyNum` `InsPolicyNum` VARCHAR(30) DEFAULT '' ,
	CHANGE `InsExpDate` `InsExpDate` DATE NOT NULL DEFAULT '1900-01-01' ,
	CHANGE `AppType` `AppType` VARCHAR(10) DEFAULT '' ,
	CHANGE `InsLimits` `InsLimits` int DEFAULT '0' ,
	CHANGE `NSCCheck` `NSCCheck` VARCHAR(3) DEFAULT 'No' ,
	CHANGE `RFID` `RFID` VARCHAR(15) DEFAULT '' ,
	CHANGE `ProfitCN` `ProfitCN` VARCHAR(15) DEFAULT '' ,
	CHANGE `ProfitCNLocation` `ProfitCNLocation` VARCHAR(30) DEFAULT '' ,
	CHANGE `OwningCompany` `OwningCompany` VARCHAR(50) DEFAULT '' ,
	CHANGE `IRP` `IRP` VARCHAR(20) DEFAULT '' ,
	CHANGE `IFTASticker` `IFTASticker` VARCHAR(20) DEFAULT '' ,
	CHANGE `Weight2290` `Weight2290` VARCHAR(10) DEFAULT '' ,
	CHANGE `TitleStatus` `TitleStatus` VARCHAR(20) DEFAULT 'Corporate' ,
	CHANGE `GVRW` `GVRW` int DEFAULT '0' ,
	CHANGE `HUT` `HUT` VARCHAR(10) DEFAULT 'No' ,
	CHANGE `IFTAStickerExpDate` `IFTAStickerExpDate` DATE NOT NULL DEFAULT '1900-01-01' 
;

ALTER TABLE `tTIWBITInspection` 
	CHANGE `TIWID` `TIWID` int DEFAULT '-1' ,
	CHANGE `InspectorName` `InspectorName` VARCHAR(30) DEFAULT '' ,
	CHANGE `InspCompany` `InspCompany` VARCHAR(100) DEFAULT '' ,
	CHANGE `Result` `Result` VARCHAR(15) DEFAULT '' ,
	CHANGE `ShopNote` `ShopNote` TEXT DEFAULT '' ,
	CHANGE `BITExpDate` `BITExpDate` DATE NOT NULL DEFAULT '1900-01-01' ,
	CHANGE `ReinspectionDate` `ReinspectionDate` DATE NOT NULL DEFAULT '1900-01-01' ,
	CHANGE `Created` `Created` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	CHANGE `InspectionDate` `InspectionDate` DATE NOT NULL DEFAULT '1900-01-01' ,
	CHANGE `InspectorNumber` `InspectorNumber` VARCHAR(15) DEFAULT '' ,
	CHANGE `InspectionFormNumber` `InspectionFormNumber` VARCHAR(25) DEFAULT '' ,
	CHANGE `InspectionType` `InspectionType` VARCHAR(10) DEFAULT '' ,
	CHANGE `DOTExpDate` `DOTExpDate` DATE NOT NULL DEFAULT '1900-01-01' ,
	CHANGE `InspectorCertification` `InspectorCertification` VARCHAR(100) DEFAULT '' ,
	CHANGE `InspectorID` `InspectorID` tinyint DEFAULT '-1' ,
	CHANGE `InsCompanyID` `InsCompanyID` tinyint DEFAULT '-1' 
;

ALTER TABLE `tTIWDISInspection` 
	CHANGE `TIWID` `TIWID` int DEFAULT '-1' ,
	CHANGE `InspectorName` `InspectorName` VARCHAR(30) DEFAULT '' ,
	CHANGE `InspCompany` `InspCompany` VARCHAR(100) DEFAULT '' ,
	CHANGE `Result` `Result` VARCHAR(15) DEFAULT '' ,
	CHANGE `ShopNote` `ShopNote` TEXT DEFAULT '' ,
	CHANGE `DISExpDate` `DISExpDate` DATE NOT NULL DEFAULT '1900-01-01' ,
	CHANGE `ReinspectionDate` `ReinspectionDate` DATE NOT NULL DEFAULT '1900-01-01' ,
	CHANGE `Created` `Created` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	CHANGE `InspectionDate` `InspectionDate` DATE NOT NULL DEFAULT '1900-01-01' ,
	CHANGE `InspectorNumber` `InspectorNumber` VARCHAR(15) DEFAULT '' ,
	CHANGE `InspectionFormNumber` `InspectionFormNumber` VARCHAR(25) DEFAULT '' ,
	CHANGE `InspectionType` `InspectionType` VARCHAR(10) DEFAULT '' ,
	CHANGE `StickerNumber` `StickerNumber` DATE NOT NULL DEFAULT '1900-01-01' 
;

ALTER TABLE `tTruck` 
	CHANGE `VIN` `VIN` VARCHAR(30) DEFAULT '',
	CHANGE `Created` `Created` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
;

ALTER TABLE `tTruckActionSystem` 
	CHANGE `ActionType` `ActionType` VARCHAR(15) DEFAULT '' ,
	CHANGE `ActionDate` `ActionDate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ,
	CHANGE `ToHomeBaseID` `ToHomeBaseID` int DEFAULT '-1' ,
	CHANGE `ToUserID` `ToUserID` int DEFAULT '-1' ,
	CHANGE `Confirmed` `Confirmed` tinyint DEFAULT '0' 
;

ALTER TABLE `tTruckActionSystemForFile` 
	CHANGE `ActionSystemID` `ActionSystemID` int DEFAULT '-1' ,
	CHANGE `TruckFileID` `TruckFileID` int DEFAULT '-1' ,
	CHANGE `TIWID` `TIWID` int DEFAULT '-1' ,
	CHANGE `ExpType` `ExpType` VARCHAR(20) DEFAULT '' ,
	CHANGE `Expires` `Expires` DATE NOT NULL DEFAULT '1900-01-01' ,
	CHANGE `Created` `Created` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	CHANGE `ActionType` `ActionType` VARCHAR(15) DEFAULT '' 
;

ALTER TABLE `tTruckAppCheck` 
	CHANGE `TIWID` `TIWID` int DEFAULT '-1' ,
	CHANGE `CheckReview` `CheckReview` tinyint(1) DEFAULT '0' ,
	CHANGE `CheckBIT` `CheckBIT` tinyint(1) DEFAULT '0' ,
	CHANGE `CheckPicture` `CheckPicture` tinyint(1) DEFAULT '0' ,
	CHANGE `CheckReqDoc` `CheckReqDoc` tinyint(1) DEFAULT '0' ,
	CHANGE `CheckVehReg` `CheckVehReg` tinyint(1) DEFAULT '0' ,
	CHANGE `CheckInsSert` `CheckInsSert` tinyint(1) DEFAULT '0' 
;

ALTER TABLE `tTruckDoc` 
	CHANGE `DocType` `DocType` VARCHAR(10) DEFAULT '' ,
	CHANGE `Category` `Category` VARCHAR(30) DEFAULT '' ,
	CHANGE `DocTitle` `DocTitle` VARCHAR(100) DEFAULT '' ,
	CHANGE `DocCode` `DocCode` VARCHAR(10) DEFAULT '' ,
	CHANGE `HasPDF` `HasPDF` tinyint DEFAULT '0' ,
	CHANGE `PDFFile` `PDFFile` VARCHAR(100) DEFAULT '' ,
	CHANGE `HasScan` `HasScan` tinyint DEFAULT '0' ,
	CHANGE `Muitiple` `Muitiple` tinyint DEFAULT '0' ,
	CHANGE `PageNum` `PageNum` tinyint DEFAULT '-1' 
;

ALTER TABLE `tTruckDriver` 
	CHANGE `DriverID` `DriverID` int DEFAULT '-1' ,
	CHANGE `TruckID` `TruckID` int DEFAULT '-1' ,
	CHANGE `Created` `Created` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	CHANGE `HBID` `HBID` int DEFAULT '-1' 
;
------------
ALTER TABLE `tTruckFile` 
	CHANGE `TruckID` `TruckID` int DEFAULT '-1' ,
	CHANGE `HomeBaseID` `HomeBaseID` int DEFAULT '-1' ,
	CHANGE `Created` `Created` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	CHANGE `Status` `Status` VARCHAR(20) DEFAULT '' ,
	CHANGE `TerminationDate` `TerminationDate` DATE NOT NULL DEFAULT '1900-01-01' ,
	CHANGE `VendorID` `VendorID` int DEFAULT '-1' ,
	CHANGE `DOTCheck` `DOTCheck` tinyint(1) DEFAULT '0' 
;

ALTER TABLE `tTruckInspectionCompany` 
	CHANGE `CompanyID` `CompanyID` tinyint DEFAULT '-1' ,
	CHANGE `HBID` `HBID` tinyint DEFAULT '-1' ,
	CHANGE `InsCompanyName` `InsCompanyName` VARCHAR(100) DEFAULT '' ,
	CHANGE `InsCompanyAddress` `InsCompanyAddress` VARCHAR(100) DEFAULT '' ,
	CHANGE `InsCompanyCity` `InsCompanyCity` VARCHAR(50) DEFAULT '' ,
	CHANGE `InsCompanyState` `InsCompanyState` VARCHAR(10) DEFAULT '' ,
	CHANGE `InsCompanyZIP` `InsCompanyZIP` VARCHAR(10) DEFAULT '' ,
	CHANGE `InsCompCreated` `InsCompCreated` DATE NOT NULL DEFAULT '1900-01-01' 
;

ALTER TABLE `tTruckInspector` 
	CHANGE `InsCompanyID` `InsCompanyID` tinyint DEFAULT '-1' ,
	CHANGE `InspectorFirstName` `InspectorFirstName` VARCHAR(50) DEFAULT '' ,
	CHANGE `InspectorLastName` `InspectorLastName` VARCHAR(50) DEFAULT '' ,
	CHANGE `InspectorCreated` `InspectorCreated` DATE NOT NULL DEFAULT '1900-01-01' ,
	CHANGE `InspectorCertificate` `InspectorCertificate` VARCHAR(100) DEFAULT '' 
;

ALTER TABLE `tTruckInspectorCertificate` 
	CHANGE `InspectorID` `InspectorID` int DEFAULT '-1' ,
	CHANGE `InspectorCertificate` `InspectorCertificate` VARCHAR(100) DEFAULT '' ,
	CHANGE `InspectorCertificateCreated` `InspectorCertificateCreated` DATE NOT NULL DEFAULT '1900-01-01' 
;

ALTER TABLE `tTruckMaintenance` 
	CHANGE `TIWID` `TIWID` int DEFAULT '-1' ,
	CHANGE `RequestedDate` `RequestedDate` DATE NOT NULL DEFAULT '1900-01-01' ,
	CHANGE `CompletedDate` `CompletedDate` DATE NOT NULL DEFAULT '1900-01-01' ,
	CHANGE `NextMaintDate` `NextMaintDate` DATE NOT NULL DEFAULT '1900-01-01' ,
	CHANGE `MaintNumber` `MaintNumber` VARCHAR(20) DEFAULT '' ,
	CHANGE `Amount` `Amount` int DEFAULT '0' ,
	CHANGE `MaintCompany` `MaintCompany` VARCHAR(30) DEFAULT '' ,
	CHANGE `MaintMonth` `MaintMonth` VARCHAR(10) DEFAULT '' ,
	CHANGE `Notes` `Notes` TEXT DEFAULT '' ,
	CHANGE `Created` `Created` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
;

ALTER TABLE `tTruckQFDoc` 
	CHANGE `TIWID` `TIWID` int DEFAULT '-1' ,
	CHANGE `DocID` `DocID` int DEFAULT '-1' ,
	CHANGE `Status` `Status` VARCHAR(15) DEFAULT '' ,
	CHANGE `Requested` `Requested` DATE NOT NULL DEFAULT '1900-01-01' ,
	CHANGE `Completed` `Completed` DATE NOT NULL DEFAULT '1900-01-01' ,
	CHANGE `TIWBITInspID` `TIWBITInspID` int DEFAULT '-1' ,
	CHANGE `ScanDateTime` `ScanDateTime` VARCHAR(20) DEFAULT '' ,
	CHANGE `Created` `Created` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	CHANGE `OtherTitle` `OtherTitle` VARCHAR(200) DEFAULT '',
	CHANGE `TIWDISInspID` `TIWDISInspID` int DEFAULT '-1' 
;

ALTER TABLE `tUser` 
	CHANGE `UserType` `UserType` VARCHAR(20) DEFAULT '' ,
	CHANGE `StaffID` `StaffID` int DEFAULT '-1' ,
	CHANGE `HomeBaseID` `HomeBaseID` int DEFAULT '-1' ,
	CHANGE `CompanyID` `CompanyID` tinyint DEFAULT '-1' ,
	CHANGE `Username` `Username` VARCHAR(20) DEFAULT '' ,
	CHANGE `Password` `Password` VARCHAR(100) DEFAULT '' ,
	CHANGE `Agreed` `Agreed` tinyint DEFAULT '0' 
;

ALTER TABLE `tVIW` 
	CHANGE `VendorFileID` `VendorFileID` tinyint DEFAULT '-1' ,
	CHANGE `VendorCode` `VendorCode` VARCHAR(25) DEFAULT '' ,
	CHANGE `AppType` `AppType` VARCHAR(15) DEFAULT '' ,
	CHANGE `CompanyName` `CompanyName` VARCHAR(50) DEFAULT '' ,
	CHANGE `FirstName` `FirstName` VARCHAR(20) DEFAULT '' ,
	CHANGE `LastName` `LastName` VARCHAR(20) DEFAULT '' ,
	CHANGE `Address` `Address` VARCHAR(50) DEFAULT '' ,
	CHANGE `City` `City` VARCHAR(20) DEFAULT '' ,
	CHANGE `Zip` `Zip` VARCHAR(20) DEFAULT '' ,
	CHANGE `State` `State` VARCHAR(5) DEFAULT '' ,
	CHANGE `Phone` `Phone` VARCHAR(30) DEFAULT '' ,
	CHANGE `Fax` `Fax` VARCHAR(30) DEFAULT '',
	CHANGE `Email` `Email` VARCHAR(100) DEFAULT '' ,
	CHANGE `EntryDate` `EntryDate` DATE NOT NULL DEFAULT '1900-01-01' ,
	CHANGE `DateOfHire` `DateOfHire` DATE NOT NULL DEFAULT '1900-01-01' ,
	CHANGE `AppDate` `AppDate` DATE NOT NULL DEFAULT '1900-01-01' ,
	CHANGE `AppNumber` `AppNumber` VARCHAR(20) DEFAULT '' 
;

ALTER TABLE `tVendor` 
	CHANGE `SSN` `SSN` VARCHAR(12) DEFAULT '' ,
	CHANGE `FederalID` `FederalID` VARCHAR(20) DEFAULT '' ,
	CHANGE `Created` `Created` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
;

ALTER TABLE `tVendorAppCheck` 
	CHANGE `VIWID` `VIWID` int DEFAULT '-1' ,
	CHANGE `CheckReview` `CheckReview` tinyint(1) DEFAULT '0' ,
	CHANGE `CheckContract` `CheckContract` tinyint(1) DEFAULT '0' 
;

ALTER TABLE `tVendorContract` 
	CHANGE `VIWID` `VIWID` int DEFAULT '-1' ,
	CHANGE `ContractNum` `ContractNum` VARCHAR(20) DEFAULT '' ,
	CHANGE `DateOfContractSign` `DateOfContractSign` DATE NOT NULL DEFAULT '1900-01-01' ,
	CHANGE `ExpDateContract` `ExpDateContract` DATE NOT NULL DEFAULT '1900-01-01' ,
	CHANGE `ContractSign` `ContractSign` VARCHAR(10) DEFAULT '' ,
	CHANGE `ContractFileName` `ContractFileName` VARCHAR(100) DEFAULT '' ,
	CHANGE `UnitNumber` `UnitNumber` VARCHAR(25) DEFAULT '' ,
	CHANGE `TruckID` `TruckID` int DEFAULT '-1' 
;

ALTER TABLE `tVendorDoc` 
	CHANGE `DocType` `DocType` VARCHAR(10) DEFAULT '' ,
	CHANGE `Category` `Category` VARCHAR(30) DEFAULT '' ,
	CHANGE `DocTitle` `DocTitle` VARCHAR(100) DEFAULT '' ,
	CHANGE `DocCode` `DocCode` VARCHAR(10) DEFAULT '' ,
	CHANGE `HasPDF` `HasPDF` tinyint DEFAULT '0' ,
	CHANGE `PDFFile` `PDFFile` VARCHAR(100) DEFAULT '' ,
	CHANGE `HasScan` `HasScan` tinyint DEFAULT '0' ,
	CHANGE `Multiple` `Multiple` tinyint DEFAULT '0' ,
	CHANGE `PageNum` `PageNum` tinyint DEFAULT '-1' 
;

ALTER TABLE `tVendorDriver` 
	CHANGE `VendorID` `VendorID` int DEFAULT '-1' ,
	CHANGE `DriverID` `DriverID` int DEFAULT '-1' ,
	CHANGE `VendorCode` `VendorCode` VARCHAR(15) DEFAULT '' 
;

ALTER TABLE `tVendorFile` 
	CHANGE `VendorID` `VendorID` int DEFAULT '-1' ,
	CHANGE `HomeBaseID` `HomeBaseID` int DEFAULT '-1' ,
	CHANGE `Created` `Created` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	CHANGE `Status` `Status` VARCHAR(15) DEFAULT 'Inactive' ,
	CHANGE `TerminationDate` `TerminationDate` DATE NOT NULL DEFAULT '1900-01-01' 
;

ALTER TABLE `tVendorQFDoc` 
	CHANGE `VIWID` `VIWID` int DEFAULT '-1' ,
	CHANGE `DocID` `DocID` int DEFAULT '-1' ,
	CHANGE `Status` `Status` VARCHAR(15) DEFAULT '' ,
	CHANGE `Requested` `Requested` DATE NOT NULL DEFAULT '1900-01-01' ,
	CHANGE `Completed` `Completed` DATE NOT NULL DEFAULT '1900-01-01' ,
	CHANGE `ContractID` `ContractID` int DEFAULT '-1' ,
	CHANGE `ScanDateTime` `ScanDateTime` VARCHAR(20) DEFAULT '' ,
	CHANGE `Created` `Created` DATE NOT NULL DEFAULT '1900-01-01' ,
	CHANGE `OtherTitle` `OtherTitle` VARCHAR(100) DEFAULT '' 
;
 CREATE  UNIQUE  INDEX `tAccLightningData_Index_1` ON `tAccLightningData`(`LightningDataID`) WITH  FILLFACTOR = 90 ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;
;

ALTER TABLE `nsc2010`.`tActionUser` ADD UNIQUE `tActionUser2` (`ActionType`, `OnID`);
ALTER TABLE `nsc2010`.`tActionUser` ADD UNIQUE `tActionUser3` (`ActionType`, `ActionDate`, `OnID`);
ALTER TABLE `nsc2010`.`tActionUser` ADD INDEX `tActionUser9` (`OnID`);
ALTER TABLE `nsc2010`.`tDIW` ADD INDEX `tDIW6` (`FileID`, `DIWID`, `FirstName`, `LastName`, `RAExpDate`, `NoRA`);
ALTER TABLE `nsc2010`.`tDIW` ADD INDEX `tDIW7` (`FileID`, `DIWID`, `FirstName`, `LastName`, `MedExpDate`);
ALTER TABLE `nsc2010`.`tDIW` ADD INDEX `tDIW8` (`FileID`);
ALTER TABLE `nsc2010`.`tDIW` ADD INDEX `tDIW88` (`DIWID`, `FileID`);
ALTER TABLE `nsc2010`.`tDIWCDL` ADD INDEX `tDIWCDL7` (`DIWID`);
ALTER TABLE `nsc2010`.`tDIWVehicle` ADD INDEX `tDIWVehicle13` (`RegExpDate`, `DIWID`);
ALTER TABLE `nsc2010`.`tDIWVehicle` ADD INDEX `tDIWVehicle14` (`InsExpDate`, `DIWID`);
ALTER TABLE `nsc2010`.`tDQFDoc` ADD INDEX `tDQFDoc7` (`DQFDocID`, `DIWID`) ;
ALTER TABLE `nsc2010`.`tFile` ADD INDEX `tFile8` (`FileID`, `DriverID`, `HomeBaseID`, `Status`) ;
ALTER TABLE `nsc2010`.`tTIW` ADD UNIQUE INDEX `IX_tTIW` (`TIWID`);
ALTER TABLE `nsc2010`.`tTIW` ADD UNIQUE INDEX `IX_tTIW_1` (`TIWID`);



ALTER TABLE `tAccFile`
ADD FOREIGN KEY FK_tAccFile_tAccident(AccidentID)
REFERENCES `tAccident`(`AccidentID`)	 ON DELETE CASCADE ON UPDATE CASCADE ;



ALTER TABLE `tAccFile` ADD 
	CONSTRAINT `FK_tAccFile_tAccident` FOREIGN KEY 
	(
		`AccidentID`
	) REFERENCES `tAccident` (
		`AccidentID`
	) ON DELETE CASCADE  ON UPDATE CASCADE 
GO

ALTER TABLE `tAccIW` ADD 
	CONSTRAINT `FK_tAccIW_tAccFile` FOREIGN KEY 
	(
		`AccFileID`
	) REFERENCES `tAccFile` (
		`AccFileID`
	) ON DELETE CASCADE  ON UPDATE CASCADE 
GO

ALTER TABLE `tAccLightningData` ADD 
	CONSTRAINT `FK_tAccLightningData_tAccIW` FOREIGN KEY 
	(
		`AccIWID`
	) REFERENCES `tAccIW` (
		`AccIWID`
	) ON DELETE CASCADE  ON UPDATE CASCADE 
GO

ALTER TABLE `tAccOtherMovement` ADD 
	CONSTRAINT `FK_tAccOtherMovement_tAccOtherDriver` FOREIGN KEY 
	(
		`OtherDrID`
	) REFERENCES `tAccOtherDriver` (
		`OtherDrID`
	) ON DELETE CASCADE  ON UPDATE CASCADE 
GO

ALTER TABLE `tAccRadwayData` ADD 
	CONSTRAINT `FK_tAccRadwayData_tAccIW` FOREIGN KEY 
	(
		`AccIWID`
	) REFERENCES `tAccIW` (
		`AccIWID`
	) ON DELETE CASCADE  ON UPDATE CASCADE 
GO

ALTER TABLE `tAccRoadCondData` ADD 
	CONSTRAINT `FK_tAccRoadCondData_tAccIW` FOREIGN KEY 
	(
		`AccIWID`
	) REFERENCES `tAccIW` (
		`AccIWID`
	) ON DELETE CASCADE  ON UPDATE CASCADE 
GO

ALTER TABLE `tAccSurfaceData` ADD 
	CONSTRAINT `FK_tAccSurfaceData_tAccIW` FOREIGN KEY 
	(
		`AccIWID`
	) REFERENCES `tAccIW` (
		`AccIWID`
	) ON DELETE CASCADE  ON UPDATE CASCADE 
GO

ALTER TABLE `tAccTraficControl` ADD 
	CONSTRAINT `FK_tAccTraficControl_tAccIW` FOREIGN KEY 
	(
		`AccIWID`
	) REFERENCES `tAccIW` (
		`AccIWID`
	) ON DELETE CASCADE  ON UPDATE CASCADE 
GO

ALTER TABLE `tAccTraficData` ADD 
	CONSTRAINT `FK_tAccTraficData_tAccIW` FOREIGN KEY 
	(
		`AccIWID`
	) REFERENCES `tAccIW` (
		`AccIWID`
	) ON DELETE CASCADE  ON UPDATE CASCADE 
GO

ALTER TABLE `tAccWeatherData` ADD 
	CONSTRAINT `FK_tAccWatherData_tAccIW` FOREIGN KEY 
	(
		`AccIWID`
	) REFERENCES `tAccIW` (
		`AccIWID`
	) ON DELETE CASCADE  ON UPDATE CASCADE 
GO

ALTER TABLE `tDQFAnnualReview` ADD 
	CONSTRAINT `FK_tDQFAnnualReview_tDQFDoc` FOREIGN KEY 
	(
		`DQFDocID`
	) REFERENCES `tDQFDoc` (
		`DQFDocID`
	)
GO

ALTER TABLE `tDQFDisq383` ADD 
	CONSTRAINT `FK_tDQFDisq383_tDQFDoc` FOREIGN KEY 
	(
		`DQFDocID`
	) REFERENCES `tDQFDoc` (
		`DQFDocID`
	)
GO

ALTER TABLE `tDQFDisq391` ADD 
	CONSTRAINT `FK_tDQFDisq391_tDQFDoc` FOREIGN KEY 
	(
		`DQFDocID`
	) REFERENCES `tDQFDoc` (
		`DQFDocID`
	)
GO

ALTER TABLE `tFaxRequest` ADD 
	CONSTRAINT `FK_tFaxRequest_tDQFDoc` FOREIGN KEY 
	(
		`DQFDocID`
	) REFERENCES `tDQFDoc` (
		`DQFDocID`
	)
GO

ALTER TABLE `tFile` ADD 
	CONSTRAINT `FK_tFile_tDriver` FOREIGN KEY 
	(
		`DriverID`
	) REFERENCES `tDriver` (
		`DriverID`
	),
	CONSTRAINT `FK_tFile_tHomeBase` FOREIGN KEY 
	(
		`HomeBaseID`
	) REFERENCES `tHomeBase` (
		`HomeBaseID`
	)
GO

ALTER TABLE `tHBStaff` ADD 
	CONSTRAINT `FK_tHBStaff_tHomeBase` FOREIGN KEY 
	(
		`HomeBaseID`
	) REFERENCES `tHomeBase` (
		`HomeBaseID`
	)
GO

ALTER TABLE `tHomeBase` ADD 
	CONSTRAINT `FK_tHomeBase_tCompany` FOREIGN KEY 
	(
		`CompanyID`
	) REFERENCES `tCompany` (
		`CompanyID`
	)
GO

ALTER TABLE `tTruckFile` ADD 
	CONSTRAINT `FK_tTruckFile_tTruck` FOREIGN KEY 
	(
		`TruckID`
	) REFERENCES `tTruck` (
		`TruckID`
	)
GO