from math import sqrt,gamma
import random
import times


## One Parmeter distribution
##
type 
    OPDist* = ref object of RootObj
        mu*: float64
## Two Parmeter distribution
##
type 
    TPDist* = ref object of RootObj
        a*:float64
        b*:float64


method sample(self: OPDist, n: uint64): seq[float64] =
    @[0.0]

method sample(self: TPDist, n: uint64): seq[float64] =
    @[0.0]

method pdf(self: OPDist, x: float64): float64 =
    0.0

method pdf(self: TPDist, x: float64): float64 =
    0.0

method mean(self: OPDist): float64 =
    0.0

method mean(self: TPDist): float64 =
    0.0

method vari(self: OPDist): float64 =
    0.0

method vari(self: TPDist): float64 =
    0.0

method std(self: OPDist): float64 =
    0.0

method std(self: TPDist): float64 =
    0.0


## Bernoulli Distribution 

type 
    Bernoulli* = ref object of OPDist

method sample(self: Bernoulli, n: int): seq[float64] =
    let m = self.mu
    var sam = newSeq[float64](n)
    var rng = initRand(getTime().nanosecond())
    for i in 0..n-1:
        var s = 0.0
        let r = rand(rng, 1.0)
        echo r
        if r <= m :
            s = 1.0
        sam[i] = s
    return sam
    

proc newBernoulli(mu: float64): Bernoulli = Bernoulli(mu: mu)

method pdf(self:Bernoulli ,x:float64):float64=
    let m = self.mu
    if x == 1:
        return m
    else:
        return 1.0 - m

method mean(self:Bernoulli, mu:float64): float64 =
    let m = self.mu
    return m


method vari(self:Bernoulli,mu:float64): float64 =
    let m = self.mu
    return m*(1.0 - m)

method std(self:Bernoulli,mu:float64): float64 =
    let m = self.mu
    let vari = m*(1.0-m)
    return sqrt(vari)

let mu:float64 = 0.1
let b = Bernoulli(mu: 0.1)
let b_sample = sample(b,10)

## Beta Dsitribution

type 
    Beta* = ref object of TPDist

proc `^`*(a,b:float64):float64 =
    return a^b

proc beta*(x,a,b:float64):float64=
    return gamma(a + b) / (gamma(a) * gamma(b)) * x^(a - 1.0) * (1.0-x)^(b - 1.0)
    

method sample(self:Beta,n:int): seq[float64] =
    var sam = newSeq[float64](n)
    # var bet:float64 = gamma(self.a + self.b) / (gamma(self.a) * gamma(self.b)) * self.x^(self.a - 1.0) * (1.0-self.x)^(self.b - 1.0)
    let mode:float64 = (self.a - 1.0) / (self.a + self.b  - 2.0) 
    while len(sam) != n :
        var u1 = initRand(getTime().nanosecond())
        var u2 = initRand(getTime().nanosecond() * 2)
        let r1 = rand(u1, 1.0)
        let r2 = rand(u2, 1.0)  
        if float(r1) <= beta(r2,self.a,self.b)/mode:
            sam.add(float(r2))
    return sam

method pdf*(self:Beta,x:float64): float64 =
    return beta(x,self.a,self.b)

method mean(self:Beta): float64 =
    return (self.a / (self.a + self.b))

method vari(self:Beta): float64 =
    let a = self.a
    let b = self.b
    return (a*b / (((a+b)^2.0)*(a+b+1)))

method std(self:Beta): float64 =
    let a = self.a
    let b = self.b
    let vari =  (a*b / (((a+b)^2.0)*(a+b+1)))
    return sqrt(vari)
        

## Gamma Distribustion ## 

type 
    Gamma* = ref object of TPDist

method sample(self:Gamma,n:int): seq[float64] =
    var sam = newSeq[float64](n)
    let a = self.a
    let b = self.b

    let d = a - (1.0 / 3.0)
    let c = 1.0 / sqrt(9.0 * d)
    var iter_num = 0
    while iter_num < n :
        let u = initRand(getTime().nanosecond())
        let z = initRand(getTime().nanosecond() * 2)
        let w = (1.0 + c * z)

        if (z >= -1.0 / c) and (log(E,u) < 0.5 +z + d - d*w + d * log(E,w)):
            sam[iter_num] = d * w / b
            iter_num += 1
    
    return sam



