view: referential_constraints {
  sql_table_name: ACCOUNT_USAGE.REFERENTIAL_CONSTRAINTS ;;

  dimension: comment {
    type: string
    sql: ${TABLE}.COMMENT ;;
  }

  dimension: constraint_catalog {
    type: string
    sql: ${TABLE}.CONSTRAINT_CATALOG ;;
  }

  dimension: constraint_name {
    type: string
    sql: ${TABLE}.CONSTRAINT_NAME ;;
  }

  dimension: constraint_schema {
    type: string
    sql: ${TABLE}.CONSTRAINT_SCHEMA ;;
  }

  dimension: constraint_table {
    type: string
    sql: ${TABLE}.CONSTRAINT_TABLE ;;
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

  dimension: delete_rule {
    type: string
    sql: ${TABLE}.DELETE_RULE ;;
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

  dimension: match_option {
    type: string
    sql: ${TABLE}.MATCH_OPTION ;;
  }

  dimension: unique_constraint_catalog {
    type: string
    sql: ${TABLE}.UNIQUE_CONSTRAINT_CATALOG ;;
  }

  dimension: unique_constraint_name {
    type: string
    sql: ${TABLE}.UNIQUE_CONSTRAINT_NAME ;;
  }

  dimension: unique_constraint_schema {
    type: string
    sql: ${TABLE}.UNIQUE_CONSTRAINT_SCHEMA ;;
  }

  dimension: unique_constraint_table {
    type: string
    sql: ${TABLE}.UNIQUE_CONSTRAINT_TABLE ;;
  }

  dimension: update_rule {
    type: string
    sql: ${TABLE}.UPDATE_RULE ;;
  }

  measure: count {
    type: count
    drill_fields: [constraint_name, unique_constraint_name]
  }
}
