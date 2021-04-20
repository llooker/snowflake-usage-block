include: "/*.view.lkml"

explore: login_history {}

explore: query_history {
  join: databases {
    type: left_outer
    sql_on: ${query_history.database_name} = ${databases.database_name} ;;
    relationship: many_to_one
  }
}

explore: load_history {
  fields: [ALL_FIELDS*,-tables.table_name,-tables.id]
  join: tables {
    sql_on: ${load_history.table_id} = ${tables.id} ;;
    relationship: many_to_one
  }
}

explore: storage_usage {}

explore: warehouse_metering_history {}

explore: automatic_clustering_history {}

explore: pipe_usage_history {}

explore: credit_usage_history {}
