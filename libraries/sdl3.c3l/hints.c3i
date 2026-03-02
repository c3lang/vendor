
module sdl3;

// Types
alias HintCallback = fn void(void* userdata, char* name, char* oldValue, char* newValue);

// Enums
enum HintPriority {
  DEFAULT,
  NORMAL,
  OVERRIDE
}

// Functions
extern fn bool addHintCallback(char* name, HintCallback callback, void* userdata) @extern("SDL_AddHintCallback");
extern fn char* getHint(char* name) @extern("SDL_GetHint");
extern fn bool getHintBoolean(char* name, bool default_value) @extern("SDL_GetHintBoolean");
extern fn void removeHintCallback(char* name, HintCallback callback, void* userdata) @extern("SDL_RemoveHintCallback");
extern fn bool resetHint(char* name) @extern("SDL_ResetHint");
extern fn void resetHints() @extern("SDL_ResetHints");
extern fn bool setHint(char* name, char* value) @extern("SDL_SetHint");
extern fn bool setHintWithPriority(char* name, char* value, HintPriority priority) @extern("SDL_SetHintWithPriority");

