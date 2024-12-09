-- tsql_crossJoin_sample

DECLARE @cnt_marks int = 3

;
WITH
SubQuery as
(
SELECT 0 as 'val'  UNION
SELECT 1
) , 
SQ_crossJoin as
(
SELECT S1.val  as 'col_1'
     , S2.val  as 'col_2'
     , S3.val  as 'col_3'
     , S4.val  as 'col_4'
     , S5.val  as 'col_5'
     , S1.val + S2.val + S3.val + S4.val + S5.val  as 'sum_Row'
FROM   SubQuery S1
cross  join
       SubQuery S2
cross  join
       SubQuery S3
cross  join
       SubQuery S4
cross  join
       SubQuery S5
)
SELECT *
FROM   SQ_crossJoin
WHERE  sum_Row = @cnt_marks
ORDER  by 1, 2, 3, 4, 5

----  end
