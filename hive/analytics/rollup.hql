select yearlyincome, maritalstatus, gender, count(1) dist from customer_demo group by yearlyincome, maritalstatus, gender
with rollup;

