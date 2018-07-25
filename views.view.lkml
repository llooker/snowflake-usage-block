view: views {
  sql_table_name: ACCOUNT_USAGE.VIEWS ;;

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
    sql: ${TABLE}.CREATED ;;
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

  dimension: insertable_into {
    type: yesno
    sql: CASE WHEN ${TABLE}.INSERTABLE_INTO = 'YES' THEN TRUE ELSE FALSE END ;;
  }

  dimension: is_secure {
    type: yesno
    sql: CASE WHEN ${TABLE}.IS_SECURE = 'YES' THEN TRUE ELSE FALSE END ;;
  }

  dimension: is_updatable {
    type: yesno
    sql: CASE WHEN ${TABLE}.IS_UPDATABLE = 'YES' THEN TRUE ELSE FALSE END ;;
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
