/*
CREATE DATABASE IF NOT EXISTS db_subqueries;
USE db_subqueries;

-- Create the Customers table
CREATE TABLE Customers (
  customer_id INT PRIMARY KEY,
  customer_name VARCHAR(100),
  email VARCHAR(100),
  phone VARCHAR(20)
);


-- Insert records into the Customers table
INSERT INTO Customers (customer_id, customer_name, email, phone)
VALUES
  (101, 'John Smith', 'john@example.com', '123-456-7890'),
  (102, 'Mary Johnson', 'mary@example.com', '987-654-3210'),
  (103, 'Robert Davis', 'robert@example.com', '555-555-5555'),
  (104, 'Emily Johnson', 'emily@example.com', '555-123-4567'),
  (105, 'Michael Brown', 'michael@example.com', '987-654-9876');


-- Create the Products table
CREATE TABLE Products (
  product_id INT,
  product_name VARCHAR(50),
  unit_price DECIMAL(8, 2),
  description VARCHAR(100)
);

-- Insert records into the Products table
INSERT INTO Products (product_id, product_name, unit_price, description)
VALUES
  (201, 'Product A', 9.99, 'Description of Product A'),
  (202, 'Product B', 14.99, 'Description of Product B'),
  (203, 'Product C', 19.99, 'Description of Product C'),
  (204, 'Product D', 12.99, 'Description of Product D'),
  (205, 'Product E', 7.99, 'Description of Product E'),
  (206, 'Product F', 24.99, 'Description of Product F'),
  (207, 'Product G', 11.99, 'Description of Product G'),
  (208, 'Product H', 16.99, 'Description of Product H'),
  (209, 'Product I', 13.99, 'Description of Product I'),
  (210, 'Product J', 8.99, 'Description of Product J'),
  (211, 'Product K', 17.99, 'Description of Product K'),
  (212, 'Product L', 22.99, 'Description of Product L'),
  (213, 'Product M', 10.99, 'Description of Product M');

-- Create the Customer Product Pairs table
CREATE TABLE CP_Pairs (
  customer_id INT,
  product_id INT
);

-- Insert records into the Customer Product Pairs table
INSERT INTO CP_Pairs (customer_id, product_id)
VALUES
  (101, 201),
  (101, 203),
  (101, 205),
  (102, 207),
  (102, 209),
  (102, 211),
  (103, 213),
  (103, 202),
  (103, 204),
  (104, 206),
  (104, 208),
  (104, 210),
  (105, 212);

-- Create the Sales table
CREATE TABLE Sales (
  order_id INT,
  customer_id INT,
  product_id INT,
  order_date DATE,
  quantity INT,
  unit_price DECIMAL(8, 2),
  discount DECIMAL(5, 2),
  total_price DECIMAL(10, 2),
  payment_status VARCHAR(20),
  shipping_address VARCHAR(100)
);

-- Insert the records into the Sales table
INSERT INTO Sales (order_id, customer_id, product_id, order_date, quantity, unit_price, discount, total_price, payment_status, shipping_address)
VALUES
  (1, 101, 201, '2023-01-01', 2, 10.99, 0.10, 19.78, 'Paid', '123 Main St, Mumbai'),
  (2, 102, 202, '2023-01-01', 1, 15.99, 0.20, 12.79, 'Paid', '456 Elm St, Delhi'),
  (3, 103, 203, '2023-01-01', 4, 5.99, 0.05, 22.75, 'Paid', '789 Oak St, Bangalore'),
  (4, 102, 204, '2023-01-02', 3, 8.99, 0.15, 25.61, 'Pending', '456 Elm St, Delhi'),
  (5, 101, 205, '2023-01-02', 2, 12.99, 0.10, 23.38, 'Paid', '123 Main St, Mumbai'),
  (6, 103, 206, '2023-01-03', 1, 9.99, 0.05, 9.49, 'Paid', '789 Oak St, Bangalore'),
  (7, 101, 207, '2023-01-04', 5, 7.99, 0.10, 35.96, 'Paid', '123 Main St, Mumbai'),
  (8, 102, 208, '2023-01-06', 2, 14.99, 0.15, 25.48, 'Paid', '456 Elm St, Delhi'),
  (9, 103, 209, '2023-01-06', 3, 11.99, 0.10, 32.37, 'Pending', '789 Oak St, Bangalore'),
  (10, 101, 210, '2023-01-07', 1, 6.99, 0.05, 6.64, 'Paid', '123 Main St, Mumbai'),
  (11, 102, 201, '2023-01-07', 2, 13.99, 0.10, 27.98, 'Paid', '456 Elm St, Delhi'),
  (12, 103, 202, '2023-01-07', 3, 9.99, 0.15, 26.97, 'Paid', '789 Oak St, Bangalore'),
  (13, 101, 203, '2023-01-07', 1, 8.99, 0.05, 8.54, 'Paid', '123 Main St, Mumbai'),
  (14, 102, 204, '2023-01-09', 4, 7.99, 0.10, 31.96, 'Paid', '456 Elm St, Delhi'),
  (15, 103, 205, '2023-01-09', 2, 11.99, 0.15, 21.58, 'Paid', '789 Oak St, Bangalore'),
  (16, 101, 206, '2023-01-09', 3, 6.99, 0.15, 18.86, 'Paid', '123 Main St, Mumbai'),
  (17, 102, 207, '2023-01-12', 1, 12.99, 0.05, 12.34, 'Paid', '456 Elm St, Delhi'),
  (18, 103, 208, '2023-01-12', 2, 10.99, 0.10, 19.78, 'Paid', '789 Oak St, Bangalore'),
  (19, 101, 209, '2023-01-12', 4, 9.99, 0.20, 39.96, 'Paid', '123 Main St, Mumbai'),
  (20, 102, 210, '2023-01-15', 1, 5.99, 0.05, 5.69, 'Pending', '456 Elm St, Delhi'),
  (21, 103, 201, '2023-01-15', 3, 7.99, 0.15, 22.75, 'Paid', '789 Oak St, Bangalore'),
  (22, 101, 202, '2023-01-15', 2, 14.99, 0.10, 27.98, 'Paid', '123 Main St, Mumbai'),
  (23, 102, 203, '2023-01-16', 1, 9.99, 0.05, 9.49, 'Paid', '456 Elm St, Delhi'),
  (24, 103, 204, '2023-01-16', 5, 11.99, 0.10, 53.96, 'Paid', '789 Oak St, Bangalore'),
  (25, 101, 201, '2023-01-20', 3, 8.99, 0.15, 25.61, 'Pending', '123 Main St, Mumbai'),
  (26, 102, 202, '2023-01-20', 2, 12.99, 0.10, 23.38, 'Paid', '456 Elm St, Delhi'),
  (27, 103, 203, '2023-01-21', 1, 9.99, 0.05, 9.49, 'Paid', '789 Oak St, Bangalore'),
  (28, 101, 204, '2023-01-21', 4, 7.99, 0.10, 31.96, 'Paid', '123 Main St, Mumbai'),
  (29, 102, 209, '2023-01-21', 2, 13.99, 0.15, 27.98, 'Paid', '456 Elm St, Delhi'),
  (30, 103, 210, '2023-01-21', 3, 9.99, 0.15, 26.97, 'Paid', '789 Oak St, Bangalore'),
  (31, 101, 203, '2023-01-22', 1, 8.99, 0.05, 8.54, 'Paid', '123 Main St, Mumbai'),
  (32, 102, 205, '2023-01-25', 2, 7.99, 0.10, 15.18, 'Paid', '456 Elm St, Delhi'),
  (33, 103, 202, '2023-01-26', 4, 12.99, 0.15, 55.86, 'Paid', '789 Oak St, Bangalore'),
  (34, 101, 204, '2023-01-26', 3, 10.99, 0.15, 29.68, 'Paid', '123 Main St, Mumbai'),
  (35, 102, 205, '2023-01-26', 2, 8.99, 0.05, 17.08, 'Paid', '456 Elm St, Delhi'),
  (36, 103, 206, '2023-01-28', 1, 15.99, 0.10, 14.39, 'Paid', '789 Oak St, Bangalore'),
  (37, 101, 207, '2023-01-28', 4, 9.99, 0.20, 39.96, 'Paid', '123 Main St, Mumbai'),
  (38, 102, 208, '2023-01-29', 2, 6.99, 0.05, 13.28, 'Paid', '456 Elm St, Delhi'),
  (39, 103, 209, '2023-01-30', 3, 10.99, 0.15, 29.68, 'Paid', '789 Oak St, Bangalore'),
  (40, 101, 210, '2023-01-30', 1, 7.99, 0.10, 7.19, 'Pending', '123 Main St, Mumbai'),
  (41, 102, 201, '2023-01-30', 2, 14.99, 0.15, 25.48, 'Paid', '456 Elm St, Delhi'),
  (42, 103, 202, '2023-01-30', 3, 11.99, 0.10, 32.37, 'Pending', '789 Oak St, Bangalore'),
  (43, 101, 203, '2023-02-01', 1, 6.99, 0.05, 6.64, 'Paid', '123 Main St, Mumbai'),
  (44, 102, 204, '2023-02-01', 2, 13.99, 0.10, 27.98, 'Paid', '456 Elm St, Delhi'),
  (45, 103, 205, '2023-02-02', 3, 9.99, 0.15, 26.97, 'Paid', '789 Oak St, Bangalore'),
  (46, 101, 206, '2023-02-02', 1, 8.99, 0.05, 8.54, 'Paid', '123 Main St, Mumbai'),
  (47, 102, 207, '2023-02-02', 4, 7.99, 0.10, 31.96, 'Paid', '456 Elm St, Delhi'),
  (48, 103, 208, '2023-02-03', 2, 14.99, 0.15, 27.98, 'Paid', '789 Oak St, Bangalore'),
  (49, 101, 209, '2023-02-03', 1, 9.99, 0.05, 9.49, 'Paid', '123 Main St, Mumbai'),
  (50, 102, 210, '2023-02-03', 5, 11.99, 0.10, 53.96, 'Paid', '456 Elm St, Delhi');

-- display full sales table with total sale
SELECT *,(SELECT sum(total_price) FROM sales s2 WHERE s2.product_id=s1.product_id) as Total_Sale FROM sales s1;


-- display full sales table with total sale
SELECT *,(SELECT avg(discount) FROM sales s2 WHERE s2.order_date=s1.order_date) as AVG_Discount 
FROM sales s1;


-- Retrieve the customer ID and total price of orders where the total price is higher than the average total price
SELECT customer_id, total_price, (SELECT AVG(total_price) FROM sales) as AVG_PRICE
FROM sales
WHERE total_price > (SELECT AVG(total_price) FROM sales);


-- Retrieve the order ID, quantity and discounted price for orders where the total price is less than the unit price
SELECT order_id, quantity, unit_price,total_price, discount, (total_price*discount) as Discounted_Price
FROM sales
WHERE total_price < unit_price;

-- Retrieve orders with maximum quantity
SELECT * FROM sales
WHERE quantity =(SELECT MAX(quantity) FROM sales);

-- REtrieve orders with the Maximum Quantity for given product
SELECT *,(SELECT MAX(quantity) FROM sales s2 where s2.product_id=s1.product_id) AS MAX_QTY_FOR_PROD FROM sales s1
WHERE quantity =(SELECT MAX(quantity) FROM sales s2 where s2.product_id=s1.product_id)
ORDER BY quantity DESC;

-- Retrieve the customer ID and the most recent order data for each customer
SELECT customer_id, max(order_date) AS LATEST_ORDER_DATE 
FROM sales 
GROUP BY customer_id;

-- Find a number of Orders placed by a Customer given sales order date
SELECT *, (SELECT COUNT(*) FROM sales s2 WHERE s2.customer_id = s1.customer_id AND s2.order_date < s1.order_date ) as prev_order_count
FROM sales s1;


-- 
SELECT *, (SELECT COUNT(*) FROM sales s2 WHERE s2.customer_id = s1.customer_id AND s2.order_date < s1.order_date ) as prev_order_count
FROM sales s1
HAVING prev_order_count =0;

*******************************************************************************
	Window FUnctions Syntax:
 SELECT Col1, Col2,
 FUNCTION () OVER (PARTITION BY <>,
					ORDER BY<>)
                    
FROM table_name
WHERE.....
ORDER BY.....
******************************************************************************
FUNCTIONS:
Aggregate: COUNT, SUM, MIN, MAX, AVG
Offset: FIRST_VALUE, LAST_VALUE, NTH_VALUE
Statistical : PERCENT_RANK, CUME_DIST,
PERCENTILE_COUNT, PERCENTILE_DIST
OTHER: NITLE,ROW_NUMBER
*****************************************************************************
CREATE TABLE DEPT{
DEPTNO
DNMAE
LOC
}

CREATE TABLE EMP
{
EMPNO
ENAME
HOB
MGR
HIREDATE
SAL
DEPTNO
}

CREATE TABLE DB_WINDOW
{
}

************************************************************************************************************************************************

***********************************************************************************************************************************************



-- Add an extra colum in the result (not in db) as Total that contain the product of Price and Quality columns
SELECT *, Price*Quality as Total 
FROM salesdetails;

CREATE DATABASE IF NOT EXISTS db_window_functions;
USE db_window_functions;
DROP TABLE IF EXISTS EMP;
DROP TABLE IF EXISTS DEPT;

--------------------------------------------------------
--  DDL for Table DEPT
--------------------------------------------------------
  CREATE TABLE DEPT
   (DEPTNO DECIMAL(2,0) PRIMARY KEY, 
	DNAME VARCHAR(14), 
	LOC VARCHAR(13)
   ) ;
   

Insert into DEPT (DEPTNO,DNAME,LOC) values (10,'ACCOUNTING','NEW YORK');
Insert into DEPT (DEPTNO,DNAME,LOC) values (20,'RESEARCH','DALLAS');
Insert into DEPT (DEPTNO,DNAME,LOC) values (30,'SALES','CHICAGO');
Insert into DEPT (DEPTNO,DNAME,LOC) values (40,'OPERATIONS','BOSTON');
Insert into DEPT (DEPTNO,DNAME,LOC) values (50,'IT','HYDERABAD');
commit;
select * from dept;

  



--------------------------------------------------------
--  DDL for Table EMP
--------------------------------------------------------

  CREATE TABLE EMP
   (
    EMPNO DECIMAL(4,0) PRIMARY KEY, 
	ENAME VARCHAR(10), 
	JOB VARCHAR(9), 
	MGR DECIMAL(4,0), 
	HIREDATE DATE, 
	SAL DECIMAL(7,2), 
	DEPTNO DECIMAL(2,0) REFERENCES DEPT(DEPTNO)
   ) ;
   
   
Insert into EMP (EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,DEPTNO) values (7839,'KING','PRESIDENT',null,str_to_date('17-11-81','%d-%m-%y'),5000,10);
Insert into EMP (EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,DEPTNO) values (7698,'BLAKE','MANAGER',7839,str_to_date('01-05-81','%d-%m-%y'),2850,30);
Insert into EMP (EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,DEPTNO) values (7782,'CLARK','MANAGER',7839,str_to_date('09-06-81','%d-%m-%y'),2450,10);
Insert into EMP (EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,DEPTNO) values (7566,'JONES','MANAGER',7839,str_to_date('02-04-81','%d-%m-%y'),2975,20);
Insert into EMP (EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,DEPTNO) values (7788,'SCOTT','ANALYST',7566,str_to_date('19-04-87','%d-%m-%y'),3000,20);
Insert into EMP (EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,DEPTNO) values (7902,'FORD','ANALYST',7566,str_to_date('03-12-81','%d-%m-%y'),3000,20);
Insert into EMP (EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,DEPTNO) values (7369,'SMITH','CLERK',7902,str_to_date('17-12-80','%d-%m-%y'),50,20);
Insert into EMP (EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,DEPTNO) values (7499,'ALLEN','SALESMAN',7698,str_to_date('20-02-81','%d-%m-%y'),1600,30);
Insert into EMP (EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,DEPTNO) values (7521,'WARD','SALESMAN',7698,str_to_date('28-09-81','%d-%m-%y'),1250,30);
Insert into EMP (EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,DEPTNO) values (7844,'TURNER','SALESMAN',7698,str_to_date('08-09-81','%d-%m-%y'),1500,30);
Insert into EMP (EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,DEPTNO) values (7876,'ADAMS','CLERK',7788,str_to_date('03-12-81','%d-%m-%y'),8005,30);
Insert into EMP (EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,DEPTNO) values (7934,'MILLER','CLERK',7782,str_to_date('23-01-82','%d-%m-%y'),1300,40);
Insert into EMP (EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,DEPTNO) values (8001,'ANABELLE','CLERK',7698,str_to_date('03-12-81','%d-%m-%y'),5500,20);
Insert into EMP (EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,DEPTNO) values (8002,'OLIVE','CLERK',7698,str_to_date('03-12-81','%d-%m-%y'),5800,20);
Insert into EMP (EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,DEPTNO) values (8003,'OLIVE','CLERK',7698,str_to_date('03-12-81','%d-%m-%y'),5800,20);
Insert into EMP (EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,DEPTNO) values (8004,'KINGS','CLERK',7698,str_to_date('03-12-81','%d-%m-%y'),5800,20);
Insert into EMP (EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,DEPTNO) values (8005,'KINE','CLERK',7698,str_to_date('03-12-81','%d-%m-%y'),5800,20);
Insert into EMP (EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,DEPTNO) values (8006,'KILLEY','SALESMAN',7788,str_to_date('12-06-90','%d-%m-%y'),7500,null);
Insert into EMP (EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,DEPTNO) values (8007,'Jason','developer',7788,str_to_date('12-07-89','%d-%m-%y'),8999,20);
Insert into EMP (EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,DEPTNO) values (8009,'BIPLAB','SALESMAN',7698,str_to_date('12-03-22','%d-%m-%y'),9000,30);
Insert into EMP (EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,DEPTNO) values (8010,'Jason','SALESMAN',7698,str_to_date('12-03-22','%d-%m-%y'),9000,30);
commit;

select * from EMP;

DROP TABLE IF EXISTS db_window_functions.SalesDetails;

CREATE TABLE db_window_functions.SalesDetails
(
 SalesDetailsId INT NOT NULL AUTO_INCREMENT,
 SalesId INT NOT NULL,
 SalesDate DATE NOT NULL,
 ProductId INT NOT NULL,
 Price DECIMAL NOT NULL,
 Quantity INT NOT NULL,
 PRIMARY KEY (SalesDetailsId)
);

INSERT INTO db_window_functions.SalesDetails (SalesId, SalesDate, ProductId, Price, Quantity)
VALUES
 (1, '20200105', 6, 5.99, 2),
 (1, '20200105', 5, 4.50, 1),
 (1, '20200105', 4, 17.99, 4),
 (2, '20200107', 2, 2.99, 2),
 (2, '20200107', 3, 11.40, 1),
 (3, '20200107', 6, 5.99, 4),
 (3, '20200107', 2, 2.99, 2),
 (3, '20200107', 3, 11.40, 1),
 (3, '20200107', 9, 6.29, 4),
 (4, '20200108', 9, 6.29, 2),
 (4, '20200108', 8, 23.10, 1),
 (4, '20200108', 1, 13.25, 4),
 (4, '20200108', 2, 2.99, 2),
 (4, '20200108', 3, 11.40, 1),
 (5, '20200110', 4, 17.99, 4),
 (6, '20200110', 7, 19.00, 2),
 (6, '20200110', 9, 6.29, 10);

-- show the total quantity sold for each product in the saledetails table itself
SELECT *, (SELECT sum(quantity) FROM salesdetails s2 WHERE s2.productId = s1.productId) as TOTAL_QTY
FROM salesdetails s2;

SELECT *, sum(quantity) OVER(PARTITION BY productId) as Total_QTY
FROM salesdetails s;

-- 
SELECT *, sum(quantity) OVER(PARTITION BY productId) as Total_QTY
FROM salesdetails s;

-- get the overall total quantity in front of each row using window function
SELECT *, Count(quantity) OVER(PARTITION BY productId) as COUNT_OF_QTY,
	sum(quantity) OVER(PARTITION BY productId) as Total_QTY,
	min(quantity) OVER(PARTITION BY productId) as Min_QTY,
    max(quantity) OVER(PARTITION BY productId) as MAX_QTY,
    avg(quantity) OVER(PARTITION BY productId) as AVG_QTY
FROM salesdetails
ORDER BY ProductId;


-- get details of prev row from curr row
SELECT *, LAG(salesdetailsid,2,0) OVER () as Prev_ID
FROM salesdetails s;


-- LAG and LEAD Parameters
SELECT *, LAG(salesdetailsid,2,0) OVER () as Prev_ID,
		LEAD(salesdetailsid,3) OVER() as next_3rd_id
FROM salesdetails s;

-- FIRST , LAST , Nth Value
SELECT *, FIRST_VALUE(salesdata) OVER (PARTITION BY saleID) as FIRST_DATA,
		LAST_VALUE(salesdata) OVER(PARTITION BY saleID) as LAST_DATA,
        NTH_VALUE(salesdata, 5) OVER(PARTITION BY saleID) as Nth_DATA
FROM salesdetails s;


-- row num
SELECT *, ROW_NUMBER() OVER() as row_num
FROM salesdetails s;

SELECT *, ROW_NUMBER() OVER(PARTITION BY salesID) as row_num
FROM salesdetails s;


NTILE, ROW_NUMBER
in case of NTILE the group sizes are decided according to the total number of rows (Nr)


-- For each sales date find the number of orders and total amount for the available dates show these: details with all sales deatils.
-- one time use only: USE db_window_functions;
SELECT *, COUNT(*) OVER (PARTITION BY SalesDate) AS No_of_Orders_per_Date,
	SUM(price*quantity) OVER (PARTITION BY salesdate) AS Total_Sales 
FROM salesdetails;

-- Find the cumulative sum of quantity over full table, sort by salesdetailsid
SELECT *, (SELECT SUM(quantity) FROM salesdetails s2 WHERE s2.salesdetailsid<=s1.salesdetailsid) as Cumulative_Sum
FROM salesdetails s1;

SELECT *, SUM(quantity) OVER(ORDER BY salesdetailsid) as CUM_quantity
FROM salesdetails s1;

SELECT *, SUM(quantity) OVER(ORDER BY salesdate) as CUM_quantity
FROM salesdetails s1;

SELECT *, SUM(quantity) OVER(PARTITION BY productId ORDER BY salesdate) as CUM_quantity
FROM salesdetails
ORDER BY productId;

-- find cumulative sum of quantity over complete table
SELECT *, SUM(quantity) OVER(ROWS UNBOUNDED PRECEDING)
FROM salesdetails;

SELECT *, SUM(quantity) OVER(ROWS 1 PRECEDING)
FROM salesdetails;

SELECT *, SUM(quantity) OVER(ROWS BETWEEN 2 PRECEDING AND UNBOUNDED FOLLOWING) AS Variation
FROM salesdetails;

SELECT *, SUM(quantity) OVER(ROWS BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING) AS Variation
FROM salesdetails;
*/
