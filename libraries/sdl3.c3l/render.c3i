
module sdl3;

// Types
alias GPURenderState = void;
alias Renderer = void;

// Structs
struct GPURenderStateCreateInfo {
  GPUShader* fragment_shader; /**< The fragment shader to use when this render state is active */

  int num_sampler_bindings;    /**< The number of additional fragment samplers to bind when this render state is active */
  GPUTextureSamplerBinding* sampler_bindings;   /**< Additional fragment samplers to bind when this render state is active */

  int num_storage_textures;    /**< The number of storage textures to bind when this render state is active */
  GPUTexture** storage_textures;    /**< Storage textures to bind when this render state is active */

  int num_storage_buffers;     /**< The number of storage buffers to bind when this render state is active */
  GPUBuffer** storage_buffers;      /**< Storage buffers to bind when this render state is active */

  PropertiesID props;         /**< A properties ID for extensions. Should be 0 if no extensions are needed. */
}
struct Texture {
  PixelFormat format;     /**< The format of the texture, read-only */
  int w;                  /**< The width of the texture, read-only. */
  int h;                  /**< The height of the texture, read-only. */

  int refcount;           /**< Application reference count, used when freeing texture */
}
struct Vertex {
  FPoint position;        /**< Vertex position, in SDL_Renderer coordinates  */
  FColor color;           /**< Vertex color */
  FPoint tex_coord;       /**< Normalized texture coordinates, if needed */
}

// Enums
enum RendererLogicalPresentation {
  DISABLED,  /**< There is no logical size in effect */
  STRETCH,   /**< The rendered content is stretched to the output resolution */
  LETTERBOX, /**< The rendered content is fit to the largest dimension and the other dimension is letterboxed with the clear color */
  OVERSCAN,  /**< The rendered content is fit to the smallest dimension and the other dimension extends beyond the output bounds */
  INTEGER_SCALE,   /**< The rendered content is scaled up by integer multiples to fit the output resolution */
}
enum TextureAccess {
  STATIC,    /**< Changes rarely, not lockable */
  STREAMING, /**< Changes frequently, lockable */
  TARGET,    /**< Texture can be used as a render target */
}
enum TextureAddressMode : const CInt {
  INVALID = -1,
  AUTO    =  0, /**< Wrapping is enabled if texture coordinates are outside [0, 1], this is the default */
  CLAMP   =  1, /**< Texture coordinates are clamped to the [0, 1] range */
  WRAP    =  2, /**< The texture is repeated (tiled) */
}
enum RendererVSync : const CInt {
  DISABLED =  0,
  ADAPTIVE = -1,
}

// Functions
extern fn bool addVulkanRenderSemaphores(Renderer* renderer, uint wait_stage_mask, long wait_semaphore, long signal_semaphore) @extern("SDL_AddVulkanRenderSemaphores");
extern fn bool convertEventToRenderCoordinates(Renderer* renderer, Event* event) @extern("SDL_ConvertEventToRenderCoordinates");
extern fn Renderer* createGPURenderer(GPUDevice* device, Window* window) @extern("SDL_CreateGPURenderer");
extern fn GPURenderState* createGPURenderState(Renderer* renderer, GPURenderStateCreateInfo* createinfo) @extern("SDL_CreateGPURenderState");
extern fn Renderer* createRenderer(Window* window, char* name) @extern("SDL_CreateRenderer");
extern fn Renderer* createRendererWithProperties(PropertiesID props) @extern("SDL_CreateRendererWithProperties");
extern fn Renderer* createSoftwareRenderer(Surface* surface) @extern("SDL_CreateSoftwareRenderer");
extern fn Texture* createTexture(Renderer* renderer, PixelFormat format, TextureAccess access, int w, int h) @extern("SDL_CreateTexture");
extern fn Texture* createTextureFromSurface(Renderer* renderer, Surface* surface) @extern("SDL_CreateTextureFromSurface");
extern fn Texture* createTextureWithProperties(Renderer* renderer, PropertiesID props) @extern("SDL_CreateTextureWithProperties");
extern fn bool createWindowAndRenderer(char* title, int width, int height, WindowFlags window_flags, Window** window, Renderer** renderer) @extern("SDL_CreateWindowAndRenderer");
extern fn void destroyGPURenderState(GPURenderState* state) @extern("SDL_DestroyGPURenderState");
extern fn void destroyRenderer(Renderer* renderer) @extern("SDL_DestroyRenderer");
extern fn void destroyTexture(Texture* texture) @extern("SDL_DestroyTexture");
extern fn bool flushRenderer(Renderer* renderer) @extern("SDL_FlushRenderer");
extern fn bool getCurrentRenderOutputSize(Renderer* renderer, int* w, int* h) @extern("SDL_GetCurrentRenderOutputSize");
extern fn bool getDefaultTextureScaleMode(Renderer* renderer, ScaleMode* scale_mode) @extern("SDL_GetDefaultTextureScaleMode");
extern fn GPUDevice* getGPURendererDevice(Renderer* renderer) @extern("SDL_GetGPURendererDevice");
extern fn int getNumRenderDrivers() @extern("SDL_GetNumRenderDrivers");
extern fn bool getRenderClipRect(Renderer* renderer, Rect* rect) @extern("SDL_GetRenderClipRect");
extern fn bool getRenderColorScale(Renderer* renderer, float* scale) @extern("SDL_GetRenderColorScale");
extern fn bool getRenderDrawBlendMode(Renderer* renderer, BlendMode* blendMode) @extern("SDL_GetRenderDrawBlendMode");
extern fn bool getRenderDrawColor(Renderer* renderer, char* r, char* g, char* b, char* a) @extern("SDL_GetRenderDrawColor");
extern fn bool getRenderDrawColorFloat(Renderer* renderer, float* r, float* g, float* b, float* a) @extern("SDL_GetRenderDrawColorFloat");
extern fn char* getRenderDriver(int index) @extern("SDL_GetRenderDriver");
extern fn Renderer* getRenderer(Window* window) @extern("SDL_GetRenderer");
extern fn Renderer* getRendererFromTexture(Texture* texture) @extern("SDL_GetRendererFromTexture");
extern fn char* getRendererName(Renderer* renderer) @extern("SDL_GetRendererName");
extern fn PropertiesID getRendererProperties(Renderer* renderer) @extern("SDL_GetRendererProperties");
extern fn bool getRenderLogicalPresentation(Renderer* renderer, int* w, int* h, RendererLogicalPresentation* mode) @extern("SDL_GetRenderLogicalPresentation");
extern fn bool getRenderLogicalPresentationRect(Renderer* renderer, FRect* rect) @extern("SDL_GetRenderLogicalPresentationRect");
extern fn void* getRenderMetalCommandEncoder(Renderer* renderer) @extern("SDL_GetRenderMetalCommandEncoder");
extern fn void* getRenderMetalLayer(Renderer* renderer) @extern("SDL_GetRenderMetalLayer");
extern fn bool getRenderOutputSize(Renderer* renderer, int* w, int* h) @extern("SDL_GetRenderOutputSize");
extern fn bool getRenderSafeArea(Renderer* renderer, Rect* rect) @extern("SDL_GetRenderSafeArea");
extern fn bool getRenderScale(Renderer* renderer, float* scaleX, float* scaleY) @extern("SDL_GetRenderScale");
extern fn Texture* getRenderTarget(Renderer* renderer) @extern("SDL_GetRenderTarget");
extern fn bool getRenderTextureAddressMode(Renderer* renderer, TextureAddressMode* u_mode, TextureAddressMode* v_mode) @extern("SDL_GetRenderTextureAddressMode");
extern fn bool getRenderViewport(Renderer* renderer, Rect* rect) @extern("SDL_GetRenderViewport");
extern fn bool getRenderVSync(Renderer* renderer, int* vsync) @extern("SDL_GetRenderVSync");
extern fn Window* getRenderWindow(Renderer* renderer) @extern("SDL_GetRenderWindow");
extern fn bool getTextureAlphaMod(Texture* texture, char* alpha) @extern("SDL_GetTextureAlphaMod");
extern fn bool getTextureAlphaModFloat(Texture* texture, float* alpha) @extern("SDL_GetTextureAlphaModFloat");
extern fn bool getTextureBlendMode(Texture* texture, BlendMode* blendMode) @extern("SDL_GetTextureBlendMode");
extern fn bool getTextureColorMod(Texture* texture, char* r, char* g, char* b) @extern("SDL_GetTextureColorMod");
extern fn bool getTextureColorModFloat(Texture* texture, float* r, float* g, float* b) @extern("SDL_GetTextureColorModFloat");
extern fn Palette* etTexturePalette(Texture* texture) @extern("SDL_GetTexturePalette");
extern fn PropertiesID getTextureProperties(Texture* texture) @extern("SDL_GetTextureProperties");
extern fn bool getTextureScaleMode(Texture* texture, ScaleMode* scaleMode) @extern("SDL_GetTextureScaleMode");
extern fn bool getTextureSize(Texture* texture, float* w, float* h) @extern("SDL_GetTextureSize");
extern fn bool lockTexture(Texture* texture, Rect* rect, void** pixels, int* pitch) @extern("SDL_LockTexture");
extern fn bool lockTextureToSurface(Texture* texture, Rect* rect, Surface** surface) @extern("SDL_LockTextureToSurface");
extern fn bool renderClear(Renderer* renderer) @extern("SDL_RenderClear");
extern fn bool renderClipEnabled(Renderer* renderer) @extern("SDL_RenderClipEnabled");
extern fn bool renderCoordinatesFromWindow(Renderer* renderer, float window_x, float window_y, float* x, float* y) @extern("SDL_RenderCoordinatesFromWindow");
extern fn bool renderCoordinatesToWindow(Renderer* renderer, float x, float y, float* window_x, float* window_y) @extern("SDL_RenderCoordinatesToWindow");
extern fn bool renderDebugText(Renderer* renderer, float x, float y, char* str) @extern("SDL_RenderDebugText");
extern fn bool renderDebugTextFormat(Renderer* renderer, float x, float y, char* fmt, ...) @extern("SDL_RenderDebugTextFormat");
extern fn bool renderFillRect(Renderer* renderer, FRect* rect) @extern("SDL_RenderFillRect");
extern fn bool renderFillRects(Renderer* renderer, FRect* rects, int count) @extern("SDL_RenderFillRects");
extern fn bool renderGeometry(Renderer* renderer, Texture* texture, Vertex* vertices, int num_vertices, int* indices, int num_indices) @extern("SDL_RenderGeometry");
extern fn bool renderGeometryRaw(Renderer* renderer, Texture* texture, float* xy, int xy_stride, FColor* color, int color_stride, float* uv, int uv_stride, int num_vertices, void* indices, int num_indices, int size_indices) @extern("SDL_RenderGeometryRaw");
extern fn bool renderLine(Renderer* renderer, float x1, float y1, float x2, float y2) @extern("SDL_RenderLine");
extern fn bool renderLines(Renderer* renderer, FPoint* points, int count) @extern("SDL_RenderLines");
extern fn bool renderPoint(Renderer* renderer, float x, float y) @extern("SDL_RenderPoint");
extern fn bool renderPoints(Renderer* renderer, FPoint* points, int count) @extern("SDL_RenderPoints");
extern fn bool renderPresent(Renderer* renderer) @extern("SDL_RenderPresent");
extern fn Surface* renderReadPixels(Renderer* renderer, Rect* rect) @extern("SDL_RenderReadPixels");
extern fn bool renderRect(Renderer* renderer, FRect* rect) @extern("SDL_RenderRect");
extern fn bool renderRects(Renderer* renderer, FRect* rects, int count) @extern("SDL_RenderRects");
extern fn bool renderTexture(Renderer* renderer, Texture* texture, FRect* srcrect, FRect* dstrect) @extern("SDL_RenderTexture");
extern fn bool renderTexture9Grid(Renderer* renderer, Texture* texture, FRect* srcrect, float left_width, float right_width, float top_height, float bottom_height, float scale, FRect* dstrect) @extern("SDL_RenderTexture9Grid");
extern fn bool renderTexture9GridTiled(Renderer* renderer, Texture* texture, FRect* srcrect, float left_width, float right_width, float top_height, float bottom_height, float scale, FRect* dstrect, float tileScale) @extern("SDL_RenderTexture9GridTiled");
extern fn bool renderTextureAffine(Renderer* renderer, Texture* texture, FRect* srcrect, FPoint* origin, FPoint* right, FPoint* down) @extern("SDL_RenderTextureAffine");
extern fn bool renderTextureRotated(Renderer* renderer, Texture* texture, FRect* srcrect, FRect* dstrect, double angle, FPoint* center, FlipMode flip) @extern("SDL_RenderTextureRotated");
extern fn bool renderTextureTiled(Renderer* renderer, Texture* texture, FRect* srcrect, float scale, FRect* dstrect) @extern("SDL_RenderTextureTiled");
extern fn bool renderViewportSet(Renderer* renderer) @extern("SDL_RenderViewportSet");
extern fn bool setDefaultTextureScaleMode(Renderer* renderer, ScaleMode scale_mode) @extern("SDL_SetDefaultTextureScaleMode");
extern fn bool setGPURenderState(Renderer* renderer, GPURenderState* state) @extern("SDL_SetGPURenderState");
extern fn bool setGPURenderStateFragmentUniforms(GPURenderState* state, uint slot_index, void* data, uint length) @extern("SDL_SetGPURenderStateFragmentUniforms");
extern fn bool setRenderClipRect(Renderer* renderer, Rect* rect) @extern("SDL_SetRenderClipRect");
extern fn bool setRenderColorScale(Renderer* renderer, float scale) @extern("SDL_SetRenderColorScale");
extern fn bool setRenderDrawBlendMode(Renderer* renderer, BlendMode blendMode) @extern("SDL_SetRenderDrawBlendMode");
extern fn bool setRenderDrawColor(Renderer* renderer, char r, char g, char b, char a) @extern("SDL_SetRenderDrawColor");
extern fn bool setRenderDrawColorFloat(Renderer* renderer, float r, float g, float b, float a) @extern("SDL_SetRenderDrawColorFloat");
extern fn bool setRenderLogicalPresentation(Renderer* renderer, int w, int h, RendererLogicalPresentation mode) @extern("SDL_SetRenderLogicalPresentation");
extern fn bool setRenderScale(Renderer* renderer, float scaleX, float scaleY) @extern("SDL_SetRenderScale");
extern fn bool setRenderTarget(Renderer* renderer, Texture* texture) @extern("SDL_SetRenderTarget");
extern fn bool setRenderTextureAddressMode(Renderer* renderer, TextureAddressMode u_mode, TextureAddressMode v_mode) @extern("SDL_SetRenderTextureAddressMode");
extern fn bool setRenderViewport(Renderer* renderer, Rect* rect) @extern("SDL_SetRenderViewport");
extern fn bool setRenderVSync(Renderer* renderer, RendererVSync vsync);
extern fn bool setTextureAlphaMod(Texture* texture, char alpha) @extern("SDL_SetTextureAlphaMod");
extern fn bool setTextureAlphaModFloat(Texture* texture, float alpha) @extern("SDL_SetTextureAlphaModFloat");
extern fn bool setTextureBlendMode(Texture* texture, BlendMode blendMode) @extern("SDL_SetTextureBlendMode");
extern fn bool setTextureColorMod(Texture* texture, char r, char g, char b) @extern("SDL_SetTextureColorMod");
extern fn bool setTextureColorModFloat(Texture* texture, float r, float g, float b) @extern("SDL_SetTextureColorModFloat");
extern fn bool setTexturePalette(Texture* texture, Palette* palette) @extern("SDL_SetTexturePalette");
extern fn bool setTextureScaleMode(Texture* texture, ScaleMode scaleMode) @extern("SDL_SetTextureScaleMode");
extern fn void unlockTexture(Texture* texture) @extern("SDL_UnlockTexture");
extern fn bool updateNVTexture(Texture* texture, Rect* rect, char* yplane, int ypitch, char* uvplane, int uvpitch) @extern("SDL_UpdateNVTexture");
extern fn bool updateTexture(Texture* texture, Rect* rect, void* pixels, int pitch) @extern("SDL_UpdateTexture");
extern fn bool updateYUVTexture(Texture* texture, Rect* rect, char* yplane, int ypitch, char* uplane, int upitch, char* vplane, int vpitch) @extern("SDL_UpdateYUVTexture");

