import ../src/structrue/AD

# Test
proc main()=
    var t = dual(1,2)
    var y = dual(2,0)
    var x = dual(3,1)
    echo sin(t)
    echo cos(t)
    echo tan(t)
    echo exp(t)
    echo log(10,t)
    echo ln(t)
    echo sin(t) + cos(t)
    echo sin(t) - cos(t)
    echo sin(t) * cos(t)
    echo sin(t) / cos(t)
    echo sin(t)^4

if isMainModule:
    main()
