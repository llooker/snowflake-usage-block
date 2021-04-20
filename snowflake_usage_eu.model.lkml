include: "snowflake_usage_explores.explore"
include: "account_usage_eu.dashboard"

label: "Snowflake Usage (EU)"

connection: "snowflake_conversocial_eu"


# redefine separate datagroup
datagroup: snowflake_usage_eu_default_datagroup {
  max_cache_age: "1 hour"
}
persist_with: snowflake_usage_eu_default_datagroup
