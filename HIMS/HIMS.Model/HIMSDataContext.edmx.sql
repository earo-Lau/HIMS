
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 04/19/2015 16:24:39
-- Generated from EDMX file: G:\Git\HIMS\HIMS\HIMS.Model\HIMSDataContext.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [G:\GIT\HIMS\HIMS\HIMS.MODEL\DATA\HIMS.DATA.MDF];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------


-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------


-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'OM_OrdersSet'
CREATE TABLE [dbo].[OM_OrdersSet] (
    [OrderId] bigint IDENTITY(1,1) NOT NULL,
    [SID] int  NOT NULL,
    [AccountId] bigint  NOT NULL,
    [DateFrom] datetime  NOT NULL,
    [DateTo] datetime  NOT NULL,
    [CreateTime] datetime  NOT NULL,
    [AM_Accounts_AccountId] bigint  NOT NULL
);
GO

-- Creating table 'OM_StateSet'
CREATE TABLE [dbo].[OM_StateSet] (
    [SID] int IDENTITY(1,1) NOT NULL
);
GO

-- Creating table 'AM_AccountsSet'
CREATE TABLE [dbo].[AM_AccountsSet] (
    [AccountId] bigint IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [Gender] nvarchar(max)  NOT NULL,
    [Mobile] nvarchar(max)  NOT NULL,
    [Password] nvarchar(max)  NOT NULL,
    [IsDeleted] bit  NOT NULL,
    [JoinTime] datetime  NOT NULL,
    [UpdateTime] datetime  NOT NULL,
    [RoleId] nvarchar(max)  NOT NULL,
    [AM_Role_RoleId] bigint  NOT NULL
);
GO

-- Creating table 'AM_RoleSet'
CREATE TABLE [dbo].[AM_RoleSet] (
    [RoleId] bigint IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'RM_RoomsSet'
CREATE TABLE [dbo].[RM_RoomsSet] (
    [RoomId] bigint IDENTITY(1,1) NOT NULL,
    [Num] nvarchar(max)  NOT NULL,
    [Type] nvarchar(max)  NOT NULL,
    [Remark] nvarchar(max)  NOT NULL,
    [UpdateTime] nvarchar(max)  NOT NULL,
    [Operator] nvarchar(max)  NOT NULL,
    [SID] nvarchar(max)  NOT NULL,
    [RM_State_SID] bigint  NOT NULL
);
GO

-- Creating table 'RM_StateSet'
CREATE TABLE [dbo].[RM_StateSet] (
    [SID] bigint IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [Value] int  NOT NULL
);
GO

-- Creating table 'RS_Order_RoomsSet'
CREATE TABLE [dbo].[RS_Order_RoomsSet] (
    [RS_ID] bigint IDENTITY(1,1) NOT NULL,
    [OrderId] bigint  NOT NULL,
    [RoomId] bigint  NOT NULL,
    [OM_Orders_OrderId] bigint  NOT NULL,
    [RM_Rooms_RoomId] bigint  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [OrderId] in table 'OM_OrdersSet'
ALTER TABLE [dbo].[OM_OrdersSet]
ADD CONSTRAINT [PK_OM_OrdersSet]
    PRIMARY KEY CLUSTERED ([OrderId] ASC);
GO

-- Creating primary key on [SID] in table 'OM_StateSet'
ALTER TABLE [dbo].[OM_StateSet]
ADD CONSTRAINT [PK_OM_StateSet]
    PRIMARY KEY CLUSTERED ([SID] ASC);
GO

-- Creating primary key on [AccountId] in table 'AM_AccountsSet'
ALTER TABLE [dbo].[AM_AccountsSet]
ADD CONSTRAINT [PK_AM_AccountsSet]
    PRIMARY KEY CLUSTERED ([AccountId] ASC);
GO

-- Creating primary key on [RoleId] in table 'AM_RoleSet'
ALTER TABLE [dbo].[AM_RoleSet]
ADD CONSTRAINT [PK_AM_RoleSet]
    PRIMARY KEY CLUSTERED ([RoleId] ASC);
GO

-- Creating primary key on [RoomId] in table 'RM_RoomsSet'
ALTER TABLE [dbo].[RM_RoomsSet]
ADD CONSTRAINT [PK_RM_RoomsSet]
    PRIMARY KEY CLUSTERED ([RoomId] ASC);
GO

-- Creating primary key on [SID] in table 'RM_StateSet'
ALTER TABLE [dbo].[RM_StateSet]
ADD CONSTRAINT [PK_RM_StateSet]
    PRIMARY KEY CLUSTERED ([SID] ASC);
GO

-- Creating primary key on [RS_ID] in table 'RS_Order_RoomsSet'
ALTER TABLE [dbo].[RS_Order_RoomsSet]
ADD CONSTRAINT [PK_RS_Order_RoomsSet]
    PRIMARY KEY CLUSTERED ([RS_ID] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [SID] in table 'OM_OrdersSet'
ALTER TABLE [dbo].[OM_OrdersSet]
ADD CONSTRAINT [FK_OM_OrdersOM_State]
    FOREIGN KEY ([SID])
    REFERENCES [dbo].[OM_StateSet]
        ([SID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_OM_OrdersOM_State'
CREATE INDEX [IX_FK_OM_OrdersOM_State]
ON [dbo].[OM_OrdersSet]
    ([SID]);
GO

-- Creating foreign key on [AM_Role_RoleId] in table 'AM_AccountsSet'
ALTER TABLE [dbo].[AM_AccountsSet]
ADD CONSTRAINT [FK_AM_RoleAM_Accounts]
    FOREIGN KEY ([AM_Role_RoleId])
    REFERENCES [dbo].[AM_RoleSet]
        ([RoleId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_AM_RoleAM_Accounts'
CREATE INDEX [IX_FK_AM_RoleAM_Accounts]
ON [dbo].[AM_AccountsSet]
    ([AM_Role_RoleId]);
GO

-- Creating foreign key on [AM_Accounts_AccountId] in table 'OM_OrdersSet'
ALTER TABLE [dbo].[OM_OrdersSet]
ADD CONSTRAINT [FK_AM_AccountsOM_Orders]
    FOREIGN KEY ([AM_Accounts_AccountId])
    REFERENCES [dbo].[AM_AccountsSet]
        ([AccountId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_AM_AccountsOM_Orders'
CREATE INDEX [IX_FK_AM_AccountsOM_Orders]
ON [dbo].[OM_OrdersSet]
    ([AM_Accounts_AccountId]);
GO

-- Creating foreign key on [RM_State_SID] in table 'RM_RoomsSet'
ALTER TABLE [dbo].[RM_RoomsSet]
ADD CONSTRAINT [FK_RM_StateRM_Rooms]
    FOREIGN KEY ([RM_State_SID])
    REFERENCES [dbo].[RM_StateSet]
        ([SID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_RM_StateRM_Rooms'
CREATE INDEX [IX_FK_RM_StateRM_Rooms]
ON [dbo].[RM_RoomsSet]
    ([RM_State_SID]);
GO

-- Creating foreign key on [OM_Orders_OrderId] in table 'RS_Order_RoomsSet'
ALTER TABLE [dbo].[RS_Order_RoomsSet]
ADD CONSTRAINT [FK_OM_OrdersRS_Order_Rooms]
    FOREIGN KEY ([OM_Orders_OrderId])
    REFERENCES [dbo].[OM_OrdersSet]
        ([OrderId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_OM_OrdersRS_Order_Rooms'
CREATE INDEX [IX_FK_OM_OrdersRS_Order_Rooms]
ON [dbo].[RS_Order_RoomsSet]
    ([OM_Orders_OrderId]);
GO

-- Creating foreign key on [RM_Rooms_RoomId] in table 'RS_Order_RoomsSet'
ALTER TABLE [dbo].[RS_Order_RoomsSet]
ADD CONSTRAINT [FK_RM_RoomsRS_Order_Rooms]
    FOREIGN KEY ([RM_Rooms_RoomId])
    REFERENCES [dbo].[RM_RoomsSet]
        ([RoomId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_RM_RoomsRS_Order_Rooms'
CREATE INDEX [IX_FK_RM_RoomsRS_Order_Rooms]
ON [dbo].[RS_Order_RoomsSet]
    ([RM_Rooms_RoomId]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------