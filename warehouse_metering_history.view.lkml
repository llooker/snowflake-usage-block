view: warehouse_metering_history {
  sql_table_name: SNOWFLAKE.ACCOUNT_USAGE.WAREHOUSE_METERING_HISTORY ;;

  dimension_group: start {
    type: time
    timeframes: [
      raw,
      time,
      date,
      day_of_month,
      day_of_week,
      day_of_year,
      week,
      week_of_year,
      month,
      month_num,
      quarter,
      year
    ]
    sql: ${TABLE}.START_TIME ;;
    alias: [read_hour]
  }

  dimension_group: end {
    type: time
    timeframes: [
      raw,
      time,
      date,
      day_of_month,
      day_of_week,
      day_of_year,
      week,
      week_of_year,
      month,
      month_num,
      quarter,
      year
    ]
    sql: ${TABLE}.END_TIME ;;
  }

  dimension: warehouse_id {
    type: string
    sql: ${TABLE}.WAREHOUSE_ID ;;
  }

  dimension: warehouse_name {
    type: string
    sql: ${TABLE}.WAREHOUSE_NAME ;;
  }

  dimension: is_prior_month_mtd {
    type: yesno
    sql:  EXTRACT(month, ${start_raw}) = EXTRACT(month, current_timestamp()) - 1
      and ${start_raw} <= dateadd(month, -1, current_timestamp())  ;;
  }

  measure: count {
    type: count
    drill_fields: [warehouse_name,count]
  }

  measure: average_credits_used {
    type: average
    sql:  ${TABLE}.CREDITS_USED ;;
    value_format_name: decimal_2
    drill_fields: [start_date, average_credits_used]
  }

  measure: total_credits_used {
    type: sum
    sql:  ${TABLE}.CREDITS_USED ;;
    value_format_name: decimal_2
    drill_fields: [start_date, total_credits_used]
  }

  measure: current_mtd_credits_used {
    type: sum
    sql:  ${TABLE}.CREDITS_USED ;;
    filters: {field: start_date value: "this month"}
    value_format_name: decimal_2
    drill_fields: [warehouse_name,total_credits_used]
  }

  measure: prior_mtd_credits_used {
    type: sum
    sql:  ${TABLE}.CREDITS_USED ;;
    filters: {field: is_prior_month_mtd value: "yes"}
    value_format_name: decimal_2
    drill_fields: [warehouse_name,total_credits_used]
  }

  measure: average_cost_usd {
    type: number
    sql:  IFNULL(${average_credits_used}, 0) * 3.05 ;;
    value_format_name: usd
    drill_fields: [start_date, average_cost_usd]
  }

  measure: total_cost_usd {
    type: number
    sql:  IFNULL(${total_credits_used}, 0) * 3.05 ;;
    value_format_name: usd
    drill_fields: [start_date, total_cost_usd]
  }

  measure: current_mtd_cost_usd {
    type: number
    sql:  IFNULL(${current_mtd_credits_used}, 0) * 3.05 ;;
    value_format_name: usd
    drill_fields: [start_date, current_mtd_cost_usd]
  }

  measure: prior_mtd_cost_usd {
    type: number
    sql:  IFNULL(${prior_mtd_credits_used}, 0) * 3.05 ;;
    value_format_name: usd
    drill_fields: [start_date, prior_mtd_cost_usd]
  }

}
