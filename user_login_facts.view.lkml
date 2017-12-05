view: user_login_facts {
  # Or, you could make this view a derived table, like this:
  derived_table: {
    sql: select user_name
      , count(*) as failed_logins
      , timediff(seconds, event_at, lead(event_at) over(partition by user_name order by event_at)) as seconds_between_login_attempts
      , event_at
      from account_usage_dev.login_history
      where not is_success
      group by user_name, event_at
          ;;
  }

  dimension: login_name {
    hidden: no
    primary_key: yes
    type: string
    sql:  ${TABLE}.user_name ;;
  }

  dimension: seconds_between_login_attempts {
    type: number
    sql: ${TABLE}.seconds_between_login_attempts ;;
  }

#   dimension: avg_seconds_between_login_attempts {
#     type: number
#     sql: ${TABLE}.seconds_between_login_attempts ;;
#   }

  dimension: failed_logins {
    type:  number
    sql: ${TABLE}.failed_logins ;;
  }

#   measure: count {
#     type: count
#     drill_fields: []
#   }

  measure: total_failed_logins {
    type: sum
    sql: ${failed_logins} ;;
  }

  measure: average_failed_logins {
    type: average
    sql: ${failed_logins} ;;
  }

  measure: avg_seconds_between_login_attempts {
    type: average
    sql: ${seconds_between_login_attempts} ;;
  }
}
