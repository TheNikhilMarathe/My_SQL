SELECT * FROM employees;
SELECT salary
FROM employees;
SELECT DISTINCT job_name 
FROM employees;
SELECT emp_name, format (1.15*salary,'C') AS " Revised Salary"
FROM employees;
SELECT concat (emp_name,'   ' ,job_name) AS "Employee & Job"
FROM employees ;
SELECT concat (emp_name,' (', lower(job_name),') ') AS "Employee"
FROM employees;
select convert(char,hire_date ,107)
FROM employees;
SELECT emp_name ,  len(trim(emp_name))
FROM employees;
select emp_id, salary , commission from employees;
SELECT DISTINCT dep_id,job_name FROM employees ;

SELECT *
FROM employees
WHERE dep_id NOT IN (2001);
SELECT *
FROM employees
WHERE hire_date<('1991-1-1');
SELECT avg(salary)
FROM employees
WHERE job_name = 'ANALYST';
SELECT *
FROM employees
WHERE emp_name = 'BLAZE';
SELECT *
FROM employees
WHERE commission>salary;
SELECT *
FROM employees
WHERE (1.25*salary) > 3000;
SELECT emp_name
FROM employees
WHERE len(emp_name)=6;

SELECT *
FROM employees
WHERE month(hire_date)=01;

SELECT e.emp_name + '  works for  ' + m.emp_name
FROM employees e,
     employees m
WHERE e.manager_id = m.emp_id;
SELECT *
FROM employees
WHERE job_name = 'CLERK';

SELECT *
FROM employees
WHERE datediff(year, hire_date, getdate()) > 27;
SELECT *
FROM employees
WHERE salary <3500;
SELECT emp_name,
       job_name,
       salary
FROM employees
WHERE job_name = 'ANALYST';
SELECT *
FROM employees
WHERE year(hire_date) = '1991';
SELECT e.emp_id,
       e.emp_name,
       e.hire_date,
       e.salary
FROM employees e
WHERE hire_date <'1991-04-01';
SELECT e.emp_name,
       e.job_name
FROM employees e
WHERE manager_id IS NULL;
SELECT *
FROM employees
WHERE hire_date = '1991-05-01';
SELECT emp_id,
       emp_name,
       salary,
       DATEDIFF (year, hire_date, getdate()) "Experience"
FROM employees
WHERE manager_id=68319;
SELECT emp_id,
       emp_name,
       salary,
       DATEDIFF (year, hire_date, getdate()) "Experience"
FROM employees
WHERE (salary/30)>100;
SELECT emp_name, hire_date
FROM employees
WHERE Dateadd (month, 96, hire_date) > '1999-12-31';

SELECT *
FROM employees
WHERE salary % 2 = 1;
SELECT *
FROM employees
WHERE len(format (salary, '#####')) = 3;
SELECT *
FROM employees
WHERE format (hire_date,'MMM') ='APR';
SELECT *
FROM employees
WHERE month (hire_date) =04;
SELECT *
FROM employees
WHERE day(hire_date) < '19';
SELECT *
FROM employees
WHERE job_name = 'SALESMAN'
  AND DATEDIFF (month, hire_date, getdate())  > 10;
SELECT *
FROM employees
WHERE year(hire_date) = '1991'
  AND (dep_id =3001
       OR dep_id =1001);
SELECT *
FROM employees
WHERE dep_id=1001
  OR dep_id=2001;
SELECT *
FROM employees
WHERE job_name ='CLERK'
  AND dep_id = 2001;
SELECT emp_id,
       emp_name,
       salary,
       job_name
FROM employees
WHERE 12*(salary+commission) < 34000
  AND commission IS NOT NULL
  AND commission < salary
  AND job_name = 'SALESMAN'
  AND dep_id = 3001;

SELECT *
FROM employees
WHERE job_name IN ('CLERK','MANAGER');

SELECT *
FROM employees
WHERE FORMAT (hire_date,'MMM') NOT IN ('FEB');
SELECT *
FROM employees
WHERE hire_date BETWEEN '1991-01-01' AND '1991-12-31';
SELECT *
FROM employees
WHERE hire_date BETWEEN '1991-06-01' AND '1991-06-30';
SELECT *
FROM employees
WHERE 12*salary BETWEEN 24000 AND 50000;
SELECT *
FROM employees
WHERE format  (hire_date,'dd-MMM-yy') IN ('01-MAY-91',
                                         '20-FEB-91',
                                         '03-DEC-91');
SELECT *
FROM employees
WHERE manager_id IN (63679,
                     68319,
                     66564,
                     69000);
SELECT *
FROM employees
WHERE hire_date BETWEEN '1992-07-01' AND '1992-12-31';

 SELECT *
FROM employees
WHERE year(hire_date) BETWEEN '1990' AND '1999';
SELECT *
FROM employees
WHERE job_name = 'MANAGER'
  AND (dep_id = 1001
       OR dep_id =2001);
SELECT *
FROM employees
WHERE format (hire_date,'MMM') = 'FEB'
  AND salary BETWEEN 1000 AND 2000;

  SELECT *
FROM employees
WHERE year(hire_date) NOT IN ('1991');
SELECT e.emp_id,
       e.emp_name,
       e.job_name,
       e.manager_id,
       e.hire_date,
       e.salary,
       e.commission,
       e.dep_id,
       d.dep_name
FROM employees e,
     department d
WHERE e.dep_id = d.dep_id;
SELECT e.emp_name,
       e.job_name,
       (12*e.salary)"Annual Salary",
       e.dep_id,
       d.dep_name,
       s.grade
FROM employees e,
     department d,
     salary_grade s
WHERE e.dep_id = d.dep_id
  AND e.salary BETWEEN s.min_salary AND s.max_salary
  AND (((12*e.salary)>= 60000)
       OR (e.job_name != 'ANALYST'))

SELECT w.emp_name,
       w.job_name,
       w.manager_id,
       w.salary,
       m.emp_name "Manager",
       m.emp_id,
       m.salary "Manager_Salary"
FROM employees w,
     employees m
WHERE w.manager_id = m.emp_id
  AND w.salary > m.salary;
SELECT e.emp_name,
       e.dep_id,
       e.salary,
       e.commission
FROM employees e,
     department d
WHERE e.dep_id = d.dep_id
  AND d.dep_location = 'PERTH'
  AND e.salary BETWEEN 2000 AND 5000;

SELECT s.grade,
       e.emp_name
FROM employees e,
     salary_grade s
WHERE e.dep_id IN (1001,
                   3001)
  AND hire_date < ('1992-12-31')
  AND (e.salary BETWEEN s.min_salary AND s.max_salary
       AND s.grade NOT IN (4));
SELECT w.emp_id,
       w.emp_name,
       w.job_name,
       w.manager_id,
       w.hire_date,
       w.salary,
       w.dep_id,
       m.emp_name
FROM employees w,
     employees m
WHERE w.manager_id = m.emp_id
  AND m.emp_name = 'JONAS';
SELECT e.emp_name,
       e.salary
FROM employees e,
     salary_grade s
WHERE e.emp_name = 'FRANK'
  AND e.salary BETWEEN s.min_salary AND s.max_salary
  AND e.salary = s.max_salary ;
SELECT *
FROM employees
WHERE job_name IN ('MANAGER',
                   'ANALYST')
  AND salary BETWEEN 2000 AND 5000
  AND commission IS NULL;
SELECT e.emp_id,
       e.emp_name,
       e.dep_id,
       e.salary,
       d.dep_location
FROM employees e,
     department d
WHERE e.dep_id = d.dep_id
  AND d.dep_location IN ('PERTH',
                         'MELBOURNE')
  AND DATEDIFF(Year,hire_date,getdate()) > 10;

SELECT e.emp_id,
       e.emp_name,
       e.dep_id,
       e.salary,
       d.dep_location
FROM employees e,
     department d
WHERE e.dep_id = d.dep_id
  AND d.dep_location IN ('SYDNEY',
                         'MELBOURNE')
  AND year(e.hire_date) = '1991'
  AND e.salary BETWEEN 2000 AND 5000;
SELECT e.dep_id,
       e.emp_id,
       e.emp_name,
       e.salary,
       d.dep_name,
       d.dep_location,
       s.grade
FROM employees e,
     salary_grade s,
     department d
WHERE e.dep_id = d.dep_id
  AND e.salary BETWEEN s.min_salary AND s.max_salary
  AND s.grade IN (3,4,
                  5)
  AND DATEDIFF (YEAR, HIRE_DATE ,getdate()) > 5
  AND (d.dep_name = 'MARKETING'
       AND D.dep_location IN ('MELBOURNE',
                              'PERTH'));
SELECT *
FROM employees w,
     employees m
WHERE w.manager_id = m.emp_id
  AND w.hire_date < m.hire_date;
SELECT *
FROM employees e,
     salary_grade s
WHERE e.salary BETWEEN s.min_salary AND s.max_salary
  AND s.grade = 4;
SELECT e.emp_name
FROM employees e,
     department d,
     salary_grade s
WHERE e.dep_id = d.dep_id
  AND d.dep_name IN ('PRODUCTION',
                     'AUDIT')
  AND e.salary BETWEEN s.min_salary AND s.max_salary
  AND e.emp_name NOT IN ('MARKER',
                         'ADELYN')
  AND YEAR(hire_date) >'1991';
SELECT * 
FROM employees 
ORDER BY salary ASC;
SELECT *
FROM employees
ORDER BY dep_id ASC,
         job_name DESC;
SELECT DISTINCT job_name
FROM employees
ORDER BY job_name DESC;
SELECT emp_id,
       emp_name,
       salary Monthly_Salary,
       salary/30 Daily_Salary,
       12*salary Anual_Salary
FROM employees
ORDER BY Anual_Salary ASC;
SELECT *
FROM employees
WHERE job_name='CLERK'
  OR job_name='ANALYST'
ORDER BY job_name DESC;
SELECT dep_location
FROM department d,
     employees e
WHERE e.emp_name = 'CLARE'
  AND e.dep_id = d.dep_id ;
SELECT *
FROM employees
WHERE hire_date IN ('1991-5-01',
                    '1991-12-03',
                    '1990-01-19')
ORDER BY hire_date ASC;
SELECT *
FROM employees
WHERE salary < 1000
ORDER BY salary;
SELECT *
FROM employees
ORDER BY salary ASC;
SELECT *
FROM employees e
ORDER BY e.job_name ASC,
         e.emp_id DESC ;
SELECT DISTINCT job_name
FROM employees
WHERE dep_id IN (2001,
                 3001)
ORDER BY job_name DESC;
SELECT *
FROM employees
WHERE job_name NOT IN ('PRESIDENT',
                       'MANAGER')
ORDER BY salary ASC;
SELECT *
FROM employees
WHERE (12*salary) < 25000
ORDER BY salary ASC;
SELECT e.emp_id,
       e.emp_name,
       12*salary "Annual Salary",
       (12*salary)/365 "Daily Salary"
FROM employees e
WHERE e.job_name = 'SALESMAN'
ORDER BY "Annual Salary" ASC;
SELECT emp_id,
       emp_name,
       hire_date,
       getdate(),
       datediff (year, hire_date, getdate()) EXP
FROM employees
ORDER BY EXP ASC;

SELECT *
FROM employees
WHERE hire_date>('1991-6-30')
  AND year(hire_date)=1991
ORDER BY job_name ASC;
SELECT *
FROM employees e,
     department d
WHERE (dep_name = 'FINANCE'
       OR dep_name ='AUDIT')
  AND e.dep_id = d.dep_id
ORDER BY e.dep_id ASC;
SELECT *
FROM employees e,
     salary_grade s
WHERE e.salary BETWEEN s.min_salary AND s.max_salary
ORDER BY grade ASC;
SELECT e.emp_name,
       e.job_name,
       (12*e.salary)"Annual Salary",
       e.dep_id,
       d.dep_name,
       s.grade
FROM employees e,
     department d,
     salary_grade s
WHERE e.dep_id = d.dep_id
  AND e.salary BETWEEN s.min_salary AND s.max_salary
  AND (((12*e.salary)>= 60000)
       OR (e.job_name != 'ANALYST'))
SELECT e.emp_name,
       e.job_name,
       e.salary,
       s.grade,
       d.dep_name
FROM employees e,
     department d,
     salary_grade s
WHERE e.dep_id = d.dep_id
  AND e.salary BETWEEN s.min_salary AND s.max_salary
  AND e.job_name NOT IN('CLERK')
ORDER BY e.salary DESC;
SELECT e.emp_id,
       e.emp_name,
       e.salary,
       s.grade,
       d.dep_name,
       DATEDIFF(year,hire_date, getdate()) AS "Experience",
       12 * e.salary "Annual Salary"
FROM employees e,
     department d,
     salary_grade s
WHERE e.dep_id IN (1001,
                   2001)
  AND e.dep_id = d.dep_id
  AND e.salary BETWEEN s.min_salary AND s.max_salary ;
SELECT *
FROM employees e,
     department d
WHERE e.dep_id= d.dep_id;
SELECT *
FROM employees w,
     employees m
WHERE w.manager_id = m.emp_id
  AND w.hire_date < m.hire_date;
SELECT e.emp_id,
       e.emp_name,
       e.salary,
       e.dep_id
FROM employees E
WHERE e.dep_id = 1001
ORDER BY e.salary ASC;
SELECT max(salary)
FROM employees;
SELECT job_name,
       avg(salary),
       avg(salary+commission)
FROM employees
GROUP BY job_name;
SELECT job_name,
       sum(12*salary)
FROM employees
WHERE year(hire_date) = '1991'
GROUP BY job_name;
SELECT e.emp_id,
       e.emp_name,
       e.dep_id,
       d.dep_location
FROM employees e,
     department d
WHERE e.dep_id = d.dep_id ;
SELECT e.emp_id,
       e.emp_name,
       e.dep_id,
       d.dep_location,
       d.dep_name
FROM employees e,
     department d
WHERE e.dep_id = d.dep_id
  AND e.dep_id IN (1001,
                   2001);

SELECT e.emp_id,
       e.emp_name,
       e.salary,
       s.grade
FROM employees e,
     salary_grade s
WHERE e.salary BETWEEN s.min_salary AND s.max_salary ;
SELECT w.manager_id,
       count(*)
FROM employees w,
     employees m
WHERE w.manager_id = m.emp_id
GROUP BY w.manager_id
ORDER BY w.manager_id ASC;
SELECT dep_id,
       job_name,
       count(*)
FROM employees
GROUP BY dep_id,
         job_name;
SELECT dep_id,
       count(*)
FROM employees
GROUP BY dep_id
HAVING count(*) >= 2;
SELECT s.grade,
       count(*),
       max(salary)
FROM employees e,
     salary_grade s
WHERE e.salary BETWEEN s.min_salary AND s.max_salary
GROUP BY s.grade;
SELECT d.dep_name,
       s.grade,
       count(*)
FROM employees e,
     department d,
     salary_grade s
WHERE e.dep_id = d.dep_id
  AND e.job_name = 'SALESMAN'
  AND e.salary BETWEEN s.min_salary AND s.max_salary
GROUP BY d.dep_name,
         s.grade
HAVING count(*) >= 2;

SELECT d.dep_name,
       s.grade,
       count(*)
FROM employees e,
     department d,
     salary_grade s
WHERE e.dep_id = d.dep_id
  AND e.job_name = 'SALESMAN'
  AND e.salary BETWEEN s.min_salary AND s.max_salary
GROUP BY d.dep_name,
         s.grade
HAVING count(*) >= 2;
SELECT dep_id,
       count(*)
FROM employees
GROUP BY dep_id
HAVING count(*)<4;
SELECT d.dep_name,
       count(*)
FROM employees e,
     department d
WHERE e.dep_id = d.dep_id
GROUP BY d.dep_name
HAVING count(*) >= 2;

SELECT emp_id,
       count(*)
FROM employees
GROUP BY emp_id;
SELECT count(*),
       avg(salary),
       dep_id,
       job_name
FROM employees
GROUP BY dep_id,
         job_name;
SELECT emp_name
FROM employees
WHERE emp_name LIKE 'A%'
  AND len(trim(emp_name))=6;
  SELECT *
FROM employees
WHERE len(trim(emp_name))=6
  AND emp_name LIKE '__R%';
SELECT *
FROM employees
WHERE len(trim(emp_name))=6
  AND emp_name LIKE 'A%N';
SELECT *
FROM employees
WHERE FORMAT (hire_date,'MMM') LIKE '_a%';
SELECT *
FROM employees
WHERE emp_name LIKE '%AR%';




