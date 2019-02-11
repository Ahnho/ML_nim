import math
import ../operations 

# vector
type 
  vector* = object
    data:seq[float64]
    len*:int

proc vec*(len:int, num_vec : seq[float64]): vector =
  system.doAssert(len == num_vec.len)
  system.doAssert(len>=2)
  result.len = len
  result.data = num_vec

proc D2vec*(num_vec : seq[float64]):vector=
  result = vec(2,num_vec)

proc D3vec*(num_vec : seq[float64]):vector=
  result = vec(3,num_vec)

proc `[]`*(V:vector, i:int):vector=
  result = V[i]

proc `[]=`*(vec:var vector,i:int,val:float64)=
  vec[i] = val

proc zeros*(len : int):vector= 
  result.data = @[]
  result.len = len 
  for i in 1 .. len:
    result.data.add(0.0)

iterator items*(A:vector):float64=
  for i in A.data:
    yield i

# vec + vec = vec

proc `+`*(a,b : vector):vector= 
  system.doAssert(a.len == b.len)
  result = zeros(a.len)
  for i in 0 .. (a.len-1):
    result.data[i] = a.data[i] + b.data[i]


proc `-`*(a,b : vector):vector=
  system.doAssert(a.len == b.len)
  result = zeros(a.len)
  for i in 0 .. (a.len-1):
    result.data[i] = a.data[i] - b.data[i]

proc `*`*(a,b:vector):vector =
  system.doAssert(a.len == b.len)
  result = zeros(a.len)
  for i in 0 .. (a.len-1):
    result.data[i] = a.data[i] * b.data[i]

proc `/`*(a,b:vector):vector=
  system.doAssert(a.len == b.len)
  result = zeros(a.len)
  for i in 0 .. (a.len-1):
    result.data[i] = a.data[i] / b.data[i]

# vec + scalar = vec

proc `+`*(a:vector, b:float64):vector=
  result = zeros(a.len)
  for i in 0 .. (a.len-1):
    result.data[i] = a.data[i] + b
    
proc `-`*(a:vector, b:float64):vector=
  result = zeros(a.len)
  for i in 0 .. (a.len-1):
    result.data[i] = a.data[i] - b

proc `*`*(a:vector, b:float64):vector=
  result = zeros(a.len)
  for i in 0 .. (a.len-1):
    result.data[i] = a.data[i] * b

proc `/`*(a:vector, b:float64):vector=
  result = zeros(a.len)
  for i in 0 .. (a.len-1):
    result.data[i] = a.data[i] / b


# lnner product
proc `.*.`*[T](a,b:vector):T=
  system.doAssert(a.len == b.len)
  for i in 0 .. (a.len-1):
    result += a[i]*b[i]

# cross
proc cross*(A,B: vector): vector = 
  system.doAssert(A.len == 3 and B.len == 3)
  result = zeros(3)
  result.data[0] = A.data[1]*B.data[2] - A.data[2]*B.data[1]
  result.data[1] = A.data[2]*B.data[0] - A.data[0]*B.data[2]
  result.data[2] = A.data[0]*B.data[1] - A.data[1]*B.data[0]


  