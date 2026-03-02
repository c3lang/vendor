
module sdl3;

// Bitstructs
bitstruct MessageBoxButtonFlags : uint {
  bool returnkey;
  bool escapekey;
}
bitstruct MessageBoxFlags : uint {
  bool error:   5;
  bool warning: 6;
  bool info:    7;
  bool buttonsLeftToRight: 8;
  bool buttonsRightToLeft: 9;
}

// Structs
struct MessageBoxButtonData {
  MessageBoxButtonFlags flags;
  int buttonID; /**< User defined button id (value returned via SDL_ShowMessageBox) */
  char* text;   /**< The UTF-8 button text */
}
struct MessageBoxColor {
  char r, g, b;
}
struct MessageBoxColorScheme {
  MessageBoxColor[MessageBoxColorType.COLOR_COUNT.ordinal] colors;
}
struct MessageBoxData {
  MessageBoxFlags flags;
  Window* window;        /**< Parent window, can be NULL */
  char* title;           /**< UTF-8 title */
  char* message;         /**< UTF-8 message text */

  int numbuttons;
  MessageBoxButtonData* buttons;
  MessageBoxColorScheme* colorScheme; /**< SDL_MessageBoxColorScheme, can be NULL to use system settings */
}

// Enums
enum MessageBoxColorType {
  BACKGROUND,
  TEXT,
  BUTTON_BORDER,
  BUTTON_BACKGROUND,
  BUTTON_SELECTED,
  COLOR_COUNT,       /**< Size of the colors array of SDL_MessageBoxColorScheme. */
}

// Functions
extern fn bool showMessageBox(MessageBoxData* messageboxdata, int* buttonid) @extern("SDL_ShowMessageBox");
extern fn bool showSimpleMessageBox(MessageBoxFlags flags, char* title, char* message, Window* window) @extern("SDL_ShowSimpleMessageBox");

