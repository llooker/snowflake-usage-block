view: storage_usage {
  sql_table_name: SNOWFLAKE.ACCOUNT_USAGE.DATABASE_STORAGE_USAGE_HISTORY ;;

  dimension: database_id {
    type: number
    sql: ${TABLE}.DATABASE_ID ;;
  }

  dimension: database_name {
    type: string
    sql: ${TABLE}.DATABASE_NAME ;;
  }

  dimension_group: deleted {
    type: time
    sql: ${TABLE}.DELETED ;;
  }

  dimension_group: usage {
    type: time
    datatype: date
    timeframes: [
      date,
      week,
      week_of_year,
      day_of_week,
      day_of_month,
      month_num,
      month,
      quarter,
      year
    ]
    convert_tz: no
    sql: ${TABLE}.USAGE_DATE ;;
    alias: [read]
  }

  measure: count {
    type: count
    drill_fields: []
  }

  measure: storage_bytes {
    type: sum
    sql: ${TABLE}.AVERAGE_DATABASE_BYTES ;;
    value_format_name: decimal_2
  }

  measure: storage_tb {
    type: number
    sql: ${storage_bytes} / power(1024, 4) ;;
    value_format_name: decimal_4
    alias: [average_storage_tb]
  }

  measure: failsafe_bytes {
    type: sum
    sql: ${TABLE}.AVERAGE_FAILSAFE_BYTES ;;
    value_format_name: decimal_2
  }

  measure: failsafe_tb {
    type: number
    sql: ${failsafe_bytes} / power(1024, 4) ;;
    value_format_name: decimal_4
    alias: [average_failsafe_tb]
  }

  measure: total_bytes {
    type: number
    sql: ${storage_bytes} + ${failsafe_bytes} ;;
    value_format_name: decimal_2
  }

  measure: total_tb {
    type: number
    sql: ${total_bytes} / power(1024, 4) ;;
    value_format_name: decimal_4
    alias: [billable_tb]
  }

  measure: curr_mtd_billable_bytes {
    type: sum
    sql:  ${TABLE}.AVERAGE_DATABASE_BYTES + ${TABLE}.AVERAGE_FAILSAFE_BYTES;;
    filters: {field: usage_date value: "this month"}
    value_format_name: decimal_2
  }

  measure: curr_mtd_billable_tb {
    type: number
    sql: ${curr_mtd_billable_bytes} / power(1024, 4) ;;
    value_format_name: decimal_4
  }

  measure: prior_mtd_billable_bytes {
    type: sum
    sql:  ${TABLE}.AVERAGE_DATABASE_BYTES + ${TABLE}.AVERAGE_FAILSAFE_BYTES;;
    filters: {field: usage_date value: "last month"}
    value_format_name: decimal_2
  }

  measure: prior_mtd_billable_tb {
    type: number
    sql: ${prior_mtd_billable_bytes} / power(1024, 4) ;;
    value_format_name: decimal_4
  }

  measure: total_cost_usd {
    type: number
    sql:  IFNULL(${total_tb}, 0) * 23 ;;
    value_format_name: usd
    drill_fields: [usage_date, total_cost_usd]
  }

  measure: curr_mtd_cost_usd {
    type: number
    sql:  IFNULL(${curr_mtd_billable_tb}, 0) * 23 ;;
    value_format_name: usd
    drill_fields: [usage_date, curr_mtd_cost_usd]
  }

  measure: prior_mtd_cost_usd {
    type: number
    sql:  IFNULL(${prior_mtd_billable_tb}, 0) * 23 ;;
    value_format_name: usd
    drill_fields: [usage_date, prior_mtd_cost_usd]
  }
}
