view: query_history {
  sql_table_name: SNOWFLAKE.ACCOUNT_USAGE.QUERY_HISTORY ;;

  dimension: compilation_time {
    type: string
    sql: ${TABLE}.COMPILATION_TIME ;;
  }

  dimension: looker_query_context {
    type: string
    hidden: yes
    sql: PARSE_JSON(regexp_substr(regexp_substr(query_text, 'Query\\sContext\\s\'\{.*\}\''),'\{.*\}')) ;;
  }

  dimension: looker_history_id {
    type: number
    sql: ${looker_query_context}:history_id ;;
  }

  dimension: looker_user_id {
    type: number
    sql: ${looker_query_context}:user_id ;;
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

  dimension: error_message {
    type: string
    sql: ${TABLE}.ERROR_MESSAGE ;;
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
    primary_key: yes
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

  dimension: elapsed_time {
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
    drill_fields: [user_name,warehouse_name,database_name,current_mtd_query_count]
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
    group_label: "Runtime Metrics"
    sql: ${execution_time} ;;
    value_format_name: decimal_2
  }

  measure: total_execution_time {
    type: sum
    group_label: "Runtime Metrics"
    sql: ${execution_time} ;;
    value_format_name: decimal_2
  }

  measure: total_queued_overload_time {
    type: sum
    group_label: "Runtime Metrics"
    sql: ${queued_overload_time} ;;
    value_format_name: decimal_2
  }

  measure: total_elapsed_time {
    type: sum
    group_label: "Runtime Metrics"
    sql: ${elapsed_time} ;;
    value_format_name: decimal_2
  }

  measure: total_queued_repair_time  {
    type: sum
    group_label: "Runtime Metrics"
    sql: ${queued_repair_time} ;;
    value_format_name: decimal_2
  }

  measure: total_compilation_time  {
    type: sum
    group_label: "Runtime Metrics"
    sql: ${compilation_time} ;;
    value_format_name: decimal_2
  }

  measure: total_queued_provisioning_time  {
    type: sum
    group_label: "Runtime Metrics"
    sql: ${queued_provisioning_time} ;;
    value_format_name: decimal_2
  }
  measure: total_transaction_blocked_time  {
    type: sum
    group_label: "Runtime Metrics"
    sql: ${transaction_blocked_time} ;;
    value_format_name: decimal_2
  }

  measure: current_mtd_avg_exec_time {
    type: average
    sql: ${execution_time} ;;
    group_label: "Runtime Metrics"
    filters: {field: start_date value: "this month"}
    value_format_name: decimal_2
    drill_fields: [user_name,warehouse_name,database_name,current_mtd_avg_exec_time]
  }

  measure: prior_mtd_avg_exec_time {
    type:  average
    sql:  ${execution_time} ;;
    group_label: "Runtime Metrics"
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
