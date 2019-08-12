connection: "socar_data_bigquery"

# include all the views
include: "*.view"

datagroup: socar_test_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: socar_test_default_datagroup

explore: profit_per_car_daily {}

# - explore: accident_cost_parameter_1

# - explore: accident_cost_parameter_2

# - explore: deprecation_cost_parameter

# - explore: fuel_cost_parameter

# - explore: monthly_cost_parameter

# - explore: operation_time_per_team_daily

# - explore: profit_per_car_monthly

# - explore: profit_per_car_weekly

# - explore: region_group

# - explore: socar_pass_parameter

# - explore: wash_cost_parameter
