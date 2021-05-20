view: task_history {

  sql_table_name: snowflake.account_usage.task_history ;;

  dimension: task_run_id {
    type: string
    hidden: yes
    primary_key: yes
    sql: ${TABLE}.root_task_id || '-' || ${TABLE}.run_id ;;
  }

  dimension: task_name {
    type: string
    sql: ${TABLE}.name ;;
    group_label: "FQN"
  }

  dimension: database_name {
    type: string
    sql: ${TABLE}.database_name ;;
    group_label: "FQN"
  }

  dimension: schema_name {
    type: string
    sql: ${TABLE}.schema_name ;;
    group_label: "FQN"
  }

  dimension: query_id {
    type: string
    sql: ${TABLE}.query_id ;;
    group_label: "Query"
  }

  dimension: query_text {
    type: string
    sql: ${TABLE}.query_text ;;
    group_label: "Query"
  }

  dimension: condition_text {
    type: string
    sql: ${TABLE}.condition_text ;;
    group_label: "Execution"
  }

  dimension: status {
    type: string
    sql: INITCAP(${TABLE}.state) ;;
    group_label: "Execution"
  }

  dimension: error_code {
    type: number
    sql: ${TABLE}.error_code ;;
    value_format_name: decimal_0
    group_label: "Execution"
  }

  dimension: root_task_id {
    type: string
    sql: ${TABLE}.root_task_id ;;
    group_label: "Execution"
  }

  dimension: graph_version {
    type: number
    sql: ${TABLE}.graph_version ;;
    value_format_name: decimal_0
    group_label: "Execution"
  }

  dimension: run_id {
    type: number
    sql: ${TABLE}.run_id ;;
    value_format_name: decimal_0
    group_label: "Execution"
  }

  dimension: return_value {
    type: string
    sql: ${TABLE}.return_value ;;
    group_label: "Execution"
  }

  dimension_group: originally_scheduled {
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
    sql: TO_TIMESTAMP_LTZ(${TABLE}.run_id, 3) ;;
    group_label: "Date -    Originally Scheduled"
  }

  dimension_group: scheduled {
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
    sql: ${TABLE}.scheduled_time ;;
    group_label: "Date -   Scheduled"
  }

  dimension_group: query_started {
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
    sql: ${TABLE}.query_start_time ;;
    group_label: "Date -  Query Started"
  }

  dimension_group: completed {
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
    sql: ${TABLE}.completed_time ;;
    group_label: "Date - Completed"
  }

  measure: run_count {
    type: count_distinct
    sql: ${task_run_id} ;;
    value_format_name: decimal_0
    group_label: "Counts"
  }

  measure: total_runtime {
    type: sum
    sql: DATEDIFF('seconds', ${TABLE}.query_start_time, ${TABLE}.completed_time) ;;
    value_format_name: decimal_0
    group_label: "Runtime"
  }

  measure: average_runtime {
    type: average
    sql: DATEDIFF('seconds', ${TABLE}.query_start_time, ${TABLE}.completed_time) ;;
    value_format_name: decimal_2
    group_label: "Runtime"
  }

}
