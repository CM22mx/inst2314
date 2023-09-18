connection: "kevmccarthy_bq"

# include all the views
include: "/views/**/*.view.lkml"

datagroup: cm_test2314_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: cm_test2314_default_datagroup

explore: billing_test {}

explore: flights {}

explore: flights_2 {}

explore: airports {}

explore: carriers {}

explore: accidents {}

explore: aircraft {}

explore: aircraft_models {}

explore: cal454 {}

explore: flights_unclustered {}

explore: ontime {}

explore: flights_dk {}

explore: regions {}

explore: flights_by_day {}

explore: flights_clustered {}
