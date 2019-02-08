import ../src/structrue/Matrix

## Test
proc main() =
  var y =  matrix(2,3,@[1.0,1.0,1.0,1.0,3.0,5.0])
  var x = matrix(3,2,@[1.0,1.0,1.0,3.0,1.0,5.0])
  # echo y  
  # echo pivoting(y)
  var au:QPLU = LU(y .*. x)
  var l:Matrix = au.LU[0]
  var u:Matrix = au.LU[1]
  # var b:seq[Matrix] = bk(u)
  echo inv_l(l) .*. inv_u(u)
  echo y .*. x
  echo inverse(y .*. x)
  # echo bksum(b)
  # echo inv_l(u)
  # echo inv_u(u)
  # echo inverse(x)
  
  # echo row(0,y) 
  # echo col(y,0) 
  
  # echo x 
  # echo transpose(x) 
  # echo row(x) 
  # echo col(x) 
  # echo x[1,1] 
  # echo x[0,2]  

if isMainModule:
  main()



 