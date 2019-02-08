{.passL: "-framework Foundation".}
{.passL: "-lgsl".}

import sequtils, math

type
  Gsl_rng_type = object
    name: int
  Gsl_rng* = object
    tye: Gsl_rng_type

proc gsl_rng_min*(r: ptr Gsl_rng) : float64 {.header: "<gsl/gsl_rng.h>", importc: "gsl_rng_min", varargs.}
proc gsl_rng_max*(r: ptr Gsl_rng) : float64 {.header: "<gsl/gsl_rng.h>", importc: "gsl_rng_max", varargs.}
proc gsl_rng_get*(r: ptr Gsl_rng) : float64 {.header: "<gsl/gsl_rng.h>", importc: "gsl_rng_get", varargs.}
proc gsl_rng_unifrom*(r: ptr Gsl_rng) : float64{.header: "<gsl/gsl_rng.h>", importc: "gsl_rng_unifrom", varargs.}