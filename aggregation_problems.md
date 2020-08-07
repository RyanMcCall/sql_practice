# Aggregation Problems

## [Revising Aggregations - The Count Function](https://www.hackerrank.com/challenges/revising-aggregations-the-count-function/problem)

### Problem

Query a count of the number of cities in **CITY** having a Population larger than $100,000$.

### Input Format

The **CITY** table is described as follows:

![city table](https://s3.amazonaws.com/hr-challenge-images/8137/1449729804-f21d187d0f-CITY.jpg 'city table')

### My Solution

``` mysql

SELECT COUNT(id)
FROM city
WHERE population > 100000;

```

## [Revising Aggregations - The Sum Function](https://www.hackerrank.com/challenges/revising-aggregations-sum/problem)

### Problem

Query the total population of all cities in **CITY** where District is **California**.

### Input Format

The **CITY** table is described as follows:

![city table](https://s3.amazonaws.com/hr-challenge-images/8137/1449729804-f21d187d0f-CITY.jpg 'city table')

### My Solution

```mysql
SELECT SUM(POPULATION)
FROM city
WHERE district = 'California';
```

## [Revising Aggregations - Averages](https://www.hackerrank.com/challenges/revising-aggregations-the-average-function/problem)

### Problem

Query the average population of all cities in **CITY** where District is **California**.

### Input Format


The **CITY** table is described as follows:

![city table](https://s3.amazonaws.com/hr-challenge-images/8137/1449729804-f21d187d0f-CITY.jpg 'city table')

### My Solution

```mysql
SELECT AVG(population)
FROM city
WHERE district = 'California';
```