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
