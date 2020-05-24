SELECT
  invoice.month AS year_month,
  project.name,
  JSON_EXTRACT_SCALAR(TO_JSON_STRING(project.labels),
    "$[0].value") AS gcp_cost_codes, 
    c.name as cred_name,
  SUM(IFNULL((
      SELECT
        SUM(c.amount)
      FROM
        UNNEST(credits) c),
      0)) AS credits
FROM
  billing.<export_table_name> project_name, unnest(credits) as c
WHERE
  invoice.month = "202002" and c.name = 'Sustained Usage Discount' GROUP BY 1, 2, 3, cred_name ORDER BY 1 ASC, 2 ASC