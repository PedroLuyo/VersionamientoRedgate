CREATE TABLE [dbo].[UBIGEO]
(
[CODUBI] [char] (6) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[DEPUBI] [varchar] (80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PROVUBI] [varchar] (80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DISTUBI] [varchar] (80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[UBIGEO] ADD CONSTRAINT [CODUBI_PK] PRIMARY KEY CLUSTERED ([CODUBI]) ON [PRIMARY]
GO