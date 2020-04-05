SELECT sum(line_item_unblended_cost) FROM "Database"."Table" 
where "line_item_product_code" = 'OCBElasticComputeCloud' and line_item_line_item_type = 'Fee'
and month = '2' and year = '2020'