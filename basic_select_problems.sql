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
WHERE ID % 2 = 0;

-- https://www.hackerrank.com/challenges/weather-observation-station-4/problem

-- Let N be the number of CITY entries in STATION, and let N' be the number of distinct
-- CITY names in STATION; query the value of N-N' from STATION. In other words, find the
-- difference between the total number of CITY entries in the table and the number of
-- distinct CITY entries in the table.
SELECT 
    (SELECT COUNT(*) FROM STATION) - (SELECT COUNT(DISTINCT CITY) FROM STATION);

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

-- https://www.hackerrank.com/challenges/weather-observation-station-6/problem

-- Query the list of CITY names starting with vowels (i.e., a, e, i, o, or u) from STATION.
-- Your result cannot contain duplicates.
SELECT DISTINCT city
FROM station
WHERE LEFT(city, 1) IN ("a", "e", "i", "o", "u");

-- https://www.hackerrank.com/challenges/weather-observation-station-7/problem

-- Query the list of CITY names ending with vowels (a, e, i, o, u) from STATION. 
-- Your result cannot contain duplicates.
SELECT DISTINCT city
FROM station
WHERE RIGHT(city, 1) IN ('a', 'e', 'i', 'o', 'u');

-- https://www.hackerrank.com/challenges/weather-observation-station-8/problem

-- Query the list of CITY names from STATION which have vowels (i.e., a, e, i, o, and u) as
-- both their first and last characters. Your result cannot contain duplicates.
SELECT DISTINCT city
FROM station
WHERE LEFT(city, 1) IN ("a", "e", "i", "o", "u")
AND RIGHT(city, 1) IN ('a', 'e', 'i', 'o', 'u');

-- https://www.hackerrank.com/challenges/weather-observation-station-9/problem

-- Query the list of CITY names from STATION that do not start with vowels. Your result
-- cannot contain duplicates.
SELECT DISTINCT city
FROM station
WHERE LEFT(city, 1) NOT IN ("a", "e", "i", "o", "u");

-- https://www.hackerrank.com/challenges/weather-observation-station-10/problem

-- Query the list of CITY names from STATION that do not end with vowels. Your result
-- cannot contain duplicates.
SELECT DISTINCT city
FROM station
WHERE RIGHT(city, 1) NOT IN ('a', 'e', 'i', 'o', 'u');

-- https://www.hackerrank.com/challenges/weather-observation-station-11/problem

-- Query the list of CITY names from STATION that either do not start with vowels or do not
-- end with vowels. Your result cannot contain duplicates.

SELECT DISTINCT city
FROM station
WHERE RIGHT(city, 1) NOT IN ('a', 'e', 'i', 'o', 'u')
    OR LEFT(city, 1) NOT IN ('a', 'e' , 'i', 'o', 'u');

-- https://www.hackerrank.com/challenges/weather-observation-station-12/problem

-- Query the list of CITY names from STATION that do not start with vowels and do not end
-- with vowels. Your result cannot contain duplicates.

SELECT DISTINCT city
FROM station
WHERE RIGHT(city, 1) NOT IN ('a', 'e', 'i', 'o', 'u')
    AND LEFT(city, 1) NOT IN ('a', 'e' , 'i', 'o', 'u');

-- https://www.hackerrank.com/challenges/more-than-75-marks/problem

-- Query the Name of any student in STUDENTS who scored higher than 75 Marks. Order your
-- output by the last three characters of each name. If two or more students both have
-- names ending in the same last three characters (i.e.: Bobby, Robby, etc.), secondary
-- sort them by ascending ID.

SELECT `name`
FROM students
WHERE marks > 75
ORDER BY RIGHT(`name`, 3), id;

-- https://www.hackerrank.com/challenges/name-of-employees/problem

-- Write a query that prints a list of employee names (i.e.: the name attribute) from the
-- Employee table in alphabetical order.

SELECT `name`
FROM employee
ORDER BY `name`;

-- https://www.hackerrank.com/challenges/salary-of-employees/problem

-- Write a query that prints a list of employee names (i.e.: the name attribute) for 
-- employees in Employee having a salary greater than $2000 per month who have been 
-- employees for less than 10 months. Sort your result by ascending employee_id.

SELECT `name`
FROM employee
WHERE salary > 2000
AND months < 10
ORDER BY employee_id ASC;