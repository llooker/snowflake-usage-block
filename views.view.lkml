view: views {
  sql_table_name: ACCOUNT_USAGE_DEV.VIEWS ;;

  dimension: check_option {
    type: string
    sql: ${TABLE}.CHECK_OPTION ;;
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

  dimension: insertable_into {
    type: yesno
    sql: ${TABLE}.INSERTABLE_INTO ;;
  }

  dimension: is_secure {
    type: yesno
    sql: ${TABLE}.IS_SECURE ;;
  }

  dimension: is_updatable {
    type: yesno
    sql: ${TABLE}.IS_UPDATABLE ;;
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

  dimension: table_catalog {
    type: string
    sql: ${TABLE}.TABLE_CATALOG ;;
  }

  dimension: table_name {
    type: string
    sql: ${TABLE}.TABLE_NAME ;;
  }

  dimension: table_owner {
    type: string
    sql: ${TABLE}.TABLE_OWNER ;;
  }

  dimension: table_schema {
    type: string
    sql: ${TABLE}.TABLE_SCHEMA ;;
  }

  dimension: view_definition {
    type: string
    sql: ${TABLE}.VIEW_DEFINITION ;;
  }

  measure: count {
    type: count
    drill_fields: [table_name]
  }
}
