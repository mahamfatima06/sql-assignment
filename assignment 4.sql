create database Records;
Use Records;          

--- Assignment of  DATABASE MANAGEMENT SYSTEM ----

---Question no 1  Create a table Employee with the following columns.  ---

create table Employee (
Emp_Id int PRIMARY KEY,
Emp_Name varchar(100),
Dept_Id int,
Designation varchar(100),
DOB DATE,
Salary int,
Gender varchar(100),
FOREIGN KEY (Dept_Id) REFERENCES Departmennt(DeptId)
);

insert into Employee(Emp_Id, Emp_Name, Dept_Id, Designation,DOB,Salary,Gender) values (1, 'zain', 10, 'Sales Manager', '2016-01-20', 55000, 'Male'),
(2, 'Haya', 20, 'Marketing Executive', '2017-02-17', 45000, 'Female'),
(3, 'Zunaira', 30, 'Production Manager', '2018-03-25', 60000, 'Female'),
(4, 'Aliyan', 40, 'HR Executive', '2019-04-10', 40000, 'Male'),
(5, 'Osama', 50, 'Purchasing Manager', '2020-05-03', 50000, 'Male'),
(6, 'Maham', 60, 'Research & Development', '2021-06-06', 65000, 'Female'),
(7, 'Asad', 70, 'Accountant', '2022-07-16', 47000, 'Male');


---Question no 2 Create a table Department with the following columns--

Create table Departmennt(
DeptId int primary key,
DeptName varchar (100),
Location varchar (100)
);

---Question no 3 Write a sql query to insert the details of 7 departments into the department table---

insert into Departmennt(DeptId, DeptName, Location) values ('10','Sales','Hyderabad'),
('20', 'Marketing', 'Bombay'),  ('30', 'Production', 'Kolkatta'), ('40', 'Human Resource','Pune'),       
('50', 'Purchases', 'Delhi'),('60', 'Research & Development', 'Bengaluru'),('70', 'Accounts', 'Chennai');

---Question no 4 Write a sql query to insert the details of employees for each of the departments.---

insert into Employee(Emp_Id, Emp_Name, Dept_Id, Designation,DOB,Salary,Gender) values (1, 'zain', 10, 'Sales Manager', '2016-01-20', 55000, 'Male'),
(2, 'Haya', 20, 'Marketing Executive', '2017-02-17', 45000, 'Female'),
(3, 'Zunaira', 30, 'Production Manager', '2018-03-25', 60000, 'Female'),
(4, 'Aliyan', 40, 'HR Executive', '2019-04-10', 40000, 'Male'),
(5, 'Osama', 50, 'Purchasing Manager', '2020-05-03', 50000, 'Male'),
(6, 'Maham', 60, 'Research & Development', '2021-06-06', 65000, 'Female'),
(7, 'Asad', 70, 'Accountant', '2022-07-16', 47000, 'Male');

---Question no 5 Write a sql query to insert the details of two new departments.---

insert into Departmennt (DeptId ,DeptName, Location) values
(80,'Sales Executive', 'Canada'),
(90,'Manager', 'Dubai');

---Question no 6 Write a sql query to add a new column to the Employee table HireDate/date---

alter table Employee add HireDate date;

alter table Employee add HireTime date;


---Question no 7 Write a sql query to alter the data type of the column salary to float.---

alter table Employee alter column Salary float;

---Question no 8 Write a sql query to display the details of all the departments.---

select * from Departmennt;

---Question no 9 Write a sql query to display the details of all the employees.---

select * from Employee;

---Question no 10 Write a sql query to display the details of all the employees along with the information of departments.---

select e.* , d.DeptName, d.Location from Employee e join Departmennt d ON e.Dept_Id = d.DeptId;


---Question no 11 Write a sql query to display the details of all the employees with the employee names appearing in upper case and the designation appearing in lower case.---

select Emp_Id, UPPER(Emp_Name) as EmpName, Dept_Id, LOWER(Designation) aS Designation, DOB, Salary, Gender from Employee;

---Question no 12 Write a sql query to display the details of all the employees along with their Age.---

select Emp_Id, Emp_Name, Dept_Id, Designation, DOB, Salary, Gender as Age from Employee;

alter table Employee add Age int;

update Employee set Age = 22 where Emp_Id  = 1;
update Employee set Age = 23 where Emp_Id  = 2;
update Employee set Age = 24 where Emp_Id  = 3;
update Employee set Age = 25 where Emp_Id  = 4;
update Employee set Age = 26 where Emp_Id  = 5;
update Employee set Age = 27 where Emp_Id  = 6;
update Employee set Age = 28 where Emp_Id  = 7;

---Question no 13 Write a sql query to display the details of all the employees who are not managers.---

select * from Employee where Designation NOT LIKE '%Manager%';


---Question no 14 Write a sql query to display the details of all the employees in the order of their joining date.---

select * from Employee ORDER BY HireDate;

update Employee set HireDate = '2023-02-12' where Emp_Id  = 1;
update Employee set HireDate = '2022-04-02' where Emp_Id  = 2;
update Employee set HireDate = '2027-03-10' where Emp_Id  = 3;
update Employee set HireDate = '2020-02-04' where Emp_Id  = 4;
update Employee set HireDate = '2024-02- 07' where Emp_Id  = 5;
update Employee set HireDate = '2025-02-11' where Emp_Id  = 6;
update Employee set HireDate = '2026-02-07' where Emp_Id  = 7;

---Question no 15 Write a sql query to display details of all the employees of the Accounts and Purchases departments..---

select * from Employee where Dept_Id IN (50, 70);
select * from Employee where Dept_Id IN (30, 60);


---Question no 16 Write a sql query to display the details of all the employees whose salary is greater than Rs. 10,000---

select * from Employee where Salary > 10000;

---Question no 17 Write a sql query to display the details of all the employees whose salary lies between Rs. 50,000 and Rs.1,00,000.--

select * from Employee where Salary BETWEEN 50000 AND 100000;

---Question no 18 Write a sql query to display the details of all the employees who fall into the manager designation.---

select * from Employee where Designation LIKE '%Manager%';

---Question no 19 Write a sql query to display the details of all the departments along with the count of number of employees of each department.---

select d.DeptId, d. DeptName, d.Location, COUNT(e.Emp_Id) as EmployeeCount from Departmennt d LEFT JOIN Employee e ON d.DeptId = e.Dept_Id GROUP BY d.DeptId, d.DeptName, d.Location;

---Question no 20 Write a sql query to calculate the average salary of an employee in each of the departments..---

select d.DeptId, d.DeptName, avg(e.Salary) as AvgSalary from Departmennt d LEFT JOIN Employee e on d.DeptId = e.Dept_Id group by d.DeptId, d.DeptName;

---Question no 21 WWrite a sql query to get the details of the employees with maximum and minimum salary of each of the departments...---

select e1.* from Employee e1 JOIN (select Dept_Id, max(Salary) as MaxSalary, min(Salary) as MinSalary from Employee group by Dept_Id) e2 on e1.Dept_Id = e2.Dept_Id AND (e1.Salary = e2.MaxSalary OR e1.Salary = e2.MinSalary);

---Question no 22 Write a query to display the details of all the employees whose salary is greater than the average salary of an employee in the company..--

select * from Employee where Salary > (SELECT AVG(Salary) from Employee);

---Question no 23 Write a sql query to display the details of all the employees whose name starts with the letter ‘A’.--

select * from Employee where Emp_Name LIKE 'A%';

---Question no 24 Write a sql query to display the details of all the employees whose age is greater than 40 years.--

select * from Employee where age < 40 ;

---Question no 25 Write a sql query to display the details of all the employees who have joined in the current year..--

SELECT * FROM Employee WHERE HireDate LIKE '2024%' OR HireDate LIKE '2022%';

---Question no 26 Write a sql query to display the details of all the female employees.---

select * from Employee where Gender = 'Female';

---Question no 27 Write a sql query to display the details of all the female employees whose salary is greater than Rs. 50,000..--

select * from Employee where Gender = 'Female' AND Salary > 50000;

---Question no 28 Write a sql query to display the details of all the employees who does not belong to the Accounts and Human Resource department.---

select * from Employee where Dept_Id NOT IN (40, 70);

---Question no 29 Write a sql query to display the details of all the employees whose name is of length greater than 5 and less than 10.---

SELECT * FROM Employee WHERE LEN(Emp_Name) > 5 AND LEN(Emp_Name) < 10;


---Question no 30 Write a sql query to update the salary of all the employees whose salary is less than 25,000 by 10%..---

UPDATE Employee set Salary = Salary * 1.10 where Salary < 25000;

---Question no 31 Write a sql query to update the salary of all the employees of the Marketing Department..--

UPDATE Employee set Salary = Salary * 1.10 where Dept_Id = 20;

---Question no 32 Write a sql query to update the value of commission based on the salary of the employee.--

UPDATE Employee
SET Salary = CASE 
    WHEN Salary < 10000 THEN Salary * 0.05
    WHEN Salary BETWEEN 10000 AND 50000 THEN Salary * 0.10
    ELSE Salary * 0.15
END;

---Question no 33 Write a sql query to find out the number of bonus shares for which an employee is eligible where the company has declared bonus based the years of experience in the company by the following scheme

SELECT *, 
       HireDate, 
       DATEDIFF(YEAR, HireDate, GETDATE()) AS Experience_Years,
       CASE
           WHEN DATEDIFF(YEAR, HireDate, GETDATE()) < 1 THEN 0
           WHEN DATEDIFF(YEAR, HireDate, GETDATE()) BETWEEN 1 AND 3 THEN 100
           WHEN DATEDIFF(YEAR, HireDate, GETDATE()) BETWEEN 3 AND 5 THEN 200
           ELSE 0 
       END AS Bonus_Shares
FROM Employee;












