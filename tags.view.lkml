view: tags {
  sql_table_name: SNOWFLAKE.ACCOUNT_USAGE.TAGS ;;


  dimension: tag_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.TAG_ID ;;
  }

  dimension: tag_name {
    type: string
    sql: ${TABLE}.TAG_NAME ;;
  }

  dimension: tag_schema_id {
    type: number
    sql: ${TABLE}.TAG_SCHEMA_ID ;;
  }

  dimension: tag_schema {
    type: string
    sql: ${TABLE}.TAG_SCHEMA ;;
  }

  dimension: tag_database_id {
    type: number
    sql: ${TABLE}.TAG_DATABASE_ID ;;
  }

  dimension: tag_database {
    type: string
    sql: ${TABLE}.TAG_DATABASE ;;
  }

  dimension: tag_owner {
    type: string
    sql: ${TABLE}.TAG_OWNER ;;
  }

  dimension: tag_comment {
    type: string
    sql: ${TABLE}.TAG_COMMENT ;;
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

}