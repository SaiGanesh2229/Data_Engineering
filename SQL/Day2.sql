use companydb
CREATE TABLE Employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(255),
    department VARCHAR(255),
    manager_id INT
);

CREATE TABLE Salaries (
    salary_id INT PRIMARY KEY,
    employee_id INT,
    salary DECIMAL(10, 2),
    salary_date DATE,
    FOREIGN KEY (employee_id) REFERENCES Employees(employee_id)
);

INSERT INTO Employees (employee_id, employee_name, department, manager_id) VALUES
(1, 'John Doe', 'HR', NULL),
(2, 'Jane Smith', 'Finance', 1),
(3, 'Robert Brown', 'Finance', 1),
(4, 'Emily Davis', 'Engineering', 2),
(5, 'Michael Johnson', 'Engineering', 2);

INSERT INTO Salaries (salary_id, employee_id, salary, salary_date) VALUES
(1, 1, 5000, '2024-01-01'),
(2, 2, 6000, '2024-01-15'),
(3, 3, 5500, '2024-02-01'),
(4, 4, 7000, '2024-02-15'),
(5, 5, 7500, '2024-03-01');

-- Equi Join
select employee_name, department, salary, salary_date
from Employees 
join Salaries on Employees.employee_id = Salaries.employee_id;

-- Self Join
select e1.employee_name as Employee, e2.employee_name as manager from Employees e1 
left join Employees e2 on e1.manager_id=e2.employee_id

-- Group by with Having
select e.department, AVG(s.salary) as average_salary
from Employees e
join Salaries s on e.employee_id = s.employee_id
group by e.department
having avg(S.salary) >= 6000;

-- Group by with grouping sets
select e.department, sum(s.salary) as total_salary
from Employees e
join salaries s on e.employee_id = s.employee_id
group by grouping sets((e.department),());

-- SubQuery
select e.employee_name, s.salary
from Employees e
join Salaries s on e.employee_id = s.employee_id
where S.salary > (select avg(salary) from Salaries);

-- Exists
select E.employee_name
from Employees E
where exists (
    select 1 from Salaries S where S.employee_id = E.employee_id
    and S.salary_date >= '2024-01-01'
    and S.salary_date < '2025-01-01'
);

-- Any 
select e.employee_name, s.salary
from Employees e
join Salaries s on e.employee_id = s.employee_id
where s.salary > any (
    select s2.salary
    from Employees e2
    join Salaries s2 on e2.employee_id = s2.employee_id
    where e2.department = 'Engineering'
);

-- All
select e.employee_name, s.salary
from Employees e
join Salaries s on e.employee_id = s.employee_id
where s.salary > all (
    select s2.salary
    from Employees e2
    join Salaries s2 on e2.employee_id = s2.employee_id
    where e2.department = 'Finance'
);

-- Nested SubQueries
select e.employee_name, s.salary
from employees e
join salaries s on e.employee_id = s.employee_id
where s.salary > (
    select avg(s2.salary)
    from salaries s2
    where s2.employee_id in (
        select e2.employee_id
        from employees e2
        where e2.department = 'hr'
    )
);

-- Correlated SubQueries
select e.employee_name, s.salary
from employees e
join salaries s on e.employee_id = s.employee_id
where s.salary > (
    select avg(s2.salary)
    from employees e2
    join salaries s2 on e2.employee_id = s2.employee_id
    where e2.department = e.department
);

-- Union
select employee_name from employees
where department = 'hr'
union
select employee_name from employees
where department = 'finance';

-- Intersect
select employee_name from employees
where department = 'finance'
intersect
select employee_name from employees
where department = 'engineering';

-- Except
select employee_name from employees
where department = 'finance'
except
select employee_name from employees
where department = 'hr';

-- Merge
create table salaryrevisions (
    employee_id int,
    new_salary decimal(10, 2)
);

insert into salaryrevisions (employee_id, new_salary) values
(1, 5500),
(2, 6200),
(6, 7800);
merge into salaries as target
using salaryrevisions as source
on target.employee_id = source.employee_id
when matched then 
    update set target.salary = source.new_salary
when not matched by target then
    insert (salary_id, employee_id, salary, salary_date)
    values ((select isnull(max(salary_id), 0) + 1 from salaries),
        source.employee_id, 
        source.new_salary, getdate());
