select productid,discountpct,  minimum, maximum from (select productid, discountpct, min(unitprice) minimum, max(unitprice) maximum
from salesorderdetails sod join salesorderheader soh on sod.salesorderid = soh.salesorderid
group by productid, discountpct) v
where minimum <> maximum
order by 1

---
select d.*, t.total_due from customer_demo d 
join 
(select customerid, sum(totaldue) total_due from salesorderheader group by customerid) t 
on d.customerid = t.customerid