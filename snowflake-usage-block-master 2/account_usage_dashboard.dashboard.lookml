- dashboard: snowflake_usage
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
    listen: {}
    row: 8
    col: 0
    width: 12
    height: 8
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
        __FILE: snowflake_usage_block/account_usage_dashboard.dashboard.lookml
        __LINE_NUM: 213
      __FILE: snowflake_usage_block/account_usage_dashboard.dashboard.lookml
      __LINE_NUM: 201
    listen: {}
    row: 16
    col: 0
    width: 12
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
        __FILE: snowflake_usage_block/account_usage_dashboard.dashboard.lookml
        __LINE_NUM: 287
      __FILE: snowflake_usage_block/account_usage_dashboard.dashboard.lookml
      __LINE_NUM: 275
    listen: {}
    row: 31
    col: 0
    width: 12
    height: 8
  - title: Credits Used By Warehouse
    name: Credits Used By Warehouse
    model: snowflake_usage_block
    explore: warehouse_metering_history
    type: looker_column
    fields:
    - warehouse_metering_history.warehouse_name
    - warehouse_metering_history.total_credits_used
    filters:
      warehouse_metering_history.start_date: 30 days
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
    listen: {}
    row: 16
    col: 12
    width: 12
    height: 8
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
    listen: {}
    row: 39
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
    listen: {}
    row: 46
    col: 0
    width: 24
    height: 9
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
    listen: {}
    row: 4
    col: 6
    width: 6
    height: 4
  - title: Total Jobs (MTD)
    name: Total Jobs (MTD)
    model: snowflake_usage_block
    explore: query_history
    type: single_value
    fields:
    - query_history.current_mtd_query_count
    - query_history.prior_mtd_query_count
    limit: 500
    query_timezone: UTC
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
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
    value_format: ''
    listen: {}
    row: 0
    col: 0
    width: 6
    height: 4
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
    comparison_type: change
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
    listen: {}
    row: 0
    col: 6
    width: 6
    height: 4
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
    listen: {}
    row: 8
    col: 12
    width: 12
    height: 8
  - title: Data Loading
    name: Data Loading
    model: snowflake_usage_block
    explore: load_history
    type: single_value
    fields:
    - load_history.total_row_count
    - load_history.total_error_count
    filters:
      load_history.last_load_time_date: 7 days
    limit: 500
    query_timezone: America/Los_Angeles
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    point_style: none
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
    x_axis_reversed: false
    y_axis_reversed: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    show_null_points: true
    interpolation: linear
    series_types: {}
    y_axes:
    - label: Rows Loaded
      orientation: left
      series:
      - id: load_history.total_row_count
        name: Load History Total Row Count
        axisId: load_history.total_row_count
        __FILE: snowflake_usage_block/account_usage_dashboard.dashboard.lookml
        __LINE_NUM: 924
      showLabels: true
      showValues: true
      valueFormat: '[>=1000000]0.0,," M";[>=100000]0.0," K";0'
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: snowflake_usage_block/account_usage_dashboard.dashboard.lookml
      __LINE_NUM: 921
    x_axis_label: Load Date
    single_value_title: Rows Loaded Last 7 Days
    comparison_label: Row Errors on Load Last 7 Days
    listen: {}
    row: 39
    col: 0
    width: 6
    height: 7
  - title: Total Rows Loaded - Last 2 Weeks
    name: Total Rows Loaded - Last 2 Weeks
    model: snowflake_usage_block
    explore: load_history
    type: looker_column
    fields:
    - load_history.total_row_count
    - load_history.last_load_time_date
    fill_fields:
    - load_history.last_load_time_date
    filters:
      load_history.last_load_time_date: 14 days
    sorts:
    - load_history.last_load_time_date desc
    limit: 500
    query_timezone: America/Los_Angeles
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    point_style: none
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
    x_axis_reversed: false
    y_axis_reversed: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    show_null_points: true
    interpolation: linear
    series_types: {}
    y_axes:
    - label: Rows Loaded
      orientation: left
      series:
      - id: load_history.total_row_count
        name: Load History Total Row Count
        axisId: load_history.total_row_count
        __FILE: snowflake_usage_block/account_usage_dashboard.dashboard.lookml
        __LINE_NUM: 990
      showLabels: true
      showValues: true
      valueFormat: '[>=1000000]0.0,," M";[>=100000]0.0," K";0'
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: snowflake_usage_block/account_usage_dashboard.dashboard.lookml
      __LINE_NUM: 987
    x_axis_label: Load Date
    listen: {}
    row: 39
    col: 6
    width: 6
    height: 7
  - title: Average Execution Time by Query Type and Warehouse Size (MTD)
    name: Average Execution Time by Query Type and Warehouse Size (MTD)
    model: snowflake_usage_block
    explore: query_history
    type: looker_column
    fields:
    - query_history.query_type
    - query_history.average_execution_time
    - query_history.query_count
    - query_history.warehouse_size
    pivots:
    - query_history.warehouse_size
    filters:
      query_history.start_date: 1 months
      query_history.warehouse_size: "-UNKNOWN"
      query_history.query_type: SELECT,CREATE^_TABLE^_AS^_SELECT,INSERT,DROP,COPY
    sorts:
    - query_history.warehouse_size 0
    - query_history.query_count desc 5
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
        __FILE: snowflake_usage_block/account_usage_dashboard.dashboard.lookml
        __LINE_NUM: 365
      __FILE: snowflake_usage_block/account_usage_dashboard.dashboard.lookml
      __LINE_NUM: 353
    x_axis_reversed: false
    y_axis_reversed: false
    hidden_fields:
    - query_history.query_count
    listen: {}
    row: 31
    col: 12
    width: 12
    height: 8
  - title: Execution Time on Select Statements
    name: Execution Time on Select Statements
    model: snowflake_usage_block
    explore: query_history
    type: single_value
    fields:
    - query_history.current_mtd_avg_exec_time
    - query_history.prior_mtd_avg_exec_time
    filters:
      query_history.query_type: SELECT
      query_history.execution_status: SUCCESS
    limit: 500
    column_limit: 50
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
    listen: {}
    row: 4
    col: 0
    width: 6
    height: 4
  - title: Database Storage Growth
    name: Database Storage Growth
    model: snowflake_usage_block
    explore: storage_usage
    type: looker_line
    fields:
    - storage_usage.billable_tb
    - storage_usage.usage_month
    - storage_usage.database_name
    pivots:
    - storage_usage.database_name
    fill_fields:
    - storage_usage.usage_month
    filters:
      storage_usage.usage_date: 12 months ago for 12 months
    sorts:
    - storage_usage.usage_month desc
    - storage_usage.database_name
    limit: 500
    column_limit: 50
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
    show_x_axis_label: false
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
    y_axes:
    - label: Billable Tb
      orientation: left
      series:
      - id: CCDB - storage_usage.billable_tb
        name: CCDB
        axisId: storage_usage.billable_tb
      - id: DATABLOCKS - storage_usage.billable_tb
        name: DATABLOCKS
        axisId: storage_usage.billable_tb
      - id: DEMO_DB - storage_usage.billable_tb
        name: DEMO_DB
        axisId: storage_usage.billable_tb
      - id: EUROPCAR - storage_usage.billable_tb
        name: EUROPCAR
        axisId: storage_usage.billable_tb
      - id: FAA - storage_usage.billable_tb
        name: FAA
        axisId: storage_usage.billable_tb
      - id: LOOKER_TEST - storage_usage.billable_tb
        name: LOOKER_TEST
        axisId: storage_usage.billable_tb
      - id: META - storage_usage.billable_tb
        name: META
        axisId: storage_usage.billable_tb
      - id: NAME_GAME - storage_usage.billable_tb
        name: NAME_GAME
        axisId: storage_usage.billable_tb
      - id: NY_TRIP_DB - storage_usage.billable_tb
        name: NY_TRIP_DB
        axisId: storage_usage.billable_tb
      - id: SNOW_TWITTER - storage_usage.billable_tb
        name: SNOW_TWITTER
        axisId: storage_usage.billable_tb
      - id: THELOOK - storage_usage.billable_tb
        name: THELOOK
        axisId: storage_usage.billable_tb
      - id: THELOOK_OLD - storage_usage.billable_tb
        name: THELOOK_OLD
        axisId: storage_usage.billable_tb
      - id: TPCH - storage_usage.billable_tb
        name: TPCH
        axisId: storage_usage.billable_tb
      - id: UPLOAD_TEST - storage_usage.billable_tb
        name: UPLOAD_TEST
        axisId: storage_usage.billable_tb
      showLabels: true
      showValues: true
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
    x_axis_reversed: false
    y_axis_reversed: false
    listen: {}
    row: 24
    col: 12
    width: 12
    height: 7
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
    y_axes:
    - label: Billable Tb
      orientation: left
      series:
      - id: storage_usage.billable_tb
        name: Storage Usage Billable Tb
        axisId: storage_usage.billable_tb
      showLabels: true
      showValues: true
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
    x_axis_reversed: false
    y_axis_reversed: false
    listen: {}
    row: 24
    col: 0
    width: 12
    height: 7
  - title: Query Volume and Runtime
    name: Query Volume and Runtime
    model: snowflake_usage_block
    explore: query_history
    type: looker_line
    fields:
    - query_history.start_week
    - query_history.query_count
    - query_history.average_execution_time
    fill_fields:
    - query_history.start_week
    filters:
      query_history.execution_status: SUCCESS
    sorts:
    - query_history.start_week desc
    limit: 500
    column_limit: 50
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    point_style: none
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
    x_axis_reversed: false
    y_axis_reversed: false
    show_null_points: true
    interpolation: linear
    query_timezone: UTC
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: true
    show_comparison_label: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    comparison_label: Avg Exec Time (Prior MTD)
    single_value_title: Avg Execution Time in Secs (MTD)
    value_format: ''
    y_axes:
    - label: Query Run Count
      orientation: left
      series:
      - id: query_history.query_count
        name: Query History Query Count
        axisId: query_history.query_count
      showLabels: true
      showValues: true
      valueFormat: '[>=1000000]0.00,,"M";[>=1000]0.00,"K";0.00'''
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
    - label: Average Query Execution TIme (seconds)
      orientation: left
      series:
      - id: query_history.average_execution_time
        name: Query History Average Execution Time
        axisId: query_history.average_execution_time
      showLabels: true
      showValues: true
      valueFormat: '0'
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
    listen: {}
    row: 0
    col: 12
    width: 12
    height: 8
