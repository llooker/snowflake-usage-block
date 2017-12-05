view: tables {
  sql_table_name: ACCOUNT_USAGE_DEV.TABLES ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.ID ;;
  }

  dimension: bytes {
    type: string
    sql: ${TABLE}.BYTES ;;
  }

  dimension: clustering_key {
    type: string
    sql: ${TABLE}.CLUSTERING_KEY ;;
  }

  dimension: comment {
    type: string
    sql: ${TABLE}.COMMENT ;;
  }

  dimension: commit_action {
    type: string
    sql: ${TABLE}.COMMIT_ACTION ;;
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

  dimension: is_insertable_into {
    type: yesno
    sql: ${TABLE}.IS_INSERTABLE_INTO ;;
  }

  dimension: is_transient {
    type: yesno
    sql: ${TABLE}.IS_TRANSIENT ;;
  }

  dimension: is_typed {
    type: yesno
    sql: ${TABLE}.IS_TYPED ;;
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

  dimension: reference_generation {
    type: string
    sql: ${TABLE}.REFERENCE_GENERATION ;;
  }

  dimension: row_count {
    type: string
    sql: ${TABLE}.ROW_COUNT ;;
  }

  dimension: self_referencing_column_name {
    type: string
    sql: ${TABLE}.SELF_REFERENCING_COLUMN_NAME ;;
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

  dimension: table_type {
    type: string
    sql: ${TABLE}.TABLE_TYPE ;;
  }

  dimension: user_defind_type_name {
    type: string
    sql: ${TABLE}.USER_DEFIND_TYPE_NAME ;;
  }

  dimension: user_defined_catalog_type {
    type: string
    sql: ${TABLE}.USER_DEFINED_CATALOG_TYPE ;;
  }

  dimension: user_defined_schema_type {
    type: string
    sql: ${TABLE}.USER_DEFINED_SCHEMA_TYPE ;;
  }

  measure: count {
    type: count
    drill_fields: [id, table_name, self_referencing_column_name, user_defind_type_name]
  }
}
