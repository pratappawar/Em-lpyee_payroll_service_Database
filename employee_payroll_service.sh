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
