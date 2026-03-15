# Dell-Inventory-Replenishment-Dashboard
Supply chain analytics dashboard using SQL and Power BI to monitor Dell component inventory levels, demand trends, supplier contributions, and reorder risks.

**Tools Used:** SQLite · Excel/CSV · Power BI

## Dashboard Highlights
- **$4M** total inventory value across 27K+ units
- Demand trend line chart (Jan 2025)
- Inventory breakdown by supplier (Intel, NVIDIA, Samsung, Micron, ASUS, Corsair) and component (CPU, GPU, RAM, SSD, etc.)
- Reorder monitoring table with color-coded alerts (all 7 components currently flagged)

## Database Schema (`supply_chain_project.db`)

Single `Inventory` table with columns: `date`, `component`, `daily_demand`, `inventory_on_hand`, `lead_time_days`, `supplier`, `unit_cost`, `safety_stock`, `reorder_point`, `order_quantity`, `order_placed`, `Inventory_after_demand`, `Expected_arrival_date`, `Inventory_after_replenishment`

## How to Run

1. **Database** — Open `supply_chain_project.db` in [DB Browser for SQLite](https://sqlitebrowser.org/)
2. **SQL Queries** — Run `Dell_replenishment query.sql` against the database
3. **Raw Data** — Open `dell_replenishment_data.csv.xlsx` in Excel
4. **Dashboard** — Open `inventoy_dash.pbix` in [Power BI Desktop](https://powerbi.microsoft.com/desktop/)

 :D
