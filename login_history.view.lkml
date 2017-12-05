view: login_history {
  sql_table_name: ACCOUNT_USAGE_DEV.LOGIN_HISTORY ;;

  dimension: client_ip {
    type: string
    sql: ${TABLE}.CLIENT_IP ;;
  }

  dimension: error_code {
    type: number
    sql: ${TABLE}.ERROR_CODE ;;
  }

  dimension_group: event {
    type: time
    timeframes: [
      raw,
      time,
      date,
      day_of_month,
      day_of_week,
      day_of_year,
      week_of_year,
      week,
      month,
      quarter,
      year,
      second
    ]
    sql: ${TABLE}.EVENT_AT ;;
  }

  dimension: event_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.EVENT_ID ;;
  }

  dimension: event_type {
    type: number
    sql: ${TABLE}.EVENT_TYPE ;;
  }

  dimension: first_authentication_factor {
    type: number
    sql: ${TABLE}.FIRST_AUTHENTICATION_FACTOR ;;
  }

  dimension: is_success {
    type: yesno
    sql: ${TABLE}.IS_SUCCESS ;;
  }

  dimension: related_event_id {
    type: number
    sql: ${TABLE}.RELATED_EVENT_ID ;;
  }

  dimension: reported_client_type {
    type: string
    sql: ${TABLE}.REPORTED_CLIENT_TYPE ;;
  }

  dimension: reported_client_version {
    type: string
    sql: ${TABLE}.REPORTED_CLIENT_VERSION ;;
  }

  dimension: second_authentication_factor {
    type: number
    sql: ${TABLE}.SECOND_AUTHENTICATION_FACTOR ;;
  }

  dimension: user_name {
    type: string
    sql: ${TABLE}.USER_NAME ;;
  }

#   dimension: seconds_between_login_attempts {
#     type: number
#     sql: timediff(seconds, ${event_raw}, lead(${event_raw}) over(partition by ${user_name} order by ${event_raw})) ;;
#
#   }

  measure: logins {
    type: count
    drill_fields: [user_name]
  }

  measure: total_failed_logins {
    type: count
    filters: {field: is_success value: "no"}
  }

  measure: login_failure_rate {
    type: number
    sql: ${total_failed_logins} / ${logins} ;;
    value_format_name: percent_2
  }

#   measure: average_seconds_between_login_attempts {
#     type: average
#     sql:  ${seconds_between_login_attempts} ;;
#   }

}
