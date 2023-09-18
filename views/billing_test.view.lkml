view: billing_test {
  derived_table: {
    sql:
      SELECT
        *,
       GENERATE_UUID() as pk
      FROM
        flight_stats.flights
      WHERE
        {% condition date_filter %} dep_time {% endcondition %} ;;
  }

  filter: date_filter {
    type: date
  }



################ TIME DIMENSION #####################
parameter: timeframe_picker {
  label: "Date Granularity"
  type: string
  allowed_value: { value: "Year" }
  allowed_value: { value: "Fiscal Qtr" }
  allowed_value: { value: "Month" }
  allowed_value: { value: "Week" }
  allowed_value: { value: "Date" }
  allowed_value: { value: "Hour" }
  default_value: "Date"
}

dimension: dynamic_timeframe {
  group_label: "Time"
  type: string
  sql:
    CASE
    WHEN {% parameter timeframe_picker %} = 'Year' THEN CAST(${dep_time_year} AS string)
    WHEN {% parameter timeframe_picker %} = 'Fiscal Qtr' THEN CONCAT('FY',SUBSTR(CAST(${dep_time_fiscal_year} as string),-2),'-',CAST(${dep_time_fiscal_quarter_of_year} AS string))
    WHEN{% parameter timeframe_picker %} = 'Month' THEN CAST(${dep_time_month} AS string)
    WHEN{% parameter timeframe_picker %} = 'Week' THEN CAST(${dep_time_week} AS string)
    WHEN{% parameter timeframe_picker %} = 'Date' THEN CAST(${dep_time_date} AS string)
    WHEN{% parameter timeframe_picker %} = 'Hour' THEN CAST(${dep_time_time} AS string)
    END ;;
}

dimension_group: dep_time {
  group_label: "Time"
 # description: "Time at which the cost associated with a SKU started"
  type: time
  timeframes: [
    raw,
    time,
    date,
    fiscal_year,
    fiscal_quarter,
    fiscal_month_num,
    fiscal_quarter_of_year,
    week,
    month,
    month_name,
    month_num,
    week_of_year,
    day_of_month,
    quarter,
    hour,
    year
  ]
  sql: ${TABLE}.dep_time ;;
}
  dimension: pk {
    type: string
    primary_key: yes
    hidden: yes
    sql: ${TABLE}.pk ;;
  }
  dimension: carrier {
    type: string
    sql: ${TABLE}.carrier ;;
  }
  dimension: destination {
    type: string
    sql: ${TABLE}.destination ;;
  }
  dimension: distance {
    type: number
    sql: ${TABLE}.distance ;;
  }
  dimension: flight_num {
    type: number
    sql: ${TABLE}.flight_num ;;
  }
  measure: count {
    type: count
  }
}

view: carriers_billing {
  sql_table_name: `flight_stats.carriers` ;;

  dimension: string_field_0 {
    type: string
    sql: ${TABLE}.string_field_0 ;;
  }
  dimension: string_field_1 {
    type: string
    sql: ${TABLE}.string_field_1 ;;
  }
  dimension: string_field_2 {
    type: string
    sql: ${TABLE}.string_field_2 ;;
  }
  measure: count {
    type: count
  }
}
