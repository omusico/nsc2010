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
	
	
	CONSTRAINT `DF_tAccIW_Distance` DEFAULT '' `Distance`,
	CONSTRAINT `DF_tAccIW_DistFrom` DEFAULT '' `DistFrom`,
	CONSTRAINT `DF_tAccIW_AccTime` DEFAULT '' `AccTime`,
	CONSTRAINT `DF_tAccIW_PhotoBy` DEFAULT '' `PhotoBy`,
	CONSTRAINT `DF_tAccIW_SpeedLimit` DEFAULT '' `SpeedLimit`,
	CONSTRAINT `DF_tAccIW_Reported` DEFAULT '' `Reported`,
	CONSTRAINT `DF_tAccIW_PoliceDep` DEFAULT '' `PoliceDep`,
	CONSTRAINT `DF_tAccIW_Scatched` DEFAULT '' `Scatched`,
	CONSTRAINT `DF_tAccIW_OfficerName` DEFAULT '' `OfficerName`,
	CONSTRAINT `DF_tAccIW_ReportNum` DEFAULT '' `ReportNum`,
	CONSTRAINT `DF_tAccIW_FileOpened` DEFAULT (1 / 1 / 1900) `FileOpened`,
	CONSTRAINT `DF_tAccIW_AccNarative` DEFAULT '' `AccNarative`,
	CONSTRAINT `DF_tAccIW_MileMarker` DEFAULT '' `MileMarker`,
	CONSTRAINT `DF_tAccIW_Preventible` DEFAULT '' `Preventable`,
	CONSTRAINT `DF_tAccIW_AccType` DEFAULT ('Not Defined') `AccType`,
	CONSTRAINT `DF__tAccIW__AccNumbe__355DD6AE` DEFAULT '' `AccNumber`,
	CONSTRAINT `DF__tAccIW__HazmatSp__4964CF5B` DEFAULT ('No') `HazmatSpill`,
	CONSTRAINT `DF__tAccIW__FuelSpil__4A58F394` DEFAULT ('No') `FuelSpill`
GO

ALTER TABLE `tAccLightningData` 
	CONSTRAINT `DF_tAccLightningData_AccIWID` DEFAULT ((-1)) `AccIWID`,
	CONSTRAINT `DF_tAccLightningData_DayLight` DEFAULT '' `DayLight`,
	CONSTRAINT `DF_tAccLightningData_Dusk` DEFAULT '' `Dusk`,
	CONSTRAINT `DF_tAccLightningData_Down` DEFAULT '' `Down`,
	CONSTRAINT `DF_tAccLightningData_DarkLights` DEFAULT '' `DarkLights`,
	CONSTRAINT `DF_tAccLightningData_DarkNoLights` DEFAULT '' `DarkNoLights`,
	CONSTRAINT `DF_tAccLightningData_DarkLightsOff` DEFAULT '' `DarkLightsOff`,
	CONSTRAINT `DF_tAccLightningData_Other` DEFAULT '' `Other`
GO

ALTER TABLE `tAccNarrative` 
	CONSTRAINT `DF_tAccNarrative_AccIWID` DEFAULT ((-1)) `AccIWID`,
	CONSTRAINT `DF_tAccNarrative_AccNarrative` DEFAULT '' `AccNarrative`
GO

ALTER TABLE `tAccNotes` 
	CONSTRAINT `DF_tAccNotes_AccWID` DEFAULT ((-1)) `AccWID`,
	CONSTRAINT `DF_tAccNotes_NotesDate` DEFAULT (1 / 1 / 1900) `NotesDate`,
	CONSTRAINT `DF_tAccNotes_Notes` DEFAULT '' `Notes`
GO

ALTER TABLE `tAccOtherDriver` 
	CONSTRAINT `DF_tAccOtherDriver_HomeBaseID` DEFAULT ((-1)) `HomeBaseID`,
	CONSTRAINT `DF_tAccOtherDriver_SSN` DEFAULT '' `SSN`,
	CONSTRAINT `DF_tAccOtherDriver_FirstName` DEFAULT '' `FirstName`,
	CONSTRAINT `DF_tAccOtherDriver_LastName` DEFAULT '' `LastName`,
	CONSTRAINT `DF_tAccOtherDriver_MiddleName` DEFAULT '' `MiddleName`,
	CONSTRAINT `DF_tAccOtherDriver_BirthName` DEFAULT '' `BirthName`,
	CONSTRAINT `DF_tAccOtherDriver_StreetAddress` DEFAULT '' `StreetAddress`,
	CONSTRAINT `DF_tAccOtherDriver_CityAddress` DEFAULT '' `CityAddress`,
	CONSTRAINT `DF_tAccOtherDriver_StateAddress` DEFAULT '' `StateAddress`,
	CONSTRAINT `DF_tAccOtherDriver_ZIPAddress` DEFAULT '' `ZIPAddress`,
	CONSTRAINT `DF_tAccOtherDriver_CDLNumber` DEFAULT '' `CDLNumber`,
	CONSTRAINT `DF_tAccOtherDriver_State` DEFAULT '' `State`,
	CONSTRAINT `DF_tAccOtherDriver_Class` DEFAULT '' `Class`,
	CONSTRAINT `DF_tAccOtherDriver_Injured` DEFAULT '' `Injured`,
	CONSTRAINT `DF_tAccOtherDriver_InjuryDescription` DEFAULT '' `InjuryDescription`,
	CONSTRAINT `DF_tAccOtherDriver_killed` DEFAULT '' `killed`,
	CONSTRAINT `DF_tAccOtherDriver_HomePhone` DEFAULT '' `HomePhone`,
	CONSTRAINT `DF_tAccOtherDriver_BusinessPhone` DEFAULT '' `BusinessPhone`,
	CONSTRAINT `DF_tAccOtherDriver_InsuranceCarier` DEFAULT '' `InsuranceCarier`,
	CONSTRAINT `DF_tAccOtherDriver_InsPolicy` DEFAULT '' `InsPolicy`,
	CONSTRAINT `DF_tAccOtherDriver_TravDirection` DEFAULT '' `TravDirection`,
	CONSTRAINT `DF_tAccOtherDriver_OnStreet` DEFAULT '' `OnStreet`,
	CONSTRAINT `DF_tAccOtherDriver_Speed` DEFAULT '' `Speed`,
	CONSTRAINT `DF_tAccOtherDriver_SpeedMax` DEFAULT '' `SpeedMax`,
	CONSTRAINT `DF_tAccOtherDriver_Sex` DEFAULT '' `Sex`,
	CONSTRAINT `DF_tAccOtherDriver_HairColor` DEFAULT '' `HairColor`,
	CONSTRAINT `DF_tAccOtherDriver_Eyes` DEFAULT '' `Eyes`,
	CONSTRAINT `DF_tAccOtherDriver_HeightFeet` DEFAULT '' `HeightFeet`,
	CONSTRAINT `DF_tAccOtherDriver_HeightInch` DEFAULT '' `HeightInch`,
	CONSTRAINT `DF_tAccOtherDriver_Weight` DEFAULT '' `Weight`,
	CONSTRAINT `DF_tAccOtherDriver_NumberOfPassanger` DEFAULT '' `NumberOfPassanger`,
	CONSTRAINT `DF_tAccOtherDriver_DOB` DEFAULT (1 / 1 / 1900) `DOB`
GO

ALTER TABLE `tAccOtherMovement` 
	CONSTRAINT `DF_tAccOtherMovement_AccOtherID` DEFAULT ((-1)) `OtherDrID`,
	CONSTRAINT `DF_tAccOtherMovement_Stopped` DEFAULT (0) `Stopped`,
	CONSTRAINT `DF_tAccOtherMovement_ProceedingStraight` DEFAULT (0) `ProceedingStraight`,
	CONSTRAINT `DF_tAccOtherMovement_RanOffRoadway` DEFAULT (0) `RunOffRoadway`,
	CONSTRAINT `DF_tAccOtherMovement_MakingRightTurn` DEFAULT (0) `MakingRightTurn`,
	CONSTRAINT `DF_tAccOtherMovement_MakingLeftTurn` DEFAULT (0) `MakingLeftTurn`,
	CONSTRAINT `DF_tAccOtherMovement_MakingUTurn` DEFAULT (0) `MakingUTurn`,
	CONSTRAINT `DF_tAccOtherMovement_Backing` DEFAULT (0) `Backing`,
	CONSTRAINT `DF_tAccOtherMovement_SlowingStoping` DEFAULT (0) `Slowing`,
	CONSTRAINT `DF_tAccOtherMovement_Stopping` DEFAULT (0) `Stopping`,
	CONSTRAINT `DF_tAccOtherMovement_Passing` DEFAULT (0) `Passing`,
	CONSTRAINT `DF_tAccOtherMovement_ChangingLanes` DEFAULT (0) `ChangingLanes`,
	CONSTRAINT `DF_tAccOtherMovement_Parking` DEFAULT (0) `Parking`,
	CONSTRAINT `DF_tAccOtherMovement_EnteringTraffic` DEFAULT (0) `EnteringTraffic`,
	CONSTRAINT `DF_tAccOtherMovement_UnsafeTurning` DEFAULT (0) `UnsafeTurning`,
	CONSTRAINT `DF_tAccOtherMovement_Parked` DEFAULT (0) `Parked`,
	CONSTRAINT `DF_tAccOtherMovement_Merging` DEFAULT (0) `Merging`,
	CONSTRAINT `DF_tAccOtherMovement_WrongWay` DEFAULT (0) `WrongWay`,
	CONSTRAINT `DF_tAccOtherMovement_Other` DEFAULT '' `Other`
GO

ALTER TABLE `tAccOtherVehicle` 
	CONSTRAINT `DF_tAccOtherVehicle_HomeBaseID` DEFAULT ((-1)) `HomeBaseID`,
	CONSTRAINT `DF_tAccOtherVehicle_Make` DEFAULT '' `Make`,
	CONSTRAINT `DF_tAccOtherVehicle_Model` DEFAULT '' `Model`,
	CONSTRAINT `DF_tAccOtherVehicle_Color` DEFAULT '' `Color`,
	CONSTRAINT `DF_tAccOtherVehicle_ProdYear` DEFAULT '' `ProdYear`,
	CONSTRAINT `DF_tAccOtherVehicle_LicPlate` DEFAULT '' `LicPlate`,
	CONSTRAINT `DF_tAccOtherVehicle_State` DEFAULT '' `State`,
	CONSTRAINT `DF_tAccOtherVehicle_OwnersFirstName` DEFAULT '' `OwnersFirstName`,
	CONSTRAINT `DF_tAccOtherVehicle_OwnersLastName` DEFAULT '' `OwnersLastName`,
	CONSTRAINT `DF_tAccOtherVehicle_OwnersMiddleName` DEFAULT '' `OwnersMiddleName`,
	CONSTRAINT `DF_tAccOtherVehicle_OwnersStreetAddress` DEFAULT '' `OwnersStreetAddress`,
	CONSTRAINT `DF_tAccOtherVehicle_OwnersCityAddress` DEFAULT '' `OwnersCityAddress`,
	CONSTRAINT `DF_tAccOtherVehicle_OwnersStateAddress` DEFAULT '' `OwnersStateAddress`,
	CONSTRAINT `DF_tAccOtherVehicle_OwnersZIPAddress` DEFAULT '' `OwnersZIPAddress`,
	CONSTRAINT `DF_tAccOtherVehicle_VIN` DEFAULT '' `VIN`,
	CONSTRAINT `DF_tAccOtherVehicle_Towed` DEFAULT '' `Towed`,
	CONSTRAINT `DF_tAccOtherVehicle_DOT` DEFAULT '' `DOT`,
	CONSTRAINT `DF_tAccOtherVehicle_Damage` DEFAULT '' `Damage`,
	CONSTRAINT `DF_tAccOtherVehicle_PhotoTaken` DEFAULT '' `PhotoTaken`,
	CONSTRAINT `DF_tAccOtherVehicle_InsCompany` DEFAULT '' `InsCompany`,
	CONSTRAINT `DF_tAccOtherVehicle_InsPolicyNum` DEFAULT '' `InsPolicyNum`,
	CONSTRAINT `DF_tAccOtherVehicle_InsExpDate` DEFAULT (1 / 1 / 1900) `InsExpDate`,
	CONSTRAINT `DF_tAccOtherVehicle_VehicleValue` DEFAULT (0) `VehicleValue`,
	CONSTRAINT `DF_tAccOtherVehicle_DamageEstimate` DEFAULT (0) `DamageEstimate`
GO

ALTER TABLE `tAccRadwayData` 
	CONSTRAINT `DF_tAccRadwayData_AccIWID` DEFAULT ((-1)) `AccIWID`,
	CONSTRAINT `DF_tAccRadwayData_Oneway` DEFAULT '' `Oneway`,
	CONSTRAINT `DF_tAccRadwayData_Twoway` DEFAULT '' `Twoway`,
	CONSTRAINT `DF_tAccRadwayData_TwoLane` DEFAULT '' `TwoLane`,
	CONSTRAINT `DF_tAccRadwayData_ThreeLane` DEFAULT '' `ThreeLane`,
	CONSTRAINT `DF_tAccRadwayData_FourLane` DEFAULT '' `FourLane`,
	CONSTRAINT `DF_tAccRadwayData_Other` DEFAULT '' `Other`
GO

ALTER TABLE `tAccRoadCondData` 
	CONSTRAINT `DF_tAccRoadCondData_AccIWID` DEFAULT ((-1)) `AccIWID`,
	CONSTRAINT `DF_tAccRoadCondData_Holes` DEFAULT '' `Holes`,
	CONSTRAINT `DF_tAccRoadCondData_LooseMaterial` DEFAULT ((-1)) `LooseMaterial`,
	CONSTRAINT `DF_tAccRoadCondData_Obstruction` DEFAULT '' `Obstruction`,
	CONSTRAINT `DF_tAccRoadCondData_Construction` DEFAULT '' `Construction`,
	CONSTRAINT `DF_tAccRoadCondData_ReduceRoadway` DEFAULT '' `ReducedRoadway`,
	CONSTRAINT `DF_tAccRoadCondData_Flooded` DEFAULT '' `Flooded`,
	CONSTRAINT `DF_tAccRoadCondData_NoUnusual` DEFAULT '' `NoUnusual`,
	CONSTRAINT `DF_tAccRoadCondData_Other` DEFAULT '' `Other`
GO

ALTER TABLE `tAccSurfaceData` 
	CONSTRAINT `DF_tAccSurfaceData_AccIWID` DEFAULT ((-1)) `AccIWID`,
	CONSTRAINT `DF_tAccSurfaceData_Dry` DEFAULT '' `Dry`,
	CONSTRAINT `DF_tAccSurfaceData_Wet` DEFAULT '' `Wet`,
	CONSTRAINT `DF_tAccSurfaceData_Snow` DEFAULT '' `Snow`,
	CONSTRAINT `DF_tAccSurfaceData_Icy` DEFAULT '' `Icy`,
	CONSTRAINT `DF_tAccSurfaceData_Muddy` DEFAULT '' `Muddy`,
	CONSTRAINT `DF_tAccSurfaceData_Oily` DEFAULT '' `Oily`,
	CONSTRAINT `DF_tAccSurfaceData_Other` DEFAULT '' `Other`
GO

ALTER TABLE `tAccTraficControl` 
	CONSTRAINT `DF_tAccTraficControl_AccIWID` DEFAULT ((-1)) `AccIWID`,
	CONSTRAINT `DF_tAccTraficControl_Functioning` DEFAULT '' `Functioning`,
	CONSTRAINT `DF_tAccTraficControl_NotFunctioning` DEFAULT '' `NotFunctioning`,
	CONSTRAINT `DF_tAccTraficControl_NoControl` DEFAULT '' `NoControl`,
	CONSTRAINT `DF_tAccTraficControl_Obscured` DEFAULT '' `Obscured`,
	CONSTRAINT `DF_tAccTraficControl_Other` DEFAULT '' `Other`
GO

ALTER TABLE `tAccTraficData` 
	CONSTRAINT `DF_tAccTraficData_AccIWID` DEFAULT ((-1)) `AccIWID`,
	CONSTRAINT `DF_tAccTraficData_Light` DEFAULT '' `Light`,
	CONSTRAINT `DF_tAccTraficData_Heavy` DEFAULT '' `Heavy`,
	CONSTRAINT `DF_tAccTraficData_Medium` DEFAULT '' `Medium`,
	CONSTRAINT `DF_tAccTraficData_Other` DEFAULT '' `Other`
GO

ALTER TABLE `tAccWeatherData` 
	CONSTRAINT `DF_tAccWatherData_AccIWID` DEFAULT ((-1)) `AccIWID`,
	CONSTRAINT `DF_tAccWatherData_Clear` DEFAULT '' `ClearW`,
	CONSTRAINT `DF_tAccWatherData_Cloudy` DEFAULT '' `Cloudy`,
	CONSTRAINT `DF_tAccWatherData_Raining` DEFAULT '' `Raining`,
	CONSTRAINT `DF_tAccWatherData_Snowing` DEFAULT '' `Snowing`,
	CONSTRAINT `DF_tAccWatherData_Fog` DEFAULT '' `Fog`,
	CONSTRAINT `DF_tAccWatherData_Wind` DEFAULT '' `Wind`,
	CONSTRAINT `DF_tAccWatherData_Other` DEFAULT '' `Other`
GO

ALTER TABLE `tAccident` 
	CONSTRAINT `DF_tAccident_Created` DEFAULT (getdate()) `Created`,
	CONSTRAINT `DF_tAccident_AccDate` DEFAULT (1 / 1 / 1900) `AccDate`
GO

ALTER TABLE `tActionDriver` 
	CONSTRAINT `DF_tActionDriver_HomeBaseID` DEFAULT ((-1)) `HomeBaseID`,
	CONSTRAINT `DF_tActionDriver_DIWID` DEFAULT ((-1)) `DIWID`,
	CONSTRAINT `DF_tActionDriver_ActionType` DEFAULT '' `ActionType`,
	CONSTRAINT `DF_tActionDriver_Status` DEFAULT '' `Status`,
	CONSTRAINT `DF_tActionDriver_FromDate` DEFAULT (1 / 1 / 1900) `FromDate`,
	CONSTRAINT `DF_tActionDriver_ValidForDays` DEFAULT (1) `ValidForDays`,
	CONSTRAINT `DF_tActionDriver_ValidForMin` DEFAULT (90) `ValidForMin`,
	CONSTRAINT `DF_tActionDriver_StartDateTime` DEFAULT (1 / 1 / 1900) `StartDateTime`,
	CONSTRAINT `DF_tActionDriver_EndDateTime` DEFAULT (1 / 1 / 1900) `EndDateTime`,
	CONSTRAINT `DF_tActionDriver_Created` DEFAULT (getdate()) `Created`,
	CONSTRAINT `DF_tActionDriver_CreatedByUserID` DEFAULT ((-1)) `CreatedByUserID`
GO

ALTER TABLE `tActionSystem` 
	CONSTRAINT `DF_tActionSystem_ActionType` DEFAULT '' `ActionType`,
	CONSTRAINT `DF_tActionSystem_ActionDate` DEFAULT (getdate()) `ActionDate`,
	CONSTRAINT `DF_tActionSystem_ToHomeBaseID` DEFAULT ((-1)) `ToHomeBaseID`,
	CONSTRAINT `DF_tActionSystem_ToUserID` DEFAULT ((-1)) `ToUserID`,
	CONSTRAINT `DF_tActionSystem_Confirmed` DEFAULT (0) `Confirmed`
GO

ALTER TABLE `tActionSystemForFile` 
	CONSTRAINT `DF_tActionSystemForFile_ActionSystemID` DEFAULT ((-1)) `ActionSystemID`,
	CONSTRAINT `DF_tActionSystemForFile_FileID` DEFAULT ((-1)) `FileID`,
	CONSTRAINT `DF_tActionSystemForFile_DIWID` DEFAULT ((-1)) `DIWID`,
	CONSTRAINT `DF_tActionSystemForFile_ExpType` DEFAULT '' `ExpType`,
	CONSTRAINT `DF_tActionSystemForFile_Expires` DEFAULT (1 / 1 / 1900) `Expires`,
	CONSTRAINT `DF_tActionSystemForFile_Created` DEFAULT (getdate()) `Created`,
	CONSTRAINT `DF_tActionSystemForFile_ActionType` DEFAULT '' `ActionType`
GO

ALTER TABLE `tActionUser` 
	CONSTRAINT `DF_ActionUser_HomeBaseID` DEFAULT ((-1)) `HomeBaseID`,
	CONSTRAINT `DF_ActionByUser_ActionType` DEFAULT '' `ActionType`,
	CONSTRAINT `DF_ActionByUser_ActionDate` DEFAULT (getdate()) `ActionDate`,
	CONSTRAINT `DF_ActionByUser_ActionOn` DEFAULT '' `ActionOn`,
	CONSTRAINT `DF_ActionByUser_DIWID` DEFAULT ((-1)) `OnID`,
	CONSTRAINT `DF_ActionByUser_ByName` DEFAULT '' `ByName`,
	CONSTRAINT `DF_ActionByUser_ByUserID` DEFAULT ((-1)) `ByUserID`,
	CONSTRAINT `DF_ActionByUser_Parameters` DEFAULT '' `Parameters`,
	CONSTRAINT `DF_tActionUser_Comment` DEFAULT '' `Comment`
GO

ALTER TABLE `tAppCheck` 
	CONSTRAINT `DF_tAppCheck_DIWID` DEFAULT ((-1)) `DIWID`,
	CONSTRAINT `DF_tAppCheck_CheckReview` DEFAULT (0) `CheckReview`,
	CONSTRAINT `DF_tAppCheck_CheckPrintForms` DEFAULT (0) `CheckPrintForms`,
	CONSTRAINT `DF_tAppCheck_CheckScanAllForms` DEFAULT (0) `CheckScanAllForms`,
	CONSTRAINT `DF_tAppCheck_CheckSignature` DEFAULT (0) `CheckSignature`,
	CONSTRAINT `DF_tAppCheck_CheckPicture` DEFAULT (0) `CheckPicture`,
	CONSTRAINT `DF_tAppCheck_CheckScan` DEFAULT (0) `CheckScan`,
	CONSTRAINT `DF_tAppCheck_CheckAutoFax` DEFAULT (0) `CheckAutoFax`
GO

ALTER TABLE `tCStaff` 
	CONSTRAINT `DF_tCompanyStaff_CompanyID` DEFAULT ((-1)) `CompanyID`,
	CONSTRAINT `DF_tCompanyStaff_FirstName` DEFAULT '' `FirstName`,
	CONSTRAINT `DF_tCompanyStaff_LastName` DEFAULT '' `LastName`,
	CONSTRAINT `DF_tCompanyStaff_Title` DEFAULT '' `Title`,
	CONSTRAINT `DF_tCompanyStaff_Telephone` DEFAULT '' `Telephone`,
	CONSTRAINT `DF_tCompanyStaff_Email` DEFAULT '' `Email`,
	CONSTRAINT `DF_tCompanyStaff_Role` DEFAULT '' `Role`,
	CONSTRAINT `DF_tCompanyStaff_Status` DEFAULT '' `Status`,
	CONSTRAINT `DF_tCompanyStaff_Created` DEFAULT (getdate()) `Created`,
	CONSTRAINT `DF__tCStaff__DQF__51FA155C` DEFAULT (1) `DQF`,
	CONSTRAINT `DF__tCStaff__VIM__52EE3995` DEFAULT (1) `VIM`,
	CONSTRAINT `DF__tCStaff__Acciden__53E25DCE` DEFAULT (1) `Accident`
GO

ALTER TABLE `tCompany` 
	CONSTRAINT `DF_tCompany_CompanyName` DEFAULT '' `CompanyName`,
	CONSTRAINT `DF_tCompany_CompanyCode` DEFAULT '' `CompanyCode`,
	CONSTRAINT `DF_tCompany_Address` DEFAULT '' `Address`,
	CONSTRAINT `DF_tCompany_City` DEFAULT '' `City`,
	CONSTRAINT `DF_tCompany_State` DEFAULT '' `State`,
	CONSTRAINT `DF_tCompany_Zip` DEFAULT '' `Zip`,
	CONSTRAINT `DF_tCompany_Telephone` DEFAULT '' `Telephone`,
	CONSTRAINT `DF_tCompany_Fax` DEFAULT '' `Fax`,
	CONSTRAINT `DF_tCompany_Created` DEFAULT (getdate()) `Created`,
	CONSTRAINT `DF_tCompany_P1FirstName` DEFAULT '' `P1FirstName`,
	CONSTRAINT `DF_tCompany_P1LastName` DEFAULT '' `P1LastName`,
	CONSTRAINT `DF_tCompany_P1Title` DEFAULT '' `P1Title`,
	CONSTRAINT `DF_tCompany_P1Telephone` DEFAULT '' `P1Telephone`,
	CONSTRAINT `DF_tCompany_P1Email` DEFAULT '' `P1Email`,
	CONSTRAINT `DF_tCompany_P1Role` DEFAULT '' `P1Role`,
	CONSTRAINT `DF_tCompany_P1Status` DEFAULT '' `P1Status`,
	CONSTRAINT `DF_tCompany_Url` DEFAULT ('https://www.driverqualificationonline.com/nschanson') `Url`
GO

ALTER TABLE `tCompanyDoc` 
	CONSTRAINT `DF_tCompanyDoc_DocType` DEFAULT '' `DocType`,
	CONSTRAINT `DF_tCompanyDoc_Category` DEFAULT '' `Category`,
	CONSTRAINT `DF_tCompanyDoc_DocTitle` DEFAULT '' `DocTitle`,
	CONSTRAINT `DF_tCompanyDoc_DocCode` DEFAULT '' `DocCode`,
	CONSTRAINT `DF_tCompanyDoc_HasPDF` DEFAULT (0) `HasPDF`,
	CONSTRAINT `DF_tCompanyDoc_PDFFile` DEFAULT '' `PDFFile`,
	CONSTRAINT `DF_tCompanyDoc_HasScan` DEFAULT (0) `HasScan`,
	CONSTRAINT `DF_tCompanyDoc_Multiple` DEFAULT (0) `Multiple`,
	CONSTRAINT `DF_tCompanyDoc_PageNum` DEFAULT ((-1)) `PageNum`
GO

ALTER TABLE `tCompanyDocList` 
	CONSTRAINT `DF_tCompanyDocList_AccIWID` DEFAULT ((-1)) `CompanyID`,
	CONSTRAINT `DF_tCompanyDocList_DocID` DEFAULT ((-1)) `DocID`,
	CONSTRAINT `DF_tCompanyDocList_Status` DEFAULT '' `Status`,
	CONSTRAINT `DF_tCompanyDocList_Requested` DEFAULT (1 / 1 / 1900) `Requested`,
	CONSTRAINT `DF_tCompanyDocList_Completed` DEFAULT (1 / 1 / 1900) `Completed`,
	CONSTRAINT `DF_tCompanyDocList_ScanDateTime` DEFAULT '' `ScanDateTime`,
	CONSTRAINT `DF_tCompanyDocList_Created` DEFAULT (getdate()) `Created`,
	CONSTRAINT `DF_tCompanyDocList_OtherTitle` DEFAULT '' `OtherTitle`
GO

ALTER TABLE `tDIW` 
	CONSTRAINT `DF_tDIW_DriverID` DEFAULT ((-1)) `FileID`,
	CONSTRAINT `DF_tDIW_EnterDate` DEFAULT (getdate()) `EntryDate`,
	CONSTRAINT `DF_tDIW_AppDate` DEFAULT (1 / 1 / 1900) `AppDate`,
	CONSTRAINT `DF_tDIW_AppType` DEFAULT '' `AppType`,
	CONSTRAINT `DF_tDIW_AppNumber` DEFAULT '' `AppNumber`,
	CONSTRAINT `DF_tDIW_DateOfHire` DEFAULT (1 / 1 / 1900) `DateOfHire`,
	CONSTRAINT `DF_tDIW_TruckNumber` DEFAULT '' `TruckNumber`,
	CONSTRAINT `DF_tDIW_FirstName` DEFAULT '' `FirstName`,
	CONSTRAINT `DF_tDIW_LastName` DEFAULT '' `LastName`,
	CONSTRAINT `DF_tDIW_MiddleName` DEFAULT '' `MiddleName`,
	CONSTRAINT `DF_tDIW_BirthName` DEFAULT '' `BirthName`,
	CONSTRAINT `DF_tDIW_RANumber` DEFAULT '' `RANumber`,
	CONSTRAINT `DF_tDIW_RAExpDate` DEFAULT (1 / 1 / 1900) `RAExpDate`,
	CONSTRAINT `DF_tDIW_MedNumber` DEFAULT '' `MedNumber`,
	CONSTRAINT `DF_tDIW_MedExpDate` DEFAULT (1 / 1 / 1900) `MedExpDate`,
	CONSTRAINT `DF_tDIW_MedExaminerName` DEFAULT '' `MedExaminerName`,
	CONSTRAINT `DF_tDIW_StrightTruck` DEFAULT ('No') `StraightTruck`,
	CONSTRAINT `DF_tDIW_STFromDate` DEFAULT (1 / 1 / 1900) `STFromDate`,
	CONSTRAINT `DF_tDIW_STToDate` DEFAULT (1 / 1 / 1900) `STToDate`,
	CONSTRAINT `DF_tDIW_STTotalMiles` DEFAULT '' `STTotalMiles`,
	CONSTRAINT `DF_tDIW_TractorSemiTrailer` DEFAULT ('No') `TractorSemiTrailer`,
	CONSTRAINT `DF_tDIW_TSTFromDate` DEFAULT (1 / 1 / 1900) `TSTFromDate`,
	CONSTRAINT `DF_tDIW_TSTToDate` DEFAULT (1 / 1 / 1900) `TSTToDate`,
	CONSTRAINT `DF_tDIW_TSTTotalMiles` DEFAULT '' `TSTTotalMiles`,
	CONSTRAINT `DF_tDIW_DoublesTriples` DEFAULT ('No') `DoublesTriples`,
	CONSTRAINT `DF_tDIW_DTFromDate` DEFAULT (1 / 1 / 1900) `DTFromDate`,
	CONSTRAINT `DF_tDIW_DTToDate` DEFAULT (1 / 1 / 1900) `DTToDate`,
	CONSTRAINT `DF_tDIW_DTTotalMiles` DEFAULT '' `DTTotalMiles`,
	CONSTRAINT `DF_tDIW_Busses` DEFAULT ('No') `Busses`,
	CONSTRAINT `DF_tDIW_BusFromDate` DEFAULT (1 / 1 / 1900) `BusFromDate`,
	CONSTRAINT `DF_tDIW_BusToDate` DEFAULT (1 / 1 / 1900) `BusToDate`,
	CONSTRAINT `DF_tDIW_BusTotalMiles` DEFAULT '' `BusTotalMiles`,
	CONSTRAINT `DF_tDIW_Tankers` DEFAULT ('No') `Tankers`,
	CONSTRAINT `DF_tDIW_TanFromDate` DEFAULT (1 / 1 / 1900) `TanFromDate`,
	CONSTRAINT `DF_tDIW_TanToDate` DEFAULT (1 / 1 / 1900) `TanToDate`,
	CONSTRAINT `DF_tDIW_TanTotalMiles` DEFAULT '' `TanTotalMiles`,
	CONSTRAINT `DF_tDIW_OtherEquip` DEFAULT ('No') `OtherEquip`,
	CONSTRAINT `DF_tDIW_OthFromDate` DEFAULT (1 / 1 / 1900) `OthFromDate`,
	CONSTRAINT `DF_tDIW_OthToDate` DEFAULT (1 / 1 / 1900) `OthToDate`,
	CONSTRAINT `DF_tDIW_OthTotalMiles` DEFAULT '' `OthTotalMiles`,
	CONSTRAINT `DF_tDIW_OthDescribe` DEFAULT '' `OthDescribe`,
	CONSTRAINT `DF_tDIW_DeniedCDL` DEFAULT '' `DeniedCDL`,
	CONSTRAINT `DF_tDIW_DeniedCDLExplain` DEFAULT '' `DeniedCDLExplain`,
	CONSTRAINT `DF_tDIW_SuspCDL` DEFAULT '' `SuspCDL`,
	CONSTRAINT `DF_tDIW_SuspCDLExplain` DEFAULT '' `SuspCDLExplain`,
	CONSTRAINT `DF_tDIW_CopyStatus` DEFAULT ('Incomplete') `CopyStatus`,
	CONSTRAINT `DF_tDIW_Created` DEFAULT (getdate()) `Created`,
	CONSTRAINT `DF__tDIW__NoRA__4159993F` DEFAULT (0) `NoRA`,
	CONSTRAINT `DF__tDIW__NoAcc__424DBD78` DEFAULT (0) `NoAcc`,
	CONSTRAINT `DF__tDIW__NoViol__4341E1B1` DEFAULT (0) `NoViol`,
	CONSTRAINT `DF__tDIW__NoEmpl__443605EA` DEFAULT (0) `NoEmpl`,
	CONSTRAINT `DF_tDIW_DriverCode` DEFAULT '' `DriverCode`,
	CONSTRAINT `DF_tDIW_TWICSerial` DEFAULT ((-1)) `TWICSerial`,
	CONSTRAINT `DF_tDIW_TWICExpDate` DEFAULT (1 / 1 / 1900) `TWICExpDate`,
	CONSTRAINT `DF_tDIW_NextelPhone` DEFAULT '' `NextelPhone`,
	CONSTRAINT `DF_tDIW_NextelPhoneSerial` DEFAULT '' `NextelPhoneSerial`,
	CONSTRAINT `DF_tDIW_RadioFrequency` DEFAULT '' `RadioFrequency`,
	CONSTRAINT `DF_tDIW_RadioSerial` DEFAULT '' `RadioSerial`
GO

ALTER TABLE `tDIWAccident` 
	CONSTRAINT `DF_tDriverAccident_DIWID` DEFAULT ((-1)) `DIWID`,
	CONSTRAINT `DF_tDIWAccident_AccDate` DEFAULT (1 / 1 / 1900) `AccDate`,
	CONSTRAINT `DF_tDriverAccident_City` DEFAULT '' `City`,
	CONSTRAINT `DF_tDriverAccident_State` DEFAULT '' `State`,
	CONSTRAINT `DF_tDriverAccident_AccType` DEFAULT '' `AccType`,
	CONSTRAINT `DF_tDriverAccident_Fatalies` DEFAULT '' `Fatalies`,
	CONSTRAINT `DF_tDriverAccident_Injuries` DEFAULT '' `Injuries`,
	CONSTRAINT `DF_tDIWAccident_OrderNo` DEFAULT ((-1)) `OrderNo`
GO

ALTER TABLE `tDIWAddress` 
	CONSTRAINT `DF_tDriverAddress_DIWID` DEFAULT ((-1)) `DIWID`,
	CONSTRAINT `DF_tDriverAddress_Address` DEFAULT '' `Address`,
	CONSTRAINT `DF_tDriverAddress_City` DEFAULT '' `City`,
	CONSTRAINT `DF_tDriverAddress_State` DEFAULT '' `State`,
	CONSTRAINT `DF_tDriverAddress_Zip` DEFAULT '' `Zip`,
	CONSTRAINT `DF_tDriverAddress_Phone` DEFAULT '' `Phone`,
	CONSTRAINT `DF_tDriverAddress_YearsAtAddress` DEFAULT '' `YearsAtAddress`,
	CONSTRAINT `DF_tDriverAddress_MonthsAtAddress` DEFAULT '' `MonthsAtAddress`,
	CONSTRAINT `DF_tDIWAddress_FromDate` DEFAULT (1 / 1 / 1900) `FromDate`,
	CONSTRAINT `DF_tDIWAddress_CurrAddress` DEFAULT ('No') `CurrAddress`
GO

ALTER TABLE `tDIWCDL` 
	CONSTRAINT `DF_tDriverCDL_DIWID` DEFAULT ((-1)) `DIWID`,
	CONSTRAINT `DF_tDriverCDL_CDLNumber` DEFAULT '' `CDLNumber`,
	CONSTRAINT `DF_tDriverCDL_State` DEFAULT '' `State`,
	CONSTRAINT `DF_tDriverCDL_Class` DEFAULT '' `Class`,
	CONSTRAINT `DF_tDIWCDL_EndorP` DEFAULT '' `EndorP`,
	CONSTRAINT `DF_tDIWCDL_EndorT` DEFAULT '' `EndorT`,
	CONSTRAINT `DF_tDIWCDL_EndorH` DEFAULT '' `EndorH`,
	CONSTRAINT `DF_tDIWCDL_EndorN` DEFAULT '' `EndorN`,
	CONSTRAINT `DF_tDIWCDL_EndorX` DEFAULT '' `EndorX`,
	CONSTRAINT `DF_tDriverCDL_AirBrakeRestriction` DEFAULT (0) `AirBrakeRestriction`,
	CONSTRAINT `DF_tDIWCDL_Expires` DEFAULT (1 / 1 / 1900) `Expires`,
	CONSTRAINT `DF_tDIWCDL_CDLCurrent` DEFAULT (0) `CDLCurrent`,
	CONSTRAINT `DF_tDIWCDL_OrderNo` DEFAULT ((-1)) `OrderNo`
GO

ALTER TABLE `tDIWDataSheet` 
	CONSTRAINT `DF_tDIWDateSheet_DIWID` DEFAULT ((-1)) `DIWID`,
	CONSTRAINT `DF_tDIWDataSheet_Date1` DEFAULT (1 / 1 / 1900) `Date1`,
	CONSTRAINT `DF_tDIWDateSheet_Hours1` DEFAULT '' `Hours1`,
	CONSTRAINT `DF_tDIWDataSheet_Date2` DEFAULT (1 / 1 / 1900) `Date2`,
	CONSTRAINT `DF_tDIWDateSheet_Hours2` DEFAULT '' `Hours2`,
	CONSTRAINT `DF_tDIWDataSheet_Date3` DEFAULT (1 / 1 / 1900) `Date3`,
	CONSTRAINT `DF_tDIWDateSheet_Hours3` DEFAULT '' `Hours3`,
	CONSTRAINT `DF_tDIWDataSheet_Date4` DEFAULT (1 / 1 / 1900) `Date4`,
	CONSTRAINT `DF_tDIWDateSheet_Hours4` DEFAULT '' `Hours4`,
	CONSTRAINT `DF_tDIWDataSheet_Date5` DEFAULT (1 / 1 / 1900) `Date5`,
	CONSTRAINT `DF_tDIWDateSheet_Hours5` DEFAULT '' `Hours5`,
	CONSTRAINT `DF_tDIWDataSheet_Date6` DEFAULT (1 / 1 / 1900) `Date6`,
	CONSTRAINT `DF_tDIWDateSheet_Hours6` DEFAULT '' `Hours6`,
	CONSTRAINT `DF_tDIWDataSheet_Date7` DEFAULT (1 / 1 / 1900) `Date7`,
	CONSTRAINT `DF_tDIWDateSheet_Hours7` DEFAULT '' `Hours7`,
	CONSTRAINT `DF_tDIWDataSheet_LastRelievedDate` DEFAULT (1 / 1 / 1900) `LastRelievedDate`,
	CONSTRAINT `DF_tDIWDateSheet_LastRelievedTime` DEFAULT '' `LastRelievedTime`
GO

ALTER TABLE `tDIWEmployer` 
	CONSTRAINT `DF_tDriverEmployer_DIWID` DEFAULT ((-1)) `DIWID`,
	CONSTRAINT `DF_tDriverEmployer_Employer` DEFAULT '' `Employer`,
	CONSTRAINT `DF_tDriverEmployer_Address` DEFAULT '' `Address`,
	CONSTRAINT `DF_tDriverEmployer_City` DEFAULT '' `City`,
	CONSTRAINT `DF_tDriverEmployer_State` DEFAULT '' `State`,
	CONSTRAINT `DF_tDriverEmployer_Zip` DEFAULT '' `Zip`,
	CONSTRAINT `DF_tDriverEmployer_Telephone` DEFAULT '' `Telephone`,
	CONSTRAINT `DF_tDriverEmployer_Fax` DEFAULT '' `Fax`,
	CONSTRAINT `DF_tDriverEmployer_Job` DEFAULT '' `Job`,
	CONSTRAINT `DF_tDriverEmployer_FromMonth` DEFAULT (0) `FromMonth`,
	CONSTRAINT `DF_tDriverEmployer_FromYear` DEFAULT (0) `FromYear`,
	CONSTRAINT `DF_tDriverEmployer_ToMonth` DEFAULT (0) `ToMonth`,
	CONSTRAINT `DF_tDriverEmployer_ToYear` DEFAULT (0) `ToYear`,
	CONSTRAINT `DF_tDriverEmployer_Reason` DEFAULT '' `Reason`
GO

ALTER TABLE `tDIWVehicle` 
	CONSTRAINT `DF_tDIWVehicle_DIWID` DEFAULT ((-1)) `DIWID`,
	CONSTRAINT `DF_tDIWVehicle_OwnerFirstName` DEFAULT '' `OwnerFirstName`,
	CONSTRAINT `DF_tDIWVehicle_OwnerLastName` DEFAULT '' `OwnerLastName`,
	CONSTRAINT `DF_tDIWVehicle_VehicleType` DEFAULT '' `VehicleType`,
	CONSTRAINT `DF_tDIWVehicle_NuberOfAxles` DEFAULT '' `NumberOfAxles`,
	CONSTRAINT `DF_tDIWVehicle_LicPlateNumber` DEFAULT '' `LicPlateNumber`,
	CONSTRAINT `DF_tDIWVehicle_VIN` DEFAULT '' `VIN`,
	CONSTRAINT `DF_tDIWVehicle_RegExpDate` DEFAULT (1 / 1 / 1900) `RegExpDate`,
	CONSTRAINT `DF_tDIWVehicle_ValueOfVehicle` DEFAULT '' `ValueOfVehicle`,
	CONSTRAINT `DF_tDIWVehicle_InsCompany` DEFAULT '' `InsCompany`,
	CONSTRAINT `DF_tDIWVehicle_InsPolicy` DEFAULT '' `InsPolicy`,
	CONSTRAINT `DF_tDIWVehicle_InsExpDate` DEFAULT (1 / 1 / 1900) `InsExpDate`,
	CONSTRAINT `DF_tDIWVehicle_InsLimits` DEFAULT '' `InsLimits`
GO

ALTER TABLE `tDIWViolation` 
	CONSTRAINT `DF_tDriverViolation_DIWID` DEFAULT ((-1)) `DIWID`,
	CONSTRAINT `DF_tDIWViolation_ViolDate` DEFAULT (1 / 1 / 1900) `ViolDate`,
	CONSTRAINT `DF_tDriverViolation_Location` DEFAULT '' `Location`,
	CONSTRAINT `DF_tDriverViolation_Violation` DEFAULT '' `Violation`,
	CONSTRAINT `DF_tDriverViolation_Penalty` DEFAULT '' `Penalty`,
	CONSTRAINT `DF_tDriverViolation_TypeOfVehicle` DEFAULT '' `TypeOfVehicle`,
	CONSTRAINT `DF_tDIWViolation_OrderNo` DEFAULT ((-1)) `OrderNo`
GO

ALTER TABLE `tDOTInspections` 
	CONSTRAINT `DF_tDOTInspections_CompanyID` DEFAULT ((-1)) `CompanyID`,
	CONSTRAINT `DF_tDOTInspections_InspectionDate` DEFAULT (1 / 1 / 1900) `InspectionDate`,
	CONSTRAINT `DF_tDOTInspections_InspectionTime` DEFAULT '' `InspectionTime`,
	CONSTRAINT `DF_tDOTInspections_RequestedByFName` DEFAULT '' `RequestedByFName`,
	CONSTRAINT `DF_tDOTInspections_RequestedByLName` DEFAULT '' `RequestedByLName`,
	CONSTRAINT `DF_tDOTInspections_Status` DEFAULT '' `Status`
GO

ALTER TABLE `tDQFAnnualReview` 
	CONSTRAINT `DF_tAnnualReview_DIWID` DEFAULT ((-1)) `DQFDocID`,
	CONSTRAINT `DF_tAnnualReview_ReviewDate` DEFAULT (1 / 1 / 1900) `ReviewDate`,
	CONSTRAINT `DF_tAnnualReview_Qualified` DEFAULT ((-1)) `Qualified`,
	CONSTRAINT `DF_tAnnualReview_Name` DEFAULT '' `Name`,
	CONSTRAINT `DF_tAnnualReview_Remarks` DEFAULT '' `Remarks`,
	CONSTRAINT `DF_tAnnualReview_ConfirmReview` DEFAULT ((-1)) `ConfirmReview`,
	CONSTRAINT `DF_tDQFAnnualReview_Created` DEFAULT (getdate()) `Created`
GO

ALTER TABLE `tDQFDisq383` 
	CONSTRAINT `DF_tDQFDisq383_DQFDocID` DEFAULT ((-1)) `DQFDocID`,
	CONSTRAINT `DF_tDQFDisq383_AADate` DEFAULT '' `AADate`,
	CONSTRAINT `DF_tDQFDisq383_BBDate` DEFAULT '' `BBDate`,
	CONSTRAINT `DF_tDQFDisq383_CCDate` DEFAULT '' `CCDate`,
	CONSTRAINT `DF_tDQFDisq383_DDDate` DEFAULT '' `DDDate`,
	CONSTRAINT `DF_tDQFDisq383_EEDate` DEFAULT '' `EEDate`,
	CONSTRAINT `DF_tDQFDisq383_FFDate` DEFAULT '' `FFDate`,
	CONSTRAINT `DF_tDQFDisq383_GGDate` DEFAULT '' `GGDate`,
	CONSTRAINT `DF_tDQFDisq383_ToName` DEFAULT '' `ToName`,
	CONSTRAINT `DF_tDQFDisq383_NoticeDate` DEFAULT (1 / 1 / 1900) `NoticeDate`,
	CONSTRAINT `DF_tDQFDisq383_Period` DEFAULT '' `Period`,
	CONSTRAINT `DF_tDQFDisq383_SuspCode` DEFAULT '' `SuspCode`,
	CONSTRAINT `DF_tDQFDisq383_SuspDateFrom` DEFAULT (1 / 1 / 1900) `SuspFromDate`,
	CONSTRAINT `DF_tDQFDisq383_SuspDateTo` DEFAULT (1 / 1 / 1900) `SuspToDate`,
	CONSTRAINT `DF_tDQFDisq383_TermCode` DEFAULT '' `TermCode`,
	CONSTRAINT `DF_tDQFDisq383_TermDate` DEFAULT (1 / 1 / 1900) `TermDate`,
	CONSTRAINT `DF_tDQFDisq383_ByName` DEFAULT '' `ByName`,
	CONSTRAINT `DF_tDQFDisq383_ByTitle` DEFAULT '' `ByTitle`,
	CONSTRAINT `DF_tDQFDisq383_Created` DEFAULT (getdate()) `Created`
GO

ALTER TABLE `tDQFDisq391` 
	CONSTRAINT `DF_tDQFDisq391_DQFDocID` DEFAULT ((-1)) `DQFDocID`,
	CONSTRAINT `DF_tDQFDisq391_ADate` DEFAULT '' `ADate`,
	CONSTRAINT `DF_tDQFDisq391_BDate` DEFAULT '' `BDate`,
	CONSTRAINT `DF_tDQFDisq391_CDate` DEFAULT '' `CDate`,
	CONSTRAINT `DF_tDQFDisq391_DDate` DEFAULT '' `DDate`,
	CONSTRAINT `DF_tDQFDisq391_EDate` DEFAULT '' `EDate`,
	CONSTRAINT `DF_tDQFDisq391_FDate` DEFAULT '' `FDate`,
	CONSTRAINT `DF_tDQFDisq391_GDate` DEFAULT '' `GDate`,
	CONSTRAINT `DF_tDQFDisq391_HDate` DEFAULT '' `HDate`,
	CONSTRAINT `DF_tDQFDisq391_IDate` DEFAULT '' `IDate`,
	CONSTRAINT `DF_tDQFDisq391_JDate` DEFAULT '' `JDate`,
	CONSTRAINT `DF_tDQFDisq391_KDate` DEFAULT '' `KDate`,
	CONSTRAINT `DF_tDQFDisq391_LDate` DEFAULT '' `LDate`,
	CONSTRAINT `DF_tDQFDisq391_MDate` DEFAULT '' `MDate`,
	CONSTRAINT `DF_tDQFDisq391_NDate` DEFAULT '' `NDate`,
	CONSTRAINT `DF_tDQFDisq391_ODate` DEFAULT '' `ODate`,
	CONSTRAINT `DF_tDQFDisq391_PRegulation` DEFAULT '' `PRegulation`,
	CONSTRAINT `DF_tDQFDisq391_PDate` DEFAULT '' `PDate`,
	CONSTRAINT `DF_tDQFDisq391_PDescription` DEFAULT '' `PDescription`,
	CONSTRAINT `DF_tDQFDisq391_QRegulation` DEFAULT '' `QRegulation`,
	CONSTRAINT `DF_tDQFDisq391_QDate` DEFAULT ('(1 / 1 / 1900)''') `QDate`,
	CONSTRAINT `DF_tDQFDisq391_QDescription` DEFAULT '' `QDescription`,
	CONSTRAINT `DF_tDQFDisq391_RRegulation` DEFAULT '' `RRegulation`,
	CONSTRAINT `DF_tDQFDisq391_RDate` DEFAULT '' `RDate`,
	CONSTRAINT `DF_tDQFDisq391_RDescription` DEFAULT '' `RDescription`,
	CONSTRAINT `DF_tDQFDisq391_SRegulation` DEFAULT '' `SRegulation`,
	CONSTRAINT `DF_tDQFDisq391_SDate` DEFAULT '' `SDate`,
	CONSTRAINT `DF_tDQFDisq391_SDescription` DEFAULT '' `SDescription`,
	CONSTRAINT `DF_tDQFDisq391_ToName` DEFAULT '' `ToName`,
	CONSTRAINT `DF_tDQFDisq391_NoticeDate` DEFAULT (1 / 1 / 1900) `NoticeDate`,
	CONSTRAINT `DF_tDQFDisq391_Period` DEFAULT '' `Period`,
	CONSTRAINT `DF_tDQFDisq391_SuspCode` DEFAULT '' `SuspCode`,
	CONSTRAINT `DF_tDQFDisq391_SuspFromDate` DEFAULT (1 / 1 / 1900) `SuspFromDate`,
	CONSTRAINT `DF_tDQFDisq391_SuspToDate` DEFAULT (1 / 1 / 1900) `SuspToDate`,
	CONSTRAINT `DF_tDQFDisq391_TermCode` DEFAULT '' `TermCode`,
	CONSTRAINT `DF_tDQFDisq391_TermDate` DEFAULT (1 / 1 / 1900) `TermDate`,
	CONSTRAINT `DF_tDQFDisq391_ByName` DEFAULT '' `ByName`,
	CONSTRAINT `DF_tDQFDisq391_ByTitle` DEFAULT '' `ByTitle`
GO

ALTER TABLE `tDQFDoc` 
	CONSTRAINT `DF_tDQFDoc_DIWID` DEFAULT ((-1)) `DIWID`,
	CONSTRAINT `DF_tDQFDoc_DocType` DEFAULT ((-1)) `DocID`,
	CONSTRAINT `DF_tDQFDoc_Status` DEFAULT '' `Status`,
	CONSTRAINT `DF_tDQFDoc_Requested` DEFAULT (1 / 1 / 1900) `Requested`,
	CONSTRAINT `DF_tDQFDoc_Completed` DEFAULT (1 / 1 / 1900) `Completed`,
	CONSTRAINT `DF_tDQFDoc_DIWEmployerID` DEFAULT ((-1)) `DIWEmployerID`,
	CONSTRAINT `DF_tDQFDoc_ScanDateTime` DEFAULT '' `ScanDateTime`,
	CONSTRAINT `DF_tDQFDoc_Created` DEFAULT (getdate()) `Created`,
	CONSTRAINT `DF_tDQFDoc_OtherTitle` DEFAULT '' `OtherTitle`,
	CONSTRAINT `DF_tDQFDoc_RelatedTo` DEFAULT ((-1)) `RelatedTo`
GO

ALTER TABLE `tDQFDocDOTCheck` 
	CONSTRAINT `DF_tDQFDocDOTCheck_DQFDocID` DEFAULT ((-1)) `DQFDocID`,
	CONSTRAINT `DF_tDQFDocDOTCheck_TruckDocID` DEFAULT ((-1)) `TruckQFDocID`,
	CONSTRAINT `DF_tDQFDocDOTCheck_AccidentID` DEFAULT ((-1)) `AccQFDocID`,
	CONSTRAINT `DF_tDQFDocDOTCheck_DriverFileID` DEFAULT ((-1)) `DriverFileID`,
	CONSTRAINT `DF_tDQFDocDOTCheck_AccFileID` DEFAULT ((-1)) `AccFileID`,
	CONSTRAINT `DF_tDQFDocDOTCheck_VehFileID` DEFAULT ((-1)) `VehFileID`,
	CONSTRAINT `DF_tDQFDocDOTCheck_CompanyID` DEFAULT ((-1)) `CompanyID`,
	CONSTRAINT `DF_tDQFDocDOTCheck_CompanyDocID` DEFAULT ((-1)) `CompanyDocID`,
	CONSTRAINT `DF_tDQFDocDOTCheck_DOTCheckStatus` DEFAULT (0) `DOTCheckStatus`,
	CONSTRAINT `DF_tDQFDocDOTCheck_DOTCheckNote` DEFAULT '' `DOTCheckNote`,
	CONSTRAINT `DF_tDQFDocDOTCheck_DOTCheckDate` DEFAULT (1 / 1 / 1900) `DOTCheckDate`,
	CONSTRAINT `DF_tDQFDocDOTCheck_DOTCheckBy` DEFAULT '' `DOTCheckBy`,
	CONSTRAINT `DF_tDQFDocDOTCheck_DocStatus` DEFAULT '' `DocStatus`,
	CONSTRAINT `DF_tDQFDocDOTCheck_DOTInspectionID` DEFAULT ((-1)) `DOTInspectionID`,
	CONSTRAINT `DF_tDQFDocDOTCheck_DocTitle` DEFAULT '' `DocTitle`,
	CONSTRAINT `DF_tDQFDocDOTCheck_HomeBaseD` DEFAULT ((-1)) `HomeBaseID`,
	CONSTRAINT `DF_tDQFDocDOTCheck_HBName` DEFAULT '' `HBName`,
	CONSTRAINT `DF_tDQFDocDOTCheck_CompName` DEFAULT '' `CompName`
GO

ALTER TABLE `tDoc` 
	CONSTRAINT `DF_tDoc_DocType` DEFAULT '' `DocType`,
	CONSTRAINT `DF_tDoc_Category` DEFAULT '' `Category`,
	CONSTRAINT `DF_tDoc_DocCode` DEFAULT '' `DocCode`,
	CONSTRAINT `DF_tDoc_HasPDF` DEFAULT (0) `HasPDF`,
	CONSTRAINT `DF_tDoc_PDFFile` DEFAULT '' `PDFFile`,
	CONSTRAINT `DF_tDoc_HasScan` DEFAULT (0) `HasScan`,
	CONSTRAINT `DF_tDoc_ForEmployer` DEFAULT (0) `Multiple`,
	CONSTRAINT `DF_tDoc_ForEmployer_1` DEFAULT (0) `ForEmployer`,
	CONSTRAINT `DF_tDoc_PageNum` DEFAULT ((-1)) `PageNum`,
	CONSTRAINT `DF_tDoc_HasNSCCheck` DEFAULT (1) `HasNSCCheck`
GO

ALTER TABLE `tDriver` 
	CONSTRAINT `DF_tDriver_SSN` DEFAULT '' `SSN`,
	CONSTRAINT `DF_tDriver_DOB` DEFAULT (1 / 1 / 1900) `DOB`,
	CONSTRAINT `DF_tDriver_Created` DEFAULT (getdate()) `Created`
GO

ALTER TABLE `tDriverAccount` 
	CONSTRAINT `DF_tDriverAccount_DIWID` DEFAULT ((-1)) `DIWID`,
	CONSTRAINT `DF_tDriverAccount_AccountType` DEFAULT '' `AccountType`,
	CONSTRAINT `DF_tDriverAccount_DQFDocID` DEFAULT ((-1)) `DQFDocID`,
	CONSTRAINT `DF_tDriverAccount_StartTime` DEFAULT (getdate()) `StartTime`,
	CONSTRAINT `DF_tDriverAccount_Length` DEFAULT (0) `Duration`,
	CONSTRAINT `DF_tDriverAccount_Status` DEFAULT '' `Status`
GO

ALTER TABLE `tDriversCrossSection` 
	CONSTRAINT `DF_tDriversCrossSection_HBID` DEFAULT ((-1)) `HBID`,
	CONSTRAINT `DF_tDriversCrossSection_CompanyID` DEFAULT ((-1)) `CompanyID`,
	CONSTRAINT `DF_tDriversCrossSection_DateCreated` DEFAULT (1 / 1 / 1900) `DateCreated`,
	CONSTRAINT `DF_tDriversCrossSection_Pending` DEFAULT ((-1)) `Pending`,
	CONSTRAINT `DF_tDriversCrossSection_Applicant` DEFAULT ((-1)) `Applicant`,
	CONSTRAINT `DF_tDriversCrossSection_Hired` DEFAULT ((-1)) `Hired`,
	CONSTRAINT `DF_tDriversCrossSection_HiredActive` DEFAULT ((-1)) `HiredActive`,
	CONSTRAINT `DF_tDriversCrossSection_HiredInactive` DEFAULT ((-1)) `HiredInactive`,
	CONSTRAINT `DF_tDriversCrossSection_Declined` DEFAULT ((-1)) `Declined`,
	CONSTRAINT `DF_tDriversCrossSection_Denied` DEFAULT ((-1)) `Denied`,
	CONSTRAINT `DF_tDriversCrossSection_Terminated` DEFAULT ((-1)) `Terminated`,
	CONSTRAINT `DF_tDriversCrossSection_NoComplDrivers` DEFAULT ((-1)) `NoComplDrivers`,
	CONSTRAINT `DF_tDriversCrossSection_NoComplItems` DEFAULT ((-1)) `NoComplItems`,
	CONSTRAINT `DF_tDriversCrossSection_NoComplDriversByNSC` DEFAULT ((-1)) `NoComplDriversByNSC`,
	CONSTRAINT `DF_tDriversCrossSection_NoComplItemsByNSC` DEFAULT ((-1)) `NoComplItemsByNSC`
GO

ALTER TABLE `tDriversNoncomplientItemSum` 
	CONSTRAINT `DF_tDriversNoncomplientItemSum_DateCreated` DEFAULT (1 / 1 / 1900) `DateCreated`,
	CONSTRAINT `DF_tDriversNoncomplientItemSum_HBID` DEFAULT ((-1)) `HBID`,
	CONSTRAINT `DF_tDriversNoncomplientItemSum_CompanyID` DEFAULT ((-1)) `CompanyID`,
	CONSTRAINT `DF_tDriversNoncomplientItemSum_CDLExpired` DEFAULT ((-1)) `CDLExpired`,
	CONSTRAINT `DF_tDriversNoncomplientItemSum_RAExpired` DEFAULT ((-1)) `RAExpired`,
	CONSTRAINT `DF_tDriversNoncomplientItemSum_MDExpired` DEFAULT ((-1)) `MDExpired`,
	CONSTRAINT `DF_tDriversNoncomplientItemSum_AnRevExpired` DEFAULT ((-1)) `AnRevExpired`,
	CONSTRAINT `DF_tDriversNoncomplientItemSum_RecViolExpired` DEFAULT ((-1)) `RecViolExpired`,
	CONSTRAINT `DF_tDriversNoncomplientItemSum_MissCreatedNeverScanned` DEFAULT ((-1)) `MissCreatedNeverScanned`,
	CONSTRAINT `DF_tDriversNoncomplientItemSum_MissRequiredFormDocument` DEFAULT ((-1)) `MissRequiredFormDocument`,
	CONSTRAINT `DF_tDriversNoncomplientItemSum_MissingRA` DEFAULT ((-1)) `MissingRA`,
	CONSTRAINT `DF_tDriversNoncomplientItemSum_MissingPrevEmploy` DEFAULT ((-1)) `MissingPrevEmploy`,
	CONSTRAINT `DF_tDriversNoncomplientItemSum_MissingRADIWData` DEFAULT ((-1)) `MissingRADIWData`,
	CONSTRAINT `DF_tDriversNoncomplientItemSum_MissingMDDIWData` DEFAULT ((-1)) `MissingMDDIWData`,
	CONSTRAINT `DF_tDriversNoncomplientItemSum_MissingAddressDIWData` DEFAULT ((-1)) `MissingAddressDIWData`,
	CONSTRAINT `DF_tDriversNoncomplientItemSum_MissingCDLDIWData` DEFAULT ((-1)) `MissingCDLDIWData`,
	CONSTRAINT `DF_tDriversNoncomplientItemSum_MissingPrevEmplLDIWData` DEFAULT ((-1)) `MissingPrevEmplLDIWData`,
	CONSTRAINT `DF_tDriversNoncomplientItemSum_MissingAccDIWData` DEFAULT ((-1)) `MissingAccDIWData`,
	CONSTRAINT `DF_tDriversNoncomplientItemSum_MissingViolDIWData` DEFAULT ((-1)) `MissingViolDIWData`,
	CONSTRAINT `DF_tDriversNoncomplientItemSum_MissingVehDIWData` DEFAULT ((-1)) `MissingVehDIWData`,
	CONSTRAINT `DF_tDriversNoncomplientItemSum_MissRequiredFormDocumentForVeh` DEFAULT ((-1)) `MissRequiredFormDocumentForVeh`,
	CONSTRAINT `DF_tDriversNoncomplientItemSum_VehInsExpired` DEFAULT ((-1)) `VehInsExpired`,
	CONSTRAINT `DF_tDriversNoncomplientItemSum_VehRegExpired` DEFAULT ((-1)) `VehRegExpired`
GO

ALTER TABLE `tFaxRequest` 
	CONSTRAINT `DF_tFaxRequest_DIWEmployerID` DEFAULT ((-1)) `DQFDocID`,
	CONSTRAINT `DF_tFaxRequest_RequestDate` DEFAULT (getdate()) `RequestDate`,
	CONSTRAINT `DF_tFaxRequest_RequestByUserID` DEFAULT ((-1)) `RequestByUserID`,
	CONSTRAINT `DF_tFaxRequest_SubmitByUserID` DEFAULT ((-1)) `SubmitByUserID`,
	CONSTRAINT `DF_tFaxRequest_Status` DEFAULT '' `Status`
GO

ALTER TABLE `tFile` 
	CONSTRAINT `DF_tDriverFile_DriverID` DEFAULT ((-1)) `DriverID`,
	CONSTRAINT `DF_tFile_HomeBaseID` DEFAULT ((-1)) `HomeBaseID`,
	CONSTRAINT `DF_tDriverFile_Created` DEFAULT (getdate()) `Created`,
	CONSTRAINT `DF_tDriverFile_Status` DEFAULT '' `Status`,
	CONSTRAINT `DF_tFile_TerminationDate` DEFAULT (1 / 1 / 1900) `TerminationDate`,
	CONSTRAINT `DF_tFile_NSCCheck` DEFAULT (0) `NSCCheck`,
	CONSTRAINT `DF_tFile_NSCCheckAction` DEFAULT '' `NSCCheckAction`,
	CONSTRAINT `DF_tFile_VendorID` DEFAULT ((-1)) `VendorID`,
	CONSTRAINT `DF_tFile_ActiveStatus` DEFAULT ('Active') `ActiveStatus`,
	CONSTRAINT `DF_tFile_DOTCheck` DEFAULT (0) `DOTCheck`,
	CONSTRAINT `DF_tFile_LocationID` DEFAULT ((-1)) `LocationID`
GO

ALTER TABLE `tHBStaff` 
	CONSTRAINT `DF_tHomeBaseStaff_HomeBaseID` DEFAULT ((-1)) `HomeBaseID`,
	CONSTRAINT `DF_tHomeBaseStaff_FirstName` DEFAULT '' `FirstName`,
	CONSTRAINT `DF_tHomeBaseStaff_LastName` DEFAULT '' `LastName`,
	CONSTRAINT `DF_tHomeBaseStaff_Title` DEFAULT '' `Title`,
	CONSTRAINT `DF_tHomeBaseStaff_Role` DEFAULT '' `Role`,
	CONSTRAINT `DF_tHBStaff_Telephone` DEFAULT '' `Telephone`,
	CONSTRAINT `DF_tHomeBaseStaff_Email` DEFAULT '' `Email`,
	CONSTRAINT `DF_tHomeBaseStaff_Status` DEFAULT '' `Status`,
	CONSTRAINT `DF_tHomeBaseStaff_Created` DEFAULT (getdate()) `Created`,
	CONSTRAINT `DF_tHomeBaseStaff_CreatedByUserID` DEFAULT ((-1)) `CreatedByUserID`,
	CONSTRAINT `DF__tHBStaff__DQF__4F1DA8B1` DEFAULT (1) `DQF`,
	CONSTRAINT `DF__tHBStaff__VIM__5011CCEA` DEFAULT (1) `VIM`,
	CONSTRAINT `DF__tHBStaff__Accide__5105F123` DEFAULT (1) `Accident`
GO

ALTER TABLE `tHomeBase` 
	CONSTRAINT `DF_tHomeBase_CompanyID` DEFAULT ((-1)) `CompanyID`,
	CONSTRAINT `DF_tHomeBase_HomeBaseName` DEFAULT '' `HomeBaseName`,
	CONSTRAINT `DF_tHomeBase_HomeBaseCode` DEFAULT '' `HomeBaseCode`,
	CONSTRAINT `DF_tHomeBase_Address` DEFAULT '' `Address`,
	CONSTRAINT `DF_tHomeBase_City` DEFAULT '' `City`,
	CONSTRAINT `DF_tHomeBase_State` DEFAULT '' `State`,
	CONSTRAINT `DF_tHomeBase_Zip` DEFAULT '' `Zip`,
	CONSTRAINT `DF_tHomeBase_Telephone` DEFAULT '' `Telephone`,
	CONSTRAINT `DF_tHomeBase_Fax` DEFAULT '' `Fax`,
	CONSTRAINT `DF_tHomeBase_Status` DEFAULT '' `Status`,
	CONSTRAINT `DF_tHomeBase_StartDate` DEFAULT (getdate()) `StartDate`,
	CONSTRAINT `DF_tHomeBase_Created` DEFAULT (getdate()) `Created`,
	CONSTRAINT `DF_tHomeBase_Url` DEFAULT ('https://www.driverqualificationonline.com/nschanson') `Url`,
	CONSTRAINT `DF_tHomeBase_DQFModul` DEFAULT ('Yes') `DQFModul`,
	CONSTRAINT `DF_tHomeBase_TruckModul` DEFAULT ('No') `TruckModul`,
	CONSTRAINT `DF_tHomeBase_NewDriverRate` DEFAULT (65.00) `NewDriverRate`,
	CONSTRAINT `DF_tHomeBase_MonthlyDriverRate` DEFAULT (2.50) `MonthlyDriverRate`,
	CONSTRAINT `DF_tHomeBase_NewVehicleRate` DEFAULT (19.95) `NewVehicleRate`,
	CONSTRAINT `DF_tHomeBase_MonthlyVehicleRate` DEFAULT (1.65) `MonthlyVehicleRate`,
	CONSTRAINT `DF_tHomeBase_RenewDriverRate` DEFAULT (0) `RenewDriverRate`,
	CONSTRAINT `DF_tHomeBase_NewTruckRate` DEFAULT (19.95) `NewTruckRate`,
	CONSTRAINT `DF_tHomeBase_RenewTruckRate` DEFAULT (1.65) `MonthlyTruckRate`
GO

ALTER TABLE `tInvoice` 
	CONSTRAINT `DF_tInvoice_InvoiceForHBID` DEFAULT ((-1)) `InvoiceForHBID`,
	CONSTRAINT `DF_tInvoice_FileID` DEFAULT ((-1)) `FileID`,
	CONSTRAINT `DF_tInvoice_InvoiceType` DEFAULT '' `InvoiceType`,
	CONSTRAINT `DF_tInvoice_InvoiceDate` DEFAULT (1 / 1 / 1900) `InvoiceDate`,
	CONSTRAINT `DF_tInvoice_Name` DEFAULT '' `Name`,
	CONSTRAINT `DF_tInvoice_ForYear` DEFAULT '' `ForYear`,
	CONSTRAINT `DF_tInvoice_Created` DEFAULT (getdate()) `Created`,
	CONSTRAINT `DF_tInvoice_ByUserID` DEFAULT ((-1)) `ByUserID`
GO

ALTER TABLE `tInvoiceForHB` 
	CONSTRAINT `DF_tInvoiceForHB_HomeBaseID` DEFAULT ((-1)) `HomeBaseID`,
	CONSTRAINT `DF_tInvoiceForHB_InvoiceType` DEFAULT '' `InvoiceType`,
	CONSTRAINT `DF_tInvoiceForHB_InvoiceDate` DEFAULT (1 / 1 / 1900) `InvoiceDate`,
	CONSTRAINT `DF_tInvoiceForHB_Rate` DEFAULT (65.00) `Rate`
GO

ALTER TABLE `tInvoiceTruck` 
	CONSTRAINT `DF_tInvoiceTruck_InvoiceForHBID` DEFAULT ((-1)) `InvoiceForHBID`,
	CONSTRAINT `DF_tInvoiceTruck_FileID` DEFAULT ((-1)) `TruckFileID`,
	CONSTRAINT `DF_tInvoiceTruck_InvoiceType` DEFAULT '' `InvoiceType`,
	CONSTRAINT `DF_tInvoiceTruck_InvoiceDate` DEFAULT (1 / 1 / 1900) `InvoiceDate`,
	CONSTRAINT `DF_tInvoiceTruck_Name` DEFAULT '' `Name`,
	CONSTRAINT `DF_tInvoiceTruck_ForYear` DEFAULT '' `ForYear`,
	CONSTRAINT `DF_tInvoiceTruck_Created` DEFAULT (getdate()) `Created`,
	CONSTRAINT `DF_tInvoiceTruck_ByUserID` DEFAULT ((-1)) `ByUserID`
GO

ALTER TABLE `tInvoiceTruckForHB` 
	CONSTRAINT `DF_tInvoiceTruckForHB_HomeBaseID` DEFAULT ((-1)) `HomeBaseID`,
	CONSTRAINT `DF_tInvoiceTruckForHB_InvoiceType` DEFAULT '' `InvoiceType`,
	CONSTRAINT `DF_tInvoiceTruckForHB_InvoiceDate` DEFAULT (1 / 1 / 1900) `InvoiceDate`,
	CONSTRAINT `DF_tInvoiceTruckForHB_Rate` DEFAULT (0.00) `Rate`
GO

ALTER TABLE `tMError` 
	CONSTRAINT `DF_tMError_ActionType` DEFAULT (1) `ActionType`
GO

ALTER TABLE `tNSCStaff` 
	CONSTRAINT `DF_tNSCStaff_FirstName` DEFAULT '' `FirstName`,
	CONSTRAINT `DF_tNSCStaff_LastName` DEFAULT '' `LastName`,
	CONSTRAINT `DF_tNSCStaff_Title` DEFAULT '' `Title`,
	CONSTRAINT `DF_tNSCStaff_Telephone` DEFAULT '' `Telephone`,
	CONSTRAINT `DF_tNSCStaff_Email` DEFAULT '' `Email`,
	CONSTRAINT `DF_tNSCStaff_AccessToClients` DEFAULT (0) `Role`,
	CONSTRAINT `DF_tNSCStaff_Status` DEFAULT '' `Status`,
	CONSTRAINT `DF_tNSCStaff_Created` DEFAULT (getdate()) `Created`,
	CONSTRAINT `DF_tNSCStaff_CreatedByUserID` DEFAULT ((-1)) `CreatedByUserID`
GO

ALTER TABLE `tSession` 
	CONSTRAINT `DF_tSession_UserID` DEFAULT ((-1)) `UserID`,
	CONSTRAINT `DF_tSession_CurrentHBID` DEFAULT ((-1)) `CurrentHBID`,
	CONSTRAINT `DF_tSession_LastClickTime` DEFAULT (getdate()) `LastClickTime`,
	CONSTRAINT `DF_tSession_StartTime` DEFAULT (getdate()) `StartTime`,
	CONSTRAINT `DF_tSession_SessionStatus` DEFAULT ((-1)) `SessionStatus`,
	CONSTRAINT `DF_tSession_CurrentCompanyID` DEFAULT ((-1)) `CurrentCompanyID`
GO

ALTER TABLE `tSetup` 
	CONSTRAINT `DF_tSetup_SetupName` DEFAULT '' `SetupName`,
	CONSTRAINT `DF_tSetup_Code` DEFAULT '' `Code`
GO

ALTER TABLE `tTIW` 
	CONSTRAINT `DF_tTIW_TruckFileID` DEFAULT ((-1)) `TruckFileID`,
	CONSTRAINT `DF_tTIW_VendorID` DEFAULT ((-1)) `TruckVendorID`,
	CONSTRAINT `DF_tTIW_EntryDate` DEFAULT (getdate()) `EntryDate`,
	CONSTRAINT `DF_tTIW_ActivationDate` DEFAULT (1 / 1 / 1900) `DateOfHire`,
	CONSTRAINT `DF_tTIW_AppDate` DEFAULT (1 / 1 / 1900) `AppDate`,
	CONSTRAINT `DF_tTIW_AppNumber` DEFAULT '' `AppNumber`,
	CONSTRAINT `DF_tTIW_AppType` DEFAULT '' `VehType`,
	CONSTRAINT `DF_tTIW_UnitNumber` DEFAULT '' `UnitNumber`,
	CONSTRAINT `DF_tTIW_Created` DEFAULT '' `Year`,
	CONSTRAINT `DF_tTIW_Make` DEFAULT '' `Make`,
	CONSTRAINT `DF_tTIW_Model` DEFAULT '' `Model`,
	CONSTRAINT `DF_tTIW_Color` DEFAULT '' `Color`,
	CONSTRAINT `DF_tTIW_UnladenWeight` DEFAULT (0) `UnladenWeight`,
	CONSTRAINT `DF_tTIW_GVW` DEFAULT (0) `GVW`,
	CONSTRAINT `DF_tTIW_NumOfAxles` DEFAULT '' `NumOfAxles`,
	CONSTRAINT `DF_tTIW_LicPlateNumber` DEFAULT '' `LicPlateNum`,
	CONSTRAINT `DF_tTIW_RegState` DEFAULT '' `RegState`,
	CONSTRAINT `DF_tTIW_REgExpDate` DEFAULT (1 / 1 / 1900) `RegExpDate`,
	CONSTRAINT `DF_tTIW_VehicleValue` DEFAULT (0) `VehicleValue`,
	CONSTRAINT `DF_tTIW_LastEvaluationDate` DEFAULT (1 / 1 / 1900) `LastEvaluationDate`,
	CONSTRAINT `DF_tTIW_InsCompany` DEFAULT '' `InsCompany`,
	CONSTRAINT `DF_tTIW_InsPolicyNum` DEFAULT '' `InsPolicyNum`,
	CONSTRAINT `DF_tTIW_InsExpDate` DEFAULT (1 / 1 / 1900) `InsExpDate`,
	CONSTRAINT `DF_tTIW_AppType_1` DEFAULT '' `AppType`,
	CONSTRAINT `DF_tTIW_InsLimits` DEFAULT (0) `InsLimits`,
	CONSTRAINT `DF_tTIW_NSCCheck` DEFAULT ('No') `NSCCheck`,
	CONSTRAINT `DF_tTIW_RFID` DEFAULT '' `RFID`,
	CONSTRAINT `DF__tTIW__ProfitCN__54D68207` DEFAULT '' `ProfitCN`,
	CONSTRAINT `DF__tTIW__ProfitCNLo__55CAA640` DEFAULT '' `ProfitCNLocation`,
	CONSTRAINT `DF__tTIW__OwningComp__56BECA79` DEFAULT '' `OwningCompany`,
	CONSTRAINT `DF__tTIW__IRP__57B2EEB2` DEFAULT '' `IRP`,
	CONSTRAINT `DF__tTIW__IFTASticke__58A712EB` DEFAULT '' `IFTASticker`,
	CONSTRAINT `DF__tTIW__Weight2290__599B3724` DEFAULT '' `Weight2290`,
	CONSTRAINT `DF__tTIW__TitleStatu__5A8F5B5D` DEFAULT ('Corporate') `TitleStatus`,
	CONSTRAINT `DF__tTIW__GVRW__5B837F96` DEFAULT (0) `GVRW`,
	CONSTRAINT `DF__tTIW__HUT__5C77A3CF` DEFAULT ('No') `HUT`,
	CONSTRAINT `DF__tTIW__IFTASticke__5D6BC808` DEFAULT ('1/1/1900') `IFTAStickerExpDate`
GO

ALTER TABLE `tTIWBITInspection` 
	CONSTRAINT `DF_tTIWBITInspection_TIWID` DEFAULT ((-1)) `TIWID`,
	CONSTRAINT `DF_tTIWBITInspection_InspectorName` DEFAULT '' `InspectorName`,
	CONSTRAINT `DF_tTIWBITInspection_InspCompany` DEFAULT '' `InspCompany`,
	CONSTRAINT `DF_tTIWBITInspection_Result` DEFAULT '' `Result`,
	CONSTRAINT `DF_tTIWBITInspection_ShopNote` DEFAULT '' `ShopNote`,
	CONSTRAINT `DF_tTIWBITInspection_BITExpDate` DEFAULT (1 / 1 / 1900) `BITExpDate`,
	CONSTRAINT `DF_tTIWBITInspection_ReinspectionDate` DEFAULT (1 / 1 / 1900) `ReinspectionDate`,
	CONSTRAINT `DF_tTIWBITInspection_Created` DEFAULT (getdate()) `Created`,
	CONSTRAINT `DF_tTIWBITInspection_InspectionDate` DEFAULT (1 / 1 / 1900) `InspectionDate`,
	CONSTRAINT `DF_tTIWBITInspection_InspectorNumber` DEFAULT '' `InspectorNumber`,
	CONSTRAINT `DF_tTIWBITInspection_InspectionFormNumber` DEFAULT '' `InspectionFormNumber`,
	CONSTRAINT `DF_tTIWBITInspection_InspectionType` DEFAULT '' `InspectionType`,
	CONSTRAINT `DF_tTIWBITInspection_DOTExpDate` DEFAULT ('1/1/1900') `DOTExpDate`,
	CONSTRAINT `DF_tTIWBITInspection_InspectorCertification` DEFAULT '' `InspectorCertification`,
	CONSTRAINT `DF_tTIWBITInspection_InspectorID` DEFAULT ((-1)) `InspectorID`,
	CONSTRAINT `DF_tTIWBITInspection_InsCompanyID` DEFAULT ((-1)) `InsCompanyID`
GO

ALTER TABLE `tTIWDISInspection` 
	CONSTRAINT `DF_tTIWDISInspection_TIWID` DEFAULT ((-1)) `TIWID`,
	CONSTRAINT `DF_tTIWDISInspection_InspectorName` DEFAULT '' `InspectorName`,
	CONSTRAINT `DF_tTIWDISInspection_InspCompany` DEFAULT '' `InspCompany`,
	CONSTRAINT `DF_tTIWDISInspection_Result` DEFAULT '' `Result`,
	CONSTRAINT `DF_tTIWDISInspection_ShopNote` DEFAULT '' `ShopNote`,
	CONSTRAINT `DF_tTIWDISInspection_DISExpDate` DEFAULT (1 / 1 / 1900) `DISExpDate`,
	CONSTRAINT `DF_tTIWDISInspection_ReinspectionDate` DEFAULT (1 / 1 / 1900) `ReinspectionDate`,
	CONSTRAINT `DF_tTIWDISInspection_Created` DEFAULT (getdate()) `Created`,
	CONSTRAINT `DF_tTIWDISInspection_InspectionDate` DEFAULT (1 / 1 / 1900) `InspectionDate`,
	CONSTRAINT `DF_tTIWDISInspection_InspectorNumber` DEFAULT '' `InspectorNumber`,
	CONSTRAINT `DF_tTIWDISInspection_InspectionFormNumber` DEFAULT '' `InspectionFormNumber`,
	CONSTRAINT `DF_tTIWDISInspection_InspectionType` DEFAULT '' `InspectionType`,
	CONSTRAINT `DF_tTIWDISInspection_StickerNumber` DEFAULT (1 / 1 / 1900) `StickerNumber`
GO

ALTER TABLE `tTruck` 
	CONSTRAINT `DF_tTruck_VIN` DEFAULT '' `VIN`,
	CONSTRAINT `DF_tTruck_Created` DEFAULT (getdate()) `Created`
GO

ALTER TABLE `tTruckActionSystem` 
	CONSTRAINT `DF_tTruckActionSystem_ActionType` DEFAULT '' `ActionType`,
	CONSTRAINT `DF_tTruckActionSystem_ActionDate` DEFAULT (getdate()) `ActionDate`,
	CONSTRAINT `DF_tTruckActionSystem_ToHomeBaseID` DEFAULT ((-1)) `ToHomeBaseID`,
	CONSTRAINT `DF_tTruckActionSystem_ToUserID` DEFAULT ((-1)) `ToUserID`,
	CONSTRAINT `DF_tTruckActionSystem_Confirmed` DEFAULT (0) `Confirmed`
GO

ALTER TABLE `tTruckActionSystemForFile` 
	CONSTRAINT `DF_tTruckActionSystemForFile_ActionSystemID` DEFAULT ((-1)) `ActionSystemID`,
	CONSTRAINT `DF_tTruckActionSystemForFile_TruckFileID` DEFAULT ((-1)) `TruckFileID`,
	CONSTRAINT `DF_tTruckActionSystemForFile_TIWID` DEFAULT ((-1)) `TIWID`,
	CONSTRAINT `DF_tTruckActionSystemForFile_ExpType` DEFAULT '' `ExpType`,
	CONSTRAINT `DF_tTruckActionSystemForFile_Expires` DEFAULT (1 / 1 / 1900) `Expires`,
	CONSTRAINT `DF_tTruckActionSystemForFile_Created` DEFAULT (getdate()) `Created`,
	CONSTRAINT `DF_tTruckActionSystemForFile_ActionType` DEFAULT '' `ActionType`
GO

ALTER TABLE `tTruckAppCheck` 
	CONSTRAINT `DF_tTruckAppCheck_TIWID` DEFAULT ((-1)) `TIWID`,
	CONSTRAINT `DF_tTruckAppCheck_CheckReview` DEFAULT (0) `CheckReview`,
	CONSTRAINT `DF_tTruckAppCheck_CheckBIT` DEFAULT (0) `CheckBIT`,
	CONSTRAINT `DF_tTruckAppCheck_CheckPicture` DEFAULT (0) `CheckPicture`,
	CONSTRAINT `DF_tTruckAppCheck_CheckReqDoc` DEFAULT (0) `CheckReqDoc`,
	CONSTRAINT `DF_tTruckAppCheck_CheckVehReg` DEFAULT (0) `CheckVehReg`,
	CONSTRAINT `DF_tTruckAppCheck_CheckInsCert` DEFAULT (0) `CheckInsSert`
GO

ALTER TABLE `tTruckDoc` 
	CONSTRAINT `DF_tTruckDoc_DocType` DEFAULT '' `DocType`,
	CONSTRAINT `DF_tTruckDoc_Category` DEFAULT '' `Category`,
	CONSTRAINT `DF_tTruckDoc_DocTitle` DEFAULT '' `DocTitle`,
	CONSTRAINT `DF_tTruckDoc_DocCode` DEFAULT '' `DocCode`,
	CONSTRAINT `DF_tTruckDoc_HasPDF` DEFAULT (0) `HasPDF`,
	CONSTRAINT `DF_tTruckDoc_PDFFile` DEFAULT '' `PDFFile`,
	CONSTRAINT `DF_tTruckDoc_HasScan` DEFAULT (0) `HasScan`,
	CONSTRAINT `DF_tTruckDoc_Muitiple` DEFAULT (0) `Muitiple`,
	CONSTRAINT `DF_tTruckDoc_PageNum` DEFAULT ((-1)) `PageNum`
GO

ALTER TABLE `tTruckDriver` 
	CONSTRAINT `DF_tTruckDriver_DriverID_1` DEFAULT ((-1)) `DriverID`,
	CONSTRAINT `DF_tTruckDriver_DriverID` DEFAULT ((-1)) `TruckID`,
	CONSTRAINT `DF_tTruckDriver_Created` DEFAULT (getdate()) `Created`,
	CONSTRAINT `DF_tTruckDriver_HBID` DEFAULT ((-1)) `HBID`
GO

ALTER TABLE `tTruckFile` 
	CONSTRAINT `DF_tTruckFile_TruckID` DEFAULT ((-1)) `TruckID`,
	CONSTRAINT `DF_tTruckFile_HomeBaseID` DEFAULT ((-1)) `HomeBaseID`,
	CONSTRAINT `DF_tTruckFile_Created` DEFAULT (getdate()) `Created`,
	CONSTRAINT `DF_tTruckFile_Status` DEFAULT '' `Status`,
	CONSTRAINT `DF_tTruckFile_TerrminationDate` DEFAULT (1 / 1 / 1900) `TerminationDate`,
	CONSTRAINT `DF_tTruckFile_VendorID` DEFAULT ((-1)) `VendorID`,
	CONSTRAINT `DF_tTruckFile_DOTCheck` DEFAULT (0) `DOTCheck`
GO

ALTER TABLE `tTruckInspectionCompany` 
	CONSTRAINT `DF_tTruckInspectionCompany_CompanyID` DEFAULT ((-1)) `CompanyID`,
	CONSTRAINT `DF_tTruckInspectionCompany_HBID` DEFAULT ((-1)) `HBID`,
	CONSTRAINT `DF_tTruckInspectionCompany_InsCompanyName` DEFAULT '' `InsCompanyName`,
	CONSTRAINT `DF_tTruckInspectionCompany_InsCommpanyAddress` DEFAULT '' `InsCompanyAddress`,
	CONSTRAINT `DF_tTruckInspectionCompany_InsCompanyCity` DEFAULT '' `InsCompanyCity`,
	CONSTRAINT `DF_tTruckInspectionCompany_InsCompanyState` DEFAULT '' `InsCompanyState`,
	CONSTRAINT `DF_tTruckInspectionCompany_InsCompanyZIP` DEFAULT '' `InsCompanyZIP`,
	CONSTRAINT `DF_tTruckInspectionCompany_InsCompCreated` DEFAULT (1 / 1 / 1900) `InsCompCreated`
GO

ALTER TABLE `tTruckInspector` 
	CONSTRAINT `DF_tTruckInspector_InsCompanyID` DEFAULT ((-1)) `InsCompanyID`,
	CONSTRAINT `DF_tTruckInspector_InspectorFirstName` DEFAULT '' `InspectorFirstName`,
	CONSTRAINT `DF_tTruckInspector_InspectorLastName` DEFAULT '' `InspectorLastName`,
	CONSTRAINT `DF_tTruckInspector_InspectorCreated` DEFAULT (1 / 1 / 1900) `InspectorCreated`,
	CONSTRAINT `DF_tTruckInspector_InspectorCertificate` DEFAULT '' `InspectorCertificate`
GO

ALTER TABLE `tTruckInspectorCertificate` 
	CONSTRAINT `DF_tTruckInspectorCertificate_InspectorID` DEFAULT ((-1)) `InspectorID`,
	CONSTRAINT `DF_tTruckInspectorCertificate_InspectorCertificate` DEFAULT '' `InspectorCertificate`,
	CONSTRAINT `DF_tTruckInspectorCertificate_InspectorCertificateCreated` DEFAULT (1 / 1 / 1900) `InspectorCertificateCreated`
GO

ALTER TABLE `tTruckMaintenance` 
	CONSTRAINT `DF_tTruckMaintenance_TIWID` DEFAULT ((-1)) `TIWID`,
	CONSTRAINT `DF_tTruckMaintenance_RequestedDate` DEFAULT (1 / 1 / 1900) `RequestedDate`,
	CONSTRAINT `DF_tTruckMaintenance_CompletedDate` DEFAULT (1 / 1 / 1900) `CompletedDate`,
	CONSTRAINT `DF_tTruckMaintenance_NextMaintDate` DEFAULT (1 / 1 / 1900) `NextMaintDate`,
	CONSTRAINT `DF_tTruckMaintenance_MaintNumber` DEFAULT '' `MaintNumber`,
	CONSTRAINT `DF_tTruckMaintenance_Amount` DEFAULT (0) `Amount`,
	CONSTRAINT `DF_tTruckMaintenance_MaintCompany` DEFAULT '' `MaintCompany`,
	CONSTRAINT `DF_tTruckMaintenance_MaintMonth` DEFAULT '' `MaintMonth`,
	CONSTRAINT `DF_tTruckMaintenance_Notes` DEFAULT '' `Notes`,
	CONSTRAINT `DF_tTruckMaintenance_Created` DEFAULT (getdate()) `Created`
GO

ALTER TABLE `tTruckQFDoc` 
	CONSTRAINT `DF_tTruckQF_TIWID` DEFAULT ((-1)) `TIWID`,
	CONSTRAINT `DF_tTruckQF_DocID` DEFAULT ((-1)) `DocID`,
	CONSTRAINT `DF_tTruckQF_Status` DEFAULT '' `Status`,
	CONSTRAINT `DF_tTruckQF_Requested` DEFAULT (1 / 1 / 1900) `Requested`,
	CONSTRAINT `DF_tTruckQF_Completed` DEFAULT (1 / 1 / 1900) `Completed`,
	CONSTRAINT `DF_tTruckQF_TIWBITInspID` DEFAULT ((-1)) `TIWBITInspID`,
	CONSTRAINT `DF_tTruckQF_ScanDateTime` DEFAULT '' `ScanDateTime`,
	CONSTRAINT `DF_tTruckQF_Created` DEFAULT (getdate()) `Created`,
	CONSTRAINT `DF_tTruckQF_OtherTitle` DEFAULT '' `OtherTitle`,
	CONSTRAINT `DF_tTruckQFDoc_TIWDISInspID` DEFAULT ((-1)) `TIWDISInspID`
GO

ALTER TABLE `tUser` 
	CONSTRAINT `DF_tUser_UserType` DEFAULT '' `UserType`,
	CONSTRAINT `DF_tHomeBaseUser_HomeBaseStaffID` DEFAULT ((-1)) `StaffID`,
	CONSTRAINT `DF_tUser_CurrentHBID` DEFAULT ((-1)) `HomeBaseID`,
	CONSTRAINT `DF_tUser_CompanyID` DEFAULT ((-1)) `CompanyID`,
	CONSTRAINT `DF_tHomeBaseUser_UserName` DEFAULT '' `Username`,
	CONSTRAINT `DF_tHomeBaseUser_Password` DEFAULT '' `Password`,
	CONSTRAINT `DF_tUser_Agreed` DEFAULT (0) `Agreed`
GO

ALTER TABLE `tVIW` 
	CONSTRAINT `DF_tVIW_VendorFileID` DEFAULT ((-1)) `VendorFileID`,
	CONSTRAINT `DF_tVIW_VendorCode` DEFAULT '' `VendorCode`,
	CONSTRAINT `DF_tVIW_AppType` DEFAULT '' `AppType`,
	CONSTRAINT `DF_tVIW_CompanyName` DEFAULT '' `CompanyName`,
	CONSTRAINT `DF_tVIW_FirstName` DEFAULT '' `FirstName`,
	CONSTRAINT `DF_tVIW_LastName` DEFAULT '' `LastName`,
	CONSTRAINT `DF_tVIW_Address` DEFAULT '' `Address`,
	CONSTRAINT `DF_tVIW_City` DEFAULT '' `City`,
	CONSTRAINT `DF_tVIW_ZIP` DEFAULT '' `ZIP`,
	CONSTRAINT `DF_tVIW_State` DEFAULT '' `State`,
	CONSTRAINT `DF_tVIW_Phone` DEFAULT '' `Phone`,
	CONSTRAINT `DF_tVIW_Fax` DEFAULT '' `Fax`,
	CONSTRAINT `DF_tVIW_Email` DEFAULT '' `Email`,
	CONSTRAINT `DF_tVIW_EntryDate` DEFAULT (1 / 1 / 1900) `EntryDate`,
	CONSTRAINT `DF_tVIW_DateOfHire` DEFAULT (1 / 1 / 1900) `DateOfHire`,
	CONSTRAINT `DF_tVIW_AppDate` DEFAULT (1 / 1 / 1900) `AppDate`,
	CONSTRAINT `DF_tVIW_AppNumber` DEFAULT '' `AppNumber`
GO

ALTER TABLE `tVendor` 
	CONSTRAINT `DF_tVendor_SSN` DEFAULT '' `SSN`,
	CONSTRAINT `DF_tVendor_FederalID` DEFAULT '' `FederalID`,
	CONSTRAINT `DF_tVendor_Created` DEFAULT (getdate()) `Created`
GO

ALTER TABLE `tVendorAppCheck` 
	CONSTRAINT `DF_tVendorAppCheck_VIWID` DEFAULT ((-1)) `VIWID`,
	CONSTRAINT `DF_tVendorAppCheck_CheckReview` DEFAULT (0) `CheckReview`,
	CONSTRAINT `DF_tVendorAppCheck_CheckContract` DEFAULT (0) `CheckContract`
GO

ALTER TABLE `tVendorContract` 
	CONSTRAINT `DF_tVendorContract_VIWID` DEFAULT ((-1)) `VIWID`,
	CONSTRAINT `DF_tVendorContract_ContractNum` DEFAULT '' `ContractNum`,
	CONSTRAINT `DF_tVendorContract_DateOfContractSign` DEFAULT (1 / 1 / 1900) `DateOfContractSign`,
	CONSTRAINT `DF_tVendorContract_ExpDateContract` DEFAULT (1 / 1 / 1900) `ExpDateContract`,
	CONSTRAINT `DF_tVendorContract_ContractSign` DEFAULT '' `ContractSign`,
	CONSTRAINT `DF_tVendorContract_ContractFileName` DEFAULT '' `ContractFileName`,
	CONSTRAINT `DF_tVendorContract_UnitNumber` DEFAULT '' `UnitNumber`,
	CONSTRAINT `DF_tVendorContract_TruckID` DEFAULT ((-1)) `TruckID`
GO

ALTER TABLE `tVendorDoc` 
	CONSTRAINT `DF_tVendorDoc_DocType` DEFAULT '' `DocType`,
	CONSTRAINT `DF_tVendorDoc_Category` DEFAULT '' `Category`,
	CONSTRAINT `DF_tVendorDoc_DocTitle` DEFAULT '' `DocTitle`,
	CONSTRAINT `DF_tVendorDoc_DocCode` DEFAULT '' `DocCode`,
	CONSTRAINT `DF_tVendorDoc_HasPDF` DEFAULT (0) `HasPDF`,
	CONSTRAINT `DF_tVendorDoc_PDFFile` DEFAULT '' `PDFFile`,
	CONSTRAINT `DF_tVendorDoc_HasScan` DEFAULT (0) `HasScan`,
	CONSTRAINT `DF_tVendorDoc_Multiple` DEFAULT (0) `Multiple`,
	CONSTRAINT `DF_tVendorDoc_PageNum` DEFAULT ((-1)) `PageNum`
GO

ALTER TABLE `tVendorDriver` 
	CONSTRAINT `DF_tVendorDriver_VendorID` DEFAULT ((-1)) `VendorID`,
	CONSTRAINT `DF_tVendorDriver_DriverID` DEFAULT ((-1)) `DriverID`,
	CONSTRAINT `DF_tVendorDriver_VendorCode` DEFAULT '' `VendorCode`
GO

ALTER TABLE `tVendorFile` 
	CONSTRAINT `DF_tVendorFile_VendorID` DEFAULT ((-1)) `VendorID`,
	CONSTRAINT `DF_tVendorFile_HomeBaseID` DEFAULT ((-1)) `HomeBaseID`,
	CONSTRAINT `DF_tVendorFile_Created` DEFAULT (getdate()) `Created`,
	CONSTRAINT `DF_tVendorFile_Status` DEFAULT ('Inactive') `Status`,
	CONSTRAINT `DF_tVendorFile_TerminationDate` DEFAULT (1 / 1 / 1900) `TerminationDate`
GO

ALTER TABLE `tVendorQFDoc` 
	CONSTRAINT `DF_tVendorQFDoc_VIWID` DEFAULT ((-1)) `VIWID`,
	CONSTRAINT `DF_tVendorQFDoc_DocID` DEFAULT ((-1)) `DocID`,
	CONSTRAINT `DF_tVendorQFDoc_Status` DEFAULT '' `Status`,
	CONSTRAINT `DF_tVendorQFDoc_Requested` DEFAULT (1 / 1 / 1900) `Requested`,
	CONSTRAINT `DF_tVendorQFDoc_Completed` DEFAULT (1 / 1 / 1900) `Completed`,
	CONSTRAINT `DF_tVendorQFDoc_ContractID` DEFAULT ((-1)) `ContractID`,
	CONSTRAINT `DF_tVendorQFDoc_ScanDateTime` DEFAULT '' `ScanDateTime`,
	CONSTRAINT `DF_tVendorQFDoc_Created` DEFAULT (1 / 1 / 1900) `Created`,
	CONSTRAINT `DF_tVendorQFDoc_OtherTitle` DEFAULT '' `OtherTitle`
GO

 CREATE  UNIQUE  INDEX `tAccLightningData_Index_1` ON `tAccLightningData`(`LightningDataID`) WITH  FILLFACTOR = 90 ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;
GO

 CREATE  INDEX `tActionUser2` ON `tActionUser`(`ActionType`, `OnID`) WITH  FILLFACTOR = 90 ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;
GO

 CREATE  UNIQUE  INDEX `tActionUser3` ON `tActionUser`(`ActionType`, `ActionDate`, `OnID`) WITH  FILLFACTOR = 90 ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;
GO

 CREATE  INDEX `tActionUser9` ON `tActionUser`(`OnID`) WITH  FILLFACTOR = 90 ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;
GO

 CREATE  INDEX `tDIW6` ON `tDIW`(`FileID`, `DIWID`, `FirstName`, `LastName`, `RAExpDate`, `NoRA`) WITH  FILLFACTOR = 90 ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;
GO

 CREATE  INDEX `tDIW7` ON `tDIW`(`FileID`, `DIWID`, `FirstName`, `LastName`, `MedExpDate`) WITH  FILLFACTOR = 90 ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;
GO

 CREATE  INDEX `tDIW8` ON `tDIW`(`FileID`) WITH  FILLFACTOR = 90 ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;
GO

 CREATE  INDEX `tDIW88` ON `tDIW`(`DIWID`, `FileID`) WITH  FILLFACTOR = 90 ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;
GO

 CREATE  INDEX `tDIW888` ON `tDIW`(`DIWID`, `FileID`) WITH  FILLFACTOR = 90 ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;
GO

 CREATE  INDEX `tDIWCDL7` ON `tDIWCDL`(`DIWID`) WITH  FILLFACTOR = 90 ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;
GO

/****** The index created by the following statement is internal use only. ******/
/****** It is not a real index but exists as statistics only. ******/
if (@@microsoftversion > 0x07000000 )
EXEC ('CREATE STATISTICS `hind_1115867042_2A_1A_12A_13A` ON `tDIWCDL` (`DIWID`, `DIWCDLID`, `Expires`, `CDLCurrent`) ')
GO

 CREATE  INDEX `tDIWVehicle13` ON `tDIWVehicle`(`RegExpDate`, `DIWID`) WITH  FILLFACTOR = 90 ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;
GO

 CREATE  INDEX `tDIWVehicle14` ON `tDIWVehicle`(`InsExpDate`, `DIWID`) WITH  FILLFACTOR = 90 ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;
GO

 CREATE  INDEX `tDQFDoc7` ON `tDQFDoc`(`DQFDocID`, `DIWID`) WITH  FILLFACTOR = 90 ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;
GO

 CREATE  INDEX `tFile8` ON `tFile`(`FileID`, `DriverID`, `HomeBaseID`, `Status`) WITH  FILLFACTOR = 90 ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;
GO

/****** The index created by the following statement is internal use only. ******/
/****** It is not a real index but exists as statistics only. ******/
if (@@microsoftversion > 0x07000000 )
EXEC ('CREATE STATISTICS `hind_1314819746_5A_2A` ON `tFile` (`Status`, `DriverID`) ')
GO

/****** The index created by the following statement is internal use only. ******/
/****** It is not a real index but exists as statistics only. ******/
if (@@microsoftversion > 0x07000000 )
EXEC ('CREATE STATISTICS `hind_1314819746_2A_1A` ON `tFile` (`DriverID`, `FileID`) ')
GO

/****** The index created by the following statement is internal use only. ******/
/****** It is not a real index but exists as statistics only. ******/
if (@@microsoftversion > 0x07000000 )
EXEC ('CREATE STATISTICS `hind_1314819746_2A_5A` ON `tFile` (`DriverID`, `Status`) ')
GO

/****** The index created by the following statement is internal use only. ******/
/****** It is not a real index but exists as statistics only. ******/
if (@@microsoftversion > 0x07000000 )
EXEC ('CREATE STATISTICS `hind_1314819746_1A_5A` ON `tFile` (`FileID`, `Status`) ')
GO

/****** The index created by the following statement is internal use only. ******/
/****** It is not a real index but exists as statistics only. ******/
if (@@microsoftversion > 0x07000000 )
EXEC ('CREATE STATISTICS `hind_1314819746_5A_1A` ON `tFile` (`Status`, `FileID`) ')
GO

/****** The index created by the following statement is internal use only. ******/
/****** It is not a real index but exists as statistics only. ******/
if (@@microsoftversion > 0x07000000 )
EXEC ('CREATE STATISTICS `hind_1314819746_1A_2A_3A_5A` ON `tFile` (`FileID`, `DriverID`, `HomeBaseID`, `Status`) ')
GO

 CREATE  UNIQUE  INDEX `IX_tTIW` ON `tTIW`(`TIWID`) WITH  FILLFACTOR = 90 ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;
GO

 CREATE  INDEX `IX_tTIW_1` ON `tTIW`(`TIWID`) WITH  FILLFACTOR = 90 ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;
GO

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

