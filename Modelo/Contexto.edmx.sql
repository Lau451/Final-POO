
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 06/14/2022 19:21:26
-- Generated from EDMX file: C:\Users\lauma\Desktop\FinalPOO\Modelo\Contexto.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [DBTEST2];
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

-- Creating table 'Formularios'
CREATE TABLE [dbo].[Formularios] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Nombre] nvarchar(max)  NOT NULL,
    [NombreSistema] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Usuarios'
CREATE TABLE [dbo].[Usuarios] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Nombre] nvarchar(max)  NOT NULL,
    [Email] nvarchar(max)  NOT NULL,
    [Dni] nvarchar(max)  NOT NULL,
    [Contraseña] nvarchar(max)  NOT NULL,
    [Perfil_Id] int  NOT NULL
);
GO

-- Creating table 'Perfiles'
CREATE TABLE [dbo].[Perfiles] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Nombre] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Permisos'
CREATE TABLE [dbo].[Permisos] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Nombre] nvarchar(max)  NOT NULL,
    [NombreSistema] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'PermisoFormulario'
CREATE TABLE [dbo].[PermisoFormulario] (
    [Permiso_Id] int  NOT NULL,
    [Formulario_Id] int  NOT NULL
);
GO

-- Creating table 'PerfilFormulario'
CREATE TABLE [dbo].[PerfilFormulario] (
    [Perfil_Id] int  NOT NULL,
    [Formulario_Id] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'Formularios'
ALTER TABLE [dbo].[Formularios]
ADD CONSTRAINT [PK_Formularios]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

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

-- Creating primary key on [Id] in table 'Permisos'
ALTER TABLE [dbo].[Permisos]
ADD CONSTRAINT [PK_Permisos]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Permiso_Id], [Formulario_Id] in table 'PermisoFormulario'
ALTER TABLE [dbo].[PermisoFormulario]
ADD CONSTRAINT [PK_PermisoFormulario]
    PRIMARY KEY CLUSTERED ([Permiso_Id], [Formulario_Id] ASC);
GO

-- Creating primary key on [Perfil_Id], [Formulario_Id] in table 'PerfilFormulario'
ALTER TABLE [dbo].[PerfilFormulario]
ADD CONSTRAINT [PK_PerfilFormulario]
    PRIMARY KEY CLUSTERED ([Perfil_Id], [Formulario_Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [Permiso_Id] in table 'PermisoFormulario'
ALTER TABLE [dbo].[PermisoFormulario]
ADD CONSTRAINT [FK_PermisoFormulario_Permiso]
    FOREIGN KEY ([Permiso_Id])
    REFERENCES [dbo].[Permisos]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Formulario_Id] in table 'PermisoFormulario'
ALTER TABLE [dbo].[PermisoFormulario]
ADD CONSTRAINT [FK_PermisoFormulario_Formulario]
    FOREIGN KEY ([Formulario_Id])
    REFERENCES [dbo].[Formularios]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PermisoFormulario_Formulario'
CREATE INDEX [IX_FK_PermisoFormulario_Formulario]
ON [dbo].[PermisoFormulario]
    ([Formulario_Id]);
GO

-- Creating foreign key on [Perfil_Id] in table 'PerfilFormulario'
ALTER TABLE [dbo].[PerfilFormulario]
ADD CONSTRAINT [FK_PerfilFormulario_Perfil]
    FOREIGN KEY ([Perfil_Id])
    REFERENCES [dbo].[Perfiles]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Formulario_Id] in table 'PerfilFormulario'
ALTER TABLE [dbo].[PerfilFormulario]
ADD CONSTRAINT [FK_PerfilFormulario_Formulario]
    FOREIGN KEY ([Formulario_Id])
    REFERENCES [dbo].[Formularios]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PerfilFormulario_Formulario'
CREATE INDEX [IX_FK_PerfilFormulario_Formulario]
ON [dbo].[PerfilFormulario]
    ([Formulario_Id]);
GO

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

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------