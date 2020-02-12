-- https://www.hackerrank.com/challenges/revising-the-select-query/problem
-- Query all columns for all American cities in CITY with populations larger than 100000.
-- The CountryCode for America is USA.
SELECT * FROM city 
WHERE population > 100000
AND CountryCode = 'USA';

-- https://www.hackerrank.com/challenges/revising-the-select-query-2/problem
-- Query the names of all American cities in CITY with populations larger than 120000.
-- The CountryCode for America is USA.
SELECT name FROM city
WHERE population > 120000
AND CountryCode = 'USA';

-- https://www.hackerrank.com/challenges/select-all-sql/problem
-- Query all columns (attributes) for every row in the CITY table.
SELECT * FROM city;

-- https://www.hackerrank.com/challenges/select-by-id/problem
-- Query all columns for a city in CITY with the ID 1661.
SELECT * FROM city
WHERE ID = '1661';

-- https://www.hackerrank.com/challenges/japanese-cities-name/problem
-- Query the names of all the Japanese cities in the CITY table. 
-- The COUNTRYCODE for Japan is JPN.
SELECT * FROM city
WHERE CountryCode = 'JPN';

-- https://www.hackerrank.com/challenges/weather-observation-station-1/problem
-- Query a list of CITY and STATE from the STATION table.
SELECT CITY, STATE FROM STATION;

-- https://www.hackerrank.com/challenges/weather-observation-station-3/problem
-- Query a list of CITY names from STATION with even ID numbers only.
-- You may print the results in any order, but must exclude duplicates from your answer.
SELECT DISTINCT CITY FROM STATION
WHERE ID % 2 = 0

-- https://www.hackerrank.com/challenges/weather-observation-station-4/problem
-- Let N be the number of CITY entries in STATION, and let N' be the number of distinct
-- CITY names in STATION; query the value of N-N' from STATION. In other words, find the
-- difference between the total number of CITY entries in the table and the number of
-- distinct CITY entries in the table.
SELECT 
    (SELECT COUNT(*) FROM STATION) - (SELECT COUNT(DISTINCT CITY) FROM STATION)

-- https://www.hackerrank.com/challenges/weather-observation-station-5/problem
-- Query the two cities in STATION with the shortest and longest CITY names, as well as
-- their respective lengths (i.e.: number of characters in the name). If there is more
-- than one smallest or largest city, choose the one that comes first when ordered
--  alphabetically.
SELECT CITY, LENGTH(CITY) FROM STATION
ORDER BY LENGTH(CITY), CITY
LIMIT 1;

SELECT CITY, LENGTH(CITY) FROM STATION
ORDER BY LENGTH(CITY) DESC, CITY
LIMIT 1;
