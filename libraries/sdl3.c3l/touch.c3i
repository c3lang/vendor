
module sdl3;

// Type
alias FingerID = ulong;
alias TouchID = ulong;

// Struct
struct Finger {
  FingerID id;    /**< the finger ID */
  float x;        /**< the x-axis location of the touch event, normalized (0...1) */
  float y;        /**< the y-axis location of the touch event, normalized (0...1) */
  float pressure; /**< the quantity of pressure applied, normalized (0...1) */
}

// Enums
enum TouchDeviceType : const CInt {
  INVALID = -1,
  DIRECT  =  0,           /**< touch screen with window-relative coordinates */
  INDIRECT_ABSOLUTE = 1,  /**< trackpad with absolute device coordinates */
  INDIRECT_RELATIVE = 2,  /**< trackpad with screen cursor-relative coordinates */
}

// Functions
extern fn char* getTouchDeviceName(TouchID touchID) @extern("SDL_GetTouchDeviceName");
extern fn TouchID* getTouchDevices(int* count) @extern("SDL_GetTouchDevices");
extern fn TouchDeviceType getTouchDeviceType(TouchID touchID) @extern("SDL_GetTouchDeviceType");
extern fn Finger** getTouchFingers(TouchID touchID, int* count) @extern("SDL_GetTouchFingers");


