import ../../src/structrue/poly
import ../../src/structrue/Matrix
import ../../operations 
 
## Interpolation
proc Itpt*(x,y:seq[float64]):Polynomial=
    let leng = len(x) 
    var Pn:Polynomial = poly(@[1.0]) 
    var Lj:seq[Polynomial] = @[]
    for j in 0..leng-1:
        var mo:float64 = 1.0
        var ja:Polynomial = poly(@[1.0])
        for k in 0..leng-1:
            var jj:seq[float64] = @[1.0]
            if j == k :
                continue
            mo *= (x[j] - x[k])
            jj.add(-x[k])
            ja = ja * poly(jj)
            echo ja
        Lj.add(ja / mo)
    for j in 0..leng-1:
        Pn = Pn * (y[j] * Lj[j])
    return Pn


## Linear Regression
proc Liner*(x,t:seq[float64]):Polynomial=
    let n:int = len(x)
    var xt_list:seq[float64] = @[] 
    for i in 0..n-1: 
        xt_list.add(x[i]*t[i])
    var x2_list:seq[float64] = @[]
    for i in 0..n-1:
        x2_list.add(x[i]^2)
    let xm:float64 = mean(x)
    let tm:float64 = mean(t)
    let xtm:float64 = mean(xt_list)
    let x2m:float64 = mean(x2_list)
    let w1:float64 = (xtm - xm*tm) / (x2m - xm^2)
    let w0:float64 = tm - w1*xm 
    let list:seq[float64] = @[w1,w0] 
    result.data = list 

proc mean*(x:seq[float64]):float64 =
    var total:float64 = 0 
    for  i in 0 .. len(x)-1: 
      total += x[i]
    return total / float64(len(x)) 


## Vectorized linear regression 
proc MLiner*(a,b:seq[float64]):Polynomial= 
    let t:Matrix = matrix(len(a),1,b)  
    var alist:seq[float64] = @[] 
    for i in 0..len(a)-1: 
        alist.add(1) 
        alist.add(a[i]) 
    let x:Matrix = matrix(len(a),2,alist)
    let w:Matrix = inverse(x.transpose .*. x) .*. transpose(x) .*. t  
    var list:seq[float64] = @[]
    for i in countdown(len(w.data)-1,0):
        list.add(w.data[i])
    return poly(list) 
  

## Test
proc main() =
    var a:seq[float64] = @[0.0,1.0,5.0]
    var b:seq[float64] = @[4.8, 11.3, 17.2]
    # var x:seq[float64] = @[-1.0,0.0,1.0,2.0]
    # var y:seq[float64] = @[3.0,-4.0,5.0,-6.0]
    # echo Liner(a,b)
    echo MLiner(a,b)
    # echo Seval(MLiner(a,b),x)
    # echo Itpt(x,y)

if isMainModule:
  main()
 