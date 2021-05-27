echo "Welcome to Employee PayRoll Service"

#UC1

mysql> create database payroll_service;
Query OK, 1 row affected (0.01 sec)

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| payroll_service    |
| performance_schema |
| sakila             |
| sys                |
| world              |
+--------------------+
7 rows in set (0.01 sec)

mysql> use payroll_service;
Database changed
mysql> select database();
+-----------------+
| database()      |
+-----------------+
| payroll_service |
+-----------------+
1 row in set (0.00 sec)
------------------------------------------------------------------------------------------------

#UC2:create a employee payroll table in the payroll service database to manage employee payrolls.

mysql> create table employee_payroll
    -> (
    ->    id          int unsigned not null auto_increment,
    ->    name        varchar(150) not null,
    ->    salary      double not null,
    ->    start       date not null,
    ->    primary key (id)
    -> );
Query OK, 0 rows affected (0.04 sec)

mysql> describe employee_payroll;
+--------+--------------+------+-----+---------+----------------+
| Field  | Type         | Null | Key | Default | Extra          |
+--------+--------------+------+-----+---------+----------------+
| id     | int unsigned | NO   | PRI | NULL    | auto_increment |
| name   | varchar(150) | NO   |     | NULL    |                |
| salary | double       | NO   |     | NULL    |                |
| start  | date         | NO   |     | NULL    |                |
+--------+--------------+------+-----+---------+----------------+
4 rows in set (0.01 sec)
------------------------------------------------------------------------------------------------

#UC3: CURD Operation - Use payroll_service database

mysql> insert into employee_payroll (name,salary,start) values
    ->     ('Bill',1000000.00,'2018-01-03'),
    ->     ('Terisa',2000000.00,'2019-11-13'),
    ->     ('Charlie',3000000.00,'2020-05-21');
Query OK, 3 rows affected (0.01 sec)
Records: 3  Duplicates: 0  Warnings: 0

-------------------------------------------------------------------------------------------------

#UC4: Retrieve all the records of Employee Payroll service table

mysql> select * from employee_payroll;
+----+---------+---------+------------+
| id | name    | salary  | start      |
+----+---------+---------+------------+
|  1 | Bill    | 1000000 | 2018-01-03 |
|  2 | Terisa  | 2000000 | 2019-11-13 |
|  3 | Charlie | 3000000 | 2020-05-21 |
+----+---------+---------+------------+
3 rows in set (0.00 sec)
-------------------------------------------------------------------------------------------------
#UC5:  Ability to retrieve salary data for a particular employee as well as all employees who have
      #joined in a particular data range from the payroll service database

mysql> select salary from employee_payroll
    -> where name='Bill';
+---------+
| salary  |
+---------+
| 1000000 |
+---------+
1 row in set (0.00 sec)

mysql> select*from employee_payroll
    ->       where start between cast('2019-01-01' as date) and date(now());
+----+---------+---------+------------+
| id | name    | salary  | start      |
+----+---------+---------+------------+
|  2 | Terisa  | 2000000 | 2019-11-13 |
|  3 | Charlie | 3000000 | 2020-05-21 |
+----+---------+---------+------------+
2 rows in set (0.00 sec)
-------------------------------------------------------------------------------------------------------

#UC6: Add Gender to Employee Payroll Table and Update the Rows to reflect the correct Employee Gender

mysql> ALTER TABLE employee_payroll ADD gender char(1) AFTER name;
Query OK, 0 rows affected (0.09 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> describe employee_payroll;
+--------+--------------+------+-----+---------+----------------+
| Field  | Type         | Null | Key | Default | Extra          |
+--------+--------------+------+-----+---------+----------------+
| id     | int unsigned | NO   | PRI | NULL    | auto_increment |
| name   | varchar(150) | NO   |     | NULL    |                |
| gender | char(1)      | YES  |     | NULL    |                |
| salary | double       | NO   |     | NULL    |                |
| start  | date         | NO   |     | NULL    |                |
+--------+--------------+------+-----+---------+----------------+
5 rows in set (0.01 sec)

mysql> update employee_payroll set gender ='F' where name='Terisa';
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select*from employee_payroll;
+----+---------+--------+---------+------------+
| id | name    | gender | salary  | start      |
+----+---------+--------+---------+------------+
|  1 | Bill    | NULL   | 1000000 | 2018-01-03 |
|  2 | Terisa  | F      | 2000000 | 2019-11-13 |
|  3 | Charlie | NULL   | 3000000 | 2020-05-21 |
+----+---------+--------+---------+------------+
3 rows in set (0.00 sec)

mysql> update employee_payroll set gender ='M' where name='Bill' or name='Charlie';
Query OK, 2 rows affected (0.01 sec)
Rows matched: 2  Changed: 2  Warnings: 0

mysql> select*from employee_payroll;
+----+---------+--------+---------+------------+
| id | name    | gender | salary  | start      |
+----+---------+--------+---------+------------+
|  1 | Bill    | M      | 1000000 | 2018-01-03 |
|  2 | Terisa  | F      | 2000000 | 2019-11-13 |
|  3 | Charlie | M      | 3000000 | 2020-05-21 |
+----+---------+--------+---------+------------+
3 rows in set (0.00 sec)

mysql> update employee_payroll set salary=3000000.00 where name='Terisa';
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select*from employee_payroll;
+----+---------+--------+---------+------------+
| id | name    | gender | salary  | start      |
+----+---------+--------+---------+------------+
|  1 | Bill    | M      | 1000000 | 2018-01-03 |
|  2 | Terisa  | F      | 3000000 | 2019-11-13 |
|  3 | Charlie | M      | 3000000 | 2020-05-21 |
+----+---------+--------+---------+------------+
3 rows in set (0.00 sec)
------------------------------------------------------------------------------------------------
#UC7:Use Function avg,max,sum,count,min 

mysql> select gender,avg(salary) gender from employee_payroll group by gender;
+--------+---------+
| gender | gender  |
+--------+---------+
| M      | 2000000 |
| F      | 3000000 |
+--------+---------+
2 rows in set, 1 warning (0.00 sec)


mysql> select gender,avg(salary) from employee_payroll where gender='M' group by gender;
+--------+-------------+
| gender | avg(salary) |
+--------+-------------+
| M      |     2000000 |
+--------+-------------+
1 row in set (0.01 sec)


mysql> select name,min(salary) gender from employee_payroll group by gender;
+--------+---------+
| name   | gender  |
+--------+---------+
| Bill   | 1000000 |
| Terisa | 3000000 |
+--------+---------+
2 rows in set, 1 warning (0.01 sec)

mysql> select gender,max(salary) gender from employee_payroll group by gender;
+--------+---------+
| gender | gender  |
+--------+---------+
| M      | 3000000 |
| F      | 3000000 |
+--------+---------+
2 rows in set, 1 warning (0.00 sec)


mysql> select count(*) from employee_payroll;
+----------+
| count(*) |
+----------+
|        3 |
+----------+
1 row in set (0.01 sec)


mysql> select gender,sum(salary) gender from employee_payroll group by gender;
+--------+---------+
| gender | gender  |
+--------+---------+
| M      | 4000000 |
| F      | 3000000 |
+--------+---------+
2 rows in set, 1 warning (0.00 sec)
-------------------------------------------------------------------------------------------------
