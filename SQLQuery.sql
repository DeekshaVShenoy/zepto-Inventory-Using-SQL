--Data Exploration
	select 
	count(*)[Total Records]
	from ProductDetails

--Sample Data-Top 10
	select TOP 10 *
	from ProductDetails

--Check for null values
	select * 
	from ProductDetails
	where category is null or
	Name is null or
	category is null or
	MRP is null or
	DiscountPercent is null or
	AvailableQuantity is null or
	DiscountedSellingPrice is null or
	WeightInGms is null or
	OutOfStock is null or
	Quantity is null

-- Different Product Categories
	select distinct category[Product Category] 
	from ProductDetails
	order by Category

--Checking items in stock vs out of stock
	select
	case when OutOfStock='False' then 'Out of Stock'
	else 'In Stock' 
	end as StockStatus,
	Count(*)[Quantity]
	from ProductDetails
	group by case when OutOfStock='False' then 'Out of Stock'
	else 'In Stock' end

--Product names present multiple times
	select Name,count(*)[Total] 
	from ProductDetails
	group by Name
	having count(*)>1
	order by count(*) desc

------Data Cleaning
--Check product where MRP=0
	select * 
	from ProductDetails
	where MRP=0 or DiscountedSellingPrice=0 -- MRP cannot BE 0.So lets delete the data where mrp =0

	delete from ProductDetails
	where mrp=0

--MRP AND DiscountedSellingPrice are in Paisa.Convert Paisa to Rupee  
	update ProductDetails
	set mrp=mrp/100.0,
	DiscountedSellingPrice=DiscountedSellingPrice/100.0

--Find top 10 best-value products based on discount percentage
	select 
	distinct Top 10 name,mrp,DiscountedSellingPrice,discountPercent
	from productdetails
	order by DiscountPercent desc

--Identify high-MRP products that are currently out of stock
	select 
	distinct name,mrp,OutOfStock 
	from ProductDetails
	where OutOfStock='True'
	order by mrp desc

--Estimate potential revenue for each product category
	select 
	category[Product Category],
	sum(DiscountedSellingPrice*AvailableQuantity)[EstimatedRevenue]
	from ProductDetails
	group by category
	order by [EstimatedRevenue]

-- Find all products where MRP >500 and discount<10
	select 
	distinct name,
	mrp,
	discountpercent 
	from ProductDetails
	where mrp>500 and DiscountPercent<10
	order by mrp desc,DiscountPercent desc

-- Find top 5 categories offering highest average discounts
	select top 5 Category[Product Category],
	AVG(DiscountPercent)[Average Discount] 
	from ProductDetails
	group by Category
	order by [Average Discount] desc

--Calculate price per gram to identify value-for-money products
	select 
	distinct ltrim(rtrim(name))[Product Name],
	WeightInGms,
	DiscountedSellingPrice,
	cast(Round((DiscountedSellingPrice*1.0/WeightInGms),2) as decimal(10,2))[Price Per Gram] 
	from ProductDetails
	where not WeightInGms=0
	order by [Price Per Gram]


--Group products based on weight into Low, Medium, and Bulk categories ,weightingrms<3000 low,<6000 ,medim, >6000 large

	select 
	name[Product Name],
	weightIngms,
	case when weightIngms<1000 then 'Low'
	     when weightIngms<5000 then 'Medium'
	else 'Bulk'
	end as WeightCategory
	from ProductDetails
 
 --Find Total, Bulk,Low and Medium Products
	select 
	case
		when weightIngms<1000 then 'Low'
		when weightIngms<5000 then 'Medium'
	else 'Bulk'
	end as WeightCategory,
	count(*)[Total]
	from ProductDetails
	group by 
	case 
		when weightIngms<1000 then 'Low'
		when weightIngms<5000 then 'Medium'
	else 'Bulk'
	end 

--What is the total inventory weight per product category
	select 
	category,
	cast(sum(weightingms*availablequantity)/1000.0 as decimal (10,2))[Total Weight in kg]
	from ProductDetails
	group by Category
	order by [Total Weight in kg]