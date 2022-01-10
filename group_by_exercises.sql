#In your script, use DISTINCT to find the unique titles in the titles table. How many unique titles have there ever been? Answer that in a comment in your SQL file. 
#7 

SELECT COUNT(DISTINCT(title)) FROM titles;

#Write a query to to find a list of all unique last names of all employees that start and end with 'E' using GROUP BY.

SELECT DISTINCT(last_name) FROM employees
WHERE last_name 
LIKE 'E%E'
GROUP BY last_name;

#Write a query to to find all unique combinations of first and last names of all employees whose last names start and end with 'E'.
SELECT last_name, first_name
FROM employees
WHERE last_name
LIKE 'E%E';

#Write a query to find the unique last names with a 'q' but not 'qu'. Include those names in a comment in your sql code. CHELQ, LINDQCIST, QIWEN. 

SELECT DISTINCT(last_name) FROM employees
WHERE last_name LIKE '%q%'
AND last_name NOT LIKE '%qu%';

#Add a COUNT() to your results (the query above) to find the number of employees with the same last name. 
SELECT last_name, COUNT(last_name) FROM employees
GROUP BY last_name
HAVING COUNT(last_name)>1;

#Find all all employees with first names 'Irena', 'Vidya', or 'Maya'. Use COUNT(*) and GROUP BY to find the number of employees for each gender with those names. 441  in M and 268 in F

SELECT gender, COUNT(first_name) FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
GROUP BY gender;

#Using your query that generates a username for all of the employees, generate a count employees for each unique username. Are there any duplicate usernames? BONUS: How many duplicate usernames are there? NO duplicates because we I used the emp_no. 

SELECT emp_no, first_name, last_name, CONCAT(emp_no, LOWER(first_name), LOWER(last_name)) AS username
FROM employees;

#More practice with aggregate functions:

#Determine the historic average salary for each employee. When you hear, read, or think "for each" with regard to SQL, you'll probably be grouping by that exact column. 



SELECT AVG(salary), emp_no FROM salaries
GROUP BY emp_no;


#Using the dept_emp table, count how many current employees work in each department. The query result should show 9 rows, one for each department and the employee count.
SELECT * FROM dept_emp;
SELECT COUNT(emp_no), dept_no 
FROM dept_emp
GROUP by dept_no;

#SELECT * FROM dept_emp;
#Determine how many different salaries each employee has had. This includes both historic and current.

SELECT * FROM salaries;
SELECT emp_no, COUNT(salary) FROM salaries
GROUP BY emp_no;

#Find the maximum salary for each employee.
SELECT MAX(salary), emp_no FROM salaries
GROUP BY emp_no;
#Find the minimum salary for each employee.
SELECT MIN(salary), emp_no FROM salaries
GROUP BY emp_no;
#Find the standard deviation of salaries for each employee.

SELECT STDDEV(salary), emp_no FROM salaries
GROUP BY emp_no;
#Now find the max salary for each employee where that max salary is greater than $150,000.

SELECT MAX(salary), emp_no FROM salaries
GROUP By emp_no
HAVING max(salary) > 150000;

#Find the average salary for each employee where that average salary is between $80k and $90k.

SELECT AVG(salary), emp_no FROM salaries
GROUP By emp_no
HAVING AVG(salary) BETWEEN 80000 and 90000;




