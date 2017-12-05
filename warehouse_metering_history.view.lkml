view: warehouse_metering_history {
  sql_table_name: ACCOUNT_USAGE_DEV.WAREHOUSE_METERING_HISTORY ;;

  dimension: credits {
    type: number
    sql: ${TABLE}.CREDITS ;;
  }

  dimension_group: read_hour {
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
    sql: ${TABLE}.READ_HOUR ;;
  }

  dimension: warehouse_id {
    type: string
    sql: ${TABLE}.WAREHOUSE_ID ;;
  }

  dimension: warehouse_name {
    type: string
    sql: ${TABLE}.WAREHOUSE_NAME ;;
  }

  measure: count {
    type: count
    drill_fields: [warehouse_name]
  }

  measure: average_credits_used {
    type: average
    sql:  ${credits} ;;
  }

  measure: total_credits_used {
    type: sum
    sql: ${credits} ;;
  }

  measure: current_mtd_credits_used {
    type: sum
    sql:  ${credits} ;;
    filters: {field: read_hour_date value: "this month"}
  }

  measure: prior_mtd_credits_used {
    type: sum
    sql:  ${credits} ;;
    filters: {field: read_hour_date value: "last month"}

  }

}
