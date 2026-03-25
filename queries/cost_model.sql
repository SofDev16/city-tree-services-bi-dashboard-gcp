WITH tree_costs AS (
  SELECT
    tree_id,
    species,
    neighborhood,

    -- Cost simulation per service type
    CASE
      WHEN species LIKE '%Maple%' THEN 30
      WHEN species LIKE '%Pine%' THEN 20
      WHEN species LIKE '%Oak%' THEN 25
      ELSE 10
    END AS estimated_service_cost
  FROM `your_project.your_dataset.your_table`
)

SELECT
  neighborhood,
  species,

  COUNT(tree_id) AS total_trees_serviced,
  SUM(estimated_service_cost) AS total_estimated_cost,
  AVG(estimated_service_cost) AS avg_cost_per_tree,

  -- Operational intensity score (FinOps-style KPI)
  SUM(estimated_service_cost) / COUNT(tree_id) AS cost_efficiency_ratio

FROM tree_costs
GROUP BY neighborhood, species
ORDER BY total_estimated_cost DESC;
