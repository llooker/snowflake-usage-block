- dashboard: snowflake_usage
  title: Snowflake Usage
  layout: newspaper
  elements:
  - title: Data Loading
    name: Data Loading
    model: snowflake_usage_block
    explore: load_history
    type: single_value
    fields: [load_history.total_row_count, load_history.total_error_count]
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
    y_axes: [{label: Rows Loaded, orientation: left, series: [{id: load_history.total_row_count,
            name: Load History Total Row Count, axisId: load_history.total_row_count,
            __FILE: snowflake_usage_block/account_usage_dashboard.dashboard.lookml,
            __LINE_NUM: 603}], showLabels: true, showValues: true, valueFormat: '[>=1000000]0.0,,"
          M";[>=100000]0.0," K";0', unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear, __FILE: snowflake_usage_block/account_usage_dashboard.dashboard.lookml,
        __LINE_NUM: 600}]
    x_axis_label: Load Date
    single_value_title: Rows Loaded Last 7 Days
    comparison_label: Row Errors on Load Last 7 Days
    listen: {}
    row: 39
    col: 1
    width: 5
    height: 7
  - title: Total Rows Loaded - Last 2 Weeks
    name: Total Rows Loaded - Last 2 Weeks
    model: snowflake_usage_block
    explore: load_history
    type: looker_column
    fields: [load_history.total_row_count, load_history.last_load_time_date]
    fill_fields: [load_history.last_load_time_date]
    filters:
      load_history.last_load_time_date: 14 days
    sorts: [load_history.last_load_time_date desc]
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
    y_axes: [{label: Rows Loaded, orientation: left, series: [{id: load_history.total_row_count,
            name: Load History Total Row Count, axisId: load_history.total_row_count,
            __FILE: snowflake_usage_block/account_usage_dashboard.dashboard.lookml,
            __LINE_NUM: 673}], showLabels: true, showValues: true, valueFormat: '[>=1000000]0.0,,"
          M";[>=100000]0.0," K";0', unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear, __FILE: snowflake_usage_block/account_usage_dashboard.dashboard.lookml,
        __LINE_NUM: 670}]
    x_axis_label: Load Date
    listen: {}
    row: 39
    col: 6
    width: 6
    height: 7
  - title: Query Volume and Runtime
    name: Query Volume and Runtime
    model: snowflake_usage_block
    explore: query_history
    type: looker_area
    fields: [query_history.start_week, query_history.query_count, query_history.average_execution_time]
    fill_fields: [query_history.start_week]
    filters:
      query_history.execution_status: SUCCESS
    sorts: [query_history.start_week desc]
    limit: 500
    column_limit: 50
    query_timezone: UTC
    color_application:
      collection_id: 6c27c30e-5523-4080-82ae-272146e699d0
      palette_id: 87654122-8144-4720-8259-82ac9908d5f4
      options:
        steps: 5
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    y_axes: [{label: Query Run Count, orientation: left, series: [{id: query_history.query_count,
            name: Query History Query Count, axisId: query_history.query_count, __FILE: snowflake_usage_block/account_usage_dashboard.dashboard.lookml,
            __LINE_NUM: 1058}], showLabels: true, showValues: true, valueFormat: '[>=1000000]0.00,,"M";[>=1000]0.00,"K";0.00''',
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear,
        __FILE: snowflake_usage_block/account_usage_dashboard.dashboard.lookml, __LINE_NUM: 1055},
      {label: Average Query Execution TIme (seconds), orientation: left, series: [
          {id: query_history.average_execution_time, name: Query History Average Execution
              Time, axisId: query_history.average_execution_time, __FILE: snowflake_usage_block/account_usage_dashboard.dashboard.lookml,
            __LINE_NUM: 1071}], showLabels: true, showValues: true, valueFormat: '0',
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear,
        __FILE: snowflake_usage_block/account_usage_dashboard.dashboard.lookml, __LINE_NUM: 1068}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    series_types: {}
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: true
    show_comparison_label: true
    ordering: none
    show_null_labels: false
    comparison_label: Avg Exec Time (Prior MTD)
    single_value_title: Avg Execution Time in Secs (MTD)
    value_format: ''
    listen: {}
    row: 0
    col: 11
    width: 12
    height: 8
  - title: Total Jobs (MTD)
    name: Total Jobs (MTD)
    model: snowflake_usage_block
    explore: query_history
    type: single_value
    fields: [query_history.current_mtd_query_count, query_history.prior_mtd_query_count]
    limit: 500
    dynamic_fields: [{table_calculation: versus_prior_month, label: versus prior month,
        expression: "${query_history.current_mtd_query_count}/${query_history.prior_mtd_query_count}-1",
        value_format: !!null '', value_format_name: percent_2, _kind_hint: measure,
        _type_hint: number}]
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
    hidden_fields: [query_history.prior_mtd_query_count]
    listen: {}
    row: 0
    col: 1
    width: 5
    height: 4
  - title: Untitled
    name: Untitled
    model: snowflake_usage_block
    explore: warehouse_metering_history
    type: single_value
    fields: [warehouse_metering_history.current_mtd_credits_used, warehouse_metering_history.prior_mtd_credits_used]
    limit: 500
    dynamic_fields: [{table_calculation: versus_prior_month, label: versus prior month,
        expression: "${warehouse_metering_history.current_mtd_credits_used}/${warehouse_metering_history.prior_mtd_credits_used}-1",
        value_format: !!null '', value_format_name: percent_2, _kind_hint: measure,
        _type_hint: number}]
    query_timezone: UTC
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    single_value_title: Credits Used (MTD)
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: true
    show_comparison_label: true
    comparison_label: Credits Used (Prior MTD)
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
    hidden_fields: [warehouse_metering_history.prior_mtd_credits_used]
    listen: {}
    row: 0
    col: 6
    width: 5
    height: 4
  - title: Execution Time on Select Statements
    name: Execution Time on Select Statements
    model: snowflake_usage_block
    explore: query_history
    type: single_value
    fields: [query_history.current_mtd_avg_exec_time, query_history.prior_mtd_avg_exec_time]
    filters:
      query_history.query_type: SELECT
      query_history.execution_status: SUCCESS
    limit: 500
    column_limit: 50
    dynamic_fields: [{table_calculation: versus_prior_month, label: versus prior month,
        expression: "${query_history.current_mtd_avg_exec_time}-${query_history.prior_mtd_avg_exec_time}",
        value_format: !!null '', value_format_name: decimal_2, _kind_hint: measure,
        _type_hint: number}]
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
    hidden_fields: [query_history.prior_mtd_avg_exec_time]
    listen: {}
    row: 4
    col: 1
    width: 5
    height: 4
  - title: Untitled3
    name: Untitled3
    model: snowflake_usage_block
    explore: storage_usage
    type: single_value
    fields: [storage_usage.curr_mtd_billable_tb, storage_usage.prior_mtd_billable_tb]
    limit: 500
    dynamic_fields: [{table_calculation: versus_prior_month, label: versus prior month,
        expression: "${storage_usage.curr_mtd_billable_tb}/${storage_usage.prior_mtd_billable_tb}-1",
        value_format: !!null '', value_format_name: percent_2, _kind_hint: measure,
        _type_hint: number}]
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
    hidden_fields: [storage_usage.prior_mtd_billable_tb]
    listen: {}
    row: 4
    col: 6
    width: 5
    height: 4
  - title: Warehouse Metering History - Total Credits by Month
    name: Warehouse Metering History - Total Credits by Month
    model: snowflake_usage_block
    explore: warehouse_metering_history
    type: looker_column
    fields: [warehouse_metering_history.start_month, warehouse_metering_history.total_credits_used,
      warehouse_metering_history.warehouse_name]
    pivots: [warehouse_metering_history.warehouse_name]
    fill_fields: [warehouse_metering_history.start_month]
    filters:
      warehouse_metering_history.start_date: 12 months ago for 12 months
    sorts: [warehouse_metering_history.warehouse_name 0, warehouse_metering_history.start_month]
    limit: 500
    query_timezone: UTC
    color_application:
      collection_id: 5b121cce-cf79-457c-a52a-9162dc174766
      palette_id: 55dee055-18cf-4472-9669-469322a6f264
      options:
        steps: 5
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    series_colors: {}
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    reference_lines: []
    ordering: desc
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    listen: {}
    row: 8
    col: 1
    width: 11
    height: 8
  - title: Credits Used Over Time by Warehouse (MTD)
    name: Credits Used Over Time by Warehouse (MTD)
    model: snowflake_usage_block
    explore: warehouse_metering_history
    type: looker_column
    fields: [warehouse_metering_history.warehouse_name, warehouse_metering_history.total_credits_used,
      warehouse_metering_history.start_date]
    pivots: [warehouse_metering_history.warehouse_name]
    filters:
      warehouse_metering_history.start_date: 1 months
    sorts: [warehouse_metering_history.warehouse_name 0, warehouse_metering_history.start_date]
    limit: 500
    total: true
    query_timezone: UTC
    color_application:
      collection_id: 5b121cce-cf79-457c-a52a-9162dc174766
      palette_id: 55dee055-18cf-4472-9669-469322a6f264
      options:
        steps: 5
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: pivot
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    series_types: {}
    point_style: circle
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    show_null_points: true
    interpolation: linear
    listen: {}
    row: 8
    col: 12
    width: 11
    height: 8
  - title: Credits Used By Warehouse
    name: Credits Used By Warehouse
    model: snowflake_usage_block
    explore: warehouse_metering_history
    type: looker_column
    fields: [warehouse_metering_history.warehouse_name, warehouse_metering_history.total_credits_used]
    pivots: [warehouse_metering_history.warehouse_name]
    filters:
      warehouse_metering_history.start_date: 30 days
    sorts: [warehouse_metering_history.warehouse_name]
    limit: 500
    total: true
    query_timezone: UTC
    color_application:
      collection_id: 5b121cce-cf79-457c-a52a-9162dc174766
      palette_id: 55dee055-18cf-4472-9669-469322a6f264
      options:
        steps: 5
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    series_types: {}
    point_style: circle
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    show_null_points: true
    interpolation: linear
    listen: {}
    row: 16
    col: 12
    width: 11
    height: 8
  - title: Total Jobs by Warehouse (MTD)
    name: Total Jobs by Warehouse (MTD)
    model: snowflake_usage_block
    explore: query_history
    type: looker_column
    fields: [query_history.warehouse_name, query_history.prior_mtd_query_count, query_history.current_mtd_query_count]
    filters:
      query_history.current_mtd_query_count: ''
    sorts: [query_history.warehouse_name desc]
    limit: 500
    dynamic_fields: [{table_calculation: show, label: show, expression: "${query_history.prior_mtd_query_count}>0\
          \ OR ${query_history.current_mtd_query_count}>0", value_format: !!null '',
        value_format_name: !!null '', _kind_hint: measure, _type_hint: yesno}]
    query_timezone: UTC
    color_application:
      collection_id: ed5756e2-1ba8-4233-97d2-d565e309c03b
      palette_id: ff31218a-4f9d-493c-ade2-22266f5934b8
      options:
        steps: 5
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    y_axes: [{label: Job Count, maxValue: !!null '', minValue: !!null '', orientation: left,
        showLabels: true, showValues: true, tickDensity: default, tickDensityCustom: 5,
        type: linear, unpinAxis: false, valueFormat: !!null '', series: [{id: query_history.count,
            name: Query History, axisId: query_history.count, __FILE: snowflake_usage_block/account_usage_dashboard.dashboard.lookml,
            __LINE_NUM: 114}], __FILE: snowflake_usage_block/account_usage_dashboard.dashboard.lookml,
        __LINE_NUM: 102}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    series_types: {}
    point_style: circle
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_dropoff: true
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    value_labels: legend
    label_type: labPer
    show_null_points: true
    interpolation: linear
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    hidden_points_if_no: [show]
    listen: {}
    row: 16
    col: 1
    width: 11
    height: 8
  - title: Billable TB by Month
    name: Billable TB by Month
    model: snowflake_usage_block
    explore: storage_usage
    type: looker_line
    fields: [storage_usage.billable_tb, storage_usage.usage_month, storage_usage.average_storage_tb]
    fill_fields: [storage_usage.usage_month]
    filters:
      storage_usage.usage_date: 12 months ago for 12 months
    sorts: [storage_usage.usage_month]
    limit: 500
    query_timezone: UTC
    color_application:
      collection_id: 1297ec12-86a5-4ae0-9dfc-82de70b3806a
      palette_id: 93f8aeb4-3f4a-4cd7-8fee-88c3417516a1
      options:
        steps: 5
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    y_axes: [{label: Billable Tb, orientation: left, series: [{id: storage_usage.billable_tb,
            name: Storage Usage Billable Tb, axisId: storage_usage.billable_tb, __FILE: snowflake_usage_block/account_usage_dashboard.dashboard.lookml,
            __LINE_NUM: 982}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear, __FILE: snowflake_usage_block/account_usage_dashboard.dashboard.lookml,
        __LINE_NUM: 979}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    series_types:
      storage_usage.average_storage_tb: column
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    listen: {}
    row: 24
    col: 1
    width: 11
    height: 7
  - title: Average Execution Time by Query Type and Warehouse Size (MTD)
    name: Average Execution Time by Query Type and Warehouse Size (MTD)
    model: snowflake_usage_block
    explore: query_history
    type: looker_column
    fields: [query_history.query_type, query_history.average_execution_time, query_history.query_count,
      query_history.warehouse_size]
    pivots: [query_history.warehouse_size]
    filters:
      query_history.start_date: 1 months
      query_history.warehouse_size: "-UNKNOWN"
      query_history.query_type: SELECT,"CREATE_TABLE_AS_SELECT",INSERT,DROP,COPY
    sorts: [query_history.warehouse_size 0, query_history.query_count desc 5]
    limit: 500
    query_timezone: UTC
    color_application:
      collection_id: 1297ec12-86a5-4ae0-9dfc-82de70b3806a
      palette_id: 93f8aeb4-3f4a-4cd7-8fee-88c3417516a1
      options:
        steps: 5
        reverse: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    y_axes: [{label: Avg Execution Time (secs), maxValue: !!null '', minValue: !!null '',
        orientation: left, showLabels: true, showValues: true, tickDensity: default,
        tickDensityCustom: !!null '', type: linear, unpinAxis: false, valueFormat: !!null '',
        series: [{id: query_history.average_execution_time, name: Average Execution
              Time, axisId: query_history.average_execution_time, __FILE: snowflake_usage_block/account_usage_dashboard.dashboard.lookml,
            __LINE_NUM: 762}], __FILE: snowflake_usage_block/account_usage_dashboard.dashboard.lookml,
        __LINE_NUM: 750}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    series_types: {}
    point_style: circle
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    value_labels: legend
    label_type: labPer
    show_null_points: true
    interpolation: linear
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    hidden_fields: [query_history.query_count]
    listen: {}
    row: 31
    col: 12
    width: 11
    height: 8
  - title: Average Execution Time by User (MTD)
    name: Average Execution Time by User (MTD)
    model: snowflake_usage_block
    explore: query_history
    type: looker_bar
    fields: [query_history.user_name, query_history.average_execution_time, query_history.median_queued_overload_time]
    filters:
      query_history.start_date: 1 months
    sorts: [query_history.average_execution_time desc]
    limit: 500
    query_timezone: UTC
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    y_axes: [{label: Avg Execution Time (secs), maxValue: !!null '', minValue: !!null '',
        orientation: left, showLabels: true, showValues: true, tickDensity: default,
        tickDensityCustom: !!null '', type: linear, unpinAxis: false, valueFormat: !!null '',
        series: [{id: query_history.average_execution_time, name: Average Execution
              Time, axisId: query_history.average_execution_time, __FILE: snowflake_usage_block/account_usage_dashboard.dashboard.lookml,
            __LINE_NUM: 188}], __FILE: snowflake_usage_block/account_usage_dashboard.dashboard.lookml,
        __LINE_NUM: 176}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    series_types: {}
    point_style: circle
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    value_labels: legend
    label_type: labPer
    show_null_points: true
    interpolation: linear
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    listen: {}
    row: 31
    col: 1
    width: 11
    height: 8
  - title: Database Storage Growth
    name: Database Storage Growth
    model: snowflake_usage_block
    explore: storage_usage
    type: looker_line
    fields: [storage_usage.billable_tb, storage_usage.usage_month, storage_usage.database_name]
    pivots: [storage_usage.database_name]
    fill_fields: [storage_usage.usage_month]
    filters:
      storage_usage.usage_date: 12 months ago for 12 months
    sorts: [storage_usage.usage_month desc, storage_usage.database_name]
    limit: 500
    column_limit: 50
    query_timezone: UTC
    color_application:
      collection_id: 7c79334a-9912-4ca1-be6a-35756782ae09
      palette_id: de0bdb92-9455-489c-afa7-f0e0fdc76078
      options:
        steps: 5
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    y_axes: [{label: Billable Tb, orientation: left, series: [{id: CCDB - storage_usage.billable_tb,
            name: CCDB, axisId: storage_usage.billable_tb, __FILE: snowflake_usage_block/account_usage_dashboard.dashboard.lookml,
            __LINE_NUM: 881}, {id: DATABLOCKS - storage_usage.billable_tb, name: DATABLOCKS,
            axisId: storage_usage.billable_tb, __FILE: snowflake_usage_block/account_usage_dashboard.dashboard.lookml,
            __LINE_NUM: 884}, {id: DEMO_DB - storage_usage.billable_tb, name: DEMO_DB,
            axisId: storage_usage.billable_tb, __FILE: snowflake_usage_block/account_usage_dashboard.dashboard.lookml,
            __LINE_NUM: 887}, {id: EUROPCAR - storage_usage.billable_tb, name: EUROPCAR,
            axisId: storage_usage.billable_tb, __FILE: snowflake_usage_block/account_usage_dashboard.dashboard.lookml,
            __LINE_NUM: 890}, {id: FAA - storage_usage.billable_tb, name: FAA, axisId: storage_usage.billable_tb,
            __FILE: snowflake_usage_block/account_usage_dashboard.dashboard.lookml,
            __LINE_NUM: 893}, {id: LOOKER_TEST - storage_usage.billable_tb, name: LOOKER_TEST,
            axisId: storage_usage.billable_tb, __FILE: snowflake_usage_block/account_usage_dashboard.dashboard.lookml,
            __LINE_NUM: 896}, {id: META - storage_usage.billable_tb, name: META, axisId: storage_usage.billable_tb,
            __FILE: snowflake_usage_block/account_usage_dashboard.dashboard.lookml,
            __LINE_NUM: 899}, {id: NAME_GAME - storage_usage.billable_tb, name: NAME_GAME,
            axisId: storage_usage.billable_tb, __FILE: snowflake_usage_block/account_usage_dashboard.dashboard.lookml,
            __LINE_NUM: 902}, {id: NY_TRIP_DB - storage_usage.billable_tb, name: NY_TRIP_DB,
            axisId: storage_usage.billable_tb, __FILE: snowflake_usage_block/account_usage_dashboard.dashboard.lookml,
            __LINE_NUM: 905}, {id: SNOW_TWITTER - storage_usage.billable_tb, name: SNOW_TWITTER,
            axisId: storage_usage.billable_tb, __FILE: snowflake_usage_block/account_usage_dashboard.dashboard.lookml,
            __LINE_NUM: 908}, {id: THELOOK - storage_usage.billable_tb, name: THELOOK,
            axisId: storage_usage.billable_tb, __FILE: snowflake_usage_block/account_usage_dashboard.dashboard.lookml,
            __LINE_NUM: 911}, {id: THELOOK_OLD - storage_usage.billable_tb, name: THELOOK_OLD,
            axisId: storage_usage.billable_tb, __FILE: snowflake_usage_block/account_usage_dashboard.dashboard.lookml,
            __LINE_NUM: 914}, {id: TPCH - storage_usage.billable_tb, name: TPCH, axisId: storage_usage.billable_tb,
            __FILE: snowflake_usage_block/account_usage_dashboard.dashboard.lookml,
            __LINE_NUM: 917}, {id: UPLOAD_TEST - storage_usage.billable_tb, name: UPLOAD_TEST,
            axisId: storage_usage.billable_tb, __FILE: snowflake_usage_block/account_usage_dashboard.dashboard.lookml,
            __LINE_NUM: 920}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear, __FILE: snowflake_usage_block/account_usage_dashboard.dashboard.lookml,
        __LINE_NUM: 878}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    series_types: {}
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: monotone
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    listen: {}
    row: 24
    col: 12
    width: 11
    height: 7
  - title: Failed Logins by User and Connecting Client (MTD)
    name: Failed Logins by User and Connecting Client (MTD)
    model: snowflake_usage_block
    explore: login_history
    type: table
    fields: [login_history.user_name, login_history.logins, login_history.total_failed_logins,
      login_history.login_failure_rate, login_history.reported_client_type]
    pivots: [login_history.reported_client_type]
    filters:
      login_history.event_date: 1 months
    sorts: [login_history.logins desc 0, login_history.reported_client_type]
    limit: 500
    total: true
    row_total: right
    query_timezone: UTC
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: true
    hide_totals: false
    hide_row_totals: false
    series_labels:
      login_history.total_failed_logins: Failed Logins
      login_history.login_failure_rate: Failure Rate
      login_history.reported_client_type: Client Type
      login_history.user_name: User Name
    table_theme: gray
    limit_displayed_rows: false
    enable_conditional_formatting: true
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#62bad4",
        font_color: !!null '', color_application: {collection_id: legacy, palette_id: legacy_sequential1,
          options: {steps: 5, constraints: {mid: {type: number, value: 0.001}, min: {
                type: number, value: 0}, max: {type: number, value: 1}}, mirror: false,
            reverse: true}}, bold: false, italic: false, strikethrough: false, fields: [
          login_history.login_failure_rate]}]
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
    row: 46
    col: 1
    width: 22
    height: 9
  - title: Failed Logins by User (MTD)
    name: Failed Logins by User (MTD)
    model: snowflake_usage_block
    explore: login_history
    type: table
    fields: [login_history.user_name, login_history.logins, login_history.total_failed_logins,
      login_history.login_failure_rate]
    filters:
      login_history.event_date: 1 months
    sorts: [login_history.logins desc]
    limit: 500
    query_timezone: UTC
    show_view_names: false
    show_row_numbers: false
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: gray
    limit_displayed_rows: false
    enable_conditional_formatting: true
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#62bad4",
        font_color: !!null '', color_application: {collection_id: legacy, palette_id: legacy_sequential1,
          options: {steps: 5, constraints: {mid: {type: number, value: 0.001}, min: {
                type: number, value: 0}, max: {type: number, value: 1}}, mirror: false,
            reverse: true}}, bold: false, italic: false, strikethrough: false, fields: [
          login_history.login_failure_rate]}]
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
    width: 11
    height: 7
