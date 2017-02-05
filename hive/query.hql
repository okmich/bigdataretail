select productid,discountpct,  minimum, maximum from (select productid, discountpct, min(unitprice) minimum, max(unitprice) maximum
from salesorderdetails sod join salesorderheader soh on sod.salesorderid = soh.salesorderid
group by productid, discountpct) v
where minimum <> maximum
order by 1

