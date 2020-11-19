view: _sqaud_warehouse_mapping {
  derived_table: {
    sql:
      SELECT *
      FROM (
        VALUES
          ('CLOUD_SERVICES_ONLY', 'SYSTEM'),
          ('DEFAULT_WH', 'ALL'),
          ('ANALYTICS_WH', 'DATA'),
          ('LOOKER_WH', 'ALL'),
          ('REDASH_WH', 'ALL'),
          ('METAFLOW_WH', 'META'),
          ('BOFH_L_24USD_PER_HOUR', 'BOFH'),
          ('BOFH_M_12USD_PER_HOUR', 'BOFH'),
          ('BOFH_S_6USD_PER_HOUR', 'BOFH'),
          ('BOFH_XL_48USD_PER_HOUR', 'BOFH'),
          ('BOFH_XS_3USD_PER_HOUR', 'BOFH'),
          ('BOFH_XXL_96USD_PER_HOUR', 'BOFH'),
          ('CONTENT_L_24USD_PER_HOUR', 'CONTENT'),
          ('CONTENT_M_12USD_PER_HOUR', 'CONTENT'),
          ('CONTENT_S_6USD_PER_HOUR', 'CONTENT'),
          ('CONTENT_XL_48USD_PER_HOUR', 'CONTENT'),
          ('CONTENT_XS_3USD_PER_HOUR', 'CONTENT'),
          ('CONTENT_XXL_96USD_PER_HOUR', 'CONTENT'),
          ('DATA_INFRA_L_24USD_PER_HOUR', 'DATA'),
          ('DATA_INFRA_M_12USD_PER_HOUR', 'DATA'),
          ('DATA_INFRA_S_6USD_PER_HOUR', 'DATA'),
          ('DATA_INFRA_XL_48USD_PER_HOUR', 'DATA'),
          ('DATA_INFRA_XS_3USD_PER_HOUR', 'DATA'),
          ('DATA_INFRA_XXL_96USD_PER_HOUR', 'DATA'),
          ('META_L_24USD_PER_HOUR', 'META'),
          ('META_M_12USD_PER_HOUR', 'META'),
          ('META_S_6USD_PER_HOUR', 'META'),
          ('META_XL_48USD_PER_HOUR', 'META'),
          ('META_XS_3USD_PER_HOUR', 'META'),
          ('META_XXL_96USD_PER_HOUR', 'META'),
          ('OFFERS_L_24USD_PER_HOUR', 'OFFERS'),
          ('OFFERS_M_12USD_PER_HOUR', 'OFFERS'),
          ('OFFERS_S_6USD_PER_HOUR', 'OFFERS'),
          ('OFFERS_XL_48USD_PER_HOUR', 'OFFERS'),
          ('OFFERS_XS_3USD_PER_HOUR', 'OFFERS'),
          ('OFFERS_XXL_96USD_PER_HOUR', 'OFFERS'),
          ('PERF_MKT_L_24USD_PER_HOUR', 'PERF_MKT'),
          ('PERF_MKT_M_12USD_PER_HOUR', 'PERF_MKT'),
          ('PERF_MKT_S_6USD_PER_HOUR', 'PERF_MKT'),
          ('PERF_MKT_XL_48USD_PER_HOUR', 'PERF_MKT'),
          ('PERF_MKT_XS_3USD_PER_HOUR', 'PERF_MKT'),
          ('PERF_MKT_XXL_96USD_PER_HOUR', 'PERF_MKT'),
          ('SEARCH_L_24USD_PER_HOUR', 'PERF_MKT'),
          ('SEARCH_M_12USD_PER_HOUR', 'PERF_MKT'),
          ('SEARCH_S_6USD_PER_HOUR', 'PERF_MKT'),
          ('SEARCH_XL_48USD_PER_HOUR', 'PERF_MKT'),
          ('SEARCH_XS_3USD_PER_HOUR', 'PERF_MKT'),
          ('SEARCH_XXL_96USD_PER_HOUR', 'PERF_MKT'),
          ('SUPPORT_L_24USD_PER_HOUR', 'PERF_MKT'),
          ('SUPPORT_M_12USD_PER_HOUR', 'PERF_MKT'),
          ('SUPPORT_S_6USD_PER_HOUR', 'PERF_MKT'),
          ('SUPPORT_XL_48USD_PER_HOUR', 'PERF_MKT'),
          ('SUPPORT_XS_3USD_PER_HOUR', 'PERF_MKT'),
          ('SUPPORT_XXL_96USD_PER_HOUR', 'PERF_MKT')
        AS squad_warehouse_mapping (
          warehouse_name,
          squad_name
        )
      )
    ;;
  }

  dimension: squad_name {
    type: string
    sql: ${TABLE}.squad_name ;;
  }

  dimension: warehouse_name {
    type: string
    sql: ${TABLE}.warehouse_name ;;
  }

  measure: warehouses {
    type: count_distinct
    sql: ${warehouse_name} ;;
  }


}
