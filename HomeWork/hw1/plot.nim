import plotly
import chroma

var colors = @[Color(r:0.9, g:0.4, b:0.0, a: 1.0),
               Color(r:0.9, g:0.4, b:0.2, a: 1.0),
               Color(r:0.2, g:0.9, b:0.2, a: 1.0),
               Color(r:0.1, g:0.7, b:0.1, a: 1.0),
               Color(r:0.0, g:0.5, b:0.1, a: 1.0)]
var d = Trace[float64](mode: PlotMode.LinesMarkers, `type`: PlotType.Scatter)
var size = @[16.float64]
d.marker =Marker[float64](size:size, color: colors)
let xs = @[0.2, 0.4, 0.6, 0.8, 1.0]
d.xs = xs
d.ys = xs


var layout = Layout(title: "HW1", width: 1200, height: 400,
                    xaxis: Axis(title:"x"),
                    yaxis:Axis(title: "y"), autosize:false)
var p = Plot[float64](layout:layout, traces: @[d])
p.show()