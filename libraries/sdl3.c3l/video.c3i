
module sdl3;

// Types
alias DisplayID = uint;
alias DisplayModeData = void;
alias EGLAttrib = int*;
alias EGLAttribArrayCallback = fn EGLAttrib(void* userdata);
alias EGLConfig = void*;
alias EGLDisplay = void*;
alias EGLint = int;
alias EGLIntArrayCallback = fn EGLint(void *userdata, EGLDisplay display, EGLConfig config);
alias EGLSurface = void*;
alias GLContext = void;
alias HitTest = fn HitTestResult(Window *win, Point* area, void* data);
alias Window = void;
alias WindowID = uint;

// Bitstructs
bitstruct GLContextFlag : uint {
  bool debug;
  bool forwardCompat;
  bool robustAccess;
  bool resetIsolation;
}
bitstruct GLContextReleaseFlag : uint {
  bool none;
  bool flush;
}
bitstruct GLContextResetNotification : uint {
  bool noNotification;
  bool loseContext;
}
bitstruct GLProfile : uint {
  bool core;
  bool compat;
  bool es;
}
bitstruct WindowFlags : ulong {
  bool fullscreen;
  bool opengl;
  bool occluded;
  bool hidden;
  bool borderless;
  bool resizable;
  bool minimized;
  bool maximized;
  bool inputFocus;
  bool mouseFocus;
  bool external;
  bool modal;
  bool highPixelDensity;
  bool mouseCapture;
  bool mouseRelativeMode;
  bool alwaysOnTop;
  bool utility;
  bool tooltip;
  bool popupMenu;
  bool keyboardGrabbed;
  bool fillDocument;
  bool vulkan;
  bool metal;
  bool transparent;
  bool notFocusable;
}

// Structs
struct DisplayMode {
  DisplayID displayID;
  PixelFormat format;
  int w, h;
  float pixelDensity;
  float refreshRate;
  int refreshRateNumerator;
  int refreshRateDenominator;
  DisplayModeData* internal;
}

// Enums
enum DisplayOrientation {
  UNKNOWN,
  LANDSCAPE,
  LANDSCAPE_FLIPPED,
  PORTRAIT,
  PORTRAIT_FLIPPED,
}
enum FlashOperation {
  CANCEL,
  BRIEFLY,
  UNTIL_FOCUSED,
}
enum GLAttr {
  RED_SIZE,                    /**< the minimum number of bits for the red channel of the color buffer; defaults to 8. */
  GREEN_SIZE,                  /**< the minimum number of bits for the green channel of the color buffer; defaults to 8. */
  BLUE_SIZE,                   /**< the minimum number of bits for the blue channel of the color buffer; defaults to 8. */
  ALPHA_SIZE,                  /**< the minimum number of bits for the alpha channel of the color buffer; defaults to 8. */
  BUFFER_SIZE,                 /**< the minimum number of bits for frame buffer size; defaults to 0. */
  DOUBLEBUFFER,                /**< whether the output is single or double buffered; defaults to double buffering on. */
  DEPTH_SIZE,                  /**< the minimum number of bits in the depth buffer; defaults to 16. */
  STENCIL_SIZE,                /**< the minimum number of bits in the stencil buffer; defaults to 0. */
  ACCUM_RED_SIZE,              /**< the minimum number of bits for the red channel of the accumulation buffer; defaults to 0. */
  ACCUM_GREEN_SIZE,            /**< the minimum number of bits for the green channel of the accumulation buffer; defaults to 0. */
  ACCUM_BLUE_SIZE,             /**< the minimum number of bits for the blue channel of the accumulation buffer; defaults to 0. */
  ACCUM_ALPHA_SIZE,            /**< the minimum number of bits for the alpha channel of the accumulation buffer; defaults to 0. */
  STEREO,                      /**< whether the output is stereo 3D; defaults to off. */
  MULTISAMPLEBUFFERS,          /**< the number of buffers used for multisample anti-aliasing; defaults to 0. */
  MULTISAMPLESAMPLES,          /**< the number of samples used around the current pixel used for multisample anti-aliasing. */
  ACCELERATED_VISUAL,          /**< set to 1 to require hardware acceleration, set to 0 to force software rendering; defaults to allow either. */
  RETAINED_BACKING,            /**< not used (deprecated). */
  CONTEXT_MAJOR_VERSION,       /**< OpenGL context major version. */
  CONTEXT_MINOR_VERSION,       /**< OpenGL context minor version. */
  CONTEXT_FLAGS,               /**< some combination of 0 or more of elements of the SDL_GLContextFlag enumeration; defaults to 0. */
  CONTEXT_PROFILE_MASK,        /**< type of GL context (Core, Compatibility, ES). See SDL_GLProfile; default value depends on platform. */
  SHARE_WITH_CURRENT_CONTEXT,  /**< OpenGL context sharing; defaults to 0. */
  FRAMEBUFFER_SRGB_CAPABLE,    /**< requests sRGB capable visual; defaults to 0. */
  CONTEXT_RELEASE_BEHAVIOR,    /**< sets context the release behavior. See SDL_GLContextReleaseFlag; defaults to FLUSH. */
  CONTEXT_RESET_NOTIFICATION,  /**< set context reset notification. See SDL_GLContextResetNotification; defaults to NO_NOTIFICATION. */
  CONTEXT_NO_ERROR,
  FLOATBUFFERS,
  EGL_PLATFORM,
}
enum HitTestResult {
  NORMAL,             /**< Region is normal. No special properties. */
  DRAGGABLE,          /**< Region can drag entire window. */
  RESIZE_TOPLEFT,     /**< Region is the resizable top-left corner border. */
  RESIZE_TOP,         /**< Region is the resizable top border. */
  RESIZE_TOPRIGHT,    /**< Region is the resizable top-right corner border. */
  RESIZE_RIGHT,       /**< Region is the resizable right border. */
  RESIZE_BOTTOMRIGHT, /**< Region is the resizable bottom-right corner border. */
  RESIZE_BOTTOM,      /**< Region is the resizable bottom border. */
  RESIZE_BOTTOMLEFT,  /**< Region is the resizable bottom-left corner border. */
  RESIZE_LEFT,        /**< Region is the resizable left border. */
}
enum ProgressState : const CInt {
  INVALID = -1,      /**< An invalid progress state indicating an error; check SDL_GetError() */
  NONE = 0,          /**< No progress bar is shown */
  INDETERMINATE = 1, /**< The progress bar is shown in a indeterminate state */
  NORMAL = 2,        /**< The progress bar is shown in a normal state */
  PAUSED = 3,        /**< The progress bar is shown in a paused state */
  ERROR = 4,         /**< The progress bar is shown in a state indicating the application had an error */
}
enum SystemTheme {
  UNKNOWN,   /**< Unknown system theme */
  LIGHT,     /**< Light colored system theme */
  DARK       /**< Dark colored system theme */
}

// Functions
extern fn Window* createPopupWindow(Window* parent, int offset_x, int offset_y, int w, int h, WindowFlags flags) @extern("SDL_CreatePopupWindow");
extern fn Window* createWindow(char* title, int w, int h, WindowFlags flags) @extern("SDL_CreateWindow");
extern fn Window* createWindowWithProperties(PropertiesID props) @extern("SDL_CreateWidnowWithProperties");
extern fn void destroyWindow(Window* window) @extern("SDL_DestroyWindow");
extern fn bool destroyWindowSurface(Window* window) @extern("SDL_DestroyWindowSurface");
extern fn bool disableScreenSaver() @extern("SDL_DisableScreenSaver");
extern fn bool enableScreenSaver() @extern("SDL_EnableScreenSaver");
extern fn bool flashWindow(Window* window, FlashOperation operation) @extern("SDL_FlashWindow");
extern fn bool getClosestFullscreenDisplayMode(
  DisplayID displayID,
  int w, int h,
  float refresh_rate,
  bool include_high_density_modes,
  DisplayMode* closest) @extern("SDL_GetClosestFullscreenDisplayMode");
extern fn DisplayMode* getCurrentDisplayMode(DisplayID displayID) @extern("SDL_GetCurrentDisplayMode");
extern fn DisplayOrientation getCurrentDisplayOrientation(DisplayID displayID) @extern("SDL_GetCurrentDisplayOrientation");
extern fn char* getCurrentVideoDriver() @extern("SDL_GetCurrentVideoDriver");
extern fn DisplayMode* getDesktopDisplayMode(DisplayID displayID) @extern("SDL_GetDesktopDisplayMode");
extern fn bool getDisplayBounds(DisplayID displayID, Rect* rect) @extern("SDL_GetDisplayBounds");
extern fn float getDisplayContentScale(DisplayID displayID) @extern("SDL_GetDisplayContentScale");
extern fn DisplayID getDisplayForPoint(Point* point) @extern("SDL_GetDisplayForPoint");
extern fn DisplayID getDisplayForRect(Rect* rect) @extern("SDL_GetDisplayForRect");
extern fn DisplayID getDisplayForWindow(Window* window) @extern("SDL_GetDisplayForWindow");
extern fn char* getDisplayName(DisplayID displayID) @extern("SDL_GetDisplayName");
extern fn PropertiesID getDisplayProperties(DisplayID displayID) @extern("SDL_GetDisplayProperties");
extern fn DisplayID* getDisplays(int* count) @extern("SDL_GetDisplays");
extern fn bool getDisplayUsableBounds(DisplayID displayID, Rect* rect) @extern("SDL_GetDisplayUsableBounds");
extern fn DisplayMode** getFullscreenDisplayModes(DisplayID displayID, int* count) @extern("SDL_GetFullscreenDisplayModes");
extern fn Window* getGrabbedWindow() @extern("SDL_GetGrabbedWindow");
extern fn DisplayOrientation getNaturalDisplayOrientation(DisplayID displayID) @extern("SDL_GetNaturalDisplayOrientation");
extern fn int getNumVideoDrivers() @extern("SDL_GetNumVideoDrivers");
extern fn DisplayID getPrimaryDisplay() @extern("SDL_GetPrimaryDisplay");
extern fn SystemTheme getSystemTheme() @extern("SDL_GetSystemTheme");
extern fn char* getVideoDriver(int index) @extern("SDL_GetVideoDriver");
extern fn bool getWindowAspectRatio(Window* window, float* min_aspect, float* max_aspect) @extern("SDL_GetWindowAspectRatio");
extern fn bool getWindowBordersSize(Window* window, int* top, int* left, int* bottom, int* right) @extern("SDL_GetWindowBordersSize");
extern fn float getWindowDisplayScale(Window* window) @extern("SDL_GetWindowDisplayScale");
extern fn WindowFlags getWindowFlags(Window* window) @extern("SDL_GetWindowFlags");
extern fn Window* getWindowFromID(WindowID id) @extern("SDL_GetWindowFromID");
extern fn DisplayMode* getWindowFullscreenMode(Window* window) @extern("SDL_GetWindowFullscreenMode");
extern fn void* getWindowICCProfile(Window* window, usz* size) @extern("SDL_GetWindowICCProfile");
extern fn WindowID getWindowID(Window* window) @extern("SDL_GetWindowID");
extern fn bool getWindowKeyboardGrab(Window* window) @extern("SDL_GetWindowKeyboardGrab");
extern fn bool getWindowMaximumSize(Window* window, int* w, int* h) @extern("SDL_GetWindowMaximumSize");
extern fn bool getWindowMinimumSize(Window* window, int* w, int* h) @extern("SDL_GetWindowMinimumSize");
extern fn bool getWindowMouseGrab(Window* window) @extern("SDL_GetWindowMouseGrab");
extern fn Rect* getWindowMouseRect(Window* window) @extern("SDL_GetWindowMouseRect");
extern fn float getWindowOpacity(Window* window) @extern("SDL_GetWindowOpacity");
extern fn Window* getWindowParent(Window* window) @extern("SDL_GetWindowParent");
extern fn float getWindowPixelDensity(Window* window) @extern("SDL_GetWindowPixelDensity");
extern fn PixelFormat getWindowPixelFormat(Window* window) @extern("SDL_GetWindowPixelFormat");
extern fn bool getWindowPosition(Window* window, int* x, int* y) @extern("SDL_GetWindowPosition");
extern fn ProgressState getProgressState(Window* window) @extern("SDL_GetWindowProgressState");
extern fn float getProgressValue(Window* window) @extern("SDL_GetWindowProgressValue");
extern fn PropertiesID getWindowProperties(Window* window) @extern("SDL_GetWindowProperties");
extern fn Window** getWindows(int* count) @extern("SDL_GetWindows");
extern fn bool getWindowSafeArea(Window* window, Rect* rect) @extern("SDL_GetWindowSafeArea");
extern fn bool getWindowSize(Window* window, int* w, int* h) @extern("SDL_GetWindowSize");
extern fn bool getWindowSizeInPixels(Window* window, int* w, int* h) @extern("SDL_GetWindowSizeInPixels");
extern fn Surface* getWindowSurface(Window* window) @extern("SDL_GetWindowSurface");
extern fn bool getWindowSurfaceVSync(Window* window, int* vsync) @extern("SDL_GetWindowSurfaceVSync");
extern fn char* getWindowTitle(Window* window) @extern("SDL_GetWindowTitle");
extern fn bool hideWindow(Window* window) @extern("SDL_HideWindow");
extern fn bool maximizeWindow(Window* window) @extern("SDL_MaximizeWindow");
extern fn bool minimizeWindow(Window* window) @extern("SDL_MinimizeWindow");
extern fn bool raiseWindow(Window* window) @extern("SDL_RaiseWindow");
extern fn bool restoreWindow(Window* window) @extern("SDL_RestoreWindow");
extern fn bool screenSaverEnabled() @extern("SDL_ScreenSaverEnabled");
extern fn bool setWindowAlwaysOnTop(Window* window, bool on_top) @extern("SDL_SetWindowAlwaysOnTop");
extern fn bool setWindowAspectRatio(Window* window, float min_aspect, float max_aspect) @extern("SDL_SetWindowAspectRatio");
extern fn bool setWindowBordered(Window* window, bool bordered) @extern("SDL_SetWindowBordered");
extern fn bool setWindowFillDocument(Window* window, bool fill) @extern("SDL_SetWindowFillDocument");
extern fn bool setFocusable(Window* window, bool focusable) @extern("SDL_SetWindowFocusable");
extern fn bool setWindowFullscreen(Window* window, bool fullscreen) @extern("SDL_SetWindowFullscreen");
extern fn bool setWindowFullscreenMode(Window* window, DisplayMode* mode) @extern("SDL_SetWindowFullscreenMode");
extern fn bool setWindowHitTest(Window* window, HitTest callback, void* callback_data) @extern("SDL_SetWindowHitTest");
extern fn bool setWindowIcon(Window* window, Surface* icon) @extern("SDL_SetWindowIcon");
extern fn bool setWindowKeyboardGrab(Window* window, bool grabbed) @extern("SDL_SetWindowKeyboardGrab");
extern fn bool setWindowMaximumSize(Window* window, int max_w, int max_h) @extern("SDL_SetWindowMaximumSize");
extern fn bool setWindowMinimumSize(Window* window, int max_w, int max_h) @extern("SDL_SetWindowMinimumSize");
extern fn bool setWindowModal(Window *window, bool modal) @extern("SDL_SetWindowModal");
extern fn bool setWindowMouseGrab(Window* window, bool grabbed) @extern("SDL_SetWindowMouseGrab");
extern fn bool setWindowMouseRect(Window* window, Rect* rect) @extern("SDL_SetWindowMouseRect");
extern fn bool setWindowOpacity(Window* window, float opacity) @extern("SDL_SetWindowOpacity");
extern fn bool setWindowParent(Window* window, Window* parent) @extern("SDL_SetWindowParent");
extern fn bool setWindowPosition(Window* window, int x, int y) @extern("SDL_SetWindowPosition");
extern fn bool setProgressState(Window* window, ProgressState state) @extern("SDL_SetWindowProgressState");
extern fn bool setProgressValue(Window* window, float value) @extern("SDL_SetWindowProgressValue");
extern fn bool setWindowResizeable(Window* window, bool resizable) @extern("SDL_SetWindowResizable");
extern fn bool setWindowShape(Window* window, Surface* shape) @extern("SDL_SetWindowShape");
extern fn bool setWindowSize(Window* window, int w, int h) @extern("SDL_SetWindowSize");
extern fn bool setWindowSurfaceVSync(Window* window, int vsync) @extern("SDL_SetWindowSurfaceVSync");
extern fn bool setWindowTitle(Window* window, char* title) @extern("SDL_SetWindowTitle");
extern fn bool showWindow(Window* window) @extern("SDL_ShowWindow");
extern fn bool showWindowSystemMenu(Window* window, int x, int y) @extern("SDL_ShowWindowSystemMenu");
extern fn bool syncWindow(Window* window) @extern("SDL_SyncWindow");
extern fn bool updateWindowSurface(Window* window) @extern("SDL_UpdateWindowSurface");
extern fn bool updateWindowSurfaceRects(Window* window, Rect* rects, int numrects) @extern("SDL_UpdateWindowSurfaceRects");
extern fn bool windowHasSurface(Window* window) @extern("SDL_WindowHasSurface");


module sdl3::sdlgl;

// Types
alias Profile = uint;
const Profile CONTEXT_PROFILE_CORE          = 0x0001;
const Profile CONTEXT_PROFILE_COMPATIBILITY = 0x0002;
const Profile CONTEXT_PROFILE_ES            = 0x0004;

// Functions
extern fn GLContext* createContext(Window* window) @extern("SDL_GL_CreateContext");
extern fn bool destroyContext(GLContext* context) @extern("SDL_GL_DestroyContext");
extern fn bool extensionSupported(char* extension) @extern("SDL_GL_ExtensionSupported");
extern fn bool getAttribute(GLAttr attr, int* value) @extern("SDL_GL_GetAttribute");
extern fn GLContext getCurrentContext() @extern("SDL_GL_GetCurrentContext");
extern fn Window* getCurrentWindow() @extern("SDL_GL_GetCurrentWindow");
extern fn FunctionPointer getProcAddress(char* proc) @extern("SDL_GL_GetProcAddress");
extern fn bool getSwapInterval(int* interval) @extern("SDL_GL_GetSwapInterval");
extern fn bool loadLibrary(char* path) @extern("SDL_GL_LoadLibrary");
extern fn bool makeCurrent(Window* window, GLContext* context) @extern("SDL_GL_MakeCurrent");
extern fn void resetAttributes() @extern("SDL_GL_ResetAttributes");
extern fn bool setAttribute(GLAttr attr, int value) @extern("SDL_GL_SetAttribute");
extern fn bool setSwapInterval(int interval) @extern("SDL_GL_SetSwapInterval");
extern fn bool swapWindow(Window* window) @extern("SDL_GL_SwapWindow");
extern fn void unloadLibrary() @extern("SDL_GL_UnloadLibrary");


module sdl3::egl;

extern fn EGLConfig getCurrentConfig() @extern("SDL_EGL_GetCurrentConfig");
extern fn EGLDisplay getCurrentDisplay() @extern("SDL_EGL_GetCurrentDisplay");
extern fn FunctionPointer getProcAddress(char* proc) @extern("SDL_EGL_GetProcAddress");
extern fn Surface getWindowSurface(Window* window) @extern("SDL_EGL_GetWindowSurface");
extern fn void setAttributeCallbacks(
  EGLAttribArrayCallback platformAttribCallback,
  EGLIntArrayCallback surfaceAttribCallback,
  EGLIntArrayCallback contextAttribCallback,
  void* userdata) @extern("SDL_EGL_SetAttributeCallbacks");







