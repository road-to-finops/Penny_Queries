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

 SELECT account_id, cast(coalesce("estimated monthly savings",'0') as decimal) as estimatedmonthlysavings,  cast(coalesce("estimated monthly savings (on demand)" ,'0')as decimal)  as estimatedmonthlysavingsod, cast(coalesce("monthly storage cost" ,'0')as decimal)  as monthlystoragecost,
         name, 
         'TA'
FROM "kpmgcostanalysisathenadatabase"."trusted_advisor"
WHERE account_id ='949913358111'
        AND month = '7'
        AND year = '2020' 
 and name <> 'Savings Plan'


 SELECT line_item_usage_account_id,
cast(sum(line_item_unblended_cost)as varchar) AS line_item_unblended_cost ,
line_item_product_code,
line_item_line_item_type
FROM "kpmgcostanalysisathenadatabase"."k_p_m_g_billing_athena_with_i_d"
WHERE month = '6'
AND year = '2020'
AND line_item_usage_account_id = '949913358111'
AND line_item_line_item_type = 'Usage'
GROUP BY line_item_usage_account_id,line_item_product_code, line_item_line_item_type
union
SELECT account_id,"estimated monthly savings",
name,
'TA'
FROM "kpmgcostanalysisathenadatabase"."trusted_advisor"
WHERE account_id ='949913358111'
AND month = '6'
AND year = '2020'
group by account_id, name, "estimated monthly savings