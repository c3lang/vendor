
module sdl3;

// Types
alias Joystick = void;
alias JoystickID = uint;

alias Update = fn void(void* userdata);
alias SetPlayerIndex = fn void(void* userdata, int player_index);
alias Rumble = fn bool(void* userdata, ushort low_frequency_rumble, ushort high_frequency_rumble);
alias RumbleTriggers = fn bool(void *userdata, ushort left_rumble, ushort right_rumble);
alias SetLED = fn bool(void* userdata, char red, char green, char blue);
alias SendEffect = fn bool(void* userdata, void* data, int size);
alias SetSensorsEnabled = fn bool(void* userdata, bool enabled);
alias Cleanup = fn void(void* userdata);

// Bitstructs
bitstruct JoystickHat : int {
  bool up:    0;
  bool right: 1;
  bool down:  2;
  bool left:  3;
}

// Structs
struct VirtualJoystickDesc {
  uint version;       /**< the version of this interface */
  ushort type;        /**< `SDL_JoystickType` */
  ushort padding;     /**< unused */
  ushort vendor_id;   /**< the USB vendor ID of this joystick */
  ushort product_id;  /**< the USB product ID of this joystick */
  ushort naxes;       /**< the number of axes on this joystick */
  ushort nbuttons;    /**< the number of buttons on this joystick */
  ushort nballs;      /**< the number of balls on this joystick */
  ushort nhats;       /**< the number of hats on this joystick */
  ushort ntouchpads;  /**< the number of touchpads on this joystick, requires `touchpads` to point at valid descriptions */
  ushort nsensors;    /**< the number of sensors on this joystick, requires `sensors` to point at valid descriptions */
  ushort[2] padding2; /**< unused */
  uint button_mask;   /**< A mask of which buttons are valid for this controller
                             e.g. (1 << SDL_GAMEPAD_BUTTON_SOUTH) */
  uint axis_mask;     /**< A mask of which axes are valid for this controller
                             e.g. (1 << SDL_GAMEPAD_AXIS_LEFTX) */
  char* name;   /**< the name of the joystick */
  VirtualJoystickTouchpadDesc* touchpads;   /**< A pointer to an array of touchpad descriptions, required if `ntouchpads` is > 0 */
  VirtualJoystickSensorDesc* sensors;       /**< A pointer to an array of sensor descriptions, required if `nsensors` is > 0 */

  void* userdata;     /**< User data pointer passed to callbacks */
}
struct VirtualJoystickSensorDesc {
  SensorType type;    /**< the type of this sensor */
  float rate;             /**< the update frequency of this sensor, may be 0.0f */
}
struct VirtualJoystickTouchpadDesc {
  ushort nfingers;    /**< the number of simultaneous fingers on this touchpad */
  ushort[3] padding;
}

// Enums
enum JoystickConnectionState : const CInt {
  INVALID  = -1,
  UNKNOWN  =  0,
  WIRED    =  1,
  WIRELESS =  2,
}
enum JoystickType {
  UNKNOWN,
  GAMEPAD,
  WHEEL,
  ARCADE_STICK,
  FLIGHT_STICK,
  DANCE_PAD,
  GUITAR,
  DRUM_KIT,
  ARCADE_PAD,
  THROTTLE,
  COUNT,
}

// Functions
extern fn JoystickID attachVirtualJoystick(VirtualJoystickDesc* desc) @extern("SDL_AttachVirtualJoystick");
extern fn void closeJoystick(Joystick* joystick) @extern("SDL_CloseJoystick");
extern fn bool detachVirtualJoystick(JoystickID instance_id) @extern("SDL_DetachVirtualJoystick");
extern fn short getJoystickAxis(Joystick* joystick, int axis) @extern("SDL_GetJoystickAxis");
extern fn bool getJoystickAxisInitialState(Joystick* joystick, int axis, short* state) @extern("SDL_GetJoystickAxisInitialState");
extern fn bool getJoystickBall(Joystick* joystick, int ball, int* dx, int* dy) @extern("SDL_GetJoystickBall");
extern fn bool getJoystickButton(Joystick* joystick, int button) @extern("SDL_GetJoystickButton");
extern fn JoystickConnectionState getJoystickConnectionState(Joystick* joystick) @extern("SDL_JoystickConnectionState");
extern fn ushort getJoystickFirmwareVersion(Joystick* joystick) @extern("SDL_GetJoystickFirmwareVersion");
extern fn Joystick* getJoystickFromID(JoystickID instance_id) @extern("SDL_GetJoystickFromID");
extern fn Joystick* getJoystickFromPlayerIndex(int player_index) @extern("SDL_GetJoystickFromPlayerIndex");
extern fn GuID getJoystickGUID(Joystick* joystick) @extern("SDL_GetJoystickGUID");
extern fn GuID getJoystickGUIDForID(JoystickID instance_id) @extern("SDL_GetJoystickGUIDForID");
extern fn void getJoystickGUIDInfo(GuID guid, ushort* vendor, ushort* product, ushort* version, ushort* crc16) @extern("SDL_GetJoystickGUIDInfo");
extern fn char getJoystickHat(Joystick* joystick, JoystickHat hat) @extern("SDL_GetJoystickHat");
extern fn JoystickID getJoystickID(Joystick* joystick) @extern("SDL_GetJoystickID");
extern fn char* getJoystickName(Joystick* joystick) @extern("SDL_GetJoystickName");
extern fn char* getJoystickNameForID(JoystickID instance_id) @extern("SDL_GetJoystickNameForID");
extern fn char* getJoystickPath(Joystick* joystick) @extern("SDL_GetJoystickPath");
extern fn char* getJoystickPathForID(JoystickID instance_id) @extern("SDL_GetJoystickPathForID");
extern fn int getJoystickPlayerIndex(Joystick *joystick) @extern("SDL_GetJoystickPlayerIndex");
extern fn int getJoystickPlayerIndexForID(JoystickID instance_id) @extern("SDL_GetJoystickPlayerIndexForID");
extern fn PowerState getJoystickPowerInfo(Joystick* joystick, int* percent) @extern("SDL_GetJoystickPowerInfo");
extern fn ushort getJoystickProduct(Joystick* joystick) @extern("SDL_GetJoystickProduct");
extern fn ushort getJoystickProductForID(JoystickID instance_id) @extern("SDL_GetJoystickProductForID");
extern fn ushort getJoystickProductVersion(Joystick* joystick) @extern("SDL_GetJoystickProductVersion");
extern fn ushort getJoystickProductVersionForID(JoystickID instance_id) @extern("SDL_GetJoystickProductVersionForID");
extern fn PropertiesID getJoystickProperties(Joystick* joystick) @extern("SDL_GetJoystickProperties");
extern fn JoystickID* getJoysticks(int* count) @extern("SDL_GetJoysticks");
extern fn char* getJoystickSerial(Joystick* joystick) @extern("SDL_GetJoystickSerial");
extern fn JoystickType getJoystickType(Joystick* joystick) @extern("SDL_GetJoystickType");
extern fn JoystickType getJoystickTypeForID(JoystickID instance_id) @extern("SDL_GetJoystickTypeForID");
extern fn ushort getJoystickVendor(Joystick* joystick) @extern("SDL_GetJoystickVendor");
extern fn ushort getJoystickVendorForID(JoystickID instance_id) @extern("SDL_GetJoystickVendorForID");
extern fn int getNumJoystickAxes(Joystick* joystick) @extern("SDL_GetNumJoystickAxes");
extern fn int getNumJoystickBalls(Joystick* joystick) @extern("SDL_GetNumJoystickBalls");
extern fn int getNumJoystickButtons(Joystick* joystick) @extern("SDL_GetNumJoystickButtons");
extern fn int getNumJoystickHats(Joystick* joystick) @extern("SDL_GetNumJoystickHats");
extern fn bool hasJoystick() @extern("SDL_HasJoystick");
extern fn bool isJoystickVirtual(JoystickID instance_id) @extern("SDL_IsJoystickVirtual");
extern fn bool joystickConnected(Joystick* joystick) @extern("SDL_JoystickConnected");
extern fn bool joystickEventsEnabled() @extern("SDL_JoystickEventsEnabled");
extern fn void lockJoysticks() @extern("SDL_LockJoysticks");
extern fn Joystick* openJoystick(JoystickID instance_id) @extern("SDL_OpenJoystick");
extern fn bool rumbleJoystick(Joystick* joystick, ushort low_frequency_rumble, ushort high_frequency_rumble, uint duration_ms) @extern("SDL_RumbleJoystick");
extern fn bool rumbleJoystickTriggers(Joystick* joystick, ushort left_rumble, ushort right_rumble, uint duration_ms) @extern("SDL_RumbleJoystickTriggers");
extern fn bool sendJoystickEffect(Joystick* joystick, void* data, int size) @extern("SDL_SendJoystickEffect");
extern fn bool sendJoystickVirtualSensorData(Joystick* joystick, SensorType type, ulong sensor_timestamp, float* data, int num_values) @extern("SDL_SendJoystickVirtualSensorData");
extern fn void setJoystickEventsEnabled(bool enabled) @extern("SDL_SetJoystickEventsEnabled");
extern fn bool setJoystickLED(Joystick* joystick, char red, char green, char blue) @extern("SDL_SetJoystickLED");
extern fn bool setJoystickPlayerIndex(Joystick* joystick, int player_index);
extern fn bool setJoystickVirtualAxis(Joystick* joystick, int axis, short value) @extern("SDL_SetJoystickVirtualAxis");
extern fn bool setJoystickVirtualBall(Joystick* joystick, int ball, short xrel, short yrel) @extern("SDL_SetJoystickVirtualBall");
extern fn bool setJoystickVirtualButton(Joystick* joystick, int button, bool down) @extern("SDL_SetJoystickVirtualButton");
extern fn bool setJoystickVirtualHat(Joystick* joystick, int hat, char value) @extern("SDL_SetJoystickVirtualHat");
extern fn bool setJoystickVirtualTouchpad(Joystick* joystick, int touchpad, int finger, bool down, float x, float y, float pressure) @extern("SDL_SetJoystickVirtualTouchpad");
extern fn bool tryLockJoysticks() @extern("SDL_TryLockJoysticks");
extern fn void unlockJoysticks() @extern("SDL_UnlockJoysticks");
extern fn void updateJoysticks() @extern("SDL_UpdateJoysticks");

