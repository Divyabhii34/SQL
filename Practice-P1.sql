--SQL Retail Sales Analysis P1--
Create database SQL_Project_P1;

create table retail_sales 
			(
				transactions_id int primary key,	
				sale_date date,
				sale_time time,	
				customer_id INT,
				gender varchar(15),
				age INT,
				category varchar(15),
				quantiy int,
				price_per_unit float ,
				cogs float, 
				total_sale float
			)
Select * from retail_sales
LIMIT 10

Select count(*) from retail_sales

Select * from retail_sales
where transactions_id is null;

Select * from retail_sales
where 
transactions_id is null
or
sale_date is null
or
sale_time is null
or
gender is null
or
category is null
or
quantiy is null
or
cogs is null
or
total_sale is null;

delete from retail_sales
where 
transactions_id is null
or
sale_date is null
or
sale_time is null
or
gender is null
or
category is null
or
quantiy is null
or
cogs is null
or
total_sale is null;

--- Data Exploration


-- How many sales we have?
select count(*) as total_sale from retail_sales

-- How many unique customers we have?
select count(distinct customer_id) as customerID from retail_sales

-- How many unique category and category name we have?
select count(distinct category) as category from retail_sales

select distinct category as category from retail_sales

---Data Analysis & Business Key Problems Answer

--Q.1--to retrieve all the coloumn for the sales made on '2022-11-05' ?

select * from retail_sales
where sale_date = '2022-11-05';

--Q.2-- To retrieve all transactions where the category is 'clothing' and the
-----------quantity sold is more than 4 in the month of Nov-2022 

select * from retail_sales
where category = 'Clothing'
and 
to_char(sale_date, 'yyyy-mm')= '2022-11'
and
quantiy >= 4

----Q.3--- Calculate total sales for each category.?

select category, 
sum(total_sale) as Net_Sale
from retail_sales
group by 1

----Q.3--- Calculate total sales and total order for each category.?
select category, 
sum(total_sale) as Net_Sale,
count(*) as Total_Order
from retail_sales
group by 1

----Q.4---- Find out the avg age of customers who purchased items from the 'Beauty' category?

select category, round(avg(age), 2) as Avg_Age from retail_sales
where category = 'Beauty' 
group by 1

--Q.5--- Find all transactions where total_sale is greater than 1000

select * from retail_sales
where total_sale > 1000 

--Q.6-- Find number of Transactions (transactions_id) made by each gender in each category

select category, 
gender, 
count(transactions_id) as transactions from retail_sales
group by 1,2
order by 1

--Q.7---Find the avg sales in each month. Also the best selling month in each year

select  sale_date, total_sale from retail_sales



