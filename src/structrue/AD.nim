import math

 
type 
    Dual = object
        x* : float64
        dx* : float64

 
proc dual*(real_num,dual_num:float64):Dual=
    result.x = real_num
    result.dx = dual_num

 
proc sigmoid*(a:Dual):Dual = 
    let real_num = a.x
    let dual_num = a.dx
    result.x = 1/(1+exp(-real_num))
    result.dx = ((1/(1+exp(-real_num))) * (1 - 1/(1+exp(-real_num)))) * dual_num



proc sin*(a:Dual):Dual=
    let real_num = a.x
    let dual_num = a.dx
    result.x = sin(real_num)
    result.dx = cos(real_num) * dual_num


proc cos*(a:Dual):Dual=
    let real_num = a.x
    let dual_num = a.dx
    result.x = cos(real_num)
    result.dx = -sin(real_num) * dual_num

    
proc tan*(a:Dual):Dual=
    let real_num = a.x
    let dual_num = a.dx
    result.x = tan(real_num)
    result.dx = (1/(cos(real_num))^2) * dual_num


proc ex*(a:Dual):Dual=
    let real_num = a.x
    let dual_num = a.dx
    result.x = real_num
    result.dx = dual_num * dual_num


proc exp*(a:Dual):Dual=
    let real_num = a.x
    let dual_num = a.dx
    result.x = exp(real_num)
    result.dx = exp(real_num) * dual_num

## nim math have log_10 a , but none log_a b ## 
proc log*[T](a,b:T):float64=
    return ln(b) / ln(a)     
#---------------------------------------------#

proc log*(b:float64,a:Dual):Dual=
    assert b > 0 and b != 1
    let real_num = a.x
    let dual_num = a.dx
    result.x = log(b,real_num)
    result.dx = (1 / (real_num * ln(b))) * dual_num


proc ln*(a:Dual):Dual=
    let real_num = a.x
    let dual_num = a.dx
    result.x = ln(real_num)
    result.dx = (1/real_num) * dual_num


proc `+`*(a,b:Dual):float64=
    let a_real_num = a.x
    let a_dual_num = a.dx
    let b_real_num = b.x
    let b_dual_num = b.dx
    let x = a_real_num + b_real_num
    let dx = a_dual_num + b_dual_num
    return x + dx


proc `-`*(a,b:Dual):float64=
    let a_real_num = a.x
    let a_dual_num = a.dx
    let b_real_num = b.x
    let b_dual_num = b.dx
    let xy = a_real_num - b_real_num
    let dxy = a_dual_num - b_dual_num
    return xy - dxy


proc `*`*(a,b:Dual):float64=
    let a_real_num = a.x
    let a_dual_num = a.dx
    let b_real_num = b.x
    let b_dual_num = b.dx
    let xy = a_real_num * b_real_num
    let dxy = ((a_dual_num * b_real_num) + (a_real_num * b_dual_num))
    return xy + dxy


proc `/`*(a,b:Dual):float64=
    let a_real_num = a.x
    let a_dual_num = a.dx
    let b_real_num = b.x
    let b_dual_num = b.dx
    let xy = a_real_num / b_real_num
    let dxy = (((a_dual_num * b_real_num) - (a_real_num * b_dual_num)) / (b_real_num)^2)
    return xy + dxy

proc `^`(a,b:float64):float64=
    return a ^ b


proc `^`*(f:Dual,g:Dual):Dual=
    let real_numf = f.x
    let dual_numf = f.dx
    let real_numg = g.x
    let dual_numg = g.dx
    result.x = real_numf^real_numg
    if dual_numg == 0 :
        result.dx = real_numg  * (real_numf ^ (real_numg-1)) * real_numf
    elif dual_numg != 0:
        if real_numf == 0:
            result.dx = (real_numf^real_numg) * ln(real_numf) * dual_numg
        elif real_numf != 0 :
            result.dx = ((real_numf^real_numg) * (dual_numg * ln(real_numf))) + ((dual_numf * real_numg) / real_numf)


proc `*.`*(a,b:Dual):Dual=
    let a_real_num = a.x
    let a_dual_num = a.dx
    let b_real_num = b.x
    let b_dual_num = b.dx
    result.x = a_real_num * b_real_num
    result.dx = ((a_dual_num * b_real_num) + (a_real_num * b_dual_num))


proc `^`*(a:Dual,b:int):float64=
    var w = a
    for i in 1..b-1:
        var q = w *. a
        var w = q
    let t = w.x + w.dx
    return t


