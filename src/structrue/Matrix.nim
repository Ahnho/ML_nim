import complex,math,vector 
import ../operations 
# ==============================   
# Matrix Structrue   
# ============================== 
type Matrix* = object 
    ## Sangho's Matrix 
    num_row*: int 
    num_col*: int 
    data*: seq[float64]


proc index(x:Matrix, r,c:int):int =
  return r*x.num_col + c 

proc nrow*(x: Matrix):int= 
  return x.num_row 

proc ncol*(x : Matrix):int = 
  return x.num_col 

proc row*(a:int,m:Matrix):seq[float64]=
  var re:seq[float64] = @[]
  for i in a*m.num_col..((a+1)*m.num_col)-1:
    re.add(m.data[i])
  return re

proc col*(m:Matrix,a:int):seq[float64]=
  var re:seq[float64] = @[]
  re.add(m.data[a])
  for i in a+1..len(m.data)-1: 
    if (i mod (a + m.num_col) == 0):
      re.add(m.data[i])
  return re

proc matrix*[T](row,col: int, d: seq[T]): Matrix = 
  result.num_row = row
  result.num_col = col
  newseq(result.data, row*col)
  system.doAssert(d.len > 0)
  system.doAssert(d.len <= (row*col))
  for i in countup(0,row*col-1):
    result.data[i] = d[i]

proc matrix*(row,col:int): Matrix=
  result.num_row = row 
  result.num_col = col 
  newSeq(result.data,row*col)
  for i in countup(0,row*col-1):
    result.data[i] = (0.0)  
    

proc zeros*(r,c: int): Matrix =
  matrix(r, c)

proc setSize*(x: var Matrix, r, c: int) =
  x.num_row = r
  x.num_col = c
  newSeq(x.data, r*c)

proc `[]`*(x: Matrix, r: int, c: int): float64=
  result = x.data[x.index(r,c)]


proc `[]=`*(x: var Matrix, r:int ,c: int, a: float64) =
  x.data[x.index(r,c)] = a


proc str*(a:string,b:int):string=
  let x = a
  result = a
  for i in 1..b:
    result = result & a

proc substr*(a:string,f:int,l:int):string=
  result = ""
  for i in f..l:
    result = result & a[i]
     
proc `$`*(x: Matrix): string =
  ## print Matrix\
  ##
  ## Examples\
  ## ```\ 
  ## var a:Matrix = matrix(2,2,@[1.0,2.0,3.0,4.0]) // ex), matrix(row,col,data)
  ## echo a  // output ->     col_0  col_1   
  ##         //          row_0 | 1.0  | 2.0  |
  ##         //          row_1 | 3.0  | 4.0  |
  ## ```
  var it:seq[int] = @[]
  var st:seq[string] = @[]
  let xdata:seq[float64] = x.data
  for i in 0..len(xdata)-1:
    var xlen:string = $xdata[i]
    if len(xlen) >= 5 :
      xlen = substr(xlen,0,4)
    st.add(xlen)
    it.add(len(st[i]))
  let m:int = max(it) 
  let space:string = str(" ",m-2)
  result = "\n"
  result = result & "     "
  for i in 0..x.num_col-1:
    result = result & "col_" & $i & space
  result = result & "\n"
  for r in 0..x.num_row-1:
    result = result & "row_" & $r & " | "
    for c in 0..x.num_col-1:
      var xlen:string = $x[r,c]
      if len(xlen) >= 5 :
        xlen = substr(xlen,0,4)
      result = result & xlen
      let n:int = len(xlen)
      let spa:string = str(" ",m - n) 
      if c != (x.num_col-1):
        result = result & spa & " | "
    result = result & "  |\n"


## operator    

# matrix multiply
proc `.*.`*(a: Matrix, b: Matrix): Matrix =
  result.setSize(a.num_row, b.num_col)
  for i in 0..a.num_row-1:
    for j in 0..b.num_col-1:
      result[i,j] = 0.0
      for k in 0..a.num_col-1:
        result.data[ result.index(i,j) ] =
          result.data[ result.index(i,j) ] +
            a.data[ a.index(i,k) ]*b.data[ b.index(k,j) ]
  
# matrix index multiply
proc `*`*(a: Matrix, b: Matrix): Matrix =
  system.doAssert( a.num_row==b.num_row )
  system.doAssert( a.num_col==b.num_col )
  result.setSize(a.num_row, a.num_col)
  for r in 0..a.num_row-1:
    for c in 0..a.num_col-1:
      result.data[ result.index(r,c) ] =
         a.data[ a.index(r,c) ]*b.data[ b.index(r,c) ]
# matrix * float64
proc `*`*(a: Matrix, b: float64): Matrix =
  result.setSize(a.num_row,a.num_col)
  for i in low(result.data)..high(result.data):
    result.data[i] = a.data[i] * b

# float64 * matrix
proc `*`*(a: float64, b: Matrix): Matrix =
  result.setSize(b.num_row,b.num_col)
  for i in low(result.data)..high(result.data):
    result.data[i] = a * b.data[i]

# index - index
proc `-`*(a: Matrix, b: Matrix): Matrix =
  system.doAssert( a.num_row==b.num_row )
  system.doAssert( a.num_col==b.num_col )
  result.setSize(a.num_row,a.num_col)
  for i in low(result.data)..high(result.data):
    result.data[i] = a.data[i] - b.data[i]

# matrix - float64
proc `-`*(a: Matrix, b: float64): Matrix =
  result.setSize(a.num_row,a.num_col)
  for i in low(result.data)..high(result.data):
    result.data[i] = a.data[i] - b

# float64 - matrix 
proc `-`*(a: float64, b: Matrix): Matrix =
  result.setSize(b.num_row, b.num_col)
  for i in low(result.data)..high(result.data):
    result.data[i] = a-b.data[i]

# Negative matrix
proc`-`*(a:Matrix):Matrix=
  result.setSize(a.num_row, a.num_col)
  for i in 0..len(a.data)-1:
    result.data[i] = -result.data[i]

# index + index
proc `+`*(a: Matrix, b: Matrix): Matrix =
  assert( a.num_row==b.num_row )
  assert( a.num_col==b.num_col )
  result.setSize(a.num_row,a.num_col)
  for i in low(result.data)..high(result.data):
    result.data[i] = a.data[i] + b.data[i]

# matrix + float64
proc `+`*(a: Matrix, b: float64): Matrix =
  result.setSize(a.num_row, a.num_col)
  for i in low(result.data)..high(result.data):
    result.data[i] = a.data[i] + b

# float64 + matrix 
proc `+`*(a: float64, b: Matrix): Matrix =
  result.setSize(b.num_row, b.num_col)
  for i in low(result.data)..high(result.data):
    result.data[i] = a + b.data[i]

# matrix / float64
proc `/`*(a: Matrix, b: float64): Matrix =
  result.setSize(a.num_row, a.num_col)
  for i in low(result.data)..high(result.data):
    result.data[i] = a.data[i] / b


## transpose 
proc transpose*(x: Matrix): Matrix =
  result = matrix(x.num_col, x.num_row)
  for r in 0..x.num_row-1:
    for c in 0..x.num_col-1:
      result.data[ result.index(c,r) ] = x.data[ x.index(r,c)]
 

proc facsum*(a:int):int=
  var w:int = 0
  for i in 1..a:
    w += i
  return w

## Complete pivoting 
proc pivoting*(a: Matrix):Matrix=
  var a:Matrix = a 
  assert a.num_col == a.num_row 
  var process:string = "" 
  var row_process:seq[seq[int]] = @[]
  var col_process:seq[seq[int]] = @[]
  var count:int = 0
  for i in 0..a.num_col-1 :
    var list:seq[float64] =  @[]
    for j in i..a.num_col-1 :
      for k in i..a.num_col-1 :
        list.add(a[j,k])
    let b = max(list)
    for o in i..a.num_col-1 :
      for p in i..a.num_col-1 :
        if(a[o,p] == b):
          if(i != o):
            process = process & "row(" & $i & " <--> " & $o & ") "
            let bb:seq[int] = @[i,o]
            row_process.add(bb)
            count += 1
          process = process & "\n"
          if(i != p):
            process = process & "col(" & $i & " <--> " & $p & ") "
            let qq:seq[int] = @[i,p]
            col_process.add(qq)
            count += 1
          for x in 0..a.num_col-1:
            let c:float64 = a[i,x]
            a[i,x] = a[o,x]
            a[o,x] = c
          for y in 0..a.num_col-1:
            let t = a[y,i]
            a[y,i] = a[y,p] 
            a[y,p] = t
  process = process & "count:" & $count
  echo process 
  return a 


type
  QPLU* = object
    #type QPLU \
    # Q : row process \
    # P : col process \
    # L : Low Matrix \
    # U : Upper Matrix \
    # LU : LU Decomposition of a Matrix 
    Q*: seq[seq[int]]
    P*: seq[seq[int]]
    count*: int
    LU*: seq[Matrix]
    L*:Matrix
    U*:Matrix

#### complate pivoting ->  ####
### ->  Doolittle Decomposition of a Matrix ###
proc LU*(a: Matrix):QPLU=
  var a:Matrix = a
  assert a.num_col == a.num_row 
  var row_process:seq[seq[int]] = @[]
  var col_process:seq[seq[int]] = @[]
  var count:int = 0
  for i in 0..a.num_col-1 :
    var list:seq[float64] =  @[]
    for j in i..a.num_col-1 :
      for k in i..a.num_col-1 :
        list.add(a[j,k])
    let b = max(list)
    for o in i..a.num_col-1 :
      for p in i..a.num_col-1 :
        if(a[o,p] == b):
          if(i != o):
            let bb:seq[int] = @[i,o]
            row_process.add(bb)
            count += 1
          if(i != p):
            let qq:seq[int] = @[i,p]
            col_process.add(qq)
            count += 1
          for x in 0..a.num_col-1:
            let c:float64 = a[i,x]
            a[i,x] = a[o,x]
            a[o,x] = c
          for y in 0..a.num_col-1:
            var t = a[y,i]
            a[y,i] = a[y,p] 
            a[y,p] = t
  let l:int = a.num_col 
  var ret:seq[Matrix] = @[]
  var Lower:Matrix = matrix(l,l)
  var Upper:Matrix = matrix(l,l)
  for i in 0..l-1:
    # Upper triangular 
    for k in i..l-1:
      var sum = 0.0
      for j in 0..l-1:
        sum += (Lower[i,j] * Upper[j,k])      
      Upper[i,k] = a[i,k] - sum 
    ## Lower triangular ##
    for k in i..l-1:
      if i == k:
        Lower[i,i] = 1.0 
      else:
        var sum = 0.0
        for j in 0..l-1:
          sum += ( Lower[k,j] * Upper[k,i] ) 
        Lower[k,i] = (a[k,i] - sum ) / Upper[i,i]
  ret.add(Lower)
  ret.add(Upper)
  result.P = row_process 
  result.Q = col_process
  result.count = count 
  result.LU = ret
  result.L = Lower
  result.U = Upper


## determinant 
proc det*(a: Matrix):float64=
  var a:Matrix = a
  let w:QPLU = LU(a)
  let UM:Matrix = w.LU[1]        
  var da:float64 = 0
  for i in 0..a.num_col-1:
    if UM[i,i] == 0:
      return 0 
    da += UM[i,i]
  return da 


## inverse 
## block 
proc bK*(a: Matrix):seq[Matrix]=
  let r:int = a.num_row
  let c:int = a.num_col
  let l:int = min(r div 2, c div 2)
  let r_l:int = r-l
  let c_l:int = c-l

  var m:seq[Matrix] = @[]
  var m1:Matrix = matrix(l,l)
  var m2:Matrix = matrix(l,c_l)
  var m3:Matrix = matrix(r_l,l)
  var m4:Matrix = matrix(r_l,c_l) 

  for ir in 0..r-1:
    for ic in 0..c-1:
      if ir < l and ic < l:
        m1[ir,ic] = a[ir,ic] 
      elif ir < l and ic >= l:
        m2[ir,ic-l] = a[ir,ic]
      elif ir >= l and ic < l:
        m3[ir-l,ic] = a[ir,ic]
      elif ir >= l and ic >= l:
        m4[ir-l,ic-l] = a[ir,ic]
  m.add(m1)
  m.add(m2)
  m.add(m3)
  m.add(m4)
  return m

## block matrix sum
proc bksum*(a:seq[Matrix]):Matrix=
  let bm1:Matrix = a[0]
  let bm2:Matrix = a[1]
  let bm3:Matrix = a[2]
  let bm4:Matrix = a[3]
  let r:int = bm1.num_row + bm4.num_row
  let c:int = bm1.num_col + bm4.num_col
  var n:seq[float64] = @[]
  for i in 0..bm1.num_row-1:
    for k in 0..bm1.num_col-1:
      n.add(bm1[i,k])
    for j in 0..bm2.num_col-1:
      n.add(bm2[i,j])
  for i in 0..bm3.num_row-1:
    for k in 0..bm3.num_col-1:
      n.add(bm3[i,k])
    for j in 0..bm4.num_col-1:
      n.add(bm4[i,j])
  let m:Matrix = matrix(r,c,n)
  return m

## n*n Low inverse
proc inv_l*(a:Matrix):Matrix=
  var a:Matrix = a
  var bkm:seq[Matrix] = bk(a)
  bkm[2] = bkm[2] - (2*bkm[2])
  let ivL:Matrix = bksum(bkm)
  return ivL

## n*n Upper inverse
proc inv_u*(a: Matrix):Matrix=
  var a:Matrix = a
  if a.num_row == 1:  
    a[0,0] = 1.0 / a[0,0]
    return a 
  elif a.num_row == 2: 
    let p = a[0,0] 
    let q = a[0,1] 
    let r = a[1,1] 
    let s = p * r 

    a[0,0] = 1.0 / p
    a[0,1] = -q / s
    a[1,1] = 1.0 / r 
    return a
  else: 
    let bkm = bk(a)
    var bm1:Matrix = bkm[0]
    var bm2:Matrix = bkm[1]
    var bm3:Matrix = bkm[2]
    var bm4:Matrix = bkm[3]
    
    let m1:Matrix = inv_u(bm1)
    let m3:Matrix = bm3 
    let m4:Matrix = inv_u(bm4)
    let m2:Matrix = -((m1 .*. bm2) .*. m4)

    let li:seq[Matrix] = @[m1,m2,m3,m4]
    
    return bksum(li) 


## n*n inverse Matrix
proc inverse*(a: Matrix):Matrix=
  var a:Matrix = a
  var LUD:QPLU = LU(a)
  let IL:Matrix = inv_l(LUD.LU[0])
  let IU:Matrix = inv_u(LUD.LU[1])
  let cou:int = LUD.count
  let IQ:seq[seq[int]] = LUD.Q # row perms
  let IP:seq[seq[int]] = LUD.P # col perms
  var ILU:Matrix = IU .*. IL
  # Q -> col perms
  # P -> row perms
  # Q-inv
  for i in 0..len(IQ)-1:
    let II:seq[int] = IQ[i]  
    var dta:seq[float64] = @[]  
    for k in 0..ILU.num_col-1:  
      dta.add(ILU[k,II[1]]) 
    for j in 0..ILU.num_col-1:  
      ILU[j,II[1]] = ILU[j,II[0]]  
      ILU[j,II[0]] = dta[j]
  # P-inv
  for i in 0..len(IP)-1:
    let II:seq[int] = IP[i]
    var dta:seq[float64] = @[]
    for k in 0..ILU.num_col-1:
      dta.add(ILU[II[1],k])
    for j in 0..ILU.num_col-1:
      ILU[II[1],j] = ILU[II[0],j]
      ILU[II[0],j] = dta[j]  
  if cou mod 2 == 0:
    return ILU  
  else :
    return -ILU


 
