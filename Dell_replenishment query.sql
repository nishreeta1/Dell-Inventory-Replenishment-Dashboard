-- 1. Total Inventory Value per Component
-- Shows the total units and monetary value of each component
SELECT 
    component,
    SUM(inventory_on_hand) AS total_inventory,
    unit_cost,
    SUM(inventory_on_hand * unit_cost) AS total_value
FROM inventory
GROUP BY component, unit_cost
ORDER BY total_value DESC;


-- 2. Total Units Sold per Component
-- Calculates how many units were sold based on daily demand
SELECT 
    component,
    SUM(daily_demand) AS total_sold
FROM inventory
GROUP BY component
ORDER BY total_sold DESC;


-- 3. Components Below Safety Stock
-- Identifies components that are running low in inventory
SELECT 
    component,
    inventory_on_hand,
    daily_demand,
    (inventory_on_hand - daily_demand * lead_time_days) AS projected_stock
FROM inventory
WHERE (inventory_on_hand - daily_demand * lead_time_days) < 0
ORDER BY projected_stock ASC;


-- 4. Total Cost per Supplier
-- Calculates how much inventory value is tied to each supplier
SELECT 
    supplier,
    SUM(inventory_on_hand * unit_cost) AS supplier_inventory_value
FROM inventory
GROUP BY supplier
ORDER BY supplier_inventory_value DESC;


-- 5. Reorder Recommendation
-- Suggests components that need to be reordered (if inventory will run out before next delivery)
SELECT 
    component,
    inventory_on_hand,
    daily_demand,
    lead_time_days,
    (inventory_on_hand - daily_demand * lead_time_days) AS projected_stock,
    CASE 
        WHEN (inventory_on_hand - daily_demand * lead_time_days) < 0 THEN 'Reorder'
        ELSE 'OK'
    END AS status
FROM inventory
ORDER BY projected_stock ASC;


-- 6. Average Daily Demand per Component
-- Calculates average daily demand for each component
SELECT 
    component,
    AVG(daily_demand) AS avg_daily_demand
FROM inventory
GROUP BY component
ORDER BY avg_daily_demand DESC;


-- 7. Total Inventory Value per Day
-- Shows total monetary value of all inventory for each date
SELECT 
    date,
    SUM(inventory_on_hand * unit_cost) AS total_inventory_value
FROM inventory
GROUP BY date
ORDER BY date ASC;


-- 8. Lead Time Analysis
-- Lists components with long lead times
SELECT 
    component,
    lead_time_days
FROM inventory
GROUP BY component, lead_time_days
ORDER BY lead_time_days DESC;
