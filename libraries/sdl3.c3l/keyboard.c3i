
module sdl3;

// Types
alias KeyboardID = uint;

// Enums
enum Capitalization {
  NONE,        /**< No auto-capitalization will be done */
  SENTENCES,   /**< The first letter of sentences will be capitalized */
  WORDS,       /**< The first letter of words will be capitalized */
  LETTERS,     /**< All letters will be capitalized */
}
enum SDL_TextInputType {
  TEXT,                        /**< The input is text */
  TEXT_NAME,                   /**< The input is a person's name */
  TEXT_EMAIL,                  /**< The input is an e-mail address */
  TEXT_USERNAME,               /**< The input is a username */
  TEXT_PASSWORD_HIDDEN,        /**< The input is a secure password that is hidden */
  TEXT_PASSWORD_VISIBLE,       /**< The input is a secure password that is visible */
  NUMBER,                      /**< The input is a number */
  NUMBER_PASSWORD_HIDDEN,      /**< The input is a secure PIN that is hidden */
  NUMBER_PASSWORD_VISIBLE,     /**< The input is a secure PIN that is visible */
}

// Functions
extern fn bool clearComposition(Window* window) @extern("SDL_ClearComposition");
extern fn Window* getKeyboardFocus() @extern("SDL_GetKeyboardFocus");
extern fn char* getKeyboardNameForID(KeyboardID instance_id) @extern("SDL_GetKeyboardNameForID");
extern fn KeyboardID* getKeyboards(int* count) @extern("SDL_GetKeyboards");
extern fn bool* getKeyboardState(int* numkeys) @extern("SDL_GetKeyboardState");
extern fn Keycode getKeyFromName(char* name) @extern("SDL_GetKeyFromName");
extern fn Keycode getKeyFromScancode(Scancode scancode, Keymod modstate, bool key_event) @extern("SDL_GetKeyFromScancode");
extern fn char* getKeyName(Keycode key) @extern("SDL_GetKeyName");
extern fn Keymod getModState() @extern("SDL_GetModState");
extern fn Scancode getScancodeFromKey(Keycode key, Keymod* modstate) @extern("SDL_GetScancodeFromKey");
extern fn Scancode getScancodeFromName(char* name) @extern("SDL_GetScancodeFromName");
extern fn char* getScancodeName(Scancode scancode) @extern("SDL_GetScancodeName");
extern fn bool getTextInputArea(Window* window, Rect* rect, int* cursor) @extern("SDL_GetTextInputArea");
extern fn bool hasKeyboard() @extern("SDL_HasKeyboard");
extern fn bool hasScreenKeyboardSupport() @extern("SDL_HasScreenKeyboardSupport");
extern fn void resetKeyboard() @extern("SDL_ResetKeyboard");
extern fn bool screenKeyboardShown(Window* window) @extern("SDL_ScreenKeyboardShown");
extern fn void setModState(Keymod modstate) @extern("SDL_SetModState");
extern fn bool setScancodeName(Scancode scancode, char* name) @extern("SDL_SetScancodeName");
extern fn bool setTextInputArea(Window* window, Rect* rect, int cursor) @extern("SDL_SetTextInputArea");
extern fn bool startTextInput(Window* window) @extern("SDL_StartTextInput");
extern fn bool startTextInputWithProperties(Window* window, PropertiesID props) @extern("SDL_StartTextInputWithProperties");
extern fn bool stopTextInput(Window* window) @extern("SDL_StopTextInput");
extern fn bool textInputActive(Window* window) @extern("SDL_TextInputActive");

