SELECT line_item_usage_account_id,
         sum(line_item_unblended_cost) AS line_item_unblended_cost ,
        line_item_product_code,
         line_item_line_item_type
FROM "database_value"."cur_table"
WHERE month = '6'
        AND year = '2020'
        AND line_item_usage_account_id = '<Account_id>'
        AND line_item_line_item_type = 'Usage'
GROUP BY  line_item_usage_account_id,line_item_product_code, line_item_line_item_type 
union 
SELECT account_id, (estimatedmonthlysavings+estimatedmonthlysavingsod+ monthlystoragecost), name, type   from(
  SELECT account_id, cast(coalesce("estimated monthly savings",'0') as decimal) as estimatedmonthlysavings,  cast(coalesce("estimated monthly savings (on demand)" ,'0')as decimal)  as estimatedmonthlysavingsod, cast(coalesce("monthly storage cost" ,'0')as decimal)  as monthlystoragecost,
         name, 
         'TA' as type
FROM "database_value"."trusted_advisor"
WHERE account_id ='<Account_id>'
        AND month = '7'
        AND year = '2020' 
 and name <> 'Savings Plan')


 SELECT line_item_usage_account_id,
cast(sum(line_item_unblended_cost)as varchar) AS line_item_unblended_cost ,
line_item_product_code,
line_item_line_item_type
FROM "database_value"."cur_table"
WHERE month = '6'
AND year = '2020'
AND line_item_usage_account_id = '<ACCOUNT_ID>'
AND line_item_line_item_type = 'Usage'
GROUP BY line_item_usage_account_id,line_item_product_code, line_item_line_item_type
union
SELECT account_id,"estimated monthly savings",
name,
'TA'
FROM "database_value"."trusted_advisor"
WHERE account_id ='<ACCOUNT_ID>'
AND month = '6'
AND year = '2020'
group by account_id, name, "estimated monthly savings