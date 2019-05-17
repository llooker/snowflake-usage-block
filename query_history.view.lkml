view: query_history {
  sql_table_name: SNOWFLAKE.ACCOUNT_USAGE.QUERY_HISTORY ;;

  dimension: compilation_time {
    type: string
    sql: ${TABLE}.COMPILATION_TIME ;;
  }

  dimension: looker_query_context {
    type: string
    hidden: yes
    sql: PARSE_JSON(regexp_substr(regexp_substr(query_text, 'Query\\sContext\\s\'\{.*\}\''),'\{.*\}')) ;;
  }

  dimension: looker_history_id {
    type: number
    sql: ${looker_query_context}:history_id ;;
  }

  dimension: looker_user_id {
    type: number
    sql: ${looker_query_context}:user_id ;;
  }
#   dimension: database_id {
#     type: number
#     # hidden: yes
#     sql: ${TABLE}.DATABASE_ID ;;
#   }

  dimension: database_name {
    type: string
    sql: ${TABLE}.DATABASE_NAME ;;
  }

  dimension_group: end {
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
    sql: ${TABLE}.END_TIME ;;
  }

  dimension: error_code {
    type: string
    sql: ${TABLE}.ERROR_CODE ;;
  }

  dimension: error_message {
    type: string
    sql: ${TABLE}.ERROR_MESSAGE ;;
  }

  dimension: execution_status {
    type: string
    sql: ${TABLE}.EXECUTION_STATUS ;;
  }

  dimension: execution_time {
    type: number
    sql: ${TABLE}.EXECUTION_TIME ;;
  }

  dimension: execution_time_tier {
    type: tier
    tiers: [1000,2500,5000,10000,25000,50000,100000]
  }

#   dimension: job_tag {
#     type: string
#     sql: ${TABLE}.JOB_TAG ;;
#   }

  dimension: query_id {
    type: string
    primary_key: yes
    sql: ${TABLE}.QUERY_ID ;;
  }

  dimension: query_tag {
    type: string
    sql: ${TABLE}.QUERY_TAG ;;
  }

  dimension: query_text {
    type: string
    sql: ${TABLE}.QUERY_TEXT ;;
  }

  dimension: query_type {
    type: string
    sql: ${TABLE}.QUERY_TYPE ;;
  }

  dimension: queued_overload_time {
    type: number
    sql: ${TABLE}.QUEUED_OVERLOAD_TIME ;;
  }

  dimension: has_overload_time {
    type: yesno
    sql: ${queued_overload_time}>0 ;;
  }

  dimension: queued_provisioning_time {
    type: string
    sql: ${TABLE}.QUEUED_PROVISIONING_TIME ;;
  }

  dimension: queued_repair_time {
    type: string
    sql: ${TABLE}.QUEUED_REPAIR_TIME ;;
  }

  dimension: role_name {
    type: string
    sql: ${TABLE}.ROLE_NAME ;;
  }

  dimension: session_id {
    type: number
    sql: ${TABLE}.SESSION_ID ;;
  }

  dimension_group: start {
    type: time
    timeframes: [
      raw,
      time,
      second,
      minute,
      minute10,
      date,
      week,
      day_of_month,
      day_of_week,
      month_name,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.START_TIME ;;
  }

  dimension: elapsed_time {
    type: number
    sql: ${TABLE}.TOTAL_ELAPSED_TIME ;;
  }

  dimension: transaction_blocked_time {
    type: string
    sql: ${TABLE}.TRANSACTION_BLOCKED_TIME ;;
  }

  dimension: user_name {
    type: string
    sql: ${TABLE}.USER_NAME ;;
  }

  dimension: warehouse_name {
    type: string
    sql: ${TABLE}.WAREHOUSE_NAME ;;
  }

  dimension: warehouse_size {
    type: string
    sql: ${TABLE}.WAREHOUSE_SIZE ;;
  }

  dimension: warehouse_type {
    type: string
    sql: ${TABLE}.WAREHOUSE_TYPE ;;
  }

  dimension: is_prior_month_mtd {
    type: yesno
    sql:  EXTRACT(month, ${start_raw}) = EXTRACT(month, current_timestamp()) - 1
            and ${start_raw} <= dateadd(month, -1, current_timestamp())  ;;
  }

  measure: query_count {
    type: count
    drill_fields: [detail*]
    alias: [job_count]
    link: { label: "Warehouse Breakdown" url: "{% if warehouse_name._in_query %}{% else %}{{hidden_drill_warehouse_name_breakdown._link}}&vis=%7B%22color_application%22%3A%7B%22collection_id%22%3A%226c27c30e-5523-4080-82ae-272146e699d0%22%2C%22palette_id%22%3A%2287654122-8144-4720-8259-82ac9908d5f4%22%2C%22options%22%3A%7B%22steps%22%3A5%7D%7D%2C%22x_axis_gridlines%22%3Afalse%2C%22y_axis_gridlines%22%3Atrue%2C%22show_view_names%22%3Afalse%2C%22y_axes%22%3A%5B%7B%22label%22%3A%22%22%2C%22orientation%22%3A%22left%22%2C%22series%22%3A%5B%7B%22axisId%22%3A%22query_history.query_count%22%2C%22id%22%3A%22query_history.query_count%22%2C%22name%22%3A%22Query+Count%22%7D%5D%2C%22showLabels%22%3Atrue%2C%22showValues%22%3Atrue%2C%22unpinAxis%22%3Afalse%2C%22tickDensity%22%3A%22default%22%2C%22tickDensityCustom%22%3A0%2C%22type%22%3A%22linear%22%7D%2C%7B%22label%22%3A%22%22%2C%22orientation%22%3A%22right%22%2C%22series%22%3A%5B%7B%22axisId%22%3A%22query_history.average_execution_time%22%2C%22id%22%3A%22query_history.average_execution_time%22%2C%22name%22%3A%22Average+Execution+Time%22%7D%5D%2C%22showLabels%22%3Atrue%2C%22showValues%22%3Atrue%2C%22unpinAxis%22%3Afalse%2C%22tickDensity%22%3A%22default%22%2C%22tickDensityCustom%22%3A46%2C%22type%22%3A%22linear%22%7D%2C%7B%22label%22%3Anull%2C%22orientation%22%3A%22right%22%2C%22series%22%3A%5B%7B%22axisId%22%3A%22query_history.median_queued_overload_time%22%2C%22id%22%3A%22query_history.median_queued_overload_time%22%2C%22name%22%3A%22Median+Queued+Overload+Time%22%7D%5D%2C%22showLabels%22%3Atrue%2C%22showValues%22%3Atrue%2C%22unpinAxis%22%3Afalse%2C%22tickDensity%22%3A%22default%22%2C%22tickDensityCustom%22%3A46%2C%22type%22%3A%22linear%22%7D%5D%2C%22show_y_axis_labels%22%3Atrue%2C%22show_y_axis_ticks%22%3Atrue%2C%22y_axis_tick_density%22%3A%22default%22%2C%22y_axis_tick_density_custom%22%3A5%2C%22show_x_axis_label%22%3Atrue%2C%22show_x_axis_ticks%22%3Atrue%2C%22y_axis_scale_mode%22%3A%22linear%22%2C%22x_axis_reversed%22%3Afalse%2C%22y_axis_reversed%22%3Afalse%2C%22size_by_field%22%3A%22query_history.median_queued_overload_time%22%2C%22plot_size_by_field%22%3Atrue%2C%22trellis%22%3A%22%22%2C%22stacking%22%3A%22%22%2C%22limit_displayed_rows%22%3Afalse%2C%22hidden_series%22%3A%5B%5D%2C%22legend_position%22%3A%22center%22%2C%22series_types%22%3A%7B%22query_history.median_queued_overload_time%22%3A%22scatter%22%2C%22query_history.query_count%22%3A%22column%22%2C%22query_history.average_execution_time%22%3A%22area%22%7D%2C%22point_style%22%3A%22circle%22%2C%22series_colors%22%3A%7B%22query_history.average_execution_time%22%3A%22%23D5DB61%22%2C%22query_history.query_count%22%3A%22%2325435A%22%7D%2C%22series_point_styles%22%3A%7B%22query_history.average_execution_time%22%3A%22square%22%7D%2C%22show_value_labels%22%3Afalse%2C%22label_density%22%3A25%2C%22x_axis_scale%22%3A%22auto%22%2C%22y_axis_combined%22%3Atrue%2C%22show_null_points%22%3Afalse%2C%22interpolation%22%3A%22linear%22%2C%22discontinuous_nulls%22%3Atrue%2C%22ordering%22%3A%22none%22%2C%22show_null_labels%22%3Afalse%2C%22show_totals_labels%22%3Afalse%2C%22show_silhouette%22%3Afalse%2C%22totals_color%22%3A%22%23808080%22%2C%22type%22%3A%22looker_line%22%7D{% endif %}"}
  }

  measure: current_mtd_query_count {
    type: count
    filters: {field: start_date value: "this month"}
    alias: [current_mtd_job_count, current_month_job_count]
    drill_fields: [user_name,warehouse_name,database_name,current_mtd_query_count]
    link: { label: "Warehouse Breakdown" url: "{% if warehouse_name._in_query %}{% else %}{{hidden_drill_warehouse_name_breakdown._link}}&vis=%7B%22color_application%22%3A%7B%22collection_id%22%3A%226c27c30e-5523-4080-82ae-272146e699d0%22%2C%22palette_id%22%3A%2287654122-8144-4720-8259-82ac9908d5f4%22%2C%22options%22%3A%7B%22steps%22%3A5%7D%7D%2C%22x_axis_gridlines%22%3Afalse%2C%22y_axis_gridlines%22%3Atrue%2C%22show_view_names%22%3Afalse%2C%22y_axes%22%3A%5B%7B%22label%22%3A%22%22%2C%22orientation%22%3A%22left%22%2C%22series%22%3A%5B%7B%22axisId%22%3A%22query_history.query_count%22%2C%22id%22%3A%22query_history.query_count%22%2C%22name%22%3A%22Query+Count%22%7D%5D%2C%22showLabels%22%3Atrue%2C%22showValues%22%3Atrue%2C%22unpinAxis%22%3Afalse%2C%22tickDensity%22%3A%22default%22%2C%22tickDensityCustom%22%3A0%2C%22type%22%3A%22linear%22%7D%2C%7B%22label%22%3A%22%22%2C%22orientation%22%3A%22right%22%2C%22series%22%3A%5B%7B%22axisId%22%3A%22query_history.average_execution_time%22%2C%22id%22%3A%22query_history.average_execution_time%22%2C%22name%22%3A%22Average+Execution+Time%22%7D%5D%2C%22showLabels%22%3Atrue%2C%22showValues%22%3Atrue%2C%22unpinAxis%22%3Afalse%2C%22tickDensity%22%3A%22default%22%2C%22tickDensityCustom%22%3A46%2C%22type%22%3A%22linear%22%7D%2C%7B%22label%22%3Anull%2C%22orientation%22%3A%22right%22%2C%22series%22%3A%5B%7B%22axisId%22%3A%22query_history.median_queued_overload_time%22%2C%22id%22%3A%22query_history.median_queued_overload_time%22%2C%22name%22%3A%22Median+Queued+Overload+Time%22%7D%5D%2C%22showLabels%22%3Atrue%2C%22showValues%22%3Atrue%2C%22unpinAxis%22%3Afalse%2C%22tickDensity%22%3A%22default%22%2C%22tickDensityCustom%22%3A46%2C%22type%22%3A%22linear%22%7D%5D%2C%22show_y_axis_labels%22%3Atrue%2C%22show_y_axis_ticks%22%3Atrue%2C%22y_axis_tick_density%22%3A%22default%22%2C%22y_axis_tick_density_custom%22%3A5%2C%22show_x_axis_label%22%3Atrue%2C%22show_x_axis_ticks%22%3Atrue%2C%22y_axis_scale_mode%22%3A%22linear%22%2C%22x_axis_reversed%22%3Afalse%2C%22y_axis_reversed%22%3Afalse%2C%22size_by_field%22%3A%22query_history.median_queued_overload_time%22%2C%22plot_size_by_field%22%3Atrue%2C%22trellis%22%3A%22%22%2C%22stacking%22%3A%22%22%2C%22limit_displayed_rows%22%3Afalse%2C%22hidden_series%22%3A%5B%5D%2C%22legend_position%22%3A%22center%22%2C%22series_types%22%3A%7B%22query_history.median_queued_overload_time%22%3A%22scatter%22%2C%22query_history.query_count%22%3A%22column%22%2C%22query_history.average_execution_time%22%3A%22area%22%7D%2C%22point_style%22%3A%22circle%22%2C%22series_colors%22%3A%7B%22query_history.average_execution_time%22%3A%22%23D5DB61%22%2C%22query_history.query_count%22%3A%22%2325435A%22%7D%2C%22series_point_styles%22%3A%7B%22query_history.average_execution_time%22%3A%22square%22%7D%2C%22show_value_labels%22%3Afalse%2C%22label_density%22%3A25%2C%22x_axis_scale%22%3A%22auto%22%2C%22y_axis_combined%22%3Atrue%2C%22show_null_points%22%3Afalse%2C%22interpolation%22%3A%22linear%22%2C%22discontinuous_nulls%22%3Atrue%2C%22ordering%22%3A%22none%22%2C%22show_null_labels%22%3Afalse%2C%22show_totals_labels%22%3Afalse%2C%22show_silhouette%22%3Afalse%2C%22totals_color%22%3A%22%23808080%22%2C%22type%22%3A%22looker_line%22%7D{% endif %}"}
  }

  measure: prior_month_total_query_count {
    type: count
    filters: {field: start_date value: "last month"}
    value_format_name: decimal_0
    alias: [prior_month_total_job_count]
    link: { label: "Warehouse Breakdown" url: "{% if warehouse_name._in_query %}{% else %}{{hidden_drill_warehouse_name_breakdown._link}}&vis=%7B%22color_application%22%3A%7B%22collection_id%22%3A%226c27c30e-5523-4080-82ae-272146e699d0%22%2C%22palette_id%22%3A%2287654122-8144-4720-8259-82ac9908d5f4%22%2C%22options%22%3A%7B%22steps%22%3A5%7D%7D%2C%22x_axis_gridlines%22%3Afalse%2C%22y_axis_gridlines%22%3Atrue%2C%22show_view_names%22%3Afalse%2C%22y_axes%22%3A%5B%7B%22label%22%3A%22%22%2C%22orientation%22%3A%22left%22%2C%22series%22%3A%5B%7B%22axisId%22%3A%22query_history.query_count%22%2C%22id%22%3A%22query_history.query_count%22%2C%22name%22%3A%22Query+Count%22%7D%5D%2C%22showLabels%22%3Atrue%2C%22showValues%22%3Atrue%2C%22unpinAxis%22%3Afalse%2C%22tickDensity%22%3A%22default%22%2C%22tickDensityCustom%22%3A0%2C%22type%22%3A%22linear%22%7D%2C%7B%22label%22%3A%22%22%2C%22orientation%22%3A%22right%22%2C%22series%22%3A%5B%7B%22axisId%22%3A%22query_history.average_execution_time%22%2C%22id%22%3A%22query_history.average_execution_time%22%2C%22name%22%3A%22Average+Execution+Time%22%7D%5D%2C%22showLabels%22%3Atrue%2C%22showValues%22%3Atrue%2C%22unpinAxis%22%3Afalse%2C%22tickDensity%22%3A%22default%22%2C%22tickDensityCustom%22%3A46%2C%22type%22%3A%22linear%22%7D%2C%7B%22label%22%3Anull%2C%22orientation%22%3A%22right%22%2C%22series%22%3A%5B%7B%22axisId%22%3A%22query_history.median_queued_overload_time%22%2C%22id%22%3A%22query_history.median_queued_overload_time%22%2C%22name%22%3A%22Median+Queued+Overload+Time%22%7D%5D%2C%22showLabels%22%3Atrue%2C%22showValues%22%3Atrue%2C%22unpinAxis%22%3Afalse%2C%22tickDensity%22%3A%22default%22%2C%22tickDensityCustom%22%3A46%2C%22type%22%3A%22linear%22%7D%5D%2C%22show_y_axis_labels%22%3Atrue%2C%22show_y_axis_ticks%22%3Atrue%2C%22y_axis_tick_density%22%3A%22default%22%2C%22y_axis_tick_density_custom%22%3A5%2C%22show_x_axis_label%22%3Atrue%2C%22show_x_axis_ticks%22%3Atrue%2C%22y_axis_scale_mode%22%3A%22linear%22%2C%22x_axis_reversed%22%3Afalse%2C%22y_axis_reversed%22%3Afalse%2C%22size_by_field%22%3A%22query_history.median_queued_overload_time%22%2C%22plot_size_by_field%22%3Atrue%2C%22trellis%22%3A%22%22%2C%22stacking%22%3A%22%22%2C%22limit_displayed_rows%22%3Afalse%2C%22hidden_series%22%3A%5B%5D%2C%22legend_position%22%3A%22center%22%2C%22series_types%22%3A%7B%22query_history.median_queued_overload_time%22%3A%22scatter%22%2C%22query_history.query_count%22%3A%22column%22%2C%22query_history.average_execution_time%22%3A%22area%22%7D%2C%22point_style%22%3A%22circle%22%2C%22series_colors%22%3A%7B%22query_history.average_execution_time%22%3A%22%23D5DB61%22%2C%22query_history.query_count%22%3A%22%2325435A%22%7D%2C%22series_point_styles%22%3A%7B%22query_history.average_execution_time%22%3A%22square%22%7D%2C%22show_value_labels%22%3Afalse%2C%22label_density%22%3A25%2C%22x_axis_scale%22%3A%22auto%22%2C%22y_axis_combined%22%3Atrue%2C%22show_null_points%22%3Afalse%2C%22interpolation%22%3A%22linear%22%2C%22discontinuous_nulls%22%3Atrue%2C%22ordering%22%3A%22none%22%2C%22show_null_labels%22%3Afalse%2C%22show_totals_labels%22%3Afalse%2C%22show_silhouette%22%3Afalse%2C%22totals_color%22%3A%22%23808080%22%2C%22type%22%3A%22looker_line%22%7D{% endif %}"}
  }

  measure: prior_mtd_query_count {
    type: count
    filters: {field: is_prior_month_mtd value: "yes"}
    value_format_name:  decimal_0
    alias: [prior_mtd_job_count, prior_month_job_count]
    link: { label: "Warehouse Breakdown" url: "{% if warehouse_name._in_query %}{% else %}{{hidden_drill_warehouse_name_breakdown._link}}&vis=%7B%22color_application%22%3A%7B%22collection_id%22%3A%226c27c30e-5523-4080-82ae-272146e699d0%22%2C%22palette_id%22%3A%2287654122-8144-4720-8259-82ac9908d5f4%22%2C%22options%22%3A%7B%22steps%22%3A5%7D%7D%2C%22x_axis_gridlines%22%3Afalse%2C%22y_axis_gridlines%22%3Atrue%2C%22show_view_names%22%3Afalse%2C%22y_axes%22%3A%5B%7B%22label%22%3A%22%22%2C%22orientation%22%3A%22left%22%2C%22series%22%3A%5B%7B%22axisId%22%3A%22query_history.query_count%22%2C%22id%22%3A%22query_history.query_count%22%2C%22name%22%3A%22Query+Count%22%7D%5D%2C%22showLabels%22%3Atrue%2C%22showValues%22%3Atrue%2C%22unpinAxis%22%3Afalse%2C%22tickDensity%22%3A%22default%22%2C%22tickDensityCustom%22%3A0%2C%22type%22%3A%22linear%22%7D%2C%7B%22label%22%3A%22%22%2C%22orientation%22%3A%22right%22%2C%22series%22%3A%5B%7B%22axisId%22%3A%22query_history.average_execution_time%22%2C%22id%22%3A%22query_history.average_execution_time%22%2C%22name%22%3A%22Average+Execution+Time%22%7D%5D%2C%22showLabels%22%3Atrue%2C%22showValues%22%3Atrue%2C%22unpinAxis%22%3Afalse%2C%22tickDensity%22%3A%22default%22%2C%22tickDensityCustom%22%3A46%2C%22type%22%3A%22linear%22%7D%2C%7B%22label%22%3Anull%2C%22orientation%22%3A%22right%22%2C%22series%22%3A%5B%7B%22axisId%22%3A%22query_history.median_queued_overload_time%22%2C%22id%22%3A%22query_history.median_queued_overload_time%22%2C%22name%22%3A%22Median+Queued+Overload+Time%22%7D%5D%2C%22showLabels%22%3Atrue%2C%22showValues%22%3Atrue%2C%22unpinAxis%22%3Afalse%2C%22tickDensity%22%3A%22default%22%2C%22tickDensityCustom%22%3A46%2C%22type%22%3A%22linear%22%7D%5D%2C%22show_y_axis_labels%22%3Atrue%2C%22show_y_axis_ticks%22%3Atrue%2C%22y_axis_tick_density%22%3A%22default%22%2C%22y_axis_tick_density_custom%22%3A5%2C%22show_x_axis_label%22%3Atrue%2C%22show_x_axis_ticks%22%3Atrue%2C%22y_axis_scale_mode%22%3A%22linear%22%2C%22x_axis_reversed%22%3Afalse%2C%22y_axis_reversed%22%3Afalse%2C%22size_by_field%22%3A%22query_history.median_queued_overload_time%22%2C%22plot_size_by_field%22%3Atrue%2C%22trellis%22%3A%22%22%2C%22stacking%22%3A%22%22%2C%22limit_displayed_rows%22%3Afalse%2C%22hidden_series%22%3A%5B%5D%2C%22legend_position%22%3A%22center%22%2C%22series_types%22%3A%7B%22query_history.median_queued_overload_time%22%3A%22scatter%22%2C%22query_history.query_count%22%3A%22column%22%2C%22query_history.average_execution_time%22%3A%22area%22%7D%2C%22point_style%22%3A%22circle%22%2C%22series_colors%22%3A%7B%22query_history.average_execution_time%22%3A%22%23D5DB61%22%2C%22query_history.query_count%22%3A%22%2325435A%22%7D%2C%22series_point_styles%22%3A%7B%22query_history.average_execution_time%22%3A%22square%22%7D%2C%22show_value_labels%22%3Afalse%2C%22label_density%22%3A25%2C%22x_axis_scale%22%3A%22auto%22%2C%22y_axis_combined%22%3Atrue%2C%22show_null_points%22%3Afalse%2C%22interpolation%22%3A%22linear%22%2C%22discontinuous_nulls%22%3Atrue%2C%22ordering%22%3A%22none%22%2C%22show_null_labels%22%3Afalse%2C%22show_totals_labels%22%3Afalse%2C%22show_silhouette%22%3Afalse%2C%22totals_color%22%3A%22%23808080%22%2C%22type%22%3A%22looker_line%22%7D{% endif %}"}
  }

  measure: average_execution_time {
    type: average
    group_label: "Runtime Metrics"
    sql: ${execution_time} ;;
    value_format_name: decimal_2
  }

  measure: total_execution_time {
    type: sum
    group_label: "Runtime Metrics"
    sql: ${execution_time} ;;
    value_format_name: decimal_2
  }

  measure: total_queued_overload_time {
    type: sum
    group_label: "Runtime Metrics"
    sql: ${queued_overload_time} ;;
    filters: { field: has_overload_time value: "Yes" }
    value_format_name: decimal_2
    link: { label: "Warehouse Breakdown" url: "{% if warehouse_name._in_query %}{% else %}{{hidden_drill_warehouse_name_breakdown._link}}&vis=%7B%22color_application%22%3A%7B%22collection_id%22%3A%226c27c30e-5523-4080-82ae-272146e699d0%22%2C%22palette_id%22%3A%2287654122-8144-4720-8259-82ac9908d5f4%22%2C%22options%22%3A%7B%22steps%22%3A5%7D%7D%2C%22x_axis_gridlines%22%3Afalse%2C%22y_axis_gridlines%22%3Atrue%2C%22show_view_names%22%3Afalse%2C%22y_axes%22%3A%5B%7B%22label%22%3A%22%22%2C%22orientation%22%3A%22left%22%2C%22series%22%3A%5B%7B%22axisId%22%3A%22query_history.query_count%22%2C%22id%22%3A%22query_history.query_count%22%2C%22name%22%3A%22Query+Count%22%7D%5D%2C%22showLabels%22%3Atrue%2C%22showValues%22%3Atrue%2C%22unpinAxis%22%3Afalse%2C%22tickDensity%22%3A%22default%22%2C%22tickDensityCustom%22%3A0%2C%22type%22%3A%22linear%22%7D%2C%7B%22label%22%3A%22%22%2C%22orientation%22%3A%22right%22%2C%22series%22%3A%5B%7B%22axisId%22%3A%22query_history.average_execution_time%22%2C%22id%22%3A%22query_history.average_execution_time%22%2C%22name%22%3A%22Average+Execution+Time%22%7D%5D%2C%22showLabels%22%3Atrue%2C%22showValues%22%3Atrue%2C%22unpinAxis%22%3Afalse%2C%22tickDensity%22%3A%22default%22%2C%22tickDensityCustom%22%3A46%2C%22type%22%3A%22linear%22%7D%2C%7B%22label%22%3Anull%2C%22orientation%22%3A%22right%22%2C%22series%22%3A%5B%7B%22axisId%22%3A%22query_history.median_queued_overload_time%22%2C%22id%22%3A%22query_history.median_queued_overload_time%22%2C%22name%22%3A%22Median+Queued+Overload+Time%22%7D%5D%2C%22showLabels%22%3Atrue%2C%22showValues%22%3Atrue%2C%22unpinAxis%22%3Afalse%2C%22tickDensity%22%3A%22default%22%2C%22tickDensityCustom%22%3A46%2C%22type%22%3A%22linear%22%7D%5D%2C%22show_y_axis_labels%22%3Atrue%2C%22show_y_axis_ticks%22%3Atrue%2C%22y_axis_tick_density%22%3A%22default%22%2C%22y_axis_tick_density_custom%22%3A5%2C%22show_x_axis_label%22%3Atrue%2C%22show_x_axis_ticks%22%3Atrue%2C%22y_axis_scale_mode%22%3A%22linear%22%2C%22x_axis_reversed%22%3Afalse%2C%22y_axis_reversed%22%3Afalse%2C%22size_by_field%22%3A%22query_history.median_queued_overload_time%22%2C%22plot_size_by_field%22%3Atrue%2C%22trellis%22%3A%22%22%2C%22stacking%22%3A%22%22%2C%22limit_displayed_rows%22%3Afalse%2C%22hidden_series%22%3A%5B%5D%2C%22legend_position%22%3A%22center%22%2C%22series_types%22%3A%7B%22query_history.median_queued_overload_time%22%3A%22scatter%22%2C%22query_history.query_count%22%3A%22column%22%2C%22query_history.average_execution_time%22%3A%22area%22%7D%2C%22point_style%22%3A%22circle%22%2C%22series_colors%22%3A%7B%22query_history.average_execution_time%22%3A%22%23D5DB61%22%2C%22query_history.query_count%22%3A%22%2325435A%22%7D%2C%22series_point_styles%22%3A%7B%22query_history.average_execution_time%22%3A%22square%22%7D%2C%22show_value_labels%22%3Afalse%2C%22label_density%22%3A25%2C%22x_axis_scale%22%3A%22auto%22%2C%22y_axis_combined%22%3Atrue%2C%22show_null_points%22%3Afalse%2C%22interpolation%22%3A%22linear%22%2C%22discontinuous_nulls%22%3Atrue%2C%22ordering%22%3A%22none%22%2C%22show_null_labels%22%3Afalse%2C%22show_totals_labels%22%3Afalse%2C%22show_silhouette%22%3Afalse%2C%22totals_color%22%3A%22%23808080%22%2C%22type%22%3A%22looker_line%22%7D{% endif %}"}
  }

  measure: median_queued_overload_time {
    type: median
    group_label: "Runtime Metrics"
    sql: 1.0*${queued_overload_time} ;;
    value_format_name: decimal_2
    filters: { field: has_overload_time value: "Yes" }
    drill_fields: [query_id, query_type, query_text, looker_query_context, execution_time, queued_overload_time, start_time, end_time, database_name, warehouse_name, user_name]
    link: { label: "Warehouse Breakdown" url: "{% if warehouse_name._in_query %}{% else %}{{hidden_drill_warehouse_name_breakdown._link}}&vis=%7B%22color_application%22%3A%7B%22collection_id%22%3A%226c27c30e-5523-4080-82ae-272146e699d0%22%2C%22palette_id%22%3A%2287654122-8144-4720-8259-82ac9908d5f4%22%2C%22options%22%3A%7B%22steps%22%3A5%7D%7D%2C%22x_axis_gridlines%22%3Afalse%2C%22y_axis_gridlines%22%3Atrue%2C%22show_view_names%22%3Afalse%2C%22y_axes%22%3A%5B%7B%22label%22%3A%22%22%2C%22orientation%22%3A%22left%22%2C%22series%22%3A%5B%7B%22axisId%22%3A%22query_history.query_count%22%2C%22id%22%3A%22query_history.query_count%22%2C%22name%22%3A%22Query+Count%22%7D%5D%2C%22showLabels%22%3Atrue%2C%22showValues%22%3Atrue%2C%22unpinAxis%22%3Afalse%2C%22tickDensity%22%3A%22default%22%2C%22tickDensityCustom%22%3A0%2C%22type%22%3A%22linear%22%7D%2C%7B%22label%22%3A%22%22%2C%22orientation%22%3A%22right%22%2C%22series%22%3A%5B%7B%22axisId%22%3A%22query_history.average_execution_time%22%2C%22id%22%3A%22query_history.average_execution_time%22%2C%22name%22%3A%22Average+Execution+Time%22%7D%5D%2C%22showLabels%22%3Atrue%2C%22showValues%22%3Atrue%2C%22unpinAxis%22%3Afalse%2C%22tickDensity%22%3A%22default%22%2C%22tickDensityCustom%22%3A46%2C%22type%22%3A%22linear%22%7D%2C%7B%22label%22%3Anull%2C%22orientation%22%3A%22right%22%2C%22series%22%3A%5B%7B%22axisId%22%3A%22query_history.median_queued_overload_time%22%2C%22id%22%3A%22query_history.median_queued_overload_time%22%2C%22name%22%3A%22Median+Queued+Overload+Time%22%7D%5D%2C%22showLabels%22%3Atrue%2C%22showValues%22%3Atrue%2C%22unpinAxis%22%3Afalse%2C%22tickDensity%22%3A%22default%22%2C%22tickDensityCustom%22%3A46%2C%22type%22%3A%22linear%22%7D%5D%2C%22show_y_axis_labels%22%3Atrue%2C%22show_y_axis_ticks%22%3Atrue%2C%22y_axis_tick_density%22%3A%22default%22%2C%22y_axis_tick_density_custom%22%3A5%2C%22show_x_axis_label%22%3Atrue%2C%22show_x_axis_ticks%22%3Atrue%2C%22y_axis_scale_mode%22%3A%22linear%22%2C%22x_axis_reversed%22%3Afalse%2C%22y_axis_reversed%22%3Afalse%2C%22size_by_field%22%3A%22query_history.median_queued_overload_time%22%2C%22plot_size_by_field%22%3Atrue%2C%22trellis%22%3A%22%22%2C%22stacking%22%3A%22%22%2C%22limit_displayed_rows%22%3Afalse%2C%22hidden_series%22%3A%5B%5D%2C%22legend_position%22%3A%22center%22%2C%22series_types%22%3A%7B%22query_history.median_queued_overload_time%22%3A%22scatter%22%2C%22query_history.query_count%22%3A%22column%22%2C%22query_history.average_execution_time%22%3A%22area%22%7D%2C%22point_style%22%3A%22circle%22%2C%22series_colors%22%3A%7B%22query_history.average_execution_time%22%3A%22%23D5DB61%22%2C%22query_history.query_count%22%3A%22%2325435A%22%7D%2C%22series_point_styles%22%3A%7B%22query_history.average_execution_time%22%3A%22square%22%7D%2C%22show_value_labels%22%3Afalse%2C%22label_density%22%3A25%2C%22x_axis_scale%22%3A%22auto%22%2C%22y_axis_combined%22%3Atrue%2C%22show_null_points%22%3Afalse%2C%22interpolation%22%3A%22linear%22%2C%22discontinuous_nulls%22%3Atrue%2C%22ordering%22%3A%22none%22%2C%22show_null_labels%22%3Afalse%2C%22show_totals_labels%22%3Afalse%2C%22show_silhouette%22%3Afalse%2C%22totals_color%22%3A%22%23808080%22%2C%22type%22%3A%22looker_line%22%7D{% endif %}"}
  }

  measure: total_elapsed_time {
    type: sum
    group_label: "Runtime Metrics"
    sql: ${elapsed_time} ;;
    value_format_name: decimal_2
  }

  measure: total_queued_repair_time  {
    type: sum
    group_label: "Runtime Metrics"
    sql: ${queued_repair_time} ;;
    value_format_name: decimal_2
  }

  measure: total_compilation_time  {
    type: sum
    group_label: "Runtime Metrics"
    sql: ${compilation_time} ;;
    value_format_name: decimal_2
  }

  measure: total_queued_provisioning_time  {
    type: sum
    group_label: "Runtime Metrics"
    sql: ${queued_provisioning_time} ;;
    value_format_name: decimal_2
  }
  measure: total_transaction_blocked_time  {
    type: sum
    group_label: "Runtime Metrics"
    sql: ${transaction_blocked_time} ;;
    value_format_name: decimal_2
  }

  measure: current_mtd_avg_exec_time {
    type: average
    sql: ${execution_time} ;;
    group_label: "Runtime Metrics"
    filters: {field: start_date value: "this month"}
    value_format_name: decimal_2
    drill_fields: [user_name,warehouse_name,database_name,current_mtd_avg_exec_time]
  }

  measure: prior_mtd_avg_exec_time {
    type:  average
    sql:  ${execution_time} ;;
    group_label: "Runtime Metrics"
    filters: {field: is_prior_month_mtd value: "yes"}
    value_format_name: decimal_2
  }

  measure: hidden_drill_warehouse_name_breakdown {
    type: sum
    sql: null ;;
    drill_fields: [warehouse_name, query_count, average_execution_time, median_queued_overload_time]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      #id,
      user_name,
      role_name,
      database_name,
      warehouse_name,
      #databases.id,
      databases.database_name
    ]
  }
}
