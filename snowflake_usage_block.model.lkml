connection: "snowflake-usage"

# include all the views
include: "*.view"

# include all the dashboards
include: "account_usage_dashboard.dashboard.lookml"

datagroup: snowflake_usage_block_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

named_value_format: conditional_to_millions {
  value_format: "[>=1000000]0,,\"M\";[>=1000]0,\"K\";0"
}

persist_with: snowflake_usage_block_default_datagroup

explore: login_history {
}

explore: query_history {
  join: databases {
    type: left_outer
    sql_on: ${query_history.database_name} = ${databases.database_name} ;;
    relationship: many_to_one
  }
  join: _squad_schema_mapping {
    sql_on:
      ${query_history.database_name} = ${_squad_schema_mapping.database_name}
      AND ${query_history.schema_name} = ${_squad_schema_mapping.schema_name} ;;
    relationship: many_to_one
  }
  join: _squad_warehouse_mapping {
    sql_on: ${query_history.warehouse_name} = ${_squad_warehouse_mapping.warehouse_name} ;;
    relationship: many_to_one
  }
#   join: schemata {
#     type: left_outer
#     sql_on: ${databases.id} = ${schemata.id} ;;
#     relationship: one_to_many
#   }
}

# explore: schemata {
#   join: databases {
#     type: left_outer
#     sql_on: ${schemata.database_id} = ${databases.id} ;;
#     relationship: many_to_one
#   }
# }

explore: load_history {
  fields: [ALL_FIELDS*,-tables.table_name,-tables.id]
  join: tables {
    sql_on: ${load_history.table_id} = ${tables.id} ;;
    relationship: many_to_one
  }
  join: _squad_schema_mapping {
    sql_on:
      ${load_history.catalog_name} = ${_squad_schema_mapping.database_name}
      AND ${load_history.schema_name} = ${_squad_schema_mapping.schema_name} ;;
    relationship: many_to_one
  }
}

explore: storage_usage {}

explore: warehouse_metering_history {
  join: _squad_warehouse_mapping {
    sql_on: ${warehouse_metering_history.warehouse_name} = ${_squad_warehouse_mapping.warehouse_name} ;;
    relationship: many_to_one
  }
}

# explore: columns {}
#
# explore: databases {}
#
# explore: file_formats {}
#
# explore: functions {}
#
# explore: referential_constraints {}
#
# explore: sequences {}
#
# explore: stages {}
#
# explore: table_constraints {}
#

explore: table_storage_metrics {
  join: _squad_schema_mapping {
    sql_on:
      ${table_storage_metrics.database_name} = ${_squad_schema_mapping.database_name}
      AND ${table_storage_metrics.schema_name} = ${_squad_schema_mapping.schema_name} ;;
    relationship: many_to_one
  }
}

#
# explore: tables {}
#
# explore: views {}

explore: task_history {
  join: query_history {
    type: left_outer
    relationship: one_to_one
    sql_on: ${task_history.query_id} = ${query_history.query_id} ;;
  }
  join: _squad_schema_mapping {
    type: left_outer
    relationship: many_to_one
    sql_on: ${query_history.database_name} = ${_squad_schema_mapping.database_name}
      AND ${query_history.schema_name} = ${_squad_schema_mapping.schema_name} ;;
  }
  join: _squad_warehouse_mapping {
    type: left_outer
    relationship: many_to_one
    sql_on: ${query_history.warehouse_name} = ${_squad_warehouse_mapping.warehouse_name} ;;
  }
}
