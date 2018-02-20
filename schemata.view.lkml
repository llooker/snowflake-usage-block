view: schemata {
  sql_table_name: ACCOUNT_USAGE.SCHEMATA ;;

#   dimension: id {
#     primary_key: yes
#     type: number
#     sql: ${TABLE}.ID ;;
#   }

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

#   dimension: database_id {
#     type: string
#     # hidden: yes
#     sql: ${TABLE}.DATABASE_ID ;;
#   }
#
#   dimension: database_name {
#     type: string
#     sql: ${TABLE}.DATABASE_NAME ;;
#   }

  dimension: default_character_set_catalog {
    type: string
    sql: ${TABLE}.DEFAULT_CHARACTER_SET_CATALOG ;;
  }

  dimension: default_character_set_name {
    type: string
    sql: ${TABLE}.DEFAULT_CHARACTER_SET_NAME ;;
  }

  dimension: default_character_set_schema {
    type: string
    sql: ${TABLE}.DEFAULT_CHARACTER_SET_SCHEMA ;;
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

  dimension: is_transient {
    type: yesno
    sql: CASE WHEN ${TABLE}.IS_TRANSIENT = 'YES' THEN TRUE ELSE FALSE END ;;
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

  dimension: schema_name {
    type: string
    sql: ${TABLE}.SCHEMA_NAME ;;
  }

  dimension: schema_owner {
    type: string
    sql: ${TABLE}.SCHEMA_OWNER ;;
  }

  dimension: sql_path {
    type: string
    sql: ${TABLE}.SQL_PATH ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      #id,
      schema_name,
      #database_name,
      default_character_set_name,
      #databases.id,
      databases.database_name
    ]
  }
}
