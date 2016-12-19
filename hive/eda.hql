create database central_store;

create external table product (
	productId int,
	name string,
	productnumber string,
	makeflag boolean,
	finishedgoodsflag boolean,
	color string,
	safetystocklevel int,
	reorderpoint int,
	standardcost double,
	listprice double,
	size string,
	sizeunitmeasurecode string,
	weightunitmeasurecode string,
	weight string,
	daystomanufacture int,
	productline string,
	class string,
	style string,
	sellstartdate bigint,
	sellenddate bigint,
	discontinueddate bigint,
	productsubcategory string,
	productcategory string,
	producemodel string,
	catalogdescription string,
	instructions string,
	modifieddate bigint
)
stored as parquet
location '/user/cloudera/output/stores/sqoop/products';


create external table customer (
	CustomerID int,
	AccountNumber  string,
	CustomerType varchar(1),
	Demographics string, 
	NameStyle boolean,
	Title string,
	FirstName string ,
	MiddleName  string,
	LastName string ,
	Suffix string ,
	EmailAddress  string,
	EmailPromotion int,
	Phone  string,
	AdditionalContactInfo  string,
	TerritoryID int,
	territoryName  string,
	countryregioncode  string,
	group  string,
	ModifiedDate  string
	)
row format delimited
fields terminated by ','
location '/user/cloudera/output/stores/sqoop/customers';