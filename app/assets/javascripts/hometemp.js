$(function () {
  // var data = [ { x: 0, y: 40 }, { x: 1, y: 49 }, { x: 2, y: 17 }, { x: 3, y: 42 } ];
  var data = $('#chart').data('url');
  var graph = new Rickshaw.Graph( {
          element: document.querySelector("#chart"),
          width: 580,
          height: 250,
          max: 100,
          renderer: 'line',
          series: [ {
                  name: 'Temp',
                  color: 'steelblue',
                  data: data
          } ]
  } );

  var hoverDetail = new Rickshaw.Graph.HoverDetail( {
    graph: graph,
    formatter: function(series, x, y) {
      var date = '<span class="date">' + new Date(x * 1000).toLocaleString() + '</span>';
      var swatch = '<span class="detail_swatch" style="background-color: ' + series.color + '"></span>';
      var content = swatch + series.name + ": " + parseInt(y, 10) + '<br>' + date;
      return content;
    }
  } );

  var x_axis = new Rickshaw.Graph.Axis.Time( { graph: graph } );

  var y_axis = new Rickshaw.Graph.Axis.Y( {
          graph: graph,
          orientation: 'left',
          tickFormat: Rickshaw.Fixtures.Number.formatKMBT,
          element: document.getElementById('y_axis')
  } );

  graph.render();
});