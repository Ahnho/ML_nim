import plotly
import chroma 
import ../../src/structrue/poly


let a:seq[float64] = @[1.0,3.0,5.0]
let b:seq[float64] = @[4.8, 11.3, 17.2]
let x:seq[float64] = @[-1.0,0.0,1.0]
let y:seq[float64] = @[1.0,0.0,1.0]
let p:Polynomial = MLiner(a,b)



 
var colors = @[Color(r:0.9, g:0.4, b:0.0, a: 1.0),
               Color(r:0.9, g:0.4, b:0.2, a: 1.0),
               Color(r:0.2, g:0.9, b:0.2, a: 1.0),]
var d = Trace[float64](mode: PlotMode.LinesMarkers, `type`: PlotType.Scatter)
var size = @[16.float64]
d.marker =Marker[float64](size:size, color: colors)
let xs = @[1.0, 3.0, 5.0]
d.xs = xs 
d.ys = p.Seval(x)


var layout = Layout(title: "HW1", width: 1200, height: 400,
                    xaxis: Axis(title:"x"),
                    yaxis:Axis(title: "y"), autosize:false)
var r = Plot[float64](layout:layout, traces: @[d])
r.show()