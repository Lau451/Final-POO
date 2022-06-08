
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 06/08/2022 16:38:11
-- Generated from EDMX file: C:\Users\lauma\Desktop\FinalPOO\Modelo\Contexto.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [Datos para el final];
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

-- Creating table 'Usuarios'
CREATE TABLE [dbo].[Usuarios] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Nombre] nvarchar(max)  NOT NULL,
    [Email] nvarchar(max)  NOT NULL,
    [Dni] nvarchar(max)  NOT NULL,
    [Contraseña] nvarchar(max)  NOT NULL,
    [PerfilId] int  NOT NULL,
    [Perfil_Id] int  NOT NULL
);
GO

-- Creating table 'Perfiles'
CREATE TABLE [dbo].[Perfiles] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Nombre] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Formularios'
CREATE TABLE [dbo].[Formularios] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Nombre] nvarchar(max)  NOT NULL,
    [NombreSistema] nvarchar(max)  NOT NULL,
    [PerfilId] int  NOT NULL
);
GO

-- Creating table 'Permisos'
CREATE TABLE [dbo].[Permisos] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Nombre] nvarchar(max)  NOT NULL,
    [NombreSistema] nvarchar(max)  NOT NULL,
    [FormularioId] int  NOT NULL,
    [FormularioId1] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'Usuarios'
ALTER TABLE [dbo].[Usuarios]
ADD CONSTRAINT [PK_Usuarios]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Perfiles'
ALTER TABLE [dbo].[Perfiles]
ADD CONSTRAINT [PK_Perfiles]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Formularios'
ALTER TABLE [dbo].[Formularios]
ADD CONSTRAINT [PK_Formularios]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Permisos'
ALTER TABLE [dbo].[Permisos]
ADD CONSTRAINT [PK_Permisos]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [Perfil_Id] in table 'Usuarios'
ALTER TABLE [dbo].[Usuarios]
ADD CONSTRAINT [FK_UsuarioPerfil]
    FOREIGN KEY ([Perfil_Id])
    REFERENCES [dbo].[Perfiles]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UsuarioPerfil'
CREATE INDEX [IX_FK_UsuarioPerfil]
ON [dbo].[Usuarios]
    ([Perfil_Id]);
GO

-- Creating foreign key on [PerfilId] in table 'Formularios'
ALTER TABLE [dbo].[Formularios]
ADD CONSTRAINT [FK_PerfilFormulario]
    FOREIGN KEY ([PerfilId])
    REFERENCES [dbo].[Perfiles]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PerfilFormulario'
CREATE INDEX [IX_FK_PerfilFormulario]
ON [dbo].[Formularios]
    ([PerfilId]);
GO

-- Creating foreign key on [FormularioId1] in table 'Permisos'
ALTER TABLE [dbo].[Permisos]
ADD CONSTRAINT [FK_FormularioPermiso]
    FOREIGN KEY ([FormularioId1])
    REFERENCES [dbo].[Formularios]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_FormularioPermiso'
CREATE INDEX [IX_FK_FormularioPermiso]
ON [dbo].[Permisos]
    ([FormularioId1]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------