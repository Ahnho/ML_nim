import math
import Matrix
import ../operations  
 
# =========================================================
# polynomial Structrue 
# =========================================================
type 
    Polynomial* = object
        data*:seq[float64]

proc poly*(a:seq[float64]):Polynomial=
    result.data = a

proc eval*(a:Polynomial,b:float64):float64=
    var val:float64 = 0 
    for i in 0..len(a.data)-1:
        let s:float64 = a.data[i]
        let j:int = len(a.data)-1-i
        let c = a.data[i] * (b^j)
        val += c
    return val

proc Seval*(a:Polynomial,b:seq[float64]):seq[float64]=
    var list:seq[float64] = @[]
    for i in 0..b.len-1:
        var val:float64 = 0 
        let bi:float64 = b[i]
        for k in 0..len(a.data)-1:
            let s:float64 = a.data[k]
            let j:int = len(a.data)-1-k
            let c = a.data[k] * (bi^j)
            val += c
        list.add(val)
    return list

proc substr*(a:string,f:int,l:int):string=
  result = ""
  for i in f..l:
    result = result & a[i]

proc `$`*(a:Polynomial):string=
    ## print polynomial

    ## Examples
    ## ```
    ## var a:seq[float] = @[1.0,2.0,3.0]
    ## echo poly(a)  // output -> x^2 + 2.0x + 3.0
    ## ```
    var it:seq[int] = @[]
    var st:seq[string] = @[]
    for i in 0..len(a.data)-1:
      var alen:string = $a.data[i] 
      if len(alen) >= 5 :
        alen = substr(alen,0,4) 
      st.add(alen)
    result = "y = "
    for i in 0..len(a.data)-2:
        let c:int = len(a.data) - 1 - i
        if a.data[i] == 0:
            continue
        if c == 1:
            if a.data[i] == 1.0:
                result = result & " + " & "x" 
            elif i == 0:
                result = result & st[i] & "x" 
            elif a.data[i] > 0:
                result = result & " + " & st[i] & "x" 
            else:
                if len(st[i]) >= 5 :
                    var na = substr(st[i],1,4) 
                    result = result & " - " & na & "x" 
                else:
                    var na = -a.data[i]
                    result = result & " - " & $na & "x"
        elif i == 0:
            if a.data[i] == 1.0:
                result = result & " x^" & $c
            elif a.data[i] > 0:
                result = result & st[i] & "x^" & $c
            else:
                if len(st[i]) >= 5 :
                    var na = substr(st[i],1,4) 
                    result = result & " - " & na & "x^" & $c
                else:
                    var na = -a.data[i]
                    result = result & " - " & $na & "x^" & $c
        elif a.data[i] < 0 :
            if a.data[i] == -1:
                result = result & " - " & "x^" & $c
            else:     
                if len(st[i]) >= 5 :
                    var na = substr(st[i],1,4)
                    result = result & " - " & na & "x^" & $c
                else:
                    var na = -a.data[i]
                    result = result & " - " & $na & "x^" & $c
        elif a.data[i] > 0 :
            if a.data[i] == 1.0:
                result = result & " + " & "x^" & $c
            else:
                result = result & " + " & $st[i] & "x^" & $c
    if a.data[len(a.data)-1] == 0:
        result = result
    elif a.data[len(a.data)-1] >= 0:
        result = result & " + " & $st[len(a.data)-1]  
    else:
        var na = substr(st[len(a.data)-1],1,4)

# operations
proc `+`*(a,b:Polynomial):Polynomial=
    var r:seq[float64] = @[]
    let c = max(len(a.data),len(b.data))
    for q in 0..c-1:
        r.add(0)
    for i in 0..len(a.data)-1:
        r[i] += a.data[i]
    for k in 0..len(b.data)-1:
        r[k] += b.data[k]
    result.data = r

proc `+`*(a:Polynomial,b:float64):Polynomial=
    result.data = a.data
    result.data[len(a.data)-1] = result.data[len(a.data)-1] + b

proc `-`*(a,b:Polynomial):Polynomial=
    var r:seq[float64] = @[]
    let c = max(len(a.data),len(b.data))
    for q in 0..c-1:
        r.add(0)
    for i in 0..len(a.data)-1:
        r[i] -= a.data[i]
    for k in 0..len(b.data)-1:
        r[k] -= b.data[k]
    result.data = r

proc `-`*(a:Polynomial,b:float64):Polynomial=
    result.data = a.data
    result.data[len(a.data)-1] = result.data[len(a.data)-1] - b

proc `*`*(a:Polynomial,b:float64):Polynomial=
    result.data = a.data
    for i in 0..len(a.data)-1:
        result.data[i] = result.data[i] * b

proc `*`*(a:float64,b:Polynomial):Polynomial=
    result.data = b.data
    for i in 0..len(b.data)-1:
        result.data[i] = result.data[i] * a

proc `*`*(a,b:Polynomial):Polynomial=
    if b.data.len == 1:
        result.data = a.data
        for i in 0..a.data.len-1:
            result.data[i] = a.data[i] * b.data[0]
        return result 
    elif a.data.len == 1:
        result.data = b.data
        for i in 0..b.data.len-1:
            result.data[i] = b.data[i] * a.data[0]
        return result     
    else:
        let alen:int = len(a.data)-1
        let blen:int = len(a.data)-1
        var li:seq[float64] = @[]
        for i in 0..((alen) + (blen)):
            li.add(0.0)
        for i in 0 .. alen: 
            let value = a.data[i]
            let exp1 = alen - i
            for k in 0..blen:
                let exp2 = blen - k
                let result_val = value * b.data[k]
                let result_exp = exp1 + exp2
                let result_pos = len(li) - result_exp - 1
                li[result_pos] += result_val
        result.data = li 
 
proc `/`*(a:Polynomial,b:float64):Polynomial=
    result.data = a.data
    for i in 0..len(a.data)-1:
        result.data[i] = a.data[i] / b 
        
            
## Differentiation
proc diff*(a:Polynomial):Polynomial=
    let alen:int = len(a.data)-1
    var li:seq[float64] = @[]
    for i in 0..alen-1:
        li.add(a.data[i] * float64(alen - i))
    result.data = li 

# Integration  
proc Integ*(a:Polynomial):Polynomial=
    let alen:int = len(a.data) - 1
    var li:seq[float64] = @[]
    for i in 0..alen:
        if i == alen: 
            li.add(a.data[i])
        else:
            li.add(a.data[i] / (float64(alen - i)+1.0))
    li.add(0.0)
    result.data = li

## Interpolation
proc Itpt*(x,y:seq[float64]):Polynomial=
    let leng = len(x)
    var Pn:Polynomial = poly(@[1.0])
    var Lj:seq[Polynomial] = @[]
    for j in 0..leng-1:
        var mo:float64 = 1
        var ja:Polynomial = poly(@[1.0])
        for k in 0..leng-1:
            var jj:seq[float64] = @[1.0]
            if j == k :
                continue
            mo *= (x[j] - x[k])
            jj.add(-x[k])
            ja = ja * poly(jj)
        Lj.add(ja/mo)
        Pn = Pn * (y[j] * Lj[j])
    return Pn


## Linear Regression
proc mean*(x:seq[float64]):float64 =
    var total:float64 = 0
    for  i in 0 .. len(x)-1:
      total += x[i]
    return total / float64(len(x))

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

