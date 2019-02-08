import ../structrue/Matrix
import ../../operations
import random,math


proc runif*(r:int, a,b:float):Matrix=
    var o:seq[float] = @[]
    for i in 0 .. r-1 :
        var p = rand(a .. b)
        o.add(p)
    let x = matrix[float](1,r,o)
    return x


proc cunif*(r:int, a,b:float32):Matrix=
    var o:seq[float32] = @[]
    for i in 0 .. r-1 :
        var p:float32 = rand(a .. b)
        o.add(p)
    let x = matrix[float32](r,1,o)
    return x

proc nrow*(x:Matrix):int=
    return x.num_row

proc ncol*(x:Matrix):int=
    return x.num_col
    

proc cbind*(a,b:Matrix):Matrix=
    assert a.num_row == b.num_row
    assert a.num_col == b.num_col
    var c :seq[float64] = @[]
    for i in 0 .. nrow(a)-1 :
        c.add(a.data[i])
        c.add(b.data[i]) 
    var k = matrix(nrow(a),2,c)
    return k  

proc cbind3*(a,b,c:Matrix):Matrix=
    var q :seq[float64] = @[]
    for i in 0 .. nrow(a)-1 :
        q.add(a.data[i])
        q.add(b.data[i]) 
        q.add(c.data[i])
    var k = matrix(nrow(a),3,q)
    return k

proc rowsum*(b:int,a:Matrix):float64=
    var w = a.data
    var q:seq[float64] = @[]
    for i in b-1 .. len(w):
        if len(w) mod nrow(a) == b-1:
            q.add(w[i])
    var s:float64 = 0
    for i in 0 .. len(q):
        s += q[i]
    return s

proc colsum*(b:int,a:Matrix):float64=
    var w = a.data 
    var q:seq[float64] = @[]
    if b == 1:
        for i in  0..nrow(a):
            q.add(w[i])
    else:
        var t = ((nrow(a)*b-1))
        for i in t .. t+nrow(a):
            q.add(w[i])
    var s:float64 = 0
    for i in 0..len(q):
        s += q[i]
    return s


proc cn*(a:Matrix,b:int):seq[float]=
  var v = a.data
  var q:seq[float] = @[v[b-1]]
  for i in 0..ncol(a)-2: 
    var o = v[(b-1)+(nrow(a)-1)]
    q.add(o)
  return q

# float64 mean
proc mean*[T](x:seq[T]):T =
  var total:T = 0
  for  i in 0 .. x.high:
    total += x[i]
  return total / (x.len)

# Matrix mean
proc mean*(x:Matrix):float64=
  var a = x.data
  var total:float64 = 0
  for  i in 0 .. a.high:
    total += a[i]
  return total / (a.len - 1)

# Matrix row means
proc rowmean*(b:int,a:Matrix):float64=
  var w = a.data
  var q:seq[float64] = @[]
  for i in b-1 .. len(w):
      if len(w) mod nrow(a) == b-1:
          q.add(w[i])
  var o = rowsum(b,a)
  return o / len(q)

# Matrix col mean
proc colmean*(b:int,a:Matrix):float64=
  var w = colsum(b,a)
  return w / ncol(a)

proc mean*(a:Matrix):Matrix=
  var w:seq[float64] = @[]
  for i in 0 .. nrow(a)-1:
    w.add(rowmean(i,a))
  var q = matrix(1,nrow(a),w)
  return q
  

# float64 variance
proc variance*[T](x:seq[T]):T = 
  var b = x.len
  var total:T = 0
  for i in 0 .. x.high:
    total += (x[i] - mean(x))^2
  return total / (b-1)

# proc cov*(a,b:Matrix):Matrix=
#   var total = 0.0
#   for i in 0 .. 


proc sd*[T](x:seq[T]):T = 
  return sqrt(variance(x))

# proc sd *(x:Matrix):float64=
#   return sqrt(variance(x))

proc `-`*(a,b:seq[float]):seq[float]=
  return a - b 

proc cov*[T](x,y:seq[T]):float =  
  if x.len == y.len: 
    var total = 0.0
    for i in 0 .. x.len-1: 
      total = total + ((x[i] - mean(x)) * (y[i] - mean(y)))
    return total / (x.len - 1)

# Matrix cov
# proc cov*(x,y:Matrix): float64=
#   var a = @[]
#   var b = @[]
#   v
  
 
# proc cor*[T](x,y:seq[T]):T= 
#   var bun:T = sqrt(variance(x) * variance(y))
#   return cov(x,y) / bun

proc minSquare*[T](x,y:seq[T]):T= 
  var xm = mean(x)
  var ym = mean(y)
  var q,p = 0
  for i in 0 .. x.high:
    q += (ym - y[i])*(x[i] - xm)
    p += (x[i] - xm)^2
  var a:T =q / p
  var b:T = ym - (a*xm)
  echo b,a 
