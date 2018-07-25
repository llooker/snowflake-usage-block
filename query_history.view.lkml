view: query_history {
  sql_table_name: ACCOUNT_USAGE.QUERY_HISTORY ;;

#   dimension: id {
#     primary_key: yes
#     type: string
#     sql: ${TABLE}.ID ;;
#   }

  dimension: compilation_time {
    type: string
    sql: ${TABLE}.COMPILATION_TIME ;;
  }

#   dimension: database_id {
#     type: number
#     # hidden: yes
#     sql: ${TABLE}.DATABASE_ID ;;
#   }

  dimension: database_name {
    type: string
    sql: ${TABLE}.DATABASE_NAME ;;
  }

  dimension_group: end {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.END_TIME ;;
  }

  dimension: error_code {
    type: string
    sql: ${TABLE}.ERROR_CODE ;;
  }

  dimension: error_name {
    type: string
    sql: ${TABLE}.ERROR_NAME ;;
  }

  dimension: execution_status {
    type: string
    sql: ${TABLE}.EXECUTION_STATUS ;;
  }

  dimension: execution_time {
    type: number
    sql: ${TABLE}.EXECUTION_TIME ;;
  }

#   dimension: job_tag {
#     type: string
#     sql: ${TABLE}.JOB_TAG ;;
#   }

  dimension: query_id {
    type: string
    sql: ${TABLE}.QUERY_ID ;;
  }

  dimension: query_tag {
    type: string
    sql: ${TABLE}.QUERY_TAG ;;
  }

  dimension: query_text {
    type: string
    sql: ${TABLE}.QUERY_TEXT ;;
  }

  dimension: query_type {
    type: string
    sql: ${TABLE}.QUERY_TYPE ;;
  }

  dimension: queued_overload_time {
    type: string
    sql: ${TABLE}.QUEUED_OVERLOAD_TIME ;;
  }

  dimension: queued_provisioning_time {
    type: string
    sql: ${TABLE}.QUEUED_PROVISIONING_TIME ;;
  }

  dimension: queued_repair_time {
    type: string
    sql: ${TABLE}.QUEUED_REPAIR_TIME ;;
  }

  dimension: role_name {
    type: string
    sql: ${TABLE}.ROLE_NAME ;;
  }

  dimension: session_id {
    type: number
    sql: ${TABLE}.SESSION_ID ;;
  }

  dimension_group: start {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      day_of_month,
      day_of_week,
      month_name,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.START_TIME ;;
  }

  dimension: total_elapsed_time {
    type: number
    sql: ${TABLE}.TOTAL_ELAPSED_TIME ;;
  }

  dimension: transaction_blocked_time {
    type: string
    sql: ${TABLE}.TRANSACTION_BLOCKED_TIME ;;
  }

  dimension: user_name {
    type: string
    sql: ${TABLE}.USER_NAME ;;
  }

#   dimension: warehouse_id {
#     type: number
#     sql: ${TABLE}.WAREHOUSE_ID ;;
#   }

  dimension: warehouse_name {
    type: string
    sql: ${TABLE}.WAREHOUSE_NAME ;;
  }

  dimension: warehouse_size {
    type: string
    sql: ${TABLE}.WAREHOUSE_SIZE ;;
  }

  dimension: warehouse_type {
    type: string
    sql: ${TABLE}.WAREHOUSE_TYPE ;;
  }

  dimension: is_prior_month_mtd {
    type: yesno
    sql:  EXTRACT(month, ${start_raw}) = EXTRACT(month, current_timestamp()) - 1
            and ${start_raw} <= dateadd(month, -1, current_timestamp())  ;;
  }

  measure: query_count {
    type: count
    drill_fields: [detail*]
    alias: [job_count]
  }

  measure: current_mtd_query_count {
    type: count
    filters: {field: start_date value: "this month"}
    alias: [current_mtd_job_count, current_month_job_count]
  }

  measure: prior_month_total_query_count {
    type: count
    filters: {field: start_date value: "last month"}
    value_format_name: decimal_0
    alias: [prior_month_total_job_count]
  }

  measure: prior_mtd_query_count {
    type: count
    filters: {field: is_prior_month_mtd value: "yes"}
    value_format_name:  decimal_0
    alias: [prior_mtd_job_count, prior_month_job_count]
  }

  measure: average_execution_time {
    type: average
    sql: ${execution_time} ;;
    value_format_name: decimal_2
  }

  measure: total_execution_time {
    type: sum
    sql: ${execution_time} ;;
    value_format_name: decimal_2
  }

  measure: current_mtd_avg_exec_time {
    type: average
    sql: ${execution_time} ;;
    filters: {field: start_date value: "this month"}
    value_format_name: decimal_2
  }

  measure: prior_mtd_avg_exec_time {
    type:  average
    sql:  ${execution_time} ;;
    filters: {field: is_prior_month_mtd value: "yes"}
    value_format_name: decimal_2
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      #id,
      user_name,
      role_name,
      database_name,
      warehouse_name,
      #databases.id,
      databases.database_name
    ]
  }
}
