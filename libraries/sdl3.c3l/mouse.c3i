
module sdl3;

// Types
alias Cursor = void;
alias MouseID = uint;
alias MouseMotionTransformCallback = fn void(void* userdata, ulong timestamp, Window* window, MouseID mouseID, float* x, float* y);

alias MouseButtonFlags = uint;

const MouseButtonFlags BUTTON_LEFT = 1;
const MouseButtonFlags BUTTON_MIDDLE = 2;
const MouseButtonFlags BUTTON_RIGHT = 3;
const MouseButtonFlags BUTTON_X1 = 4;
const MouseButtonFlags BUTTON_X2 = 5;

macro MouseButtonFlags @buttonMask(#a) {
  return 1u << ((#a) - 1);
}
const BUTTON_LMASK   = @buttonMask(BUTTON_LEFT);
const BUTTON_MMASK   = @buttonMask(BUTTON_MIDDLE);
const BUTTON_RMASK   = @buttonMask(BUTTON_RIGHT);
const BUTTON_X1MASK  = @buttonMask(BUTTON_X1);
const BUTTON_X2MASK  = @buttonMask(BUTTON_X2);

// Structs
struct CursorFrameInfo {
  Surface* surface; /**< The surface data for this frame */
  uint duration;    /**< The frame duration in milliseconds (a duration of 0 is infinite) */
}

// Enums
enum MouseWheelDirection {
  NORMAL,    /**< The scroll direction is normal */
  FLIPPED,   /**< The scroll direction is flipped / natural */
}
enum SystemCursor {
  DEFAULT,      /**< Default cursor. Usually an arrow. */
  TEXT,         /**< Text selection. Usually an I-beam. */
  WAIT,         /**< Wait. Usually an hourglass or watch or spinning ball. */
  CROSSHAIR,    /**< Crosshair. */
  PROGRESS,     /**< Program is busy but still interactive. Usually it's WAIT with an arrow. */
  NWSE_RESIZE,  /**< Double arrow pointing northwest and southeast. */
  NESW_RESIZE,  /**< Double arrow pointing northeast and southwest. */
  EW_RESIZE,    /**< Double arrow pointing west and east. */
  NS_RESIZE,    /**< Double arrow pointing north and south. */
  MOVE,         /**< Four pointed arrow pointing north, south, east, and west. */
  NOT_ALLOWED,  /**< Not permitted. Usually a slashed circle or crossbones. */
  POINTER,      /**< Pointer that indicates a link. Usually a pointing hand. */
  NW_RESIZE,    /**< Window resize top-left. This may be a single arrow or a double arrow like NWSE_RESIZE. */
  N_RESIZE,     /**< Window resize top. May be NS_RESIZE. */
  NE_RESIZE,    /**< Window resize top-right. May be NESW_RESIZE. */
  E_RESIZE,     /**< Window resize right. May be EW_RESIZE. */
  SE_RESIZE,    /**< Window resize bottom-right. May be NWSE_RESIZE. */
  S_RESIZE,     /**< Window resize bottom. May be NS_RESIZE. */
  SW_RESIZE,    /**< Window resize bottom-left. May be NESW_RESIZE. */
  W_RESIZE,     /**< Window resize left. May be EW_RESIZE. */
  COUNT,
}

// Functions
extern fn bool captureMouse(bool enabled) @extern("SDL_CaptureMouse");
extern fn Cursor* createAnimatedCursor(CursorFrameInfo* frames, int frame_count, int hot_x, int hot_y) @extern("SDL_CreateAnimatedCursor");
extern fn Cursor* createColorCursor(Surface* surface, int hot_x, int hot_y) @extern("SDL_CreateColorCursor");
extern fn Cursor* createCursor(char* data, char* mask, int w, int h, int hot_x, int hot_y) @extern("SDL_CreateCursor");
extern fn Cursor* createSystemCursor(SystemCursor id) @extern("SDL_CreateSystemCursor");
extern fn bool cursorVisible() @extern("SDL_CursorVisible");
extern fn void destroyCursor(Cursor* cursor) @extern("SDL_DestroyCursor");
extern fn Cursor* getCursor() @extern("SDL_GetCursor");
extern fn Cursor* getDefaultCursor() @extern("SDL_GetDefaultCursor");
extern fn MouseButtonFlags getGlobalMouseState(float* x, float* y) @extern("SDL_GetGlobalMouseState");
extern fn MouseID* getMice(int* count) @extern("SDL_GetMice");
extern fn Window* getMouseFocus() @extern("SDL_GetMouseFocus");
extern fn char* getMouseNameForID(MouseID instance_id) @extern("SDL_GetMouseNameForID");
extern fn MouseButtonFlags getMouseState(float* x, float* y) @extern("SDL_GetMouseState");
extern fn MouseButtonFlags getRelativeMouseState(float* x, float* y) @extern("SDL_GetRelativeMouseState");
extern fn bool getWindowRelativeMouseMode(Window* window) @extern("SDL_GetWindowRelativeMouseMode");
extern fn bool hasMouse() @extern("SDL_HasMouse");
extern fn bool hideCursor() @extern("SDL_HideCursor");
extern fn bool setCursor(Cursor* cursor) @extern("SDL_SetCursor");
extern fn bool setRelativeMouseTransform(MouseMotionTransformCallback callback, void* userdata) @extern("SDL_SetRelativeMouseTransform");
extern fn bool setWindowRelativeMouseMode(Window* window, bool enabled) @extern("SDL_SetWindowRelativeMouseMode");
extern fn bool showCursor() @extern("SDL_ShowCursor");
extern fn bool warpMouseGlobal(float x, float y) @extern("SDL_WarpMouseGlobal");
extern fn void warpMouseInWindow(Window* window, float x, float y) @extern("SDL_WarpMouseInWindow");

