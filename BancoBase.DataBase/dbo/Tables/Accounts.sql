CREATE TABLE [dbo].[Accounts] (
    [ID]        NVARCHAR (10)  NOT NULL,
    [FullName]  NVARCHAR (100) NOT NULL,
    [Balance]   MONEY          NOT NULL,
    [CreatedOn] DATETIME       CONSTRAINT [DF_Accounts_CreatedOn] DEFAULT (getdate()) NOT NULL,
    [UpdatedOn] DATETIME       NULL,
    CONSTRAINT [PK_Accounts] PRIMARY KEY CLUSTERED ([ID] ASC)
);

