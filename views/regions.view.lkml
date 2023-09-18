view: regions {
  sql_table_name: `flight_stats.regions` ;;
  drill_fields: [region_id]

  dimension: region_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.region_id ;;
  }
  dimension: region_name {
    type: string
    sql: ${TABLE}.region_name ;;
  }
  dimension: region_shape {
    type: string
    sql: ${TABLE}.region_shape ;;
  }
  measure: count {
    type: count
    drill_fields: [region_id, region_name]
  }
}
