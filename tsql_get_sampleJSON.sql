CREATE PROC dbo.usp_get_sampleJSON   
as
BEGIN

DECLARE @rand    nvarchar(60)
      , @return  nvarchar(4000)

SET  @rand = REPLACE(
             REPLACE(
             REPLACE(
             REPLACE(
             REPLACE(
             REPLACE( newID(), 'A', '10' )
                             , 'B', '11' )
                             , 'C', '12' )
                             , 'D', '13' )
                             , 'E', '14' )
                             , 'F', '15' )
                                          
 
SET @return = '{"Value":'                                  
            +  FORMAT( 100 * RAND( LEFT(@rand, 8) ) , '0') 
            + '}'                                          

--set @return = null
---- return
SELECT @return            as 'JSON_return'  
     , ISJSON( @return )  as 'JSON_valid'   
--     ISJSON   Returns 1 if the string contains valid JSON  

END  --  end PROC
