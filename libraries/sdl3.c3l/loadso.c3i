
module sdl3;

// Types
alias SharedObject = void;

// Functions
extern fn FunctionPointer loadFunction(SharedObject* handle, char* name) @extern("SDL_LoadFunction");
extern fn SharedObject* loadObject(char* sofile) @extern("SDL_LoadObject");
extern fn void unloadObject(SharedObject* handle) @extern("SDL_UnloadObject");

