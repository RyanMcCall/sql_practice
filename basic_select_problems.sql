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