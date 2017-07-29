create table customer_demographics
(
	CustomerID int,
	TotalPurchaseYTD string,
	DateFirstPurchase string,
	BirthDate string,
	MaritalStatus string,
	YearlyIncome string,
	Gender string,
	TotalChildren string,
	NumberChildrenAtHome string,
	Education string,
	Occupation string,
	HomeOwnerFlag string,
	NumberCarsOwned string,
	CommuteDistance string
)
stored as parquet
location '/user/cloudera/bigretail/output/stores/spark/customer_demographics';


create external table customer_demo
(
	customerid int,
	totalpurchaseytd decimal(15,2),
	datefirstpurchase timestamp,
	birthdate timestamp,
	maritalstatus string,
	yearlyincome string,
	gender string,
	totalchildren tinyint,
	numberchildrenathome tinyint,
	education string,
	occupation string,
	homeownerflag string,
	numbercarsowned tinyint,
	commutedistance string
)
stored as parquet
location '/user/cloudera/bigretail/output/stores/spark/customer_demo';

-- transform data from customer_demographics and insert into customer_demo
insert overwrite table customer_demo
select customerid, cast(totalpurchaseytd as decimal(15,2)), to_date(substr(datefirstpurchase, 1, 10))
, to_date(substr(birthdate, 1, 10)) , maritalstatus, yearlyincome, gender, cast(totalchildren as int)
, cast(numberchildrenathome as int), education, occupation, homeownerflag, cast(numbercarsowned as int)
, commutedistance
from customer_demographics;

drop table customer_demographics;