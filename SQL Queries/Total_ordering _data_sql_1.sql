---------------------------- General Queries--------------------------------------

use DB_MBR;
select * from MBRUsers where Desig_Id=7;
SELECT * FROM MBROrders LIMIT4;
select * from MBRDesignation;

---------------------------- Masters Query--------------------------------------
select distinct (Region) from MBROrders;
select distinct (Brand) from MBROrders;
select distinct(RetailerName)from MBROrders;
select distinct(RSName)from MBROrders;
select distinct(ABMEMM)from MBROrders;
select distinct(MBROrders.ABMKAM)from MBROrders join MBRUsers on MBRUsers.EmpId=MBROrders.ABMEMM;
select distinct(RBM)from MBROrders;

-- select orderQty, TotalPrice, count(RetailerCode)  from MBROrders distinct Month(OrderDate);


------------------------------- Monthly Trend -------------------------------
SELECT 
    MONTH(OrderDate) AS OrderMonth,
    SUM(OrderQty) AS TotalOrderQty,
    SUM(TotalPrice) AS TotalRevenue,
    COUNT(DISTINCT RetailerCode) AS DistinctRetailerCount
FROM 
    MBROrders
WHERE 
-- from  month to Month
--    OrderDate IS NOT NULL and
	Brand ='TITAN' and
	Region = 'East'and
	RetailerName = '' and
	RSName = '' and
	ABMEMM = '' and
	ABMKAM = '' 
	-- RBM = ''
GROUP BY 
    MONTH(OrderDate)
ORDER BY 
    OrderMonth desc





-----------------------------------Region Wise Growth over Previous Month --------------------------------------------------------

WITH MonthlySales AS (
    SELECT 
        Region,
        YEAR(OrderDate) AS OrderYear,
        MONTH(OrderDate) AS OrderMonth,
        SUM(OrderQty) AS TotalOrderQty,
        SUM(TotalPrice) AS TotalRevenue,
        COUNT(DISTINCT RetailerCode) AS DistinctRetailerCount
    FROM 
        MBROrders
    WHERE 
        OrderDate IS NOT NULL AND
        Brand LIKE 'TITAN'
    GROUP BY 
        Region, YEAR(OrderDate), MONTH(OrderDate)
),
CurrentMonth AS (
    SELECT 
        Region,
        SUM(TotalOrderQty) AS CurrentOrderQty,
        SUM(TotalRevenue) AS CurrentRevenue
    FROM 
        MonthlySales
    WHERE 
        OrderYear = YEAR(GETDATE()) AND
        OrderMonth = MONTH(GETDATE())
    GROUP BY 
        Region
),
PreviousMonth AS (
    SELECT 
        Region,
        SUM(TotalOrderQty) AS PreviousOrderQty,
        SUM(TotalRevenue) AS PreviousRevenue
    FROM 
        MonthlySales
    WHERE 
        (OrderYear = YEAR(GETDATE()) AND OrderMonth = MONTH(GETDATE()) - 1)
        OR (OrderYear = YEAR(GETDATE()) - 1 AND MONTH(GETDATE()) = 1 AND OrderMonth = 12) -- Handle December to January transition
    GROUP BY 
        Region
)

SELECT 
    COALESCE(CurrentMonth.Region, PreviousMonth.Region) AS Region,
	DATENAME(MONTH, GETDATE()) AS CurrentMonthName,
    DATENAME(MONTH, DATEADD(MONTH, -1, GETDATE())) AS PreviousMonthName,
    ISNULL(CurrentMonth.CurrentOrderQty, 0) AS CurrentMonthOrderQty,
    ISNULL(PreviousMonth.PreviousOrderQty, 0) AS PreviousMonthOrderQty,
    ISNULL(CurrentMonth.CurrentRevenue, 0) AS CurrentMonthRevenue,
    ISNULL(PreviousMonth.PreviousRevenue, 0) AS PreviousMonthRevenue,
    CASE 
        WHEN ISNULL(PreviousMonth.PreviousOrderQty, 0) = 0 THEN NULL
        ELSE (ISNULL(CurrentMonth.CurrentOrderQty, 0) - ISNULL(PreviousMonth.PreviousOrderQty, 0)) * 100.0 / ISNULL(PreviousMonth.PreviousOrderQty, 1) 
    END AS OrderGrowthPercentage,
    CASE 
        WHEN ISNULL(PreviousMonth.PreviousRevenue, 0) = 0 THEN NULL
        ELSE (ISNULL(CurrentMonth.CurrentRevenue, 0) - ISNULL(PreviousMonth.PreviousRevenue, 0)) * 100.0 / ISNULL(PreviousMonth.PreviousRevenue, 1) 
    END AS RevenueGrowthPercentage
FROM 
    CurrentMonth
FULL OUTER JOIN 
    PreviousMonth ON CurrentMonth.Region = PreviousMonth.Region
ORDER BY 
    Region;

	--------------------------- Region Wise Growth over Previous Month compare 3 month data regulat fromat------
WITH MonthlySales AS (
    SELECT 
        Region,
        YEAR(OrderDate) AS OrderYear,
        MONTH(OrderDate) AS OrderMonth,
        SUM(OrderQty) AS TotalOrderQty,
        SUM(TotalPrice) AS TotalRevenue,
        COUNT(DISTINCT RetailerCode) AS DistinctRetailerCount
    FROM 
        MBROrders
    WHERE 
        OrderDate IS NOT NULL AND
        Brand LIKE 'TITAN'
    GROUP BY 
        Region, YEAR(OrderDate), MONTH(OrderDate)
),
CurrentMonth AS (
    SELECT 
        Region,
        SUM(OrderQty) AS CurrentOrderQty,
        SUM(TotalPrice) AS CurrentRevenue,
        COUNT(DISTINCT RetailerCode) AS CurrentDistinctRetailerCount
    FROM 
        MBROrders
    WHERE 
        YEAR(OrderDate) = YEAR(GETDATE()) AND
        MONTH(OrderDate) = MONTH(GETDATE())
    GROUP BY 
        Region
),
PreviousMonth AS (
    SELECT 
        Region,
        SUM(OrderQty) AS PreviousOrderQty,
        SUM(TotalPrice) AS PreviousRevenue,
        COUNT(DISTINCT RetailerCode) AS PreviousDistinctRetailerCount
    FROM 
        MBROrders
    WHERE 
        (YEAR(OrderDate) = YEAR(GETDATE()) AND  MONTH(OrderDate) = MONTH(GETDATE()) - 1)
        OR (YEAR(OrderDate) = YEAR(GETDATE()) - 1 AND MONTH(GETDATE()) = 1 AND  MONTH(OrderDate) = 12) -- Handle December to January transition
    GROUP BY 
        Region
),
TwoMonthsAgo AS (
    SELECT 
        Region,
        SUM(OrderQty) AS TwoMonthsOrderQty,
        SUM(TotalPrice) AS TwoMonthsRevenue,
        COUNT(DISTINCT RetailerCode) AS TwoMonthsDistinctRetailerCount
    FROM 
        MBROrders
    WHERE 
        (YEAR(OrderDate) = YEAR(GETDATE()) AND MONTH(OrderDate) = MONTH(GETDATE()) - 2)
        OR (YEAR(OrderDate) = YEAR(GETDATE()) - 1 AND MONTH(GETDATE()) = 3 AND MONTH(OrderDate) = 12) -- Handle December to January transition
    GROUP BY 
        Region
),
ThreeMonthsAgo AS (
    SELECT 
        Region,
        SUM(OrderQty) AS ThreeMonthsOrderQty,
        SUM(TotalPrice) AS ThreeMonthsRevenue,
        COUNT(DISTINCT RetailerCode) AS ThreeMonthsDistinctRetailerCount
    FROM 
        MBROrders
    WHERE 
        (YEAR(OrderDate)= YEAR(GETDATE()) AND MONTH(OrderDate) = MONTH(GETDATE()) - 3)
        OR (YEAR(OrderDate) = YEAR(GETDATE()) - 1 AND MONTH(GETDATE()) = 1 AND MONTH(OrderDate) = 12) -- Handle December to January transition
    GROUP BY 
        Region
)

SELECT 
    COALESCE(CurrentMonth.Region, PreviousMonth.Region, TwoMonthsAgo.Region, ThreeMonthsAgo.Region) AS Region,
   -- DATENAME(MONTH, GETDATE()) AS CurrentMonthName,
   -- DATENAME(MONTH, DATEADD(MONTH, -1, GETDATE())) AS PreviousMonthName,
   -- DATENAME(MONTH, DATEADD(MONTH, -2, GETDATE())) AS TwoMonthsAgoName,
   -- DATENAME(MONTH, DATEADD(MONTH, -3, GETDATE())) AS ThreeMonthsAgoName,
   -- ISNULL(CurrentMonth.CurrentOrderQty, 0) AS CurrentMonthOrderQty,
   -- ISNULL(PreviousMonth.PreviousOrderQty, 0) AS PreviousMonthOrderQty,
   -- ISNULL(TwoMonthsAgo.TwoMonthsOrderQty, 0) AS TwoMonthsOrderQty,
   -- ISNULL(ThreeMonthsAgo.ThreeMonthsOrderQty, 0) AS ThreeMonthsOrderQty,
   -- ISNULL(CurrentMonth.CurrentRevenue, 0) AS CurrentMonthRevenue,
   -- ISNULL(PreviousMonth.PreviousRevenue, 0) AS PreviousMonthRevenue,
   -- ISNULL(TwoMonthsAgo.TwoMonthsRevenue, 0) AS TwoMonthsRevenue,
   -- ISNULL(ThreeMonthsAgo.ThreeMonthsRevenue, 0) AS ThreeMonthsRevenue,
   -- ISNULL(CurrentMonth.CurrentDistinctRetailerCount, 0) AS CurrentDistinctRetailerCount,
   -- ISNULL(PreviousMonth.PreviousDistinctRetailerCount, 0) AS PreviousDistinctRetailerCount,
   -- ISNULL(TwoMonthsAgo.TwoMonthsDistinctRetailerCount, 0) AS TwoMonthsDistinctRetailerCount,
   -- ISNULL(ThreeMonthsAgo.ThreeMonthsDistinctRetailerCount, 0) AS ThreeMonthsDistinctRetailerCount,
    ISNULL(CurrentMonth.CurrentOrderQty, 0) - ISNULL(PreviousMonth.PreviousOrderQty, 0) AS QTYFromPrevious,
    ISNULL(CurrentMonth.CurrentRevenue, 0) - ISNULL(PreviousMonth.PreviousRevenue, 0) AS valueFromPrevious,
	ISNULL(CurrentMonth.CurrentDistinctRetailerCount, 0) - ISNULL(PreviousMonth.PreviousDistinctRetailerCount, 0) AS noofretailersFromPrevious,

    ISNULL(CurrentMonth.CurrentOrderQty, 0) - ISNULL(TwoMonthsAgo.TwoMonthsOrderQty, 0) AS QTYFromTwoMonthsAgo,
    ISNULL(CurrentMonth.CurrentRevenue, 0) - ISNULL(TwoMonthsAgo.TwoMonthsRevenue, 0) AS ValueFromTwoMonthsAgo,
    ISNULL(CurrentMonth.CurrentDistinctRetailerCount, 0) - ISNULL(TwoMonthsAgo.TwoMonthsDistinctRetailerCount, 0) AS noofretailersFromTwoMonthsAgo,

    ISNULL(CurrentMonth.CurrentOrderQty, 0) - ISNULL(ThreeMonthsAgo.ThreeMonthsOrderQty, 0) AS QTYFromThreeMonthsAgo,
    ISNULL(CurrentMonth.CurrentRevenue, 0) - ISNULL(ThreeMonthsAgo.ThreeMonthsRevenue, 0) AS ValueFromThreeMonthsAgo,
    ISNULL(CurrentMonth.CurrentDistinctRetailerCount, 0) - ISNULL(ThreeMonthsAgo.ThreeMonthsDistinctRetailerCount, 0) AS noofretailersFromThreeMonthsAgo
FROM 
    CurrentMonth
FULL OUTER JOIN 
    PreviousMonth ON CurrentMonth.Region = PreviousMonth.Region
FULL OUTER JOIN 
    TwoMonthsAgo ON COALESCE(CurrentMonth.Region, PreviousMonth.Region) = TwoMonthsAgo.Region
FULL OUTER JOIN 
    ThreeMonthsAgo ON COALESCE(CurrentMonth.Region, PreviousMonth.Region) = ThreeMonthsAgo.Region
ORDER BY 
    Region;

--------------------------------------------------------------- Region wise Growth over previous Months--------------------------------------
WITH MonthlySales AS (
    SELECT 
        Region,
        YEAR(OrderDate) AS OrderYear,
        MONTH(OrderDate) AS OrderMonth,
        SUM(OrderQty) AS TotalOrderQty,
        SUM(TotalPrice) AS TotalRevenue,
        COUNT(DISTINCT RetailerCode) AS DistinctRetailerCount
    FROM 
        MBROrders
    WHERE 
        OrderDate IS NOT NULL
    GROUP BY 
        Region, YEAR(OrderDate), MONTH(OrderDate)
),
CurrentMonth AS (
    SELECT 
        SUM(OrderQty) AS CurrentOrderQty,
        SUM(TotalPrice) AS CurrentRevenue,
        COUNT(DISTINCT RetailerCode) AS CurrentDistinctRetailerCount
    FROM 
        MBROrders
    WHERE 
        YEAR(OrderDate) = YEAR(GETDATE()) AND
        MONTH(OrderDate) = MONTH(GETDATE())
),
PreviousMonth AS (
    SELECT 
        SUM(OrderQty) AS PreviousOrderQty,
        SUM(TotalPrice) AS PreviousRevenue,
        COUNT(DISTINCT RetailerCode) AS PreviousDistinctRetailerCount
    FROM 
        MBROrders
    WHERE 
        (YEAR(OrderDate) = YEAR(GETDATE()) AND MONTH(OrderDate) = MONTH(GETDATE()) - 1)
        OR (YEAR(OrderDate) = YEAR(GETDATE()) - 1 AND MONTH(GETDATE()) = 1 AND MONTH(OrderDate) = 12)
),
Previous2Month AS (
    SELECT 
        SUM(OrderQty) AS PreviousOrderQty2,
        SUM(TotalPrice) AS PreviousRevenue2,
        COUNT(DISTINCT RetailerCode) AS PreviousDistinctRetailerCount2
    FROM 
        MBROrders
    WHERE 
        (YEAR(OrderDate) = YEAR(GETDATE()) AND MONTH(OrderDate) = MONTH(GETDATE()) - 2)
        OR (YEAR(OrderDate) = YEAR(GETDATE()) - 1 AND MONTH(GETDATE()) = 1 AND MONTH(OrderDate) = 12)
)
SELECT 
    cm.CurrentOrderQty,
    pm.PreviousOrderQty,
	pm.PreviousRevenue,
	cm.CurrentRevenue,
	pm.PreviousDistinctRetailerCount,
	cm.CurrentDistinctRetailerCount,
	p2m.PreviousOrderQty2,
	p2m.PreviousRevenue2,
	p2m.PreviousDistinctRetailerCount2,

    (CASE 
        WHEN pm.PreviousOrderQty = 0 THEN NULL 
        ELSE ((cm.CurrentOrderQty - pm.PreviousOrderQty) / pm.PreviousOrderQty) * 100 
    END) AS GrowthPercentage
FROM 
    CurrentMonth cm,
    PreviousMonth pm,
	Previous2Month p2m;

----------------------------------------------------------------------Region Wise Monthly Distribution------------------------------------------------------

