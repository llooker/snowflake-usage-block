view: pipe_usage_history {

  derived_table: {
    # by default only 1 day of data is returned. Max is the last 2 weeks so default to that.
    sql:
      SELECT *
      FROM TABLE(INFORMATION_SCHEMA.PIPE_USAGE_HISTORY(
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

  dimension: credits_used {
    type: number
    sql: ${TABLE}.credits_used ;;
  }

  dimension: bytes_inserted {
    type:  number
    sql: ${TABLE}.bytes_inserted ;;
  }

  dimension: files_inserted {
    type:  number
    sql: ${TABLE}.files_inserted ;;
  }

  measure: count {
    type: count
  }

  measure: total_credits_used {
    type: sum
    sql: ${credits_used} ;;
  }

  measure: total_bytes_inserted {
    type: sum
    sql: ${bytes_inserted} ;;
  }

  measure: total_files_inserted {
    type: sum
    sql: ${files_inserted} ;;
  }

}
