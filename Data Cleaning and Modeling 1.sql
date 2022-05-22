--Data Cleaning
--Checking for null values in content table

Select
      COUNT(*)
FROM
     [Content]
WHERE 
     [Content_ID] is null
OR
     [User_ID] is null
OR
     [ContentType] is null
OR
     [Category] is null
OR   
     [URL] is null
-- 199 null values in the URL column, the URL column will not be used as part of the analysis so this null values can be ignored.
;

-- Checking for duplicates in content table
Select
     [Content_ID],
	 [User_ID],
	 [ContentType],
	 [Category], 
	 COUNT(*) As Count
FROM
     [Content]
Group By
     [Content_ID],
	 [User_ID],
	 [ContentType],
	 [Category]
HAVING 
     Count(*)>1 --No duplicates were found in the content dataset


--Checking for null values in Location dataset
SELECT
    *
FROM
    [Location]
WHERE
    [Address] is null
OR
    [User_ID] is null -- No null value in the dataset

-- Checking for duplicates the Location dataset
SELECT
    [User_ID],
    [Address], 
    Count(*) AS Count
FROM
    [Location]
GROUP BY
    [User_ID],
	[Address]
HAVING 
    Count(*)>1

-- Checking for null values in Profile table
SELECT
	*
FROM
    [Profile]
WHERE
    [Interests] is null
OR 
    [AGE] is null
OR 
    [User_ID] is null -- no null values in the dataset

-- Checking for duplicate values in the Profile dataset
SELECT
    [Interests],
	[Age],
	[User_ID],
	COUNT (*) AS Count
FROM
    [Profile]
GROUP BY
    [Interests],
	[Age],
	[USER_ID]
HAVING 
    Count(*)>1 -- No duplicates values were found

-- Checking for null values in Reactions table
SELECT
    *
FROM
    [Reactions]
WHERE
    [Content_ID] is null
OR
    [User_ID] is null
OR
    [ReactionType] is null
OR
    [Datetime] is null -- 980 null values each were found in User_ID column, ReactionType Column, User_ID

-- Deleting null values in Reactions dataset
DELETE FROM 
    [Reactions]
WHERE
   [ReactionType] is null
OR
   [Datetime] is null
OR
    [User_ID] is null
-- Verifying whether null values have been deleted from Reactions table
SELECT
    *
FROM
    [Reactions]
WHERE
    [Content_ID] is null
OR
    [ReactionType] is null
OR
    [Datetime] is null -- No null values were found
OR
    [User_ID] is null

-- Checking for duplicates in Reactions table
SELECT
    [Content_ID],
	[ReactionType],
	[User_ID],
	[Datetime],
	Count(*) as Count
FROM
    [Reactions]

GROUP BY
    [Content_ID],
	[User_ID],
	[ReactionType],
	[Datetime]
Having
    Count(*)>1 -- no duplicate values

--Checking for null values in ReactionTypes dataset
Select
    *
FROM
    [Session]
WHERE
    [User_ID] is null
OR
	[Device] is null
OR
	[Duration] is null -- no null values in the dataset

-- Checking for duplicate values in the Session dataset
SELECT
    [User_ID],
	[Device],
	[Duration],
	Count(*) as Count
FROM
    [Session]
GROUP BY
    [User_ID],
	[Device],
	[Duration]
HAVING
    Count(*)>1 -- No duplicated values in the Session dataset

-- Checking for null values in the users dataset
SELECT
    *
FROM
    [User]
WHERE
    [User_ID] is null
OR
	[Name] is null
OR
	[Email] is null -- no null values in the dataset

-- Checking for duplicated values in users dataset
SELECT
    [User_ID],
	[Name],
	[Email],
	Count(*) AS  Count
FROM
    [User]
GROUP BY
    [User_ID],
	[Name],
	[Email]
HAVING 
    Count(*)>1 -- No duplicate values were found
