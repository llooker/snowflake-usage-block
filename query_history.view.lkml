view: query_history {
  sql_table_name: SNOWFLAKE.ACCOUNT_USAGE.QUERY_HISTORY ;;

  dimension: looker_query_context {
    type: string
    hidden: yes
    sql: PARSE_JSON(regexp_substr(regexp_substr(query_text, 'Query\\sContext\\s\'\{.*\}\''),'\{.*\}')) ;;
    group_label: "Looker Context"
  }

  dimension: looker_history_id {
    type: number
    sql: ${looker_query_context}:history_id ;;
    value_format_name: decimal_0
    group_label: "Looker Context"
  }

  dimension: looker_user_id {
    type: number
    sql: ${looker_query_context}:user_id ;;
    value_format_name: decimal_0
    group_label: "Looker Context"
  }

  dimension: query_id {
    type: string
    primary_key: yes
    sql: ${TABLE}.query_id ;;
    group_label: "Query"
  }

  dimension: query_text {
    type: string
    sql: ${TABLE}.query_text ;;
    group_label: "Query"
  }

  dimension: query_type {
    type: string
    sql: ${TABLE}.query_type ;;
    group_label: "Query"
  }

  dimension: query_tag {
    type: string
    sql: ${TABLE}.query_tag ;;
    group_label: "Query"
  }

  dimension: database_id {
    type: number
    hidden: yes
    sql: ${TABLE}.database_id ;;
    value_format_name: decimal_0
    group_label: "Context"
 }

  dimension: database_name {
    type: string
    sql: ${TABLE}.database_name ;;
    group_label: "Context"
  }

  dimension: schema_id {
    type: number
    hidden: yes
    sql: ${TABLE}.schema_id ;;
    value_format_name: decimal_0
    group_label: "Context"
  }

  dimension: schema_name {
    type: string
    sql: ${TABLE}.schema_name ;;
    group_label: "Context"
  }

  dimension: session_id {
    type: number
    sql: ${TABLE}.session_id ;;
    value_format_name: decimal_0
    group_label: "Context"
  }

  dimension: user_name {
    type: string
    sql: ${TABLE}.user_name ;;
    group_label: "Context"
  }

  dimension: role_name {
    type: string
    sql: ${TABLE}.role_name ;;
    group_label: "Context"
  }

  dimension: warehouse_id {
    type: number
    hidden: yes
    sql: ${TABLE}.warehouse_id ;;
    value_format_name: decimal_0
    group_label: "Context"
  }

  dimension: warehouse_name {
    type: string
    sql: ${TABLE}.warehouse_name ;;
    group_label: "Context"
  }

  dimension: warehouse_size {
    type: string
    sql: ${TABLE}.warehouse_size ;;
    group_label: "Context"
  }

  dimension: warehouse_type {
    type: string
    sql: ${TABLE}.warehouse_type ;;
    group_label: "Context"
  }

  dimension: cluster_number {
    type: number
    sql: ${TABLE}.cluster_number ;;
    value_format_name: decimal_0
    group_label: "Context"
  }

  dimension: execution_status {
    type: string
    sql: INITCAP(${TABLE}.execution_status) ;;
    group_label: "Execution"
  }

  dimension: error_code {
    type: string
    sql: ${TABLE}.error_code ;;
    group_label: "Execution"
  }

  dimension: error_message {
    type: string
    sql: ${TABLE}.error_message ;;
    group_label: "Execution"
  }

  dimension_group: start {
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
    sql: ${TABLE}.start_time ;;
    label: "Date -  Start"
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
    sql: ${TABLE}.end_time ;;
    label: "Date - End"
  }

  dimension: is_prior_month_mtd {
    hidden: yes
    type: yesno
    sql:  EXTRACT(month, ${start_raw}) = EXTRACT(month, current_timestamp()) - 1
            and ${start_raw} <= dateadd(month, -1, current_timestamp())  ;;
  }

  measure: query_count {
    type: count
    drill_fields: [detail*]
    alias: [job_count]
    link: { label: "Warehouse Breakdown" url: "{% if warehouse_name._in_query %}{% else %}{{hidden_drill_warehouse_name_breakdown._link}}&vis=%7B%22color_application%22%3A%7B%22collection_id%22%3A%226c27c30e-5523-4080-82ae-272146e699d0%22%2C%22palette_id%22%3A%2287654122-8144-4720-8259-82ac9908d5f4%22%2C%22options%22%3A%7B%22steps%22%3A5%7D%7D%2C%22x_axis_gridlines%22%3Afalse%2C%22y_axis_gridlines%22%3Atrue%2C%22show_view_names%22%3Afalse%2C%22y_axes%22%3A%5B%7B%22label%22%3A%22%22%2C%22orientation%22%3A%22left%22%2C%22series%22%3A%5B%7B%22axisId%22%3A%22query_history.query_count%22%2C%22id%22%3A%22query_history.query_count%22%2C%22name%22%3A%22Query+Count%22%7D%5D%2C%22showLabels%22%3Atrue%2C%22showValues%22%3Atrue%2C%22unpinAxis%22%3Afalse%2C%22tickDensity%22%3A%22default%22%2C%22tickDensityCustom%22%3A0%2C%22type%22%3A%22linear%22%7D%2C%7B%22label%22%3A%22%22%2C%22orientation%22%3A%22right%22%2C%22series%22%3A%5B%7B%22axisId%22%3A%22query_history.average_execution_time%22%2C%22id%22%3A%22query_history.average_execution_time%22%2C%22name%22%3A%22Average+Execution+Time%22%7D%5D%2C%22showLabels%22%3Atrue%2C%22showValues%22%3Atrue%2C%22unpinAxis%22%3Afalse%2C%22tickDensity%22%3A%22default%22%2C%22tickDensityCustom%22%3A46%2C%22type%22%3A%22linear%22%7D%2C%7B%22label%22%3Anull%2C%22orientation%22%3A%22right%22%2C%22series%22%3A%5B%7B%22axisId%22%3A%22query_history.median_queued_overload_time%22%2C%22id%22%3A%22query_history.median_queued_overload_time%22%2C%22name%22%3A%22Median+Queued+Overload+Time%22%7D%5D%2C%22showLabels%22%3Atrue%2C%22showValues%22%3Atrue%2C%22unpinAxis%22%3Afalse%2C%22tickDensity%22%3A%22default%22%2C%22tickDensityCustom%22%3A46%2C%22type%22%3A%22linear%22%7D%5D%2C%22show_y_axis_labels%22%3Atrue%2C%22show_y_axis_ticks%22%3Atrue%2C%22y_axis_tick_density%22%3A%22default%22%2C%22y_axis_tick_density_custom%22%3A5%2C%22show_x_axis_label%22%3Atrue%2C%22show_x_axis_ticks%22%3Atrue%2C%22y_axis_scale_mode%22%3A%22linear%22%2C%22x_axis_reversed%22%3Afalse%2C%22y_axis_reversed%22%3Afalse%2C%22size_by_field%22%3A%22query_history.median_queued_overload_time%22%2C%22plot_size_by_field%22%3Atrue%2C%22trellis%22%3A%22%22%2C%22stacking%22%3A%22%22%2C%22limit_displayed_rows%22%3Afalse%2C%22hidden_series%22%3A%5B%5D%2C%22legend_position%22%3A%22center%22%2C%22series_types%22%3A%7B%22query_history.median_queued_overload_time%22%3A%22scatter%22%2C%22query_history.query_count%22%3A%22column%22%2C%22query_history.average_execution_time%22%3A%22area%22%7D%2C%22point_style%22%3A%22circle%22%2C%22series_colors%22%3A%7B%22query_history.average_execution_time%22%3A%22%23D5DB61%22%2C%22query_history.query_count%22%3A%22%2325435A%22%7D%2C%22series_point_styles%22%3A%7B%22query_history.average_execution_time%22%3A%22square%22%7D%2C%22show_value_labels%22%3Afalse%2C%22label_density%22%3A25%2C%22x_axis_scale%22%3A%22auto%22%2C%22y_axis_combined%22%3Atrue%2C%22show_null_points%22%3Afalse%2C%22interpolation%22%3A%22linear%22%2C%22discontinuous_nulls%22%3Atrue%2C%22ordering%22%3A%22none%22%2C%22show_null_labels%22%3Afalse%2C%22show_totals_labels%22%3Afalse%2C%22show_silhouette%22%3Afalse%2C%22totals_color%22%3A%22%23808080%22%2C%22type%22%3A%22looker_line%22%7D{% endif %}"}
    group_label: "Counts"
  }

  measure: current_mtd_query_count {
    type: count
    filters: {field: start_date value: "this month"}
    alias: [current_mtd_job_count, current_month_job_count]
    drill_fields: [user_name,warehouse_name,database_name,current_mtd_query_count]
    link: { label: "Warehouse Breakdown" url: "{% if warehouse_name._in_query %}{% else %}{{hidden_drill_warehouse_name_breakdown._link}}&vis=%7B%22color_application%22%3A%7B%22collection_id%22%3A%226c27c30e-5523-4080-82ae-272146e699d0%22%2C%22palette_id%22%3A%2287654122-8144-4720-8259-82ac9908d5f4%22%2C%22options%22%3A%7B%22steps%22%3A5%7D%7D%2C%22x_axis_gridlines%22%3Afalse%2C%22y_axis_gridlines%22%3Atrue%2C%22show_view_names%22%3Afalse%2C%22y_axes%22%3A%5B%7B%22label%22%3A%22%22%2C%22orientation%22%3A%22left%22%2C%22series%22%3A%5B%7B%22axisId%22%3A%22query_history.query_count%22%2C%22id%22%3A%22query_history.query_count%22%2C%22name%22%3A%22Query+Count%22%7D%5D%2C%22showLabels%22%3Atrue%2C%22showValues%22%3Atrue%2C%22unpinAxis%22%3Afalse%2C%22tickDensity%22%3A%22default%22%2C%22tickDensityCustom%22%3A0%2C%22type%22%3A%22linear%22%7D%2C%7B%22label%22%3A%22%22%2C%22orientation%22%3A%22right%22%2C%22series%22%3A%5B%7B%22axisId%22%3A%22query_history.average_execution_time%22%2C%22id%22%3A%22query_history.average_execution_time%22%2C%22name%22%3A%22Average+Execution+Time%22%7D%5D%2C%22showLabels%22%3Atrue%2C%22showValues%22%3Atrue%2C%22unpinAxis%22%3Afalse%2C%22tickDensity%22%3A%22default%22%2C%22tickDensityCustom%22%3A46%2C%22type%22%3A%22linear%22%7D%2C%7B%22label%22%3Anull%2C%22orientation%22%3A%22right%22%2C%22series%22%3A%5B%7B%22axisId%22%3A%22query_history.median_queued_overload_time%22%2C%22id%22%3A%22query_history.median_queued_overload_time%22%2C%22name%22%3A%22Median+Queued+Overload+Time%22%7D%5D%2C%22showLabels%22%3Atrue%2C%22showValues%22%3Atrue%2C%22unpinAxis%22%3Afalse%2C%22tickDensity%22%3A%22default%22%2C%22tickDensityCustom%22%3A46%2C%22type%22%3A%22linear%22%7D%5D%2C%22show_y_axis_labels%22%3Atrue%2C%22show_y_axis_ticks%22%3Atrue%2C%22y_axis_tick_density%22%3A%22default%22%2C%22y_axis_tick_density_custom%22%3A5%2C%22show_x_axis_label%22%3Atrue%2C%22show_x_axis_ticks%22%3Atrue%2C%22y_axis_scale_mode%22%3A%22linear%22%2C%22x_axis_reversed%22%3Afalse%2C%22y_axis_reversed%22%3Afalse%2C%22size_by_field%22%3A%22query_history.median_queued_overload_time%22%2C%22plot_size_by_field%22%3Atrue%2C%22trellis%22%3A%22%22%2C%22stacking%22%3A%22%22%2C%22limit_displayed_rows%22%3Afalse%2C%22hidden_series%22%3A%5B%5D%2C%22legend_position%22%3A%22center%22%2C%22series_types%22%3A%7B%22query_history.median_queued_overload_time%22%3A%22scatter%22%2C%22query_history.query_count%22%3A%22column%22%2C%22query_history.average_execution_time%22%3A%22area%22%7D%2C%22point_style%22%3A%22circle%22%2C%22series_colors%22%3A%7B%22query_history.average_execution_time%22%3A%22%23D5DB61%22%2C%22query_history.query_count%22%3A%22%2325435A%22%7D%2C%22series_point_styles%22%3A%7B%22query_history.average_execution_time%22%3A%22square%22%7D%2C%22show_value_labels%22%3Afalse%2C%22label_density%22%3A25%2C%22x_axis_scale%22%3A%22auto%22%2C%22y_axis_combined%22%3Atrue%2C%22show_null_points%22%3Afalse%2C%22interpolation%22%3A%22linear%22%2C%22discontinuous_nulls%22%3Atrue%2C%22ordering%22%3A%22none%22%2C%22show_null_labels%22%3Afalse%2C%22show_totals_labels%22%3Afalse%2C%22show_silhouette%22%3Afalse%2C%22totals_color%22%3A%22%23808080%22%2C%22type%22%3A%22looker_line%22%7D{% endif %}"}
    group_label: "Counts"
  }

  measure: prior_month_total_query_count {
    type: count
    filters: {field: start_date value: "last month"}
    value_format_name: decimal_0
    alias: [prior_month_total_job_count]
    link: { label: "Warehouse Breakdown" url: "{% if warehouse_name._in_query %}{% else %}{{hidden_drill_warehouse_name_breakdown._link}}&vis=%7B%22color_application%22%3A%7B%22collection_id%22%3A%226c27c30e-5523-4080-82ae-272146e699d0%22%2C%22palette_id%22%3A%2287654122-8144-4720-8259-82ac9908d5f4%22%2C%22options%22%3A%7B%22steps%22%3A5%7D%7D%2C%22x_axis_gridlines%22%3Afalse%2C%22y_axis_gridlines%22%3Atrue%2C%22show_view_names%22%3Afalse%2C%22y_axes%22%3A%5B%7B%22label%22%3A%22%22%2C%22orientation%22%3A%22left%22%2C%22series%22%3A%5B%7B%22axisId%22%3A%22query_history.query_count%22%2C%22id%22%3A%22query_history.query_count%22%2C%22name%22%3A%22Query+Count%22%7D%5D%2C%22showLabels%22%3Atrue%2C%22showValues%22%3Atrue%2C%22unpinAxis%22%3Afalse%2C%22tickDensity%22%3A%22default%22%2C%22tickDensityCustom%22%3A0%2C%22type%22%3A%22linear%22%7D%2C%7B%22label%22%3A%22%22%2C%22orientation%22%3A%22right%22%2C%22series%22%3A%5B%7B%22axisId%22%3A%22query_history.average_execution_time%22%2C%22id%22%3A%22query_history.average_execution_time%22%2C%22name%22%3A%22Average+Execution+Time%22%7D%5D%2C%22showLabels%22%3Atrue%2C%22showValues%22%3Atrue%2C%22unpinAxis%22%3Afalse%2C%22tickDensity%22%3A%22default%22%2C%22tickDensityCustom%22%3A46%2C%22type%22%3A%22linear%22%7D%2C%7B%22label%22%3Anull%2C%22orientation%22%3A%22right%22%2C%22series%22%3A%5B%7B%22axisId%22%3A%22query_history.median_queued_overload_time%22%2C%22id%22%3A%22query_history.median_queued_overload_time%22%2C%22name%22%3A%22Median+Queued+Overload+Time%22%7D%5D%2C%22showLabels%22%3Atrue%2C%22showValues%22%3Atrue%2C%22unpinAxis%22%3Afalse%2C%22tickDensity%22%3A%22default%22%2C%22tickDensityCustom%22%3A46%2C%22type%22%3A%22linear%22%7D%5D%2C%22show_y_axis_labels%22%3Atrue%2C%22show_y_axis_ticks%22%3Atrue%2C%22y_axis_tick_density%22%3A%22default%22%2C%22y_axis_tick_density_custom%22%3A5%2C%22show_x_axis_label%22%3Atrue%2C%22show_x_axis_ticks%22%3Atrue%2C%22y_axis_scale_mode%22%3A%22linear%22%2C%22x_axis_reversed%22%3Afalse%2C%22y_axis_reversed%22%3Afalse%2C%22size_by_field%22%3A%22query_history.median_queued_overload_time%22%2C%22plot_size_by_field%22%3Atrue%2C%22trellis%22%3A%22%22%2C%22stacking%22%3A%22%22%2C%22limit_displayed_rows%22%3Afalse%2C%22hidden_series%22%3A%5B%5D%2C%22legend_position%22%3A%22center%22%2C%22series_types%22%3A%7B%22query_history.median_queued_overload_time%22%3A%22scatter%22%2C%22query_history.query_count%22%3A%22column%22%2C%22query_history.average_execution_time%22%3A%22area%22%7D%2C%22point_style%22%3A%22circle%22%2C%22series_colors%22%3A%7B%22query_history.average_execution_time%22%3A%22%23D5DB61%22%2C%22query_history.query_count%22%3A%22%2325435A%22%7D%2C%22series_point_styles%22%3A%7B%22query_history.average_execution_time%22%3A%22square%22%7D%2C%22show_value_labels%22%3Afalse%2C%22label_density%22%3A25%2C%22x_axis_scale%22%3A%22auto%22%2C%22y_axis_combined%22%3Atrue%2C%22show_null_points%22%3Afalse%2C%22interpolation%22%3A%22linear%22%2C%22discontinuous_nulls%22%3Atrue%2C%22ordering%22%3A%22none%22%2C%22show_null_labels%22%3Afalse%2C%22show_totals_labels%22%3Afalse%2C%22show_silhouette%22%3Afalse%2C%22totals_color%22%3A%22%23808080%22%2C%22type%22%3A%22looker_line%22%7D{% endif %}"}
    group_label: "Counts"
  }

  measure: prior_mtd_query_count {
    type: count
    filters: {field: is_prior_month_mtd value: "yes"}
    value_format_name:  decimal_0
    alias: [prior_mtd_job_count, prior_month_job_count]
    link: { label: "Warehouse Breakdown" url: "{% if warehouse_name._in_query %}{% else %}{{hidden_drill_warehouse_name_breakdown._link}}&vis=%7B%22color_application%22%3A%7B%22collection_id%22%3A%226c27c30e-5523-4080-82ae-272146e699d0%22%2C%22palette_id%22%3A%2287654122-8144-4720-8259-82ac9908d5f4%22%2C%22options%22%3A%7B%22steps%22%3A5%7D%7D%2C%22x_axis_gridlines%22%3Afalse%2C%22y_axis_gridlines%22%3Atrue%2C%22show_view_names%22%3Afalse%2C%22y_axes%22%3A%5B%7B%22label%22%3A%22%22%2C%22orientation%22%3A%22left%22%2C%22series%22%3A%5B%7B%22axisId%22%3A%22query_history.query_count%22%2C%22id%22%3A%22query_history.query_count%22%2C%22name%22%3A%22Query+Count%22%7D%5D%2C%22showLabels%22%3Atrue%2C%22showValues%22%3Atrue%2C%22unpinAxis%22%3Afalse%2C%22tickDensity%22%3A%22default%22%2C%22tickDensityCustom%22%3A0%2C%22type%22%3A%22linear%22%7D%2C%7B%22label%22%3A%22%22%2C%22orientation%22%3A%22right%22%2C%22series%22%3A%5B%7B%22axisId%22%3A%22query_history.average_execution_time%22%2C%22id%22%3A%22query_history.average_execution_time%22%2C%22name%22%3A%22Average+Execution+Time%22%7D%5D%2C%22showLabels%22%3Atrue%2C%22showValues%22%3Atrue%2C%22unpinAxis%22%3Afalse%2C%22tickDensity%22%3A%22default%22%2C%22tickDensityCustom%22%3A46%2C%22type%22%3A%22linear%22%7D%2C%7B%22label%22%3Anull%2C%22orientation%22%3A%22right%22%2C%22series%22%3A%5B%7B%22axisId%22%3A%22query_history.median_queued_overload_time%22%2C%22id%22%3A%22query_history.median_queued_overload_time%22%2C%22name%22%3A%22Median+Queued+Overload+Time%22%7D%5D%2C%22showLabels%22%3Atrue%2C%22showValues%22%3Atrue%2C%22unpinAxis%22%3Afalse%2C%22tickDensity%22%3A%22default%22%2C%22tickDensityCustom%22%3A46%2C%22type%22%3A%22linear%22%7D%5D%2C%22show_y_axis_labels%22%3Atrue%2C%22show_y_axis_ticks%22%3Atrue%2C%22y_axis_tick_density%22%3A%22default%22%2C%22y_axis_tick_density_custom%22%3A5%2C%22show_x_axis_label%22%3Atrue%2C%22show_x_axis_ticks%22%3Atrue%2C%22y_axis_scale_mode%22%3A%22linear%22%2C%22x_axis_reversed%22%3Afalse%2C%22y_axis_reversed%22%3Afalse%2C%22size_by_field%22%3A%22query_history.median_queued_overload_time%22%2C%22plot_size_by_field%22%3Atrue%2C%22trellis%22%3A%22%22%2C%22stacking%22%3A%22%22%2C%22limit_displayed_rows%22%3Afalse%2C%22hidden_series%22%3A%5B%5D%2C%22legend_position%22%3A%22center%22%2C%22series_types%22%3A%7B%22query_history.median_queued_overload_time%22%3A%22scatter%22%2C%22query_history.query_count%22%3A%22column%22%2C%22query_history.average_execution_time%22%3A%22area%22%7D%2C%22point_style%22%3A%22circle%22%2C%22series_colors%22%3A%7B%22query_history.average_execution_time%22%3A%22%23D5DB61%22%2C%22query_history.query_count%22%3A%22%2325435A%22%7D%2C%22series_point_styles%22%3A%7B%22query_history.average_execution_time%22%3A%22square%22%7D%2C%22show_value_labels%22%3Afalse%2C%22label_density%22%3A25%2C%22x_axis_scale%22%3A%22auto%22%2C%22y_axis_combined%22%3Atrue%2C%22show_null_points%22%3Afalse%2C%22interpolation%22%3A%22linear%22%2C%22discontinuous_nulls%22%3Atrue%2C%22ordering%22%3A%22none%22%2C%22show_null_labels%22%3Afalse%2C%22show_totals_labels%22%3Afalse%2C%22show_silhouette%22%3Afalse%2C%22totals_color%22%3A%22%23808080%22%2C%22type%22%3A%22looker_line%22%7D{% endif %}"}
    group_label: "Counts"
  }

  measure: average_elapsed_time {
    type: average
    sql: ${TABLE}.total_elapsed_time ;;
    value_format_name: decimal_2
    group_label: "Runtime"
  }

  measure: total_elapsed_time {
    type: sum
    sql: ${TABLE}.total_elapsed_time ;;
    value_format_name: decimal_2
    group_label: "Runtime"
  }

  measure: average_compilation_time {
    type: average
    sql: ${TABLE}.compilation_time ;;
    value_format_name: decimal_2
    group_label: "Runtime"
  }

  measure: total_compilation_time {
    type: sum
    sql: ${TABLE}.compilation_time ;;
    value_format_name: decimal_2
    group_label: "Runtime"
  }

  measure: average_execution_time {
    type: average
    sql: ${TABLE}.execution_time ;;
    value_format_name: decimal_2
    group_label: "Runtime"
  }

  measure: total_execution_time {
    type: sum
    sql: ${TABLE}.execution_time ;;
    value_format_name: decimal_2
    group_label: "Runtime"
  }

  measure: current_mtd_avg_exec_time {
    type: average
    sql: ${TABLE}.execution_time ;;
    filters: {field: start_date value: "this month"}
    value_format_name: decimal_2
    drill_fields: [user_name,warehouse_name,database_name,current_mtd_avg_exec_time]
    group_label: "Runtime"
  }

  measure: prior_mtd_avg_exec_time {
    type:  average
    sql: ${TABLE}.execution_time ;;
    filters: {field: is_prior_month_mtd value: "yes"}
    value_format_name: decimal_2
    group_label: "Runtime"
  }

  measure: total_bytes_scanned {
    type: sum
    sql:${TABLE}.bytes_scanned ;;
    value_format_name: decimal_0
    group_label: "Bytes"
  }

  measure: average_bytes_scanned {
    type: average
    sql:${TABLE}.bytes_scanned ;;
    value_format_name: decimal_2
    group_label: "Bytes"
  }

  measure: total_bytes_written {
    type: sum
    sql:${TABLE}.bytes_written ;;
    value_format_name: decimal_0
    group_label: "Bytes"
  }

  measure: average_bytes_written {
    type: average
    sql:${TABLE}.bytes_written ;;
    value_format_name: decimal_2
    group_label: "Bytes"
  }

  measure: total_bytes_deleted {
    type: sum
    sql:${TABLE}.bytes_deleted ;;
    value_format_name: decimal_0
    group_label: "Bytes"
  }

  measure: average_bytes_deleted {
    type: average
    sql:${TABLE}.bytes_deleted ;;
    value_format_name: decimal_2
    group_label: "Bytes"
  }

  measure: total_rows_produced {
    type: sum
    sql:${TABLE}.rows_produced ;;
    value_format_name: decimal_0
    group_label: "Rows"
  }

  measure: average_rows_produced {
    type: average
    sql:${TABLE}.rows_produced ;;
    value_format_name: decimal_2
    group_label: "Rows"
  }

  measure: total_rows_inserted {
    type: sum
    sql:${TABLE}.rows_inserted ;;
    value_format_name: decimal_0
    group_label: "Rows"
  }

  measure: average_rows_inserted {
    type: average
    sql:${TABLE}.rows_inserted ;;
    value_format_name: decimal_2
    group_label: "Rows"
  }

  measure: total_rows_updated {
    type: sum
    sql:${TABLE}.rows_updated ;;
    value_format_name: decimal_0
    group_label: "Rows"
  }

  measure: average_rows_updated {
    type: average
    sql:${TABLE}.rows_updated ;;
    value_format_name: decimal_2
    group_label: "Rows"
  }

  measure: total_rows_deleted {
    type: sum
    sql:${TABLE}.rows_deleted ;;
    value_format_name: decimal_0
    group_label: "Rows"
  }

  measure: average_rows_deleted {
    type: average
    sql:${TABLE}.rows_deleted ;;
    value_format_name: decimal_2
    group_label: "Rows"
  }

  measure: total_rows_unloaded {
    type: sum
    sql:${TABLE}.rows_unloaded ;;
    value_format_name: decimal_0
    group_label: "Rows"
  }

  measure: average_rows_unloaded {
    type: average
    sql:${TABLE}.rows_unloaded ;;
    value_format_name: decimal_2
    group_label: "Rows"
  }

  measure: hidden_drill_warehouse_name_breakdown {
    hidden: yes
    type: sum
    sql: null ;;
    drill_fields: [warehouse_name, query_count, average_execution_time]
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
