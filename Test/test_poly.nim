import ../src/structrue/poly  

## Test
proc main() =
    var a:seq[float64] = @[1.0,3.0,5.0]
    var b:seq[float64] = @[4.8, 11.3, 17.2]
    var c:seq[float64] = @[1.0,4.0,8.0,8.0,3.0]
    # echo Liner(a,b)
    echo MLiner(a,b) 
    # var ac:Polynomial =  poly(a)
    # var bc:Polynomial = poly(b)
    # var cc:Polynomial = poly(c)
    # echo ac * bc
    # let dd = ac * bc
    # echo dd.data
    # echo cc
    # echo diff(c) 
    # echo Integ(c)
if isMainModule: 
  main()


