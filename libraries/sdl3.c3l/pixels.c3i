
module sdl3;

// Structs
struct Color {
  char r, g, b, a;
}
struct FColor {
  float r, g, b, a;
}
struct Palette {
  int ncolors;    /**< number of elements in `colors`. */
  Color *colors;  /**< an array of colors, `ncolors` long. */
  uint version;   /**< internal use only, do not touch. */
  int refcount;   /**< internal use only, do not touch. */
}
struct PixelFormatDetails {
  PixelFormat format;
  char bits_per_pixel;
  char bytes_per_pixel;
  char[2] padding;
  uint rmask, gmask, bmask, amask;
  char rbits, gbits, bbits, abits;
  char rshift, gshift, bshift, ashift;
}

// Enums
enum ArrayOrder {
  NONE,
  RGB,
  RGBA,
  ARGB,
  BGR,
  BGRA,
  ABGR,
}
enum BitmapOrder {
  NONE,
  O4321,
  O1234,
}
enum ChromaLocation {
  NONE,    /**< RGB, no chroma sampling */
  LEFT,    /**< In MPEG-2, MPEG-4, and AVC, Cb and Cr are taken on midpoint of the left-edge of the 2x2 square. In other words, they have the same horizontal location as the top-left pixel, but is shifted one-half pixel down vertically. */
  CENTER,  /**< In JPEG/JFIF, H.261, and MPEG-1, Cb and Cr are taken at the center of the 2x2 square. In other words, they are offset one-half pixel to the right and one-half pixel down compared to the top-left pixel. */
  TOPLEFT, /**< In HEVC for BT.2020 and BT.2100 content (in particular on Blu-rays), Cb and Cr are sampled at the same location as the group's top-left Y pixel ("co-sited", "co-located"). */
}
enum ColorPrimaries : const CInt {
  UNKNOWN = 0,
  BT709 = 1,                  /**< ITU-R BT.709-6 */
  UNSPECIFIED = 2,
  BT470M = 4,                 /**< ITU-R BT.470-6 System M */
  BT470BG = 5,                /**< ITU-R BT.470-6 System B, G / ITU-R BT.601-7 625 */
  BT601 = 6,                  /**< ITU-R BT.601-7 525, SMPTE 170M */
  SMPTE240 = 7,               /**< SMPTE 240M, functionally the same as SDL_COLOR_PRIMARIES_BT601 */
  GENERIC_FILM = 8,           /**< Generic film (color filters using Illuminant C) */
  BT2020 = 9,                 /**< ITU-R BT.2020-2 / ITU-R BT.2100-0 */
  XYZ = 10,                   /**< SMPTE ST 428-1 */
  SMPTE431 = 11,              /**< SMPTE RP 431-2 */
  SMPTE432 = 12,              /**< SMPTE EG 432-1 / DCI P3 */
  EBU3213 = 22,               /**< EBU Tech. 3213-E */
  CUSTOM = 31,
}
enum ColorRange {
    UNKNOWN,
    LIMITED, /**< Narrow range, e.g. 16-235 for 8-bit RGB and luma, and 16-240 for 8-bit chroma */
    FULL,    /**< Full range, e.g. 0-255 for 8-bit RGB and luma, and 1-255 for 8-bit chroma */
}
enum Colorspace : const CInt {
  UNKNOWN = 0,
  SRGB = 0x120005a0u,           /**< Equivalent to DXGI_COLOR_SPACE_RGB_FULL_G22_NONE_P709 */
  SRGB_LINEAR = 0x12000500u,    /**< Equivalent to DXGI_COLOR_SPACE_RGB_FULL_G10_NONE_P709  */
  HDR10 = 0x12002600u,          /**< Equivalent to DXGI_COLOR_SPACE_RGB_FULL_G2084_NONE_P2020  */
  JPEG = 0x220004c6u,           /**< Equivalent to DXGI_COLOR_SPACE_YCBCR_FULL_G22_NONE_P709_X601 */
  BT601_LIMITED = 0x211018c6u,  /**< Equivalent to DXGI_COLOR_SPACE_YCBCR_STUDIO_G22_LEFT_P601 */
  BT601_FULL = 0x221018c6u,     /**< Equivalent to DXGI_COLOR_SPACE_YCBCR_STUDIO_G22_LEFT_P601 */
  BT709_LIMITED = 0x21100421u,  /**< Equivalent to DXGI_COLOR_SPACE_YCBCR_STUDIO_G22_LEFT_P709 */
  BT709_FULL = 0x22100421u,     /**< Equivalent to DXGI_COLOR_SPACE_YCBCR_STUDIO_G22_LEFT_P709 */
  BT2020_LIMITED = 0x21102609u, /**< Equivalent to DXGI_COLOR_SPACE_YCBCR_STUDIO_G22_LEFT_P2020 */
  BT2020_FULL = 0x22102609u,    /**< Equivalent to DXGI_COLOR_SPACE_YCBCR_FULL_G22_LEFT_P2020 */
  RGB_DEFAULT = SRGB,           /**< The default colorspace for RGB surfaces if no colorspace is specified */
  YUV_DEFAULT = BT601_LIMITED   /**< The default colorspace for YUV surfaces if no colorspace is specified */
}
enum ColorType {
  UNKNOWN,
  RGB,
  YCBCR,
}
enum MatrixCoefficients : const CInt {
  IDENTITY = 0,
  BT709 = 1,              /**< ITU-R BT.709-6 */
  UNSPECIFIED = 2,
  FCC = 4,                /**< US FCC Title 47 */
  BT470BG = 5,            /**< ITU-R BT.470-6 System B, G / ITU-R BT.601-7 625, functionally the same as SDL_MATRIX_COEFFICIENTS_BT601 */
  BT601 = 6,              /**< ITU-R BT.601-7 525 */
  SMPTE240 = 7,           /**< SMPTE 240M */
  YCGCO = 8,
  BT2020_NCL = 9,         /**< ITU-R BT.2020-2 non-constant luminance */
  BT2020_CL = 10,         /**< ITU-R BT.2020-2 constant luminance */
  SMPTE2085 = 11,         /**< SMPTE ST 2085 */
  CHROMA_DERIVED_NCL = 12,
  CHROMA_DERIVED_CL = 13,
  ICTCP = 14,             /**< ITU-R BT.2100-0 ICTCP */
  CUSTOM = 31,
}
enum PackedLayout {
  NONE,
  L332,
  L4444,
  L1555,
  L5551,
  L565,
  L8888,
  L2101010,
  L1010102
}
enum PackedOrder {
  NONE,
  XRGB,
  RGBX,
  ARGB,
  RGBA,
  XBGR,
  BGRX,
  ABGR,
  BGRA
}
enum PixelFormat : const CInt {
  UNKNOWN = 0,
  INDEX1LSB = 0x11100100u,
  INDEX1MSB = 0x11200100u,
  INDEX2LSB = 0x1c100200u,
  INDEX2MSB = 0x1c200200u,
  INDEX4LSB = 0x12100400u,
  INDEX4MSB = 0x12200400u,
  INDEX8 = 0x13000801u,
  RGB332 = 0x14110801u,
  XRGB4444 = 0x15120c02u,
  XBGR4444 = 0x15520c02u,
  XRGB1555 = 0x15130f02u,
  XBGR1555 = 0x15530f02u,
  ARGB4444 = 0x15321002u,
  RGBA4444 = 0x15421002u,
  ABGR4444 = 0x15721002u,
  BGRA4444 = 0x15821002u,
  ARGB1555 = 0x15331002u,
  RGBA5551 = 0x15441002u,
  ABGR1555 = 0x15731002u,
  BGRA5551 = 0x15841002u,
  RGB565 = 0x15151002u,
  BGR565 = 0x15551002u,
  RGB24 = 0x17101803u,
  BGR24 = 0x17401803u,
  XRGB8888 = 0x16161804u,
  RGBX8888 = 0x16261804u,
  XBGR8888 = 0x16561804u,
  BGRX8888 = 0x16661804u,
  ARGB8888 = 0x16362004u,
  RGBA8888 = 0x16462004u,
  ABGR8888 = 0x16762004u,
  BGRA8888 = 0x16862004u,
  XRGB2101010 = 0x16172004u,
  XBGR2101010 = 0x16572004u,
  ARGB2101010 = 0x16372004u,
  ABGR2101010 = 0x16772004u,
  RGB48 = 0x18103006u,
  BGR48 = 0x18403006u,
  RGBA64 = 0x18204008u,
  ARGB64 = 0x18304008u,
  BGRA64 = 0x18504008u,
  ABGR64 = 0x18604008u,
  RGB48_FLOAT = 0x1a103006u,
  BGR48_FLOAT = 0x1a403006u,
  RGBA64_FLOAT = 0x1a204008u,
  ARGB64_FLOAT = 0x1a304008u,
  BGRA64_FLOAT = 0x1a504008u,
  ABGR64_FLOAT = 0x1a604008u,
  RGB96_FLOAT = 0x1b10600cu,
  BGR96_FLOAT = 0x1b40600cu,
  RGBA128_FLOAT = 0x1b208010u,
  ARGB128_FLOAT = 0x1b308010u,
  BGRA128_FLOAT = 0x1b508010u,
  ABGR128_FLOAT = 0x1b608010u,

  YV12 = 0x32315659u,
  IYUV = 0x56555949u,
  YUY2 = 0x32595559u,
  UYVY = 0x59565955u,
  YVYU = 0x55595659u,
  NV12 = 0x3231564eu,
  NV21 = 0x3132564eu,
  P010 = 0x30313050u,
  EXTERNAL_OES = 0x2053454fu,

  MJPG = 0x47504a4du,
}
enum PixelType {
  UNKNOWN,
  INDEX1,
  INDEX4,
  INDEX8,
  PACKED8,
  PACKED16,
  PACKED32,
  ARRAYU8,
  ARRAYU16,
  ARRAYU32,
  ARRAYF16,
  ARRAYF32,

  INDEX2,
}
enum TransferCharacteristics : const CInt {
  UNKNOWN = 0,
  BT709 = 1,         /**< Rec. ITU-R BT.709-6 / ITU-R BT1361 */
  UNSPECIFIED = 2,
  GAMMA22 = 4,       /**< ITU-R BT.470-6 System M / ITU-R BT1700 625 PAL & SECAM */
  GAMMA28 = 5,       /**< ITU-R BT.470-6 System B, G */
  BT601 = 6,         /**< SMPTE ST 170M / ITU-R BT.601-7 525 or 625 */
  SMPTE240 = 7,      /**< SMPTE ST 240M */
  LINEAR = 8,
  LOG100 = 9,
  LOG100_SQRT10 = 10,
  IEC61966 = 11,     /**< IEC 61966-2-4 */
  BT1361 = 12,       /**< ITU-R BT1361 Extended Colour Gamut */
  SRGB = 13,         /**< IEC 61966-2-1 (sRGB or sYCC) */
  BT2020_10BIT = 14, /**< ITU-R BT2020 for 10-bit system */
  BT2020_12BIT = 15, /**< ITU-R BT2020 for 12-bit system */
  PQ = 16,           /**< SMPTE ST 2084 for 10-, 12-, 14- and 16-bit systems */
  SMPTE428 = 17,     /**< SMPTE ST 428-1 */
  HLG = 18,          /**< ARIB STD-B67, known as "hybrid log-gamma" (HLG) */
  CUSTOM = 31,
}

// Functions
extern fn Palette* createPalette(int ncolors) @extern("SDL_CreatePalette");
extern fn void destroyPalette(Palette* palette) @extern("SDL_DestroyPalette");
extern fn bool getMasksForPixelFormat(PixelFormat format, int* bpp, uint* rmask, uint* gmask, uint* bmask, uint* amask) @extern("SDL_GetMasksForPixelFormat");
extern fn PixelFormatDetails* getPixelFormatDetails(PixelFormat format) @extern("SDL_PixelFormatDetails");
extern fn PixelFormat getPixelFormatForMasks(int bpp, uint rmask, uint gmask, uint bmask, uint amask) @extern("SDL_GetPixelFormatForMasks");
extern fn char* getPixelFormatName(PixelFormat format) @extern("SDL_GetPixelFormatName");
extern fn void getRGB(uint pixelvalue, PixelFormatDetails* format, Palette* palette, char* r, char* g, char* b) @extern("SDL_GetRGB");
extern fn void getRGBA(uint pixelvalue, PixelFormatDetails* format, Palette* palette, char* r, char* g, char* b, char* a) @extern("SDL_GetRGBA");
extern fn uint mapRGB(PixelFormatDetails* format, Palette* palette, char r, char g, char b) @extern("SDL_MapRGB");
extern fn uint mapRGBA(PixelFormatDetails* format, Palette* palette, char r, char g, char b, char a) @extern("SDL_MapRGBA");
extern fn bool setPaletteColors(Palette* palette, Color* colors, int firstcolor, int ncolors) @extern("SDL_SetPaletteColors");

