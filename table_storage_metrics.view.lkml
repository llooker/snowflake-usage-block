view: table_storage_metrics {
  sql_table_name: ACCOUNT_USAGE.TABLE_STORAGE_METRICS ;;

#   dimension: id {
#     primary_key: yes
#     type: number
#     sql: ${TABLE}.ID ;;
#   }

  dimension: active_bytes {
    type: string
    sql: ${TABLE}.ACTIVE_BYTES ;;
  }

  dimension: active_rows {
    type: string
    sql: ${TABLE}.ACTIVE_ROWS ;;
  }

  dimension_group: catalog_created {
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

  dimension_group: catalog_dropped {
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

  dimension: clone_group_id {
    type: number
    sql: ${TABLE}.CLONE_GROUP_ID ;;
  }

  dimension: comment {
    type: string
    sql: ${TABLE}.COMMENT ;;
  }

  dimension: failsafe_bytes {
    type: string
    sql: ${TABLE}.FAILSAFE_BYTES ;;
  }

  dimension: is_transient {
    type: yesno
    sql: CASE WHEN ${TABLE}.IS_TRANSIENT = 'YES' THEN TRUE ELSE FALSE END ;;
  }

  dimension: owned_active_and_time_travel_bytes {
    type: number
    sql: ${TABLE}.OWNED_ACTIVE_AND_TIME_TRAVEL_BYTES ;;
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


  dimension: table_catalog {
    type: string
    sql: ${TABLE}.TABLE_CATALOG ;;
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

  dimension: table_name {
    type: string
    sql: ${TABLE}.TABLE_NAME ;;
  }

  dimension: table_schema {
    type: string
    sql: ${TABLE}.TABLE_SCHEMA ;;
  }

  dimension: time_travel_bytes {
    type: number
    sql: ${TABLE}.TIME_TRAVEL_BYTES ;;
  }

  measure: count {
    type: count
    drill_fields: [table_name]
  }
}
