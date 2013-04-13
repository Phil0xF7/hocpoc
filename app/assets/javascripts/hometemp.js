$(function () {
  var graph = new Rickshaw.Graph.Ajax( {
          element: document.querySelector("#chart"),
          dataURL: '/hometemps/data',
          width: 580,
          height: 250,
          max: 100,
          renderer: 'line',
          series: [ {
                  name: "Temp",
                  color: 'blue'
                  }, {
                  name: "Humidity",
                  color: 'lightblue'
          } ],
          onComplete: function(transport) {
            var graph = transport.graph;
            var x_axis = new Rickshaw.Graph.Axis.Time( { graph: graph } );
            x_axis.graph.update();

            var y_axis = new Rickshaw.Graph.Axis.Y( {
                    graph: graph,
                    orientation: 'left',
                    tickFormat: Rickshaw.Fixtures.Number.formatKMBT,
                    element: document.getElementById('y_axis')
            } );
            y_axis.graph.update();
            var hoverDetail = new Rickshaw.Graph.HoverDetail( {
              graph: graph,
              formatter: function(series, x, y) {
                var date = '<span class="date">' + new Date(x * 1000).toLocaleString() + '</span>';
                var swatch = '<span class="detail_swatch" style="background-color: ' + series.color + '"></span>';
                var content = swatch + series.name + ": " + parseInt(y, 10) + '<br>' + date;
                return content;
              }
            } );
          }
  } );
});