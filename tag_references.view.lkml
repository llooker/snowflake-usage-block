view: tags {
  sql_table_name: SNOWFLAKE.ACCOUNT_USAGE.TAG_REFERENCES ;;

  dimension: tag_database {
    type: string
    sql: ${TABLE}.TAG_DATABASE ;;
  }

  dimension: tag_schema {
    type: string
    sql: ${TABLE}.TAG_SCHEMA ;;
  }

  dimension: tag_id {
    type: number
    sql: ${TABLE}.TAG_ID ;;
  }

  dimension: tag_name {
    type: string
    sql: ${TABLE}.TAG_NAME ;;
  }

  dimension: tag_value {
    type: string
    sql: ${TABLE}.TAG_VALUE ;;
  }

  dimension: object_database {
    type: string
    sql: ${TABLE}.OBJECT_DATABASE ;;
  }

  dimension: object_schema {
    type: string
    sql: ${TABLE}.OBJECT_SCHEMA ;;
  }

  dimension: object_id {
    type: number
    sql: ${TABLE}.OBJECT_ID ;;
  }

  dimension: object_name {
    type: string
    sql: ${TABLE}.OBJECT_NAME ;;
  }

  dimension_group: object_deleted {
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
    sql: ${TABLE}.OBJECT_DELETED ;;
  }

  dimension: domain {
    type: string
    sql: ${TABLE}.DOMAIN ;;
  }

  dimension: column_id {
    type: number
    sql: ${TABLE}.COLUMN_ID ;;
  }

  dimension: column_name {
    type: string
    sql: ${TABLE}.COLUMN_NAME ;;
  }

}