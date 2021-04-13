when defined(windows):
  {.push importc, dynlib: "avutil-(|55|56|57).dll".}
elif defined(macosx):
  {.push importc, dynlib: "avutil(|.55|.56|.57).dylib".}
else:
  {.push importc, dynlib: "libavutil.so(|.55|.56|.57)".}

type
  av_intfloat32* {.bycopy, union.} = object
    i*: cuint
    f*: cfloat

  av_intfloat64* {.bycopy, union.} = object
    i*: cuint
    f*: cdouble

proc av_int2float* (i: uint32): cfloat {.cdecl, inline.} =
  var v: av_intfloat32
  v.i = i
  result = v.f

proc av_float2int* (f: cfloat): uint32 {.cdecl, inline.} =
  var v: av_intfloat32
  v.f = f
  result = v.i

proc av_int2double* (i: uint64): cdouble {.cdecl, inline.} =
  var v: av_intfloat64
  v.i = i.uint32
  result = v.f

proc av_double2int* (f: cdouble): uint64 {.cdecl, inline.} =
  var v: av_intfloat64
  v.f = f
  result = v.i