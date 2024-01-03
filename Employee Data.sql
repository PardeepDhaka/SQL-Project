create database adva4;

use adva4;
create table employees(
EmpId int,
EmpFname varchar,
EmpLname varchar,
Department varchar,
Project varchar,
Address varchar,
DOB date,
Gender varchar);

USE adva4;

-- Altering the table to change data types
ALTER TABLE employees
ALTER COLUMN EmpFname VARCHAR(50); -- Change the size as needed
ALTER TABLE employees
ALTER COLUMN Department VARCHAR(50);
ALTER TABLE employees
ALTER COLUMN Project VARCHAR(50);
ALTER TABLE employees
ALTER COLUMN address VARCHAR(50);
ALTER TABLE employees
ALTER COLUMN Gender VARCHAR(50);
ALTER TABLE employees
ALTER COLUMN EmpLname VARCHAR(50); -- Change the size as needed


select * from employees;

insert into employees(EmpId,EmpFname,EmpLname,
Department,Project,Address,DOB,Gender)
values
(1,'Sanjay','Mehra','HR','P1','Hyderabad(HYD)','1976-12-01','M'),
(2,'Ananya','Mishra','Admin','P2','Delhi(DEL)','1968-05-02','F'),
(3,'Rohan','Diwan','Account','P3','Mumbai(BOM)','1980-01-01','M'),
(4,'Sonia','kulkarni','HR','P1','Hyderabad(HYD)','1992-05-02','F'),
(5,'Ankit','Kapoor','Admin','P2','Hyderabad(HYD)','1994-07-03','M')
;

create table employeePosition(
EmpId int,
EmpPosition varchar,
DateOfJoining date,
Salary int
);
ALTER TABLE employeePosition
ALTER COLUMN EmpPosition VARCHAR(50);

select * from employeePosition;

insert into employeePosition(EmpId,EmpPosition,DateOfJoining,Salary)
values
(1,'Manager','2022-05-01','500000'),
(2,'Executive','2022-05-02','75000'),
(3,'Manager','2022-05-01','90000'),
(2,'Lead','2022-05-02','85000'),
(1,'Executive','2022-05-01','300000');


select upper(EmpFname) as EmpName from employees;

select Department,count(*) as num from employees
where Department='HR'
group by Department;

/*select sysdate() as currentdate;*/
SELECT GETDATE() AS currentdate;


SELECT SUBSTRING(EmpLname, 1, 4) AS FirstFourChars
FROM Employees;

/*SELECT SUBSTRING_INDEX(Address, '(', 1) AS PlaceName
FROM Employees;*/

SELECT 
    CASE 
        WHEN CHARINDEX('(', Address) > 0
        THEN SUBSTRING(Address, 1, CHARINDEX('(', Address) - 1)
        ELSE Address
    END AS PlaceName
FROM Employees;


/*Write a query to create a new table that consists of data and
 structure copied from the other table.*/
 
 select EmpFname from employees es
 inner join employeePosition ep on es.empId = ep.EmpId
where salary between '50000' and '100000';
 
 
SELECT EmpFname
FROM employees
WHERE EmpFname LIKE 'S%';


/*Write a query to fetch top N records.*/
SELECT top 5*
FROM employees
order by empId asc
/*limit 5;*/


select empFname, empLname,
 coalesce(concat(empFname,' ', empLname),'unknown') as full_name
 from employees;


SELECT EmpFname,gender, COUNT(*) AS count
FROM employees
WHERE DOB BETWEEN '1970-05-02' AND '1975-12-31'
GROUP BY empFname,Gender;

select * from employees
order by empFname desc,department asc;

select empLname from employees
where empLname like '%a' ;

SELECT *
FROM Employees
WHERE EmpFname NOT IN ('Sanjay', 'Sonia');

select * from employees 
where address = 'delhi(del)';

select * from employees es
inner join employeeposition ep
on es.empId = ep.empId
where empPosition = 'Manager';

SELECT *
FROM Employees Es
JOIN EmployeePosition EP ON Es.EmpId = EP.EmpId
WHERE EP.DateOfJoining IS NOT NULL;

SELECT DISTINCT top 2 Salary
FROM EmployeePosition
ORDER BY Salary DESC;
/*LIMIT 2;*/

select * from employees 
where empId %2 = 0;

select * from employees 
where empId %2 <> 0;


select * from employees es
inner join employeeposition ep on es.empId = ep.empid
where DOB is not null;

SELECT DISTINCT Salary
FROM EmployeePosition EP1
WHERE 3 = (
    SELECT COUNT(DISTINCT Salary)
    FROM EmployeePosition EP2
    WHERE EP2.Salary >= EP1.Salary
);

SELECT project, COUNT(*)
FROM employees
GROUP BY project
HAVING COUNT(*) >= 1;

SELECT e1.EmpId, e1.EmpFname, e1.Department, e2.EmpId
 AS ColleagueId, e2.EmpFname AS ColleagueName
FROM employees e1
JOIN employees e2 ON e1.Department = e2.Department
WHERE e1.EmpId <> e2.EmpId
ORDER BY e1.Department, e1.EmpId, e2.EmpId;

select * from employees
order by empId desc
limit 3;

SELECT DISTINCT Salary
FROM EmployeePosition EP1
WHERE 3 = (
    SELECT COUNT(DISTINCT Salary)
    FROM EmployeePosition EP2
    WHERE EP2.Salary >= EP1.Salary
);

/*Write a query to display the first and the last record from
 the EmployeeInfo table.

 Write a query to add email validation to your database*/


/*Write a query to fetch 50% records from the EmployeeInfo table.

SELECT *
FROM Employees
LIMIT (SELECT COUNT(*) * 0.5 FROM Employees);*/

SELECT TOP (SELECT CEILING(COUNT(*) * 0.5) FROM Employees) *
FROM Employees;


SELECT *
FROM Employees
LIMIT ROUND((SELECT COUNT(*) FROM Employees) * 0.5);







