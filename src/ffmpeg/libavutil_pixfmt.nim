when defined(windows):
  {.push importc, dynlib: "avutil-(|55|56|57).dll".}
elif defined(macosx):
  {.push importc, dynlib: "avutil(|.55|.56|.57).dylib".}
else:
  {.push importc, dynlib: "libavutil.so(|.55|.56|.57)".}

const
  AVPALETTE_SIZE* = 1024
  AVPALETTE_COUNT* = 256

type
  AVPixelFormat* = enum
    AV_PIX_FMT_NONE = -1
    AV_PIX_FMT_YUV420P
    AV_PIX_FMT_YUYV422
    AV_PIX_FMT_RGB24
    AV_PIX_FMT_BGR24
    AV_PIX_FMT_YUV422P
    AV_PIX_FMT_YUV444P
    AV_PIX_FMT_YUV410P
    AV_PIX_FMT_YUV411P
    AV_PIX_FMT_GRAY8
    AV_PIX_FMT_MONOWHITE
    AV_PIX_FMT_MONOBLACK
    AV_PIX_FMT_PAL8
    AV_PIX_FMT_YUVJ420P
    AV_PIX_FMT_YUVJ422P
    AV_PIX_FMT_YUVJ444P
    AV_PIX_FMT_UYVY422
    AV_PIX_FMT_UYYVYY411
    AV_PIX_FMT_BGR8
    AV_PIX_FMT_BGR4
    AV_PIX_FMT_BGR4_BYTE
    AV_PIX_FMT_RGB8
    AV_PIX_FMT_RGB4
    AV_PIX_FMT_RGB4_BYTE
    AV_PIX_FMT_NV12
    AV_PIX_FMT_NV21
    AV_PIX_FMT_ARGB
    AV_PIX_FMT_RGBA
    AV_PIX_FMT_ABGR
    AV_PIX_FMT_BGRA
    AV_PIX_FMT_GRAY16BE
    AV_PIX_FMT_GRAY16LE
    AV_PIX_FMT_YUV440P
    AV_PIX_FMT_YUVJ440P
    AV_PIX_FMT_YUVA420P
    AV_PIX_FMT_RGB48BE
    AV_PIX_FMT_RGB48LE
    AV_PIX_FMT_RGB565BE
    AV_PIX_FMT_RGB565LE
    AV_PIX_FMT_RGB555BE
    AV_PIX_FMT_RGB555LE
    AV_PIX_FMT_BGR565BE
    AV_PIX_FMT_BGR565LE
    AV_PIX_FMT_BGR555BE
    AV_PIX_FMT_BGR555LE
    AV_PIX_FMT_VAAPI_MOCO # if FF_API_VAAPI
    AV_PIX_FMT_VAAPI_IDCT # if FF_API_VAAPI
    AV_PIX_FMT_VAAPI_VLD # if FF_API_VAAPI
    AV_PIX_FMT_VAAPI # if FF_API_VAAPI
    AV_PIX_FMT_YUV420P16LE
    AV_PIX_FMT_YUV420P16BE
    AV_PIX_FMT_YUV422P16LE
    AV_PIX_FMT_YUV422P16BE
    AV_PIX_FMT_YUV444P16LE
    AV_PIX_FMT_YUV444P16BE
    AV_PIX_FMT_DXVA2_VLD
    AV_PIX_FMT_RGB444LE
    AV_PIX_FMT_RGB444BE
    AV_PIX_FMT_BGR444LE
    AV_PIX_FMT_BGR444BE
    AV_PIX_FMT_YA8
    AV_PIX_FMT_Y400A
    AV_PIX_FMT_GRAY8A
    AV_PIX_FMT_BGR48BE
    AV_PIX_FMT_YUV420P9BE
    AV_PIX_FMT_YUV420P9LE
    AV_PIX_FMT_YUV420P10BE
    AV_PIX_FMT_YUV420P10LE
    AV_PIX_FMT_YUV422P10BE
    AV_PIX_FMT_YUV422P10LE
    AV_PIX_FMT_YUV444P9BE
    AV_PIX_FMT_YUV444P9LE
    AV_PIX_FMT_YUV444P10BE
    AV_PIX_FMT_YUV444P10LE
    AV_PIX_FMT_YUV422P9BE
    AV_PIX_FMT_YUV422P9LE
    AV_PIX_FMT_GBRP
    AV_PIX_FMT_GBR24P
    AV_PIX_FMT_GBRP9BE
    AV_PIX_FMT_GBRP9LE
    AV_PIX_FMT_GBRP10BE
    AV_PIX_FMT_GBRP10LE
    AV_PIX_FMT_GBRP16BE
    AV_PIX_FMT_GBRP16LE
    AV_PIX_FMT_YUVA422P
    AV_PIX_FMT_YUVA444P
    AV_PIX_FMT_YUVA420P9BE
    AV_PIX_FMT_YUVA420P9LE
    AV_PIX_FMT_YUVA422P9BE
    AV_PIX_FMT_YUVA422P9LE
    AV_PIX_FMT_YUVA444P9BE
    AV_PIX_FMT_YUVA444P9LE
    AV_PIX_FMT_YUVA420P10BE
    AV_PIX_FMT_YUVA420P10LE
    AV_PIX_FMT_YUVA422P10BE
    AV_PIX_FMT_YUVA422P10LE
    AV_PIX_FMT_YUVA444P10BE
    AV_PIX_FMT_YUVA444P10LE
    AV_PIX_FMT_YUVA420P16BE
    AV_PIX_FMT_YUVA420P16LE
    AV_PIX_FMT_YUVA422P16BE
    AV_PIX_FMT_YUVA422P16LE
    AV_PIX_FMT_YUVA444P16BE
    AV_PIX_FMT_YUVA444P16LE
    AV_PIX_FMT_VDPAU
    AV_PIX_FMT_XYZ12LE
    AV_PIX_FMT_XYZ12BE
    AV_PIX_FMT_NV16
    AV_PIX_FMT_NV20LE
    AV_PIX_FMT_NV20BE
    AV_PIX_FMT_RGBA64BE
    AV_PIX_FMT_RGBA64LE
    AV_PIX_FMT_BGRA64BE
    AV_PIX_FMT_BGRA64LE
    AV_PIX_FMT_YVYU422
    AV_PIX_FMT_YA16BE
    AV_PIX_FMT_YA16LE
    AV_PIX_FMT_GBRAP
    AV_PIX_FMT_GBRAP16BE
    AV_PIX_FMT_GBRAP16LE
    AV_PIX_FMT_QSV
    AV_PIX_FMT_MMAL
    AV_PIX_FMT_D3D11VA_VLD
    AV_PIX_FMT_CUDA
    AV_PIX_FMT_0RGB
    AV_PIX_FMT_RGB0
    AV_PIX_FMT_0BGR
    AV_PIX_FMT_BGR0
    AV_PIX_FMT_YUV420P12BE
    AV_PIX_FMT_YUV420P12LE
    AV_PIX_FMT_YUV420P14BE
    AV_PIX_FMT_YUV420P14LE
    AV_PIX_FMT_YUV422P12BE
    AV_PIX_FMT_YUV422P12LE
    AV_PIX_FMT_YUV422P14BE
    AV_PIX_FMT_YUV422P14LE
    AV_PIX_FMT_YUV444P12BE
    AV_PIX_FMT_YUV444P12LE
    AV_PIX_FMT_YUV444P14BE
    AV_PIX_FMT_YUV444P14LE
    AV_PIX_FMT_GBRP12BE
    AV_PIX_FMT_GBRP12LE
    AV_PIX_FMT_GBRP14BE
    AV_PIX_FMT_GBRP14LE
    AV_PIX_FMT_YUVJ411P
    AV_PIX_FMT_BAYER_BGGR8
    AV_PIX_FMT_BAYER_RGGB8
    AV_PIX_FMT_BAYER_GBRG8
    AV_PIX_FMT_BAYER_GRBG8
    AV_PIX_FMT_BAYER_BGGR16LE
    AV_PIX_FMT_BAYER_BGGR16BE
    AV_PIX_FMT_BAYER_RGGB16LE
    AV_PIX_FMT_BAYER_RGGB16BE
    AV_PIX_FMT_BAYER_GBRG16LE
    AV_PIX_FMT_BAYER_GBRG16BE
    AV_PIX_FMT_BAYER_GRBG16LE
    AV_PIX_FMT_BAYER_GRBG16BE
    AV_PIX_FMT_XVMC
    AV_PIX_FMT_YUV440P10LE
    AV_PIX_FMT_YUV440P10BE
    AV_PIX_FMT_YUV440P12LE
    AV_PIX_FMT_YUV440P12BE
    AV_PIX_FMT_AYUV64LE
    AV_PIX_FMT_AYUV64BE
    AV_PIX_FMT_VIDEOTOOLBOX
    AV_PIX_FMT_P010LE
    AV_PIX_FMT_P010BE
    AV_PIX_FMT_GBRAP12BE
    AV_PIX_FMT_GBRAP12LE
    AV_PIX_FMT_GBRAP10BE
    AV_PIX_FMT_GBRAP10LE
    AV_PIX_FMT_MEDIACODEC
    AV_PIX_FMT_GRAY12BE
    AV_PIX_FMT_GRAY12LE
    AV_PIX_FMT_GRAY10BE
    AV_PIX_FMT_GRAY10LE
    AV_PIX_FMT_P016LE
    AV_PIX_FMT_P016BE
    AV_PIX_FMT_D3D11
    AV_PIX_FMT_GRAY9BE
    AV_PIX_FMT_GRAY9LE
    AV_PIX_FMT_GBRPF32BE
    AV_PIX_FMT_GBRPF32LE
    AV_PIX_FMT_GBRAPF32BE
    AV_PIX_FMT_GBRAPF32LE
    AV_PIX_FMT_DRM_PRIME
    AV_PIX_FMT_OPENCL
    AV_PIX_FMT_GRAY14BE
    AV_PIX_FMT_GRAY14LE
    AV_PIX_FMT_GRAYF32BE
    AV_PIX_FMT_GRAYF32LE
    AV_PIX_FMT_YUVA422P12BE
    AV_PIX_FMT_YUVA422P12LE
    AV_PIX_FMT_YUVA444P12BE
    AV_PIX_FMT_YUVA444P12LE
    AV_PIX_FMT_NV24
    AV_PIX_FMT_NV42
    AV_PIX_FMT_VULKAN
    AV_PIX_FMT_Y210BE
    AV_PIX_FMT_Y210LE
    AV_PIX_FMT_NB

  AVColorPrimaries* = enum
    AVCOL_PRI_RESERVED0   = 0
    AVCOL_PRI_BT709       = 1
    AVCOL_PRI_UNSPECIFIED = 2
    AVCOL_PRI_RESERVED    = 3
    AVCOL_PRI_BT470M      = 4
    AVCOL_PRI_BT470BG     = 5
    AVCOL_PRI_SMPTE170M   = 6
    AVCOL_PRI_SMPTE240M   = 7
    AVCOL_PRI_FILM        = 8
    AVCOL_PRI_BT2020      = 9
    AVCOL_PRI_SMPTE428    = 10
    AVCOL_PRI_SMPTE431    = 11
    AVCOL_PRI_SMPTE432    = 12
    AVCOL_PRI_EBU3213     = 22
    AVCOL_PRI_SMPTEST428_1  # = AVCOL_PRI_SMPTE428
    AVCOL_PRI_JEDEC_P22   # = AVCOL_PRI_EBU3213
    AVCOL_PRI_NB
  
  AVColorTransferCharacteristic* = enum
    AVCOL_TRC_RESERVED0    = 0
    AVCOL_TRC_BT709        = 1
    AVCOL_TRC_UNSPECIFIED  = 2
    AVCOL_TRC_RESERVED     = 3
    AVCOL_TRC_GAMMA22      = 4
    AVCOL_TRC_GAMMA28      = 5
    AVCOL_TRC_SMPTE170M    = 6
    AVCOL_TRC_SMPTE240M    = 7
    AVCOL_TRC_LINEAR       = 8
    AVCOL_TRC_LOG          = 9
    AVCOL_TRC_LOG_SQRT     = 10
    AVCOL_TRC_IEC61966_2_4 = 11
    AVCOL_TRC_BT1361_ECG   = 12
    AVCOL_TRC_IEC61966_2_1 = 13
    AVCOL_TRC_BT2020_10    = 14
    AVCOL_TRC_BT2020_12    = 15
    AVCOL_TRC_SMPTE2084    = 16
    AVCOL_TRC_SMPTE428     = 17
    AVCOL_TRC_ARIB_STD_B67 = 18
    AVCOL_TRC_SMPTEST2084  #= AVCOL_TRC_SMPTE2084,
    AVCOL_TRC_SMPTEST428_1 #= AVCOL_TRC_SMPTE428,
    AVCOL_TRC_NB

  AVColorSpace* = enum
    AVCOL_SPC_RGB         = 0
    AVCOL_SPC_BT709       = 1
    AVCOL_SPC_UNSPECIFIED = 2
    AVCOL_SPC_RESERVED    = 3
    AVCOL_SPC_FCC         = 4
    AVCOL_SPC_BT470BG     = 5
    AVCOL_SPC_SMPTE170M   = 6
    AVCOL_SPC_SMPTE240M   = 7
    AVCOL_SPC_YCGCO       = 8
    AVCOL_SPC_BT2020_NCL  = 9
    AVCOL_SPC_BT2020_CL   = 10
    AVCOL_SPC_SMPTE2085   = 11
    AVCOL_SPC_CHROMA_DERIVED_NCL = 12
    AVCOL_SPC_CHROMA_DERIVED_CL = 13
    AVCOL_SPC_ICTCP       = 14
    AVCOL_SPC_YCOCG       #= AVCOL_SPC_YCGCO,
    AVCOL_SPC_NB
  
  AVColorRange* = enum
    AVCOL_RANGE_UNSPECIFIED = 0
    AVCOL_RANGE_MPEG        = 1
    AVCOL_RANGE_JPEG        = 2
    AVCOL_RANGE_NB
  
  AVChromaLocation* = enum
    AVCHROMA_LOC_UNSPECIFIED = 0
    AVCHROMA_LOC_LEFT        = 1
    AVCHROMA_LOC_CENTER      = 2
    AVCHROMA_LOC_TOPLEFT     = 3
    AVCHROMA_LOC_TOP         = 4
    AVCHROMA_LOC_BOTTOMLEFT  = 5
    AVCHROMA_LOC_BOTTOM      = 6
    AVCHROMA_LOC_NB