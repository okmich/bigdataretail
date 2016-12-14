select
	SalesOrderID,          
	RevisionNumber,        
	OrderDate,             
	DueDate,               
	ShipDate,              
	Status,                
	OnlineOrderFlag,       
	SalesOrderNumber,      
	PurchaseOrderNumber,   
	AccountNumber,         
	CustomerID,            
	ContactID,           
	BillToAddressID,       
	ShipToAddressID,       
	ShipMethodID,          
	CreditCardID,          
	CreditCardApprovalCode,
	CurrencyRateID,        
	SubTotal,              
	TaxAmt,                
	Freight,               
	TotalDue,              
	Comment,              
	so.SalesPersonID, 
	sp.TerritoryID,
	st.name territory,
	st.CountryRegionCode,
	st.group,
	so.ModifiedDate          
from salesorderheader so left join salesperson sp on sp.SalesPersonID = so.SalesPersonID
join left salesterritory st ON st.TerritoryID = sp.TerritoryID;



select          
	SalesOrderDetailID,    
	SalesOrderID,
	CarrierTrackingNumber, 
	OrderQty,              
	ProductID,             
	UnitPrice,             
	UnitPriceDiscount,     
	LineTotal,       
	sod.SpecialOfferID, 
	so.Description,
	so.DiscountPct,
	so.Type,
	so.Category
	ModifiedDate   
from salesorderdetail sod join specialoffer so 
on sod.SpecialOfferID = so.SpecialOfferID;






select cus.CustomerID,cus.AccountNumber, cus.CustomerType, ind.Demographics, con.NameStyle, con.Title, con.FirstName,             
con.MiddleName,con.LastName, con.Suffix, con.EmailAddress, con.EmailPromotion, con.Phone, con.AdditionalContactInfo,  
cus.TerritoryID,t.name territoryName, t.countryregioncode, t.group, con.ModifiedDate from customer cus
join individual ind on ind.CustomerID = cus.CustomerID join contact con on con.ContactID = ind.ContactID join salesterritory t on
cus.TerritoryID = t.TerritoryID

union	
	
select cus.CustomerID, cus.AccountNumber, cus.CustomerType, st.Demographics, con.NameStyle, con.Title, st.Name, con.MiddleName,            
con.LastName,con.Suffix,con.EmailAddress,con.EmailPromotion, con.Phone, con.AdditionalContactInfo, cus.TerritoryID, t.name territoryName, 
t.countryregioncode, t.group, cus.ModifiedDate from store st
join customer cus on  st.CustomerID = cus.CustomerID join storecontact sc on  st.CustomerID = sc.CustomerID  join contact con on
sc.ContactID = con.ContactID join salesterritory t on cus.TerritoryID = t.TerritoryID