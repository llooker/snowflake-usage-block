- dashboard: account_usage_dashboard
  title: Snowflake Usage
  layout: newspaper
  elements:
  - title: Warehouse Metering History - Total Credits by Month
    name: Warehouse Metering History - Total Credits by Month
    model: snowflake_usage_block
    explore: warehouse_metering_history
    type: looker_column
    fields:
    - warehouse_metering_history.total_credits_used
    - warehouse_metering_history.warehouse_name
    - warehouse_metering_history.start_month
    pivots:
    - warehouse_metering_history.warehouse_name
    fill_fields:
    - warehouse_metering_history.start_month
    filters:
      warehouse_metering_history.start_date: 12 months ago for 12 months
    sorts:
    - warehouse_metering_history.warehouse_name
    - warehouse_metering_history.start_month desc
    limit: 500
    query_timezone: UTC
    stacking: normal
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    reference_lines: []
    row: 12
    col: 0
    width: 12
    height: 8
  - title: Billable TB by Month
    name: Billable TB by Month
    model: snowflake_usage_block
    explore: storage_usage
    type: looker_line
    fields:
    - storage_usage.billable_tb
    - storage_usage.usage_month
    fill_fields:
    - storage_usage.usage_month
    filters:
      storage_usage.usage_date: 12 months ago for 12 months
    sorts:
    - storage_usage.usage_month desc
    limit: 500
    query_timezone: UTC
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    show_null_points: true
    point_style: none
    interpolation: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    row: 20
    col: 0
    width: 12
    height: 7
  - title: Average Credits Used by Month
    name: Average Credits Used by Month
    model: snowflake_usage_block
    explore: warehouse_metering_history
    type: looker_column
    fields:
    - warehouse_metering_history.warehouse_name
    - warehouse_metering_history.start_month
    - warehouse_metering_history.average_credits_used
    pivots:
    - warehouse_metering_history.warehouse_name
    fill_fields:
    - warehouse_metering_history.start_month
    filters:
      warehouse_metering_history.start_date: 12 months ago for 12 months
    sorts:
    - warehouse_metering_history.warehouse_name 0
    - warehouse_metering_history.start_month
    limit: 500
    query_timezone: UTC
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    show_null_points: true
    point_style: none
    interpolation: linear
    series_types: {}
    column_spacing_ratio:
    row: 12
    col: 12
    width: 12
    height: 8
  - title: Total Jobs (MTD)
    name: Total Jobs (MTD)
    model: snowflake_usage_block
    explore: query_history
    type: single_value
    fields:
    - query_history.current_mtd_job_count
    - query_history.prior_mtd_job_count
    limit: 500
    query_timezone: UTC
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: true
    comparison_type: progress_percentage
    comparison_reverse_colors: false
    show_comparison_label: true
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    comparison_label: Prior Month
    row: 0
    col: 0
    width: 6
    height: 4
  - title: Total Jobs by Warehouse (MTD)
    name: Total Jobs by Warehouse (MTD)
    model: snowflake_usage_block
    explore: query_history
    type: looker_column
    fields:
    - query_history.warehouse_name
    - query_history.prior_mtd_job_count
    - query_history.current_mtd_job_count
    sorts:
    - query_history.warehouse_name desc
    limit: 500
    query_timezone: UTC
    stacking: ''
    show_value_labels: true
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    value_labels: legend
    label_type: labPer
    show_null_points: true
    point_style: circle
    interpolation: linear
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    series_types: {}
    y_axes:
    - label: Job Count
      maxValue:
      minValue:
      orientation: left
      showLabels: true
      showValues: true
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      unpinAxis: false
      valueFormat:
      series:
      - id: query_history.count
        name: Query History
        axisId: query_history.count
    row: 4
    col: 0
    width: 16
    height: 8
  - title: Average Execution Time by User (MTD)
    name: Average Execution Time by User (MTD)
    model: snowflake_usage_block
    explore: query_history
    type: looker_column
    fields:
    - query_history.user_name
    - query_history.average_execution_time
    filters:
      query_history.start_date: 1 months
    sorts:
    - query_history.average_execution_time desc
    limit: 500
    query_timezone: UTC
    stacking: ''
    show_value_labels: true
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    value_labels: legend
    label_type: labPer
    show_null_points: true
    point_style: circle
    interpolation: linear
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    series_types: {}
    y_axes:
    - label: Avg Execution Time (secs)
      maxValue:
      minValue:
      orientation: left
      showLabels: true
      showValues: true
      tickDensity: default
      tickDensityCustom:
      type: linear
      unpinAxis: false
      valueFormat:
      series:
      - id: query_history.average_execution_time
        name: Average Execution Time
        axisId: query_history.average_execution_time
    row: 27
    col: 0
    width: 12
    height: 8
  - title: Average Execution Time by Query Type and Warehouse Size (MTD)
    name: Average Execution Time by Query Type and Warehouse Size (MTD)
    model: snowflake_usage_block
    explore: query_history
    type: looker_column
    fields:
    - query_history.average_execution_time
    - query_history.query_type
    - query_history.warehouse_size
    pivots:
    - query_history.warehouse_size
    filters:
      query_history.start_date: 1 months
    sorts:
    - query_history.average_execution_time desc 0
    - query_history.warehouse_size
    limit: 500
    query_timezone: UTC
    stacking: normal
    show_value_labels: true
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    value_labels: legend
    label_type: labPer
    show_null_points: true
    point_style: circle
    interpolation: linear
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    series_types: {}
    y_axes:
    - label: Avg Execution Time (secs)
      maxValue:
      minValue:
      orientation: left
      showLabels: true
      showValues: true
      tickDensity: default
      tickDensityCustom:
      type: linear
      unpinAxis: false
      valueFormat:
      series:
      - id: query_history.average_execution_time
        name: Average Execution Time
        axisId: query_history.average_execution_time
    row: 27
    col: 12
    width: 12
    height: 8
  - title: Credits Used By Warehouse (MTD)
    name: Credits Used By Warehouse (MTD)
    model: snowflake_usage_block
    explore: warehouse_metering_history
    type: looker_column
    fields:
    - warehouse_metering_history.warehouse_name
    - warehouse_metering_history.total_credits_used
    filters:
      warehouse_metering_history.start_date: 1 months
    sorts:
    - warehouse_metering_history.total_credits_used desc
    limit: 500
    total: true
    query_timezone: UTC
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    show_null_points: true
    point_style: circle
    interpolation: linear
    series_types: {}
    row: 4
    col: 16
    width: 8
    height: 8
  - title: Credits Used Over Time by Warehouse (MTD)
    name: Credits Used Over Time by Warehouse (MTD)
    model: snowflake_usage_block
    explore: warehouse_metering_history
    type: looker_line
    fields:
    - warehouse_metering_history.warehouse_name
    - warehouse_metering_history.total_credits_used
    - warehouse_metering_history.start_date
    pivots:
    - warehouse_metering_history.warehouse_name
    fill_fields:
    - warehouse_metering_history.start_date
    filters:
      warehouse_metering_history.start_date: 1 months
    sorts:
    - warehouse_metering_history.total_credits_used desc 0
    - warehouse_metering_history.warehouse_name
    limit: 500
    total: true
    query_timezone: UTC
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    show_null_points: true
    point_style: circle
    interpolation: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    row: 20
    col: 12
    width: 12
    height: 7
  - title: Billable TB Over Time
    name: Billable TB Over Time
    model: snowflake_usage_block
    explore: storage_usage
    type: looker_area
    fields:
    - storage_usage.billable_tb
    - storage_usage.usage_month
    fill_fields:
    - storage_usage.usage_month
    sorts:
    - storage_usage.usage_month
    limit: 500
    query_timezone: UTC
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    show_null_points: true
    point_style: none
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    ordering: none
    show_null_labels: false
    series_types: {}
    row: 35
    col: 0
    width: 12
    height: 7
  - title: Failed Logins by User (MTD)
    name: Failed Logins by User (MTD)
    model: snowflake_usage_block
    explore: login_history
    type: table
    fields:
    - login_history.user_name
    - login_history.logins
    - login_history.total_failed_logins
    - login_history.login_failure_rate
    filters:
      login_history.event_date: 1 months
    sorts:
    - login_history.logins desc
    limit: 500
    query_timezone: UTC
    show_view_names: true
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    row: 35
    col: 12
    width: 12
    height: 7
  - title: Failed Logins by User and Connecting Client (MTD)
    name: Failed Logins by User and Connecting Client (MTD)
    model: snowflake_usage_block
    explore: login_history
    type: table
    fields:
    - login_history.user_name
    - login_history.logins
    - login_history.total_failed_logins
    - login_history.login_failure_rate
    - login_history.reported_client_type
    pivots:
    - login_history.reported_client_type
    filters:
      login_history.event_date: 1 months
    sorts:
    - login_history.logins desc 0
    - login_history.reported_client_type
    limit: 500
    total: true
    row_total: right
    query_timezone: UTC
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: true
    hide_totals: false
    hide_row_totals: false
    table_theme: gray
    limit_displayed_rows: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    series_labels:
      login_history.total_failed_logins: Failed Logins
      login_history.login_failure_rate: Failure Rate
      login_history.reported_client_type: Client Type
      login_history.user_name: User Name
    row: 42
    col: 0
    width: 24
    height: 9
  - title: Untitled
    name: Untitled
    model: snowflake_usage_block
    explore: warehouse_metering_history
    type: single_value
    fields:
    - warehouse_metering_history.current_mtd_credits_used
    - warehouse_metering_history.prior_mtd_credits_used
    limit: 500
    query_timezone: UTC
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: true
    comparison_type: progress_percentage
    comparison_reverse_colors: false
    show_comparison_label: true
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    comparison_label: Credits Used (Prior MTD)
    single_value_title: Credits Used (MTD)
    row: 0
    col: 6
    width: 6
    height: 4
  - title: Untitled2
    name: Untitled2
    model: snowflake_usage_block
    explore: query_history
    type: single_value
    fields:
    - query_history.current_mtd_avg_exec_time
    - query_history.prior_mtd_avg_exec_time
    limit: 500
    query_timezone: UTC
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: true
    show_comparison_label: true
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    comparison_label: Avg Exec Time (Prior MTD)
    single_value_title: Avg Execution Time in Secs (MTD)
    value_format: ''
    row: 0
    col: 12
    width: 6
    height: 4
  - title: Untitled3
    name: Untitled3
    model: snowflake_usage_block
    explore: storage_usage
    type: single_value
    fields:
    - storage_usage.curr_mtd_billable_tb
    - storage_usage.prior_mtd_billable_tb
    limit: 500
    query_timezone: UTC
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: true
    show_comparison_label: true
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    comparison_label: Billable TB (Prior MTD)
    single_value_title: Billable TB (MTD)
    row: 0
    col: 18
    width: 6
    height: 4
