
module sdl3;

// Structs
struct GuID {
  char[16] data;
}

// Functions
extern fn void guidToString(GuID guid, char* pszGUID, int cbGUID) @extern("SDL_GUIDToString");
extern fn GuID stringToGUID(char* pchGUID) @extern("SDL_StringToGUID");

