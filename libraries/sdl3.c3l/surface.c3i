
module sdl3;

// Bitstructs
bitstruct SurfaceFlags : uint {
  bool preallocated;
  bool lockNeeded;
  bool locked;
  bool simdAligned;
}
bitstruct FlipMode : uint {
  bool horizontal;
  bool vertical;
}

// Structs
struct Surface {
  SurfaceFlags flags;     /**< The flags of the surface, read-only */
  PixelFormat format;     /**< The format of the surface, read-only */
  int w;                  /**< The width of the surface, read-only. */
  int h;                  /**< The height of the surface, read-only. */
  int pitch;              /**< The distance in bytes between rows of pixels, read-only */
  void* pixels;           /**< A pointer to the pixels of the surface, the pixels are writeable if non-NULL */

  int refcount;           /**< Application reference count, used when freeing surface */

  void* reserved;         /**< Reserved for internal use */
}

// Enums
enum ScaleMode : const CInt {
  INVALID = -1,
  NEAREST,  /**< nearest pixel sampling */
  LINEAR,   /**< linear filtering */
  PIXELART  /**< nearest pixel sampling with improved scaling for pixel art, available since SDL 3.4.0 */
}

// Functions
extern fn bool addSurfaceAlternateImage(Surface* surface, Surface* image) @extern("SDL_AddSurfaceAlternateImage");
extern fn bool blitSurface(Surface* src, Rect* srcrect, Surface* dst, Rect* dstrect) @extern("SDL_BlitSurface");
extern fn bool blitSurface9Grid(Surface* src, Rect* srcrect, int left_width, int right_width, int top_height, int bottom_height, float scale, ScaleMode scaleMode, Surface* dst, Rect* dstrect) @extern("SDL_BlitSurface9Grid");
extern fn bool blitSurfaceScaled(Surface* src, Rect* srcrect, Surface* dst, Rect* dstrect, ScaleMode scaleMode) @extern("SDL_BlitSurface");
extern fn bool blitSurfaceTiled(Surface* src, Rect* srcrect, Surface* dst, Rect* dstrect) @extern("SDL_BlitSurfaceTiled");
extern fn bool blitSurfaceTiledWithScale(Surface* src, Rect* srcrect, float scale, ScaleMode scaleMode, Surface* dst, Rect* dstrect) @extern("SDL_BlitSurfaceTiledWithScale");
extern fn bool blitSurfaceUnchecked(Surface* src, Rect* srcrect, Surface* dst, Rect* dstrect) @extern("SDL_BlitSurfaceUnchecked");
extern fn bool blitSurfaceUncheckedScaled(Surface* src, Rect* srcrect, Surface* dst, Rect* dstrect, ScaleMode scaleMode) @extern("SDL_BlitSurfaceUncheckedScaled");
extern fn bool clearSurface(Surface* surface, float r, float g, float b, float a) @extern("SDL_ClearSurface");
extern fn bool convertPixels(int width, int height, PixelFormat src_format, void* src, int src_pitch, PixelFormat dst_format, void* dst, int dst_pitch) @extern("SDL_ConvertPixels");
extern fn bool convertPixelsAndColorspace(int width, int height, PixelFormat src_format, Colorspace src_colorspace, PropertiesID src_properties, void* src, int src_pitch, PixelFormat dst_format, Colorspace dst_colorspace, PropertiesID dst_properties, void* dst, int dst_pitch) @extern("SDL_ConvertPixelsAndColorspace");
extern fn Surface* convertSurface(Surface* surface, PixelFormat format) @extern("SDL_ConvertSurface");
extern fn Surface* convertSurfaceAndColorspace(Surface* surface, PixelFormat format, Palette* palette, Colorspace colorspace, PropertiesID props) @extern("SDL_ConvertSurfaceAndColorspace");
extern fn Surface* createSurface(int width, int height, PixelFormat format) @extern("SDL_CreateSurface");
extern fn Surface* createSurfaceFrom(int width, int height, PixelFormat format, void* pixels, int pitch) @extern("SDL_CreateSurfaceFrom");
extern fn Palette* createSurfacePalette(Surface* surface) @extern("SDL_CreateSurfacePalette");
extern fn void destroySurface(Surface* surface) @extern("SDL_DestroySurface");
extern fn Surface* duplicateSurface(Surface* surface) @extern("SDL_DuplicateSurface");
extern fn bool fillSurfaceRect(Surface* dst, Rect* rect, uint color) @extern("SDL_FillSurfaceRect");
extern fn bool fillSurfaceRects(Surface* dst, Rect* rects, int count, uint color) @extern("SDL_FillSurfaceRects");
extern fn bool flipSurface(Surface* surface, FlipMode flip) @extern("SDL_FlipSurface");
extern fn bool getSurfaceAlphaMod(Surface* surface, char* alpha) @extern("SDL_GetSurfaceAlphaMod");
extern fn bool getSurfaceBlendMode(Surface* surface, BlendMode* blendMode) @extern("SDL_GetSurfaceBlendMode");
extern fn bool getSurfaceClipRect(Surface* surface, Rect* rect) @extern("SDL_GetSurfaceClipRect");
extern fn bool getSurfaceColorKey(Surface* surface, uint* key);
extern fn bool getSurfaceColorMod(Surface* surface, char* r, char* g, char* b) @extern("SDL_GetSurfaceColorMod");
extern fn Colorspace getSurfaceColorspace(Surface* surface) @extern("SDL_GetSurfaceColorspace");
extern fn Surface** getSurfaceImages(Surface* surface, int* count) @extern("SDL_GetSurfaceImages");
extern fn Palette* getSurfacePalette(Surface* surface) @extern("SDL_GetSurfacePalette");
extern fn PropertiesID getSurfaceProperties(Surface* surface) @extern("SDL_GetSurfaceProperties");
extern fn Surface* loadBMP(char* file) @extern("SDL_LoadBMP");
extern fn Surface* loadBMP_IO(IOStream* src, bool closeio) @extern("SDL_LoadBMP_IO");
extern fn Surface* loadPNG(char* file) @extern("SDL_LoadPNG");
extern fn Surface* loadPNG_IO(IOStream* src, bool closeio) @extern("SDL_LoadPNG_IO");
extern fn Surface* loadSurface(char* file) @extern("SDL_LoadSurface");
extern fn Surface* loadSurface_IO(IOStream* src, bool closeio) @extern("SDL_LoadSurface_IO");
extern fn bool lockSurface(Surface* surface) @extern("SDL_LockSurface");
extern fn uint mapSurfaceRGB(Surface* surface, char r, char g, char b) @extern("SDL_MapSurfaceRGB");
extern fn uint mapSurfaceRGBA(Surface* surface, char r, char g, char b, char a) @extern("SDL_MapSurfaceRGBA");
extern fn bool premultiplyAlpha(int width, int height, PixelFormat src_format, void* src, int src_pitch, PixelFormat dst_format, void* dst, int dst_pitch, bool linear) @extern("SDL_PremultiplyAlpha");
extern fn bool premultiplySurfaceAlpha(Surface* surface, bool linear) @extern("SDL_PremultiplySurfaceAlpha");
extern fn bool readSurfacePixel(Surface* surface, int x, int y, char* r, char* g, char* b, char* a) @extern("SDL_ReadSurfacePixel");
extern fn bool readSurfacePixelFloat(Surface* surface, int x, int y, float* r, float* g, float* b, float* a) @extern("SDL_ReadSurfacePixelFloat");
extern fn void removeSurfaceAlternateImages(Surface* surface) @extern("SDL_RemoveSurfaceAlternateImages");
extern fn Surface* rotateSurface(Surface* surface, float angle) @extern("SDL_RotateSurface");
extern fn bool saveBMP(Surface* surface, char* file) @extern("SDL_SaveBMP");
extern fn bool saveBMP_IO(Surface* surface, IOStream* dst, bool closeio) @extern("SDL_SaveBMP_IO");
extern fn bool savePNG(Surface* surface, char* file) @extern("SDL_SavePNG");
extern fn bool savePNG_IO(Surface* surface, IOStream* dst, bool closeio) @extern("SDL_SavePNG_IO");
extern fn Surface* scaleSurface(Surface* surface, int width, int height, ScaleMode scaleMode) @extern("SDL_ScaleSurface");
extern fn bool setSurfaceAlphaMod(Surface* surface, char alpha) @extern("SDL_SetSurfaceAlphaMod");
extern fn bool setSurfaceBlendMode(Surface* surface, BlendMode blendMode) @extern("SDL_SetSurfaceBlendMode");
extern fn bool setSurfaceClipRect(Surface* surface, Rect* rect) @extern("SDL_SetSurfaceClipRect");
extern fn bool setSurfaceColorKey(Surface* surface, bool enabled, uint key) @extern("SDL_SetSurfaceColorKey");
extern fn bool setSurfaceColorMod(Surface* surface, char r, char g, char b) @extern("SDL_SetSurfaceColorMod");
extern fn bool setSurfaceColorspace(Surface* surface, Colorspace colorspace) @extern("SDL_SetSurfaceColorspace");
extern fn bool setSurfacePalette(Surface* surface, Palette* palette) @extern("SDL_SetSurfacePalette");
extern fn bool setSurfaceRLE(Surface* surface, bool enabled) @extern("SDL_SetSurfaceRLE");
extern fn bool stretchSurface(Surface* src, Rect* srcrect, Surface* dst, Rect* dstrect, ScaleMode scaleMode) @extern("SDL_StretchSurface");
extern fn bool surfaceHasAlternateImages(Surface* surface) @extern("SDL_SurfaceHasAlternateImages");
extern fn bool surfaceHasColorKey(Surface* surface) @extern("SDL_SurfaceHasColorKey");
extern fn bool surfaceHasRLE(Surface* surface) @extern("SDL_SurfaceHasRLE");
extern fn void unlockSurface(Surface* surface) @extern("SDL_UnlockSurface");
extern fn bool writeSurfacePixel(Surface* surface, int x, int y, char r, char g, char b, char a) @extern("SDL_WriteSurfacePixel");
extern fn bool writeSurfacePixelFloat(Surface* surface, int x, int y, float r, float g, float b, float a) @extern("SDL_WriteSurfacePixelFloat");

