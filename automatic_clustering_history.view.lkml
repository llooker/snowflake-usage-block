view: automatic_clustering_history {

  derived_table: {
    # date range
    sql:
      SELECT *
      FROM TABLE(INFORMATION_SCHEMA.AUTOMATIC_CLUSTERING_HISTORY(
        DATE_RANGE_START=>{% if date._is_filtered %}{% date_start date %}{% else %}DATEADD(days, -14, CURRENT_DATE()){% endif %},
        DATE_RANGE_END=>{% if date._is_filtered %}{% date_end date %}{% else %}NULL{% endif %}
      ))
    ;;
  }

  filter: date {
    type: date
  }

  dimension_group: start_time {
    type: time
    sql: ${TABLE}.start_time ;;
  }

  dimension_group: end_time {
    type: time
    sql: ${TABLE}.end_time ;;
  }

  dimension_group: duration {
    type: duration
    sql_start: ${start_time_raw} ;;
    sql_end: ${end_time_raw} ;;
  }

  dimension: table_name {
    type: string
    sql: ${TABLE}.table_name ;;
  }

  dimension: credits_used {
    type: number
    sql: ${TABLE}.credits_used ;;
  }

  dimension: num_bytes_reclustered {
    type: number
    sql: ${TABLE}.num_bytes_reclustered ;;
  }

  dimension: num_rows_reclustered {
    type: number
    sql: ${TABLE}.num_rows_reclustered ;;
  }

  measure: count {
    type: count
  }

  measure: total_credits_used {
    type: sum
    sql: ${credits_used} ;;
  }

  measure: total_bytes_reclusetered {
    type: sum
    sql: ${num_bytes_reclustered} ;;
  }

  measure: total_seconds_reclustering {
    type: sum
    sql: ${seconds_duration} ;;
  }
}
