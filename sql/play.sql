
/*******************************************************************************
** PLAY DATABASE
** Christian Strauss
** Tristan Rooney
** play.sql
** 3-18-2018

Description:
Creates and populates the PLAY database

********************************************************************************/

/*******************************************************************************
   Drop Tables
********************************************************************************/
DROP TABLE IF EXISTS [Game];

DROP TABLE IF EXISTS [Team];

DROP TABLE IF EXISTS [Player];

DROP TABLE IF EXISTS [Manager];

DROP TABLE IF EXISTS [Play];

DROP TABLE IF EXISTS [PlayFor];

DROP TABLE IF EXISTS [ManagedBy];

/*******************************************************************************
   Create Tables
********************************************************************************/
CREATE TABLE [Game]
(
    [GameId] INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    [HomeScore] INTEGER,
    [AwayScore] INTEGER,
    [GameDate] DATETIME
);

CREATE TABLE [Team]
(
    [TeamId] INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    [Name] NVARCHAR(50)
);

CREATE TABLE [Player]
(
    [PlayerId] INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    [FirstName] NVARCHAR(20)  NOT NULL,
    [LastName] NVARCHAR(20)  NOT NULL,
    [Position] NVARCHAR(80),
    [JerseyNumber] INTEGER,
    [Goals] INTEGER
);

CREATE TABLE [Manager]
(
    [ManagerId] INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    [FirstName] NVARCHAR(20)  NOT NULL,
    [LastName] NVARCHAR(20)  NOT NULL,
    [Salary] NVARCHAR(20) NOT NULL
);

CREATE TABLE [Play]
(
    [PlayId] INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    [GameId] INTEGER  NOT NULL,
    [HomeTeamId] INTEGER  NOT NULL,
    [AwayTeamID] INTEGER NOT NULL,
    FOREIGN KEY ([GameId]) REFERENCES [Game] ([GameId])
		ON DELETE NO ACTION ON UPDATE NO ACTION,
    FOREIGN KEY ([HomeTeamId]) REFERENCES [Team] ([TeamId])
		ON DELETE NO ACTION ON UPDATE NO ACTION,
    FOREIGN KEY ([AwayTeamId]) REFERENCES [Team] ([TeamId])
		ON DELETE NO ACTION ON UPDATE NO ACTION
);

CREATE TABLE [PlayFor]
(
    [PlayForId] INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    [PlayerId] INTEGER  NOT NULL,
    [TeamId] INTEGER  NOT NULL,
    FOREIGN KEY ([PlayerId]) REFERENCES [Player] ([PlayerId])
		ON DELETE NO ACTION ON UPDATE NO ACTION,
    FOREIGN KEY ([TeamId]) REFERENCES [Team] ([TeamId])
		ON DELETE NO ACTION ON UPDATE NO ACTION
);

CREATE TABLE [ManagedBy]
(
    [ManagedById] INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    [ManagerId] INTEGER  NOT NULL,
    [TeamId] INTEGER  NOT NULL,
    FOREIGN KEY ([ManagerId]) REFERENCES [Manager] ([ManagerId])
		ON DELETE NO ACTION ON UPDATE NO ACTION,
    FOREIGN KEY ([TeamId]) REFERENCES [Team] ([TeamId])
		ON DELETE NO ACTION ON UPDATE NO ACTION
);

/*******************************************************************************
   Create Primary Key Unique Indexes
********************************************************************************/

/*******************************************************************************
   Create Foreign Keys
********************************************************************************/

/*******************************************************************************
   Populate Tables
********************************************************************************/

/* TEAMS */
INSERT INTO [Team] ([Name], [TeamId]) VALUES ('Arsenal FC', 1);
INSERT INTO [Team] ([Name], [TeamId]) VALUES ('Leicester City', 2);
INSERT INTO [Team] ([Name], [TeamId]) VALUES ('Watford FC', 3);
INSERT INTO [Team] ([Name], [TeamId]) VALUES ('Liverpool FC', 4);
INSERT INTO [Team] ([Name], [TeamId]) VALUES ('Chelsea FC', 5);
INSERT INTO [Team] ([Name], [TeamId]) VALUES ('Burnley FC', 6);
INSERT INTO [Team] ([Name], [TeamId]) VALUES ('Crystal Palace', 7);
INSERT INTO [Team] ([Name], [TeamId]) VALUES ('Huddersfield Town', 8);
INSERT INTO [Team] ([Name], [TeamId]) VALUES ('Everton FC', 9);
INSERT INTO [Team] ([Name], [TeamId]) VALUES ('Stoke City', 10);
INSERT INTO [Team] ([Name], [TeamId]) VALUES ('Southampton FC', 11);
INSERT INTO [Team] ([Name], [TeamId]) VALUES ('Swansea City', 12);
INSERT INTO [Team] ([Name], [TeamId]) VALUES ('West Bromwich Albion', 13);
INSERT INTO [Team] ([Name], [TeamId]) VALUES ('AFC Bournemouth', 14);
INSERT INTO [Team] ([Name], [TeamId]) VALUES ('Brighton & Hove Albion', 15);
INSERT INTO [Team] ([Name], [TeamId]) VALUES ('Manchester City', 16);
INSERT INTO [Team] ([Name], [TeamId]) VALUES ('Newcastle United', 17);
INSERT INTO [Team] ([Name], [TeamId]) VALUES ('Tottenham Hotspur', 18);
INSERT INTO [Team] ([Name], [TeamId]) VALUES ('Manchester United',19);
INSERT INTO [Team] ([Name], [TeamId]) VALUES ('West Ham United', 20);

/* Managers & ManagedBy */
INSERT INTO [Manager] ([ManagerId], [FirstName], [LastName], [Salary]) VALUES (1, 'Pep', 'Guardiola', '£15 Million');
INSERT INTO [ManagedBy] ([ManagedById], [ManagerId], [TeamId]) VALUES (1, 1, 16);
INSERT INTO [Manager] ([ManagerId], [FirstName], [LastName], [Salary]) VALUES (2, 'Jose', 'Mourinho', '£13.8 Million');
INSERT INTO [ManagedBy] ([ManagedById], [ManagerId], [TeamId]) VALUES (2, 2, 19);
INSERT INTO [Manager] ([ManagerId], [FirstName], [LastName], [Salary]) VALUES (3, 'Arsene', 'Wenger', '£8.5 Million');
INSERT INTO [ManagedBy] ([ManagedById], [ManagerId], [TeamId]) VALUES (3, 3, 1);
INSERT INTO [Manager] ([ManagerId], [FirstName], [LastName], [Salary]) VALUES (4, 'Jurgen', 'Klopp', '£7 Million');
INSERT INTO [ManagedBy] ([ManagedById], [ManagerId], [TeamId]) VALUES (4, 4, 4);
INSERT INTO [Manager] ([ManagerId], [FirstName], [LastName], [Salary]) VALUES (5, 'Antonio', 'Conte', '£6.5 Million');
INSERT INTO [ManagedBy] ([ManagedById], [ManagerId], [TeamId]) VALUES (5, 5, 5);
INSERT INTO [Manager] ([ManagerId], [FirstName], [LastName], [Salary]) VALUES (6, 'Mauricio', 'Pochettino', '£5.5 Million');
INSERT INTO [ManagedBy] ([ManagedById], [ManagerId], [TeamId]) VALUES (6, 6, 18);
INSERT INTO [Manager] ([ManagerId], [FirstName], [LastName], [Salary]) VALUES (7, 'Sam', 'Allardyce', '£3 Million');
INSERT INTO [ManagedBy] ([ManagedById], [ManagerId], [TeamId]) VALUES (7, 7, 9);
INSERT INTO [Manager] ([ManagerId], [FirstName], [LastName], [Salary]) VALUES (8, 'Rafael', 'Benítez', '£4 Million');
INSERT INTO [ManagedBy] ([ManagedById], [ManagerId], [TeamId]) VALUES (8, 8, 17);
INSERT INTO [Manager] ([ManagerId], [FirstName], [LastName], [Salary]) VALUES (9, 'Roy', 'Hodgson', '£3 Million');
INSERT INTO [ManagedBy] ([ManagedById], [ManagerId], [TeamId]) VALUES (9, 9, 7);
INSERT INTO [Manager] ([ManagerId], [FirstName], [LastName], [Salary]) VALUES (10, 'David', 'Moyes', '£2.2 Million');
INSERT INTO [ManagedBy] ([ManagedById], [ManagerId], [TeamId]) VALUES (10, 10, 20);
INSERT INTO [Manager] ([ManagerId], [FirstName], [LastName], [Salary]) VALUES (11, 'Mark', 'Hughes', '£2.2 Million');
INSERT INTO [ManagedBy] ([ManagedById], [ManagerId], [TeamId]) VALUES (11, 11, 10);
INSERT INTO [Manager] ([ManagerId], [FirstName], [LastName], [Salary]) VALUES (12, 'Michael', 'Appleton', '£2 Million');
INSERT INTO [ManagedBy] ([ManagedById], [ManagerId], [TeamId]) VALUES (12, 12, 2);
INSERT INTO [Manager] ([ManagerId], [FirstName], [LastName], [Salary]) VALUES (13, 'Alan', 'Pardew', '£2 Million');
INSERT INTO [ManagedBy] ([ManagedById], [ManagerId], [TeamId]) VALUES (13, 13, 13);
INSERT INTO [Manager] ([ManagerId], [FirstName], [LastName], [Salary]) VALUES (14, 'Mauricio', 'Pellegrino', '£1.85 Million');
INSERT INTO [ManagedBy] ([ManagedById], [ManagerId], [TeamId]) VALUES (14, 14, 11);
INSERT INTO [Manager] ([ManagerId], [FirstName], [LastName], [Salary]) VALUES (15, 'Paul', 'Clement', '£1.5 Million');
INSERT INTO [ManagedBy] ([ManagedById], [ManagerId], [TeamId]) VALUES (15, 15, 12);
INSERT INTO [Manager] ([ManagerId], [FirstName], [LastName], [Salary]) VALUES (16, 'Marco', 'Silva', '£.85 Million');
INSERT INTO [ManagedBy] ([ManagedById], [ManagerId], [TeamId]) VALUES (16, 16, 3);
INSERT INTO [Manager] ([ManagerId], [FirstName], [LastName], [Salary]) VALUES (17, 'David', 'Wagner', '£.75 Million');
INSERT INTO [ManagedBy] ([ManagedById], [ManagerId], [TeamId]) VALUES (17, 17, 8);
INSERT INTO [Manager] ([ManagerId], [FirstName], [LastName], [Salary]) VALUES (18, 'Sean', 'Dyche', '£.6 Million');
INSERT INTO [ManagedBy] ([ManagedById], [ManagerId], [TeamId]) VALUES (18, 18, 6);
INSERT INTO [Manager] ([ManagerId], [FirstName], [LastName], [Salary]) VALUES (19, 'Chris', 'Hughton', '£.525 Million');
INSERT INTO [ManagedBy] ([ManagedById], [ManagerId], [TeamId]) VALUES (19, 19, 15);
INSERT INTO [Manager] ([ManagerId], [FirstName], [LastName], [Salary]) VALUES (20, 'Eddie', 'Howe', '£.5 Million');
INSERT INTO [ManagedBy] ([ManagedById], [ManagerId], [TeamId]) VALUES (20, 20, 14);

/* GAMES & PLAYS */
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (1, 4, 3, '2017-Aug-11 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (1, 1, 1, 2);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (2, 3, 3, '2017-Aug-12 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (2, 2, 3, 4);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (3, 2, 3, '2017-Aug-12 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (3, 3, 5, 6);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (4, 0, 3, '2017-Aug-12 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (4, 4, 7, 8);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (5, 1, 0, '2017-Aug-12 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (5, 5, 9, 10);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (6, 0, 0, '2017-Aug-12 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (6, 6, 11, 12);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (7, 1, 0, '2017-Aug-12 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (7, 7, 13, 14);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (8, 0, 2, '2017-Aug-12 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (8, 8, 15, 16);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (9, 0, 2, '2017-Aug-13 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (9, 9, 17, 18);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (10, 4, 0, '2017-Aug-13 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (10, 10, 19, 20);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (11, 0, 4, '2017-Aug-19 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (11, 11, 12, 19);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (12, 0, 2, '2017-Aug-19 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (12, 12, 14, 3);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (13, 0, 1, '2017-Aug-19 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (13, 13, 6, 13);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (14, 2, 0, '2017-Aug-19 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (14, 14, 2, 15);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (15, 1, 0, '2017-Aug-19 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (15, 15, 4, 7);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (16, 3, 2, '2017-Aug-19 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (16, 16, 11, 20);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (17, 1, 0, '2017-Aug-19 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (17, 17, 10, 1);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (18, 1, 0, '2017-Aug-20 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (18, 18, 8, 17);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (19, 1, 2, '2017-Aug-20 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (19, 19, 18, 5);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (20, 1, 1, '2017-Aug-21 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (20, 20, 16, 9);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (21, 1, 2, '2017-Aug-26 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (21, 21, 14, 16);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (22, 0, 2, '2017-Aug-26 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (22, 22, 7, 12);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (23, 0, 0, '2017-Aug-26 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (23, 23, 8, 11);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (24, 3, 0, '2017-Aug-26 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (24, 24, 17, 20);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (25, 0, 0, '2017-Aug-26 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (25, 25, 3, 15);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (26, 2, 0, '2017-Aug-26 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (26, 26, 19, 2);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (27, 1, 1, '2017-Aug-27 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (27, 27, 13, 10);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (28, 4, 0, '2017-Aug-27 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (28, 28, 4, 1);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (29, 2, 0, '2017-Aug-27 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (29, 29, 5, 9);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (30, 1, 1, '2017-Aug-27 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (30, 30, 18, 6);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (31, 5, 0, '2017-Sep-09 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (31, 31, 16, 4);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (32, 3, 0, '2017-Sep-09 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (32, 32, 1, 14);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (33, 3, 1, '2017-Sep-09 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (33, 33, 15, 13);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (34, 0, 3, '2017-Sep-09 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (34, 34, 9, 18);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (35, 1, 2, '2017-Sep-09 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (35, 35, 2, 5);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (36, 0, 2, '2017-Sep-09 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (36, 36, 11, 3);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (37, 2, 2, '2017-Sep-09 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (37, 37, 10, 19);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (38, 1, 0, '2017-Sep-10 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (38, 38, 6, 7);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (39, 0, 1, '2017-Sep-10 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (39, 39, 12, 17);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (40, 2, 0, '2017-Sep-11 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (40, 40, 20, 8);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (41, 2, 1, '2017-Sep-15 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (41, 41, 14, 15);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (42, 0, 1, '2017-Sep-16 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (42, 42, 7, 11);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (43, 1, 1, '2017-Sep-16 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (43, 43, 8, 2);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (44, 1, 1, '2017-Sep-16 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (44, 44, 4, 6);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (45, 2, 1, '2017-Sep-16 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (45, 45, 17, 10);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (46, 0, 6, '2017-Sep-16 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (46, 46, 3, 16);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (47, 0, 0, '2017-Sep-16 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (47, 47, 13, 20);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (48, 0, 0, '2017-Sep-16 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (48, 48, 18, 12);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (49, 0, 0, '2017-Sep-17 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (49, 49, 5, 1);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (50, 4, 0, '2017-Sep-17 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (50, 50, 19, 9);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (51, 2, 3, '2017-Sep-23 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (51, 51, 20, 18);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (52, 0, 0, '2017-Sep-23 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (52, 52, 6, 8);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (53, 2, 1, '2017-Sep-23 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (53, 53, 9, 14);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (54, 5, 0, '2017-Sep-23 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (54, 54, 16, 7);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (55, 0, 1, '2017-Sep-23 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (55, 55, 11, 19);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (56, 0, 4, '2017-Sep-23 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (56, 56, 10, 5);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (57, 1, 2, '2017-Sep-23 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (57, 57, 12, 3);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (58, 2, 3, '2017-Sep-23 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (58, 58, 2, 4);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (59, 1, 0, '2017-Sep-24 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (59, 59, 15, 17);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (60, 2, 0, '2017-Sep-25 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (60, 60, 1, 13);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (61, 0, 4, '2017-Sep-30 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (61, 61, 8, 18);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (62, 0, 0, '2017-Sep-30 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (62, 62, 14, 2);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (63, 4, 0, '2017-Sep-30 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (63, 63, 19, 7);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (64, 2, 1, '2017-Sep-30 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (64, 64, 10, 11);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (65, 2, 2, '2017-Sep-30 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (65, 65, 13, 3);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (66, 1, 0, '2017-Sep-30 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (66, 66, 20, 12);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (67, 0, 1, '2017-Sep-30 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (67, 67, 5, 16);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (68, 2, 0, '2017-Oct-01 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (68, 68, 1, 15);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (69, 0, 1, '2017-Oct-01 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (69, 69, 9, 6);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (70, 1, 1, '2017-Oct-01 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (70, 70, 17, 4);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (71, 1, 1, '2017-Oct-14 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (71, 71, 6, 20);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (72, 2, 1, '2017-Oct-14 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (72, 72, 7, 5);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (73, 0, 0, '2017-Oct-14 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (73, 73, 4, 19);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (74, 7, 2, '2017-Oct-14 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (74, 74, 16, 10);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (75, 2, 0, '2017-Oct-14 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (75, 75, 12, 8);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (76, 1, 0, '2017-Oct-14 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (76, 76, 18, 14);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (77, 2, 1, '2017-Oct-14 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (77, 77, 3, 1);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (78, 1, 1, '2017-Oct-15 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (78, 78, 15, 9);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (79, 2, 2, '2017-Oct-15 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (79, 79, 11, 17);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (80, 1, 1, '2017-Oct-16 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (80, 80, 2, 13);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (81, 0, 3, '2017-Oct-20 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (81, 81, 20, 15);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (82, 4, 2, '2017-Oct-21 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (82, 82, 5, 3);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (83, 2, 1, '2017-Oct-21 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (83, 83, 8, 19);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (84, 3, 0, '2017-Oct-21 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (84, 84, 16, 6);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (85, 1, 0, '2017-Oct-21 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (85, 85, 17, 7);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (86, 1, 0, '2017-Oct-21 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (86, 86, 11, 13);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (87, 1, 2, '2017-Oct-21 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (87, 87, 10, 14);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (88, 1, 2, '2017-Oct-21 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (88, 88, 12, 2);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (89, 4, 1, '2017-Oct-22 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (89, 89, 18, 4);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (90, 2, 5, '2017-Oct-22 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (90, 90, 9, 1);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (91, 0, 1, '2017-Oct-28 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (91, 91, 14, 5);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (92, 2, 1, '2017-Oct-28 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (92, 92, 1, 12);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (93, 2, 2, '2017-Oct-28 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (93, 93, 7, 20);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (94, 3, 0, '2017-Oct-28 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (94, 94, 4, 8);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (95, 1, 0, '2017-Oct-28 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (95, 95, 19, 18);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (96, 0, 1, '2017-Oct-28 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (96, 96, 3, 10);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (97, 2, 3, '2017-Oct-28 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (97, 97, 13, 16);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (98, 1, 1, '2017-Oct-29 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (98, 98, 15, 11);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (99, 2, 0, '2017-Oct-29 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (99, 99, 2, 9);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (100, 1, 0, '2017-Oct-30 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (100, 100, 6, 17);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (101, 1, 0, '2017-Nov-04 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (101, 101, 8, 13);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (102, 0, 1, '2017-Nov-04 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (102, 102, 17, 14);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (103, 0, 1, '2017-Nov-04 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (103, 103, 11, 6);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (104, 2, 2, '2017-Nov-04 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (104, 104, 10, 2);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (105, 0, 1, '2017-Nov-04 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (105, 105, 12, 15);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (106, 1, 4, '2017-Nov-04 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (106, 106, 20, 4);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (107, 1, 0, '2017-Nov-05 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (107, 107, 5, 19);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (108, 3, 2, '2017-Nov-05 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (108, 108, 9, 3);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (109, 3, 1, '2017-Nov-05 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (109, 109, 16, 1);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (110, 1, 0, '2017-Nov-05 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (110, 110, 18, 7);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (111, 4, 0, '2017-Nov-18 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (111, 111, 14, 8);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (112, 2, 0, '2017-Nov-18 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (112, 112, 1, 18);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (113, 2, 0, '2017-Nov-18 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (113, 113, 6, 12);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (114, 2, 2, '2017-Nov-18 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (114, 114, 7, 9);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (115, 0, 2, '2017-Nov-18 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (115, 115, 2, 16);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (116, 3, 0, '2017-Nov-18 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (116, 116, 4, 11);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (117, 4, 1, '2017-Nov-18 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (117, 117, 19, 17);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (118, 0, 4, '2017-Nov-18 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (118, 118, 13, 5);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (119, 2, 0, '2017-Nov-19 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (119, 119, 3, 20);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (120, 2, 2, '2017-Nov-20 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (120, 120, 15, 10);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (121, 1, 1, '2017-Nov-24 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (121, 121, 20, 2);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (122, 2, 1, '2017-Nov-25 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (122, 122, 7, 10);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (123, 1, 1, '2017-Nov-25 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (123, 123, 4, 5);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (124, 1, 0, '2017-Nov-25 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (124, 124, 19, 15);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (125, 0, 3, '2017-Nov-25 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (125, 125, 17, 3);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (126, 0, 0, '2017-Nov-25 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (126, 126, 12, 14);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (127, 1, 1, '2017-Nov-25 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (127, 127, 18, 13);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (128, 0, 1, '2017-Nov-26 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (128, 128, 6, 1);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (129, 4, 1, '2017-Nov-26 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (129, 129, 11, 9);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (130, 1, 2, '2017-Nov-26 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (130, 130, 8, 16);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (131, 0, 0, '2017-Nov-28 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (131, 131, 15, 7);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (132, 2, 1, '2017-Nov-28 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (132, 132, 2, 18);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (133, 2, 4, '2017-Nov-28 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (133, 133, 3, 19);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (134, 2, 2, '2017-Nov-28 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (134, 134, 13, 17);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (135, 1, 0, '2017-Nov-29 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (135, 135, 5, 12);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (136, 4, 0, '2017-Nov-29 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (136, 136, 9, 20);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (137, 2, 1, '2017-Nov-29 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (137, 137, 16, 11);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (138, 0, 3, '2017-Nov-29 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (138, 138, 10, 4);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (139, 1, 2, '2017-Nov-29 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (139, 139, 14, 6);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (140, 5, 0, '2017-Nov-29 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (140, 140, 1, 8);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (141, 1, 3, '2017-Dec-02 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (141, 141, 1, 19);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (142, 1, 5, '2017-Dec-02 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (142, 142, 15, 4);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (143, 3, 1, '2017-Dec-02 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (143, 143, 5, 17);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (144, 2, 0, '2017-Dec-02 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (144, 144, 9, 8);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (145, 1, 0, '2017-Dec-02 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (145, 145, 2, 6);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (146, 2, 1, '2017-Dec-02 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (146, 146, 10, 12);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (147, 1, 1, '2017-Dec-02 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (147, 147, 3, 18);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (148, 0, 0, '2017-Dec-02 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (148, 148, 13, 7);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (149, 1, 1, '2017-Dec-03 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (149, 149, 14, 11);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (150, 2, 1, '2017-Dec-03 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (150, 150, 16, 20);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (151, 1, 0, '2017-Dec-09 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (151, 151, 6, 3);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (152, 2, 2, '2017-Dec-09 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (152, 152, 7, 14);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (153, 2, 0, '2017-Dec-09 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (153, 153, 8, 15);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (154, 2, 3, '2017-Dec-09 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (154, 154, 17, 2);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (155, 1, 0, '2017-Dec-09 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (155, 155, 12, 13);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (156, 5, 1, '2017-Dec-09 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (156, 156, 18, 10);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (157, 1, 0, '2017-Dec-09 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (157, 157, 20, 5);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (158, 1, 1, '2017-Dec-10 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (158, 158, 4, 9);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (159, 1, 2, '2017-Dec-10 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (159, 159, 19, 16);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (160, 1, 1, '2017-Dec-10 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (160, 160, 11, 1);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (161, 1, 0, '2017-Dec-12 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (161, 161, 6, 10);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (162, 2, 1, '2017-Dec-12 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (162, 162, 7, 3);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (163, 1, 3, '2017-Dec-12 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (163, 163, 8, 5);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (164, 0, 0, '2017-Dec-13 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (164, 164, 4, 13);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (165, 0, 1, '2017-Dec-13 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (165, 165, 17, 9);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (166, 1, 4, '2017-Dec-13 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (166, 166, 11, 2);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (167, 2, 0, '2017-Dec-13 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (167, 167, 18, 15);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (168, 1, 0, '2017-Dec-13 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (168, 168, 19, 14);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (169, 0, 4, '2017-Dec-13 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (169, 169, 12, 16);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (170, 0, 0, '2017-Dec-13 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (170, 170, 20, 1);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (171, 1, 0, '2017-Dec-16 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (171, 171, 1, 17);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (172, 0, 0, '2017-Dec-16 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (172, 172, 15, 6);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (173, 1, 0, '2017-Dec-16 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (173, 173, 5, 11);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (174, 0, 3, '2017-Dec-16 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (174, 174, 2, 7);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (175, 4, 1, '2017-Dec-16 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (175, 175, 16, 18);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (176, 0, 3, '2017-Dec-16 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (176, 176, 10, 20);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (177, 1, 4, '2017-Dec-16 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (177, 177, 3, 8);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (178, 0, 4, '2017-Dec-17 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (178, 178, 14, 4);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (179, 1, 2, '2017-Dec-17 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (179, 179, 13, 19);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (180, 3, 1, '2017-Dec-18 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (180, 180, 9, 12);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (181, 3, 3, '2017-Dec-22 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (181, 181, 1, 4);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (182, 1, 0, '2017-Dec-23 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (182, 182, 15, 3);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (183, 0, 3, '2017-Dec-23 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (183, 183, 6, 18);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (184, 2, 2, '2017-Dec-23 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (184, 184, 2, 19);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (185, 4, 0, '2017-Dec-23 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (185, 185, 16, 14);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (186, 1, 1, '2017-Dec-23 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (186, 186, 11, 8);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (187, 3, 1, '2017-Dec-23 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (187, 187, 10, 13);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (188, 1, 1, '2017-Dec-23 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (188, 188, 12, 7);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (189, 2, 3, '2017-Dec-23 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (189, 189, 20, 17);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (190, 0, 0, '2017-Dec-23 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (190, 190, 9, 5);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (191, 3, 3, '2017-Dec-26 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (191, 191, 14, 20);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (192, 2, 0, '2017-Dec-26 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (192, 192, 5, 15);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (193, 1, 1, '2017-Dec-26 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (193, 193, 8, 10);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (194, 5, 0, '2017-Dec-26 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (194, 194, 4, 12);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (195, 2, 2, '2017-Dec-26 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (195, 195, 19, 6);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (196, 5, 2, '2017-Dec-26 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (196, 196, 18, 11);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (197, 2, 1, '2017-Dec-26 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (197, 197, 3, 2);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (198, 0, 0, '2017-Dec-26 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (198, 198, 13, 9);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (199, 0, 1, '2017-Dec-27 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (199, 199, 17, 16);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (200, 2, 3, '2017-Dec-28 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (200, 200, 7, 1);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (201, 2, 1, '2017-Dec-30 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (201, 201, 14, 9);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (202, 5, 0, '2017-Dec-30 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (202, 202, 5, 10);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (203, 0, 0, '2017-Dec-30 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (203, 203, 8, 6);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (204, 2, 1, '2017-Dec-30 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (204, 204, 4, 2);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (205, 0, 0, '2017-Dec-30 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (205, 205, 19, 11);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (206, 0, 0, '2017-Dec-30 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (206, 206, 17, 15);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (207, 1, 2, '2017-Dec-30 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (207, 207, 3, 12);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (208, 0, 0, '2017-Dec-31 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (208, 208, 7, 16);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (209, 1, 1, '2017-Dec-31 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (209, 209, 13, 1);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (210, 1, 1, '2018-Jan-04 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (210, 210, 18, 20);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (211, 2, 2, '2018-Jan-01 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (211, 211, 15, 14);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (212, 1, 2, '2018-Jan-01 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (212, 212, 6, 4);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (213, 0, 2, '2018-Jan-01 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (213, 213, 9, 19);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (214, 3, 0, '2018-Jan-01 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (214, 214, 2, 8);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (215, 0, 1, '2018-Jan-01 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (215, 215, 10, 17);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (216, 3, 1, '2018-Jan-02 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (216, 216, 16, 3);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (217, 1, 2, '2018-Jan-02 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (217, 217, 11, 7);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (218, 0, 2, '2018-Jan-02 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (218, 218, 12, 18);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (219, 2, 1, '2018-Jan-02 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (219, 219, 20, 13);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (220, 2, 2, '2018-Jan-03 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (220, 220, 1, 5);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (221, 1, 1, '2018-Jan-04 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (221, 221, 18, 20);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (222, 0, 0, '2018-Jan-13 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (222, 222, 5, 2);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (223, 1, 0, '2018-Jan-13 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (223, 223, 7, 6);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (224, 1, 4, '2018-Jan-13 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (224, 224, 8, 20);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (225, 1, 1, '2018-Jan-13 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (225, 225, 17, 12);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (226, 4, 0, '2018-Jan-13 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (226, 226, 18, 9);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (227, 2, 2, '2018-Jan-13 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (227, 227, 3, 11);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (228, 2, 0, '2018-Jan-13 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (228, 228, 13, 15);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (229, 2, 1, '2018-Jan-14 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (229, 229, 14, 1);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (230, 4, 3, '2018-Jan-14 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (230, 230, 4, 16);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (231, 3, 0, '2018-Jan-15 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (231, 231, 19, 10);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (232, 4, 1, '2018-Jan-20 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (232, 232, 1, 7);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (233, 0, 4, '2018-Jan-20 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (233, 233, 15, 5);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (234, 0, 1, '2018-Jan-20 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (234, 234, 6, 19);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (235, 1, 1, '2018-Jan-20 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (235, 235, 9, 13);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (236, 2, 0, '2018-Jan-20 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (236, 236, 2, 3);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (237, 3, 1, '2018-Jan-20 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (237, 237, 16, 17);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (238, 2, 0, '2018-Jan-20 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (238, 238, 10, 8);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (239, 1, 1, '2018-Jan-20 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (239, 239, 20, 14);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (240, 1, 1, '2018-Jan-21 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (240, 240, 11, 18);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (241, 1, 0, '2018-Jan-22 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (241, 241, 12, 4);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (242, 0, 3, '2018-Jan-30 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (242, 242, 8, 4);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (243, 3, 1, '2018-Jan-30 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (243, 243, 12, 1);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (244, 1, 1, '2018-Jan-30 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (244, 244, 20, 7);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (245, 0, 3, '2018-Jan-31 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (245, 245, 5, 14);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (246, 2, 1, '2018-Jan-31 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (246, 246, 9, 2);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (247, 3, 0, '2018-Jan-31 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (247, 247, 16, 13);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (248, 1, 1, '2018-Jan-31 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (248, 248, 17, 6);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (249, 1, 1, '2018-Jan-31 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (249, 249, 11, 15);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (250, 0, 0, '2018-Jan-31 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (250, 250, 10, 3);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (251, 2, 0, '2018-Jan-31 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (251, 251, 18, 19);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (252, 2, 1, '2018-Feb-03 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (252, 252, 14, 10);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (253, 5, 1, '2018-Feb-03 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (253, 253, 1, 9);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (254, 3, 1, '2018-Feb-03 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (254, 254, 15, 20);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (255, 1, 1, '2018-Feb-03 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (255, 255, 6, 16);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (256, 1, 1, '2018-Feb-03 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (256, 256, 2, 12);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (257, 2, 0, '2018-Feb-03 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (257, 257, 19, 8);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (258, 2, 3, '2018-Feb-03 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (258, 258, 13, 11);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (259, 1, 1, '2018-Feb-04 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (259, 259, 7, 17);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (260, 2, 2, '2018-Feb-04 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (260, 260, 4, 18);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (261, 4, 1, '2018-Feb-5) 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (261, 261, 3, 5);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (262, 3, 1, '2018-Feb-10 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (262, 262, 9, 7);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (263, 5, 1, '2018-Feb-10 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (263, 263, 16, 2);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (264, 1, 1, '2018-Feb-10 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (264, 264, 10, 15);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (265, 1, 0, '2018-Feb-10 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (265, 265, 12, 6);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (266, 1, 0, '2018-Feb-10 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (266, 266, 18, 1);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (267, 2, 0, '2018-Feb-10 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (267, 267, 20, 3);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (268, 1, 0, '2018-Feb-11 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (268, 268, 17, 19);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (269, 0, 2, '2018-Feb-11 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (269, 269, 11, 4);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (270, 4, 1, '2018-Feb-11 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (270, 270, 8, 14);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (271, 3, 0, '2018-Feb-12 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (271, 271, 5, 13);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (272, 2, 2, '2018-Feb-24 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (272, 272, 14, 17);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (273, 4, 1, '2018-Feb-24 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (273, 273, 15, 12);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (274, 1, 1, '2018-Feb-24 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (274, 274, 6, 11);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (275, 1, 1, '2018-Feb-24 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (275, 275, 2, 10);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (276, 4, 1, '2018-Feb-24 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (276, 276, 4, 20);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (277, 1, 0, '2018-Feb-24 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (277, 277, 3, 9);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (278, 1, 2, '2018-Feb-24 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (278, 278, 13, 8);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (279, 2, 1, '2018-Feb-25 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (279, 279, 19, 5);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (280, 0, 1, '2018-Feb-25 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (280, 280, 7, 18);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (281, 0, 3, '2018-Mar-01 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (281, 281, 1, 16);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (282, 2, 1, '2018-Mar-03 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (282, 282, 6, 9);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (283, 1, 1, '2018-Mar-03 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (283, 283, 2, 14);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (284, 2, 0, '2018-Mar-03 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (284, 284, 4, 17);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (285, 0, 0, '2018-Mar-03 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (285, 285, 11, 10);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (286, 4, 1, '2018-Mar-03 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (286, 286, 12, 20);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (287, 2, 0, '2018-Mar-03 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (287, 287, 18, 8);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (288, 1, 0, '2018-Mar-03 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (288, 288, 3, 13);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (289, 2, 1, '2018-Mar-04 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (289, 289, 15, 1);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (290, 1, 0, '2018-Mar-04 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (290, 290, 16, 5);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (291, 2, 3, '2018-Mar-05 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (291, 291, 7, 19);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (292, 2, 1, '2018-Mar-10 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (292, 292, 5, 7);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (293, 2, 0, '2018-Mar-10 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (293, 293, 9, 15);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (294, 0, 0, '2018-Mar-10 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (294, 294, 8, 12);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (295, 2, 1, '2018-Mar-10 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (295, 295, 19, 4);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (296, 3, 0, '2018-Mar-10 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (296, 296, 17, 11);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (297, 1, 4, '2018-Mar-10 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (297, 297, 13, 2);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (298, 0, 3, '2018-Mar-10 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (298, 298, 20, 6);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (299, 1, 4, '2018-Mar-11 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (299, 299, 14, 18);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (300, 3, 0, '2018-Mar-11 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (300, 300, 1, 3);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (301, 0, 2, '2018-Mar-12 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (301, 301, 10, 16);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (302, 2, 1, '2018-Mar-17 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (302, 302, 14, 13);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (303, 0, 2, '2018-Mar-17 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (303, 303, 8, 7);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (304, 5, 0, '2018-Mar-17 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (304, 304, 4, 3);
INSERT INTO [Game] ([GameId], [HomeScore], [AwayScore], [GameDate]) VALUES (305, 1, 2, '2018-Mar-17 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (305, 305, 10, 9);
INSERT INTO [Game] ([GameId], [GameDate]) VALUES (306, '2018-Mar-16 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (306, 306, 18, 17);
INSERT INTO [Game] ([GameId], [GameDate]) VALUES (307, '2018-Mar-17 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (307, 307, 6, 5);
INSERT INTO [Game] ([GameId], [GameDate]) VALUES (308, '2018-Mar-17 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (308, 308, 2, 1);
INSERT INTO [Game] ([GameId], [GameDate]) VALUES (309, '2018-Mar-17 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (309, 309, 12, 11);
INSERT INTO [Game] ([GameId], [GameDate]) VALUES (310, '2018-Mar-18 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (310, 310, 20, 19);
INSERT INTO [Game] ([GameId], [GameDate]) VALUES (311, '2018-Mar-18 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (311, 311, 16, 15);
INSERT INTO [Game] ([GameId], [GameDate]) VALUES (312, '2018-Mar-31 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (312, 312, 15, 2);
INSERT INTO [Game] ([GameId], [GameDate]) VALUES (313, '2018-Mar-31 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (313, 313, 7, 4);
INSERT INTO [Game] ([GameId], [GameDate]) VALUES (314, '2018-Mar-31 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (314, 314, 9, 16);
INSERT INTO [Game] ([GameId], [GameDate]) VALUES (315, '2018-Mar-31 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (315, 315, 19, 12);
INSERT INTO [Game] ([GameId], [GameDate]) VALUES (316, '2018-Mar-31 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (316, 316, 17, 8);
INSERT INTO [Game] ([GameId], [GameDate]) VALUES (317, '2018-Mar-31 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (317, 317, 11, 20);
INSERT INTO [Game] ([GameId], [GameDate]) VALUES (318, '2018-Mar-31 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (318, 318, 3, 14);
INSERT INTO [Game] ([GameId], [GameDate]) VALUES (319, '2018-Mar-31 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (319, 319, 13, 6);
INSERT INTO [Game] ([GameId], [GameDate]) VALUES (320, '2017-Apr-01 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (320, 320, 1, 10);
INSERT INTO [Game] ([GameId], [GameDate]) VALUES (321, '2017-Apr-01 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (321, 321, 5, 18);
INSERT INTO [Game] ([GameId], [GameDate]) VALUES (322, '2017-Apr-07 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (322, 322, 14, 7);
INSERT INTO [Game] ([GameId], [GameDate]) VALUES (323, '2017-Apr-07 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (323, 323, 1, 11);
INSERT INTO [Game] ([GameId], [GameDate]) VALUES (324, '2017-Apr-07 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (324, 324, 15, 8);
INSERT INTO [Game] ([GameId], [GameDate]) VALUES (325, '2017-Apr-07 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (325, 325, 5, 20);
INSERT INTO [Game] ([GameId], [GameDate]) VALUES (326, '2017-Apr-07 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (326, 326, 9, 4);
INSERT INTO [Game] ([GameId], [GameDate]) VALUES (327, '2017-Apr-07 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (327, 327, 2, 17);
INSERT INTO [Game] ([GameId], [GameDate]) VALUES (328, '2017-Apr-07 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (328, 328, 16, 19);
INSERT INTO [Game] ([GameId], [GameDate]) VALUES (329, '2017-Apr-07 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (329, 329, 10, 18);
INSERT INTO [Game] ([GameId], [GameDate]) VALUES (330, '2017-Apr-07 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (330, 330, 3, 6);
INSERT INTO [Game] ([GameId], [GameDate]) VALUES (331, '2017-Apr-07 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (331, 331, 13, 12);
INSERT INTO [Game] ([GameId], [GameDate]) VALUES (332, '2017-Apr-14 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (332, 332, 6, 2);
INSERT INTO [Game] ([GameId], [GameDate]) VALUES (333, '2017-Apr-14 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (333, 333, 7, 15);
INSERT INTO [Game] ([GameId], [GameDate]) VALUES (334, '2017-Apr-14 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (334, 334, 8, 3);
INSERT INTO [Game] ([GameId], [GameDate]) VALUES (335, '2017-Apr-14 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (335, 335, 4, 14);
INSERT INTO [Game] ([GameId], [GameDate]) VALUES (336, '2017-Apr-14 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (336, 336, 19, 13);
INSERT INTO [Game] ([GameId], [GameDate]) VALUES (337, '2017-Apr-14 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (337, 337, 17, 1);
INSERT INTO [Game] ([GameId], [GameDate]) VALUES (338, '2017-Apr-14 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (338, 338, 11, 5);
INSERT INTO [Game] ([GameId], [GameDate]) VALUES (339, '2017-Apr-14 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (339, 339, 12, 9);
INSERT INTO [Game] ([GameId], [GameDate]) VALUES (340, '2017-Apr-14 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (340, 340, 18, 16);
INSERT INTO [Game] ([GameId], [GameDate]) VALUES (341, '2017-Apr-14 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (341, 341, 20, 10);
INSERT INTO [Game] ([GameId], [GameDate]) VALUES (342, '2017-Apr-21 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (342, 342, 14, 19);
INSERT INTO [Game] ([GameId], [GameDate]) VALUES (343, '2017-Apr-21 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (343, 343, 1, 20);
INSERT INTO [Game] ([GameId], [GameDate]) VALUES (344, '2017-Apr-21 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (344, 344, 15, 18);
INSERT INTO [Game] ([GameId], [GameDate]) VALUES (345, '2017-Apr-21 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (345, 345, 5, 8);
INSERT INTO [Game] ([GameId], [GameDate]) VALUES (346, '2017-Apr-21 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (346, 346, 9, 17);
INSERT INTO [Game] ([GameId], [GameDate]) VALUES (347, '2017-Apr-21 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (347, 347, 2, 11);
INSERT INTO [Game] ([GameId], [GameDate]) VALUES (348, '2017-Apr-21 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (348, 348, 16, 12);
INSERT INTO [Game] ([GameId], [GameDate]) VALUES (349, '2017-Apr-21 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (349, 349, 10, 6);
INSERT INTO [Game] ([GameId], [GameDate]) VALUES (350, '2017-Apr-21 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (350, 350, 3, 7);
INSERT INTO [Game] ([GameId], [GameDate]) VALUES (351, '2017-Apr-21 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (351, 351, 13, 4);
INSERT INTO [Game] ([GameId], [GameDate]) VALUES (352, '2017-Apr-28 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (352, 352, 6, 15);
INSERT INTO [Game] ([GameId], [GameDate]) VALUES (353, '2017-Apr-28 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (353, 353, 7, 2);
INSERT INTO [Game] ([GameId], [GameDate]) VALUES (354, '2017-Apr-28 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (354, 354, 8, 9);
INSERT INTO [Game] ([GameId], [GameDate]) VALUES (355, '2017-Apr-28 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (355, 355, 4, 10);
INSERT INTO [Game] ([GameId], [GameDate]) VALUES (356, '2017-Apr-28 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (356, 356, 19, 1);
INSERT INTO [Game] ([GameId], [GameDate]) VALUES (357, '2017-Apr-28 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (357, 357, 17, 13);
INSERT INTO [Game] ([GameId], [GameDate]) VALUES (358, '2017-Apr-28 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (358, 358, 11, 14);
INSERT INTO [Game] ([GameId], [GameDate]) VALUES (359, '2017-Apr-28 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (359, 359, 12, 5);
INSERT INTO [Game] ([GameId], [GameDate]) VALUES (360, '2017-Apr-28 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (360, 360, 18, 3);
INSERT INTO [Game] ([GameId], [GameDate]) VALUES (361, '2017-Apr-28 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (361, 361, 20, 16);
INSERT INTO [Game] ([GameId], [GameDate]) VALUES (362, '2017-May-05 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (362, 362, 14, 12);
INSERT INTO [Game] ([GameId], [GameDate]) VALUES (363, '2017-May-05 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (363, 363, 1, 6);
INSERT INTO [Game] ([GameId], [GameDate]) VALUES (364, '2017-May-05 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (364, 364, 15, 19);
INSERT INTO [Game] ([GameId], [GameDate]) VALUES (365, '2017-May-05 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (365, 365, 5, 4);
INSERT INTO [Game] ([GameId], [GameDate]) VALUES (366, '2017-May-05 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (366, 366, 9, 11);
INSERT INTO [Game] ([GameId], [GameDate]) VALUES (367, '2017-May-05 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (367, 367, 2, 20);
INSERT INTO [Game] ([GameId], [GameDate]) VALUES (368, '2017-May-05 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (368, 368, 16, 8);
INSERT INTO [Game] ([GameId], [GameDate]) VALUES (369, '2017-May-05 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (369, 369, 10, 7);
INSERT INTO [Game] ([GameId], [GameDate]) VALUES (370, '2017-May-05 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (370, 370, 3, 17);
INSERT INTO [Game] ([GameId], [GameDate]) VALUES (371, '2017-May-05 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (371, 371, 13, 18);
INSERT INTO [Game] ([GameId], [GameDate]) VALUES (372, '2017-May-13 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (372, 372, 6, 14);
INSERT INTO [Game] ([GameId], [GameDate]) VALUES (373, '2017-May-13 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (373, 373, 7, 13);
INSERT INTO [Game] ([GameId], [GameDate]) VALUES (374, '2017-May-13 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (374, 374, 8, 1);
INSERT INTO [Game] ([GameId], [GameDate]) VALUES (375, '2017-May-13 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (375, 375, 4, 15);
INSERT INTO [Game] ([GameId], [GameDate]) VALUES (376, '2017-May-13 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (376, 376, 19, 3);
INSERT INTO [Game] ([GameId], [GameDate]) VALUES (377, '2017-May-13 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (377, 377, 17, 5);
INSERT INTO [Game] ([GameId], [GameDate]) VALUES (378, '2017-May-13 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (378, 378, 11, 16);
INSERT INTO [Game] ([GameId], [GameDate]) VALUES (379, '2017-May-13 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (379, 379, 12, 10);
INSERT INTO [Game] ([GameId], [GameDate]) VALUES (380, '2017-May-13 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (380, 380, 18, 2);
INSERT INTO [Game] ([GameId], [GameDate]) VALUES (381, '2017-May-13 00:00:00');
INSERT INTO [Play] ([PlayId], [GameId], [HomeTeamId], [AwayTeamId]) VALUES (381, 381, 20, 9);

