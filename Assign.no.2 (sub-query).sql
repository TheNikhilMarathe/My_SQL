SELECT *
FROM employees
WHERE emp_id IN
    (SELECT manager_id
     FROM employees);
SELECT emp_id,  emp_name, job_name, hire_date,
	   (DATEDIFF( day, hire_date, getdate()))/365  ' Years ' ,
	      ((DATEDIFF( day, hire_date, getdate()))%365)/30 ' Months ',
		  ((DATEDIFF( day, hire_date, getdate()))%30)  ' Days' 
FROM employees
WHERE emp_id IN
    (SELECT manager_id
     FROM employees);
SELECT e.emp_id,
       e.emp_name,
       e.salary,
       d.dep_name
FROM employees e,
     department d
WHERE d.dep_location IN ('SYDNEY',
                         'PERTH')
  AND e.dep_id = d.dep_id
  AND e.emp_id IN
    (SELECT e.emp_id
     FROM employees e
     WHERE e.job_name IN ('MANAGER',
                          'ANALYST')
       AND (DATEDIFF (year, hire_date, getdate())> 5)
       AND e.commission IS NULL)
ORDER BY d.dep_location ASC;
SELECT E.emp_id,
       E.emp_name,
       E.salary,
       D.dep_name,
       D.dep_location,
       E.dep_id,
       E.job_name
FROM employees E,
     department D
WHERE (D.dep_location = 'SYDNEY'
       OR D.dep_name = 'FINANCE')
  AND E.dep_id=D.dep_id
  AND E.emp_id IN
    (SELECT emp_id
     FROM employees E
     WHERE (12*E.salary) > 28000
       AND E.salary NOT IN (3000,
                            2800)
       AND E.job_name !='MANAGER'
       AND (trim(to_char(emp_id,'99999')) LIKE '__3%'
            OR trim(to_char(emp_id,'99999')) LIKE '__7%'))
ORDER BY E.dep_id ASC,
         E.job_name DESC;
SELECT *
FROM employees e,
     salary_grade s
WHERE e.salary BETWEEN s.min_salary AND s.max_salary
  AND s.grade IN (2, 3);
SELECT *
FROM employees e,
     salary_grade s
WHERE e.salary BETWEEN s.min_salary AND s.max_salary
  AND s.grade IN (4,
                  5)
  AND e.emp_id IN
    (SELECT e.emp_id
     FROM employees e
     WHERE e.job_name IN ('MANAGER',
                          'ANALYST'));
SELECT *
FROM employees
WHERE salary >
    (SELECT salary
     FROM employees
     WHERE emp_name = 'JONAS');
SELECT *
FROM employees
WHERE job_name =
    (SELECT job_name
     FROM employees
     WHERE emp_name = 'FRANK');

SELECT *
FROM employees
WHERE hire_date <
    (SELECT hire_date
     FROM employees
     WHERE emp_name = 'ADELYN');
SELECT *
FROM employees e,
     department d
WHERE d.dep_id = 2001
  AND e.dep_id = d.dep_id
  AND e.job_name IN
    (SELECT e.job_name
     FROM employees e,
          department d
     WHERE e.dep_id = d.dep_id
       AND d.dep_id =1001);
SELECT *
FROM employees
WHERE salary IN
    (SELECT salary
     FROM employees e
     WHERE e.emp_name IN ('FRANK',
                          'BLAZE')
       AND employees.emp_id <> e.emp_id);
SELECT *
FROM employees
WHERE job_name =
    (SELECT job_name
     FROM employees
     WHERE emp_name = 'MARKER' )
  OR salary>
    (SELECT salary
     FROM employees
     WHERE emp_name = 'ADELYN');
SELECT *
FROM employees
WHERE salary >
    (SELECT max(salary+commission)
     FROM employees
     WHERE job_name = 'SALESMAN');
SELECT *
FROM employees e,
     department d
WHERE d.dep_location IN ('PERTH',
                         'BRISBANE')
  AND e.dep_id = d.dep_id
  AND e.hire_date <
    (SELECT e.hire_date
     FROM employees e
     WHERE e.emp_name = 'BLAZE') ;
SELECT *
FROM employees e
WHERE e.dep_id IN
    (SELECT d.dep_id
     FROM department d
     WHERE d.dep_name IN ('FINANCE',
                          'AUDIT') )
  AND e.salary >
    (SELECT salary
     FROM employees
     WHERE emp_name = 'ADELYN')
  AND e.hire_date <
    (SELECT hire_date
     FROM employees
     WHERE emp_name = 'FRANK')
  AND e.emp_id IN
    (SELECT e.emp_id
     FROM employees e,
          salary_grade s
     WHERE e.salary BETWEEN s.min_sal AND s.max_sal
       AND s.grade IN (3,
                       4) )
ORDER BY e.hire_date ASC;
SELECT *
FROM employees
WHERE job_name IN
    (SELECT job_name
     FROM employees
     WHERE emp_name = 'SANDRINE'
       OR emp_name = 'ADELYN');
SELECT e.job_name
FROM employees e
WHERE e.dep_id = 1001
  AND e.job_name NOT IN
    (SELECT job_name
     FROM employees
     WHERE dep_id =2001);
SELECT *
FROM employees
WHERE salary IN
    (SELECT max(salary)
     FROM employees);
SELECT *
FROM employees
WHERE salary IN
    (SELECT max(salary)
     FROM employees
     WHERE dep_id IN
         (SELECT d.dep_id
          FROM department d
          WHERE d.dep_name = 'MARKETING'));
SELECT e.emp_id, e.emp_name, e.job_name, e.hire_date,e.salary
FROM employees e
WHERE e.dep_id IN
    (SELECT d.dep_id
     FROM department d
     WHERE d.dep_location = 'PERTH')
  AND e.hire_date IN
    (SELECT max(hire_date)
     FROM employees
     WHERE emp_id IN
         (SELECT emp_id
          FROM employees e,
               salary_grade s
          WHERE e.salary BETWEEN s.min_sal AND s.max_sal
            AND s.grade = 3)) ;
SELECT *
FROM employees
WHERE hire_date <
    (SELECT max(hire_date)
     FROM employees
     WHERE manager_id IN
         (SELECT emp_id
          FROM employees
          WHERE emp_name = 'KAYLING'));

SELECT *
FROM employees
WHERE dep_id IN
    (SELECT dep_id
     FROM department
     WHERE department.dep_location ='SYDNEY')
  AND emp_id IN
    (SELECT emp_id
     FROM employees e,
          salary_grade s
     WHERE e.salary BETWEEN s.min_sal AND s.max_sal
       AND s.grade IN (3,
                       4,
                       5) )
  AND job_name != 'PRESIDENT'
  AND salary >
    (SELECT max(salary)
     FROM employees
     WHERE dep_id IN
         (SELECT dep_id
          FROM department
          WHERE department.dep_location = 'PERTH')
       AND job_name IN ('MANAGER',
                        'SALESMAN')
       AND manager_id NOT IN
         (SELECT emp_id
          FROM employees
          WHERE emp_name = 'KAYLING'));
SELECT *
FROM employees
WHERE hire_date =
    (SELECT min(hire_date)
     FROM employees
     WHERE to_char(hire_date,'YYYY') = '1991');
SELECT *
FROM employees
WHERE job_name IN
    (SELECT job_name
     FROM employees
     WHERE hire_date IN
         (SELECT min(hire_date)
          FROM employees
          WHERE to_char(hire_date,'YYYY') ='1991'));
SELECT *
FROM employees
WHERE hire_date IN
    (SELECT min(hire_date)
     FROM employees
     WHERE emp_id IN
         (SELECT emp_id
          FROM employees e,
               salary_grade s
          WHERE e.salary BETWEEN s.min_sal AND s.max_sal
            AND s.grade IN (4,
                            5)))
  AND manager_id IN
    (SELECT emp_id
     FROM employees
     WHERE emp_name = 'KAYLING');
SELECT SUM (salary)
FROM employees
WHERE job_name = 'MANAGER';
SELECT sum(salary)
FROM employees
WHERE emp_id IN
    (SELECT emp_id
     FROM employees e,
          salary_grade s
     WHERE e.salary BETWEEN s.min_sal AND s.max_sal
       AND s.grade = 3);
SELECT *
FROM employees
WHERE dep_id =1001
  AND salary >
    (SELECT AVG (salary)
     FROM employees
     WHERE dep_id = 2001);
SELECT d.dep_id,
       d.dep_name,
       d.dep_location,
       count(*)
FROM employees e,
     department d
WHERE e.dep_id = d.dep_id
GROUP BY d.dep_id
HAVING count(*) =
  (SELECT MAX (mycount)
   FROM
     (SELECT COUNT(*) mycount
      FROM employees
      GROUP BY dep_id) a);
SELECT *
FROM employees
WHERE manager_id IN
    (SELECT emp_id
     FROM employees
     WHERE emp_name = 'JONAS');
SELECT *
FROM employees
WHERE dep_id NOT IN
    (SELECT dep_id
     FROM department
     WHERE dep_name = 'MARKETING');
SELECT e.emp_name,
       e.job_name,
       d.dep_name,
       d.dep_location
FROM employees e,
     department d
WHERE e.dep_id = d.dep_id
  AND e.emp_id IN
    (SELECT manager_id
     FROM employees) ;
SELECT e.emp_name,
       e.dep_id
FROM employees e
WHERE e.salary IN
    (SELECT max(salary)
     FROM employees
     GROUP BY dep_id) ;
SELECT *
FROM employees
WHERE salary >=
    (SELECT (max(salary)+min(salary))/2
     FROM employees);
SELECT *
FROM employees m
WHERE m.emp_id IN
    (SELECT manager_id
     FROM employees)
  AND m.salary >
    (SELECT avg(e.salary)
     FROM employees e
     WHERE e.manager_id = m.emp_id );
SELECT *
FROM employees w,
     employees m
WHERE w.manager_id = m.emp_id
  AND w.salary < m.salary
  AND w.salary > ANY
    (SELECT salary
     FROM employees
     WHERE emp_id IN
         (SELECT manager_id
          FROM employees));
SELECT e.emp_name,
       d.maxsal,
       e.dep_id AS "Current Salary"
FROM employees e,

  (SELECT avg(salary) maxsal,
          dep_id
   FROM employees
   GROUP BY dep_id) d
WHERE e.dep_id=d.dep_id;
SELECT *
FROM employees e
WHERE 5>
    (SELECT count(*)
     FROM employees
     WHERE e.salary >salary);
SELECT *
FROM employees
WHERE emp_id IN
    (SELECT manager_id
     FROM employees)
  AND manager_id NOT IN
    (SELECT emp_id
     FROM employees
     WHERE job_name = 'PRESIDENT');

SELECT e.emp_name,
       e.salary,
       e.commission,

  (SELECT sum(salary+commission)
   FROM employees) NETPAY
FROM employees e
WHERE
    (SELECT sum(salary+commission)
     FROM employees) > ANY
    (SELECT salary
     FROM employees
     WHERE emp_id =e.emp_id) ;


SELECT *
FROM department d
WHERE length(dep_name) IN
    (SELECT count(*)
     FROM employees e
     WHERE e.dep_id = d.dep_id );
SELECT dep_name
FROM department
WHERE dep_id IN
    (SELECT dep_id
     FROM employees
     GROUP BY dep_id
     HAVING count(*) IN
       (SELECT MAX (mycount)
        FROM
          (SELECT COUNT(*) mycount
           FROM employees
           GROUP BY dep_id) a));
SELECT *
FROM employees e
WHERE hire_date IN
    (SELECT hire_date
     FROM employees
     WHERE e.emp_id <> emp_id);

SELECT d.dep_name
FROM department d,
     employees e
WHERE e.dep_id = d.dep_id
GROUP BY d.dep_name
HAVING count(*) >
  (SELECT AVG (mycount)
   FROM
     (SELECT COUNT(*) mycount
      FROM employees
      GROUP BY dep_id) a);
SELECT m.emp_name,
       count(*)
FROM employees w,
     employees m
WHERE w.manager_id = m.emp_id
GROUP BY m.emp_name
HAVING count(*) =
  (SELECT MAX (mycount)
   FROM
     (SELECT COUNT(*) mycount
      FROM employees
      GROUP BY manager_id) a);
SELECT *
FROM employees w
WHERE salary < ANY
    (SELECT salary
     FROM employees
     WHERE w.emp_id=manager_id);
SELECT *
FROM employees
WHERE manager_id IN
    (SELECT emp_id
     FROM employees
     WHERE emp_name = 'BLAZE');

SELECT *
FROM employees
WHERE emp_id IN
    (SELECT manager_id
     FROM employees);
SELECT w.emp_name,
       m.emp_name,

  (SELECT emp_name
   FROM employees
   WHERE m.manager_id = emp_id) "his MANAGER"
FROM employees w,
     employees m
WHERE w.manager_id = m.emp_id
  AND m.emp_name = 'JONAS';
SELECT *
FROM employees
WHERE salary IN
    (SELECT min(salary)
     FROM employees
     GROUP BY job_name)
ORDER BY salary ASC;
SELECT *
FROM employees
WHERE salary IN
    (SELECT max(salary)
     FROM employees
     GROUP BY job_name)
ORDER BY salary DESC;
SELECT *
FROM employees e
WHERE hire_date IN
    (SELECT max(hire_date)
     FROM employees
     WHERE e.dep_id = dep_id )
ORDER BY hire_date DESC;
SELECT e.emp_name,
       e.salary,
       e.dep_id
FROM employees e
WHERE salary >
    (SELECT avg(salary)
     FROM employees
     WHERE e.dep_id = dep_id )
ORDER BY dep_id;
SELECT *
FROM employees
WHERE salary =
    (SELECT max(salary)
     FROM employees
     WHERE commission IS NOT NULL);
SELECT emp_name,
       job_name,
       salary
FROM employees
WHERE dep_id != 1001
  AND job_name IN
    (SELECT job_name
     FROM employees
     WHERE dep_id = 3001)
  AND salary IN
    (SELECT salary
     FROM employees
     WHERE dep_id = 3001);
SELECT dep_id,
       emp_name,
       job_name,
       salary,
       salary+commission "Net Salary"
FROM employees
WHERE job_name = 'SALESMAN'
  AND salary+commission IN
    (SELECT max(salary+commission)
     FROM employees
     WHERE commission IS NOT NULL);
SELECT dep_id,
       emp_name,
       salary,
       job_name,
       salary+commission "Net Salary"
FROM employees e
WHERE 2-1 = (
  SELECT count(DISTINCT emp.salary+emp.commission)
  FROM employees emp WHERE emp.salary+emp.commission>e.salary+e.commission);
SELECT dep_id,
       avg(salary)
FROM employees
GROUP BY dep_id
HAVING avg(salary) <
  (SELECT avg(salary)
   FROM employees);
SELECT *
FROM department
WHERE dep_id IN
    (SELECT DISTINCT dep_id
     FROM employees);
SELECT *
FROM employees
WHERE dep_id IN
    (SELECT dep_id
     FROM department
     WHERE department.dep_location = 'PERTH');

SELECT *
FROM employees
WHERE emp_id IN
    (SELECT emp_id
     FROM employees e,
          salary_grade s
     WHERE e.salary BETWEEN s.min_sal AND s.max_sal
       AND s.grade IN (2,
                       3))
  AND dep_id IN
    (SELECT dep_id
     FROM department
     WHERE dep_LOCATION='PERTH');

SELECT *
FROM employees
WHERE job_name =
    (SELECT job_name
     FROM employees
     WHERE emp_name = 'ADELYN')
  OR salary >
    (SELECT salary
     FROM employees
     WHERE emp_name = 'WADE');
SELECT *
FROM employees
WHERE dep_id = 1001
  AND salary >
    (SELECT salary
     FROM employees
     WHERE emp_name = 'ADELYN');
SELECT *
FROM employees
WHERE emp_id IN
    (SELECT manager_id
     FROM employees
     WHERE hire_date<
         (SELECT hire_date
          FROM employees
          WHERE emp_name = 'KAYLING' )
       AND hire_date >
         (SELECT hire_date
          FROM employees
          WHERE emp_name = 'SANDRINE'))
  AND manager_id IS NOT NULL;
SELECT e.emp_id,
       e.emp_name,
       d.dep_location,
       e.salary,
       d.dep_name
FROM employees e,
     department d
WHERE e.dep_id=d.dep_id
  AND e.dep_id IN
    (SELECT dep_id
     FROM employees
     WHERE emp_name = 'KAYLING'
       AND employees.emp_id <> e.emp_id);
SELECT *
FROM employees e,
     salary_grade s
WHERE e.salary BETWEEN s.min_sal AND s.max_sal
  AND s.grade >
    (SELECT s.grade
     FROM employees e,
          salary_grade s
     WHERE e.salary BETWEEN s.min_sal AND s.max_sal
       AND e.emp_name = 'MARKER') ;
SELECT *
FROM employees e,
     department d,
     salary_grade s
WHERE e.dep_id= d.dep_id
  AND d.dep_location IN ('SYDNEY',
                         'PERTH')
  AND e.salary BETWEEN s.min_sal AND s.max_sal
  AND (s.grade IN
         (SELECT s.grade
          FROM employees e,
               salary_grade s
          WHERE e.salary BETWEEN s.min_sal AND s.max_sal
            AND e.emp_name = 'TUCKER')
       OR age (CURRENT_DATE,hire_date) >
         (SELECT age(CURRENT_DATE,hire_date)
          FROM employees
          WHERE emp_name = 'SANDRINE')) ;
SELECT *
FROM employees
WHERE salary IN
    (SELECT salary
     FROM employees e
     WHERE employees.emp_id <> e.emp_id);
SELECT *
FROM employees e
WHERE salary+commission IN
    (SELECT salary+commission
     FROM employees e,
          department d
     WHERE e.dep_id=d.dep_id
       AND d.dep_name = 'MARKETING'
       AND e.job_name = 'SALESMAN');
SELECT *
FROM employees
WHERE hire_date IN
    (SELECT max(hire_date)
     FROM employees
     WHERE dep_id = 3001) AND dep_id=3001;
SELECT *
FROM employees
WHERE salary =
    (SELECT max(salary)
     FROM employees e,
          department d
     WHERE e.dep_id = d.dep_id
       AND d.dep_location = 'PERTH'
       AND hire_date <
         (SELECT max(hire_date)
          FROM employees e,
               salary_grade s
          WHERE e.salary BETWEEN s.min_sal AND s.max_sal
            AND s.grade = 2));
SELECT *
FROM employees
WHERE salary IN
    (SELECT max(salary)
     FROM employees
     WHERE manager_id IN
         (SELECT emp_id
          FROM employees
          WHERE emp_name = 'KAYLING'));
SELECT e.emp_name,
       e.salary,
       e.commission
FROM employees e
WHERE
    (SELECT max(salary+commission)
     FROM employees) >= ANY
    (SELECT salary
     FROM employees);
SELECT *
FROM employees w,
     employees m
WHERE w.manager_id = m.emp_id
  AND w.salary> m.salary;

SELECT max(myavg)
FROM
  (SELECT avg(salary) myavg
   FROM employees
   WHERE job_name != 'PRESIDENT'
   GROUP BY job_name) a;
SELECT count(*)
FROM employees
WHERE emp_id IN
    (SELECT manager_id
     FROM employees);
SELECT b.dep_id,
       count(a.dep_id)
FROM department b
LEFT OUTER JOIN employees a ON a.dep_id=b.dep_id
GROUP BY b.dep_id
HAVING count(a.dep_id) = 0;
