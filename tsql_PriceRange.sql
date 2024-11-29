use tempDB
GO

Declare @lookBack int = 3

----
DROP TABLE IF EXISTS tempdb.dbo.stockPrices;

CREATE TABLE tempdb.dbo.stockPrices (
               ID      int
             , Price   int
             ) 

INSERT INTO tempdb.dbo.stockPrices
       ( ID , Price )
VALUES (  1 , 120   )
     , (  2 , 121   )
     , (  3 , 122   )
     , (  4 , 121   )
     , (  5 , 118   )
     , (  6 , 119   )
     , (  7 , 121   )
     , (  8 , 122   )
     , (  9 , 120   )
     , ( 10 , 118   )
     , ( 11 , 121   )
     , ( 12 , 123   )
     , ( 13 , 125   )
     , ( 14 , 126   )
     , ( 15 , 127   )

----
Declare @sqlCmd nvarchar(4000)

SET @sqlCmd = N'
SELECT ID
     , Price
     , MIN( Price ) over(Order by ID
                         Rows between ' + CAST(@lookBack as nchar(2)) + ' preceding and current row)  as ''min_Price''
     , MAX( Price ) over(Order by ID
                         Rows between ' + CAST(@lookBack as nchar(2)) + ' preceding and current row)  as ''max_Price''
FROM   tempdb.dbo.stockPrices
'

--select @sqlCmd
EXEC sp_executesql @sqlCmd


