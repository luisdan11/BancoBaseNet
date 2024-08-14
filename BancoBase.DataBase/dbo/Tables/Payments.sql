CREATE TABLE [dbo].[Payments] (
    [ID]          UNIQUEIDENTIFIER NOT NULL,
    [Concept]     NVARCHAR (255)   NOT NULL,
    [QtyProducts] INT              NOT NULL,
    [From]        NVARCHAR (10)    NOT NULL,
    [To]          NVARCHAR (10)    NOT NULL,
    [Total]       MONEY            NOT NULL,
    [StatusID]    INT              NOT NULL,
    [CreatedOn]   DATETIME         CONSTRAINT [DF_Payments_CreatedOn] DEFAULT (getdate()) NOT NULL,
    [UpdatedOn]   DATETIME         NULL,
    CONSTRAINT [PK_Payments] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_Payments_Accounts] FOREIGN KEY ([From]) REFERENCES [dbo].[Accounts] ([ID]),
    CONSTRAINT [FK_Payments_Accounts1] FOREIGN KEY ([To]) REFERENCES [dbo].[Accounts] ([ID]),
    CONSTRAINT [FK_Payments_Status] FOREIGN KEY ([StatusID]) REFERENCES [Catalog].[Status] ([ID])
);

