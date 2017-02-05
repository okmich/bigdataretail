create external table customer_demographics
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
location '/user/cloudera/bigretail/output/stores/spark/customer_demographics' 
