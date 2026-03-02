
module sdl3;

// Types
alias Gamepad = void;

// Structs
struct GamepadBinding {
  GamepadBindingType input_type;
  union input {
    int button;
    struct axis {
      int axis;
      int axis_min;
      int axis_max;
    }
    struct hat {
      int hat;
      int hat_mask;
    }
  }
  GamepadBindingType output_type;
  union output {
    GamepadButton button;
    struct axis {
      GamepadAxis axis;
      int axis_min;
      int axis_max;
    }
  }
}

// Enums
enum GamepadAxis : const CInt {
  INVALID = -1,
  LEFTX   =  0,
  LEFTY   =  1,
  RIGHTX  =  2,
  RIGHTY  =  3,
  LEFT_TRIGGER = 4,
  RIGHT_TRIGGER = 5,
  COUNT   =  6,
}
enum GamepadBindingType {
  NONE,
  BUTTON,
  AXIS,
  HAT,
}
enum GamepadButton : const CInt {
  INVALID = -1,
  SOUTH,           /**< Bottom face button (e.g. Xbox A button) */
  EAST,            /**< Right face button (e.g. Xbox B button) */
  WEST,            /**< Left face button (e.g. Xbox X button) */
  NORTH,           /**< Top face button (e.g. Xbox Y button) */
  BACK,
  GUIDE,
  START,
  LEFT_STICK,
  RIGHT_STICK,
  LEFT_SHOULDER,
  RIGHT_SHOULDER,
  DPAD_UP,
  DPAD_DOWN,
  DPAD_LEFT,
  DPAD_RIGHT,
  MISC1,           /**< Additional button (e.g. Xbox Series X share button, PS5 microphone button, Nintendo Switch Pro capture button, Amazon Luna microphone button, Google Stadia capture button) */
  RIGHT_PADDLE1,   /**< Upper or primary paddle, under your right hand (e.g. Xbox Elite paddle P1, DualSense Edge RB button, Right Joy-Con SR button) */
  LEFT_PADDLE1,    /**< Upper or primary paddle, under your left hand (e.g. Xbox Elite paddle P3, DualSense Edge LB button, Left Joy-Con SL button) */
  RIGHT_PADDLE2,   /**< Lower or secondary paddle, under your right hand (e.g. Xbox Elite paddle P2, DualSense Edge right Fn button, Right Joy-Con SL button) */
  LEFT_PADDLE2,    /**< Lower or secondary paddle, under your left hand (e.g. Xbox Elite paddle P4, DualSense Edge left Fn button, Left Joy-Con SR button) */
  TOUCHPAD,        /**< PS4/PS5 touchpad button */
  MISC2,           /**< Additional button */
  MISC3,           /**< Additional button (e.g. Nintendo GameCube left trigger click) */
  MISC4,           /**< Additional button (e.g. Nintendo GameCube right trigger click) */
  MISC5,           /**< Additional button */
  MISC6,           /**< Additional button */
  COUNT,
}
enum GamepadButtonLabel {
  UNKNOWN,
  A,
  B,
  X,
  Y,
  CROSS,
  CIRCLE,
  SQUARE,
  TRIANGLE,
}
enum GamepadType {
  UNKNOWN,
  STANDARD,
  XBOX360,
  XBOXONE,
  PS3,
  PS4,
  PS5,
  NINTENDO_SWITCH_PRO,
  NINTENDO_SWITCH_JOYCON_LEFT,
  NINTENDO_SWITCH_JOYCON_RIGHT,
  NINTENDO_SWITCH_JOYCON_PAIR,
  GAMECUBE,
  COUNT,
}

// Functions
extern fn int addGamepadMapping(char* mapping) @extern("SDL_AddGamepadMapping");
extern fn int addGamepadMappingsFromFile(char* file) @extern("SDL_AddGamepadMappingsFromFile");
extern fn int addGamepadMappingsFromIO(IOStream* src, bool closeio) @extern("SDL_AddGamepadMappingsFromIO");
extern fn void closeGamepad(Gamepad *gamepad) @extern("SDL_CloseGamepad");
extern fn bool gamepadConnected(Gamepad* gamepad) @extern("SDL_GamepadConnected");
extern fn bool gamepadEventsEnabled() @extern("SDL_GamepadEventsEnabled");
extern fn bool gamepadHasAxis(Gamepad* gamepad, GamepadAxis axis) @extern("SDL_GamepadHasAxis");
extern fn bool gamepadHasButton(Gamepad* gamepad, GamepadButton button) @extern("SDL_GamepadHasButton");
extern fn bool gamepadHasSensor(Gamepad* gamepad, SensorType type) @extern("SDL_GamepadHasSensor");
extern fn bool gamepadSensorEnabled(Gamepad* gamepad, SensorType type) @extern("SDL_GamepadSensorEnabled");
extern fn char* getGamepadAppleSFSymbolsNameForAxis(Gamepad* gamepad, GamepadAxis axis) @extern("SDL_GetGamepadAppleSFSymbolsNameForAxis");
extern fn char* getGamepadAppleSFSymbolsNameForButton(Gamepad* gamepad, GamepadButton button) @extern("SDL_GetGamepadAppleSFSymbolsNameForButton");
extern fn short getGamepadAxis(Gamepad* gamepad, GamepadAxis axis) @extern("SDL_GetGamepadAxis");
extern fn GamepadAxis getGamepadAxisFromString(char* str) @extern("SDL_GetGamepadAxisFromString");
extern fn GamepadBinding** getGamepadBindings(Gamepad* gamepad, int* count) @extern("SDL_GetGamepadBindings");
extern fn bool getGamepadButton(Gamepad* gamepad, GamepadButton button) @extern("SDL_GetGamepadButton");
extern fn GamepadButton getGamepadButtonFromString(char* str) @extern("SDL_GetGamepadButtonFromString");
extern fn GamepadButtonLabel getGamepadButtonLabel(Gamepad* gamepad, GamepadButton button) @extern("SDL_GetGamepadButtonLabel");
extern fn GamepadButtonLabel getGamepadButtonLabelForType(GamepadType type, GamepadButton button) @extern("SDL_GetGamepadButtonLabelForType");
extern fn ushort getGamepadFirmwareVersion(Gamepad* gamepad) @extern("SDL_GetGamepadFirmwareVersion");
extern fn Gamepad* getGamepadFromID(JoystickID instance_id) @extern("SDL_GetGamepadFromID");
extern fn Gamepad* getGamepadFromPlayerIndex(int player_index) @extern("SDL_GetGamepadFromPlayerIndex");
extern fn GuID getGamepadGUIDForID(JoystickID instance_id) @extern("SDL_GetGamepadGUIDForID");
extern fn JoystickID getGamepadID(Gamepad* gamepad) @extern("SDL_GetGamepadID");
extern fn Joystick* getGamepadJoystick(Gamepad* gamepad) @extern("SDL_GetGamepadJoystick");
extern fn char* getGamepadMapping(Gamepad* gamepad) @extern("SDL_GetGamepadMapping");
extern fn char* getGamepadMappingForGUID(GuID guid) @extern("SDL_GetGamepadMappingForGUID");
extern fn char* getGamepadMappingForID(JoystickID instance_id) @extern("SDL_GetGamepadMappingForID");
extern fn char** getGamepadMappings(int* count) @extern("SDL_GetGamepadMappings");
extern fn char* getGamepadName(Gamepad* gamepad) @extern("SDL_GetGamepadName");
extern fn char* getGamepadNameForID(JoystickID instance_id) @extern("SDL_GetGamepadNameForID");
extern fn char* getGamepadPath(Gamepad* gamepad) @extern("SDL_GetGamepadPath");
extern fn char* getGamepadPathForID(JoystickID instance_id) @extern("SDL_GetGamepadPathForID");
extern fn int getGamepadPlayerIndex(Gamepad* gamepad) @extern("SDL_GetGamepadPlayerIndex");
extern fn int getGamepadPlayerIndexForID(JoystickID instance_id) @extern("SDL_GetGamepadPlayerIndexForID");
extern fn PowerState getGamepadPowerInfo(Gamepad* gamepad, int* percent) @extern("SDL_GetGamepadPowerInfo");
extern fn ushort getGamepadProduct(Gamepad* gamepad) @extern("SDL_GetGamepadProduct");
extern fn ushort getGamepadProductForID(JoystickID instance_id) @extern("SDL_GetGamepadProductForID");
extern fn ushort getGamepadProductVersion(Gamepad* gamepad) @extern("SDL_GetGamepadProductVersion");
extern fn ushort getGamepadProductVersionForID(JoystickID instance_id) @extern("SDL_GetGamepadProductVersionForID");
extern fn PropertiesID getGamepadProperties(Gamepad* gamepad) @extern("SDL_GetGamepadProperties");
extern fn JoystickID* getGamepads(int* count) @extern("SDL_GetGamepads");
extern fn bool getGamepadSensorData(Gamepad* gamepad, SensorType type, float* data, int num_values) @extern("SDL_GetGamepadSensorData");
extern fn float getGamepadSensorDataRate(Gamepad* gamepad, SensorType type) @extern("SDL_GetGamepadSensorDataRate");
extern fn char* getGamepadSerial(Gamepad* gamepad) @extern("SDL_GetGamepadSerial");
extern fn ulong getGamepadSteamHandle(Gamepad* gamepad) @extern("SDL_GetGamepadSteamHandle");
extern fn char* getGamepadStringForAxis(GamepadAxis axis) @extern("SDL_GetGamepadStringForAxis");
extern fn char* getGamepadStringForButton(GamepadButton button) @extern("SDL_GetGamepadStringForButton");
extern fn char* getGamepadStringForType(GamepadType type) @extern("SDL_GetGamepadStringForType");
extern fn bool getGamepadTouchpadFinger(Gamepad* gamepad, int touchpad, int finger, bool* down, float* x, float* y, float* pressure) @extern("SDL_GetGamepadTouchpadFinger");
extern fn GamepadType getGamepadType(Gamepad* gamepad) @extern("SDL_GetGamepadType");
extern fn GamepadType getGamepadTypeForID(JoystickID instance_id) @extern("SDL_GetGamepadTypeForID");
extern fn GamepadType getGamepadTypeFromString(char* str) @extern("SDL_GetGamepadTypeFromString");
extern fn ushort getGamepadVendor(Gamepad* gamepad) @extern("SDL_GetGamepadVendor");
extern fn ushort getGamepadVendorForID(JoystickID instance_id) @extern("SDL_GetGamepadVendorForID");
extern fn int getNumGamepadTouchpadFingers(Gamepad* gamepad, int touchpad) @extern("SDL_GetNumGamepadTouchpadFingers");
extern fn int getNumGamepadTouchpads(Gamepad* gamepad) @extern("SDL_GetNumGamepadTouchpads");
extern fn GamepadType getRealGamepadType(Gamepad* gamepad) @extern("SDL_GetRealGamepadType");
extern fn GamepadType getRealGamepadTypeForID(JoystickID instance_id) @extern("SDL_GetRealGamepadTypeForID");
extern fn bool hasGamepad() @extern("SDL_HasGamepad");
extern fn bool isGamepad(JoystickID instance_id) @extern("SDL_IsGamepad");
extern fn Gamepad* openGamepad(JoystickID instance_id) @extern("SDL_OpenGamepad");
extern fn bool reloadGamepadMappings() @extern("SDL_ReloadGamepadMappings");
extern fn bool rumbleGamepad(Gamepad* gamepad, ushort low_frequency_rumble, ushort high_frequency_rumble, uint duration_ms) @extern("SDL_RumbleGamepad");
extern fn bool rumbleGamepadTriggers(Gamepad* gamepad, ushort left_rumble, ushort right_rumble, uint duration_ms) @extern("SDL_RumbleGamepadTriggers");
extern fn bool sendGamepadEffect(Gamepad* gamepad, void* data, int size) @extern("SDL_SendGamepadEffect");
extern fn void setGamepadEventsEnabled(bool enabled) @extern("SDL_SetGamepadEventsEnabled");
extern fn bool setGamepadLED(Gamepad* gamepad, char red, char green, char blue) @extern("SDL_SetGamepadLED");
extern fn bool setGamepadMapping(JoystickID instance_id, char* mapping) @extern("SDL_SetGamepadMapping");
extern fn bool setGamepadPlayerIndex(Gamepad* gamepad, int player_index) @extern("SDL_SetGamepadPlayerIndex");
extern fn bool setGamepadSensorEnabled(Gamepad* gamepad, SensorType type, bool enabled) @extern("SDL_SetGamepadSensorEnabled");
extern fn void updateGamepads() @extern("SDL_UpdateGamepads");

