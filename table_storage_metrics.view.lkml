view: table_storage_metrics {
  sql_table_name: ACCOUNT_USAGE_DEV.TABLE_STORAGE_METRICS ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.ID ;;
  }

  dimension: active_bytes {
    type: string
    sql: ${TABLE}.ACTIVE_BYTES ;;
  }

  dimension: active_rows {
    type: string
    sql: ${TABLE}.ACTIVE_ROWS ;;
  }

  dimension: clone_group_id {
    type: number
    sql: ${TABLE}.CLONE_GROUP_ID ;;
  }

  dimension: comment {
    type: string
    sql: ${TABLE}.COMMENT ;;
  }

  dimension_group: created {
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
    sql: ${TABLE}.CREATED_AT ;;
  }

  dimension_group: deleted {
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
    sql: ${TABLE}.DELETED_AT ;;
  }

  dimension: failsafe_bytes {
    type: string
    sql: ${TABLE}.FAILSAFE_BYTES ;;
  }

  dimension: is_transient {
    type: yesno
    sql: ${TABLE}.IS_TRANSIENT ;;
  }

  dimension_group: last_altered {
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
    sql: ${TABLE}.LAST_ALTERED_AT ;;
  }

  dimension: owned_active_and_time_travel_bytes {
    type: number
    sql: ${TABLE}.OWNED_ACTIVE_AND_TIME_TRAVEL_BYTES ;;
  }

  dimension: table_catalog {
    type: string
    sql: ${TABLE}.TABLE_CATALOG ;;
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
    drill_fields: [id, table_name]
  }
}
