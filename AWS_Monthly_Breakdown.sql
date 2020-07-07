-- split out the different months
SELECT "line_item_usage_account_id",
         line_item_product_code,
sum(case when month = '1' then round("line_item_unblended_cost",2) else 0 end) as Jan, 
sum(case when month = '2' then round("line_item_unblended_cost",2) else 0 end) as Feb, 
sum(case when month = '3' then round("line_item_unblended_cost",2) else 0 end) as Mar, 
sum(case when month = '4' then round("line_item_unblended_cost",2) else 0 end) as Apr, 
sum(case when month = '5' then round("line_item_unblended_cost",2) else 0 end) as May, 
sum(case when month = '6' then round("line_item_unblended_cost",2) else 0 end) as Jun, 
sum(case when month = '7' then round("line_item_unblended_cost",2) else 0 end) as Jul, 
sum(case when month = '8' then round("line_item_unblended_cost",2) else 0 end) as Aug, 
sum(case when month = '9' then round("line_item_unblended_cost",2) else 0 end) as Sep, 
sum(case when month = '10' then round("line_item_unblended_cost",2) else 0 end) as Oct, 
sum(case when month = '11' then round("line_item_unblended_cost",2) else 0 end) as Nov, 
sum(case when month = '12' then round("line_item_unblended_cost",2) else 0 end) as Dec

FROM <CUR_DB>.<CUR_Table>

WHERE if((date_format(current_timestamp , '%M') = 'January'), year = CAST((year(now())-1) AS VARCHAR) ,year = CAST(year(now()) AS VARCHAR))
GROUP BY  line_item_usage_account_id, line_item_product_code
