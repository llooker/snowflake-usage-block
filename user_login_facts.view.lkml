view: user_login_facts {
  # Or, you could make this view a derived table, like this:
  derived_table: {
    sql: select user_name
      , count(*) as failed_logins
      , timediff(seconds, event_timestamp, lead(event_timestamp) over(partition by user_name order by event_timestamp)) as seconds_between_login_attempts
      , event_at
      from account_usage.login_history
      where not (CASE WHEN is_success = 'YES' THEN TRUE ELSE FALSE END)
      group by user_name, event_timestamp;;
      #persist_for: "1 hour"
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
