# Advanced SELECT Problems

## Type of Triangle

Write a query identifying the type of each record in the TRIANGLES table using its three side lengths. Output one of the following statements for each record in the table:

* **Equilateral**: It's a triangle with $3$ sides of equal length.
* **Isosceles**: It's a triangle with $2$ sides of equal length.
* **Scalene**: It's a triangle with $3$ sides of differing lengths.
* **Not A Triangle**: The given values of $A$, $B$, and $C$ don't form a triangle.

### Input Format

The **TRIANGLES** table is described as follows:

![triangle table](https://s3.amazonaws.com/hr-challenge-images/12887/1443815629-ac2a843fb7-1.png "Triangle Table")

Each row in the table denotes the lengths of each of a triangle's three sides.

### Sample Input

![triangle column example](https://s3.amazonaws.com/hr-challenge-images/12887/1443815827-cbfc1ca12b-2.png "Triangle column example")

### Sample Output

```
Isosceles
Equilateral
Scalene
Not A Triangle
```

### Explanation

Values in the tuple $(20,20,23)$ form an Isosceles triangle, because $A \equiv B$.

Values in the tuple $(20,20,20)$ form an Equilateral triangle, because $A \equiv B \equiv C$. 

Values in the tuple $(20,21,22)$ form a Scalene triangle, because $A \not\equiv B \not\equiv C$.

Values in the tuple $(13,14,30)$ cannot form a triangle because the combined value of sides $A$ and $B$ is not larger than that of side $C$.

### My Solution

```mysql

SELECT CASE 
        WHEN a + b <= c THEN 'Not A Triangle'
        WHEN a = b AND b = c THEN 'Equilateral'
        WHEN a = b OR b = c OR a = c THEN 'Isosceles'
        ELSE 'Scalene'
        END AS 'triangle_type'
FROM triangles;

```

---

## The PADS

Generate the following two result sets:

1. Query an alphabetically ordered list of all names in **OCCUPATIONS**, immediately followed by the first letter of each profession as a parenthetical (i.e.: enclosed in parentheses). For example: `AnActorName(A)`, `ADoctorName(D)`, `AProfessorName(P)`, and `ASingerName(S)`.

2. Query the number of ocurrences of each occupation in **OCCUPATIONS**. Sort the occurrences in ascending order, and output them in the following format:

`There are a total of [occupation_count] [occupation]s.`

where `[occupation_count]` is the number of occurrences of an occupation in **OCCUPATIONS** and `[occupation]` is the lowercase occupation name. If more than one Occupation has the same `[occupation_count]`, they should be ordered alphabetically.

**Note**: There will be at least two entries in the table for each type of occupation.

### Input Format

The **OCCUPATIONS** table is described as follows:

![occupations table](https://s3.amazonaws.com/hr-challenge-images/12889/1443816414-2a465532e7-1.png 'occupations table')

Occupation will only contain one of the following values: **Doctor, Professor, Singer** or **Actor**.

### Sample Input

An **OCCUPATIONS** table that contains the following records:

![occupation columns example](https://s3.amazonaws.com/hr-challenge-images/12889/1443816608-0b4d01d157-2.png 'occupation columns example')

### Sample Output

```

Ashely(P)
Christeen(P)
Jane(A)
Jenny(D)
Julia(A)
Ketty(P)
Maria(A)
Meera(S)
Priya(S)
Samantha(D)
There are a total of 2 doctors.
There are a total of 2 singers.
There are a total of 3 actors.
There are a total of 3 professors.

```

### Explanation

The results of the first query are formatted to the problem description's specifications.
The results of the second query are ascendingly ordered first by number of names corresponding to each profession $(2 \leq 2 \leq 3 \leq 3)$, and then alphabetically by profession $(doctor \leq singer$, and $actor \leq professor)$.

### My Solution

```mysql

SELECT CONCAT(`name`, '(', LEFT(occupation, 1), ')') AS name_occupation
FROM occupations
ORDER BY name_occupation;

SELECT CONCAT('There are a total of ', name_count, ' ', occupation, 's.')
FROM(
    SELECT LOWER(occupation) AS occupation, COUNT(name) AS name_count
    FROM occupations
    GROUP BY occupation
    ORDER BY name_count ASC, occupation ASC
    ) AS sub_1

```

## Occupations

Pivot the Occupation column in **OCCUPATIONS** so that each Name is sorted alphabetically and displayed underneath its corresponding Occupation. The output column headers should be Doctor, Professor, Singer, and Actor, respectively.

**Note**: Print **NULL** when there are no more names corresponding to an occupation.

### Input Format

The **OCCUPATIONS** table is described as follows:

![occupations table](https://s3.amazonaws.com/hr-challenge-images/12889/1443816414-2a465532e7-1.png 'occupations table')

Occupation will only contain one of the following values: **Doctor, Professor, Singer** or **Actor**.

### Sample Input

![occupation table](https://s3.amazonaws.com/hr-challenge-images/12890/1443817648-1b2b8add45-2.png 'occupations table')

### Sample Output

```

Jenny    Ashley     Meera  Jane
Samantha Christeen  Priya  Julia
NULL     Ketty      NULL   Maria

```

### Explanation

The first column is an alphabetically ordered list of Doctor names.

The second column is an alphabetically ordered list of Professor names.

The third column is an alphabetically ordered list of Singer names.

The fourth column is an alphabetically ordered list of Actor names.

The empty cell data for columns with less than the maximum number of names per occupation (in this case, the Professor and Actor columns) are filled with **NULL** values.

### My Solution

No solution at this time.