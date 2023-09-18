- dashboard: MIA_Accidents
  title: Accidents Miami Airport by Year
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: Rn3MUWDl7CmC6S6LBDIklj
  elements:
  - title: Accidents Miami Airport
    name: Accidents Miami Airport
    model: cm_test2314
    explore: accidents
    type: looker_line
    fields: [accidents.airport_name, accidents.count, accidents.event_year]
    filters: {}
    sorts: [accidents.event_year]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    color_application:
      collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
      palette_id: 5d189dfc-4f46-46f3-822b-bfb0b61777b1
      options:
        steps: 5
    x_axis_zoom: true
    y_axis_zoom: true
    series_colors:
      accidents.count: "#9334E6"
    hidden_fields: [accidents.airport_name]
    hidden_points_if_no: []
    defaults_version: 1
    listen:
      Airport Name: accidents.airport_name
    row: 0
    col: 0
    width: 24
    height: 12
  filters:
  - name: Airport Name
    title: Airport Name
    type: field_filter
    default_value: MIAMI INTERNATIONAL
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: cm_test2314
    explore: accidents
    listens_to_filters: []
    field: accidents.airport_name
