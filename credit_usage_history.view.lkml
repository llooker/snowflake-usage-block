view: credit_usage_history {

  derived_table: {
    sql:
      SELECT
        warehouse_name AS name,
        'WAREHOUSE_METERING' AS type,
        credits_used,
        start_time,
        end_time
      FROM snowflake.account_usage.warehouse_metering_history
      WHERE {% condition date %} start_time {% endcondition %}
      UNION
      SELECT
        table_name AS name,
        'AUTOMATIC_CLUSTERING' AS type,
        credits_used,
        start_time,
        end_time
      FROM TABLE(INFORMATION_SCHEMA.AUTOMATIC_CLUSTERING_HISTORY(
        DATE_RANGE_START=>{% if date._is_filtered %}{% date_start date %}{% else %}DATEADD(days, -14, CURRENT_DATE()){% endif %},
        DATE_RANGE_END=>{% if date._is_filtered %}{% date_end date %}{% else %}NULL{% endif %}
      )) AS automatic_clustering_history
      UNION
      SELECT
        'All Pipes' AS name,  -- no names are given unless specifically queried
        'PIPE_USAGE' AS type,
        credits_used,
        start_time,
        end_time
      FROM TABLE(INFORMATION_SCHEMA.PIPE_USAGE_HISTORY(
        DATE_RANGE_START=>{% if date._is_filtered %}{% date_start date %}{% else %}DATEADD(days, -14, CURRENT_DATE()){% endif %},
        DATE_RANGE_END=>{% if date._is_filtered %}{% date_end date %}{% else %}NULL{% endif %}
      ))
    ;;
  }

  filter: date {type: date}

  dimension_group: start_time {
    type: time
    sql: ${TABLE}.start_time ;;
  }

  dimension_group: end_time {
    type: time
    sql: ${TABLE}.end_time ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: type {
    type: string
    suggestions: ["WAREHOUSE_METERING", "AUTOMATIC_CLUSTERING", "PIPE_USAGE"]
  }

  dimension: credits_used {
    type: number
    sql: ${TABLE}.credits_used ;;
  }

  measure: total_credits_used {
    type: sum
    sql: ${credits_used} ;;
  }

}
