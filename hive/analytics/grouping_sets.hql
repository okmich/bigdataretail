select yearlyincome, maritalstatus, gender, count(1) dist from customer_demo group by yearlyincome, maritalstatus, gender;

select yearlyincome, maritalstatus, gender, count(1) dist from customer_demo group by yearlyincome, maritalstatus, gender
grouping sets ((yearlyincome, maritalstatus, gender))

select yearlyincome, maritalstatus, gender, count(1) dist from customer_demo group by yearlyincome, maritalstatus, gender
grouping sets (yearlyincome, (maritalstatus, gender))

select yearlyincome, maritalstatus, gender, count(1) dist from customer_demo group by yearlyincome, maritalstatus, gender
grouping sets ((yearlyincome, maritalstatus), gender)


select yearlyincome, maritalstatus, gender, count(1) dist from customer_demo group by yearlyincome, maritalstatus, gender
grouping sets ((yearlyincome, maritalstatus, gender),(maritalstatus, gender), gender,())