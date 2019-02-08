proc `+`*(a:float64,b:int):float64=
    result = a+float64(b)

proc `+`*(a:int,b:float64):float64=
    result = float64(a)+b

proc `-`*(a:float64,b:int):float64=
    result = a-float64(b)

proc `-`*(a:int,b:float64):float64=
    result = float64(a)-b

proc `*`*(a:float64,b:int):float64=
    result = a*float64(b)

proc `*`*(a:int,b:float64):float64=
    result = float64(a)*b


proc `/`*(a:float64,b:int):float64=
    result = a/float64(b)

proc `/`*(a:int,b:float64):float64=
    result = float64(a)/b

proc`^`*(x:float64,y:int):float64=
    result = 1
    for i in 0..y-1:
        result = result * x
