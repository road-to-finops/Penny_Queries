SELECT
  invoice.month AS year_month,
  project.name,
  JSON_EXTRACT_SCALAR(TO_JSON_STRING(project.labels),
    "$[0].value") AS gcp_cost_codes,
  SUM(cost) + SUM(IFNULL((
      SELECT
        SUM(c.amount)
      FROM
        UNNEST(credits) c),
      0)) AS total,
  (SUM(CAST(cost * 1000000 AS int64)) + SUM(IFNULL((
        SELECT
          SUM(CAST(c.amount * 1000000 AS int64))
        FROM
          UNNEST(credits) c),
        0))) / 1000000 AS total_exact
FROM
  billing.<export_table_name>  project_name
WHERE
  invoice.month = "<yearmonth>"
GROUP BY
  1,
  2,
  3
ORDER BY
 1 ASC,
 2 ASC
