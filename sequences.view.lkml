view: sequences {
  sql_table_name: ACCOUNT_USAGE.SEQUENCES ;;

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
    sql: ${TABLE}.CREATED ;;
  }

  dimension: cycle_option {
    type: yesno
    sql: ${TABLE}.CYCLE_OPTION ;;
  }

  dimension: data_type {
    type: string
    sql: ${TABLE}.DATA_TYPE ;;
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

  dimension: increment {
    type: string
    sql: ${TABLE}.increment ;;
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

  dimension: maximum_value {
    type: number
    sql: ${TABLE}.MAXIMUM_VALUE ;;
  }

  dimension: minimum_value {
    type: number
    sql: ${TABLE}.MINIMUM_VALUE ;;
  }

  dimension: next_value {
    type: string
    sql: ${TABLE}.NEXT_VALUE ;;
  }

  dimension: numeric_precision {
    type: number
    sql: ${TABLE}.NUMERIC_PRECISION ;;
  }

  dimension: numeric_precision_radix {
    type: number
    sql: ${TABLE}.NUMERIC_PRECISION_RADIX ;;
  }

  dimension: numeric_scale {
    type: number
    sql: ${TABLE}.NUMERIC_SCALE ;;
  }

  dimension: sequence_catalog {
    type: string
    sql: ${TABLE}.SEQUENCE_CATALOG ;;
  }

  dimension: sequence_name {
    type: string
    sql: ${TABLE}.SEQUENCE_NAME ;;
  }

  dimension: sequence_owner {
    type: string
    sql: ${TABLE}.SEQUENCE_OWNER ;;
  }

  dimension: sequence_schema {
    type: string
    sql: ${TABLE}.SEQUENCE_SCHEMA ;;
  }

  dimension: start_value {
    type: number
    sql: ${TABLE}.START_VALUE ;;
  }

  measure: count {
    type: count
    drill_fields: [sequence_name]
  }
}
