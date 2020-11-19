view: _squad_schema_mapping {
  derived_table: {
    sql:
      SELECT *
      FROM (
        VALUES
          ('ANALYTICS', 'ADHOC', 'DATA'),
          ('ANALYTICS', 'AD_PRODUCT_ANALYTICS', 'DATA'),
          ('ANALYTICS', 'ANALYTICS_DEV', 'DATA'),
          ('ANALYTICS', 'ANALYTICS_NEXT', 'DATA'),
          ('ANALYTICS', 'ANALYTICS_PROD', 'DATA'),
          ('ANALYTICS', 'ANALYTICS_STG', 'DATA'),
          ('ANALYTICS', 'CONTENT_DEV', 'CONTENT'),
          ('ANALYTICS', 'CONTENT_PROD', 'CONTENT'),
          ('ANALYTICS', 'CONTENT_STG', 'CONTENT'),
          ('ANALYTICS', 'CORE_DEV', 'DATA'),
          ('ANALYTICS', 'CORE_PROD', 'DATA'),
          ('ANALYTICS', 'CORE_STG', 'DATA'),
          ('ANALYTICS', 'DBT_DEMO', 'DATA'),
          ('ANALYTICS', 'DELIVERY_DEV', 'DATA'),
          ('ANALYTICS', 'DELIVERY_PROD', 'DATA'),
          ('ANALYTICS', 'DELIVERY_STG', 'DATA'),
          ('ANALYTICS', 'EVENT_DEV', 'DATA'),
          ('ANALYTICS', 'EVENT_PROD', 'DATA'),
          ('ANALYTICS', 'EVENT_STG', 'DATA'),
          ('ANALYTICS', 'EXPORT_DEV', 'DATA'),
          ('ANALYTICS', 'EXPORT_PROD', 'DATA'),
          ('ANALYTICS', 'EXPORT_STG', 'DATA'),
          ('ANALYTICS', 'INFORMATION_SCHEMA', 'SYSTEM'),
          ('ANALYTICS', 'LOOKER', 'DATA'),
          ('ANALYTICS', 'METAFLOW', 'META'),
          ('ANALYTICS', 'PRICING_DEV', 'OFFERS'),
          ('ANALYTICS', 'PRICING_PROD', 'OFFERS'),
          ('ANALYTICS', 'PRICING_STG', 'OFFERS'),
          ('ANALYTICS', 'PUBLIC', 'ALL'),
          ('ANALYTICS', 'SEARCH_DEV', 'SEARCH'),
          ('ANALYTICS', 'SEARCH_PROD', 'SEARCH'),
          ('ANALYTICS', 'SEARCH_STG', 'SEARCH'),
          ('ANALYTICS', 'SID', 'ALL'),
          ('ANALYTICS', 'SNAPSHOT_DEV', 'DATA'),
          ('ANALYTICS', 'SNAPSHOT_PROD', 'DATA'),
          ('ANALYTICS', 'SNAPSHOT_STG', 'DATA'),
          ('BOFH', 'BOFH_DEV', 'BOFH'),
          ('BOFH', 'INFORMATION_SCHEMA', 'SYSTEM'),
          ('BOFH', 'PUBLIC', 'BOFH'),
          ('BOFH', 'TEST_SCHEMA2', 'BOFH'),
          ('CONTENT', 'INFORMATION_SCHEMA', 'SYSTEM'),
          ('CONTENT', 'PUBLIC', 'CONTENT'),
          ('COVID19', 'INFORMATION_SCHEMA', 'SYSTEM'),
          ('COVID19', 'PUBLIC', 'ALL'),
          ('CUSTOMER', 'CUSTOMER_DEV', 'BOFH'),
          ('CUSTOMER', 'CUSTOMER_PROD', 'BOFH'),
          ('CUSTOMER', 'INFORMATION_SCHEMA', 'SYSTEM'),
          ('CUSTOMER', 'PUBLIC', 'BOFH'),
          ('DGS', 'INFORMATION_SCHEMA', 'SYSTEM'),
          ('DGS', 'PUBLIC', 'DATA'),
          ('DGS', 'VALIDATION', 'DATA'),
          ('EMPLOYEE', 'AGOCHEV', ''),
          ('EMPLOYEE', 'AKUMANYAEV', ''),
          ('EMPLOYEE', 'BGUITARRARI', ''),
          ('EMPLOYEE', 'CCHEN', ''),
          ('EMPLOYEE', 'DDEBOER', ''),
          ('EMPLOYEE', 'FRAPOSO', ''),
          ('EMPLOYEE', 'FVIEIRA', ''),
          ('EMPLOYEE', 'GERMANGH', ''),
          ('EMPLOYEE', 'GKHALSA', ''),
          ('EMPLOYEE', 'HION', ''),
          ('EMPLOYEE', 'IHERNAEZ', ''),
          ('EMPLOYEE', 'INFORMATION_SCHEMA', 'SYSTEM'),
          ('EMPLOYEE', 'JZANELLA', ''),
          ('EMPLOYEE', 'KFERENTINOS', ''),
          ('EMPLOYEE', 'KIEVDOKIMOV', ''),
          ('EMPLOYEE', 'LFSOUZA', ''),
          ('EMPLOYEE', 'LKATZAV', ''),
          ('EMPLOYEE', 'MAGRAWAL', ''),
          ('EMPLOYEE', 'MBUSUIOC', ''),
          ('EMPLOYEE', 'MTUTUNCU', ''),
          ('EMPLOYEE', 'NSOLER', ''),
          ('EMPLOYEE', 'OSAMI', ''),
          ('EMPLOYEE', 'PPOPOV', ''),
          ('EMPLOYEE', 'PUBLIC', ''),
          ('EMPLOYEE', 'SMITTAL', ''),
          ('EMPLOYEE', 'SRODRIGUES', ''),
          ('EMPLOYEE', 'SSAEIDI', ''),
          ('EMPLOYEE', 'SSIVOVA', ''),
          ('EMPLOYEE', 'TBAINS', ''),
          ('EMPLOYEE', 'TCHERCHY', ''),
          ('EMPLOYEE', 'VPOLUCENO', ''),
          ('SNOWFLAKE', 'ACCOUNT_USAGE', 'SYSTEM'),
          ('SNOWFLAKE', 'INFORMATION_SCHEMA', 'SYSTEM'),
          ('SNOWFLAKE', 'ORGANIZATION_USAGE', 'SYSTEM'),
          ('SNOWFLAKE', 'READER_ACCOUNT_USAGE', 'SYSTEM'),
          ('SNOWFLAKE_SAMPLE_DATA', 'INFORMATION_SCHEMA', 'SYSTEM'),
          ('SNOWFLAKE_SAMPLE_DATA', 'PUBLIC', 'SYSTEM'),
          ('SNOWFLAKE_SAMPLE_DATA', 'TPCDS_SF100TCL', 'SYSTEM'),
          ('SNOWFLAKE_SAMPLE_DATA', 'TPCDS_SF10TCL', 'SYSTEM'),
          ('SNOWFLAKE_SAMPLE_DATA', 'TPCH_SF1', 'SYSTEM'),
          ('SNOWFLAKE_SAMPLE_DATA', 'TPCH_SF10', 'SYSTEM'),
          ('SNOWFLAKE_SAMPLE_DATA', 'TPCH_SF100', 'SYSTEM'),
          ('SNOWFLAKE_SAMPLE_DATA', 'TPCH_SF1000', 'SYSTEM'),
          ('SNOWFLAKE_SAMPLE_DATA', 'TPCH_SF10000', 'SYSTEM'),
          ('SNOWFLAKE_SAMPLE_DATA', 'WEATHER', 'SYSTEM')
        AS squad_schema_mapping (
          database_name,
          schema_name,
          squad_name
        )
      )
    ;;
  }

  dimension: squad_name {
    type: string
    sql: ${TABLE}.squad_name ;;
  }

  dimension: database_name {
    type: string
    sql: ${TABLE}.database_name ;;
  }

  dimension: schema_name {
    type: string
    sql: ${TABLE}.schema_name ;;
  }

  measure: databases {
    type: count_distinct
    sql: ${database_name} ;;
  }

  measure: schemas {
    type: count_distinct
    sql: ${schema_name} ;;
  }

 }
