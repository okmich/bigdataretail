-- GROUP BY
-- ========== 
select maritalstatus, gender, yearlyincome, count(1) num_of_occurence from customer_demo
group by maritalstatus, gender, yearlyincome


-- GROUPING SETS
-- ================
select maritalstatus, gender, yearlyincome, education, count(1) num_of_occurence from customer_demo
group by maritalstatus, gender, yearlyincome, education
grouping sets ((maritalstatus, gender), (yearlyincome, education),())


select grouping__id, maritalstatus, gender, yearlyincome, education, sum(totalpurchaseytd) num_of_occurence from customer_demo
group by maritalstatus, gender, yearlyincome, education
grouping sets ((maritalstatus, gender, yearlyincome, education), (maritalstatus, gender, yearlyincome), (maritalstatus, gender), maritalstatus, ())


-- ROLLUP
-- ==========
select grouping__id, maritalstatus, gender, yearlyincome, education, sum(totalpurchaseytd) num_of_occurence from customer_demo
group by maritalstatus, gender, yearlyincome, education
with rollup

-- this rollup is equivalent to
select grouping__id, yearlyincome, education, sum(totalpurchaseytd) num_of_occurence from customer_demo
group by yearlyincome, education
with rollup

-- this grouping set
select grouping__id, yearlyincome, education, sum(totalpurchaseytd) num_of_occurence from customer_demo
group by yearlyincome, education
grouping sets ((yearlyincome, education), (yearlyincome), ())


-- CUBE
-- ==========
select grouping__id, yearlyincome, education, sum(totalpurchaseytd) num_of_occurence from customer_demo
group by yearlyincome, education
with cube

-- is equivalent to 
select grouping__id, yearlyincome, education, sum(totalpurchaseytd) num_of_occurence from customer_demo
group by yearlyincome, education
grouping sets ((yearlyincome, education), (yearlyincome), (education), ())

-- and 
--this 
select grouping__id, yearlyincome, education, maritalstatus, sum(totalpurchaseytd) num_of_occurence from customer_demo
group by yearlyincome, education, maritalstatus
with cube

-- is equivalent to 
select grouping__id, yearlyincome, education, maritalstatus, sum(totalpurchaseytd) num_of_occurence from customer_demo
group by yearlyincome, education, maritalstatus
grouping sets ((yearlyincome, education, maritalstatus), 
(yearlyincome, education), (yearlyincome, maritalstatus), (education, maritalstatus), 
(yearlyincome), (education), (maritalstatus), ())


-- WINDOWING ANALYTICS
-- ====================

-- create a sample of the creditcard table that contains an equal amount of all cardtype
create table cc_sample as 
select * from 
(select row_number() over (partition by cardtype) as serial_no, creditcardid, cardnumber, cardtype from creditcard) v where v.serial_no < 51

-- ROW NUMBER 
SELECT row_number() over () as serial_no, productid, name, productnumber FROM product

-- get nine records from credit each card type
with cte as (select row_number() over (partition by cardtype) as serial_no, creditcardid, cardnumber,cardtype from creditcard)
select * from cte where serial_no < 10


select ntile(5) over (partition by cardtype) as groups, creditcardid, cardnumber, cardtype from cc_sample








select  maritalstatus, yearlyincome, education, 
   sum(v.percentage) as percentage_of_purchase from customer_demo cd
   join 
   (select customerid, (sum(totalpurchaseytd) over (partition by customerid) / sum(totalpurchaseytd) over ()) percentage from customer_demo cd) as v
   on v.customerid = cd.customerid
group by maritalstatus, yearlyincome, education
with roll up



