view: columns {
  sql_table_name: ACCOUNT_USAGE.COLUMNS ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.ID ;;
  }

  dimension: character_maximum_length {
    type: number
    sql: ${TABLE}.CHARACTER_MAXIMUM_LENGTH ;;
  }

  dimension: character_octet_length {
    type: number
    sql: ${TABLE}.CHARACTER_OCTET_LENGTH ;;
  }

  dimension: character_set_catalog {
    type: string
    sql: ${TABLE}.CHARACTER_SET_CATALOG ;;
  }

  dimension: character_set_name {
    type: string
    sql: ${TABLE}.CHARACTER_SET_NAME ;;
  }

  dimension: character_set_schema {
    type: string
    sql: ${TABLE}.CHARACTER_SET_SCHEMA ;;
  }

  dimension: collation_catalog {
    type: string
    sql: ${TABLE}.COLLATION_CATALOG ;;
  }

  dimension: collation_name {
    type: string
    sql: ${TABLE}.COLLATION_NAME ;;
  }

  dimension: collation_schema {
    type: string
    sql: ${TABLE}.COLLATION_SCHEMA ;;
  }

  dimension: column_default {
    type: string
    sql: ${TABLE}.COLUMN_DEFAULT ;;
  }

  dimension: column_name {
    type: string
    sql: ${TABLE}.COLUMN_NAME ;;
  }

  dimension: comment {
    type: string
    sql: ${TABLE}.COMMENT ;;
  }

  dimension: data_type {
    type: string
    sql: ${TABLE}.DATA_TYPE ;;
  }

  dimension: datetime_precision {
    type: number
    sql: ${TABLE}.DATETIME_PRECISION ;;
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


  dimension: domain_catalog {
    type: string
    sql: ${TABLE}.DOMAIN_CATALOG ;;
  }

  dimension: domain_name {
    type: string
    sql: ${TABLE}.DOMAIN_NAME ;;
  }

  dimension: domain_schema {
    type: string
    sql: ${TABLE}.DOMAIN_SCHEMA ;;
  }

  dimension: dtd_identifier {
    type: string
    sql: ${TABLE}.DTD_IDENTIFIER ;;
  }

  dimension: identity_cycle {
    type: string
    sql: ${TABLE}.IDENTITY_CYCLE ;;
  }

  dimension: identity_generation {
    type: string
    sql: ${TABLE}.IDENTITY_GENERATION ;;
  }

  dimension: identity_maximum {
    type: string
    sql: ${TABLE}.IDENTITY_MAXIMUM ;;
  }

  dimension: identity_minimum {
    type: string
    sql: ${TABLE}.IDENTITY_MINIMUM ;;
  }

  dimension: interval_precision {
    type: string
    sql: ${TABLE}.INTERVAL_PRECISION ;;
  }

  dimension: interval_type {
    type: string
    sql: ${TABLE}.INTERVAL_TYPE ;;
  }

  dimension: is_identity {
    type: yesno
    sql: CASE WHEN ${TABLE}.IS_IDENTITY = 'YES' THEN TRUE ELSE FALSE END ;;
  }

  dimension: is_nullable {
    type: yesno
    sql: CASE WHEN ${TABLE}.IS_NULLABLE = 'YES' THEN TRUE ELSE FALSE END ;;
  }

  dimension: is_self_referencing {
    type: yesno
    sql: CASE WHEN ${TABLE}.IS_SELF_REFERENCING = 'YES' THEN TRUE ELSE FALSE END ;;
  }

  dimension: maximum_cardinality {
    type: string
    sql: ${TABLE}.MAXIMUM_CARDINALITY ;;
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

  dimension: ordinal_position {
    type: number
    sql: ${TABLE}.ORDINAL_POSITION ;;
  }

  dimension: scope_catalog {
    type: string
    sql: ${TABLE}.SCOPE_CATALOG ;;
  }

  dimension: scope_name {
    type: string
    sql: ${TABLE}.SCOPE_NAME ;;
  }

  dimension: scope_schema {
    type: string
    sql: ${TABLE}.SCOPE_SCHEMA ;;
  }

  dimension: table_catalog {
    type: string
    sql: ${TABLE}.TABLE_CATALOG ;;
  }

  dimension_group: table_catalog_deleted {
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
    sql: ${TABLE}.TABLE_CATALOG_DELETED ;;
  }

  dimension_group: table_deleted {
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
    sql: ${TABLE}.TABLE_DELETED ;;
  }

  dimension: table_name {
    type: string
    sql: ${TABLE}.TABLE_NAME ;;
  }

  dimension: table_schema {
    type: string
    sql: ${TABLE}.TABLE_SCHEMA ;;
  }

  dimension_group: table_schema_deleted {
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
    sql: ${TABLE}.TABLE_SCHEMA_DELETED ;;
  }

  dimension: udt_catalog {
    type: string
    sql: ${TABLE}.UDT_CATALOG ;;
  }

  dimension: udt_name {
    type: string
    sql: ${TABLE}.UDT_NAME ;;
  }

  dimension: udt_schema {
    type: string
    sql: ${TABLE}.UDT_SCHEMA ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      table_name,
      column_name,
      character_set_name,
      collation_name,
      domain_name,
      udt_name,
      scope_name
    ]
  }
}
