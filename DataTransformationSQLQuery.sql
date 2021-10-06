SELECT
		[ID]
		,[Name] AS 'Competitor Name'  --Renaming Column
		,CASE WHEN SEX = 'M' THEN 'Male' ELSE 'Female' END AS Sex --Better name for filter and visualizations
		,[Age]
		,CASE	WHEN [Age] < 18 THEN 'Under 18'
				WHEN [Age] BETWEEN 18 AND 25 THEN '18-25'
				WHEN [Age] BETWEEN 25 AND 30 THEN '25-30'
				WHEN [Age] < 30 THEN 'Over 30'
		END AS [Age Grouping]
		,[Height]
		,[Weight]
		,[NOC] AS 'Nation Code' -- Explained Abbreviation for better understanding
--		,CHARINDEX(' ', Games)-1 AS 'Example 1' -- -1 removes the space from the character count
--		,CHARINDEX(' ', REVERSE(Games))-1 AS 'Example 2'
--		,LEFT(Games, CHARINDEX(' ', Games)-1) AS 'Year' --Split column to isolate Year, based on space
--		,RIGHT(Games, CHARINDEX(' ', REVERSE(Games))-1) AS 'Season' --Split column to isolate Season, based on space
		,REVERSE(PARSENAME(REPLACE(REVERSE(Games), ' ','.'), 1)) AS [Year] --Split column to isolate Year, based on space
		,REVERSE(PARSENAME(REPLACE(REVERSE(Games), ' ','.'), 2)) AS [Season] --Split column to isolate Season, based on space
--		,[Games]
		,[City] -- Commented out as it is not necessary for the analysis
		,[Sport]
		,[Event]
		,CASE WHEN Medal = 'NA' THEN 'Not Registered' ELSE Medal END AS Medal --Replace NA with Not Registered
	FROM [olympic_games].[dbo].[athletes_event_results]
	WHERE REVERSE(PARSENAME(REPLACE(REVERSE(Games), ' ','.'), 2)) = 'Summer' --Filter to isolate Summer Season for this analysis