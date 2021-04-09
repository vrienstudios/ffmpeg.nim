when defined(windows):
  {.push importc, dynlib: "avcodec(|-55|-56|-57|-58|-59).dll".}
elif defined(macosx):
  {.push importc, dynlib: "avcodec(|.55|.56|.57|.58|.59).dylib".}
else:
  {.push importc, dynlib: "libavcodec.so(|.55|.56|.57|.58|.59)".}

type
  AVCodecContext* = object
  AVFrame* = object

  AVVDPAU_Render2* = proc (a1: ptr AVCodecContext, a2: ptr AVFrame, a3: ptr VdpPictureInfo, a4: cuint, a5: ptr VdpBitstreamBuffer): cint

  AVVDPAUContext* = object
    decoder: VdpDecoder
    render: ptr VdpDecoderRender
    render2: AVVDPAU_Render2

proc av_alloc_vdpaucontext* (): AVVDPAUContext
proc av_vdpau_hwaccel_get_render2* (a1: ptr AVVDPAUContext): AVVDPAU_Render2
proc av_vdpau_hwaccel_set_render2* (a1: ptr AVVDPAUContext, a2: AVVDPAU_Render2)
proc av_vdpau_bind_context* (avctx: ptr AVCodecContext, device: VdpDevice, get_proc_address: ptr VdpGetProcAddress, flags: cuint): cint
proc av_vdpau_get_surface_parameters* (avctx: ptr AVCodecContext, `type`: ptr VdpChromaType, width, height: ptr cuint): cint
proc av_vdpau_alloc_context* (): AVVDPAUContext

when defined(FF_API_VDPAU_PROFILE):
  proc av_vdpau_get_profile* (avctx: ptr AVCodecContext, profile: ptr VdpDecoderProfile): cint