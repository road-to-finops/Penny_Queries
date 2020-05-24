SELECT
  distinct(c.name)
FROM
  billing.<export_table_name>, unnest(credits) as c
  


SELECT
project.name as project,
invoice.month as month,
ROUND(SUM(cost), 2) as charges,
ROUND(SUM((SELECT SUM(amount) FROM UNNEST(credits))),2) as credits
FROM billing.<export_table_name>
GROUP BY project, month
ORDER by project, month