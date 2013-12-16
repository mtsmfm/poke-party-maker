window.writeRadar = (target, table) ->
  table_elem = $(table)

  labels = table_elem.find('td:nth-child(1)').map -> $(this).text()
  data   = table_elem.find('td:nth-child(2)').map -> $(this).text()

  chart_data =
    labels: labels
    datasets: [
      fillColor : "rgba(151,187,205,0.5)",
      strokeColor : "rgba(151,187,205,1)",
      pointColor : "rgba(151,187,205,1)",
      pointStrokeColor : "#fff",

      data: data
    ]

  ctx = $(target).get(0).getContext('2d')
  options =
    scaleOverride: true
    scaleStartValue: -1
    scaleStepWidth: 1
    scaleSteps: 2
    scaleShowLabels: true

  new Chart(ctx).Radar(chart_data, options)
