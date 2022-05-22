-- Pulling the required data for analysis using joins
SELECT
   [Name],
   [Device],
   [Duration],
   [Datetime],
   [Interests],
   [Age], 
   [Address],
   [ContentType],
   [ReactionType],
   [Category],
   [Sentiment],
   [Score]
FROM
   [dbo].[User]
INNER JOIN
   [dbo].[Location]
ON
[User].[User_ID]=[Location].[User_ID]
INNER JOIN
  [dbo].[Profile]
ON
[Location].[User_ID]=[Profile].[User_ID]
INNER JOIN
[dbo].[Session]
ON
[Profile].[User_ID]=[Session].[User_ID]
INNER JOIN
  [dbo].[Content]
ON
[Session].[User_ID]=[Content].[User_ID]
INNER JOIN
  [dbo].[Reactions]
ON
[Content].[Content_ID]=[Reactions].[Content_ID]
INNER JOIN
[dbo].[ReactionTypes]
ON
[Reactions].[ReactionType]=[ReactionTypes].[Type]
-- Saved results in a new CSV file to create in new table called Join

-- Final data modeling 


SELECT
   [Name],
   [Age],
   [Device],
   [Duration],
   YEAR([Datetime]) AS Year, -- Selecting year from date
   DATENAME(Month,[Datetime]) AS Month, -- Selecting month from date
   DATENAME(Weekday,[Datetime]) AS Weekday, -- Selecting weekday from date
   [Interests],
   SUBSTRING(RIGHT([Address], 8),1, 2) AS State, -- Selecting State Abbreviations from Address
   [ContentType],
   [ReactionType],
   [Category],
   [Sentiment],
   [Score]
   INTO [dbo].[Joined]
FROM
   [Join]
;

SELECT
   [Name],
   [Age],
   [Device],
   [Year],
   [Month],
   [Weekday],
   [Interests],
   [State].[State],
   [ContentType],
   [ReactionType],
   [Category],
   [Sentiment],
   [Score]
FROM
   [State]
RIGHT JOIN
   [Joined]
ON
[State].[Code]=[Joined].[State]



 