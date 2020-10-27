


-- Terry Lashley
-- RevolutionEHR and the Data Conversion Specialist position
-- Take-home exercise



-- Socially Distanced Workout Tracking

-- activity.csv contains logs of several people's workout schedule over the last several days. As part 
-- of a socially distance exercise program, we would like to reward people based on the exercise they logged.

-- Review data set to ensure it can be imported into postgres
	-- Remove spaces from column names
	-- Ensure date column is in correct format yyy-mm-dd
	-- Turn the given .xlsx file type onto a true .CSV file

-- Create a Database in Postgres to analyze Social Distance Workout Tracking
-- Revolution_db


-- Use Query Tool within the Revolution_db to create a table in order to pull data into postgres

CREATE TABLE exercise_data (
	Last_Name VARCHAR,
	First_Name VARCHAR,
	Email VARCHAR,
	Activity VARCHAR,
	"Duration (minutes)" INT,
	Date Date
);

-- Verify table creation

SELECT *
FROM exercise_data;


-- Use the import/export tool to pull dataset into the exercise_data table. Next Verify data has populated the table
SELECT *
FROM exercise_data;



-- Identify the following data

	--What is the largest single exercise interval ever logged?  
	--The Longest Interval was 100 Minutes by Perez
	
	SELECT last_name, MAX("Duration (minutes)") AS "Longeset Interval"
	FROM exercise_data
	GROUP BY last_name
	ORDER BY 2 DESC
	LIMIT 5;
	

	--What is David Douberley's longest run this week? (October 17 2020 - October 23 2020). 
	--Mr. Douberley's longest run the date range provided was 59 minutes
	
	SELECT last_name, MAX("Duration (minutes)")
	FROM exercise_data
	WHERE activity = 'Run'
	AND last_name = 'Douberley' AND first_name = 'David'
	AND date BETWEEN '2020-10-17' AND '2020-10-23'
	GROUP BY last_name;	
	
	
	--What is David Douberley's total exercise logged this week, in each category (Swim, Bike, and Run)?  
	--Mr. Douberley's total exercise for the date range provided is as follows Swim 458, Run 504, Bike 210
	
	SELECT activity, SUM("Duration (minutes)")
	FROM exercise_data
	WHERE first_name = 'David' AND last_name = 'Douberley'
	AND date BETWEEN '2020-10-17' AND '2020-10-23'
	GROUP BY activity;	
	
	
	--Who are the top three athletes this week? That is, the participants who have logged the highest total duration of all three exercises.
	--The top three athletes across all three exercise categories within the given date range are Perez, Kim (2103), Douberley, Tareq (1560), and Van Damme, Krista (1349)
	
	SELECT last_name, first_name, SUM("Duration (minutes)")
	FROM exercise_data
	WHERE date BETWEEN '2020-10-17' AND '2020-10-23'
	GROUP BY last_name, first_name
	ORDER BY 3 DESC
	LIMIT 3;














