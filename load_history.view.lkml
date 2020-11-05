view: load_history {
 sql_table_name: SNOWFLAKE.ACCOUNT_USAGE.LOAD_HISTORY;;
  dimension: table_id {
    type: number
    sql: ${TABLE}.TABLE_ID ;;
  }

  dimension: table_name {
    type: string
    sql: ${TABLE}.TABLE_NAME ;;
  }

  dimension: schema_id {
    type: number
    sql: ${TABLE}.SCHEMA_ID ;;
  }

  dimension: schema_name {
    type: string
    sql: ${TABLE}.SCHEMA_NAME ;;
  }

  dimension: catalog_id {
    type: number
    sql: ${TABLE}.CATALOG_ID ;;
  }

  dimension: catalog_name {
    type: string
    sql: ${TABLE}.CATALOG_NAME ;;
  }

  dimension: file_name {
    type: string
    sql: ${TABLE}.FILE_NAME ;;
  }

  dimension_group: last_load_time {
    type: time
    datatype: timestamp
    timeframes: [raw,time,date,day_of_week,day_of_month,week,month,year]
    sql: ${TABLE}.LAST_LOAD_TIME ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.STATUS ;;
  }

  dimension: row_count {
    type: number
    sql: ${TABLE}.ROW_COUNT ;;
  }

  dimension: row_parsed {
    type: number
    sql: ${TABLE}.ROW_PARSED ;;
  }

  dimension: first_error_message {
    type: string
    sql: ${TABLE}.FIRST_ERROR_MESSAGE ;;
  }

  dimension: first_error_line_number {
    type: number
    sql: ${TABLE}.FIRST_ERROR_LINE_NUMBER ;;
  }

  dimension: first_error_character_position {
    type: number
    sql: ${TABLE}.FIRST_ERROR_CHARACTER_POSITION ;;
  }

  dimension: first_error_col_name {
    type: string
    sql: ${TABLE}.FIRST_ERROR_COL_NAME ;;
  }

  dimension: error_count {
    type: number
    sql: ${TABLE}.ERROR_COUNT ;;
  }

  dimension: error_limit {
    type: number
    sql: ${TABLE}.ERROR_LIMIT ;;
  }

  measure: total_row_count {
    type: sum
    sql: ${row_count} ;;
  }

  measure: total_error_count {
    type: sum
    sql: ${error_count} ;;
    drill_fields: [file_name,table_name,first_error_character_position,first_error_col_name,first_error_line_number,first_error_message]
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }


  set: detail {
    fields: [
      table_name,
      schema_name,
      catalog_name,
      file_name,
      last_load_time_time,
      status,
      row_count
    ]
  }
}
