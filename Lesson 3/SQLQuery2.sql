--Exercise 2A 
SELECT Name, 'PriceRange' = CASE
	WHEN StandardCost = 0 OR StandardCost IS NOT NULL THEN 'Not for sale'
	WHEN StandardCost > 0 AND StandardCost <100 THEN '<$100'
	WHEN StandardCost >= 100 AND StandardCost <500 THEN '<$500'
	ELSE '>=$500'
	END
FROM Production.Product
ORDER BY Name;

--Exercise 2B
SELECT ProductVendor.ProductID, Vendor.BusinessEntityID, Vendor.Name
FROM Purchasing.ProductVendor
LEFT JOIN Purchasing.Vendor 
ON ProductVendor.BusinessEntityID=Vendor.BusinessEntityID
WHERE StandardPrice >10 
AND Vendor.Name LIKE '%X%' OR Vendor.Name LIKE 'N%';

--Exercise 2Ñ
SELECT Vendor.Name
FROM Purchasing.ProductVendor
LEFT JOIN Purchasing.Vendor 
ON ProductVendor.BusinessEntityID=Vendor.BusinessEntityID
WHERE OnOrderQty IS NULL
GROUP BY Vendor.Name;


-- Exercise 3a
SELECT Product.Name, Product.StandardCost
FROM Production.Product
LEFT JOIN Production.ProductModel 
	ON Product.ProductModelID = ProductModel.ProductModelID
WHERE productmodel.Name LIKE 'LL%'
ORDER BY StandardCost;

-- Exercise 3b
SELECT DISTINCT Vendor.Name AS Vendor_Name, Store.Name AS Store_Name
FROM Purchasing.Vendor
LEFT JOIN Sales.Store 
	ON Vendor.BusinessEntityID = Store.BusinessEntityID
ORDER BY Vendor.Name ASC, Store.Name ASC;

-- Exercise 3c
SELECT Product.Name
FROM Sales.SpecialOffer
LEFT JOIN Sales.SpecialOfferProduct
	ON SpecialOffer.SpecialOfferID = SpecialOfferProduct.SpecialOfferID
LEFT JOIN Production.Product
	ON Product.ProductID = SpecialOfferProduct.ProductID
Group by Product.Name;

/*
HERE ARE POSSIBLE OPTIONS OF SOLVING THE ISSUE WITH SHOWING ONLY PRODUCTS IN MORE THAN 1 SPECIAL OFFER (EXERCISE 3C)

SELECT Product.Name
FROM Sales.SpecialOffer
LEFT JOIN Sales.SpecialOfferProduct
	ON SpecialOffer.SpecialOfferID = SpecialOfferProduct.SpecialOfferID
LEFT JOIN Production.Product
	ON Product.ProductID = SpecialOfferProduct.ProductID
Group by Product.Name, SpecialOffer.SpecialOfferID
HAVING COUNT (Product.ProductID) > 1;


SELECT Product.ProductID
FROM (SELECT count (Product.ProductID) AS PP, Product.Name, SpecialOffer.SpecialOfferID
	FROM Sales.SpecialOffer
	LEFT JOIN Sales.SpecialOfferProduct
		ON SpecialOffer.SpecialOfferID = SpecialOfferProduct.SpecialOfferID
	LEFT JOIN Production.Product
		ON Product.ProductID = SpecialOfferProduct.ProductID
	GROUP BY Product.ProductID, Product.Name, SpecialOffer.SpecialOfferID) AS PP_count
WHERE PP >1;
*/