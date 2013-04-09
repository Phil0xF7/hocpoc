$(function () {
  // var data = [ { x: 0, y: 40 }, { x: 1, y: 49 }, { x: 2, y: 17 }, { x: 3, y: 42 } ];
  var graph = new Rickshaw.Graph( {
          element: document.querySelector("#chart"),
          width: 580,
          height: 250,
          series: [ {
                  color: 'steelblue',
                  data: data
          } ]
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