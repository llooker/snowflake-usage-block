view: file_formats {
  sql_table_name: ACCOUNT_USAGE.FILE_FORMATS ;;

  dimension: binary_format {
    type: string
    sql: ${TABLE}.BINARY_FORMAT ;;
  }

  dimension: comment {
    type: string
    sql: ${TABLE}.COMMENT ;;
  }

  dimension: compression {
    type: string
    sql: ${TABLE}.COMPRESSION ;;
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
    sql: ${TABLE}.CREATED ;;
  }

  dimension: date_format {
    type: string
    sql: ${TABLE}.DATE_FORMAT ;;
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
    sql: ${TABLE}.DELETED ;;
  }

  dimension: error_on_column_count_mismatch {
    type: string
    sql: ${TABLE}.ERROR_ON_COLUMN_COUNT_MISMATCH ;;
  }

  dimension: escape {
    type: string
    sql: ${TABLE}.ESCAPE ;;
  }

  dimension: escape_unenclosed_field {
    type: string
    sql: ${TABLE}.ESCAPE_UNENCLOSED_FIELD ;;
  }

  dimension: field_delimiter {
    type: string
    sql: ${TABLE}.FIELD_DELIMITER ;;
  }

  dimension: field_optionally_enclosed_by {
    type: string
    sql: ${TABLE}.FIELD_OPTIONALLY_ENCLOSED_BY ;;
  }

  dimension: file_format_catalog {
    type: string
    sql: ${TABLE}.FILE_FORMAT_CATALOG ;;
  }

  dimension: file_format_name {
    type: string
    sql: ${TABLE}.FILE_FORMAT_NAME ;;
  }

  dimension: file_format_owner {
    type: string
    sql: ${TABLE}.FILE_FORMAT_OWNER ;;
  }

  dimension: file_format_schema {
    type: string
    sql: ${TABLE}.FILE_FORMAT_SCHEMA ;;
  }

  dimension: file_format_type {
    type: string
    sql: ${TABLE}.FILE_FORMAT_TYPE ;;
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
    sql: ${TABLE}.LAST_ALTERED ;;
  }

  dimension: null_if {
    type: string
    sql: ${TABLE}.NULL_IF ;;
  }

  dimension: record_delimiter {
    type: string
    sql: ${TABLE}.RECORD_DELIMITER ;;
  }

  dimension: skip_header {
    type: number
    sql: ${TABLE}.SKIP_HEADER ;;
  }

  dimension: time_format {
    type: string
    sql: ${TABLE}.TIME_FORMAT ;;
  }

  dimension: timestamp_format {
    type: string
    sql: ${TABLE}.TIMESTAMP_FORMAT ;;
  }

  dimension: trim_space {
    type: string
    sql: ${TABLE}.TRIM_SPACE ;;
  }

  measure: count {
    type: count
    drill_fields: [file_format_name]
  }
}
