use practice;
CREATE TABLE Employees(
    employee_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    department VARCHAR(100),
    salary DECIMAL(10, 2),
    age INT,
    experience_years INT
);
INSERT INTO Employees (first_name, last_name, department, salary, age, experience_years) VALUES
('Kabir', 'Singh', 'IT', 64000.00, 29, 5),
('Anjali', 'Kapoor', 'Finance', 78000.00, 36, 11),
('Rajesh', 'Mishra', 'HR', 60000.00, 33, 8),
('Maya', 'Dutta', 'Marketing', 72000.00, 30, 7),
('Ajay', 'Kumar', 'Operations', 83000.00, 42, 16),
('Deepa', 'Ghosh', 'IT', 66000.00, 25, 2),
('Kunal', 'Sen', 'Finance', 77000.00, 37, 12),
('Rohan', 'Sharma', 'IT', 60000.00, 28, 5),
('Priya', 'Mehta', 'Finance', 75000.00, 35, 10),
('Amit', 'Patil', 'HR', 55000.00, 30, 7),
('Sana', 'Iyer', 'Marketing', 67000.00, 27, 4),
('Vikram', 'Deshmukh', 'Operations', 80000.00, 40, 15),
('Sneha', 'Joshi', 'IT', 62000.00, 26, 3),
('Nikhil', 'Rane', 'Finance', 76000.00, 33, 8),
('Aarti', 'Bose', 'HR', 58000.00, 32, 6),
('Rahul', 'Nair', 'Marketing', 71000.00, 29, 6),
('Manish', 'Pandey', 'Operations', 85000.00, 45, 18),
('Megha', 'Kohli', 'IT', 63000.00, 27, 4),
('Anil', 'Jadhav', 'Finance', 77000.00, 34, 9),
('Neha', 'Verma', 'HR', 59000.00, 31, 7),
('Ravi', 'Saxena', 'Marketing', 69000.00, 28, 5),
('Sonal', 'Khurana', 'Operations', 82000.00, 38, 13);

CREATE TABLE Projects (
    project_id INT AUTO_INCREMENT PRIMARY KEY,
    employee_id INT,
    project_name VARCHAR(100),
    project_duration_months INT,
    budget DECIMAL(12, 2),
    FOREIGN KEY (employee_id) REFERENCES Employees(employee_id)
);
INSERT INTO Projects (employee_id, project_name, project_duration_months, budget) VALUES
(1, 'Website Development', 6, 150000.00),
(2, 'Budget Planning', 4, 90000.00),
(3, 'Recruitment Drive', 3, 50000.00),
(4, 'Digital Marketing Campaign', 5, 120000.00),
(5, 'Operational Efficiency', 8, 200000.00),
(6, 'Cloud Migration', 7, 170000.00),
(7, 'Financial Audit', 6, 95000.00),
(8, 'Employee Engagement Program', 4, 60000.00),
(9, 'Social Media Strategy', 5, 110000.00),
(10, 'Supply Chain Optimization', 9, 250000.00),
(11, 'Software Upgrade', 6, 130000.00),
(12, 'Financial Reporting System', 7, 160000.00),
(13, 'Onboarding Program', 4, 65000.00),
(14, 'Brand Awareness Campaign', 5, 105000.00),
(15, 'Logistics Management', 8, 210000.00),
(16, 'Data Analytics Implementation', 7, 175000.00),
(17, 'Customer Retention Strategy', 5, 115000.00),
(18, 'Product Launch', 6, 145000.00),
(19, 'IT Security Audit', 8, 195000.00),
(20, 'Employee Training Program', 4, 70000.00),
(21, 'Market Research', 5, 100000.00),
(22, 'Inventory Management System', 7, 165000.00);



-- 1)Select All Records: 
-- Write a SQL query to retrieve all the details of the employees in the Employees table.
select * from employees;

-- 2)Find Employees by Department:
 -- Write a query  to retrieve the first_name, last_name, and department of employees working in the IT department.
select first_name, last_name, department from employees where department = 'IT';

-- 3)Calculate the Average Salary:
-- Write a query to calculate the average salary of employees in the Finance department.
select avg(salary) as avg_salary_in_finance from employees where department= 'finance';

-- 4)Find Employees with More Than 5 Years of Experience: 
-- Write a query to find employees who have more than 5 years of experience, displaying their first_name, last_name, and experience_years.
select first_name, last_name, department from employees where experience_years > 5 group by department, first_name, last_name;

-- 5)Retrieve the Employee with the Highest Salary: -- 
-- Write a SQL query to find the employee with the highest salary in the Employees table.
 select max(salary) from employees;
 -- OR 
 select first_name, last_name, salary from employees 
 order by salary desc
 limit 1;
 
 -- 6)Count the Number of Employees in Each Department: 
 -- Write a SQL query to count the number of employees in each department.
 select department, count(*) 
 as COUNT_OF_EMPLOYEES from employees 
 group by department;
 
 -- 7)Find Employees Aged Between 25 and 35:
 -- Write a query to retrieve the names and ages of employees who are between 25 and 35 years old.
 select first_name, last_name, age from employees
 where age between 25 and 35;
 
 
 -- 8)Find Employees with a Salary Greater than the Average Salary:
 -- Write a query to find employees whose salary is greater than the average salary of all employees.
 select first_name, last_name from employees where salary>(select avg(salary) from employees);
 
-- 9)Find Employees with the Maximum Salary in Each Department:
-- Write a query to find the employee(s) with the maximum salary in each department.
select first_name, last_name, department,salary from employees where salary>
(select max(salary) from employees group by department);

-- 10)List Employees Who Earn More Than the Average Salary in Their Department: 
-- Write a query to find employees whose salary is greater than the average salary of their respective department.
select first_name, last_name, salary from employees 
where salary>(select avg(salary) from employees group by department);

-- 11)Find Departments with Fewer Than 3 Employees: 
-- Write a query to find departments where the number of employees is fewer than 3.
select department, count(*) from employees group by department having count(*)>2;

-- 12)List Employees in Departments with an Average Salary Greater Than $70,000:
--  Write a query to find employees working in departments where the average salary is greater than $70,000.
select first_name, last_name, department from employees 
where department in(select department from employees 
group by department
having avg(salary)>70000);

-- 13)Find the Oldest Employee in the IT Department: 
-- Write a query to find the oldest employee in the IT department.
select first_name, last_name from employees
where department ="IT"
and
age=(select max(age) from employees where department = 'IT');

-- 14) Inner Join Questions
-- List All Employees with Their Projects:
-- Write a query to display the first name, last name, project name, and budget of all employees who are assigned to projects.
SELECT 
    e.first_name, 
    e.last_name, 
    p.project_name, 
    p.budget 
FROM 
    Employees e 
INNER JOIN 
    Projects p ON e.employee_id = p.employee_id;
    
-- 15) Count of Projects per Department:
-- Create a query that counts the number of projects each department is involved in.
SELECT 
    e.department, 
    COUNT(p.project_id) AS project_count 
FROM 
    Employees e 
INNER JOIN 
    Projects p ON e.employee_id = p.employee_id 
GROUP BY 
    e.department;
    
-- 16) Left Join Questions
-- List Employees Without Projects:
-- Write a query to list all employees and their assigned projects, including those 
-- employees who do not have any projects assigned. Show 'No Project' for employees without projects.
select 
e.first_name,
e.last_name,
coalesce(p.project_name,'NO_PROJECT') as project_name
from employees e
left join
projects p on e.employee_id = p.employee_id;

-- 17) Right Join Questions
-- List All Projects with Employee Details:
-- Write a query to list all projects along with employee details. Include projects that may not have an assigned employee.
SELECT 
    e.first_name, 
    e.last_name, 
    p.project_name 
FROM 
    Projects p 
RIGHT JOIN 
    Employees e ON p.employee_id = e.employee_id;

-- 18) Find employees who are working on projects with a budget greater than ₹150,000
SELECT e.first_name, e.last_name, p.project_name, p.budget
FROM Employees e
JOIN Projects p ON e.employee_id = p.employee_id
WHERE p.budget > 150000.00;

-- Get the list of employees in the IT department and their assigned projects
SELECT e.first_name, e.last_name, p.project_name, p.budget
FROM Employees e
JOIN Projects p ON e.employee_id = p.employee_id
WHERE e.department = 'IT';

-- 20) Show all employees who have not been assigned a project
SELECT e.first_name, e.last_name
FROM Employees e
LEFT JOIN Projects p ON e.employee_id = p.employee_id
WHERE p.project_id IS NULL;

-- 21) Get the average project budget for each department
SELECT e.department, AVG(p.budget) AS avg_budget
FROM Employees e
JOIN Projects p ON e.employee_id = p.employee_id
GROUP BY e.department;




