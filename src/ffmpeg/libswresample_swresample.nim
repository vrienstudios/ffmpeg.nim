from libavutil_channel_layout import AVMatrixEncoding
from libavutil_frame import AVFrame
from libavutil_opt import AVClass
from libavutil_samplefmt import AVSampleFormat

const
  SWR_FLAG_RESAMPLE* = 1

{.pragma: swresample, importc, header: "<libswresample/swresample.h>".}

type
  SwrDitherType* {.swresample.} = enum
    SWR_DITHER_NONE = 0
    SWR_DITHER_RECTANGULAR
    SWR_DITHER_TRIANGULAR
    SWR_DITHER_TRIANGULAR_HIGHPASS
    SWR_DITHER_NS = 64
    SWR_DITHER_NS_LIPSHITZ
    SWR_DITHER_NS_F_WEIGHTED
    SWR_DITHER_NS_MODIFIED_E_WEIGHTED
    SWR_DITHER_NS_IMPROVED_E_WEIGHTED
    SWR_DITHER_NS_SHIBATA
    SWR_DITHER_NS_LOW_SHIBATA
    SWR_DITHER_NS_HIGH_SHIBATA
    SWR_DITHER_NB
  
  SwrEngine* {.swresample.} = enum
    SWR_ENGINE_SWR
    SWR_ENGINE_SOXR
    SWR_ENGINE_NB
  
  SwrFilterType* {.swresample.} = enum
    SWR_FILTER_TYPE_CUBIC
    SWR_FILTER_TYPE_BLACKMAN_NUTTALL
    SWR_FILTER_TYPE_KAISER

  SwrContext* {.swresample.} = object

when defined(windows):
  {.push importc, dynlib: "swresample(|-2|-3|-4).dll".}
elif defined(macosx):
  {.push importc, dynlib: "swresample(|.2|.3|.4).dylib".}
else:
  {.push importc, dynlib: "libswresample.so(|.2|.3|.4)".}

proc swr_get_class* (): ptr AVClass
proc swr_alloc* (): ptr SwrContext
proc swr_init* (s: ptr SwrContext): cint
proc swr_is_initialized* (s: ptr SwrContext): cint
proc swr_alloc_set_opts* (s: ptr SwrContext, out_ch_layout: int64, out_sample_fmt: AVSampleFormat, out_sample_rate: cint, in_ch_layout: int64, in_sample_fmt: AVSampleFormat, in_sample_rate, log_offset: cint, log_ctx: pointer): ptr SwrContext
proc swr_free* (s: ptr ptr SwrContext)
proc swr_close* (s: ptr SwrContext)
proc swr_convert* (s: ptr SwrContext, `out`: ptr ptr uint8, out_count: cint, `in`: ptr ptr uint8, in_count: cint): cint
proc swr_next_pts* (s: ptr SwrContext, pts: int64): int64
proc swr_set_compensation* (s: ptr SwrContext, sample_delta: cint, compensation_distance: cint): cint
proc swr_set_channel_mapping* (s: ptr SwrContext, channel_map: ptr cint): cint
proc swr_build_matrix* (in_layout, out_layout: uint64, center_mix_level, surround_mix_level, lfe_mix_level, rematrix_maxval, rematrix_volume: cdouble, matrix: ptr cdouble, stride: cint, matrix_encoding: AVMatrixEncoding, log_ctx: pointer): cint
proc swr_set_matrix* (s: ptr SwrContext, matrix: ptr cdouble, stride: cint): cint
proc swr_drop_output* (s: ptr SwrContext, count: cint): cint
proc swr_inject_silence* (s: ptr SwrContext, count: cint): cint
proc swr_get_delay* (s: ptr SwrContext, base: int64): int64
proc swr_get_out_samples* (s: ptr SwrContext, in_samples: cint): cint
proc swresample_version* (): cuint
proc swresample_configuration* (): cstring
proc swresample_license* (): cstring
proc swr_convert_frame* (swr: ptr SwrContext, output, input: ptr AVFrame): cint
proc swr_config_frame* (swr: ptr SwrContext, `out`, `in`: ptr AVFrame): cint
