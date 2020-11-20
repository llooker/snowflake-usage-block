view: table_storage_metrics {
  sql_table_name: SNOWFLAKE.ACCOUNT_USAGE.TABLE_STORAGE_METRICS ;;

  dimension: table_name {
    type: string
    sql: ${TABLE}.TABLE_NAME ;;
  }

  dimension: schema_name {
    type: string
    sql: ${TABLE}.TABLE_SCHEMA ;;
  }

  dimension: database_name {
    type: string
    sql: ${TABLE}.TABLE_CATALOG ;;
  }

  dimension: is_transient {
    type: yesno
    sql: CASE WHEN ${TABLE}.IS_TRANSIENT = 'YES' THEN TRUE ELSE FALSE END ;;
  }

  dimension: deleted {
    type: yesno
    sql: ${TABLE}.DELETED ;;
  }

  dimension_group: database_created {
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
    sql: ${TABLE}.CATALOG_CREATED ;;
  }

  dimension_group: database_dropped {
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
    sql: ${TABLE}.CATALOG_DROPPED ;;
  }

  dimension_group: schema_created {
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
    sql: ${TABLE}.SCHEMA_CREATED ;;
  }

  dimension_group: schema_dropped {
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
    sql: ${TABLE}.SCHEMA_DROPPED ;;
  }

  dimension_group: table_created {
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
    sql: ${TABLE}.TABLE_CREATED ;;
  }

  dimension_group: table_dropped {
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
    sql: ${TABLE}.TABLE_DROPPED ;;
  }

  dimension_group: table_entered_failsafe {
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
    sql: ${TABLE}.TABLE_ENTERED_FAILSAFE ;;
  }

  measure: count {
    type: count
    drill_fields: [table_name]
  }

  measure: time_travel_bytes {
    type: sum
    sql: ${TABLE}.TIME_TRAVEL_BYTES ;;
    value_format_name: decimal_2
  }

  measure: time_travel_tb {
    type: number
    sql: ${time_travel_bytes} / power(1024, 4) ;;
    value_format_name: decimal_4
  }

  measure: active_bytes {
    type: sum
    sql: ${TABLE}.ACTIVE_BYTES ;;
    value_format_name: decimal_2
  }

  measure: active_tb {
    type: number
    sql: ${active_bytes} / power(1024, 4) ;;
    value_format_name: decimal_4
  }

  measure: failsafe_bytes {
    type: sum
    sql: ${TABLE}.FAILSAFE_BYTES ;;
    value_format_name: decimal_2
  }

  measure: failsafe_tb {
    type: number
    sql: ${failsafe_bytes} / power(1024, 4) ;;
    value_format_name: decimal_4
  }

  measure: retained_for_clone_bytes {
    type: sum
    sql: ${TABLE}.RETAINED_FOR_CLONE_BYTES ;;
    value_format_name: decimal_2
  }

  measure: retained_for_clone_tb {
    type: number
    sql: ${retained_for_clone_bytes} / power(1024, 4) ;;
    value_format_name: decimal_4
  }

  measure: total_bytes {
    type: number
    sql: ${time_travel_bytes} + ${active_bytes} + ${failsafe_bytes} + ${retained_for_clone_bytes} ;;
    value_format_name: decimal_2
  }

  measure: total_tb {
    type: number
    sql: ${total_bytes} / power(1024, 4) ;;
    value_format_name: decimal_4
    alias: [billable_tb]
  }

  measure: time_travel_cost_usd {
    type: number
    sql:  IFNULL(${time_travel_tb}, 0) * 23 ;;
    value_format_name: usd
  }

  measure: active_cost_usd {
    type: number
    sql:  IFNULL(${active_tb}, 0) * 23 ;;
    value_format_name: usd
  }

  measure: failsafe_cost_usd {
    type: number
    sql:  IFNULL(${failsafe_tb}, 0) * 23 ;;
    value_format_name: usd
  }

  measure: retained_for_clone_cost_usd {
    type: number
    sql:  IFNULL(${retained_for_clone_tb}, 0) * 23 ;;
    value_format_name: usd
  }

  measure: total_cost_usd {
    type: number
    sql:  IFNULL(${total_tb}, 0) * 23 ;;
    value_format_name: usd
  }


}
