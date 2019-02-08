import ../src/structrue/vector

# Test
proc main()=
    let A : Vector = vec(3,@[1.0,2.0,3.0])
    let B : seq[float] = @[1.0,2.0,3.0]
    let C : Vector = vec(3,@[1.0,2.0,3.0])

    # echo B * A
    # echo A + C 
    echo A - C
    echo A * C
    echo A / C


if isMainModule:
    main()
