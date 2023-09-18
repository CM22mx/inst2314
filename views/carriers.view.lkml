view: carriers {
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
