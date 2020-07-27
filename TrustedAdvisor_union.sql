SELECT line_item_usage_account_id,
         cast(sum(line_item_unblended_cost)as varchar) AS line_item_unblended_cost ,
        line_item_product_code,
         line_item_line_item_type
FROM "Database_Value"."cur"
WHERE month = '6'
        AND year = '2020'
        AND line_item_usage_account_id = ''
        AND line_item_line_item_type = 'Usage'
GROUP BY  line_item_usage_account_id,line_item_product_code, line_item_line_item_type 
union 
SELECT account_id,"estimated monthly savings", 
         name,
         'TA'
FROM "Database_Value"."trusted_advisor"
WHERE account_id =''
        AND month = '6'
        AND year = '2020' 
group by account_id, name, "estimated monthly savings"