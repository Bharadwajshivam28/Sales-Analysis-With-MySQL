create database if not exists salesData;
use salesData;

create table if not exists WalmartSalesData.csv(
  invoice_id varchar(30) not null primary key,
  branch varchar(5) not null,
  city varchar(30) not null,
  customer_type varchar(30) not null,
  gender varchar(10) not null,
  product_line varchar(100)  not null,
  unit_price decimal(10,2) not null,
  quantity int not null,
  VAT float(6,4) not null,
  total decimal(12,4) not null,
  date datetime not null,
  time time not null,
  payment_method decimal(10,2) not null,
  cogs decimal(10,2) not null,
  gross_margin_percentage float(11,9) not null,
  gross_income decimal(10,2) not null,
  rating float(2,1) not null
);

select time,
(case
when `time` between "00:00:00" and "12:00:00" then "Morning"
when `time` between "12:01:00" and "16:00:00" then "Afternoon"
else "Evening"
end
) as time_of_date
from salesData.`WalmartSalesData.csv`;

alter table salesData.`WalmartSalesData.csv` add column time_of_day varchar(20);

update salesData.`WalmartSalesData.csv`
set time_of_day = (
case 
when `time` between "00:00:00" and "12:00:00" then "Morning"
when `time` between "12:01:00" and "16:00:00" then "Afternoon"
else "Evening"
end
);


select
date,
dayname(date) as day_name
from salesData.`WalmartSalesData.csv`;

alter table salesData.`WalmartSalesData.csv` add column day_name varchar(10);

update salesData.`WalmartSalesData.csv`
set day_name = dayname(date);

select 
date,
monthname(date)
from salesData.`WalmartSalesData.csv`;

alter table salesData.`WalmartSalesData.csv` add column month_name varchar(10);

update salesData.`WalmartSalesData.csv`
set month_name = monthname(date);

select distinct city from salesData.`WalmartSalesData.csv`;
select distinct city, branch from salesData.`WalmartSalesData.csv`;

select
distinct product_line
from salesData.`WalmartSalesData.csv`;

select * from salesData.`WalmartSalesData.csv`;

SELECT  
count(payment_method) as cnt
from salesData.`WalmartSalesData.csv`
group by payment_method
order by cnt desc;

